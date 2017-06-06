Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 81D8671AD1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 23:36:16 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id v18so10936960pgb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jun 2017 16:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9PemIPr4K5wTl71l2CWWEWEdsXOv+WMpAs8qAcaOpdk=;
	b=U9IV3xtGCGfk4Ncx/sByL4AJd1uLs21VNd65yfYWb4oR/oCBDru55mvzxuTXSZzY82
	vp0mKPK/ICM+X2DWg3/zcMBLN4FHjMb6e6GkRgdBgwt+R8j97hfSafLkPu4OBBUGfc5f
	7p/6P6ToifVv+lwZ0y9o9Jcn5kSKtR+t4jMzOtCqBfQ/5tbT2s7Y38HLWHROUr1p6FLt
	BFyyhmPP9rJ33QvsQQbD3hMPYCQY76m6hadScksH3EjKm4+xUQ8mM8ZL3HXXk71vDI0j
	OR3gPWO51qmIgNXkkgspq/1SkzghC2uwLQwEyIPDJb9QFVmHshZAxw2zy9zEDOpAqt/D
	wWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9PemIPr4K5wTl71l2CWWEWEdsXOv+WMpAs8qAcaOpdk=;
	b=r6DcnBRWTQE2Oc0QDN7J6gNAS7cVx77L3OqBt9Eew8sWq58Uuucw4DHD22hGeVuQee
	QR/XsH1HyvFWLUAQ2iy5BgQNQ2QG98Z8cWnca1NcRzVV4VZg2VJbJYw/WDwdGT5E6zi1
	tQ/J65OPCVYT4SaLlYSwTsHA20nD7BJUFZ1QVKcNWNQzEU7iEk7GfguXDqii/N/z1Qpu
	KqV1vxsxEmDP8GDfwuvSetWJdnUGpckVr+0RC5JAn6DPBjlIVJMbY4j+EmYWu+0HWHCv
	+7KicWUJvdsfWAzRpHxTLqnDgJ0UEcpvpXrsVqiXSkuQlXxmuFmcX6UfHDKJLusmudXN
	eyWw==
X-Gm-Message-State: AODbwcBOg5N7I5xN+eei7XIsIoWcZRDV5Rzt88ZNiUqly58V9oksT7lI
	Rf0ttn4c2tD0050r
X-Received: by 10.98.67.138 with SMTP id l10mr28217192pfi.73.1496792177084;
	Tue, 06 Jun 2017 16:36:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::748])
	by smtp.gmail.com with ESMTPSA id j6sm3465676pgc.1.2017.06.06.16.36.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Jun 2017 16:36:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Jun 2017 16:36:08 -0700
Message-Id: <20170606233608.28682-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [PATCH V4] distutils-base.bbclass: Do not use -pie with hardening
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Jun 2017 23:36:21 -0000

Fix build when PIE is turned on. It tries to build
.so file using -pie and -shared flags together because
its doing compile and link in same step CFLAGS and LDFLAGS
are combined and does not work, ending in errors e.g.

| /mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-musleabi/python-pygpgme/0.3-r0/recipe-sysroot/usr/l
ib/Scrt1.o: In function `_start_c':
| /usr/src/debug/musl/1.1.16+gitAUTOINC+179766aa2e-r0/git/crt/crt1.c:17: undefined reference to `main'
| collect2: error: ld returned 1 exit status

This error while cryptic is due to the fact that we are
building a shared library but also pass -pie flag to the link
step after specify LDHSARED ( which is -shared linker flags )

we can not use -pie when doing shared libs. This is true for all the python
modules inheriting setup tools

Disable the pie flags thusly for all modules using setuptools since
this setting is done in setuptools makefiles which are then used
during module compiles

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v1 -> v2
- Move change to distutils-base
V2 -> v3
- Fix a missing end quote
v3 -> v4
- Move the chage to distutils-common-base to cover python3 as well

 meta/classes/distutils-common-base.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/distutils-common-base.bbclass b/meta/classes/distutils-common-base.bbclass
index 824a1b68b1..fa733c672c 100644
--- a/meta/classes/distutils-common-base.bbclass
+++ b/meta/classes/distutils-common-base.bbclass
@@ -11,3 +11,5 @@ FILES_${PN}-dev += "\
   ${libdir}/pkgconfig \
   ${PYTHON_SITEPACKAGES_DIR}/*.la \
 "
+
+SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
-- 
2.13.0



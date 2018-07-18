Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5CCE978998
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 16:00:10 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id v14-v6so5213952wro.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 09:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=K7fCKaQ8oisaKv1DCiOhf0NurHNvgN+a15+LVFSQ67M=;
	b=YPLKhZIgckinvEUx5im/Ba6W1M96N1q825KUKvjrQWWXpN6fdplPj/dn875YPAsDEx
	7J/LwGZqMQV7MWATna57ClK62fuwsxXWphWgXnlVLsFAOR7DBKAyAHS+EizxRS7jRKWJ
	r5Eacdqgwj1Iq9afzn67aw/GICe0kuWFACljKrre/fr6lXVnmv+4V1+QRmz+0J/3YZ1q
	BwB1h/s986VouqxC7noLB4+effFXsM2vXxFrqMy5ADM996MY5P11/LXJfVfaXvdvFhWo
	5GwTL4OmCLEnt/lZXpJUeuG4fxNBe/VLuVmWE2EjsZGgvACTX7qPJ1WLcR7tEa+U6qgV
	zr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=K7fCKaQ8oisaKv1DCiOhf0NurHNvgN+a15+LVFSQ67M=;
	b=kaQ1WqifptVeToqGH80QEC2+8DlERkI3gZ9To+9EItZIiQVvaOPLxHTZ7M/YBy61Lg
	Iew5boBBFrgCLhf5OzQFc/E+BPEPEmD/hR44D35ODCPngcma2QZBg2GtGYmSL4eRfdpa
	H7cuPEMlpb/bRJOWpDFrXlbYzfGoDhy+uNDjkhk6YEnvATsnZJxRZ+fkdmzg7AyHqzjv
	TNEjN0Olq4vGvIDzHdwXhM1b18a9yw/Tp07Rbtdg/6I9/ny0GpD/JqGh9kh9zik+a6bi
	Z9psWvIBV3ayhWNGuPQkUFLMZyLHP9jNM1vrNYc58rivsYAVdYd/6pShhyjnilWKx8tl
	G8UQ==
X-Gm-Message-State: AOUpUlHh4dbACUZ0xVz7cpb0itDGTGl9SgV04g22bHk6nx+fCcXoPqvR
	0AvSNoCmdoju/izktxMVT0xP7usN
X-Google-Smtp-Source: AAOMgpew6lM5/P11SWiioG84Hpbjc74TWcp+Xg51xdI2VywOkKKMlhUyjvDEd5PfMQzMWymcz9hhTA==
X-Received: by 2002:adf:ab14:: with SMTP id
	q20-v6mr4727238wrc.239.1531929610752; 
	Wed, 18 Jul 2018 09:00:10 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	d102-v6sm5220812wma.10.2018.07.18.09.00.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jul 2018 09:00:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2018 17:00:08 +0100
Message-Id: <20180718160008.8457-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] cmake: put cmake.m4 and toolchain file in PN
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
X-List-Received-Date: Wed, 18 Jul 2018 16:00:10 -0000

Previously cmake-dev held some files which should be in cmake.

- cmake.m4 should be in installed in cmake so it can be used out of the box
- nativesdk-specific OEToolchainConfig.cmake file used to be in cmake, but the
  change of default packaging rules move it into cmake-dev.  This recipe is the
  exception and it should be moved back.

Add the extra paths to cmake, and clear FILES for cmake-dev to ensure nothing
else slips in.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/cmake/cmake_3.11.4.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake_3.11.4.bb b/meta/recipes-devtools/cmake/cmake_3.11.4.bb
index eb055b97571..e0457677e86 100644
--- a/meta/recipes-devtools/cmake/cmake_3.11.4.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.11.4.bb
@@ -46,7 +46,8 @@ do_install_append_class-nativesdk() {
 
 FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}"
 
-FILES_${PN} += "${datadir}/cmake-${CMAKE_MAJOR_VERSION}"
+FILES_${PN} += "${datadir}/cmake-${CMAKE_MAJOR_VERSION} ${datadir}/cmake ${datadir}/aclocal"
 FILES_${PN}-doc += "${docdir}/cmake-${CMAKE_MAJOR_VERSION}"
+FILES_${PN}-dev = ""
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.11.0



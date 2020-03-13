Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id A7F2C61B02
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 19:44:38 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id g6so4761071plt.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 12:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=aZ+3sJHwiy9N4JZlsQde7s5HarryXFnyv11SLkZRnB8=;
	b=YSdSH4vKzqBnwz9azayEGO4mrOVkDl1YK+t95aho95KJiFODfKnfs+bA8K+27xZiSp
	XIMaInR3Q5+nMlG2vXN2eCuYDXxn6fQ2/boHgzmXUTBJDxyHVeptasCHS4fXVhBJFdKi
	SFLcxM4hAWv8DbEDTvRxe5UJ4/kuhJkMhOaI/oAMHSSkLRO7mZ1/L4b7DSMzpuspcJWl
	cgDMs2G6Vqy6p9IsLNpPdD5OA0Zjb52XUzDtdaYG/RcSmlWdT0mQBL+9+Ylo2Xi5lOAA
	k45RmCC/V87ZsBL6yekgNCD3Hic4jcWnjyzFQhZVe30j42z0AOaqgpIlVNadprT5jFFl
	4GSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=aZ+3sJHwiy9N4JZlsQde7s5HarryXFnyv11SLkZRnB8=;
	b=Wm7C30bFmkBqpvgVvurE1QsjRvpzDCiWKBqLsBd+Ll+v1dVL6EKE/j1IqqKBGRJD7m
	Yc4LwzH6xpgS1uZz2QqqFVHYbb6hRNyzuomGZKy+46/AEoMBejPCZelLlgKdM6fF4iJp
	xcgAfwJPVuVr3HPZd2MqYdZSu18L2jaKZgMWoycYP42PITGnLGrJvu6zMPnK6miwrckv
	ZhoMyYhy2hpt6R/0QpSSTNSnKfDytK2bYivIQ9CtPuVeLqRj7JJHCRfq0Dmh//0yVOoV
	slJqh4AEHdudTQEEGt/Q7LASayYrDHV3xKxlwABbSPh21NLsAGVtrikHO6QLwUuHwIfD
	8RBQ==
X-Gm-Message-State: ANhLgQ3hvb8un1Es64SbBf5p5BT0CUzSz9uMPE8uASGhfKdYaN0mmiN4
	3T21FZMAKvr6eK+rIAiosCHen7iN6dA=
X-Google-Smtp-Source: ADFU+vslQhLxNDvl+SHFlE9d2R0GZJi/gbCp5cwfPAHB/HQdban/KoCMYMHvXOVm3LM38IOqWUxKzg==
X-Received: by 2002:a17:90a:aa83:: with SMTP id
	l3mr11305986pjq.5.1584128678882; 
	Fri, 13 Mar 2020 12:44:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::af11])
	by smtp.gmail.com with ESMTPSA id y22sm38568pfr.68.2020.03.13.12.44.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Mar 2020 12:44:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Mar 2020 12:44:51 -0700
Message-Id: <20200313194451.1324565-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH V2] musl: removes aliases for glibc provided libraries
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
X-List-Received-Date: Fri, 13 Mar 2020 19:44:38 -0000
Content-Transfer-Encoding: 8bit

From: Jan Kaisrlik <ja.kaisrlik@gmail.com>

Based on the recommendation in musl mailing list[1] All symlinks have
been removed from musl recipe.

Move stub libraries into -dev package
having them treated as normal .a which they are not, is not correct and
packages shoves them into static archives, which are not installed on
target usually unless asked for

this should help in linking with -lm, -lpthread etc. on target

[1]: https://www.openwall.com/lists/musl/2020/03/10/11

Signed-off-by: Jan Kaisrlik <ja.kaisrlik@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix -lm linking problem reported on AB tests

 meta/recipes-core/musl/musl_git.bb | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index afc8446547..2a15a78cd5 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -66,27 +66,20 @@ do_install() {
 	rm -f ${D}${bindir}/ldd ${D}${GLIBC_LDSO}
 	lnr ${D}${libdir}/libc.so ${D}${bindir}/ldd
 	lnr ${D}${libdir}/libc.so ${D}${GLIBC_LDSO}
-	for l in crypt dl m pthread resolv rt util xnet
-	do
-		ln -sf libc.so ${D}${libdir}/lib$l.so
-	done
-	for i in libc.so.6 libcrypt.so.1 libdl.so.2 libm.so.6 libpthread.so.0 libresolv.so.2 librt.so.1 libutil.so.1; do
-		ln -sf libc.so ${D}${libdir}/$i
-	done
 }
 
 PACKAGES =+ "${PN}-glibc-compat"
 
-FILES_${PN}-glibc-compat += "\
-                ${libdir}/libc.so.6 ${libdir}/libcrypt.so.1 \
-                ${libdir}/libdl.so.2 ${libdir}/libm.so.6 \
-                ${libdir}/libpthread.so.0 ${libdir}/libresolv.so.2 \
-                ${libdir}/librt.so.1 ${libdir}/libutil.so.1 \
-                ${GLIBC_LDSO} \
-                "
+FILES_${PN}-glibc-compat += "${GLIBC_LDSO}"
+FILES_${PN}-staticdev = "${libdir}/libc.a"
+FILES_${PN}-dev =+ "${libdir}/libcrypt.a ${libdir}/libdl.a ${libdir}/libm.a \
+                    ${libdir}/libpthread.a ${libdir}/libresolv.a \
+                    ${libdir}/librt.a ${libdir}/libutil.a ${libdir}/libxnet.a \
+                   "
 
 RDEPENDS_${PN}-dev += "linux-libc-headers-dev bsd-headers-dev libssp-nonshared-staticdev"
 RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
 RPROVIDES_${PN} += "ldd libsegfault rtld(GNU_HASH)"
 
 LEAD_SONAME = "libc.so"
+INSANE_SKIP_${PN}-dev = "staticdev"
-- 
2.25.1



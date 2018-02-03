Return-Path: <ricardo@opensourcefoundries.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 537F665C8F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Feb 2018 03:56:39 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id w128so4136076qkb.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Feb 2018 19:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=opensourcefoundries-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=vdruNh3zls4/pZWhqOdH2IaHEiTyQ3Q5tUTfkDV78Ec=;
	b=d6FR6/rf8p0kL60i4Zyb7wUVvTiQnmPco5bbpcCrLZ8NRSyTcuqtZIRInnK5SdXgqS
	KgPl8vrRUh7Q5yvaFkaHBHA0J0T+TYoSpn2+LPimiGQJHQxJYW+fT37odgB3MOe/HUfs
	Esm1ZNydpMpVZL7MtcRnDNLaEm8A3jBsFZE+cFMsj+mrqPh8xopdvAudzxK80XeQeYzY
	7cRtYW8nHSTWEjFJOmzzRlyqwSxBZukXPCl00g5hp+oZ1PjBtriGigijv0eaDAjqbvS0
	YuDR2Jq/xMCJ50LV2ImxKkAggjOEsaskuHAXRmjpW52q5I5y/NpeBkUj/ma5QkTcSuSK
	TSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vdruNh3zls4/pZWhqOdH2IaHEiTyQ3Q5tUTfkDV78Ec=;
	b=kdS32FuSIXANWBc06WjYm/Z2NTQmu+XcigHbS6b9QTVgqoqUW+HzIdWynVfIYBXErF
	mRPV2tuYHGLRKlOq2RG5hZomL6IsWS6i/3+3H0OaSYLhWFa+QZrbxJ+LPuoGHMoN6lR0
	OQrlHOxuMMLzFNkYg/lUXdr/4MD3krBY2N23Z3XGDoayn/C/gYBrSktyhMOJz0/aYMSa
	8gq8B4rhcUob4lRzYPF4ucEXSEOS3tkEYdS+5GiEN4GmmEPHUVfM6RhKJ7CbmRbQqBUs
	R48iOCvGoiqPiWYvF0jze1FcSOdAj7/dPP9N0o4TuDoVs50cfJaGCoXmEsKcW1Vsfk30
	eHgg==
X-Gm-Message-State: APf1xPAzyC8Y4EyfVFvC2gHOERYzm2yOkSIszSeuGtdcwTOxhysb869e
	WGmp6qA0T1y9+OyjYh6kpsNe/BMHQg==
X-Google-Smtp-Source: AH8x225N9g2IHln9Ah/vIBbIwgj0yFDuSgkziz/0MMpDbvy7/UIa3gIYVYIz7ZOFUtJA/8tcpcgzzw==
X-Received: by 10.55.215.65 with SMTP id m62mr2115595qki.1.1517630200645;
	Fri, 02 Feb 2018 19:56:40 -0800 (PST)
Received: from localhost.localdomain ([189.4.104.170])
	by smtp.gmail.com with ESMTPSA id
	p72sm2490435qki.74.2018.02.02.19.56.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 02 Feb 2018 19:56:39 -0800 (PST)
From: Ricardo Salveti <ricardo@opensourcefoundries.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Feb 2018 01:30:33 -0200
Message-Id: <1517628633-3281-1-git-send-email-ricardo@opensourcefoundries.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] libacpi: update libacpi_fix_for_x32.patch to use libdir
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
X-List-Received-Date: Sat, 03 Feb 2018 03:56:40 -0000

Prefix plus base_libdir generates an invalid path when building with
usrmerge, so change libacpi_fix_for_x32.patch to use libdir instead as
it provides the right path in both cases.

Signed-off-by: Ricardo Salveti <ricardo@opensourcefoundries.com>
---
 .../libacpi/files/libacpi_fix_for_x32.patch        | 30 ++++++++--------------
 meta/recipes-bsp/libacpi/libacpi_0.2.bb            |  2 +-
 2 files changed, 11 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch b/meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch
index 86a16c2..06f20e5 100644
--- a/meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch
+++ b/meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch
@@ -3,9 +3,10 @@ Upstream-Status: Pending
 Fix libacpi for x32
     
     libacpi doesn't use base_libdir for install.  This patch adds
-    base_libdir support so that x32 libraries are installed properly.
+    libdir support so that x32 libraries are installed properly.
 
 Patch Received from:  H.J. Lu <hjl.tools@gmail.com>
+Updated by: Ricardo Salveti <ricardo@opensourcefoundries.com> 2018/02/03
 
 Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/05
 
@@ -13,18 +14,7 @@ Index: libacpi-0.2/Makefile
 ===================================================================
 --- libacpi-0.2.orig/Makefile
 +++ libacpi-0.2/Makefile
-@@ -8,6 +8,10 @@ SRC_test = test-libacpi.c libacpi.c list
- OBJ = ${SRC:.c=.o}
- OBJ_test = ${SRC_test:.c=.o}
- 
-+ifndef base_libdir
-+base_libdir=/lib
-+endif
-+
- all: options libacpi.a libacpi.so test-libacpi
- 
- options:
-@@ -42,13 +46,13 @@ install: all
+@@ -42,13 +42,13 @@ install: all
  	@mkdir -p ${DESTDIR}${PREFIX}/include
  	@cp -f libacpi.h ${DESTDIR}${PREFIX}/include
  	@chmod 644 ${DESTDIR}${PREFIX}/include/libacpi.h
@@ -35,13 +25,13 @@ Index: libacpi-0.2/Makefile
 -	@cp -f ${SONAME} ${DESTDIR}${PREFIX}/lib/
 -	@chmod 644 ${DESTDIR}${PREFIX}/lib/${SONAME}
 -	@ln -s ${SONAME} ${DESTDIR}${PREFIX}/lib/libacpi.so
-+	@echo installing library to ${DESTDIR}${PREFIX}${base_libdir}
-+	@mkdir -p ${DESTDIR}${PREFIX}${base_libdir}
-+	@cp -f libacpi.a ${DESTDIR}${PREFIX}${base_libdir}
-+	@chmod 644 ${DESTDIR}${PREFIX}${base_libdir}/libacpi.a
-+	@cp -f ${SONAME} ${DESTDIR}${PREFIX}${base_libdir}/
-+	@chmod 644 ${DESTDIR}${PREFIX}${base_libdir}/${SONAME}
-+	@ln -s ${SONAME} ${DESTDIR}${PREFIX}${base_libdir}/libacpi.so
++	@echo installing library to ${DESTDIR}${LIBDIR}
++	@mkdir -p ${DESTDIR}${LIBDIR}
++	@cp -f libacpi.a ${DESTDIR}${LIBDIR}
++	@chmod 644 ${DESTDIR}${LIBDIR}/libacpi.a
++	@cp -f ${SONAME} ${DESTDIR}${LIBDIR}/
++	@chmod 644 ${DESTDIR}${LIBDIR}/${SONAME}
++	@ln -s ${SONAME} ${DESTDIR}${LIBDIR}/libacpi.so
  	@echo installing test-libacpi to ${DESTDIR}${PREFIX}/bin
  	@mkdir -p ${DESTDIR}${PREFIX}/bin
  	@cp -f test-libacpi ${DESTDIR}${PREFIX}/bin
diff --git a/meta/recipes-bsp/libacpi/libacpi_0.2.bb b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
index 6dc66ea..5e7f7fa 100644
--- a/meta/recipes-bsp/libacpi/libacpi_0.2.bb
+++ b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
@@ -28,5 +28,5 @@ EXTRA_OEMAKE = '-e MAKEFLAGS= STRIP="echo"'
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_install() {
-	oe_runmake install DESTDIR=${D} PREFIX=${exec_prefix}
+	oe_runmake install DESTDIR=${D} PREFIX=${exec_prefix} LIBDIR=${libdir}
 }
-- 
2.7.4



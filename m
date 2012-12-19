Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1TlCDV-0002VJ-Ug
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 06:29:22 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so710919dak.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2012 21:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=x-received:sender:from:to:subject:date:message-id:x-mailer;
	bh=8dZZ2y9q2RTEwDz/SKDf2Lv41a8PeSB8nv+JWhCuOVk=;
	b=Pa/KPVf316ErE8EGhAczqVD/f/KHCU7BqTRJLXUdeUPc8ceN179JvFDAtXNo1KgRf0
	CvoDD0nT02+a6twCSASxqhZTN0xkPJhHBIuPdF9EAVdyLN/YPm8Rt5XJjDpPP+r8s31u
	wQrNOQ15cCyFxNVXhi2nCVgLklBNT4Bvi+v3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=8dZZ2y9q2RTEwDz/SKDf2Lv41a8PeSB8nv+JWhCuOVk=;
	b=iwUkSc/dL2jF1GidvIf4N2BHFPgKDLKgUykvcoIEG48bYg8qKr841gqUPiIN/NA0Mj
	9c2KrXmaUIsYswGFk7r0mAOEK4SRGhr2PFz4UB3QqX7LXt51FIGNGMbd1VSo7hy9LSj0
	u7ynZhy6htfy/a4SaaJhU6tTu7E/1JehoX4Kq0/liBqkdOR1NM+6GXU2HtpJhMmXTLaT
	R4usU1aoZi5YecrfLbYrae8OHp1XqH23FGc+bfYU7xl8eTeIsrVxAg1VtqQrmiuYywM6
	svMssU1zAd59RcplCDYyMjJhkLOahIFctKDjE5LWJEXFe0XOca7LiPXZAqSSKphtL/dz
	TWlg==
X-Received: by 10.68.237.167 with SMTP id vd7mr14424048pbc.161.1355894074401; 
	Tue, 18 Dec 2012 21:14:34 -0800 (PST)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id kc4sm2424942pbc.23.2012.12.18.21.14.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 21:14:33 -0800 (PST)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2012 21:14:05 -0800
Message-Id: <1355894045-17380-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQm1VdfHJ7WEul/yirz9dGGRoPFZCuJCQSc0/JGRB1A5wPwbdKxNEvsyHLXAkQ5R1GE7rOf7
Subject: [PATCH 1/2] icu: reduce what's needed for cross tools
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Dec 2012 05:29:22 -0000

The ICU Update copied to complete source tree over, it only
needed a couple of binaries and libraries, so only copy those.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/icu/icu.inc |   16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
index f7257d1..1329635 100644
--- a/meta/recipes-support/icu/icu.inc
+++ b/meta/recipes-support/icu/icu.inc
@@ -7,7 +7,7 @@ DEPENDS = "icu-native"
 DEPENDS_class-native = ""
 
 S = "${WORKDIR}/icu/source"
-STAGING_ICU_SOURCE_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/icu"
+STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
 
 PARALLEL_MAKE = ""
 FULL_OPTIMIZATION_arm = "-Os"
@@ -17,7 +17,7 @@ inherit autotools pkgconfig binconfig
 # ICU needs the native build directory as an argument to its --with-cross-build option when
 # cross-compiling. Taken the situation that different builds may share a common sstate-cache
 # into consideration, the native build directory needs to be staged.
-EXTRA_OECONF = "--with-cross-build=${STAGING_DATADIR_NATIVE}/icu/source"
+EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
 EXTRA_OECONF_class-native = ""
 
 # ICU puts custom m4 autoconf functions in aclocal.m4.
@@ -29,11 +29,13 @@ do_configure_prepend() {
     [ -f acinclude.m4 ] || cp aclocal.m4 acinclude.m4
 }
 
-do_install_append() {
-    if [ ${PN} == 'icu-native' ]; then
-	mkdir -p ${D}/${STAGING_ICU_SOURCE_DIR_NATIVE}
-	cp -r ${S} ${D}/${STAGING_ICU_SOURCE_DIR_NATIVE}
-    fi
+do_install_append_class-native() {
+	mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
+	cp -r ${S}/config/icucross.mk ${D}/${STAGING_ICU_DIR_NATIVE}/config
+	cp -r ${S}/lib ${D}/${STAGING_ICU_DIR_NATIVE}
+	cp -r ${S}/bin ${D}/${STAGING_ICU_DIR_NATIVE}
+	cp -r ${S}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
+
 }
 
 PACKAGES =+ "libicudata libicuuc libicui18n libicule libiculx libicutu libicuio"
-- 
1.7.9.5




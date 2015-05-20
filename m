Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 35CFB607BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 19:06:16 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so165694706wic.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 12:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=sZw4MyOiSqtaa7KS+bBszZTepbVAWhay+p5Aci7pAjs=;
	b=UkwhG/Rvm6vPhiJjsbMCHuwr/n4b09jgyRbplfAYHNmo57lfZlbruaW1r8PW6oSFkE
	WlRG9J2YomcnnLeGVgmBwS8J0AonYvKMXp5nUD9zt1i8rz1yclrrKtoaqh8azPSJVxz3
	ZA2DANvBdPITihmY5bwlGAhwqp+4C6JWZsA1XNwUKZH4mKKh78tskR0wQGlMoRmwf25o
	dmLtyXBRmgouPQRW9GPSD1Xl3EhHiDVjZrUPfI4PZ+decr+cITRv9fRDjp3+njlslxob
	FWsxmCZuuDZiFzXl2mQTmaBJHg2sCGvtjU4ipWmDKlnfwNQpTtBLr9uh6SOjsDhpX0wl
	qEJw==
X-Gm-Message-State: ALoCoQlRBqrZIqTsQn40qOP4uyiMBzR55vDjhHBvitu3kBJ9YEogGkce+2gbTr66Gvw+TUYOPXpO
X-Received: by 10.180.7.133 with SMTP id j5mr44993412wia.84.1432148777616;
	Wed, 20 May 2015 12:06:17 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	ew10sm4876430wic.22.2015.05.20.12.06.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 May 2015 12:06:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 May 2015 20:01:59 +0100
Message-Id: <1432148519-27431-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] zlib: clean up base_libdir symlink
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
X-List-Received-Date: Wed, 20 May 2015 19:06:17 -0000

libz.so symbolic link created in ${libdir} is
../../${base_libdir}/libz.so.1.2.8.  This doesn't work if base_libdir or libdir
is changed, so use oe.path.relative to construct the correct path at build time.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/zlib/zlib_1.2.8.bb | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/zlib/zlib_1.2.8.bb b/meta/recipes-core/zlib/zlib_1.2.8.bb
index ca0ba3f..9470adb 100644
--- a/meta/recipes-core/zlib/zlib_1.2.8.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.8.bb
@@ -6,7 +6,6 @@ SECTION = "libs"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://zlib.h;beginline=4;endline=23;md5=fde612df1e5933c428b73844a0c494fd"
 
-
 SRC_URI = "http://www.zlib.net/${BPN}-${PV}.tar.xz \
            file://remove.ldconfig.call.patch \
            file://Makefile-runtests.patch \
@@ -45,16 +44,15 @@ do_install_ptest() {
 	install ${B}/minigzipsh ${D}${PTEST_PATH}
 }
 
-# We move zlib shared libraries for target builds to avoid
-# qa warnings.
-#
+# Move zlib shared libraries for target builds to $base_libdir so the library
+# can be used in early boot before $prefix is mounted.
 do_install_append_class-target() {
 	if [ ${base_libdir} != ${libdir} ]
 	then
 		mkdir -p ${D}/${base_libdir}
 		mv ${D}/${libdir}/libz.so.* ${D}/${base_libdir}
-		tmp=`readlink ${D}/${libdir}/libz.so`
-		ln -sf ../../${base_libdir}/$tmp ${D}/${libdir}/libz.so
+		libname=`readlink ${D}/${libdir}/libz.so`
+		ln -sf ${@oe.path.relative("${libdir}", "${base_libdir}")}/$libname ${D}${libdir}/libz.so
 	fi
 }
 
-- 
2.1.4



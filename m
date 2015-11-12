Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8125A77283
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:40:19 +0000 (UTC)
Received: by pasz6 with SMTP id z6so82446634pas.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=99GYnkO1HpY64DMukDTLGuO6ouv3CB3hAZE28JOUN3g=;
	b=SyAlJoTVBvKwmpUH+oJe1rgBcpIxLIONE29bkjtgS5S+IAYUBHrIRLijl4GWDyN7SQ
	ICA4hzls161AcfIqYam5xv1EwJ/EuSut7BasH881BLOnWDcG78tcbk8CF/jO1oVVw5vN
	SGXEpSc4G2S/24mcoAhsi1UmOh2zfdIVaQ2zik/Xj2az//wwE5o1ccC33rSWQyYE+jFY
	fGXl/FbJDAC1qlQ9glTc+isqQILt8FT1OHBSRAaEXZ2qCmCaqI74YJ97uXOzns0HW6yP
	aonarszdSxobULpuEcJOdqXr5bGJCRmuRh85K5lvDhRNRIvP4m93sW/ZfU6ujuz5FOdO
	FcRQ==
X-Received: by 10.68.57.137 with SMTP id i9mr27478605pbq.66.1447371620465;
	Thu, 12 Nov 2015 15:40:20 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	cs5sm16739866pbc.15.2015.11.12.15.40.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 15:40:17 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:39:22 -0700
Message-Id: <05f060cedf44633b7dbc4b191c35e21178da55bb.1447371033.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <fb3e5cc3095925f349046ed1da766ea2765e0949.1447371033.git.chris_larson@mentor.com>
References: <fb3e5cc3095925f349046ed1da766ea2765e0949.1447371033.git.chris_larson@mentor.com>
In-Reply-To: <cover.1447371033.git.chris_larson@mentor.com>
References: <cover.1447371033.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 11/11] openjade-native: statically link local libs
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
X-List-Received-Date: Thu, 12 Nov 2015 23:40:22 -0000

From: Christopher Larson <chris_larson@mentor.com>

Statically link local libs to avoid gold link issue. This is clearly
a workaround, but does get us past the failures with systems using gold by
default until we find a better solution.

[YOCTO #2972]

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../openjade/openjade-native_1.3.2.bb              | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
index fa7aa62..355ed6a 100644
--- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
+++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
@@ -24,6 +24,10 @@ SRC_URI[sha256sum] = "1d2d7996cc94f9b87d0c51cf0e028070ac177c4123ecbfd7ac1cb8d0b7
 
 inherit autotools-brokensep native
 
+# Statically link local libs to avoid gold link issue [YOCTO #2972]
+PACKAGECONFIG ?= "static-only-libs"
+PACKAGECONFIG[static-only-libs] = "--enable-static --disable-shared,--enable-static --enable-shared,,"
+
 EXTRA_OECONF = "--enable-spincludedir=${STAGING_INCDIR}/OpenSP \
                 --enable-splibdir=${STAGING_LIBDIR}"
 
@@ -57,14 +61,20 @@ do_compile_prepend () {
 do_install() {
 	# Refer to http://www.linuxfromscratch.org/blfs/view/stable/pst/openjade.html
 	# for details.
-	install -d ${D}${bindir}	
-	install -m 0755 ${S}/jade/.libs/openjade ${D}${bindir}/openjade
+	install -d ${D}${bindir} ${D}${libdir}
+	if ${@bb.utils.contains('PACKAGECONFIG', 'static-only-libs', 'true', 'false', d)}; then
+		install -m 0755 jade/openjade ${D}${bindir}/openjade
+		oe_libinstall -a -C style libostyle ${D}${libdir}
+		oe_libinstall -a -C spgrove libospgrove ${D}${libdir}
+		oe_libinstall -a -C grove libogrove ${D}${libdir}
+	else
+		install -m 0755 jade/.libs/openjade ${D}${bindir}/openjade
+		oe_libinstall -a -so -C style libostyle ${D}${libdir}
+		oe_libinstall -a -so -C spgrove libospgrove ${D}${libdir}
+		oe_libinstall -a -so -C grove libogrove ${D}${libdir}
+	fi
 	ln -sf openjade ${D}${bindir}/jade
 
-	oe_libinstall -a -so -C style libostyle ${D}${libdir}
-	oe_libinstall -a -so -C spgrove libospgrove ${D}${libdir}
-	oe_libinstall -a -so -C grove libogrove ${D}${libdir}
-
 	install -d ${D}${datadir}/sgml/openjade-${PV}
 	install -m 644 dsssl/catalog ${D}${datadir}/sgml/openjade-${PV}
 	install -m 644 dsssl/*.dtd ${D}${datadir}/sgml/openjade-${PV}
-- 
2.2.1



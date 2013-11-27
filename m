Return-Path: <nickdademo@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 451616BC20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 10:20:42 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id p10so9515103pdj.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 02:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=KdiE6NcuwljjakGhS0ztG3BWrdshPWfB39nGfEe4Mmk=;
	b=uxifJ2wyVaMFlZdzi+PIJnr+Z7wL5gVixrAb+XSwzzXzHs9GfU0inp2cs+xQbSLpXR
	ZmQXkDEjT+oFlXOKzrxa8wcQPb+8l5FxRbBtgoQr9J0dEpDsRzHoXEDiW8WxaYDP11LA
	izK7yYCFJX5hhBh3ylwDM0L2etGNdiLazPwXEWBScuu8owHny2OwqzQCm7m8V+kgJX23
	3WDXvEWUiHE5wXL+kYkoBfTkyWmsav2DVLeQf3kEDCag42sGVmH9fsF3T5R3u0Mrr1du
	dg3kV4WQ3862ujWu3PdiURV+iHzDc20Vs4z4j2mJ2i3iKChvrqbZe6lhfU5cHu8iQzBc
	Tk3Q==
X-Received: by 10.68.102.133 with SMTP id fo5mr4240794pbb.175.1385547641695;
	Wed, 27 Nov 2013 02:20:41 -0800 (PST)
Received: from localhost.localdomain
	(d110-32-96-161.meb801.vic.optusnet.com.au. [110.32.96.161])
	by mx.google.com with ESMTPSA id
	ha10sm86873361pbd.17.2013.11.27.02.20.39 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Nov 2013 02:20:40 -0800 (PST)
From: Nick D'Ademo <nickdademo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2013 21:20:01 +1100
Message-Id: <1385547601-6240-1-git-send-email-nickdademo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] tcl: fix version string and make recipe multilib build compatible
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
X-List-Received-Date: Wed, 27 Nov 2013 10:20:43 -0000

Explicitly set libdir in EXTRA_OECONF so that the correct library folder is generated in a multilib build.

The version string (VER) has been changed to 8.6.1 and the library paths have been updated accordingly so that the related tk recipe can correctly detect tcl (this search is done using the tclConfig.sh script which contains the tcl version number).

Signed-off-by: Nick D'Ademo <nickdademo@gmail.com>
---
 meta/recipes-devtools/tcltk/tcl_8.6.1.bb |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.1.bb b/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
index f40475d..10186c4 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
@@ -28,13 +28,13 @@ SRC_URI_class-native = "${BASE_SRC_URI}"
 
 S = "${WORKDIR}/tcl${PV}/unix"
 
-VER = "8.6"
+VER = "8.6.1"
 
 inherit autotools
 
 DEPENDS_class-native = ""
 
-EXTRA_OECONF = "--enable-threads --disable-rpath"
+EXTRA_OECONF = "--enable-threads --disable-rpath --libdir=${libdir}"
 
 do_configure() {
 	( cd ${S}; gnu-configize )
@@ -67,8 +67,8 @@ tcl_sysroot_preprocess () {
 }
 
 PACKAGES =+ "tcl-lib"
-FILES_tcl-lib = "${libdir}/libtcl${VER}.so.*"
-FILES_${PN} += "${libdir}/tcl${VER} ${libdir}/tcl8"
+FILES_tcl-lib = "${libdir}/libtcl8.6.so.*"
+FILES_${PN} += "${libdir}/tcl${VER} ${libdir}/tcl8.6 ${libdir}/tcl8"
 FILES_${PN}-dev += "${libdir}/tclConfig.sh ${libdir}/tclooConfig.sh"
 
 # isn't getting picked up by shlibs code
-- 
1.7.9.5



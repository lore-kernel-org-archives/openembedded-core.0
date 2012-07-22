Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1St69h-0005oU-Vy
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 02:05:46 +0200
Received: by pbbrq2 with SMTP id rq2so8714839pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 16:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=sn+iI0tiXP+xHU2OctoiniFb7+hK1ZXKsSP0GtDhuuQ=;
	b=BFJIpYV2UAYTAXv4Bkdjz7nR+yPAyPbFrDAH14hU9Kyogux6s/AsJGXUkKhyGkGcJ4
	juLzYHq1eSDXkFYCwcsaP2dW0AempHmEntPHjE9iGxlCOVip4wt07Anw6LzCI/L8pRKR
	peGdwUvwsdM3nOkOWCEClB94zc10BxTPou5hb/3tg8DXfgWzmPEBr/qyKGipoYdvOwlI
	NX1W3vjFIxkEE2DSsMyX8yFd1U+i2Ow07M3k76ecQas3Wc7Cw0YcPCLxaFXPSEsaUeMJ
	HCRV+BKUJsP+a9c70zjgeBIxYkaSVnq0abGYhAciIL4xG4qexdGoF1vzfMeIhg4ZgBgu
	1HFg==
Received: by 10.68.241.35 with SMTP id wf3mr24355362pbc.102.1343001259113;
	Sun, 22 Jul 2012 16:54:19 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id og4sm8706078pbb.48.2012.07.22.16.54.17
	(version=SSLv3 cipher=OTHER); Sun, 22 Jul 2012 16:54:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 22 Jul 2012 16:54:17 -0700
Message-Id: <1343001258-19551-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1343001258-19551-1-git-send-email-raj.khem@gmail.com>
References: <1343001258-19551-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/3] cups_1.4.6.bb: Fix build on ppc64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jul 2012 00:05:46 -0000

ppc64 uses lib64 and usr/lib64 for library paths
so we need to train cups build system

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../cups/cups-1.4.6/cups_serverbin.patch           |   32 ++++++++++++++++++++
 meta/recipes-extended/cups/cups14.inc              |   26 ++++++++--------
 meta/recipes-extended/cups/cups_1.4.6.bb           |    7 ++--
 3 files changed, 49 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-extended/cups/cups-1.4.6/cups_serverbin.patch

diff --git a/meta/recipes-extended/cups/cups-1.4.6/cups_serverbin.patch b/meta/recipes-extended/cups/cups-1.4.6/cups_serverbin.patch
new file mode 100644
index 0000000..f7b44a7
--- /dev/null
+++ b/meta/recipes-extended/cups/cups-1.4.6/cups_serverbin.patch
@@ -0,0 +1,32 @@
+Make CUPS_SERVERBIN relative to libdir otherwise on 64bit arches
+e.g. ppc64 where base libdir is lib64 this does not go well
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Inappropriate [OE config specific]
+
+Index: cups-1.4.6/config-scripts/cups-directories.m4
+===================================================================
+--- cups-1.4.6.orig/config-scripts/cups-directories.m4	2009-04-12 16:04:51.000000000 -0700
++++ cups-1.4.6/config-scripts/cups-directories.m4	2012-07-21 12:12:05.896405923 -0700
+@@ -397,7 +397,7 @@
+ 	*)
+ 		# All others
+ 		INSTALL_SYSV="install-sysv"
+-		CUPS_SERVERBIN="$exec_prefix/lib/cups"
++		CUPS_SERVERBIN="$libdir/cups"
+ 		;;
+ esac
+ 
+Index: cups-1.4.6/configure
+===================================================================
+--- cups-1.4.6.orig/configure	2012-07-21 12:13:34.512405950 -0700
++++ cups-1.4.6/configure	2012-07-21 12:14:05.724406017 -0700
+@@ -11181,7 +11181,7 @@
+ 	*)
+ 		# All others
+ 		INSTALL_SYSV="install-sysv"
+-		CUPS_SERVERBIN="$exec_prefix/lib/cups"
++		CUPS_SERVERBIN="$libdir/cups"
+ 		;;
+ esac
+ 
diff --git a/meta/recipes-extended/cups/cups14.inc b/meta/recipes-extended/cups/cups14.inc
index 4f2b0a1..0517007 100644
--- a/meta/recipes-extended/cups/cups14.inc
+++ b/meta/recipes-extended/cups/cups14.inc
@@ -27,7 +27,7 @@ EXTRA_OECONF = " \
 do_configure() {
 	gnu-configize
 	libtoolize --force
-	DSOFLAGS="${LDFLAGS}" oe_runconf
+	DSOFLAGS="${LDFLAGS}" SERVERBIN="${libdir}/cups" oe_runconf
 }
 
 do_compile () {
@@ -66,24 +66,24 @@ python do_package_append() {
 
 PACKAGES =+ "${PN}-lib ${PN}-libimage"
 
-FILES_${PN} += "${exec_prefix}/lib/cups/backend \
-		${exec_prefix}/lib/cups/cgi-bin \
-		${exec_prefix}/lib/cups/filter \
-		${exec_prefix}/lib/cups/monitor \
-		${exec_prefix}/lib/cups/notifier \
-		${exec_prefix}/lib/cups/daemon \
+FILES_${PN} += "${libdir}/cups/backend \
+		${libdir}/cups/cgi-bin \
+		${libdir}/cups/filter \
+		${libdir}/cups/monitor \
+		${libdir}/cups/notifier \
+		${libdir}/cups/daemon \
 	       "
 
 FILES_${PN}-lib = "${libdir}/libcups.so.*"
 
 FILES_${PN}-libimage = "${libdir}/libcupsimage.so.*"
 
-FILES_${PN}-dbg += "${exec_prefix}/lib/cups/backend/.debug \
-                    ${exec_prefix}/lib/cups/cgi-bin/.debug \
-                    ${exec_prefix}/lib/cups/filter/.debug \
-                    ${exec_prefix}/lib/cups/monitor/.debug \
-                    ${exec_prefix}/lib/cups/notifier/.debug \
-                    ${exec_prefix}/lib/cups/daemon/.debug \
+FILES_${PN}-dbg += "${libdir}/cups/backend/.debug \
+                    ${libdir}/cups/cgi-bin/.debug \
+                    ${libdir}/cups/filter/.debug \
+                    ${libdir}/cups/monitor/.debug \
+                    ${libdir}/cups/notifier/.debug \
+                    ${libdir}/cups/daemon/.debug \
                    "
 
 #package the html for the webgui inside the main packages (~1MB uncompressed)
diff --git a/meta/recipes-extended/cups/cups_1.4.6.bb b/meta/recipes-extended/cups/cups_1.4.6.bb
index 9825138..8485180 100644
--- a/meta/recipes-extended/cups/cups_1.4.6.bb
+++ b/meta/recipes-extended/cups/cups_1.4.6.bb
@@ -1,13 +1,14 @@
 require cups14.inc
 
-PR = "r4"
+PR = "r5"
 DEPENDS += "libusb \
        ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=956e7600195e6139f12de8c2a5bbefa9"
 SRC_URI += " \
-	file://use_echo_only_in_init.patch \
-    file://0001-don-t-try-to-run-generated-binaries.patch \
+            file://use_echo_only_in_init.patch \
+            file://0001-don-t-try-to-run-generated-binaries.patch \
+            file://cups_serverbin.patch \
 	"
 
 SRC_URI[md5sum] = "de8fb5a29c36554925c0c6a6e2c0dae1"
-- 
1.7.5.4




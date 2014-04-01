Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id D7CE8617B8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 16:18:46 +0000 (UTC)
Received: by mail-yh0-f50.google.com with SMTP id c41so9231389yho.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 09:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=+sbH8qudNDEi3antjpXBV6zkyBNPWmIaDsMBnFTRo84=;
	b=mV79DjEL3ypFs3cV2qGCpBQCid8olPByJiW1Mxn3qqs3YNK7x6hGg8Dn5ZohbsfQbn
	n7bEoDakodun30MPPhgGyzJzrgbURgC4VgvsbvAeIbmK0MVl+VO0N0te8ts5gGFQuYvh
	gpA7vMgN6dIHpBoBhSD99YXO+cJKbSGcJzmtzKwbJmwhb9rjmOIGp92weZcpOnk9xd2l
	BgvomHQWCqFK0yUF7jZmaKH2HWmcHZ/ch76Z0Gxv0jDw8r1sPjTxhH/Qkl1js7ibni8b
	bPZt1PA3+uMgSgXHG6AiwgUqyeeDo+FuH+xPKX7izGkGAUKyRR866Q0k5ZlAoPx5hGas
	xXWQ==
X-Received: by 10.236.151.83 with SMTP id a59mr45962137yhk.48.1396369127346;
	Tue, 01 Apr 2014 09:18:47 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id s6sm21044050yho.45.2014.04.01.09.18.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 09:18:46 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 0796519F7E5E9; Tue,  1 Apr 2014 13:18:43 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  1 Apr 2014 13:18:42 -0300
Message-Id: <1396369122-26878-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.9.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] alsa-tools: Fix build without x11
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
X-List-Received-Date: Tue, 01 Apr 2014 16:18:49 -0000

There is no way to disable the x11 without mangling the source code so
instead using a patch we now used a 'sed' in do_configure so it is
easier to maintain and extend. The patch had some new tools missing
which were triggering build failures in O.S. Systems' builder as:

,----[ Build error in a clean tmp, without x11 ]
| checking for GTK3... no
| configure: error: Package requirements (gtk+-3.0) were not met:
|
| No package 'gtk+-3.0' found
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|
| Alternatively, you may set the environment variables GTK3_CFLAGS
| and GTK3_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| make: *** [all] Error 1
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../alsa/alsa-tools/makefile_no_gtk.patch           | 21 ---------------------
 meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb   | 18 ++++++++++++++----
 2 files changed, 14 insertions(+), 25 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch b/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch
deleted file mode 100644
index c6cb5b1..0000000
--- a/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Remove some sub-components which need gtk+.
-
-Signed-off-by: Rogerio Nunes <ronunes@gmail.com>
-
-Upstream-Status: Inappropriate [configuration]
-
-diff --git a/Makefile b/Makefile
---- a/Makefile
-+++ b/Makefile
-@@ -1,8 +1,8 @@
- VERSION = 1.0.27
- TOP = .
--SUBDIRS = as10k1 envy24control \
--	  mixartloader pcxhrloader rmedigicontrol sb16_csp seq sscape_ctl \
--	  us428control usx2yloader vxloader echomixer \
-+SUBDIRS = as10k1 \
-+	  mixartloader pcxhrloader sb16_csp seq sscape_ctl \
-+	  us428control usx2yloader vxloader \
- 	  hwmixvolume hdajackretask hda-verb
- 
- all:
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
index 492f8a4..23f9360 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
@@ -3,15 +3,14 @@ HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "https://bugtrack.alsa-project.org/alsa-bug/login_page.php"
 SECTION = "console/utils"
 LICENSE = "GPLv2 & LGPLv2+"
-DEPENDS = "alsa-lib ncurses ${@base_contains('DISTRO_FEATURES', 'x11', 'gtk+3', '', d)}"
+DEPENDS = "alsa-lib ncurses"
 
 LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://ld10k1/COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/alsa-tools-${PV}.tar.bz2 \
            file://mips_has_no_io_h.patch \
-           file://autotools.patch \
-           ${@base_contains('DISTRO_FEATURES', 'x11', '', 'file://makefile_no_gtk.patch', d)}"
+           file://autotools.patch"
 
 SRC_URI[md5sum] = "1ea381d00a6069a98613aa7effa4cb51"
 SRC_URI[sha256sum] = "6562611b5a6560712f109e09740a9d4fa47296b07ed9590cb44139c5f154ada2"
@@ -21,11 +20,22 @@ inherit autotools-brokensep
 EXTRA_OEMAKE += "GITCOMPILE_ARGS='--host=${HOST_SYS} --build=${BUILD_SYS} --target=${TARGET_SYS} --with-libtool-sysroot=${STAGING_DIR_HOST} --prefix=${prefix}'"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
-PACKAGECONFIG[gtk+] = ",,gtk+,"
+PACKAGECONFIG[gtk+] = ",,gtk+ gtk+3,"
 
 # configure.ac/.in doesn't exist so force copy
 AUTOTOOLS_COPYACLOCAL = "1"
 
+do_configure_prepend () {
+    # Disable tools which require gtk+-2.0 and gtk+-3.0
+    if [ "${@base_contains('DISTRO_FEATURES', 'x11', 'yes', 'no', d)}" = "no" ]; then
+        sed -e 's/echomixer//g' \
+            -e 's/envy24control//g' \
+            -e 's/hdajackretask//g' \
+            -e 's/rmedigicontrol//g' \
+            -i ${S}/Makefile
+    fi
+}
+
 do_compile_prepend () {
     #Automake dir is not correctly detected in cross compilation case
     export AUTOMAKE_DIR="$(automake --print-libdir)"
-- 
1.9.1



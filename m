Received: from mail-ve0-f177.google.com ([209.85.128.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ronunes@gmail.com>) id 1UNBvo-0007Kc-P1
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 02:52:06 +0200
Received: by mail-ve0-f177.google.com with SMTP id jw11so1244128veb.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2013 17:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=byFzwuTLYP4ldeA/y6bIn/2/aNepeoZcEDs7dUUD11s=;
	b=p5YpwPzS3lAoe+bmBKSJ/J0CZfdUA4uutSnIPzx8WvVNWxYUrAlbuxFHQDNVkquFuG
	LuYyEWNrW5CjYEN1b5wgOvJOoFkHkEz72ydXv7EpdiyC/V/TJ0lztxz7F7Hf1maiF/Kk
	BHQyBOWctn8+urgbJHLP6Ge0VPSgTQ6UrMzhhahBRcIFXPQhWOqBIKTJN225vuX8eFsS
	C6/b40RoK6z2PwvAOWXSdQUCIl7HfoY2PAQ+zFA325XRSNVKBW0S8w+3xnhI58cuwy07
	mSa8/DvAwMTA/qQCfENGR4h9dM4h/UBNI9iZTYZeXRP5lgxKXCiR3Yu2ZcoXCUxitMtH
	tvqQ==
X-Received: by 10.52.98.36 with SMTP id ef4mr3257839vdb.95.1364949293929;
	Tue, 02 Apr 2013 17:34:53 -0700 (PDT)
Received: from B35650-11.home (pool-173-76-33-241.bstnma.fios.verizon.net.
	[173.76.33.241])
	by mx.google.com with ESMTPS id zd13sm4489818vdb.1.2013.04.02.17.34.52
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 02 Apr 2013 17:34:53 -0700 (PDT)
From: Rogerio Nunes <ronunes@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Apr 2013 20:34:43 -0400
Message-Id: <1364949284-32569-1-git-send-email-ronunes@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/2] alsa-tools: fix build when x11 and gtk+ not available
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
X-List-Received-Date: Wed, 03 Apr 2013 00:52:15 -0000

Current verion of gtk+ (2.15.24) does not accept pure framebuffer as
backend and some alsa-tools sub-modules depend on gtk+.

This patch removes those sub-modules from the build only when x11 is not
set in DISTRO_FEATURES.

Signed-off-by: Rogerio Nunes <ronunes@gmail.com>
---
 .../alsa/alsa-tools/makefile_no_gtk.patch          |   21 ++++++++++++++++++++
 .../recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb |    8 ++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch b/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch
new file mode 100644
index 0000000..51f934d
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch
@@ -0,0 +1,21 @@
+Remove some sub-components which need gtk+.
+
+Signed-off-by: Rogerio Nunes <ronunes@gmail.com>
+
+Upstream-Status: Inappropriate [configuration]
+
+diff --git a/Makefile b/Makefile
+--- a/Makefile
++++ b/Makefile
+@@ -1,8 +1,8 @@
+ VERSION = 1.0.26.1
+ TOP = .
+-SUBDIRS = ac3dec as10k1 envy24control \
+-	  mixartloader pcxhrloader rmedigicontrol sb16_csp seq sscape_ctl \
+-	  us428control usx2yloader vxloader echomixer \
++SUBDIRS = ac3dec as10k1 \
++	  mixartloader pcxhrloader sb16_csp seq sscape_ctl \
++	  us428control usx2yloader vxloader \
+ 	  hwmixvolume hda-verb
+ 
+ all:
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
index 2b46aaf..81ad55a 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
@@ -5,14 +5,15 @@ SECTION = "console/utils"
 LICENSE = "GPLv2 & LGPLv2+"
 DEPENDS = "alsa-lib ncurses"
 
-PR = "r0"
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://ld10k1/COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/alsa-tools-${PV}.tar.bz2 \
            file://mips_has_no_io_h.patch \
-           file://autotools.patch"
+           file://autotools.patch \
+           ${@base_contains('DISTRO_FEATURES', 'x11', '', 'file://makefile_no_gtk.patch', d)}"
 
 SRC_URI[md5sum] = "805526ea5d6c40e1f2c94cee86141230"
 SRC_URI[sha256sum] = "553338693707fe6ddfc430b9edc4cd2677390e200c9e38de82ede3394e733841"
@@ -21,6 +22,9 @@ inherit autotools
 
 EXTRA_OEMAKE += "GITCOMPILE_ARGS='--host=${HOST_SYS} --build=${BUILD_SYS} --target=${TARGET_SYS} --with-libtool-sysroot=${STAGING_DIR_HOST} --prefix=${prefix}' ACLOCAL_FLAGS='-I ${STAGING_DATADIR}/aclocal'"
 
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
+PACKAGECONFIG[gtk+] = ",,gtk+,"
+
 do_compile_prepend () {
     #Automake dir is not correctly detected in cross compilation case
     export AUTOMAKE_DIR=${STAGING_DATADIR_NATIVE}/$(ls ${STAGING_DATADIR_NATIVE} | grep automake)
-- 
1.7.9.5




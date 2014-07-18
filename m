Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1B5D27018D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 16:47:12 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id f73so2380692yha.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 09:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=fBQ7kbuf9ke2HxM9GtdG0ss4o+x1QeTDK/1L35oGBeg=;
	b=BXUS0ym/bnM+Z8CLngAprxXrrTkxIDFCTaYbYgTISfrBdyh026m69AO/STN1jSl4Rz
	k6DFtMCloeeAPqlaOWylsO5l4M7oRz9xWup5UtfqxX5qMXzPjGcVW+6NxPcjVmYnesnI
	dmywCmU+0lzr/0++VQn74m/0FpbP8mykAc+M7VWJuhY4LCka2h3ej4n7tP1I54mk/k3X
	La2z+cLLsL531s6Cj05PZUDm804jl07eip8XEVtD+MoTGBzRerBv0GrpkPknFW6f/ofa
	s+oxDvb5b6KQKz6pVhFFedY6cfXomWYzGvUMGiZoIxEqS1tI2J39MsoP8/8q+YZuFcWY
	tMZQ==
X-Received: by 10.236.222.106 with SMTP id s100mr8990024yhp.38.1405702033693; 
	Fri, 18 Jul 2014 09:47:13 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id
	n68sm11908195yhe.23.2014.07.18.09.47.12 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 18 Jul 2014 09:47:12 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jul 2014 13:47:06 -0300
Message-Id: <1405702026-30443-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] alsa-tools: Disable use of GTK+ when not using X11
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
X-List-Received-Date: Fri, 18 Jul 2014 16:47:19 -0000

The GTK+3 does not provide support for DirectFB backend so we cannot
enable GTK+ features of alsa-tools in this case; GTK+2 does not provide
support for Wayland.

This patch changes GTK+ support to be enabled only when X11 support is
enabled.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
index 62d71ea..bca7170 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae1
 SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/alsa-tools-${PV}.tar.bz2 \
            file://mips_has_no_io_h.patch \
            file://autotools.patch \
-           ${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland directfb', '', \
-                                    'file://makefile_no_gtk.patch', d)}"
+           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', \
+                                'file://makefile_no_gtk.patch', d)}"
 
 SRC_URI[md5sum] = "1ea381d00a6069a98613aa7effa4cb51"
 SRC_URI[sha256sum] = "6562611b5a6560712f109e09740a9d4fa47296b07ed9590cb44139c5f154ada2"
@@ -21,7 +21,7 @@ inherit autotools-brokensep pkgconfig
 
 EXTRA_OEMAKE += "GITCOMPILE_ARGS='--host=${HOST_SYS} --build=${BUILD_SYS} --target=${TARGET_SYS} --with-libtool-sysroot=${STAGING_DIR_HOST} --prefix=${prefix}'"
 
-PACKAGECONFIG ??= "${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland directfb', 'gtk+', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
 PACKAGECONFIG[gtk+] = ",,gtk+ gtk+3,"
 
 # configure.ac/.in doesn't exist so force copy
-- 
1.7.10.4



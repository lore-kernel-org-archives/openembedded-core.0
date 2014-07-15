Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id ACA7D701AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 21:34:03 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id hy10so27271vcb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 14:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=fF3wNOw9r3ZwDUFTorpbgTct/KzpyEi4PYULLRdfWtU=;
	b=SQgYcItoG3KVuAcfJ/GnGxxX3xmCO3tsoewq/CO2zwknijjRzwQR0PAcbJ/0cLXh+5
	lg6dDrJ9TFs0TvidkHSyLDgRAokhGxyKcPsWbJvRB118/nva6v6DeMxjVfI2qO6CvcMo
	2Ga5bSEWA6KHqpcw2Gsj3WbBeVY6YlrQXmHZhZBbqxq6tHlPEfHuMQS1yKfBLFBQGU5r
	VR0VulXqLyxJCvp2vedWK8KbabdzmA82dwc85iw9pqfit3/W9BWd41wj/btWlKIg6yUs
	kxkPY9YtZY5+i4hH/Uue/jefXBbKIYl9Q7sa3fUbaodAKgdXCmMegGAx5dfopyZHN22n
	9OnA==
X-Received: by 10.53.7.204 with SMTP id de12mr3337727vdd.41.1405460044152;
	Tue, 15 Jul 2014 14:34:04 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id j6sm27263800vdf.12.2014.07.15.14.34.02
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 15 Jul 2014 14:34:03 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 18:33:42 -0300
Message-Id: <1405460022-20428-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] alsa-tools: Disable use of GTK+ when using DirectFB
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
X-List-Received-Date: Tue, 15 Jul 2014 21:34:12 -0000

The GTK+3 does not provide support for DirectFB backend so we cannot
enable GTK+ features of alsa-tools in this case.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
index 62d71ea..d3f0a79 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae1
 SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/alsa-tools-${PV}.tar.bz2 \
            file://mips_has_no_io_h.patch \
            file://autotools.patch \
-           ${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland directfb', '', \
+           ${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland', '', \
                                     'file://makefile_no_gtk.patch', d)}"
 
 SRC_URI[md5sum] = "1ea381d00a6069a98613aa7effa4cb51"
@@ -21,7 +21,7 @@ inherit autotools-brokensep pkgconfig
 
 EXTRA_OEMAKE += "GITCOMPILE_ARGS='--host=${HOST_SYS} --build=${BUILD_SYS} --target=${TARGET_SYS} --with-libtool-sysroot=${STAGING_DIR_HOST} --prefix=${prefix}'"
 
-PACKAGECONFIG ??= "${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland directfb', 'gtk+', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland', 'gtk+', '', d)}"
 PACKAGECONFIG[gtk+] = ",,gtk+ gtk+3,"
 
 # configure.ac/.in doesn't exist so force copy
-- 
1.7.10.4



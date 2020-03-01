Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2CEB16116E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Mar 2020 13:14:16 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id 88so5575551qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Mar 2020 05:14:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=9fnE6D4iCLuGi9lkKSlB0oalJWiSqlpjh0KlHwW42V8=;
	b=iS6eWv4ZyZx7tjeAxfXkcHUVucIph3US8MY7lqjwDhyJJH0Qez0gMQ1+eshDb4DHrR
	NbnVZ7JSnim7rxo41PVx9CDRXLe5L7p5dd9fvVqVVW1kv0vpQmi1Xe5KlEijGRbJLjz4
	xENing5NMTAfIo3HBOXbk3bHlRc1xv7Jw20x3UUVii7IGwXksjk+5qhj0WLFkSKjFS0Y
	+kmv752KUbIhVjGNNG2DQ1YINDV2Ypu8Pg3B9uARMFls2lgp/sTyb0nlbECyNWOOR++6
	KVgO4bTUc1MpzkbEHep3tCbWU499w+cTaLxUuHii7mC7GaLFJXqUqUABJ+A1Cpux/kER
	7pmA==
X-Gm-Message-State: APjAAAU/ooVC/ZdCykRcbgw66xRRIbvqlkuIYqZ8HLLFjpqu6JP/n+Gd
	rJWxb35gTDia4xBxtytrTr6sxhWVT6k=
X-Google-Smtp-Source: APXvYqwDQAO5K4afnPlw2Kil6QtwQDXoXv39qmKNT+UdB6n95J62anVE1mQhYvebQYzX/nK/1GsOqw==
X-Received: by 2002:ac8:2a55:: with SMTP id l21mr11991304qtl.111.1583068457474;
	Sun, 01 Mar 2020 05:14:17 -0800 (PST)
Received: from localhost ([177.194.196.4])
	by smtp.gmail.com with ESMTPSA id e46sm254343qtc.48.2020.03.01.05.14.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Mar 2020 05:14:16 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sun,  1 Mar 2020 10:13:53 -0300
Message-Id: <20200301131353.3470253-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [RFC PATCH] easysplash: Add recipes for 1.0.0 release
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
X-List-Received-Date: Sun, 01 Mar 2020 13:14:17 -0000
Content-Transfer-Encoding: 8bit

A simple program for animated splash screens using Software Rendering or
OpenGL ES. It consists of the main splash screen program (easysplash)
and a small control program (easysplashctl).

EasySplash takes as input zip archives containing a description and
PNG-encoded image frames.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
We decided to open source this so more people can rely on this for their
Embedded Linux devices use. The APACHE-2.0 or MIT license can be used,
as preferred as all source is dual licensed.

On this commit, we are adding the two animations we have been using for
demos, so it can be used as testing. I believe it'd be good if a
specific one was developed for OpenEmbedded / Yocto Project used, thus
the use of a RFC patch.

 meta/classes/easysplash-animation.bbclass     | 20 ++++++
 .../easysplash-bootanimation-default_1.0.bb   | 12 ++++
 ...asysplash-bootanimation-ossystems_1.0.1.bb | 11 +++
 .../easysplash/easysplash/easysplash.default  |  2 +
 .../recipes-core/easysplash/easysplash_git.bb | 71 +++++++++++++++++++
 5 files changed, 116 insertions(+)
 create mode 100644 meta/classes/easysplash-animation.bbclass
 create mode 100644 meta/recipes-core/easysplash/easysplash-bootanimation-default_1.0.bb
 create mode 100644 meta/recipes-core/easysplash/easysplash-bootanimation-ossystems_1.0.1.bb
 create mode 100644 meta/recipes-core/easysplash/easysplash/easysplash.default
 create mode 100644 meta/recipes-core/easysplash/easysplash_git.bb

diff --git a/meta/classes/easysplash-animation.bbclass b/meta/classes/easysplash-animation.bbclass
new file mode 100644
index 0000000000..76b84f179a
--- /dev/null
+++ b/meta/classes/easysplash-animation.bbclass
@@ -0,0 +1,20 @@
+# -*- python -*-
+# easysplash-animation.bbclass allows for easy packaging of EasySplash
+# animation packages.
+#
+# Copyright (C) 2015, O.S. Systems Softwares Ltda.  All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+inherit update-alternatives allarch
+
+ALTERNATIVE_${PN} += "bootanimation"
+ALTERNATIVE_TARGET[bootanimation] = "/lib/easysplash/${PN}.zip"
+ALTERNATIVE_LINK_NAME[bootanimation] = "/lib/easysplash/bootanimation.zip"
+ALTERNATIVE_PRIORITY[bootanimation] = "50"
+
+do_install_append() {
+    install -Dm 0644 ${S}/*.zip ${D}/lib/easysplash/${PN}.zip
+}
+
+FILES_${PN} += "/lib/easysplash/${PN}.zip"
+RDEPENDS_${PN} += "easysplash"
diff --git a/meta/recipes-core/easysplash/easysplash-bootanimation-default_1.0.bb b/meta/recipes-core/easysplash/easysplash-bootanimation-default_1.0.bb
new file mode 100644
index 0000000000..c94d2d18d4
--- /dev/null
+++ b/meta/recipes-core/easysplash/easysplash-bootanimation-default_1.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = "O.S. Systems default boot animation for easysplash"
+LICENSE = "CLOSED"
+
+SRC_URI = "http://download.ossystems.com.br/tarballs/${BPN}-${PV}.zip;unpack=0"
+SRC_URI[md5sum] = "882345727cdea329f4d43484c3b3835f"
+SRC_URI[sha256sum] = "5f77a53887d1fe2774aa319853ed5288950089a74507717ffb9071dc5e0e2d7e"
+
+S = "${WORKDIR}"
+
+inherit easysplash-animation
+
+ALTERNATIVE_PRIORITY[bootanimation] = "10"
diff --git a/meta/recipes-core/easysplash/easysplash-bootanimation-ossystems_1.0.1.bb b/meta/recipes-core/easysplash/easysplash-bootanimation-ossystems_1.0.1.bb
new file mode 100644
index 0000000000..7091df2ca5
--- /dev/null
+++ b/meta/recipes-core/easysplash/easysplash-bootanimation-ossystems_1.0.1.bb
@@ -0,0 +1,11 @@
+SUMMARY = "O.S. Systems animation used for image demos"
+LICENSE = "CLOSED"
+
+SRC_URI = "http://download.ossystems.com.br/tarballs/${PN}-${PV}.zip;unpack=0"
+
+SRC_URI[md5sum] = "e721376508827f79382463a8dcde1cb8"
+SRC_URI[sha256sum] = "472f0e5cf1dc865a450d1b87d3e93dcbb7ae5e16021d5864a01a6d28ff24b0ca"
+
+S = "${WORKDIR}"
+
+inherit easysplash-animation
diff --git a/meta/recipes-core/easysplash/easysplash/easysplash.default b/meta/recipes-core/easysplash/easysplash/easysplash.default
new file mode 100644
index 0000000000..6fad9200e3
--- /dev/null
+++ b/meta/recipes-core/easysplash/easysplash/easysplash.default
@@ -0,0 +1,2 @@
+# EASYSPLASH_GBM_DRM_DEVICE: Path to a DRI device node. Example: /dev/dri/card0.
+# EASYSPLASH_GBM_DRM_CONNECTOR: The DRM connector to use. Example HDMI input, LVDS pins, etc.
diff --git a/meta/recipes-core/easysplash/easysplash_git.bb b/meta/recipes-core/easysplash/easysplash_git.bb
new file mode 100644
index 0000000000..196fd297a0
--- /dev/null
+++ b/meta/recipes-core/easysplash/easysplash_git.bb
@@ -0,0 +1,71 @@
+# Copyright (C) 2015, 2016 O.S. Systems Software Ltda.  All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+SUMMARY = "Userspace framebuffer boot animation based on usplash"
+DESCRIPTION = "EasySplash is a simple program for animated splash screens using OpenGL ES \
+for rendering. It takes as input zip archives containing a description and PNG-encoded \
+image frames."
+LIC_FILES_CHKSUM = " \
+    file://LICENSE-APACHE-2.0;md5=b377b220f43d747efdec40d69fcaa69d \
+    file://LICENSE-MIT;md5=b377b220f43d747efdec40d69fcaa69d \
+"
+LICENSE = "Apache-2.0 | MIT"
+SECTION = "base"
+
+DEPENDS = "zlib libpng"
+
+SRCREV = "d4a78a04ac2c8f1504db7ace1bce337e009e0fe7"
+SRC_URI = " \
+    git://github.com/OSSystems/easysplash.git \
+    file://${BPN}.default \
+"
+
+PV = "1.0.0+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig update-rc.d systemd
+
+# We want the binaries to be in /sbin
+EXTRA_OECMAKE += "-DCMAKE_INSTALL_PREFIX:PATH=/ \
+                  -DCTL_FIFO_PATH=/dev/easysplashctl \
+                  -DEASYSPLASH_PID_FILE=/dev/easysplash.pid"
+
+INITSCRIPT_NAME = "easysplash-start"
+INITSCRIPT_PARAMS_${PN} = "start 5 S ."
+
+SYSTEMD_SERVICE_${PN} = "easysplash-start.service easysplash-quit.service"
+
+PACKAGECONFIG_DISTRO ?= "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit', '', d)} \
+                         ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+
+PACKAGECONFIG ?= "${PACKAGECONFIG_DISTRO} swrender"
+#PACKAGECONFIG_mx6q ?= "${PACKAGECONFIG_DISTRO} vivante-g2d"
+#PACKAGECONFIG_mx6dl ?= "${PACKAGECONFIG_DISTRO} vivante-g2d"
+#PACKAGECONFIG_rpi ?= "${PACKAGECONFIG_DISTRO} rpi-dispmanx"
+#PACKAGECONFIG_use-mainline-bsp ?= "${PACKAGECONFIG_DISTRO} mesa-gbm"
+
+PACKAGECONFIG[swrender] = "-DDISPLAY_TYPE_SWRENDER=TRUE,-DDISPLAY_TYPE_SWRENDER=FALSE,pixman"
+PACKAGECONFIG[vivante-g2d] = "-DDISPLAY_TYPE_G2D=TRUE,-DDISPLAY_TYPE_G2D=FALSE,virtual/libg2d"
+# NOTE: not adding -DDISPLAY_TYPE_GLES=FALSE when the packageconfig isn't used
+# because both mesa-gbm and vivante-gles2 enable GLES, and DDISPLAY_TYPE_GLES=FALSE
+# is anyway the default
+PACKAGECONFIG[vivante-gles2] = "-DDISPLAY_TYPE_GLES=TRUE -DEGL_PLATFORM_VIV_FB=TRUE,,virtual/libgles2"
+# libgbm is part of the mesa recipe
+PACKAGECONFIG[mesa-gbm] = "-DDISPLAY_TYPE_GLES=TRUE -DEGL_PLATFORM_GBM=TRUE,,virtual/libgles2 mesa libdrm udev"
+PACKAGECONFIG[rpi-dispmanx] = "-DDISPLAY_TYPE_GLES=TRUE -DEGL_PLATFORM_RPI_DISPMANX=TRUE,,virtual/libgles2 userland"
+PACKAGECONFIG[sysvinit] = "-DENABLE_SYSVINIT_SUPPORT=TRUE, -DENABLE_SYSVINIT_SUPPORT=FALSE"
+PACKAGECONFIG[systemd] = "-DENABLE_SYSTEMD_SUPPORT=TRUE, -DENABLE_SYSTEMD_SUPPORT=FALSE, systemd"
+
+do_install_append() {
+    install -Dm 0644 ${WORKDIR}/${PN}.default ${D}${sysconfdir}/default/${PN}
+}
+
+RRECOMMENDS_${PN} = "easysplash-bootanimation-default"
+
+# NXP SoC arch
+PACKAGE_ARCH_imx = "${MACHINE_SOCARCH}"
+PACKAGE_ARCH_use-mainline-bsp = "${MACHINE_SOCARCH}"
+
+# Raspberry Pi
+PACKAGE_ARCH_rpi = "${MACHINE_ARCH}"
-- 
2.25.1



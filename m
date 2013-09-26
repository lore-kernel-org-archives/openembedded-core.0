Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8F4E36CAE4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 16:43:10 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id t60so1471552wes.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 09:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=BKo9grPEvtKE8Ncc/a0jU0RvlxTiaKxqHl0ps1tvG0k=;
	b=PbcSNlvgPULW80hsdT+6dS/HorU45vi3V0sWMYR3aJXBAzOg6oBy290t91WfGcPF3T
	+THO4r3+L2/1EncnWRImJ/53YWMdoT3FMrM2oN0PDpDtfrp+jKJw69EHxL6WVgJZB1iN
	o8McakKgbc0XExYjJe7D/VyvbqSn/jTuZmt0i2St42UbomgqJ84ymU3fnI2laNG2Cao8
	PJTVDmADpG6il164alnZSz2ySYiGquxiBmjA1VCx7oUNwoO8pFCJ0KkK14ZaoZGn/Je1
	xH9mCdhP5zua1/uKEgE2cvzcAY2GbDWa+yZiMbKMVZXQyIOTWdwVEzeORVe6NXCKhaGl
	Nq1w==
X-Gm-Message-State: ALoCoQmhUuGUgbhKXn+/ZOjBICeZUzuWUWLZHl5GoQdArxiZnl7A0wyQoy3JenlXCDlYnXN8TXNx
X-Received: by 10.180.182.15 with SMTP id ea15mr28130580wic.16.1380213791161; 
	Thu, 26 Sep 2013 09:43:11 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id mb7sm5150593wic.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 26 Sep 2013 09:43:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2013 17:43:05 +0100
Message-Id: <1380213785-29476-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] eglinfo: drop machine-specific configuration from oe-core
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
X-List-Received-Date: Thu, 26 Sep 2013 16:43:12 -0000

eglinfo.inc has some board-specific EGLINFO_DEVICE settings but is missing the
dependencies.  Maintaining them for all supported devices in oe-core isn't
scalable and this is trivially supported though a bbappend in each BSP layer.

This was also causing problems compiling eglinfo on meta-yocto-bsp's beagleboard
machine as the EGLINFO_DEVICE setting for beagleboard was telling it to use the
closed GPU drivers, which are not supported in meta-yocto-bsp.

[ YOCTO #5224 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb |    5 -----
 meta/recipes-graphics/eglinfo/eglinfo.inc       |   11 +++--------
 2 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb b/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb
index 65b265f..455d31e 100644
--- a/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb
+++ b/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb
@@ -1,11 +1,6 @@
 EGLINFO_PLATFORM ?= "fb"
 EGLINFO_BINARY_NAME ?= "eglinfo-fb"
 
-# .bbappend files in BSP meta layers can add EGLINFO_DEVICE
-# values if necessary. eglinfo.inc contains default values for
-# the currently supported devices.
-# Consult the eglinfo README.md for details
-
 include eglinfo.inc
 
 SUMMARY += "(Framebuffer version)"
diff --git a/meta/recipes-graphics/eglinfo/eglinfo.inc b/meta/recipes-graphics/eglinfo/eglinfo.inc
index d53d0ff..785e7f1 100644
--- a/meta/recipes-graphics/eglinfo/eglinfo.inc
+++ b/meta/recipes-graphics/eglinfo/eglinfo.inc
@@ -13,15 +13,10 @@ S = "${WORKDIR}/git"
 
 inherit waf
 
-# BSP layers should add .bbappend files for the -x11 and -fb .bb recipes,
-# which append the respective EGL/OpenGLES/OpenVG libraries to DEPENDS
-# not doing that here, since some platforms might not have OpenGL ES or OpenVG support
-# (in that case, the eglinfo build scripts automatically disable the relevant code paths)
-
+# BSP layers should add .bbappend files for the -x11 and -fb .bb recipes, which
+# append the respective EGL/OpenGLES/OpenVG libraries to DEPENDS and set
+# EGL_DEVICE as appropriate.
 EGLINFO_DEVICE ?= "generic"
-EGLINFO_DEVICE_raspberrypi ?= "raspberrypi"
-EGLINFO_DEVICE_beagleboard ?= "beagleboard"
-EGLINFO_DEVICE_mx6 ?= "imx6"
 
 EXTRA_OECONF = "--platform=${EGLINFO_PLATFORM} \
                 --device=${EGLINFO_DEVICE} \
-- 
1.7.10.4



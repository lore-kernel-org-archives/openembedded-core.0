Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web11.2868.1610506630181400222
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 18:57:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: +SQfeRBvCSOB4n8J3tO//JlDAE0bWRAqQrKY32OyZsVYPbFTXJ+aMOppN2A+Ptn8JF0nsvbplK
 BB2BnIpFcSBg==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="165818756"
X-IronPort-AV: E=Sophos;i="5.79,343,1602572400"; 
   d="scan'208";a="165818756"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2021 18:57:09 -0800
IronPort-SDR: kYZIpQWJ0DX6k13MoNEFPmSPftQ8iDofRv6gf5XH2rlxXN9HcwbzqOR0XoBMcLTAwe+yvrlmRc
 xwyfa7XFSdpg==
X-IronPort-AV: E=Sophos;i="5.79,343,1602572400"; 
   d="scan'208";a="499123722"
Received: from saininav-desk1.png.intel.com ([172.30.199.23])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2021 18:57:08 -0800
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gstreamer1.0-plugins-bad: fix msdk pkgconfig build failure
Date: Wed, 13 Jan 2021 11:07:22 +0800
Message-Id: <20210113030722.9267-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.1

Error log:
| Run-time dependency libmfx found: YES 1.34
| Has header "mfx/mfxdefs.h" : YES
|
| ../gst-plugins-bad-1.18.2/sys/msdk/meson.build:75:2: ERROR: Include dir /usr/include/mfx does not exist.
|
| A full log can be found at /home/s

When msdk is enable in PACKAGECONFIG, plugin fails to locate includedir, so
adding a patch which prepend PKG_CONFIG_SYSROOT_DIR to the dir path

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 .../0005-msdk-fix-includedir-path.patch       | 31 +++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.18.2.bb        |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msdk-fix-includedir-path.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msdk-fix-includedir-path.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msdk-fix-includedir-path.patch
new file mode 100644
index 0000000000..cb3bb7d361
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msdk-fix-includedir-path.patch
@@ -0,0 +1,31 @@
+From 1f00d5026118ebd48e4ccf83d32d67155c4e7f60 Mon Sep 17 00:00:00 2001
+From: Naveen Saini <naveen.kumar.saini@intel.com>
+Date: Wed, 30 Dec 2020 16:37:47 +0800
+Subject: [PATCH] msdk: fix includedir path
+
+In cross compilation, need to prepend PKG_CONFIG_SYSROOT_DIR to the dir path.
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+---
+ sys/msdk/meson.build | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/sys/msdk/meson.build b/sys/msdk/meson.build
+index 6346c9451..068f38548 100644
+--- a/sys/msdk/meson.build
++++ b/sys/msdk/meson.build
+@@ -40,7 +40,9 @@ endif
+ 
+ mfx_dep = dependency('libmfx', required: false)
+ if mfx_dep.found()
++  pkgconf_sysroot = run_command(python3, '-c', 'import os; print(os.environ.get("PKG_CONFIG_SYSROOT_DIR"))').stdout().strip()
+   mfx_incdir = mfx_dep.get_pkgconfig_variable('includedir')
++  mfx_incdir = pkgconf_sysroot +  mfx_incdir
+   mfx_inc = []
+ else
+   # Old versions of MediaSDK don't provide a pkg-config file
+-- 
+2.17.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
index d37a223254..6d0c988b7a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
@@ -5,6 +5,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
+           file://0005-msdk-fix-includedir-path.patch \
            "
 SRC_URI[sha256sum] = "8ad5822f1118fe46a19af54422b74e3a16d79a6800dcb173b49e199a496b341a"
 
-- 
2.17.1


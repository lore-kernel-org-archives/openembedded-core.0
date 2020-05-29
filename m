Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.29384.1590731592716727128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 22:53:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: neekTMFZedXb2BzPP7Ist84JYWygVmkN9UPsm5be/l2sz/hxMrYdxaobstCepYGpuLBUJJW0ax
 Io4mLvPEvPwg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:30 -0700
IronPort-SDR: d6Ts2TCmBbfZXHoUOBQMvPZ/QIVlzKJga2PBjIBjPNWsl1Mz+k8UCxH4Xr8YwnJjAGm7SwkzhG
 gaeguIgaYzyg==
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; 
   d="scan'208";a="414866181"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.136.157])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:29 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 09/25] gstreamer1.0-python: add a patch to fix python 3.8 builds
Date: Fri, 29 May 2020 13:52:45 +0800
Message-Id: <1d047307e11d59eb9ac0affb308407488e1853e4.1590731377.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1590731377.git.anuj.mittal@intel.com>
References: <cover.1590731377.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...son.build-fix-builds-with-python-3.8.patch | 24 +++++++++++++++++++
 .../gstreamer/gstreamer1.0-python_1.16.1.bb   |  4 +++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch
new file mode 100644
index 0000000000..053108ad50
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch
@@ -0,0 +1,24 @@
+From 61cfd1b49dc82baf14bb36d88b6c5be7b8c3d23a Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 2 Dec 2019 18:16:41 +0100
+Subject: [PATCH] meson.build: fix builds with python 3.8
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gst-python/merge_requests/14]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 1da81d5..3e0db38 100644
+--- a/meson.build
++++ b/meson.build
+@@ -24,7 +24,7 @@ pygobject_dep = dependency('pygobject-3.0', fallback: ['pygobject', 'pygobject_d
+ 
+ pymod = import('python')
+ python = pymod.find_installation(get_option('python'))
+-python_dep = python.dependency(required : true)
++python_dep = dependency('python3-embed', required : true)
+ 
+ python_abi_flags = python.get_variable('ABIFLAGS', '')
+ pylib_loc = get_option('libpython-dir')
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
index 5a950f183c..c0f8b5aaa3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
@@ -5,7 +5,9 @@ SECTION = "multimedia"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
+SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz \
+           file://0001-meson.build-fix-builds-with-python-3.8.patch \
+           "
 SRC_URI[md5sum] = "499645fbd1790c5845c02a3998dccc1b"
 SRC_URI[sha256sum] = "b469c8955126f41b8ce0bf689b7029f182cd305f422b3a8df35b780bd8347489"
 
-- 
2.25.4


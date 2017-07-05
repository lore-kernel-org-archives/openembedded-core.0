Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2936577809
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 12:28:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jul 2017 05:28:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,311,1496127600"; d="scan'208";a="1190750443"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jul 2017 05:28:40 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 4DA0F5801CF;
	Wed,  5 Jul 2017 05:28:40 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jul 2017 15:28:33 +0300
Message-Id: <d54e76110b4950f1a229e0e22291f1643e1410ee.1499256752.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1499256752.git.jussi.kukkonen@intel.com>
References: <cover.1499256752.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/6] vulkan: Upgrade 1.0.39.1 -> 1.0.51.0
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
X-List-Received-Date: Wed, 05 Jul 2017 12:28:40 -0000

Remove a patch that's no longer needed

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...se-getenv-if-secure_getenv-does-not-exist.patch | 34 ----------------------
 .../{vulkan_1.0.39.1.bb => vulkan_1.0.51.0.bb}     |  5 ++--
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan/0001-Use-getenv-if-secure_getenv-does-not-exist.patch
 rename meta/recipes-graphics/vulkan/{vulkan_1.0.39.1.bb => vulkan_1.0.51.0.bb} (90%)

diff --git a/meta/recipes-graphics/vulkan/vulkan/0001-Use-getenv-if-secure_getenv-does-not-exist.patch b/meta/recipes-graphics/vulkan/vulkan/0001-Use-getenv-if-secure_getenv-does-not-exist.patch
deleted file mode 100644
index 694922c..0000000
--- a/meta/recipes-graphics/vulkan/vulkan/0001-Use-getenv-if-secure_getenv-does-not-exist.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 20525add1df8e1fb13fef90ac068f982def8b958 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Wed, 8 Mar 2017 13:23:58 +0200
-Subject: [PATCH] Use getenv() if secure_getenv() does not exist
-
-musl does not implement secure version: default to getenv() in that
-case.
-
-https://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers/issues/1538
-
-Upstream-Status: Pending
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- loader/loader.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/loader/loader.c b/loader/loader.c
-index 24758f4..bff79c1 100644
---- a/loader/loader.c
-+++ b/loader/loader.c
-@@ -54,6 +54,10 @@
- #endif
- #endif
- 
-+#if !defined(__secure_getenv)
-+#define __secure_getenv getenv
-+#endif
-+
- struct loader_struct loader = {0};
- // TLS for instance for alloc/free callbacks
- THREAD_LOCAL_DECL struct loader_instance *tls_instance;
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/vulkan/vulkan_1.0.39.1.bb b/meta/recipes-graphics/vulkan/vulkan_1.0.51.0.bb
similarity index 90%
rename from meta/recipes-graphics/vulkan/vulkan_1.0.39.1.bb
rename to meta/recipes-graphics/vulkan/vulkan_1.0.51.0.bb
index 7f0ba21..fe7dac0 100644
--- a/meta/recipes-graphics/vulkan/vulkan_1.0.39.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan_1.0.51.0.bb
@@ -10,11 +10,10 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=99c647ca3d4f6a4b9d8628f757aad156 \
                     file://loader/loader.c;endline=25;md5=a87cd5442291c23d1fce4eece4cfde9d"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers.git;branch=sdk-1.0.39 \
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers.git;branch=sdk-1.0.51 \
            file://demos-Don-t-build-tri-or-cube.patch \
-           file://0001-Use-getenv-if-secure_getenv-does-not-exist.patch \
 "
-SRCREV = "9c21ed0fb275589c3af6118aec9ef4f1d1544dc1"
+SRCREV = "8d021e4d5a9f91436f4462df1dafb222908e296d"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.1.4



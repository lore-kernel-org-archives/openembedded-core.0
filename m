Return-Path: <valentin.popa@intel.com>
Received: from mga14.intel.com (unknown [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 32B3A6AE8A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 16:50:55 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 21 May 2014 09:46:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,880,1392192000"; d="scan'208";a="535554018"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.76])
	by fmsmga001.fm.intel.com with ESMTP; 21 May 2014 09:50:32 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 May 2014 19:50:02 +0300
Message-Id: <5d0d1d68d7277dbb1546e7d30be552149d5d02a4.1400690725.git.valentin.popa@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1400690725.git.valentin.popa@intel.com>
References: <cover.1400690725.git.valentin.popa@intel.com>
In-Reply-To: <cover.1400690725.git.valentin.popa@intel.com>
References: <cover.1400690725.git.valentin.popa@intel.com>
Subject: [PATCH 4/4] eglinfo: patched to compile with mesa10+
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
X-List-Received-Date: Wed, 21 May 2014 16:50:55 -0000

Solves the compile issue against mesa10+:
../../src/glapi_stats.cpp: In function 'const char* eglinfo::get_shader_binary_format_string(GLint)':
| ../../src/glapi_stats.cpp:171:8: error: 'GCCSO_SHADER_BINARY_FJ' was not declared in this scope
|    case GCCSO_SHADER_BINARY_FJ: return "FJ_shader_binary_GCCSO";

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb    |  2 ++
 meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb   |  2 ++
 meta/recipes-graphics/eglinfo/eglinfo.inc          |  4 ++-
 .../0001-eglinfo-x11-change-constant-name.patch    | 33 ++++++++++++++++++++++
 4 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/eglinfo/eglinfo/0001-eglinfo-x11-change-constant-name.patch

diff --git a/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb b/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb
index 455d31e..456afe0 100644
--- a/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb
+++ b/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb
@@ -1,6 +1,8 @@
 EGLINFO_PLATFORM ?= "fb"
 EGLINFO_BINARY_NAME ?= "eglinfo-fb"
 
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/eglinfo:"
+
 include eglinfo.inc
 
 SUMMARY += "(Framebuffer version)"
diff --git a/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb b/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
index 18fc893..676277a 100644
--- a/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
+++ b/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
@@ -1,6 +1,8 @@
 EGLINFO_PLATFORM ?= "x11"
 EGLINFO_BINARY_NAME ?= "eglinfo-x11"
 
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/eglinfo:"
+
 include eglinfo.inc
 
 DEPENDS += "virtual/libx11"
diff --git a/meta/recipes-graphics/eglinfo/eglinfo.inc b/meta/recipes-graphics/eglinfo/eglinfo.inc
index 785e7f1..b342f4e 100644
--- a/meta/recipes-graphics/eglinfo/eglinfo.inc
+++ b/meta/recipes-graphics/eglinfo/eglinfo.inc
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8d4f33bc3add976f7dfae85dab66f03c"
 
 DEPENDS = "virtual/egl"
 
-SRC_URI = "git://github.com/dv1/eglinfo.git;branch=master"
+SRC_URI = "git://github.com/dv1/eglinfo.git;branch=master \
+           file://0001-eglinfo-x11-change-constant-name.patch"
+
 SRCREV = "4a49ff59545d9b6a8222badab64115f89d3a6774"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/eglinfo/eglinfo/0001-eglinfo-x11-change-constant-name.patch b/meta/recipes-graphics/eglinfo/eglinfo/0001-eglinfo-x11-change-constant-name.patch
new file mode 100644
index 0000000..c125a96
--- /dev/null
+++ b/meta/recipes-graphics/eglinfo/eglinfo/0001-eglinfo-x11-change-constant-name.patch
@@ -0,0 +1,33 @@
+From 101a543d145568e1905b02a8ef7ab17b6c235d4a Mon Sep 17 00:00:00 2001
+From: Valentin Popa <valentin.popa@intel.com>
+Date: Wed, 21 May 2014 19:04:42 +0300
+Subject: [PATCH] eglinfo-x11: change constant name
+
+In mesa 10+, GCCSO_SHADER_BINARY_FJ was renamed to
+GL_GCCSO_SHADER_BINARY_FJ.
+Update the name so they match.
+
+Upstream-Status: Pending
+https://github.com/dv1/eglinfo/issues/1
+
+Signed-off-by: Valentin Popa <valentin.popa@intel.com>
+---
+ src/glapi_stats.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/glapi_stats.cpp b/src/glapi_stats.cpp
+index 29f6650..b22f826 100644
+--- a/src/glapi_stats.cpp
++++ b/src/glapi_stats.cpp
+@@ -168,7 +168,7 @@ char const * get_shader_binary_format_string(GLint const p_format)
+ 		case GL_SHADER_BINARY_VIV: return "SHADER_BINARY_VIV";
+ 		case GL_MALI_SHADER_BINARY_ARM: return "MALI_SHADER_BINARY";
+ 		case GL_SHADER_BINARY_DMP: return "SHADER_BINARY_DMP";
+-		case GCCSO_SHADER_BINARY_FJ: return "FJ_shader_binary_GCCSO";
++		case GL_GCCSO_SHADER_BINARY_FJ: return "FJ_shader_binary_GCCSO";
+ 		case GL_SGX_BINARY_IMG: return "SGX_BINARY_IMG";
+ 		default: return 0;
+ 	}
+-- 
+1.9.1
+
-- 
1.9.1



Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7183.1616377301187997965
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 18:41:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: l6eVY4KEmLLejBGTMZk/iQKXFBAD4zcFMUyJn6cDRlDPwpKLRpSJu8kmC+3a5DRCtefCRtKvwJ
 EIHCrax4Q+vw==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="190211609"
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="190211609"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:53 -0700
IronPort-SDR: GsR3UHiyMivWPZOYlOYbCqjkFxeKLF5I9jYT/6FzSg12StpZexkqjVP/VuALkJspg+23XJMjj3
 T/sMBOWw9QzQ==
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="524295186"
Received: from myusoff-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.78.4])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:52 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 11/25] igt-gpu-tools: Fix reproducibility issue
Date: Mon, 22 Mar 2021 09:41:13 +0800
Message-Id: <6e45dd0c65099f0d5f9df0ee052ba3c9ed67f727.1616377115.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616377115.git.anuj.mittal@intel.com>
References: <cover.1616377115.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add a configuration option to pass in srcdir, removing hard coded
build paths from the binaries.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d7e92e3a22f0c87aff4f452b51f50ec417d2949b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../igt-gpu-tools/reproducibility.patch       | 38 +++++++++++++++++++
 .../igt-gpu-tools/igt-gpu-tools_git.bb        |  5 ++-
 2 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/reproducibility.patch

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/reproducibility.patch b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/reproducibility.patch
new file mode 100644
index 0000000000..39e36d8737
--- /dev/null
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/reproducibility.patch
@@ -0,0 +1,38 @@
+meson: Allow source location to be configurable
+
+Hardcoding a build source path into a binary when cross compiling isn't
+appropriate and breaks build reproducibility. Allow the srcdir to be
+specified by an optional configuration option to meson.
+
+Signed-off-by: Richard Purdie <richard.purdie at linuxfoundation.org>
+Upstream-Status: Submitted [https://lists.freedesktop.org/archives/igt-dev/2021-February/029443.html]
+
+Index: git/lib/meson.build
+===================================================================
+--- git.orig/lib/meson.build
++++ git/lib/meson.build
+@@ -122,7 +122,11 @@ if chamelium.found()
+ 	lib_sources += 'igt_chamelium_stream.c'
+ endif
+ 
+-srcdir = join_paths(meson.source_root(), 'tests')
++if get_option('srcdir') != ''
++    srcdir = join_paths(get_option('srcdir'), 'tests')
++else
++    srcdir = join_paths(meson.source_root(), 'tests')
++endif
+ 
+ lib_version = vcs_tag(input : 'version.h.in', output : 'version.h',
+ 		      fallback : 'NO-GIT',
+Index: git/meson_options.txt
+===================================================================
+--- git.orig/meson_options.txt
++++ git/meson_options.txt
+@@ -50,3 +50,7 @@ option('use_rpath',
+        type : 'boolean',
+        value : false,
+        description : 'Set runpath on installed executables for libigt.so')
++
++option('srcdir',
++       type : 'string',
++       description : 'Path to source code to be compiled into binaries (optional)')
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
index 89480d79d2..f25cbc0603 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
@@ -10,7 +10,8 @@ inherit meson
 SRCREV = "d16ad07e7f2a028e14d61f570931c87fa5ce404c"
 PV = "1.25+git${SRCPV}"
 
-SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https"
+SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https \
+           file://reproducibility.patch"
 
 S = "${WORKDIR}/git"
 
@@ -22,7 +23,7 @@ PACKAGE_BEFORE_PN = "${PN}-benchmarks ${PN}-tests"
 
 PACKAGECONFIG[chamelium] = "-Dchamelium=enabled,-Dchamelium=disabled,gsl xmlrpc-c"
 
-EXTRA_OEMESON = "-Ddocs=disabled -Drunner=enabled"
+EXTRA_OEMESON = "-Ddocs=disabled -Drunner=enabled -Dsrcdir=/usr/src/debug/${PN}/${PV}-${PR}/git/"
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|arm.*|aarch64).*-linux"
 COMPATIBLE_HOST_libc-musl_class-target = "null"
 SECURITY_LDFLAGS = "${SECURITY_X_LDFLAGS}"
-- 
2.30.2


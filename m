Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5080F731A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 07:24:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2A7OExx028979
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 9 Mar 2016 23:24:14 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 9 Mar 2016 23:24:13 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>
Date: Thu, 10 Mar 2016 02:23:23 -0500
Message-ID: <14047fe718ae0dcf3e1671364bcfa76e31aecc77.1457593651.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1457593651.git.hongxu.jia@windriver.com>
References: <cover.1457593651.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 18/18] cmake-native:convert source file to relative path
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
X-List-Received-Date: Thu, 10 Mar 2016 07:24:14 -0000
Content-Type: text/plain

While '__FILE__' is used in C/C++ source file, we need to
compile with relative path to avoid build path issue.

If a recipe(such as waffle) inherit cmake, it invoke native
cmake to generate Makefile:
Without the fix:
vim ./build.make
|    cd /Build/tmp/work/core2-64-poky-linux/waffle/1.5.2-r0/
build/src/waffle && /Build/tmp/sysroots/x86_64-linux/usr/bin/
x86_64-poky-linux/x86_64-poky-linux-gcc  $(C_DEFINES) $(C_INCLUDES)
$(C_FLAGS) -o glx/glx_context.c.o   -c /Build/tmp/work/core2-64-poky-linux/
waffle/1.5.2-r0/waffle-1.5.2/src/waffle/glx/glx_context.c

With the fix:
vim ./build.make
|    cd /Build/tmp/work/core2-64-poky-linux/waffle/1.5.2-r0/
build/src/waffle && /Build/tmp/sysroots/x86_64-linux/usr/bin/
x86_64-poky-linux/x86_64-poky-linux-gcc  $(C_DEFINES) $(C_INCLUDES)
$(C_FLAGS) -o glx/glx_context.c.o   -c ../../../waffle-1.5.2/src/waffle/glx/glx_context.c

[YOCTO #7058]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/cmake/cmake-native_3.4.3.bb  |   1 +
 .../convert-source-file-to-relative-path.patch     | 128 +++++++++++++++++++++
 2 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/convert-source-file-to-relative-path.patch

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.4.3.bb b/meta/recipes-devtools/cmake/cmake-native_3.4.3.bb
index cb4e749..2939512 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.4.3.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.4.3.bb
@@ -6,6 +6,7 @@ DEPENDS += "bzip2-native zlib-native"
 
 SRC_URI += "\
     file://cmlibarchive-disable-ext2fs.patch \
+    file://convert-source-file-to-relative-path.patch \
 "
 
 # Disable ccmake since we don't depend on ncurses
diff --git a/meta/recipes-devtools/cmake/cmake/convert-source-file-to-relative-path.patch b/meta/recipes-devtools/cmake/cmake/convert-source-file-to-relative-path.patch
new file mode 100644
index 0000000..77a5155
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/convert-source-file-to-relative-path.patch
@@ -0,0 +1,128 @@
+From c272c82eaeed2ae4b72f40af2754e91f1450a705 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 3 Mar 2016 04:48:46 -0500
+Subject: [PATCH] convert source file to relative path
+
+Although there is CMAKE_USE_RELATIVE_PATHS, but upstream
+explicitly did not support relative path.
+In git://cmake.org/cmake.git
+...
+commit 1335992c8f4e8b96f1a21d5dcc7d65a9fbd84c11
+Author: Stephen Kelly <steveire@gmail.com>
+Date:   Mon Jun 1 19:56:46 2015 +0200
+
+    Remove CMAKE_USE_RELATIVE_PATHS variable.
+...
+The reason is in https://cmake.org/Wiki/CMake_FAQ
+(Why does CMake use full paths, or can I copy my build tree?)
+
+But oe-core need the source file path relative while compiling
+to avoid build path issue. The fix partly refer the above commit,
+but in order to minimize the influence, it only tweak gcc compiling
+rule in generated Makefile (With "Building ** object" message).
+
+Upstream-Status: Inappropriate [openembedded specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Source/cmCommonTargetGenerator.cxx   |  7 +++++++
+ Source/cmCommonTargetGenerator.h     |  5 +++++
+ Source/cmMakefileTargetGenerator.cxx |  5 +++++
+ Source/cmOutputConverter.cxx         | 14 ++++++++++++++
+ Source/cmOutputConverter.h           |  5 +++++
+ 5 files changed, 36 insertions(+)
+
+diff --git a/Source/cmCommonTargetGenerator.cxx b/Source/cmCommonTargetGenerator.cxx
+index 252e231..f7d2d6b 100644
+--- a/Source/cmCommonTargetGenerator.cxx
++++ b/Source/cmCommonTargetGenerator.cxx
+@@ -54,6 +54,13 @@ std::string cmCommonTargetGenerator::Convert(
+   return this->LocalGenerator->Convert(source, relative, output);
+ }
+ 
++std::string cmCommonTargetGenerator::Convert(
++  std::string const& local,
++  std::string const& remote,
++  cmLocalGenerator::OutputFormat output)
++{
++  return this->LocalGenerator->Convert(local, remote, output);
++}
+ //----------------------------------------------------------------------------
+ const char* cmCommonTargetGenerator::GetFeature(const std::string& feature)
+ {
+diff --git a/Source/cmCommonTargetGenerator.h b/Source/cmCommonTargetGenerator.h
+index a4b2c10..6e6b724 100644
+--- a/Source/cmCommonTargetGenerator.h
++++ b/Source/cmCommonTargetGenerator.h
+@@ -72,6 +72,11 @@ protected:
+                       cmLocalGenerator::OutputFormat output =
+                       cmLocalGenerator::UNCHANGED);
+ 
++  std::string Convert(std::string const& local,
++                      std::string const& remote,
++                      cmLocalGenerator::OutputFormat output =
++                      cmLocalGenerator::UNCHANGED);
++
+   void AppendFortranFormatFlags(std::string& flags,
+                                 cmSourceFile const& source);
+ 
+diff --git a/Source/cmMakefileTargetGenerator.cxx b/Source/cmMakefileTargetGenerator.cxx
+index b278087..84a6ed7 100644
+--- a/Source/cmMakefileTargetGenerator.cxx
++++ b/Source/cmMakefileTargetGenerator.cxx
+@@ -530,6 +530,11 @@ cmMakefileTargetGenerator
+     this->LocalGenerator->AppendEcho
+       (commands, buildEcho.c_str(), cmLocalUnixMakefileGenerator3::EchoBuild,
+        &progress);
++
++    //Convert sourceFile to relative path
++    sourceFile = this->Convert(this->Makefile->GetCurrentBinaryDirectory(),
++                               sourceFile,
++                               cmLocalGenerator::SHELL);
+     }
+ 
+   std::string targetOutPathReal;
+diff --git a/Source/cmOutputConverter.cxx b/Source/cmOutputConverter.cxx
+index 5acae2f..3d71739 100644
+--- a/Source/cmOutputConverter.cxx
++++ b/Source/cmOutputConverter.cxx
+@@ -94,6 +94,20 @@ const char* cmOutputConverter::GetRelativeRootPath(RelativeRoot relroot) const
+   return 0;
+ }
+ 
++std::string cmOutputConverter::Convert(const std::string& local,
++                                       const std::string& remote,
++                                       OutputFormat output) const
++{
++  // Convert the path to a relative path.
++  std::string result = remote;
++
++  std::vector<std::string> components;
++  cmSystemTools::SplitPath(local, components);
++  result = this->ConvertToRelativePath(components, result, true);
++
++  return this->ConvertToOutputFormat(result, output);
++}
++
+ std::string cmOutputConverter::Convert(const std::string& source,
+                                        RelativeRoot relative,
+                                        OutputFormat output) const
+diff --git a/Source/cmOutputConverter.h b/Source/cmOutputConverter.h
+index 852df5d..d887a99 100644
+--- a/Source/cmOutputConverter.h
++++ b/Source/cmOutputConverter.h
+@@ -45,6 +45,11 @@ public:
+   std::string Convert(RelativeRoot remote, const std::string& local,
+                       OutputFormat output = UNCHANGED,
+                       bool optional = false) const;
++
++  std::string Convert(const std::string& local,
++                      const std::string& remote,
++                      OutputFormat output = UNCHANGED) const;
++
+   std::string ConvertDirectorySeparatorsForShell(
+                                              const std::string& source) const;
+ 
+-- 
+1.9.1
+
-- 
1.9.1



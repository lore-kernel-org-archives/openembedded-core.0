X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Subject: [PATCH] python3-setuptools: Fix building python modules using cython
Date: Wed, 18 May 2022 09:15:25 +0200
Message-Id: <20220518071525.4169607-1-zboszor@pr.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>

From: Zoltán Böszörményi <zboszor@gmail.com>

The function _is_gcc() was not taking a machine triplet into
account. Also handle clang and clang++ because they also
want the rpath option via -Wl,-R instead of just -R.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...cross-compiler-prefixes-and-handle-c.patch | 31 +++++++++++++++++++
 .../python/python3-setuptools_59.5.0.bb       |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-Fix-_is_gcc-for-cross-compiler-prefixes-and-handle-c.patch

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-Fix-_is_gcc-for-cross-compiler-prefixes-and-handle-c.patch b/meta/recipes-devtools/python/python3-setuptools/0001-Fix-_is_gcc-for-cross-compiler-prefixes-and-handle-c.patch
new file mode 100644
index 0000000000..7f91d8e6cd
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-Fix-_is_gcc-for-cross-compiler-prefixes-and-handle-c.patch
@@ -0,0 +1,31 @@
+From 695800847eb519209c2b45e26fd65d3117a4efcd Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Wed, 18 May 2022 06:51:22 +0200
+Subject: [PATCH] Fix _is_gcc() for cross-compiler prefixes and handle
+ clang and clang++
+
+Upstream-Status: Submitted [https://github.com/pypa/setuptools/pull/3326]
+
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+---
+ setuptools/_distutils/unixccompiler.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/setuptools/_distutils/unixccompiler.py b/setuptools/_distutils/unixccompiler.py
+index 715408f5..3a4d642e 100644
+--- a/setuptools/_distutils/unixccompiler.py
++++ b/setuptools/_distutils/unixccompiler.py
+@@ -260,7 +260,8 @@ class UnixCCompiler(CCompiler):
+         return "-L" + dir
+ 
+     def _is_gcc(self, compiler_name):
+-        return "gcc" in compiler_name or "g++" in compiler_name
++        cnpat = re.compile('.*(gcc|g\+\+|clang|clang\+\+)$')
++        return not (cnpat.match(compiler_name) is None)
+ 
+     def runtime_library_dir_option(self, dir):
+         # XXX Hackish, at the very least.  See Python bug #445902:
+-- 
+2.36.1
+
diff --git a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
index f2810e18d3..20ecf5223d 100644
--- a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
@@ -11,6 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += "\
     file://0001-change-shebang-to-python3.patch \
     file://0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch \
+    file://0001-Fix-_is_gcc-for-cross-compiler-prefixes-and-handle-c.patch \
 "
 
 SRC_URI[sha256sum] = "d144f85102f999444d06f9c0e8c737fd0194f10f2f7e5fdb77573f6e2fa4fad0"
-- 
2.36.1


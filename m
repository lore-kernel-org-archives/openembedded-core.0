Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 35DC47DFBE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 02:04:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,471,1559491200"; d="scan'208";a="74917080"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Sep 2019 10:04:23 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 19EBB4CE0871
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 10:04:18 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 6 Sep 2019 10:04:22 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Sep 2019 10:03:46 +0800
Message-ID: <20190906020346.12842-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 19EBB4CE0871.A9E2D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCHv2] meson:upgrade 0.51.1 -> 0.51.2
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
X-List-Received-Date: Fri, 06 Sep 2019 02:04:24 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-meson/0001-Fix-missing-return-statements-that-are-seen-with-Wer.patch
Removed since this is included in 0.51.2.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/meson/meson.inc              |   5 +-
 ...-return-statements-that-are-seen-with-Wer.patch | 100 ---------------------
 .../meson/{meson_0.51.1.bb => meson_0.51.2.bb}     |   0
 ...k-meson_0.51.1.bb => nativesdk-meson_0.51.2.bb} |   0
 4 files changed, 2 insertions(+), 103 deletions(-)
 delete mode 100644 meta/recipes-devtools/meson/meson/0001-Fix-missing-return-statements-that-are-seen-with-Wer.patch
 rename meta/recipes-devtools/meson/{meson_0.51.1.bb => meson_0.51.2.bb} (100%)
 rename meta/recipes-devtools/meson/{nativesdk-meson_0.51.1.bb => nativesdk-meson_0.51.2.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 14e5f8a..6de109d 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -16,10 +16,9 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0001-mesonbuild-environment.py-check-environment-for-vari.patch \
            file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
            file://vala-cross-compile.patch \
-           file://0001-Fix-missing-return-statements-that-are-seen-with-Wer.patch \
            "
-SRC_URI[sha256sum] = "f27b7a60f339ba66fe4b8f81f0d1072e090a08eabbd6aa287683b2c2b9dd2d82"
-SRC_URI[md5sum] = "48787e391ec5c052799a3dd491f73909"
+SRC_URI[sha256sum] = "23688f0fc90be623d98e80e1defeea92bbb7103bf9336a5f5b9865d36e892d76"
+SRC_URI[md5sum] = "d46c4a8e3cfd27f90e2c6fe4a69e574b"
 
 SRC_URI_append_class-native = " \
     file://0001-Make-CPU-family-warnings-fatal.patch \
diff --git a/meta/recipes-devtools/meson/meson/0001-Fix-missing-return-statements-that-are-seen-with-Wer.patch b/meta/recipes-devtools/meson/meson/0001-Fix-missing-return-statements-that-are-seen-with-Wer.patch
deleted file mode 100644
index 16c6d90..0000000
--- a/meta/recipes-devtools/meson/meson/0001-Fix-missing-return-statements-that-are-seen-with-Wer.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 15f44be1c7f71cb0a8c6863917acbbc301c621fe Mon Sep 17 00:00:00 2001
-From: Martin Liska <mliska@suse.cz>
-Date: Mon, 15 Jul 2019 10:06:17 +0200
-Subject: [PATCH] Fix missing return statements that are seen with
- -Werror=return-type.
-
-Error example:
-
-Code:
-
-        #include <locale.h>
-        int main () {
-            /* If it's not defined as a macro, try to use as a symbol */
-            #ifndef LC_MESSAGES
-                LC_MESSAGES;
-            #endif
-        }
-Compiler stdout:
-
-Compiler stderr:
- In file included from /usr/include/locale.h:25,
-                 from /tmp/tmpep_i4iwg/testfile.c:2:
-/usr/include/features.h:382:4: warning: #warning _FORTIFY_SOURCE
-requires compiling with optimization (-O) [-Wcpp]
-  382 | #  warning _FORTIFY_SOURCE requires compiling with optimization
-(-O)
-      |    ^~~~~~~
-/tmp/tmpep_i4iwg/testfile.c: In function 'main':
-/tmp/tmpep_i4iwg/testfile.c:8:9: error: control reaches end of non-void
-function [-Werror=return-type]
-    8 |         }
-      |         ^
-cc1: some warnings being treated as errors
-
-Upstream-Status: Backport
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- mesonbuild/compilers/c.py     | 1 +
- mesonbuild/compilers/clike.py | 5 +++++
- 2 files changed, 6 insertions(+)
-
-diff --git a/mesonbuild/compilers/c.py b/mesonbuild/compilers/c.py
-index 3b58a076..9ef92077 100644
---- a/mesonbuild/compilers/c.py
-+++ b/mesonbuild/compilers/c.py
-@@ -70,6 +70,7 @@ class CCompiler(CLikeCompiler, Compiler):
-             #ifndef {symbol}
-                 {symbol};
-             #endif
-+            return 0;
-         }}'''
-         return self.compiles(t.format(**fargs), env, extra_args=extra_args,
-                              dependencies=dependencies)
-diff --git a/mesonbuild/compilers/clike.py b/mesonbuild/compilers/clike.py
-index 83f67591..f9cbeabd 100644
---- a/mesonbuild/compilers/clike.py
-+++ b/mesonbuild/compilers/clike.py
-@@ -375,6 +375,7 @@ class CLikeCompiler:
-             #ifndef {symbol}
-                 {symbol};
-             #endif
-+            return 0;
-         }}'''
-         return self.compiles(t.format(**fargs), env, extra_args=extra_args,
-                              dependencies=dependencies)
-@@ -554,6 +555,7 @@ class CLikeCompiler:
-         {prefix}
-         int main(int argc, char **argv) {{
-             {type} something;
-+            return 0;
-         }}'''
-         if not self.compiles(t.format(**fargs), env, extra_args=extra_args,
-                              dependencies=dependencies)[0]:
-@@ -589,6 +591,7 @@ class CLikeCompiler:
-         {prefix}
-         int main(int argc, char **argv) {{
-             {type} something;
-+            return 0;
-         }}'''
-         if not self.compiles(t.format(**fargs), env, extra_args=extra_args,
-                              dependencies=dependencies)[0]:
-@@ -667,6 +670,7 @@ class CLikeCompiler:
-         #include <stdio.h>
-         int main(int argc, char *argv[]) {{
-             printf ("{fmt}", {cast} {f}());
-+            return 0;
-         }}'''.format(**fargs)
-         res = self.run(code, env, extra_args=extra_args, dependencies=dependencies)
-         if not res.compiled:
-@@ -819,6 +823,7 @@ class CLikeCompiler:
-                 #error "No definition for __builtin_{func} found in the prefix"
-             #endif
-         #endif
-+        return 0;
-         }}'''
-         return self.links(t.format(**fargs), env, extra_args=extra_args,
-                           dependencies=dependencies)
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/meson/meson_0.51.1.bb b/meta/recipes-devtools/meson/meson_0.51.2.bb
similarity index 100%
rename from meta/recipes-devtools/meson/meson_0.51.1.bb
rename to meta/recipes-devtools/meson/meson_0.51.2.bb
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.51.1.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.51.2.bb
similarity index 100%
rename from meta/recipes-devtools/meson/nativesdk-meson_0.51.1.bb
rename to meta/recipes-devtools/meson/nativesdk-meson_0.51.2.bb
-- 
2.7.4





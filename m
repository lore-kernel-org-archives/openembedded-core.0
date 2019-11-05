Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id ECD187F939
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 22:08:48 +0000 (UTC)
IronPort-SDR: AIKWMHV0uO4JDn9Oqy667ISZ0FaGUiaGH2QonpKCWow4gKZCNmi+0OB+H8r+pozP+vA3f9dU2Y
	OAqHqwvVjwFC1WRl+PrgWP0GGEdfJgdm67kIN11iiz8z5BIJvJcRn8H2SvzlS6ezuyXBy7OtX7
	z+tYhtApnnn8IeTt0QojEXgqPLbta83h9sU7HeoPMVyFFIBZHAuc/tGMi4FjgEhLol5rSYhlYQ
	UBOR1UxOrGp/uJgCoWmjkys2utRSpyeOgOl1xW52XeIKw2bFXLlV7CjkNIZ3lSu1sc/6uk13jd
	mng=
X-IronPort-AV: E=Sophos;i="5.68,271,1569276000"; 
   d="scan'208";a="2115960"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 23:08:31 +0100
Message-Id: <8080f0d46a294f98055949e25cf0a7c224d6c82b.1572991610.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1572991610.git.pkj@axis.com>
References: <cover.1572991610.git.pkj@axis.com>
MIME-Version: 1.0
Subject: [warrior][PATCHv2 1/9] meson: Backport patch to handle strings in cross file args
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
X-List-Received-Date: Tue, 05 Nov 2019 22:08:49 -0000
Content-Transfer-Encoding: 8bit

This allows <language>_args and <language>_link_args properties, e.g.,
c_link_args, in meson.cross to be specified as either a string or a
list.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-devtools/meson/meson.inc         |  1 +
 ...ings-in-cross-file-args.-Closes-4671.patch | 87 +++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/0001-Handle-strings-in-cross-file-args.-Closes-4671.patch

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index bfe9851e94..ef26848498 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -17,6 +17,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://many-cross.patch \
            file://cross-libdir.patch \
            file://0001-Fix-missing-return-statements-that-are-seen-with-Wer.patch \
+           file://0001-Handle-strings-in-cross-file-args.-Closes-4671.patch \
            "
 SRC_URI[sha256sum] = "ef9f14326ec1e30d3ba1a26df0f92826ede5a79255ad723af78a2691c37109fd"
 SRC_URI[md5sum] = "0267b0871266056184c484792572c682"
diff --git a/meta/recipes-devtools/meson/meson/0001-Handle-strings-in-cross-file-args.-Closes-4671.patch b/meta/recipes-devtools/meson/meson/0001-Handle-strings-in-cross-file-args.-Closes-4671.patch
new file mode 100644
index 0000000000..1b1668e4ce
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0001-Handle-strings-in-cross-file-args.-Closes-4671.patch
@@ -0,0 +1,87 @@
+From 4818b27894c828a50befc94f1bc9062e89a544ea Mon Sep 17 00:00:00 2001
+From: Jussi Pakkanen <jpakkane@gmail.com>
+Date: Sat, 29 Dec 2018 18:23:36 +0200
+Subject: [PATCH] Handle strings in cross file args. Closes #4671.
+
+Upstream-Status: Backport [6c76ac80173bdc40d35e2d6b802f7950646781dc]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+
+---
+
+Note that the change to ninjabackend.py does not come from commit
+6c76ac80, as it was not corrected until commit 2b22576f. However,
+since that commit is huge and changes a lot of unrelated stuff, it was
+easier to include the relevant part here.
+
+ cross/ubuntu-armhf.txt                       |  2 +-
+ mesonbuild/backend/ninjabackend.py           |  2 +-
+ mesonbuild/compilers/compilers.py            |  4 ++--
+ test cases/common/137 get define/meson.build | 12 +++---------
+ 4 files changed, 7 insertions(+), 13 deletions(-)
+
+diff --git a/cross/ubuntu-armhf.txt b/cross/ubuntu-armhf.txt
+index fec8ce7..a6e1f15 100644
+--- a/cross/ubuntu-armhf.txt
++++ b/cross/ubuntu-armhf.txt
+@@ -12,7 +12,7 @@ pkgconfig = '/usr/bin/arm-linux-gnueabihf-pkg-config'
+ root = '/usr/arm-linux-gnueabihf'
+ # Used in unit test '140 get define'
+ c_args = ['-DMESON_TEST_ISSUE_1665=1']
+-cpp_args = ['-DMESON_TEST_ISSUE_1665=1']
++cpp_args = '-DMESON_TEST_ISSUE_1665=1'
+ 
+ has_function_printf = true
+ has_function_hfkerhisadf = false
+diff --git a/mesonbuild/backend/ninjabackend.py b/mesonbuild/backend/ninjabackend.py
+index 3739c0a..2cebeef 100644
+--- a/mesonbuild/backend/ninjabackend.py
++++ b/mesonbuild/backend/ninjabackend.py
+@@ -1400,7 +1400,7 @@ int dummy;
+                 if is_cross:
+                     crstr = '_CROSS'
+                     try:
+-                        cross_args = self.environment.cross_info.config['properties'][langname + '_link_args']
++                        cross_args = mesonlib.stringlistify(self.environment.cross_info.config['properties'][langname + '_link_args'])
+                     except KeyError:
+                         pass
+                 rule = 'rule %s%s_LINKER\n' % (langname, crstr)
+diff --git a/mesonbuild/compilers/compilers.py b/mesonbuild/compilers/compilers.py
+index e27ae2b..a5b9e91 100644
+--- a/mesonbuild/compilers/compilers.py
++++ b/mesonbuild/compilers/compilers.py
+@@ -1048,10 +1048,10 @@ class Compiler:
+             if 'properties' in environment.cross_info.config:
+                 props = environment.cross_info.config['properties']
+                 lang_args_key = self.language + '_args'
+-                extra_flags += props.get(lang_args_key, [])
++                extra_flags += mesonlib.stringlistify(props.get(lang_args_key, []))
+                 lang_link_args_key = self.language + '_link_args'
+                 if link:
+-                    extra_flags += props.get(lang_link_args_key, [])
++                    extra_flags += mesonlib.stringlistify(props.get(lang_link_args_key, []))
+         return extra_flags
+ 
+     def _get_compile_output(self, dirname, mode):
+diff --git a/test cases/common/137 get define/meson.build b/test cases/common/137 get define/meson.build
+index 109f628..1647e22 100644
+--- a/test cases/common/137 get define/meson.build	
++++ b/test cases/common/137 get define/meson.build	
+@@ -67,15 +67,9 @@ foreach lang : ['c', 'cpp']
+ 
+   run_1665_test = false
+   if meson.is_cross_build()
+-    # Can't use an empty array as a fallback here because of
+-    # https://github.com/mesonbuild/meson/issues/1481
+-    lang_args = meson.get_cross_property(lang + '_args', [])
+-    if lang_args.length() != 0
+-      foreach lang_arg : lang_args
+-        if lang_arg.contains('MESON_TEST_ISSUE_1665')
+-          run_1665_test = true
+-        endif
+-      endforeach
++    lang_arg = meson.get_cross_property(lang + '_args', '')
++    if lang_arg == '-DMESON_TEST_ISSUE_1665=1'
++      run_1665_test = true
+     endif
+   endif
+ 
-- 
2.21.0



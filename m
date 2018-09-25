Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id CE0127950F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 15:18:45 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id y25-v6so6423825wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 08:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ZsOUWW6vnVVY/IZwhamxflzyImh16Rk8Wow6uaJCP3o=;
	b=c1K0sQ13i0jhNidULDSvdiRIeoKGEr/6K0HFNETVNhMmXdZx7vhThE1S0EiEzFaFgZ
	4qlnXqF5sREVsGL9aXSl5ze+cIuceYYnEq1J3N65ltYyeY97NyCX7fyVlabiDeAYorFw
	Z/dVsTPsOyl2u7nX/JaN/klfzLiO6H0eYW7TOaryM8cxXuuML4wsn1VY4XHcCFoTUnGH
	uQ0pwg2fHIBSDNF5H22CMCbTaXygsflAQZygULasrFsud5Cab66pJRaeSeO9zbg8F052
	eLQt6EvCbsb2s0mxR4bOetPOMx3cafbJ2mItwXm4/vEhDd+6QfzalzsoRQjNnUnLqyD/
	SyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ZsOUWW6vnVVY/IZwhamxflzyImh16Rk8Wow6uaJCP3o=;
	b=mwiF6Q00ANhMrJjrBHUlzwCKljgClyEHt4I7qvBmWznzB89zJyMWPM4SkuurCdChUN
	7Mami9REKO/D3aBkYSENIHk/LKfjf0ywWwLSawIu82JZlaptdBcScVusLbuazb7FKi+Y
	7KrHisoJM8BxlSUQQszDeWfIQzHpT3dIwIVqADOjvSv74XfBpO+ucUYNyq6IPLXJcOy7
	qq84GLyLtTT4f0Pky3Kuk0oB6yQOB/n/eCBc1SavHcdnCXXi6OBrFERKIps8yFsfMbOq
	oWPM8r9zKbNDfR6HJSpdDbJW6GHIjzQ++M51zkdfCmzQDCv7O3iJcWL285zPHymEOPF5
	otOA==
X-Gm-Message-State: ABuFfoh+Z4Pp1WVCdJkmhnRtJKRs99dQB5WAfsTJXmrZcx7e9zVQDuWG
	0EvtD5jvUmsVnsKu2XUxBr7eN07dPY4=
X-Google-Smtp-Source: ACcGV62yZHonWCnj/K0IIkw3MuGzcUSghe0TUjNEXYBQSSbVY5tkzTS0r9DRVuEl9bst3Z+IjJusHA==
X-Received: by 2002:a1c:9355:: with SMTP id
	v82-v6mr1182265wmd.128.1537888725961; 
	Tue, 25 Sep 2018 08:18:45 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	i9-v6sm2225428wro.82.2018.09.25.08.18.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Sep 2018 08:18:45 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Sep 2018 16:18:43 +0100
Message-Id: <20180925151843.30284-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH V2] meson: respect target/native flag distinction in G-I and gtk-doc
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
X-List-Received-Date: Tue, 25 Sep 2018 15:18:46 -0000

Remove the previous attempt at this from
0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch as it wasn't quite
right, and the rest of the patch is adding the currently not upstreamable runner
option.

Add two new patches to fix both gobject-introspection and gtk-doc using native
flags for target compiles.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/meson/meson.inc              |  2 +
 ...ix-issues-that-arise-when-cross-compiling.patch | 26 -------------
 meta/recipes-devtools/meson/meson/gi-flags.patch   | 35 +++++++++++++++++
 .../meson/meson/gtkdoc-flags.patch                 | 44 ++++++++++++++++++++++
 4 files changed, 81 insertions(+), 26 deletions(-)
 create mode 100644 meta/recipes-devtools/meson/meson/gi-flags.patch
 create mode 100644 meta/recipes-devtools/meson/meson/gtkdoc-flags.patch

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index cfb831b106f..205d2a4abd7 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -11,6 +11,8 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0003-native_bindir.patch \
            file://0002-Make-CPU-family-warnings-fatal.patch \
            file://0001-Support-building-allarch-recipes-again.patch \
+           file://gi-flags.patch \
+           file://gtkdoc-flags.patch \
            "
 SRC_URI[sha256sum] = "92d8afd921751261e36151643464efd3394162f69efbe8cd53e0a66b1cf395eb"
 SRC_URI[md5sum] = "31bda3519d8c0eb3438267268a78085e"
diff --git a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
index 57cb678f2c8..7ffd6c54cb0 100644
--- a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
+++ b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
@@ -35,32 +35,6 @@ index cb69641..727eb6a 100644
          args += self._unpack_args('--htmlargs=', 'html_args', kwargs)
          args += self._unpack_args('--scanargs=', 'scan_args', kwargs)
          args += self._unpack_args('--scanobjsargs=', 'scanobjs_args', kwargs)
-@@ -854,14 +858,22 @@ This will become a hard error in the future.''')
-         ldflags.update(internal_ldflags)
-         ldflags.update(state.environment.coredata.get_external_link_args('c'))
-         ldflags.update(external_ldflags)
-+
-+        cross_c_args = " ".join(state.environment.cross_info.config["properties"].get('c_args', ""))
-+        cross_link_args = " ".join(state.environment.cross_info.config["properties"].get('c_link_args', ""))
-+
-         if cflags:
--            args += ['--cflags=%s' % ' '.join(cflags)]
-+            args += ['--cflags=%s %s' % (cross_c_args,' '.join(cflags))]
-         if ldflags:
--            args += ['--ldflags=%s' % ' '.join(ldflags)]
-+            args += ['--ldflags=%s %s' % (cross_link_args, ' '.join(ldflags))]
-         compiler = state.environment.coredata.compilers.get('c')
--        if compiler:
-+        cross_compiler = state.environment.coredata.cross_compilers.get('c')
-+        if compiler and not state.environment.is_cross_build():
-             args += ['--cc=%s' % ' '.join(compiler.get_exelist())]
-             args += ['--ld=%s' % ' '.join(compiler.get_linker_exelist())]
-+        elif cross_compiler and state.environment.is_cross_build():
-+            args += ['--cc=%s' % ' '.join(cross_compiler.get_exelist())]
-+            args += ['--ld=%s' % ' '.join(cross_compiler.get_linker_exelist())]
- 
-         return args
- 
 diff --git a/mesonbuild/scripts/gtkdochelper.py b/mesonbuild/scripts/gtkdochelper.py
 index 948dc5a..9c5bd19 100644
 --- a/mesonbuild/scripts/gtkdochelper.py
diff --git a/meta/recipes-devtools/meson/meson/gi-flags.patch b/meta/recipes-devtools/meson/meson/gi-flags.patch
new file mode 100644
index 00000000000..9a4c2961911
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/gi-flags.patch
@@ -0,0 +1,35 @@
+Pass the correct cflags/ldflags to the gobject-introspection tools.
+
+Upstream-Status: Submitted [https://github.com/mesonbuild/meson/pull/4261]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
+index cb69641e..bb4449a0 100644
+--- a/mesonbuild/modules/gnome.py
++++ b/mesonbuild/modules/gnome.py
+@@ -579,7 +579,10 @@ class GnomeModule(ExtensionModule):
+         external_ldflags += list(dep_external_ldflags)
+         scan_command += ['--cflags-begin']
+         scan_command += cflags
+-        scan_command += state.environment.coredata.get_external_args(lang)
++        if state.environment.is_cross_build():
++            scan_command += state.environment.cross_info.config["properties"].get(lang + '_args', "")
++        else:
++            scan_command += state.environment.coredata.get_external_args(lang)
+         scan_command += ['--cflags-end']
+         # need to put our output directory first as we need to use the
+         # generated libraries instead of any possibly installed system/prefix
+@@ -614,7 +614,12 @@ class GnomeModule(ExtensionModule):
+                 scan_command.append('-L' + d)
+             scan_command += ['--library', libname]
+ 
+-        for link_arg in state.environment.coredata.get_external_link_args(lang):
++        if state.environment.is_cross_build():
++            link_args = state.environment.cross_info.config["properties"].get(lang + '_link_args', "")
++        else:
++            link_args = state.environment.coredata.get_external_link_args(lang)
++
++        for link_arg in link_args:
+             if link_arg.startswith('-L'):
+                 scan_command.append(link_arg)
+         scan_command += list(external_ldflags)
diff --git a/meta/recipes-devtools/meson/meson/gtkdoc-flags.patch b/meta/recipes-devtools/meson/meson/gtkdoc-flags.patch
new file mode 100644
index 00000000000..ecf3489bbe5
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/gtkdoc-flags.patch
@@ -0,0 +1,44 @@
+Ensure that in a cross compile only the target flags are passed to gtk-doc, and
+not the native flags.
+
+Upstream-Status: Submitted [https://github.com/mesonbuild/meson/pull/4261]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
+index 4af33304..8751f53c 100644
+--- a/mesonbuild/modules/gnome.py
++++ b/mesonbuild/modules/gnome.py
+@@ -851,17 +851,30 @@ This will become a hard error in the future.''')
+             if not isinstance(incd.held_object, (str, build.IncludeDirs)):
+                 raise MesonException(
+                     'Gir include dirs should be include_directories().')
++
+         cflags.update(get_include_args(inc_dirs))
+-        cflags.update(state.environment.coredata.get_external_args('c'))
++        if state.environment.is_cross_build():
++            cflags.update(state.environment.cross_info.config["properties"].get('c_args', ""))
++        else:
++            cflags.update(state.environment.coredata.get_external_args('c'))
++
+         ldflags = OrderedSet()
+         ldflags.update(internal_ldflags)
+-        ldflags.update(state.environment.coredata.get_external_link_args('c'))
++        if state.environment.is_cross_build():
++            ldflags.update(state.environment.cross_info.config["properties"].get('c_link_args', ""))
++        else:
++            ldflags.update(state.environment.coredata.get_external_link_args('c'))
+         ldflags.update(external_ldflags)
++
+         if cflags:
+             args += ['--cflags=%s' % ' '.join(cflags)]
+         if ldflags:
+             args += ['--ldflags=%s' % ' '.join(ldflags)]
+-        compiler = state.environment.coredata.compilers.get('c')
++
++        if state.environment.is_cross_build():
++            compiler = state.environment.coredata.cross_compilers.get('c')
++        else:
++            compiler = state.environment.coredata.compilers.get('c')
+         if compiler:
+             args += ['--cc=%s' % ' '.join(compiler.get_exelist())]
+             args += ['--ld=%s' % ' '.join(compiler.get_linker_exelist())]
-- 
2.11.0



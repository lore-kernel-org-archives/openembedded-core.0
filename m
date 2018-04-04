Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 59C8E74874
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 11:20:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 04:20:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,405,1517904000"; d="scan'208";a="40599847"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 04 Apr 2018 04:20:13 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 14:13:16 +0300
Message-Id: <20180404111321.10824-17-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
References: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 17/22] meson: update to 0.45.1
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
X-List-Received-Date: Wed, 04 Apr 2018 11:20:13 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...ix-issues-that-arise-when-cross-compiling.patch | 34 ++++++++++------------
 .../meson/{meson_0.44.1.bb => meson_0.45.1.bb}     |  4 +--
 2 files changed, 18 insertions(+), 20 deletions(-)
 rename meta/recipes-devtools/meson/{meson_0.44.1.bb => meson_0.45.1.bb} (83%)

diff --git a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
index 1912e94358e..a00743fda84 100644
--- a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
+++ b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
@@ -1,7 +1,7 @@
-From c5692cac9c555664281377a82bf8b1e46934f437 Mon Sep 17 00:00:00 2001
+From d1c2b3bf01f1a5897cf5c906ba2326fb68c6af12 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 4 Aug 2017 16:16:41 +0300
-Subject: [PATCH 1/3] gtkdoc: fix issues that arise when cross-compiling
+Subject: [PATCH] gtkdoc: fix issues that arise when cross-compiling
 
 Specifically:
 1) Make it possible to specify a wrapper for executing binaries
@@ -21,10 +21,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 22 insertions(+), 5 deletions(-)
 
 diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
-index 56765a5..4f7fe30 100644
+index 569011e..770ff4f 100644
 --- a/mesonbuild/modules/gnome.py
 +++ b/mesonbuild/modules/gnome.py
-@@ -769,6 +769,10 @@ This will become a hard error in the future.''')
+@@ -773,6 +773,10 @@ This will become a hard error in the future.''')
                  '--mode=' + mode]
          if namespace:
              args.append('--namespace=' + namespace)
@@ -35,10 +35,10 @@ index 56765a5..4f7fe30 100644
          args += self._unpack_args('--htmlargs=', 'html_args', kwargs)
          args += self._unpack_args('--scanargs=', 'scan_args', kwargs)
          args += self._unpack_args('--scanobjsargs=', 'scanobjs_args', kwargs)
-@@ -796,14 +800,22 @@ This will become a hard error in the future.''')
-                 raise MesonException(
-                     'Gir include dirs should be include_directories().')
+@@ -829,14 +833,22 @@ This will become a hard error in the future.''')
          cflags.update(get_include_args(inc_dirs))
+         cflags.update(state.environment.coredata.external_args['c'])
+         ldflags.update(state.environment.coredata.external_link_args['c'])
 +
 +        cross_c_args = " ".join(state.environment.cross_info.config["properties"].get('c_args', ""))
 +        cross_link_args = " ".join(state.environment.cross_info.config["properties"].get('c_link_args', ""))
@@ -62,26 +62,27 @@ index 56765a5..4f7fe30 100644
          return args
  
 diff --git a/mesonbuild/scripts/gtkdochelper.py b/mesonbuild/scripts/gtkdochelper.py
-index 4406b28..b846827 100644
+index 2a5ee8b..2fd692b 100644
 --- a/mesonbuild/scripts/gtkdochelper.py
 +++ b/mesonbuild/scripts/gtkdochelper.py
-@@ -44,13 +44,14 @@ parser.add_argument('--ignore-headers', dest='ignore_headers', default='')
+@@ -45,6 +45,7 @@ parser.add_argument('--ignore-headers', dest='ignore_headers', default='')
  parser.add_argument('--namespace', dest='namespace', default='')
  parser.add_argument('--mode', dest='mode', default='')
  parser.add_argument('--installdir', dest='install_dir')
 +parser.add_argument('--gtkdoc-exe-wrapper', dest='gtkdoc_exe_wrapper')
  
- def gtkdoc_run_check(cmd, cwd):
-     # Put stderr into stdout since we want to print it out anyway.
+ def gtkdoc_run_check(cmd, cwd, library_path=None):
+     env = dict(os.environ)
+@@ -54,7 +55,7 @@ def gtkdoc_run_check(cmd, cwd, library_path=None):
      # This preserves the order of messages.
-     p, out = Popen_safe(cmd, cwd=cwd, stderr=subprocess.STDOUT)[0:2]
+     p, out = Popen_safe(cmd, cwd=cwd, env=env, stderr=subprocess.STDOUT)[0:2]
      if p.returncode != 0:
 -        err_msg = ["{!r} failed with status {:d}".format(cmd[0], p.returncode)]
 +        err_msg = ["{!r} failed with status {:d}".format(cmd, p.returncode)]
          if out:
              err_msg.append(out)
          raise MesonException('\n'.join(err_msg))
-@@ -58,7 +59,7 @@ def gtkdoc_run_check(cmd, cwd):
+@@ -62,7 +63,7 @@ def gtkdoc_run_check(cmd, cwd, library_path=None):
  def build_gtkdoc(source_root, build_root, doc_subdir, src_subdirs,
                   main_file, module,
                   html_args, scan_args, fixxref_args, mkdb_args,
@@ -90,7 +91,7 @@ index 4406b28..b846827 100644
                   html_assets, content_files, ignore_headers, namespace,
                   expand_content_files, mode):
      print("Building documentation for %s" % module)
-@@ -111,6 +112,9 @@ def build_gtkdoc(source_root, build_root, doc_subdir, src_subdirs,
+@@ -115,6 +116,9 @@ def build_gtkdoc(source_root, build_root, doc_subdir, src_subdirs,
      if gobject_typesfile:
          scanobjs_cmd = ['gtkdoc-scangobj'] + scanobjs_args + ['--types=' + gobject_typesfile,
                                                                '--module=' + module,
@@ -100,7 +101,7 @@ index 4406b28..b846827 100644
                                                                '--cflags=' + cflags,
                                                                '--ldflags=' + ldflags,
                                                                '--ld=' + ld]
-@@ -207,6 +211,7 @@ def run(args):
+@@ -219,6 +223,7 @@ def run(args):
          mkdbargs,
          options.gobject_typesfile,
          scanobjsargs,
@@ -108,6 +109,3 @@ index 4406b28..b846827 100644
          options.ld,
          options.cc,
          options.ldflags,
--- 
-2.15.0
-
diff --git a/meta/recipes-devtools/meson/meson_0.44.1.bb b/meta/recipes-devtools/meson/meson_0.45.1.bb
similarity index 83%
rename from meta/recipes-devtools/meson/meson_0.44.1.bb
rename to meta/recipes-devtools/meson/meson_0.45.1.bb
index 6a81dab2650..9decdd0c24c 100644
--- a/meta/recipes-devtools/meson/meson_0.44.1.bb
+++ b/meta/recipes-devtools/meson/meson_0.45.1.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/${BP}.tar
            file://0001-Linker-rules-move-cross_args-in-front-of-output_args.patch \
            file://0003-native_bindir.patch \
            "
-SRC_URI[md5sum] = "82b1198bf714b5a4da84bfe8376c79cc"
-SRC_URI[sha256sum] = "2ea1a721574adb23160b6481191bcc1173f374e02b0ff3bb0ae85d988d97e4fa"
+SRC_URI[md5sum] = "4d9c7b3a7365b7b472f00af14e034949"
+SRC_URI[sha256sum] = "4d0bb0dbb1bb556cb7a4092fdfea3d6e76606bd739a4bc97481c2d7bc6200afb"
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 
 inherit setuptools3
-- 
2.16.1



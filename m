Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555E5EDF163
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 13:23:13 +0000 (UTC)
Received: from smtp-8fab.mail.infomaniak.ch (smtp-8fab.mail.infomaniak.ch [83.166.143.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71255.1770988986243828291
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 05:23:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=P6kcpEhE;
 spf=pass (domain: 0leil.net, ip: 83.166.143.171, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fCCXS3ph6z5pK;
	Fri, 13 Feb 2026 14:23:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1770988984;
	bh=K2N7zn0ilvYq9eFtb2YIuUDSYtMJ8D7d261LdYdF+Fc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P6kcpEhEjfsbdhA0VcXgpKmJDT8HDME3jzca02jjSMh4epqmplqpqzTb6d/RYR7VL
	 uLTO+gDGZmWv0DOuYGfgOqg6m4yfhT4NoxDtlPeRnLEYOeHgBNz4UIWYBOSP3243Qv
	 mUmySy85e/ecATTr2G0yuSS1lMoCIv9JbPCOcBKVjoZL9e4D4654tQDXMGZgPJy1Uc
	 6VR27Mnd/fA/7qaJREFixTUIiXpmGKTHUQx5YLRkEdC5UqWpDM7Tjh2ARzcwio/gmq
	 eRTn7XS53XKiAfD0Jd+h3GMOFapuabTvxoUFbdx+BaRpfA785NLX1Sku9kK7HfroNq
	 H3rT5oqkYcIQg==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4fCCXS0wVXzr90;
	Fri, 13 Feb 2026 14:23:04 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 13 Feb 2026 14:22:55 +0100
Subject: [PATCH 2/2] mesa: upgrade 25.3.5 -> 26.0.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-mesa-26-v1-2-9e925e474091@cherry.de>
References: <20260213-mesa-26-v1-0-9e925e474091@cherry.de>
In-Reply-To: <20260213-mesa-26-v1-0-9e925e474091@cherry.de>
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 13:23:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231117

From: Quentin Schulz <quentin.schulz@cherry.de>

See https://docs.mesa3d.org/relnotes/26.0.0.html for the changelog and
sha256sum.

This removes:
- 0001-ethosu-drop-file-names-from-the-generated-file.patch, as it is
  merged in commit cdb6468c53ef ("ethosu: drop file names from the
  generated file"),
- 0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch, as it
  is merged in commit 4315c28739dc ("gfxstream: don't dump genvk.py args
  to generated files"),
- 0002-rocket-drop-file-names-from-the-generated-file.patch, as it is
  merged in commit 7a3bfd1f7913 ("rocket: drop file names from the
  generated file"),

0001-freedreno-don-t-encode-build-path-into-binaries.patch is updated to
latest version in the merge request. Unfortunately, the do_patch task
with the patch file directly downloaded from the merge request fails to
apply it due to patch-fuzz. Instead, I downloaded the file locally and
applied it with git-am and use git-format-patch to generate one that
do_patch doesn't complain about.

Since commit b72d347d1c3b ("meson: crocus and intel_hasvk now require
clc"), both crocus and intel_hasvk require clc, so let's make this
dependency explicit by requiring libclc PACKAGECONFIG to enable those
drivers.

KosmicKrisp is a new driver but my understanding is it's for MacOS only
and we're not generated that OS, so skip adding a PACKAGECONFIG for it.

r600 now doesn't require LLVM anymore since commit ebf14544102e ("r600:
remove LLVM dependency") but for some reason we never added the
dependency so no need to remove something that isn't there.

There's a new option vulkan-manifest-per-architecture (default true)
which controls whether the target machine architecture must be part of
the Vulkan ICD filenames. The meson feature description states:

If false, all architectures share a single JSON manifest for example
lvp_icd.json, referencing the library by its basename. (Recommended for
Unix OS distros installing into /usr.)

Considering we install the Vulkan ICDs into /usr/share, let's make this
false by default. Also, we're only building for one architecture so this
probably doesn't change much except renaming.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 ...u-drop-file-names-from-the-generated-file.patch |  45 ---------
 ...eno-don-t-encode-build-path-into-binaries.patch | 107 +++++++--------------
 ...on-t-dump-genvk.py-args-to-generated-file.patch |  36 -------
 ...t-drop-file-names-from-the-generated-file.patch |  45 ---------
 meta/recipes-graphics/mesa/mesa.inc                |  12 +--
 5 files changed, 41 insertions(+), 204 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-ethosu-drop-file-names-from-the-generated-file.patch b/meta/recipes-graphics/mesa/files/0001-ethosu-drop-file-names-from-the-generated-file.patch
deleted file mode 100644
index aab17384d2..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-ethosu-drop-file-names-from-the-generated-file.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 4c3fad710c5bc702e28ae2bcc3c73b0547c4954d Mon Sep 17 00:00:00 2001
-From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Date: Wed, 19 Nov 2025 14:19:36 +0200
-Subject: [PATCH 1/2] ethosu: drop file names from the generated file
-
-Having file names and dates in the generated file affects
-reproducibility. Build systems (like OE) error out on the gen_header.py
-output, because it can contain full paths. Drop file list from the
-generated file.
-
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/cdb6468c53ef486f237f3d3276013febbbabba14]
----
- src/gallium/drivers/ethosu/gen_header.py | 12 ------------
- 1 file changed, 12 deletions(-)
-
-diff --git a/src/gallium/drivers/ethosu/gen_header.py b/src/gallium/drivers/ethosu/gen_header.py
-index b54516a812c7..44471893594b 100644
---- a/src/gallium/drivers/ethosu/gen_header.py
-+++ b/src/gallium/drivers/ethosu/gen_header.py
-@@ -29,21 +29,9 @@ def dump_c(args, guard, func):
- This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
- http://gitlab.freedesktop.org/mesa/mesa/
- git clone https://gitlab.freedesktop.org/mesa/mesa.git
--
--The rules-ng-ng source files this header was generated from are:
- """)
--	maxlen = 0
--	for filepath in p.xml_files:
--		maxlen = max(maxlen, len(filepath))
--	for filepath in p.xml_files:
--		pad = " " * (maxlen - len(filepath))
--		filesize = str(os.path.getsize(filepath))
--		filesize = " " * (7 - len(filesize)) + filesize
--		filetime = time.ctime(os.path.getmtime(filepath))
--		print("- " + filepath + pad + " (" + filesize + " bytes, from " + filetime + ")")
- 	if p.copyright_year:
- 		current_year = str(datetime.date.today().year)
--		print()
- 		print("Copyright (C) %s-%s by the following authors:" % (p.copyright_year, current_year))
- 		for author in p.authors:
- 			print("- " + author)
--- 
-2.51.0
-
diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
index 6948abe439..4d36e68a58 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
@@ -1,89 +1,54 @@
-From 027ac36756cc75eea9ed4fee135a351af30b35fd Mon Sep 17 00:00:00 2001
-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-Date: Tue, 16 Jul 2024 12:32:47 +0300
+From 8299fe0615638dc88694f08b95a62e9dd3943a6f Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Wed, 10 Dec 2025 02:27:16 +0200
 Subject: [PATCH] freedreno: don't encode build path into binaries
 
 Encoding build-specific path into installed binaries is generally
 frowned upon. It harms the reproducibility of the build and e.g.
 OpenEmbedded now considers that to be an error.
 
-Instead of hardcoding rnn_src_path into the RNN_DEF_PATH define specify
-it manually when running the tests.
+Instead of hardcoding rnn_src_path into the RNN_DEF_PATH, use the
+relative path when running the build / test.
 
+Additionaly make sure that RNN_PATH is set correctly when running `meson
+devenv` in order to allow developers to call tools without installing
+XML files to the target system.
+
+Suggested-by: Rob Clark <rob.clark@oss.qualcomm.com>
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30206]
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+[locally generated patch after git am'ing it to remove fuzz]
+Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
 ---
- src/freedreno/afuc/meson.build   | 4 ++++
- src/freedreno/decode/meson.build | 4 +++-
- src/freedreno/meson.build        | 2 +-
- 3 files changed, 8 insertions(+), 2 deletions(-)
+ src/freedreno/meson.build           | 5 +++--
+ src/freedreno/registers/meson.build | 2 ++
+ 2 files changed, 5 insertions(+), 2 deletions(-)
 
-diff --git a/src/freedreno/afuc/meson.build b/src/freedreno/afuc/meson.build
-index bb7cebf5a748..351cc31ef2de 100644
---- a/src/freedreno/afuc/meson.build
-+++ b/src/freedreno/afuc/meson.build
-@@ -56,10 +56,12 @@ if with_tests
-   asm_fw = custom_target('afuc_test.fw',
-     output: 'afuc_test.fw',
-     command: [asm, files('../tests/traces/afuc_test.asm'), '@OUTPUT@'],
-+    env: {'RNN_PATH': rnn_src_path},
-   )
-   asm_fw_a7xx = custom_target('afuc_test_a7xx.fw',
-     output: 'afuc_test_a7xx.fw',
-     command: [asm, files('../tests/traces/afuc_test_a7xx.asm'), '@OUTPUT@'],
-+    env: {'RNN_PATH': rnn_src_path},
-   )
-   test('afuc-asm',
-     diff,
-@@ -120,11 +122,13 @@ if cc.sizeof('size_t') > 4
-     disasm_fw = custom_target('afuc_test.asm',
-       output: 'afuc_test.asm',
-       command: [disasm, '-u', files('../tests/reference/afuc_test.fw')],
-+      env: {'RNN_PATH': rnn_src_path},
-       capture: true
-     )
-     disasm_fw_a7xx = custom_target('afuc_test_a7xx.asm',
-       output: 'afuc_test_a7xx.asm',
-       command: [disasm, '-u', files('../tests/reference/afuc_test_a7xx.fw')],
-+      env: {'RNN_PATH': rnn_src_path},
-       capture: true
-     )
-     test('afuc-disasm',
-diff --git a/src/freedreno/decode/meson.build b/src/freedreno/decode/meson.build
-index 469eeb4eb597..dfa1c12d0d9f 100644
---- a/src/freedreno/decode/meson.build
-+++ b/src/freedreno/decode/meson.build
-@@ -194,6 +194,7 @@ if dep_lua.found() and dep_libarchive.found()
-       log = custom_target(name + '.log',
-         output: name + '.log',
-         command: [cffdump, '--unit-test', args, files('../tests/traces/' + name + '.rd.gz')],
-+        env: {'RNN_PATH': rnn_src_path},
-         capture: true,
-       )
-       test('cffdump-' + name,
-@@ -247,7 +248,8 @@ if with_tests
-       output: name + '.log',
-       command: [crashdec, args, files('../tests/traces/' + name + '.devcore')],
-       capture: true,
--      env: {'GALLIUM_DUMP_CPU': 'false'},
-+      env: {'GALLIUM_DUMP_CPU': 'false',
-+            'RNN_PATH': rnn_src_path},
-     )
- 
-     test('crashdec-' + name,
 diff --git a/src/freedreno/meson.build b/src/freedreno/meson.build
-index 98e49b8fcf0e..145e72597eb9 100644
+index a4bfd337179..330b6468d01 100644
 --- a/src/freedreno/meson.build
 +++ b/src/freedreno/meson.build
-@@ -6,7 +6,7 @@ inc_freedreno_rnn = include_directories('rnn')
+@@ -4,9 +4,10 @@
+ inc_freedreno = include_directories(['.', './registers', './registers/adreno', './common'])
+ inc_freedreno_rnn = include_directories('rnn')
  
- rnn_src_path = dir_source_root + '/src/freedreno/registers'
+-rnn_src_path = dir_source_root + '/src/freedreno/registers'
++rnn_rel_path = 'src/freedreno/registers'
++rnn_src_path = dir_source_root + '/' + rnn_rel_path
  rnn_install_path = get_option('datadir') + '/freedreno/registers'
 -rnn_path = rnn_src_path + ':' + get_option('prefix') + '/' + rnn_install_path
-+rnn_path = get_option('prefix') + '/' + rnn_install_path
++rnn_path = rnn_rel_path + ':' + get_option('prefix') + '/' + rnn_install_path
  
- dep_libarchive = dependency('libarchive', allow_fallback: true, required: false)
+ dep_libarchive = dependency('libarchive', allow_fallback: true, required: false, disabler : true)
  dep_libxml2 = dependency('libxml-2.0', allow_fallback: true, required: false)
----
-2.39.2
-
+diff --git a/src/freedreno/registers/meson.build b/src/freedreno/registers/meson.build
+index f4be68117c3..cd0caafa431 100644
+--- a/src/freedreno/registers/meson.build
++++ b/src/freedreno/registers/meson.build
+@@ -43,4 +43,6 @@ if install_fd_decode_tools
+   endforeach
+ endif
+ 
++devenv.set('RNN_PATH', meson.current_source_dir())
++
+ subdir('adreno')
diff --git a/meta/recipes-graphics/mesa/files/0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch b/meta/recipes-graphics/mesa/files/0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch
deleted file mode 100644
index df4db15559..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 4315c28739dcade156ac9384c99ba552b6d85b40 Mon Sep 17 00:00:00 2001
-From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Date: Wed, 19 Nov 2025 11:36:42 +0200
-Subject: [PATCH] gfxstream: don't dump genvk.py args to generated files
-
-Full command lines include full path to the output file, which triggers
-reproducibility warnings (e.g. in Yocto builds). Drop the args and print
-only a basename of the script used to generate the file.
-
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/38875>
-Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/4315c28739dcade156ac9384c99ba552b6d85b40]
-Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
----
- src/gfxstream/codegen/scripts/cerealgenerator.py | 8 +-------
- 1 file changed, 1 insertion(+), 7 deletions(-)
-
-diff --git a/src/gfxstream/codegen/scripts/cerealgenerator.py b/src/gfxstream/codegen/scripts/cerealgenerator.py
-index a171af83641..5e34ea64bd1 100644
---- a/src/gfxstream/codegen/scripts/cerealgenerator.py
-+++ b/src/gfxstream/codegen/scripts/cerealgenerator.py
-@@ -285,13 +285,7 @@ def banner_command(argv):
-        Return a string corresponding to the command, with platform-specific
-        paths removed."""
- 
--    def makePosixRelative(someArg):
--        # Do not use relative for /tmp/ to avoid effects of checkout location
--        if os.path.exists(someArg) and someArg != "/tmp/":
--            return str(PurePosixPath(Path(os.path.relpath(someArg))))
--        return someArg
--
--    return ' '.join(map(makePosixRelative, argv))
-+    return os.path.basename(argv[0])
- 
- def envGetOrDefault(key, default=None):
-     if key in os.environ:
diff --git a/meta/recipes-graphics/mesa/files/0002-rocket-drop-file-names-from-the-generated-file.patch b/meta/recipes-graphics/mesa/files/0002-rocket-drop-file-names-from-the-generated-file.patch
deleted file mode 100644
index 3e9edc411f..0000000000
--- a/meta/recipes-graphics/mesa/files/0002-rocket-drop-file-names-from-the-generated-file.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From d5462c852d30fc41a223730848550db4f9675517 Mon Sep 17 00:00:00 2001
-From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Date: Wed, 19 Nov 2025 14:19:36 +0200
-Subject: [PATCH 2/2] rocket: drop file names from the generated file
-
-Having file names and dates in the generated file affects
-reproducibility. Build systems (like OE) error out on the gen_header.py
-output, because it can contain full paths. Drop file list from the
-generated file.
-
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/7a3bfd1f7913819db315e6db8b42520a2d862690]
----
- src/gallium/drivers/rocket/gen_header.py | 12 ------------
- 1 file changed, 12 deletions(-)
-
-diff --git a/src/gallium/drivers/rocket/gen_header.py b/src/gallium/drivers/rocket/gen_header.py
-index f3c6615dcb42..5457ef71d595 100644
---- a/src/gallium/drivers/rocket/gen_header.py
-+++ b/src/gallium/drivers/rocket/gen_header.py
-@@ -29,21 +29,9 @@ def dump_c(args, guard, func):
- This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
- http://gitlab.freedesktop.org/mesa/mesa/
- git clone https://gitlab.freedesktop.org/mesa/mesa.git
--
--The rules-ng-ng source files this header was generated from are:
- """)
--	maxlen = 0
--	for filepath in p.xml_files:
--		maxlen = max(maxlen, len(filepath))
--	for filepath in p.xml_files:
--		pad = " " * (maxlen - len(filepath))
--		filesize = str(os.path.getsize(filepath))
--		filesize = " " * (7 - len(filesize)) + filesize
--		filetime = time.ctime(os.path.getmtime(filepath))
--		print("- " + filepath + pad + " (" + filesize + " bytes, from " + filetime + ")")
- 	if p.copyright_year:
- 		current_year = str(datetime.date.today().year)
--		print()
- 		print("Copyright (C) %s-%s by the following authors:" % (p.copyright_year, current_year))
- 		for author in p.authors:
- 			print("- " + author)
--- 
-2.51.0
-
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 0ee4dd926f..82e02e5f91 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,13 +17,10 @@ PE = "2"
 SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
-           file://0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch \
-           file://0001-ethosu-drop-file-names-from-the-generated-file.patch \
-           file://0002-rocket-drop-file-names-from-the-generated-file.patch \
 "
 
-SRC_URI[sha256sum] = "be472413475082df945e0f9be34f5af008baa03eb357e067ce5a611a2d44c44b"
-PV = "25.3.5"
+SRC_URI[sha256sum] = "2a44e98e64d5c36cec64633de2d0ec7eff64703ee25b35364ba8fcaa84f33f72"
+PV = "26.0.0"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
@@ -69,6 +66,7 @@ MESON_BUILDTYPE = "${@check_buildtype(d)}"
 EXTRA_OEMESON = " \
     -Dglx-read-only-text=true \
     -Dplatforms='${@",".join("${PLATFORMS}".split())}' \
+    -Dvulkan-manifest-per-architecture=false \
 "
 
 def strip_comma(s):
@@ -141,7 +139,7 @@ VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedren
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virtio', ',gfxstream', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',intel', '', d)}"
-VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',intel_hasvk', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc', ',intel_hasvk', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${VULKAN_DRIVERS_SWRAST}', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virtio', '${VULKAN_DRIVERS_VIRTIO}', '', d)}"
@@ -178,7 +176,7 @@ GALLIUMDRIVERS_SOFTPIPE:x86-x32 = ""
 # keep sorted by the driver name (rather than PKGCONFIG)
 GALLIUMDRIVERS = ""
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-llvm', ',asahi', '', d)}"
-GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',crocus', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc', ',crocus', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'ethosu', ',ethosu', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"

-- 
2.53.0



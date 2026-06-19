Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C3BCDB476
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 08:33:23 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38262.1781858000606644506
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 01:33:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iH5Mai0N;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-462342ac290so2104636f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 01:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781857999; x=1782462799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVy8GPABlrjlD+iZWF7C5l/VLEX+Ohtlv65sudnGGcI=;
        b=iH5Mai0N0Va9XYSe3ebTUr0GjA70fHdVyOLLpC1WC6RdX8VBvO4I9odZLSl2ExyawG
         d6PoYayxSDw3xbqv/Ln3BLKY4KNSTeQ65oOAS6SSOrP1m4K4k/VV/SRLLn35bUZAZlHN
         xQtCJGiyOlBBkX8ZqRjx/+bF7DdjgUZqcE10TxruG2AsFxpPaI2PimFJj+5/AmPFW/gV
         m7R27m1fqphBxDaceltY1FEfnNeLAcKT9cGTt8Myr/4lqwUtObd+DzfqDaQ/yAO7ePxn
         SNUQ66PkJe3+84gnZD0HSSqPpCZocPNCFFMaPIXCFayqgMCNbl4nuNKj4fGiCT5jh39Y
         VZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857999; x=1782462799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rVy8GPABlrjlD+iZWF7C5l/VLEX+Ohtlv65sudnGGcI=;
        b=ICkgMkJy5zFC7eLKlHCKFGYjVMfl+sR175B4GUU3/fKjf4bUUi/GDkJfoah24icA48
         yQl3/CEmFvnMs7CgrbshH2YELdVhwjXXoRAaoJnCIdpc9vr2NMYMOwMBMksShWXrKq1b
         wGtTGyXBKjdwntFKXI4+2FTtqdojJxb3ACaLhmBYU3ZaGp8gRcfg1WW4Vg1ijN2CjUTS
         Rfb1QpuKmxoc04LpgxmbfugRSOvmLHxiXnWHml5RlJC5sVrySg7JGe5kWUvmFu5MH6Am
         SrWlsnkNMGJqhXboP8glz1/f398R/di9LDg1/Iio/5ranoz+xXad91dOEEYamnHo2zfO
         C+dQ==
X-Gm-Message-State: AOJu0YxhcNRQHvDxHOsmMZKeRQ6T4lm2Q8PmXt5rdDrn/ORIBIALRwJn
	HpO+M2TD/fmnBz3u3AMvmjmaPnf8G3sMWJmzxqODUKhZSukt8Zpt298vaIvBvQvX
X-Gm-Gg: AfdE7ckqgJCnLLkTILezAlKZiuWo2P5+r6rTZ7JL4bCmbHDYs/yCz/e/X8cBZBH3CzE
	6CzVtRWwf8KIUa+y2BeFZvSIQlZWTACnFWRFQ0on40q6F6DEJru/BImEBgTvgG995vqFWGJfI0+
	j7LvlxegpoTIjIQ0iPAwPYi/jYMKT47QxyGvKFYB7rd1e36aCaxCNxocaledxF0ZB8ORsVHFlhv
	MYU4eSvHuTPNUhEvH7VIqTAXM+FD0ZE7R8tHUFJth4L+LHF0BpNuTiQxCWXl/u05gswMxvjN0t7
	nTWfHKD2QgrT8mWpnE2BcztpZBjrCMkinm9PrKAOQA1oQ7nn1vh8hJ79/ee97/DA5VMNgAVeUW+
	JIo/2PwSuhdTvhBeLFVTJS4JugLEQz41v0QCbE/on5LGN1iXof1lDs3PWT6Vm7dFAqk12B+cRVv
	CzgXJuO5A23Lw6T7G9gOPSTJexKjc+SAhaz569ip9BOlC0Haiz
X-Received: by 2002:a05:6000:41c6:b0:45e:de0a:1773 with SMTP id ffacd0b85a97d-4656e9ae04fmr2344682f8f.33.1781857998447;
        Fri, 19 Jun 2026 01:33:18 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc429a1sm5878368f8f.30.2026.06.19.01.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 01:33:18 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/15] librsvg: upgrade: 2.62.2 -> 2.62.3
Date: Fri, 19 Jun 2026 10:32:55 +0200
Message-ID: <20260619083305.3505156-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619083305.3505156-1-alex.kanavin@gmail.com>
References: <20260619083305.3505156-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 08:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239148

From: Alexander Kanavin <alex@linutronix.de>

Drop patch merged upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-gnome/librsvg/librsvg-crates.inc |   8 +-
 ...append-RUSTFLAGS-to-rustc-executable.patch |   2 +-
 ...e-care-of-deprecated-assert_cmd-Comm.patch |   2 +-
 .../librsvg/librsvg/cross-query-loaders.patch | 169 ------------------
 .../{librsvg_2.62.2.bb => librsvg_2.62.3.bb}  |   3 +-
 5 files changed, 7 insertions(+), 177 deletions(-)
 delete mode 100644 meta/recipes-gnome/librsvg/librsvg/cross-query-loaders.patch
 rename meta/recipes-gnome/librsvg/{librsvg_2.62.2.bb => librsvg_2.62.3.bb} (97%)

diff --git a/meta/recipes-gnome/librsvg/librsvg-crates.inc b/meta/recipes-gnome/librsvg/librsvg-crates.inc
index dfa96e28b1..c6db9dc0bb 100644
--- a/meta/recipes-gnome/librsvg/librsvg-crates.inc
+++ b/meta/recipes-gnome/librsvg/librsvg-crates.inc
@@ -235,8 +235,8 @@ SRC_URI += " \
     crate://crates.io/quick-error/2.0.1 \
     crate://crates.io/quote/1.0.44 \
     crate://crates.io/r-efi/5.3.0 \
-    crate://crates.io/rand/0.8.5 \
-    crate://crates.io/rand/0.9.2 \
+    crate://crates.io/rand/0.8.6 \
+    crate://crates.io/rand/0.9.4 \
     crate://crates.io/rand_chacha/0.9.0 \
     crate://crates.io/rand_core/0.6.4 \
     crate://crates.io/rand_core/0.9.5 \
@@ -589,8 +589,8 @@ SRC_URI[quick-error-1.2.3.sha256sum] = "a1d01941d82fa2ab50be1e79e6714289dd7cde78
 SRC_URI[quick-error-2.0.1.sha256sum] = "a993555f31e5a609f617c12db6250dedcac1b0a85076912c436e6fc9b2c8e6a3"
 SRC_URI[quote-1.0.44.sha256sum] = "21b2ebcf727b7760c461f091f9f0f539b77b8e87f2fd88131e7f1b433b3cece4"
 SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
-SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
-SRC_URI[rand-0.9.2.sha256sum] = "6db2770f06117d490610c7488547d543617b21bfa07796d7a12f6f1bd53850d1"
+SRC_URI[rand-0.8.6.sha256sum] = "5ca0ecfa931c29007047d1bc58e623ab12e5590e8c7cc53200d5202b69266d8a"
+SRC_URI[rand-0.9.4.sha256sum] = "44c5af06bb1b7d3216d91932aed5265164bf384dc89cd6ba05cf59a35f5f76ea"
 SRC_URI[rand_chacha-0.9.0.sha256sum] = "d3022b5f1df60f26e1ffddd6c66e8aa15de382ae63b3a0c1bfc0e4d3e3f325cb"
 SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
 SRC_URI[rand_core-0.9.5.sha256sum] = "76afc826de14238e6e8c374ddcc1fa19e374fd8dd986b0d2af0d02377261d83c"
diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-query-rustc-append-RUSTFLAGS-to-rustc-executable.patch b/meta/recipes-gnome/librsvg/librsvg/0001-query-rustc-append-RUSTFLAGS-to-rustc-executable.patch
index a3596fc288..1c02edad38 100644
--- a/meta/recipes-gnome/librsvg/librsvg/0001-query-rustc-append-RUSTFLAGS-to-rustc-executable.patch
+++ b/meta/recipes-gnome/librsvg/librsvg/0001-query-rustc-append-RUSTFLAGS-to-rustc-executable.patch
@@ -1,4 +1,4 @@
-From e89982e61e50c7d25d563f2fa0481f9bba481f04 Mon Sep 17 00:00:00 2001
+From 2becfbb5964754f7c3f1ff90f9447d84093ba986 Mon Sep 17 00:00:00 2001
 From: Gyorgy Sarvari <skandigraun@gmail.com>
 Date: Sat, 2 Aug 2025 20:57:49 +0200
 Subject: [PATCH] query-rustc: append RUSTFLAGS to rustc executable
diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-tests-revert-Take-care-of-deprecated-assert_cmd-Comm.patch b/meta/recipes-gnome/librsvg/librsvg/0001-tests-revert-Take-care-of-deprecated-assert_cmd-Comm.patch
index 85ae52c62f..05e0e0f857 100644
--- a/meta/recipes-gnome/librsvg/librsvg/0001-tests-revert-Take-care-of-deprecated-assert_cmd-Comm.patch
+++ b/meta/recipes-gnome/librsvg/librsvg/0001-tests-revert-Take-care-of-deprecated-assert_cmd-Comm.patch
@@ -1,4 +1,4 @@
-From bc089af8ce38ad268bc4283040ec28241c5064a6 Mon Sep 17 00:00:00 2001
+From 095e3c67c5e6b410098eb8d86878ec411d00fa0b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 18 Dec 2025 18:43:20 +0100
 Subject: [PATCH] tests: revert 'Take care of deprecated
diff --git a/meta/recipes-gnome/librsvg/librsvg/cross-query-loaders.patch b/meta/recipes-gnome/librsvg/librsvg/cross-query-loaders.patch
deleted file mode 100644
index dff36aadb3..0000000000
--- a/meta/recipes-gnome/librsvg/librsvg/cross-query-loaders.patch
+++ /dev/null
@@ -1,169 +0,0 @@
-From e46317a80e9d37d7b9c4cbf43ff1d60c3ac21fff Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Mon, 11 May 2026 12:34:53 +0100
-Subject: [PATCH 1/2] gdk-pixbuf-loader/meson_install: improve argument parsing
- and logic
-
-Make the arguments more explicit by changing the path arguments to be
-specified with options, such as --queryloaders <path>. Previously one of
-the paths had an option, but the others were order-based.
-
-Check that either all of the paths have been set or --show-cross-message
-has been passed. If this is not the case, print the usage and exit.
-
-Clean up Path usage, as the options are using pathlib.Path types in the
-parser another Path instance does not need to be created.
-
-None of this changes the underlying logic, just makes it more consistent
-and explicit.
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/librsvg/-/merge_requests/1194]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- gdk-pixbuf-loader/meson.build      |  4 +++-
- gdk-pixbuf-loader/meson_install.py | 23 +++++++++++------------
- 2 files changed, 14 insertions(+), 13 deletions(-)
-
-diff --git a/gdk-pixbuf-loader/meson.build b/gdk-pixbuf-loader/meson.build
-index 951d2d1c9..c7c017978 100644
---- a/gdk-pixbuf-loader/meson.build
-+++ b/gdk-pixbuf-loader/meson.build
-@@ -43,9 +43,11 @@ else
- endif
- 
- pixbufloader_svg_install_args = [
--  '--gdk-pixbuf-moduledir',
-+  '--moduledir',
-   pixbuf_dep.get_variable(pkgconfig: 'gdk_pixbuf_moduledir', pkgconfig_define: ['prefix', prefix]),
-+  '--queryloaders',
-   gdk_pixbuf_query_loaders,
-+  '--cache-file',
-   pixbuf_dep.get_variable(pkgconfig: 'gdk_pixbuf_cache_file', pkgconfig_define: ['prefix', prefix])
- ]
- 
-diff --git a/gdk-pixbuf-loader/meson_install.py b/gdk-pixbuf-loader/meson_install.py
-index ff003350f..d9bbbe433 100644
---- a/gdk-pixbuf-loader/meson_install.py
-+++ b/gdk-pixbuf-loader/meson_install.py
-@@ -6,29 +6,28 @@ import os
- import subprocess
- import sys
- 
--argparse = ArgumentParser('Deploy loaders.cache')
--
--argparse.add_argument('--gdk-pixbuf-moduledir', type=Path)
--argparse.add_argument('gdk_pixbuf_queryloaders', type=Path)
--argparse.add_argument('gdk_pixbuf_cache_file', type=Path)
--argparse.add_argument('--show-cross-message', action='store_true')
--
- if __name__ == '__main__':
-+    argparse = ArgumentParser(description='Deploy loaders.cache. Pass required paths, or --show-cross-message.')
-+    argparse.add_argument('--queryloaders', type=Path, metavar="PATH", help="gdk-pixbuf-queryloaders to run")
-+    argparse.add_argument('--moduledir', type=Path, metavar="PATH", help="installed gdk-pixbuf module directory")
-+    argparse.add_argument('--cache-file', type=Path, metavar="PATH", help="module cache file to write")
-+    argparse.add_argument('--show-cross-message', action='store_true', help="tell the user to run query-loaders manually")
-     args = argparse.parse_args()
- 
--    cache_file: Path = args.gdk_pixbuf_cache_file
-+    if not(args.show_cross_message or (args.queryloaders and args.moduledir and args.cache_file)):
-+        argparse.print_help()
-+        sys.exit(1)
- 
-     if args.show_cross_message or os.environ.get("DESTDIR"):
-         print('*** Note: Please run gdk-pixbuf-queryloaders manually ' +
-               'against the newly-built gdkpixbuf-svg loader', file=sys.stderr)
-     else:
-         env = os.environ.copy()
--        env['GDK_PIXBUF_MODULEDIR'] = Path(args.gdk_pixbuf_moduledir).as_posix()
--        with cache_file.open('w', encoding='utf-8') as f:
-+        env['GDK_PIXBUF_MODULEDIR'] = args.moduledir.as_posix()
-+        with args.cache_file.open('w', encoding='utf-8') as f:
-             subprocess.run(
--                [Path(args.gdk_pixbuf_queryloaders).as_posix()],
-+                [args.queryloaders.as_posix()],
-                 env=env,
-                 stdout=f,
-                 check=True
-             )
--
--- 
-2.43.0
-
-
-From 85e11b2c1c6b2a27949a0e3e883c01e4b48060e0 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Mon, 11 May 2026 12:46:08 +0100
-Subject: [PATCH 2/2] gdk-pixbuf-loader: fix install logic in cross builds
-
-The logic in this install rule was getting complicated, but it should be
-quite simple really:
-
-- In native builds we can run host binaries.  Look for the
-  gdk-pixbuf-query-loaders tool and run it when installing.
-- In cross builds we might be able to run host binaries, if an executable
-  wrapper has been set _and_ if the target sysroot contains executables.
-
-The presence of target executables isn't a given, as some systems (such
-as OpenEmbedded) strip the target sysroot down to headers are libraries.
-
-So the logic should be:
-
-- In native builds, look for query-loaders and fail if not found.
-- In cross builds where you can run host binaries, look for query-loaders
-  but allow it to be missing.
-- In cross builds where you cannot run host binaries, there's no use in
-  looking for query-loaders.
-
-Then either pass the paths or --show-cross-message to meson_install.py,
-depending on whether query-loaders was found or not.
-
-This fixes the case where Meson can run host executables, but the target
-sysroot does not actually contain gdk-pixbuf-query-loaders.
----
- gdk-pixbuf-loader/meson.build | 28 +++++++++++++---------------
- 1 file changed, 13 insertions(+), 15 deletions(-)
-
-diff --git a/gdk-pixbuf-loader/meson.build b/gdk-pixbuf-loader/meson.build
-index c7c017978..4f88ba037 100644
---- a/gdk-pixbuf-loader/meson.build
-+++ b/gdk-pixbuf-loader/meson.build
-@@ -37,23 +37,21 @@ pixbuf_thumbnailer = configure_file(
- )
- 
- if meson.can_run_host_binaries()
--  gdk_pixbuf_query_loaders = find_program(pixbuf_dep.get_variable(pkgconfig: 'gdk_pixbuf_query_loaders', default_value: 'gdk-pixbuf-query-loaders')).path()
--else
--  gdk_pixbuf_query_loaders = pixbuf_dep.get_variable(pkgconfig: 'gdk_pixbuf_query_loaders', pkgconfig_define: ['prefix', prefix])
-+  gdk_pixbuf_query_loaders = find_program(pixbuf_dep.get_variable(pkgconfig: 'gdk_pixbuf_query_loaders', default_value: 'gdk-pixbuf-query-loaders'), required: not meson.is_cross_build())
- endif
- 
--pixbufloader_svg_install_args = [
--  '--moduledir',
--  pixbuf_dep.get_variable(pkgconfig: 'gdk_pixbuf_moduledir', pkgconfig_define: ['prefix', prefix]),
--  '--queryloaders',
--  gdk_pixbuf_query_loaders,
--  '--cache-file',
--  pixbuf_dep.get_variable(pkgconfig: 'gdk_pixbuf_cache_file', pkgconfig_define: ['prefix', prefix])
--]
--
--# Tell people to run gdk-pixbuf-query-loaders manually for cross builds
--if not meson.can_run_host_binaries()
--  pixbufloader_svg_install_args += '--show-cross-message'
-+if meson.can_run_host_binaries() and gdk_pixbuf_query_loaders.found()
-+  pixbufloader_svg_install_args = [
-+    '--moduledir',
-+    pixbuf_dep.get_variable(pkgconfig: 'gdk_pixbuf_moduledir', pkgconfig_define: ['prefix', prefix]),
-+    '--queryloaders',
-+    gdk_pixbuf_query_loaders.full_path(),
-+    '--cache-file',
-+    pixbuf_dep.get_variable(pkgconfig: 'gdk_pixbuf_cache_file', pkgconfig_define: ['prefix', prefix])
-+  ]
-+else
-+  # Tell people to run gdk-pixbuf-query-loaders manually for cross builds
-+  pixbufloader_svg_install_args = ['--show-cross-message']
- endif
- 
- meson.add_install_script(
--- 
-2.43.0
-
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.62.2.bb b/meta/recipes-gnome/librsvg/librsvg_2.62.3.bb
similarity index 97%
rename from meta/recipes-gnome/librsvg/librsvg_2.62.2.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.62.3.bb
index 8c2623468d..b54371a194 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.62.2.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.62.3.bb
@@ -25,9 +25,8 @@ require ${BPN}-crates.inc
 
 SRC_URI += "file://0001-query-rustc-append-RUSTFLAGS-to-rustc-executable.patch \
             file://0001-tests-revert-Take-care-of-deprecated-assert_cmd-Comm.patch \
-            file://cross-query-loaders.patch \
             file://run-ptest"
-SRC_URI[archive.sha256sum] = "c0c1367e381e1ae4842a78f1b57c656ff19b25637e3a6527cb44ae5a1cc68d65"
+SRC_URI[archive.sha256sum] = "7eb449b2722a768021356f66dfee3202c229b54ed4e6a70ce40c090e97ff16f2"
 
 UPSTREAM_CHECK_REGEX = "librsvg-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.47.3



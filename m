Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC38C10F1B
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 22:43:24 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.4585.1670539399832015754
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 14:43:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=vw3icL68;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id y4so2991899plb.2
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 14:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZDobzW2H7yWG2aStgDge3AS98VMniogn18KVHxZJdU=;
        b=vw3icL68y2KUvcJ5zNl+JPI0M0ApXKMQi7IdCT2iLAkBVgNe981wvM5Vkgj1fujsED
         ae9BDXbZJoumcv+/9A2AZaGgjq1Pza9DIm1VWZOtSSSARkQWxulckrRgSnYc6gRxPfDx
         A8m7Nf8UviUr+ywNEivbXOfOBIJk84VSkA0BgMTcXOZ5WpilWndiu/aMue4fficqkL0M
         D5bdJ+2UPe1MIIUTQNVbB6M2/ZEoXGGrmnH3eJumyCoENQQ6Ma44xrsJZh97ImEg8E8r
         M4AiK/f36YUzIQQfNGU56J2+UE70HdQmpp+OI2ICvCoe5ylac2Dgvl36vx9qMmuZCrgO
         11iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZDobzW2H7yWG2aStgDge3AS98VMniogn18KVHxZJdU=;
        b=PBbBjYASgCUs6O3dvcI/5Nrp9hz+2iJM4EMGgkCAyHyDCiyiLVjrZ3D1Zy9+uYPB4V
         pZ236zAEgtOSI5AplQiRYTRB3F1QQv0T+wjTiV5/UWGCTlVwr02jD8mgVROX120UREIX
         3/E2K7r3yZx1RoDMOFQdXK0a2x3vAT7e/4y4icoWzDFr/2m+c5EEBzHzaGyAd3OzOcQZ
         Cez5gZgEcjPBpDMeqQLT+0TNKC4QBH4V9jl5U/Wj795U8d22itcNFx65OD3DW0nbCb2F
         hg15FieW3VXb7SMKKQy7qCW6zW4TtSFPmRoeAt6my0lKIosbroOo28Xk2jfpwXKzmp5G
         hvlg==
X-Gm-Message-State: ANoB5plhac1OzXIID1MJQIGEMkHDHhKzJeLbcVehAeNmeU9rRJdtW34C
	R+GqE4XDO5lSxEecj/wA7u/o+5D7tDwf0E6YVqdrfA==
X-Google-Smtp-Source: AA0mqf7TTJeWMg8ogBjKS236vo7RF2Llgewqxc45tHV28HrFgetUgm4NSycRT8mAUKbJkVkwg5XwZQ==
X-Received: by 2002:a17:902:e212:b0:189:80e4:6920 with SMTP id u18-20020a170902e21200b0018980e46920mr2803674plb.42.1670539398621;
        Thu, 08 Dec 2022 14:43:18 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p1-20020a1709027ec100b00172973d3cd9sm1675980plb.55.2022.12.08.14.43.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 14:43:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/12] scripts: convert-overrides: Allow command-line customizations
Date: Thu,  8 Dec 2022 12:42:50 -1000
Message-Id: <822ef2445630f6aab66b7c00fc79909347543c16.1670539236.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1670539235.git.steve@sakoman.com>
References: <cover.1670539235.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 22:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174422

From: Joshua Watt <JPEWhacker@gmail.com>

Adds argument parsing to the conversion script so that the fields that
the script uses to do conversions can be customized on the command line.
The intention is to allows easier customization without having to fork
the script, and allow automated checking on 3rd party layers via CI
without false positives

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit b9551f9180bf9f13fb1c480b5b7892fdc831ffcd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/contrib/convert-overrides.py | 103 +++++++++++++++------------
 1 file changed, 57 insertions(+), 46 deletions(-)

diff --git a/scripts/contrib/convert-overrides.py b/scripts/contrib/convert-overrides.py
index 4d41a4c475..1939757f1b 100755
--- a/scripts/contrib/convert-overrides.py
+++ b/scripts/contrib/convert-overrides.py
@@ -22,50 +22,62 @@ import sys
 import tempfile
 import shutil
 import mimetypes
+import argparse
 
-if len(sys.argv) < 2:
-    print("Please specify a directory to run the conversion script against.")
-    sys.exit(1)
+parser = argparse.ArgumentParser(description="Convert override syntax")
+parser.add_argument("--override", "-o", action="append", default=[], help="Add additional strings to consider as an override (e.g. custom machines/distros")
+parser.add_argument("--skip", "-s", action="append", default=[], help="Add additional string to skip and not consider an override")
+parser.add_argument("--skip-ext", "-e", action="append", default=[], help="Additional file suffixes to skip when processing (e.g. '.foo')")
+parser.add_argument("--package-vars", action="append", default=[], help="Additional variables to treat as package variables")
+parser.add_argument("--image-vars", action="append", default=[], help="Additional variables to treat as image variables")
+parser.add_argument("--short-override", action="append", default=[], help="Additional strings to treat as short overrides")
+parser.add_argument("path", nargs="+", help="Paths to convert")
+
+args = parser.parse_args()
 
 # List of strings to treat as overrides
-vars = ["append", "prepend", "remove"]
-vars = vars + ["qemuarm", "qemux86", "qemumips", "qemuppc", "qemuriscv", "qemuall"]
-vars = vars + ["genericx86", "edgerouter", "beaglebone-yocto"]
-vars = vars + ["armeb", "arm", "armv5", "armv6", "armv4", "powerpc64", "aarch64", "riscv32", "riscv64", "x86", "mips64", "powerpc"]
-vars = vars + ["mipsarch", "x86-x32", "mips16e", "microblaze", "e5500-64b", "mipsisa32", "mipsisa64"]
-vars = vars + ["class-native", "class-target", "class-cross-canadian", "class-cross", "class-devupstream"]
-vars = vars + ["tune-",  "pn-", "forcevariable"]
-vars = vars + ["libc-musl", "libc-glibc", "libc-newlib","libc-baremetal"]
-vars = vars + ["task-configure", "task-compile", "task-install", "task-clean", "task-image-qa", "task-rm_work", "task-image-complete", "task-populate-sdk"]
-vars = vars + ["toolchain-clang", "mydistro", "nios2", "sdkmingw32", "overrideone", "overridetwo"]
-vars = vars + ["linux-gnux32", "linux-muslx32", "linux-gnun32", "mingw32", "poky", "darwin", "linuxstdbase"]
-vars = vars + ["linux-gnueabi", "eabi"]
-vars = vars + ["virtclass-multilib", "virtclass-mcextend"]
+vars = args.override
+vars += ["append", "prepend", "remove"]
+vars += ["qemuarm", "qemux86", "qemumips", "qemuppc", "qemuriscv", "qemuall"]
+vars += ["genericx86", "edgerouter", "beaglebone-yocto"]
+vars += ["armeb", "arm", "armv5", "armv6", "armv4", "powerpc64", "aarch64", "riscv32", "riscv64", "x86", "mips64", "powerpc"]
+vars += ["mipsarch", "x86-x32", "mips16e", "microblaze", "e5500-64b", "mipsisa32", "mipsisa64"]
+vars += ["class-native", "class-target", "class-cross-canadian", "class-cross", "class-devupstream"]
+vars += ["tune-",  "pn-", "forcevariable"]
+vars += ["libc-musl", "libc-glibc", "libc-newlib","libc-baremetal"]
+vars += ["task-configure", "task-compile", "task-install", "task-clean", "task-image-qa", "task-rm_work", "task-image-complete", "task-populate-sdk"]
+vars += ["toolchain-clang", "mydistro", "nios2", "sdkmingw32", "overrideone", "overridetwo"]
+vars += ["linux-gnux32", "linux-muslx32", "linux-gnun32", "mingw32", "poky", "darwin", "linuxstdbase"]
+vars += ["linux-gnueabi", "eabi"]
+vars += ["virtclass-multilib", "virtclass-mcextend"]
 
 # List of strings to treat as overrides but only with whitespace following or another override (more restricted matching).
 # Handles issues with arc matching arch.
-shortvars = ["arc", "mips", "mipsel", "sh4"]
+shortvars = ["arc", "mips", "mipsel", "sh4"] + args.short_override
 
 # Variables which take packagenames as an override
 packagevars = ["FILES", "RDEPENDS", "RRECOMMENDS", "SUMMARY", "DESCRIPTION", "RSUGGESTS", "RPROVIDES", "RCONFLICTS", "PKG", "ALLOW_EMPTY",
               "pkg_postrm", "pkg_postinst_ontarget", "pkg_postinst", "INITSCRIPT_NAME", "INITSCRIPT_PARAMS", "DEBIAN_NOAUTONAME", "ALTERNATIVE",
               "PKGE", "PKGV", "PKGR", "USERADD_PARAM", "GROUPADD_PARAM", "CONFFILES", "SYSTEMD_SERVICE", "LICENSE", "SECTION", "pkg_preinst",
               "pkg_prerm", "RREPLACES", "GROUPMEMS_PARAM", "SYSTEMD_AUTO_ENABLE", "SKIP_FILEDEPS", "PRIVATE_LIBS", "PACKAGE_ADD_METADATA",
-              "INSANE_SKIP", "DEBIANNAME", "SYSTEMD_SERVICE_ESCAPED"]
+              "INSANE_SKIP", "DEBIANNAME", "SYSTEMD_SERVICE_ESCAPED"] + args.package_vars
 
 # Expressions to skip if encountered, these are not overrides
-skips = ["parser_append", "recipe_to_append", "extra_append", "to_remove", "show_appends", "applied_appends", "file_appends", "handle_remove"]
-skips = skips + ["expanded_removes", "color_remove", "test_remove", "empty_remove", "toaster_prepend", "num_removed", "licfiles_append", "_write_append"]
-skips = skips + ["no_report_remove", "test_prepend", "test_append", "multiple_append", "test_remove", "shallow_remove", "do_remove_layer", "first_append"]
-skips = skips + ["parser_remove", "to_append", "no_remove", "bblayers_add_remove", "bblayers_remove", "apply_append", "is_x86", "base_dep_prepend"]
-skips = skips + ["autotools_dep_prepend", "go_map_arm", "alt_remove_links", "systemd_append_file", "file_append", "process_file_darwin"]
-skips = skips + ["run_loaddata_poky", "determine_if_poky_env", "do_populate_poky_src", "libc_cv_include_x86_isa_level", "test_rpm_remove", "do_install_armmultilib"]
-skips = skips + ["get_appends_for_files", "test_doubleref_remove", "test_bitbakelayers_add_remove", "elf32_x86_64", "colour_remove", "revmap_remove"]
-skips = skips + ["test_rpm_remove", "test_bitbakelayers_add_remove", "recipe_append_file", "log_data_removed", "recipe_append", "systemd_machine_unit_append"]
-skips = skips + ["recipetool_append", "changetype_remove", "try_appendfile_wc", "test_qemux86_directdisk", "test_layer_appends", "tgz_removed"]
-
-imagevars = ["IMAGE_CMD", "EXTRA_IMAGECMD", "IMAGE_TYPEDEP", "CONVERSION_CMD", "COMPRESS_CMD"]
-packagevars = packagevars + imagevars
+skips = args.skip
+skips += ["parser_append", "recipe_to_append", "extra_append", "to_remove", "show_appends", "applied_appends", "file_appends", "handle_remove"]
+skips += ["expanded_removes", "color_remove", "test_remove", "empty_remove", "toaster_prepend", "num_removed", "licfiles_append", "_write_append"]
+skips += ["no_report_remove", "test_prepend", "test_append", "multiple_append", "test_remove", "shallow_remove", "do_remove_layer", "first_append"]
+skips += ["parser_remove", "to_append", "no_remove", "bblayers_add_remove", "bblayers_remove", "apply_append", "is_x86", "base_dep_prepend"]
+skips += ["autotools_dep_prepend", "go_map_arm", "alt_remove_links", "systemd_append_file", "file_append", "process_file_darwin"]
+skips += ["run_loaddata_poky", "determine_if_poky_env", "do_populate_poky_src", "libc_cv_include_x86_isa_level", "test_rpm_remove", "do_install_armmultilib"]
+skips += ["get_appends_for_files", "test_doubleref_remove", "test_bitbakelayers_add_remove", "elf32_x86_64", "colour_remove", "revmap_remove"]
+skips += ["test_rpm_remove", "test_bitbakelayers_add_remove", "recipe_append_file", "log_data_removed", "recipe_append", "systemd_machine_unit_append"]
+skips += ["recipetool_append", "changetype_remove", "try_appendfile_wc", "test_qemux86_directdisk", "test_layer_appends", "tgz_removed"]
+
+imagevars = ["IMAGE_CMD", "EXTRA_IMAGECMD", "IMAGE_TYPEDEP", "CONVERSION_CMD", "COMPRESS_CMD"] + args.image_vars
+packagevars += imagevars
+
+skip_ext = [".html", ".patch", ".m4", ".diff"] + args.skip_ext
 
 vars_re = {}
 for exp in vars:
@@ -124,21 +136,20 @@ def processfile(fn):
 ourname = os.path.basename(sys.argv[0])
 ourversion = "0.9.3"
 
-if os.path.isfile(sys.argv[1]):
-    processfile(sys.argv[1])
-    sys.exit(0)
-
-for targetdir in sys.argv[1:]:
-    print("processing directory '%s'" % targetdir)
-    for root, dirs, files in os.walk(targetdir):
-        for name in files:
-            if name == ourname:
-                continue
-            fn = os.path.join(root, name)
-            if os.path.islink(fn):
-                continue
-            if "/.git/" in fn or fn.endswith(".html") or fn.endswith(".patch") or fn.endswith(".m4") or fn.endswith(".diff"):
-                continue
-            processfile(fn)
+for p in args.path:
+    if os.path.isfile(p):
+        processfile(p)
+    else:
+        print("processing directory '%s'" % p)
+        for root, dirs, files in os.walk(p):
+            for name in files:
+                if name == ourname:
+                    continue
+                fn = os.path.join(root, name)
+                if os.path.islink(fn):
+                    continue
+                if "/.git/" in fn or any(fn.endswith(ext) for ext in skip_ext):
+                    continue
+                processfile(fn)
 
 print("All files processed with version %s" % ourversion)
-- 
2.25.1



Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C60C433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 14:56:04 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.6441.1668178561802755936
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Nov 2022 06:56:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dTCcorH1;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-13bd19c3b68so5655576fac.7
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 06:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o/0Q9Dt5pQR8r9K5LhFDhmfsWoeotQAVdZ8kA/avcMs=;
        b=dTCcorH14i0F3fNyKr1IxsDDBZ9TwZUBvRhUfNAHUsZWa2JNNZ3/hvQ0D5dkXXtUOY
         sZxbvRvPItFC4NDEGLjcLxwbdF2k/Ow23D6dWXqQt6bzf5k9djQh/b24AymB1xHqCwsO
         HNnP5elHwizKQx1HvbEZ9csU+8d9SGVks0pVVL08rCd+XfGtLoozzUkYMmAbxEB21J/Z
         QG1gIDn6XY3oBtjg6KsNkTgX0+Cx/Bx9Mygazw3Oz5kDHrroJcfema0Ez5PdvnHsEQ38
         cKnboEk1WzsEBFHc2ozhyuH5k7KAQiiFVLvGNpKY7nii/L6fnkO1gMeh67rPj4wh4Bjj
         UiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/0Q9Dt5pQR8r9K5LhFDhmfsWoeotQAVdZ8kA/avcMs=;
        b=E1wYcBChP0zp4k2tCpBjT8ns3NBqZW/MPHU+UEfnv2chsGm9sOi0LFTZgtHNzq5fVf
         SkDbWhp1GaWnrFyfngQsZ/gyMgjOOnOD6y/6c5UzsWOcCCD9aZM9D5URWEDdZBJLs/TJ
         CiPGFA6q6cNwqDuTTZ2cVkgSr1C/qto5bEPvJfKrJDgp9hdqZJr56au3hAbQhcvMHA3q
         Rkt+yn7OO4QZetuxiY76NxHxkHzENpH/IV2MJU8Ch2QSfoxhRX0QoEMT+wKQa8trGyOb
         R0BL5/20AmciSGFDI/jWLu+nAk1Z9GQqcGqds8N90MebXkEOJE238WkctO98lB17/KeL
         eZeQ==
X-Gm-Message-State: ANoB5pl9tCu1JO+H2TjJNr4WmnN0AhayHfVrCRwXYJiEt56V6KsUIKbz
	d0VNehLKQiscTE+Npxw2SVodD063kEY=
X-Google-Smtp-Source: AA0mqf6V5b4x39bbumbfR+Myq6UqrRm5AIs+I2BkMDO+ZGX9hvQ6TLKP4dLc6aeetRIlOOSheJxPHQ==
X-Received: by 2002:a05:6870:3c88:b0:13b:a9ac:ad64 with SMTP id gl8-20020a0568703c8800b0013ba9acad64mr1046574oab.290.1668178560598;
        Fri, 11 Nov 2022 06:56:00 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id v4-20020acade04000000b00359ba124b07sm903373oig.36.2022.11.11.06.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 06:55:59 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] scripts: convert-overrides: Allow command-line customizations
Date: Fri, 11 Nov 2022 08:55:51 -0600
Message-Id: <20221111145551.1115391-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 14:56:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173133

Adds argument parsing to the conversion script so that the fields that
the script uses to do conversions can be customized on the command line.
The intention is to allows easier customization without having to fork
the script, and allow automated checking on 3rd party layers via CI
without false positives

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 scripts/contrib/convert-overrides.py | 103 +++++++++++++++------------
 1 file changed, 57 insertions(+), 46 deletions(-)

diff --git a/scripts/contrib/convert-overrides.py b/scripts/contrib/convert-overrides.py
index 4d41a4c4759..1939757f1bc 100755
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
2.33.0



Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC94C4167B
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:21:23 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.143564.1671132082168738641
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=4gyMpaYn;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id u15-20020a17090a3fcf00b002191825cf02so127074pjm.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZDobzW2H7yWG2aStgDge3AS98VMniogn18KVHxZJdU=;
        b=4gyMpaYnzgtrNvGNodZ1vnCPcNE2AOICPgWb9qbHca+bZA95D4Mg3kwYHjSdi36zen
         +/EgfJGxXcuZPOpC5BiHrJYktmUGm666r+qFDoKmJbaIbXq9hkmbZav3Bo+kJEAPajin
         rMWBwJumEY4IN1iZokcm9g1B9JTUOcY2zEnHHgTOjUyfpddX3m4WSegE1odD46KDPp0h
         A1Rw9rR2viZvu/P0SeM+RkMGU7s2ZAe+3AFYqG42P8bK/SSyJ0iDD4dXEDxQldyCB95w
         u8/QbJq3e2SJcrqnufKtrtHIxxmMpFkaTwVttIvyI/SGzXukUjySf4KbQNGMP98bLJOo
         88sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZDobzW2H7yWG2aStgDge3AS98VMniogn18KVHxZJdU=;
        b=i4W2KMqtHwhhdRdtC8vXCgBQUcZ4hF1jMNLFhqlrfoJrq/HWCWt/G9n9LLrVvoZJfh
         f7dPwGmaMAH7ppPjjydi7SOPzOEm0bkSjRvW47TZ+flvH7wOQncxlakh1RmhRjtRhkoW
         3C0vm6ALplOpV00emJLgrSTqa6RjjPgGrG6Ij5PFryuBAqp8XkPbQWKGUuS8sPbtVvy1
         sofc/BkT45k/zcWfA5VrCrt80sYpyRthc0mrMFCywfcp9Q+xu4OE8CuszTJ/BfjqpcMt
         s4DIcRzBTqjncTEkCZ/ycLOvhhmLjLVKJ2SNQa/Paeer6uH4RBdRsauhGMchdzuguRQF
         IBzg==
X-Gm-Message-State: ANoB5pmNpIOu+MEXkii10qmoaemUkap8fLr5eYfQ29KXnUiEgbcUGERt
	U1Guyk6H1ec81twuzX5PinVxsSj0v/MHPbLw7gs=
X-Google-Smtp-Source: AA0mqf6hA1vKKZUuDxS7TXDL/R2tL+f9P8q9NaE8nDtWux5nlxB2Bvlzwu7uk6eH57aqnjd9g2ahZg==
X-Received: by 2002:a05:6a20:a6a6:b0:ad:e765:9597 with SMTP id ba38-20020a056a20a6a600b000ade7659597mr12562037pzb.18.1671132081083;
        Thu, 15 Dec 2022 11:21:21 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 11/30] scripts: convert-overrides: Allow command-line customizations
Date: Thu, 15 Dec 2022 09:20:35 -1000
Message-Id: <ed5578071ecc8fcd35fbcd7dee757c4cfa3b7dde.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671122751.git.steve@sakoman.com>
References: <cover.1671122751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174603

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



Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.5306.1627481710775867837
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 07:15:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qegn2Gz8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id m38-20020a05600c3b26b02902161fccabf1so4446929wms.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 07:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YDLtd0lOKQAN6vkDFZM9iZmYKDDbZJVMFnz5imcEiLw=;
        b=Qegn2Gz8ZJPdgTdmjLxC63NJIgU7rr5yKtaI9Rdnzl0LzaqYGgdgztNx328bjhXkQC
         9TDLfSzDLTyCJogGbIH2LmW5M3O9VVrAnEi7gJr/BDMDMjVL3OBBBoa2GQ0tq78viWPK
         dGL9Gr5JuSVC29sm5rq0LP1t8pksl6sBWVlzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YDLtd0lOKQAN6vkDFZM9iZmYKDDbZJVMFnz5imcEiLw=;
        b=huUGjuLLKb420TpO25T8EJm1uGRwiAMft5jMyK5d9PGloYnMpkPnszqYJX5XzMXGxj
         YbOwtBY7jQYY8NxlYuM0RMzy7mbuHSFjmJ8gVtX1ZmLp920woKz/684Jkm0tiCepmHQq
         9+860FtaooZsfZDo9QG4zEe1NVQ0ANpatwPdFRYjj/RV2qyIrDF5NL/OhTCqog2jnx3w
         L8PZXk7/Ug6tSCOgcQUcgN2T5O9eQR2fys5gBsjxxJ2upK8HJpgIw9473LxzgCU1CX7S
         +dVpWLrghG2OKJIx2IZWW9OaKxSJKzOL6qyTuj4VHjhxMCzg2Vg2fY/waDhD65WCQ5P2
         Nx7A==
X-Gm-Message-State: AOAM533y5gcs0G5D+iqkOe+w+KIczUxG9VoYPQ52LYCG+0MIvFFXUhVh
	fA+qgkzpaxKOuswkoPbonxnFBsd31D1mrQ==
X-Google-Smtp-Source: ABdhPJzAgrH5iLNe7QgMS3hccXUHCiQw2o11FS41b3NBeGiVxkipMnqKzrwcMOCDUxV7lP+VnaBu2g==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr9734726wmh.69.1627481707458;
        Wed, 28 Jul 2021 07:15:07 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:824:a750:d1fb:a5cc])
        by smtp.gmail.com with ESMTPSA id v6sm5691514wru.50.2021.07.28.07.15.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 07:15:07 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] scripts/contrib: Add override conversion script
Date: Wed, 28 Jul 2021 15:15:04 +0100
Message-Id: <20210728141506.3287158-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a script I've developed to migrate metadata to use the new override
syntax. It is a bit rough but since its for a single use with validation, it
doesn't need to be perfect. It is run simply as:

scripts/contrib/convert-overrides.py <directory>

It is setup and has been tested to work with OE-Core, Bitbake, yocto-docs,
meta-yocto, meta-gplv2 and meta-mingw. For OE-Core, it converts around 10,100
lines with about 34 manual fixes needed.

For other layers it would need updating for override names and exclusions for
functions/variable names with "append", "prepend" or "remove" in them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/contrib/convert-overrides.py | 146 +++++++++++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100755 scripts/contrib/convert-overrides.py

diff --git a/scripts/contrib/convert-overrides.py b/scripts/contrib/convert-overrides.py
new file mode 100755
index 00000000000..d18d86fa49d
--- /dev/null
+++ b/scripts/contrib/convert-overrides.py
@@ -0,0 +1,146 @@
+#!/usr/bin/env python3
+#
+# Conversion script to add new override syntax to existing bitbake metadata
+#
+# Copyright (C) 2021 Richard Purdie
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+#
+# To use this script on a new layer you need to list the overrides the
+# layer is known to use in the list below.
+#
+# Known constraint: Matching is 'loose' and in particular will find variable
+# and function names with "_append" and "_remove" in them. Those need to be
+# filtered out manually or in the skip list below.
+#
+
+import re
+import os
+import sys
+import tempfile
+import shutil
+import mimetypes
+
+if len(sys.argv) != 2:
+    print("Please specify a directory to run the conversion script against.")
+    sys.exit(1)
+
+targetdir = sys.argv[1]
+
+# List of strings to treat as overrides
+vars = ["append", "prepend", "remove"]
+vars = vars + ["qemuarm", "qemux86", "qemumips", "qemuppc", "qemuriscv", "qemuall"]
+vars = vars + ["genericx86", "edgerouter", "beaglebone-yocto"]
+vars = vars + ["armeb", "arm", "armv5", "armv6", "armv4", "powerpc64", "aarch64", "riscv32", "riscv64", "x86", "mips64", "powerpc"]
+vars = vars + ["mipsarch", "x86-x32", "mips16e", "microblaze", "e5500-64b", "mipsisa32", "mipsisa64"]
+vars = vars + ["class-native", "class-target", "class-cross-canadian", "class-cross", "class-devupstream"]
+vars = vars + ["tune-",  "pn-", "forcevariable"]
+vars = vars + ["libc-musl", "libc-glibc", "libc-newlib","libc-baremetal"]
+vars = vars + ["task-compile", "task-install", "task-clean", "task-image-qa", "task-rm_work", "task-image-complete", "task-populate-sdk"]
+vars = vars + ["toolchain-clang", "mydistro", "nios2", "sdkmingw32", "overrideone", "overridetwo"]
+vars = vars + ["linux-gnux32", "linux-muslx32", "linux-gnun32", "mingw32", "poky", "darwin", "linuxstdbase"]
+vars = vars + ["virtclass-multilib", "virtclass-mcextend"]
+
+# List of strings to treat as overrides but only with whitespace following or another override (more restricted matching).
+# Handles issues with arc matching arch.
+shortvars = ["arc", "mips", "mipsel", "sh4"]
+
+# Variables which take packagenames as an override
+packagevars = ["FILES", "RDEPENDS", "RRECOMMENDS", "SUMMARY", "DESCRIPTION", "RSUGGESTS", "RPROVIDES", "RCONFLICTS", "PKG", "ALLOW_EMPTY", 
+              "pkg_postrm", "pkg_postinst_ontarget", "pkg_postinst", "INITSCRIPT_NAME", "INITSCRIPT_PARAMS", "DEBIAN_NOAUTONAME", "ALTERNATIVE",
+              "PKGE", "PKGV", "PKGR", "USERADD_PARAM", "GROUPADD_PARAM", "CONFFILES", "SYSTEMD_SERVICE", "LICENSE", "SECTION", "pkg_preinst", 
+              "pkg_prerm", "RREPLACES", "GROUPMEMS_PARAM", "SYSTEMD_AUTO_ENABLE", "SKIP_FILEDEPS", "PRIVATE_LIBS", "PACKAGE_ADD_METADATA", "INSANE_SKIP", "DEBIANNAME"]
+
+# Expressions to skip if encountered, these are not overrides
+skips = ["LICENSE_PATH", "FILES_INFO", "LICENSE_DIRECTORY", "LICENSE_FLAGS", "PKG_CONFIG", "PKG_CHECK", "LICENSE_CREATE", "PACKAGE_ADD_METADATA_IPK"]
+skips = skips + ["ALTERNATIVE_LINK_NAME", "ALTERNATIVE_TARGET", "ALTERNATIVE_PRIORITY", "FILES_SOLIBSDEV", "PKG_TYPE", "LICENSE_EXCLUSION", "IMAGE_CMD_TAR"]
+skips = skips + ["LICENSE_FILES_DIRECTORY", "LICENSE_FLAGS_WHITELIST", "LICENSE_PACKAGE_SUFFIX", "PACKAGE_ADD_METADATA_RPM", "PACKAGE_ADD_METADATA_DEB"]
+skips = skips + ["RSUGGESTS_SCRIPTING"]
+skips = skips + ["parser_append", "recipe_to_append", "extra_append", "to_remove", "show_appends", "applied_appends", "file_appends", "handle_remove"]
+skips = skips + ["expanded_removes", "color_remove", "test_remove", "empty_remove", "toaster_prepend", "num_removed", "licfiles_append", "_write_append"]
+skips = skips + ["no_report_remove", "test_prepend", "test_append", "multiple_append", "test_remove", "shallow_remove", "do_remove_layer", "first_append"]
+skips = skips + ["parser_remove", "to_append", "no_remove", "bblayers_add_remove", "bblayers_remove", "apply_append", "is_x86", "base_dep_prepend"]
+skips = skips + ["autotools_dep_prepend", "go_map_arm", "alt_remove_links", "systemd_append_file", "file_append", "process_file_darwin"]
+skips = skips + ["run_loaddata_poky", "determine_if_poky_env", "do_populate_poky_src", "libc_cv_include_x86_isa_level", "test_rpm_remove", "do_install_armmultilib"]
+skips = skips + ["get_appends_for_files", "test_doubleref_remove", "test_bitbakelayers_add_remove", "elf32_x86_64", "colour_remove", "revmap_remove"]
+skips = skips + ["test_rpm_remove", "test_bitbakelayers_add_remove", "recipe_append_file", "log_data_removed", "recipe_append", "systemd_machine_unit_append"]
+skips = skips + ["recipetool_append", "changetype_remove", "try_appendfile_wc", "test_qemux86_directdisk", "test_layer_appends", "tgz_removed"]
+
+imagevars = ["IMAGE_CMD", "EXTRA_IMAGECMD"]
+packagevars = packagevars + imagevars
+
+vars_re = {}
+for exp in vars:
+    vars_re[exp] = (re.compile('((^|[\'"\s])[A-Za-z0-9_\-:${}]+)_' + exp), r"\1:" + exp)
+
+shortvars_re = {}
+for exp in shortvars:
+    shortvars_re[exp] = (re.compile('((^|[\'"\s])[A-Za-z0-9_\-:${}]+)_' + exp + '([\'"\s:])'), r"\1:" + exp + r"\3")
+
+package_re = {}
+for exp in packagevars:
+    package_re[exp] = (re.compile('(^|[\'"\s]+)' + exp + '_'), r"\1" + exp + ":")
+
+# Other substitutions to make
+subs = {
+    'r = re.compile("([^:]+):\s*(.*)")' : 'r = re.compile("(^.+?):\s+(.*)")',
+    "val = d.getVar('%s_%s' % (var, pkg))" : "val = d.getVar('%s:%s' % (var, pkg))",
+    "f.write('%s_%s: %s\\n' % (var, pkg, encode(val)))" : "f.write('%s:%s: %s\\n' % (var, pkg, encode(val)))",
+    "d.getVar('%s_%s' % (scriptlet_name, pkg))" : "d.getVar('%s:%s' % (scriptlet_name, pkg))",
+    'ret.append(v + "_" + p)' : 'ret.append(v + ":" + p)',
+}
+
+def processfile(fn):
+    try:
+        fh, abs_path = tempfile.mkstemp()
+        with os.fdopen(fh, 'w') as new_file:
+            with open(fn, "r") as old_file:
+                for line in old_file:
+                    skip = False
+                    for s in skips:
+                        if "${FILES_SOLIBSDEV}" in line or "${IMAGE_CMD_TAR}" in line or "${RSUGGESTS_SCRIPTING}" in line:
+                            continue
+                        if s in line:
+                            skip = True
+                            if "ptest_append" in line:
+                                skip = False
+                    if "base_dep_prepend" in line and line.startswith("BASEDEPENDS_class"):
+                        line = line.replace("BASEDEPENDS_class", "BASEDEPENDS:class")
+                        skip = True
+                    if "autotools_dep_prepend" in line and line.startswith("DEPENDS_prepend"):
+                        line = line.replace("DEPENDS_prepend", "DEPENDS:prepend")
+                        skip = True
+                    for sub in subs:
+                        if sub in line:
+                            line = line.replace(sub, subs[sub])
+                            skip = True
+                    if not skip:
+                        for pvar in packagevars:
+                            line = package_re[pvar][0].sub(package_re[pvar][1], line)
+                        for var in vars:
+                            line = vars_re[var][0].sub(vars_re[var][1], line)
+                        for shortvar in shortvars:
+                            line = shortvars_re[shortvar][0].sub(shortvars_re[shortvar][1], line)
+                    if "pkg_postinst:ontarget" in line:
+                        line = line.replace("pkg_postinst:ontarget", "pkg_postinst_ontarget")
+                    new_file.write(line)
+        shutil.copymode(fn, abs_path)
+        os.remove(fn)
+        shutil.move(abs_path, fn)
+    except UnicodeDecodeError:
+        pass
+
+ourname = os.path.basename(sys.argv[0])
+
+for root, dirs, files in os.walk(targetdir):
+   for name in files:
+      if name == ourname:
+          continue
+      fn = os.path.join(root, name)
+      if os.path.islink(fn):
+          continue
+      if "/.git/" in fn or fn.endswith(".html") or fn.endswith(".patch") or fn.endswith(".m4") or fn.endswith(".diff"):
+          continue
+      processfile(fn)
-- 
2.30.2


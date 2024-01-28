Return-Path: <sgw@bigsur.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B47C48285
	for <webhook@archiver.kernel.org>; Sun, 28 Jan 2024 00:04:16 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.28415.1706400250940880732
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jan 2024 16:04:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bigsur.com header.s=bigsur.com header.b=fQ/bxq6T;
 spf=pass (domain: bigsur.com, ip: 209.85.216.42, mailfrom: sgw@bigsur.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-290ec261a61so895769a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Jan 2024 16:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bigsur.com; s=bigsur.com; t=1706400250; x=1707005050; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gtaLq0m2+whc/sJVGjalfIQYkCE4dZo9gusF5KBep2I=;
        b=fQ/bxq6TK+fcrThQtk4cbZ5BuHC0ypGSAQGrxkTqSJWyGLSKDCCQVhiZnJpo5VOTGo
         NJ6RHFgidQ4BK2eSzm6lO9/y7dnkOijPTAq/HMhhjjfOXIAXIk+XIEemhvdvF306eo4t
         RJ+DTjuCd6EedXPeA4F8FGTOqA53tQ6ANxcfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706400250; x=1707005050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gtaLq0m2+whc/sJVGjalfIQYkCE4dZo9gusF5KBep2I=;
        b=MF826dkwHTvB0FUMmnf4Y5rzkBbu8M3007wO8XHioywPAr2HqQvz4Bh1bO6QW7nX6t
         1nh4c7WnFj2Hbluv+rs3IuO/LQ/c8HMog6WBRZSVTpVJNreTLidNb+bp7ZSQZwngDKrd
         ihkaB9sElvz2Vbh8wn99fJ57GgKRv+V/TmyinsVWrOBoE7Cflba4KjBGudPoL+hNqia5
         gz8CxxIasb/MzLJPUQmfSX/HbRB7TCgme2ylnXdTfVuC42cP0NL2CbJyiNldddra7Kyk
         owxaZIJ3+R6r45tOIpSf5kxTo0GHSC/FViDh5Eu02oowLtSnHecEBSXedybbMMB13rmE
         Kmig==
X-Gm-Message-State: AOJu0YxYDKy6jtD9K34TVbwyEifJu0c+gPmb7Iibs7SaKukv2bvTYitR
	KKiz+lctyRKw00v6XzbHTew9KRmSRBKrHBm5LxePp358cuFhGqiTgDn9dMJ0KBcwoiylHAKK0Ec
	=
X-Google-Smtp-Source: AGHT+IHyemR/o3sXkCkidyeVZkB9/9aHIzpLrntSwGJfK8G0scCC2Cgj3D8v/e0YhmJ6VPCtFnLMmw==
X-Received: by 2002:a17:902:db04:b0:1d7:3d4b:3dbb with SMTP id m4-20020a170902db0400b001d73d4b3dbbmr1564820plx.136.1706400249883;
        Sat, 27 Jan 2024 16:04:09 -0800 (PST)
Received: from framework.localdomain ([69.9.134.55])
        by smtp.gmail.com with ESMTPSA id l5-20020a170902eb0500b001d58ed4c591sm2926823plb.105.2024.01.27.16.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 16:04:08 -0800 (PST)
From: Saul Wold <sgw@bigsur.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Subject: [PATCH 1/1] check-bbclasses: add new script to check bbclasses
Date: Sat, 27 Jan 2024 16:04:05 -0800
Message-Id: <20240128000405.3074503-2-sgw@bigsur.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240128000405.3074503-1-sgw@bigsur.com>
References: <20240128000405.3074503-1-sgw@bigsur.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jan 2024 00:04:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194436

FIXES [YOCTO #14235]

This script is a starting point for a "linter" for bbclass files.
Currently it will check for '_' in the bbclass filename and '-' in
addtask or EXPORT_FUNCTION. It will print warnings only no errors.

Signed-off-by: Saul Wold <sgw@bigsur.com>
---
 scripts/check-bbclasses | 109 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100755 scripts/check-bbclasses

diff --git a/scripts/check-bbclasses b/scripts/check-bbclasses
new file mode 100755
index 00000000000..ea525b2d118
--- /dev/null
+++ b/scripts/check-bbclasses
@@ -0,0 +1,109 @@
+#!/usr/bin/env python3
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# This script checks for bbclass like a linter can gives a
+# warning if any of the following issues:
+# * bbclass filename contains a '_' unless in the know list
+# * either an 'addtask' or 'EXPORT_FUNCTION' name contains a '-'
+#
+
+import sys, os, subprocess, re, shutil
+
+# List of known classes with '_' in OE-Core
+oecore_known_classes = (
+	"test_events.bbclass",
+	"migrate_localcount.bbclass",
+	"copyleft_compliance.bbclass",
+	"sign_ipk.bbclass",
+	"multilib_global.bbclass",
+	"useradd_base.bbclass",
+	"rm_work_and_downloads.bbclass",
+	"sign_rpm.bbclass",
+	"rm_work.bbclass",
+	"sign_package_feed.bbclass",
+	"copyleft_filter.bbclass",
+	"relative_symlinks.bbclass",
+	"recipe_sanity.bbclass",
+	"metadata_scm.bbclass",
+	"python_pyo3.bbclass",
+	"multilib_script.bbclass",
+	"multilib_header.bbclass",
+	"compress_doc.bbclass",
+	"populate_sdk.bbclass",
+	"license_image.bbclass",
+	"python_maturin.bbclass",
+	"python_setuptools3_rust.bbclass",
+	"image_types.bbclass",
+	"cargo_c.bbclass",
+	"bin_package.bbclass",
+	"python_poetry_core.bbclass",
+	"distro_features_check.bbclass",
+	"lib_package.bbclass",
+	"python_setuptools_build_meta.bbclass",
+	"populate_sdk_base.bbclass",
+	"features_check.bbclass",
+	"python_pep517.bbclass",
+	"cargo_common.bbclass",
+	"populate_sdk_ext.bbclass",
+	"rootfs_ipk.bbclass",
+	"rootfs_deb.bbclass",
+	"cpan_build.bbclass",
+	"rootfs_rpm.bbclass",
+	"python_flit_core.bbclass",
+	"python_hatchling.bbclass",
+	"image_types_wic.bbclass",
+	"setuptools3_legacy.bbclass",
+	"package_rpm.bbclass",
+	"package_deb.bbclass",
+	"package_ipk.bbclass",
+	"package_pkgdata.bbclass"
+)
+
+def get_tinfoil():
+    scripts_path = os.path.dirname(os.path.realpath(__file__))
+    lib_path = scripts_path + '/lib'
+    sys.path = sys.path + [lib_path]
+    import scriptpath
+    scriptpath.add_bitbake_lib_path()
+    import bb.tinfoil
+    tinfoil = bb.tinfoil.Tinfoil()
+    tinfoil.prepare()
+    # tinfoil.logger.setLevel(logging.WARNING)
+    return tinfoil
+
+if __name__=='__main__':
+    import argparse, shutil
+
+    parser = argparse.ArgumentParser(description='Sanity checker for bbclasses')
+    parser.add_argument("--verbose", default=False, action="store_true")
+    args = parser.parse_args()
+
+    tinfoil = get_tinfoil()
+
+    bbpath = tinfoil.config_data.getVar('BBPATH').split(':')
+    for path in bbpath:
+        with os.scandir(path) as it:
+            for entry in it:
+                if "classes" in entry.name and entry.is_dir():
+                    with os.scandir(path + "/" + entry.name) as classes:
+                        for c in classes:
+                            #
+                            # Check for underscore in bbclass filename
+                            #
+                            if c.name.endswith(".bbclass") and "_" in c.name and not c.name in oecore_known_classes:
+
+                                print("Warning: BBClass file name contains '_': " + path + "/" + entry.name + "/" + c.name)
+                            #
+                            # Check for '-' in exported functions and tasks
+                            #
+                            with open(path + "/" + entry.name + "/" + c.name) as f:
+                                for line in f.readlines():
+                                    if line.startswith("addtask ") and "-" in line:
+                                        print("Warning: addtask contains '-': " + path + "/" + entry.name + "/" + c.name + ": " + line)
+                                    if line.startswith("EXPORT_FUNCTIONS ") and "-" in line:
+                                        print("Warning: EXPORT_FUNCTIONS contains '-': " + path + "/" + entry.name + "/" + c.name + ": " + line)
+
+    tinfoil.shutdown()
-- 
2.34.1



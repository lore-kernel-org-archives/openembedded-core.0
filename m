Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1E0C41513
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 13:56:30 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.7978.1690466182646536972
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 06:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=4juu9Y6Q;
 spf=pass (domain: baylibre.com, ip: 209.85.128.52, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3fbfa811667so15213905e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 06:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690466181; x=1691070981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1nmL1q+E7XrSHgla+TArgXWSzxDcWADWvn1oNCRt7c=;
        b=4juu9Y6Q3qpW0x5cfw/CzM/HPhE+uFM1iOcX/8QTGimH7QdgQcSq2GYSDb9v9fw6So
         yBJUKAWJz/e0FNOR60M8oTCp/bYPq2LA5g3QBPwUUuXBsjW6RD58gZwIazJeYDcuj1rG
         PVuwBKSTFH+FwmstPnRYhvnOGmAhm5BaCEBz/R0WkpDZtxZX/46QhxfzNhQJkzu/MGbB
         4NyMqS0nZNhYre8DOGWcRZVhHmJAIrudWE1MWRYGfsDDrJhCjt0xn942rzXI50nItTZ0
         BvFN6qV2NNhrapdQJAbLm4iEj/AGPh2vGfqPb2mXnJGALcfQgE3O+gRjt+BfVfy81AO3
         U5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690466181; x=1691070981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1nmL1q+E7XrSHgla+TArgXWSzxDcWADWvn1oNCRt7c=;
        b=gBYTukDkaQM+51ieHL5KEVENnhIWBHSEYR4ACH+ZwbnaqGuwpwlhqkG+38VzX2r+IS
         x9vND4GJcgb+EY8e4DtdPCuLqHS2qLOCfB5Wu95SFRqa1+Eoj+8INbCWry/HGizGVVTC
         pCBmZL/sWTpmYIfv0JJdalTxYihaQUeSirGyS8KgJ4bI/U5LvQFgWqh8aLMrG9FlK9Z3
         6zYtipa8R+Au/RruXECA86kC9L+q6d9T/jkYx59iHZ0DxYLQmyIBIBOMBG+cPtlwBpTv
         rrRIs79911lLvKgExsuKbWxQGKqz7MvqXJ/HDi3I10j4a9cEgQXKbUSwosY7du8ti+6M
         55Mw==
X-Gm-Message-State: ABy/qLY40VlPlf0Hir+aDJxM52kOXXpPXnnk0ey00lkohfYfDRt/FnSj
	ZDE4RfymzGLIee5pPIC8epQiPyFr4xHVYxUklyw4cg==
X-Google-Smtp-Source: APBJJlERxAfCBiA4PRrq1ZGxwCiVytG5qj8k3R08/YxF1H275xC94L2dMpgCLssuxrG+kmc3AF3qAA==
X-Received: by 2002:a7b:cc8d:0:b0:3fa:9741:5b73 with SMTP id p13-20020a7bcc8d000000b003fa97415b73mr1866650wma.10.1690466180991;
        Thu, 27 Jul 2023 06:56:20 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id y26-20020a1c4b1a000000b003fc04eb92cbsm1868884wma.44.2023.07.27.06.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 06:56:20 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v3 3/3] scripts/bblock: add a script to lock/unlock recipes
Date: Thu, 27 Jul 2023 15:56:12 +0200
Message-ID: <20230727135612.951926-4-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727135612.951926-1-jstephan@baylibre.com>
References: <20230727135612.951926-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 13:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184935

bblock script allows to lock/unlock recipes to latest task signatures.
The idea is to prevent some recipes to be rebuilt during development.
For example when working on rust recipe, one may not want rust-native to be
rebuilt.

This tool can be used, with proper environment set up, using the following
command:

bblock <recipe_name>

if a <recipe_name>'s task signature change, this task will not be built again and
sstate cache will be used.

[YOCTO #13425]

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 scripts/bblock | 182 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 182 insertions(+)
 create mode 100755 scripts/bblock

diff --git a/scripts/bblock b/scripts/bblock
new file mode 100755
index 00000000000..a9c5583127e
--- /dev/null
+++ b/scripts/bblock
@@ -0,0 +1,182 @@
+#!/usr/bin/env python3
+# bblock
+# lock/unlock task to latest signature
+#
+# Copyright (c) 2023 BayLibre, SAS
+# Author: Julien Stepahn <jstephan@baylibre.com>
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import os
+import sys
+import logging
+
+scripts_path = os.path.dirname(os.path.realpath(__file__))
+lib_path = scripts_path + "/lib"
+sys.path = sys.path + [lib_path]
+
+import scriptpath
+
+scriptpath.add_bitbake_lib_path()
+
+import bb.tinfoil
+import bb.msg
+
+import argparse_oe
+
+myname = os.path.basename(sys.argv[0])
+logger = bb.msg.logger_create(myname)
+
+
+def getTaskSignatures(tinfoil, pn, tasks):
+    tinfoil.set_event_mask(
+        [
+            "bb.event.GetTaskSignatureResult",
+            "logging.LogRecord",
+            "bb.command.CommandCompleted",
+            "bb.command.CommandFailed",
+        ]
+    )
+    ret = tinfoil.run_command("getTaskSignatures", pn, tasks)
+    if ret:
+        while True:
+            event = tinfoil.wait_event(1)
+            if event:
+                if isinstance(event, bb.command.CommandCompleted):
+                    break
+                elif isinstance(event, bb.command.CommandFailed):
+                    logger.error(str(event))
+                    sys.exit(2)
+                elif isinstance(event, bb.event.GetTaskSignatureResult):
+                    sig = event.sig
+                elif isinstance(event, logging.LogRecord):
+                    logger.handle(event)
+    else:
+        logger.error("No result returned from getTaskSignatures command")
+        sys.exit(2)
+    return sig
+
+
+def parseRecipe(tinfoil, recipe):
+    try:
+        tinfoil.parse_recipes()
+        d = tinfoil.parse_recipe(recipe)
+    except Exception:
+        logger.error("Failed to get recipe info for: %s" % recipe)
+        sys.exit(1)
+    return d
+
+
+def bblockDump(lockfile):
+    try:
+        with open(lockfile, "r") as lockfile:
+            for line in lockfile:
+                print(line.strip())
+    except IOError:
+        return 1
+    return 0
+
+
+def bblockReset(lockfile, pns, package_archs, tasks):
+    if not pns:
+        logger.info("Unlocking all recipes")
+        try:
+            os.remove(lockfile)
+        except FileNotFoundError:
+            pass
+    else:
+        logger.info("Unlocking {pns}".format(pns=pns))
+        tmp_lockfile = lockfile + ".tmp"
+        with open(lockfile, "r") as infile, open(tmp_lockfile, "w") as outfile:
+            for line in infile:
+                if not (
+                    any(element in line for element in pns)
+                    and any(element in line for element in package_archs.split())
+                ):
+                    outfile.write(line)
+                else:
+                    if tasks and not any(element in line for element in tasks):
+                        outfile.write(line)
+        os.remove(lockfile)
+        os.rename(tmp_lockfile, lockfile)
+
+
+def main():
+    parser = argparse_oe.ArgumentParser(description="Lock and unlock a recipe")
+    parser.add_argument("pn", nargs="*", help="Space separated list of recipe to lock")
+    parser.add_argument(
+        "-t",
+        "--tasks",
+        help="Comma separated list of tasks",
+        type=lambda s: [task for task in s.split(",")],
+    )
+    parser.add_argument(
+        "-r",
+        "--reset",
+        action="store_true",
+        help="Unlock pn recipes, or all recipes if pn is empty",
+    )
+    parser.add_argument(
+        "-d",
+        "--dump",
+        action="store_true",
+        help="Dump generated bblock.conf file",
+    )
+
+    global_args, unparsed_args = parser.parse_known_args()
+
+    with bb.tinfoil.Tinfoil() as tinfoil:
+        tinfoil.prepare(config_only=True)
+
+        package_archs = tinfoil.config_data.getVar("PACKAGE_ARCHS")
+        builddir = tinfoil.config_data.getVar("TOPDIR")
+        lockfile = "{builddir}/conf/bblock.conf".format(builddir=builddir)
+
+        if global_args.dump:
+            bblockDump(lockfile)
+            return 0
+
+        if global_args.reset:
+            bblockReset(lockfile, global_args.pn, package_archs, global_args.tasks)
+            return 0
+
+        with open(lockfile, "a") as lockfile:
+            s = ""
+            if lockfile.tell() == 0:
+                s = "# Generated by bblock\n"
+                s += 'SIGGEN_LOCKEDSIGS_TASKSIG_CHECK = "warn"\n'
+                s += 'SIGGEN_LOCKEDSIGS_TYPES += "${PACKAGE_ARCHS}"\n'
+                s += "\n"
+
+            for pn in global_args.pn:
+                d = parseRecipe(tinfoil, pn)
+                package_arch = d.getVar("PACKAGE_ARCH")
+                siggen_locked_sigs_package_arch = d.getVar(
+                    "SIGGEN_LOCKEDSIGS_{package_arch}".format(package_arch=package_arch)
+                )
+                sigs = getTaskSignatures(tinfoil, [pn], global_args.tasks)
+                for sig in sigs:
+                    new_entry = "{pn}:{taskname}:{sig}".format(
+                        pn=sig[0], taskname=sig[1], sig=sig[2]
+                    )
+                    if (
+                        siggen_locked_sigs_package_arch
+                        and not new_entry in siggen_locked_sigs_package_arch
+                    ) or not siggen_locked_sigs_package_arch:
+                        s += 'SIGGEN_LOCKEDSIGS_{package_arch} += "{new_entry}"\n'.format(
+                            package_arch=package_arch, new_entry=new_entry
+                        )
+            lockfile.write(s)
+    return 0
+
+
+if __name__ == "__main__":
+    try:
+        ret = main()
+    except Exception:
+        ret = 1
+        import traceback
+
+        traceback.print_exc()
+    sys.exit(ret)
-- 
2.41.0



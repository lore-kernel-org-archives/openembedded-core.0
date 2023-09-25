Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB4FCCE7A89
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 08:05:09 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.56258.1695629100921640653
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 01:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=2M5RT3qp;
 spf=pass (domain: baylibre.com, ip: 209.85.128.42, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3ff1c397405so66120115e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 01:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695629099; x=1696233899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgepOdc7k1McPs079y0Ee/esHUoC5+fmU7aVGlyMQAk=;
        b=2M5RT3qpknURrETna7r5xOxEY6e53wC/fQqHZ0SPWvXMY05Hgzs/zSZb4YjkzxhPd2
         rGpd+RRSetyakIXz6qj2tc2Vi8H6saZGGSlCVrTbHGyPvDj5WKnthW+8ZDjnsuitMRF9
         ilDw8K2ErkQKtgn7tE84hGBO4+6jMIpmFGY4kY+dlpkAoTMLPYeVsL9QJeZ3aqbO13TY
         UUYv8SzANYByGzoJ77CfFbjhYeZuUdtDckMKozl0i6yxZAHSdrtLgMAe8M/ENRvNlEdj
         NLKZxoeCSK9HtxHhsMpgtjc50IsFpGrTw9cR4MFdqcgHmJWUiaLIAzl8Uha4JthasjuJ
         gfUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695629099; x=1696233899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgepOdc7k1McPs079y0Ee/esHUoC5+fmU7aVGlyMQAk=;
        b=UoOvhfvUuKPDeLMHO+V/9cOyxVqUcWV+CH1Y9Ri35utS4zT7NIxRWwgUCLJxBW2atw
         4MMDfeCU7h1Uq5hmdDaj4BnTsg42XtCxIeZxoPAxgO8HlkSNnAKpLssbRaRc4QRMhsa8
         uUdi+XlCfdIqjgJwWuW08j1wfomXoI0021r4SceXAMSIQeXnQspm/O2SOAJtYXUMBSuU
         Bkg0rTRhvep1clE4g6BeZwu8CjplLYCg1+64zTp86vllKRwitrcwrIHTpZx0oEbzw06O
         7S35h4/TUoze0I5RVQaMmM5ND1ijwpFFWSZrm0F1gTxuXvDQXbXKB5sBT9l5iZK542S6
         rbZg==
X-Gm-Message-State: AOJu0YyNnXVATHCQoSmgjOvL9IjDBbfX7+JgctYHh/RS7rcPY/CMul3R
	4y6E6d3o9pnx/ejBXlpHkzpoz01Sq8FbdttzNoI=
X-Google-Smtp-Source: AGHT+IEfG7bpcnk37Ad1UkNPIGwhG8MLyCFORNYS/icOQieGC5oGyaoK/Sv+Yz8MPj26VLnopVNvkw==
X-Received: by 2002:a05:600c:2a43:b0:403:b64:ad0a with SMTP id x3-20020a05600c2a4300b004030b64ad0amr4336749wme.26.1695629099087;
        Mon, 25 Sep 2023 01:04:59 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600c040c00b0040586360a36sm3196950wmb.17.2023.09.25.01.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 01:04:58 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v5 4/5] scripts/bblock: add a script to lock/unlock recipes
Date: Mon, 25 Sep 2023 10:04:51 +0200
Message-ID: <20230925080452.803540-5-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230925080452.803540-1-jstephan@baylibre.com>
References: <20230925080452.803540-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 08:05:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188178

bblock script allows to lock/unlock recipes to latest task signatures.
The idea is to prevent some recipes to be rebuilt during development.
For example when working on rust recipe, one may not want rust-native to be
rebuilt.

This tool can be used, with proper environment set up, using the following
command:

bblock <recipe_name>

See help for more details

if a <recipe_name>'s task signature change, this task will not be built again and
sstate cache will be used.

[YOCTO #13425]

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 scripts/bblock | 184 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 184 insertions(+)
 create mode 100755 scripts/bblock

diff --git a/scripts/bblock b/scripts/bblock
new file mode 100755
index 00000000000..0082059af81
--- /dev/null
+++ b/scripts/bblock
@@ -0,0 +1,184 @@
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
+        type=lambda s: [
+            task if task.startswith("do_") else "do_" + task for task in s.split(",")
+        ],
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
+                s += 'SIGGEN_LOCKEDSIGS_TASKSIG_CHECK = "info"\n'
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



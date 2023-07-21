Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95163EB64DC
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 14:25:50 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.8487.1689949549518995376
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 07:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=k1xMO2RI;
 spf=pass (domain: baylibre.com, ip: 209.85.128.44, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3fbab0d0b88so19508815e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 07:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689949548; x=1690554348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYzSrkrKFvveduUozLBzmaevun332/ypVSA2OHP5iQo=;
        b=k1xMO2RIrwR+qX5ctTFKNtu0FNM0rPjz4MAIEW9Yukk15aeNk2ysnQHBGBwwrxQyVh
         3p54stVjxL/I1ksH4QAOulCgc0GaDZiY6RtHe97auh0LVg4jepj13TBJ7T1UvfwUohZr
         0Kld6cuuJI2ry1FLerkP5GyYjpvClu9liRz7J32NnoW+c6nihHkl+egq5jwel7BJOtME
         IPd/DAZqDd5rv+ZL9YsZKi9hFGZcaybLENT2knrJdTJuFqDTMOVxVkgptZhfQBfeAnl9
         hFVBP0vVdq39m6dKiISltrDPvdXojuyG+gmQgiqCfVu+5O92YsMS5vcTHf8W2PllBijC
         GrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689949548; x=1690554348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYzSrkrKFvveduUozLBzmaevun332/ypVSA2OHP5iQo=;
        b=aIme8qTqjQJLlnhcaeiKSSNCMvLMNMB4WYlC+gAOqf5Vv4R/LxLnLy3PkKKTRA5wWP
         2NmbYUVhuX0Qxwv1Pyrl96xol/SUBPWaRCJAT/cRVQp6CwwR8pRSfH7U5VXywL2vYZwW
         fTOaHnlYfulLWL/DLf003jtHC7FiSZkBKX05QWhS5dvQtRzJC+4nFvPDgz4+/jChhe1i
         0UZrFKmMjGknh7i5ct+ANe3Bpd39PttZPJip2cR9jyR2KJ4Tz4LbOQXCytM/fxTnkREk
         8dCz7iLBXSSp/SiPeZUZnHEJYhfgTzMyiO4JypthwIHIKDV4s/TWcgl3q6ZWTtj4cSBy
         1qcA==
X-Gm-Message-State: ABy/qLYgCpHu94ItI0ybnbEtT7GwXgdVFvIHcv5L1jLCnAaMGR1XKBth
	n7Vokd7Se6vG3JvBgH2X4+GiDRrsQ47vazHJMgwnUA==
X-Google-Smtp-Source: APBJJlFly0LzSzsA6px6TN76beUNkfjfzas4ak8nN/pEFzkti4gfTExypWcYMt3r2thWaWmpBUBOaA==
X-Received: by 2002:a5d:53c2:0:b0:315:9ec6:7401 with SMTP id a2-20020a5d53c2000000b003159ec67401mr5268100wrw.21.1689949547803;
        Fri, 21 Jul 2023 07:25:47 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:fd3b:9fed:e621:cc8f])
        by smtp.gmail.com with ESMTPSA id l5-20020a1ced05000000b003fc02219081sm3392059wmh.33.2023.07.21.07.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 07:25:47 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [RFC v2 2/2] scripts/bblock: add a script to lock/unlock recipes
Date: Fri, 21 Jul 2023 16:25:43 +0200
Message-ID: <20230721142543.246415-3-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721142543.246415-1-jstephan@baylibre.com>
References: <20230721142543.246415-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 14:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184699

bblock script allows to lock/unlock recipes to latest signatures. The idea is
to prevent some recipes to be rebuilt during development. For example
when working on rust recipe, one may not want rust-native to be
rebuilt.

This tool can be used, with proper environment set up, using the following
command:

bblock <recipe_name>

if <recipe_name>'s task signatures change it will not be built again and
sstate cache will be used.

[YOCTO #13425]

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 scripts/bblock | 184 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 184 insertions(+)
 create mode 100755 scripts/bblock

diff --git a/scripts/bblock b/scripts/bblock
new file mode 100755
index 00000000000..5a269b33806
--- /dev/null
+++ b/scripts/bblock
@@ -0,0 +1,184 @@
+#!/usr/bin/env python3
+# bblock
+# lock/unlock task to latest signature
+#
+# Copyright (c) 2020 BayLibre, SAS
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
+def find_siginfo(tinfoil, pn, taskname, sigs=None):
+    result = None
+    tinfoil.set_event_mask(
+        [
+            "bb.event.FindSigInfoResult",
+            "logging.LogRecord",
+            "bb.command.CommandCompleted",
+            "bb.command.CommandFailed",
+        ]
+    )
+    ret = tinfoil.run_command("findSigInfo", pn, taskname, sigs)
+    if ret:
+        while True:
+            event = tinfoil.wait_event(1)
+            if event:
+                if isinstance(event, bb.command.CommandCompleted):
+                    break
+                elif isinstance(event, bb.command.CommandFailed):
+                    logger.error(str(event))
+                    sys.exit(2)
+                elif isinstance(event, bb.event.FindSigInfoResult):
+                    result = event.result
+                elif isinstance(event, logging.LogRecord):
+                    logger.handle(event)
+    else:
+        logger.error("No result returned from findSigInfo command")
+        sys.exit(2)
+    return result
+
+
+def parse_recipe(tinfoil, recipe):
+    try:
+        tinfoil.parse_recipes()
+        d = tinfoil.parse_recipe(recipe)
+    except Exception:
+        logger.error("Failed to get recipe info for: %s" % recipe)
+        sys.exit(1)
+    return d
+
+
+def dump(lockfile):
+    with open(lockfile, "r") as lockfile:
+        for line in lockfile:
+            print(line.strip())
+    return 0
+
+
+def reset(lockfile, pns, package_archs, tasks):
+    if not pns:
+        logger.info("Unlocking all recipes")
+        os.remove(lockfile)
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
+    sys.exit(0)
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
+
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
+            dump(lockfile)
+
+        tasks = global_args.tasks
+
+        if global_args.reset:
+            reset(lockfile, global_args.pn, package_archs, tasks)
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
+                package_arch = parse_recipe(tinfoil, pn).getVar("PACKAGE_ARCH")
+
+                if not tasks:
+                    # TODO: get a list of all available tasks
+                    tasks = ["do_compile"]
+                for taskname in tasks:
+                    filedates = find_siginfo(tinfoil, pn, taskname)
+                    latestfiles = sorted(
+                        filedates.keys(), key=lambda f: filedates[f], reverse=True
+                    )
+                    if not latestfiles:
+                        logger.error(
+                            "No sigdata files found matching {pn} {taskname}".format(
+                                pn=pn, taskname=taskname
+                            )
+                        )
+                        return 1
+                    sig = latestfiles[0].split("sigdata.")[1]
+
+                    s += 'SIGGEN_LOCKEDSIGS_{package_arch} += "{pn}:{taskname}:{sig}"\n'.format(
+                        package_arch=package_arch, pn=pn, taskname=taskname, sig=sig
+                    )
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



Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135B0C0015E
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 14:28:17 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.15232.1689776887658273550
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 07:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=CoqEQZ9G;
 spf=pass (domain: baylibre.com, ip: 209.85.128.49, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3fd0f000f22so4966605e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 07:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689776886; x=1690381686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLDCNfG3bIwEyH6cPumhPFICgFtqk+eQF67OYRGCnKM=;
        b=CoqEQZ9GZuzmYtaFXuvfjqUu3CUslp3845KMAjXSphL/LvZXmmiCu5rGxji/yXsswg
         E/BQ8TURB7rnfjyN5Ni10P9KkS9zkdKXGdAakkR/fRdNud6/nRI5Z90padvO4ruzhps8
         Am3vkp5JZE1XsBC/eNfKpUONFQcNl7fEj4KRcqo/ug8h5beL7WCVUjisz0hNRWzfWkTq
         t3wSR9FmvVBAQWxTfnzbYMApSrYEEJ6+Mk3JZTvTDNa+qm6LFCfecQPW+QjS2AStcVp+
         4MPiA6fgV+zaL6MTXUY1FP1x2VKrXhdeRlm3ARs4SButYglJOiPg5BLrBddTpc2T0LY6
         BnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689776886; x=1690381686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLDCNfG3bIwEyH6cPumhPFICgFtqk+eQF67OYRGCnKM=;
        b=UZjk0wRIQSQUPvNjxSBj/qZZWdJD5AZsmptvZCpppx0z+5lAfFnu4YWF7XUf3+cQ0u
         4+boMl+AuWWXOHxWDVP3odNJ5fsUeTtB36p4Bk1kzeMmDQH6onTzGYLURfYFFM+0rNkO
         HXjb7yhheGDLKACIAGXe47wvC23keNKO/HQQnmDhvy5EbboDJFAT69dMiwbL2gGDmiCv
         bGvQeL4MsehgAg4CnxUVYGCFcpowG3i6siNzpfI+sIE8Heu/7DMsyJd3ebfYQlSTVzZQ
         drS05W2JouUE10/8oJ0Ts1HLtO2oH87PCgOryO3yOYZL4Oak+3hteMpEEC6yhAz8IeIb
         jqlw==
X-Gm-Message-State: ABy/qLZavui97QAbe+gr2uzV6ZV89WBDxL6ywabuKmaLj6dqlY+T3B6k
	VOqebFhuUbvgy8tswt1gV96jrbsEfjL6474MUUM7zw==
X-Google-Smtp-Source: APBJJlE/sdk/d0JAhE8aTotcX69NfbcZIse1LWcmEPwCtFVBxiCHMXjS8RtEGs5D3FGemrQNxBwEfw==
X-Received: by 2002:a7b:cd96:0:b0:3fb:424b:ef6e with SMTP id y22-20020a7bcd96000000b003fb424bef6emr4952736wmj.23.1689776885837;
        Wed, 19 Jul 2023 07:28:05 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:fd3b:9fed:e621:cc8f])
        by smtp.gmail.com with ESMTPSA id m21-20020a7bcb95000000b003fc00789d5bsm1872544wmi.1.2023.07.19.07.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 07:28:05 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [RFC 1/1] scripts/bblock: add a script to lock/unlock recipes
Date: Wed, 19 Jul 2023 16:27:58 +0200
Message-ID: <20230719142758.84540-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230719142758.84540-1-jstephan@baylibre.com>
References: <20230719142758.84540-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 14:28:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184585

bblock script allows to lock recipes to latest signatures. The idea is
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
 scripts/bblock | 110 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100755 scripts/bblock

diff --git a/scripts/bblock b/scripts/bblock
new file mode 100755
index 00000000000..d463ade6212
--- /dev/null
+++ b/scripts/bblock
@@ -0,0 +1,110 @@
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
+def main():
+    parser = argparse_oe.ArgumentParser(description="Lock and unlock a recipe")
+    parser.add_argument("pn", nargs="*", help="Space separated list of recipe to lock")
+
+    global_args, unparsed_args = parser.parse_known_args()
+
+    with bb.tinfoil.Tinfoil() as tinfoil:
+        tinfoil.prepare(config_only=True)
+        builddir = tinfoil.config_data.getVar("TOPDIR")
+        autoconffile = "{builddir}/conf/auto.conf".format(builddir=builddir)
+        lockfile = "{builddir}/conf/bblock.inc".format(builddir=builddir)
+        with open(lockfile, "a") as lockfile:
+            s = ""
+            if lockfile.tell() == 0:
+                s = "# Generated by bblock\n"
+                s += 'SIGGEN_LOCKEDSIGS_TYPES += "t-bblock"\n'
+                s += 'SIGGEN_LOCKEDSIGS_TASKSIG_CHECK = "warn"'
+                with open(autoconffile, "a") as autoconffile:
+                    autoconffile.write("require bblock.inc")
+            for pn in global_args.pn:
+                taskname = "do_compile"
+                filedates = find_siginfo(tinfoil, pn, taskname)
+                latestfiles = sorted(
+                    filedates.keys(), key=lambda f: filedates[f], reverse=True
+                )
+                if not latestfiles:
+                    logger.error(
+                        "No sigdata files found matching {pn} {taskname}".format(
+                            pn=pn, taskname=taskname
+                        )
+                    )
+                    sys.exit(1)
+                sig = latestfiles[0].split("sigdata.")[1]
+                s += "\n"
+                s += 'SIGGEN_LOCKEDSIGS_t-bblock += "{pn}:{taskname}:{sig}"\n'.format(
+                    pn=pn, taskname=taskname, sig=sig
+                )
+            lockfile.write(s)
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



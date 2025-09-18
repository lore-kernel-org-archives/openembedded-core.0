Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DE3CAC597
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 21:08:20 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.271.1758229693677780863
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 14:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=G7DKUuqP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-20250918210811beba1295ba0002077b-xkaosh@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250918210811beba1295ba0002077b
        for <openembedded-core@lists.openembedded.org>;
        Thu, 18 Sep 2025 23:08:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=r4NXcAd9HhbmM4c391tI3V3uKRZWu/YFr1kmgMtGe04=;
 b=G7DKUuqPejvzDNq1NarX3npmnf9JQjY03YwtKTQaRB+6jOO4c6q20WmjUX1T/ll6Rt7Obd
 bEI8MKraJOVcCbAl6H6STUpW/HR8RWyW4zyb60AlAd+gparNcdHIc7ai57n7sFTxOyFGYIgf
 grbJ++/eVMiGB2RztkBgS4SCxQla2xkaNCeQODRQbVBynZ4+AKuugS0yux6rhU1d4XFjEaq+
 7OXEGllFf98Jv8rwMB/GVj3cA27WKdRpRSknRy2BhJCRmeDS9WaOpoxT/N3mhEgplyvsD9jt
 /c32Anvnv3/NyC8Hx1DTmvO+nG5vtEUEGvXS58khd83YlryEn+gpASlA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 09/19] devtool: ide-sdk: make install_and_deploy script pass target arg
Date: Thu, 18 Sep 2025 23:07:11 +0200
Message-ID: <20250918210754.477049-10-adrian.freihofer@siemens.com>
In-Reply-To: <20250918210754.477049-1-adrian.freihofer@siemens.com>
References: <20250918210754.477049-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 21:08:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223661

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Previously, the target was hardcoded in the install_and_deploy script,
limiting flexibility. This change allows passing the target as a
command-line argument, enabling IDEs to configure the target dynamically
rather than only at IDE configuration generation time.

This is a first step towards making the target configurable from the IDE.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/ide_code.py | 4 ++++
 scripts/lib/devtool/ide_sdk.py              | 5 ++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index ee5bb57265b..8b08add2b17 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -287,6 +287,10 @@ class IdeVSCode(IdeBase):
                     "label": install_task_name,
                     "type": "shell",
                     "command": run_install_deploy,
+                    "args": [
+                        "--target",
+                        args.target
+                    ],
                     "problemMatcher": []
                 }
             ]
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 8b347c904e1..a829386faf1 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -765,6 +765,9 @@ class RecipeModified:
         cmd_lines.append('        for key in my_dict:')
         cmd_lines.append('            setattr(self, key, my_dict[key])')
         cmd_lines.append('filtered_args = Dict2Class(filtered_args_dict)')
+        cmd_lines.append('if len(sys.argv) > 2:')
+        cmd_lines.append('    if sys.argv[1] == "-t" or sys.argv[1] == "--target":')
+        cmd_lines.append('        setattr(filtered_args, "target", sys.argv[2])')
         cmd_lines.append(
             'setattr(filtered_args, "recipename", "%s")' % self.bpn)
         cmd_lines.append('deploy_no_d("%s", "%s", "%s", "%s", "%s", "%s", %d, "%s", "%s", filtered_args)' %
@@ -777,7 +780,7 @@ class RecipeModified:
         """Generate a script which does install and deploy"""
         cmd_lines = ['#!/bin/sh -e']
         cmd_lines.append(self.gen_fakeroot_install_script())
-        cmd_lines.append(self.gen_deploy_target_script(args))
+        cmd_lines.append(self.gen_deploy_target_script(args) + ' "$@"')
         return self.write_script(cmd_lines, 'install_and_deploy')
 
     def write_script(self, cmd_lines, script_name):
-- 
2.51.0



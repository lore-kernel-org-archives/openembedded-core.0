Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7CD9E8B377
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 22:22:01 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6010.1770157316179802737
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 14:21:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=NfWvKzTb;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-20260203222153815891c2de0002072f-sbvqf5@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260203222153815891c2de0002072f
        for <openembedded-core@lists.openembedded.org>;
        Tue, 03 Feb 2026 23:21:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=zsG78H0SKqBOmxoDV4BYv2WG8ibBz5AkAdNOwu9Mn/E=;
 b=NfWvKzTbgDdrM0+QvZmgH0SBp5uLZ2PH7NHyZNUFCmAqSZY7e2M8ItF3y+bZ5OQ+TE8WzH
 aIC+1xfHWjLGMsnrg3fU6OJud4+Ec4IwJIiIFccN1R8IpELDh3NLpv/WIxmVX/PB9OW6SRXy
 ggq7kZ3RaBryCgYMNAXesgcl/4DFM1rFr7VBHDSLwh+fh4nmWwtYBgF0fd2Y4dK4Sp4uZ3oS
 mnVwfXNJDxqB08auLXnMXpFo82e+Z+hG/4u/RB2N+hHQiKle9QrGdunT8cOWzzGvtJ4orYo7
 6sueOvI/TgivRe4SwlPXZjs1FDyLPfCZ0CmFH9fouVUwV95u7RcZdzTQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 07/12] devtool: ide-sdk: make install_and_deploy script pass target arg
Date: Tue,  3 Feb 2026 23:16:23 +0100
Message-ID: <20260203222139.1599349-8-adrian.freihofer@siemens.com>
In-Reply-To: <20260203222139.1599349-1-adrian.freihofer@siemens.com>
References: <20260203222139.1599349-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 22:22:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230485

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
index 67bd341347..3f8c1a44a3 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -306,6 +306,10 @@ class IdeVSCode(IdeBase):
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
index 2af4dca256..96d60ad4f1 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -859,6 +859,9 @@ class RecipeModified:
         cmd_lines.append('        for key in my_dict:')
         cmd_lines.append('            setattr(self, key, my_dict[key])')
         cmd_lines.append('filtered_args = Dict2Class(filtered_args_dict)')
+        cmd_lines.append('if len(sys.argv) > 2:')
+        cmd_lines.append('    if sys.argv[1] == "-t" or sys.argv[1] == "--target":')
+        cmd_lines.append('        setattr(filtered_args, "target", sys.argv[2])')
         cmd_lines.append(
             'setattr(filtered_args, "recipename", "%s")' % self.bpn)
         cmd_lines.append('deploy_no_d("%s", "%s", "%s", "%s", "%s", "%s", %d, "%s", "%s", filtered_args)' %
@@ -884,7 +887,7 @@ class RecipeModified:
             'bitbake %s -c install --force || { echo "bitbake %s -c install --force failed"; exit 1; }' % (self.bpn, self.bpn))
 
         # Self contained devtool deploy-target
-        cmd_lines.append(self.gen_deploy_target_script(args))
+        cmd_lines.append(self.gen_deploy_target_script(args) + ' "$@"')
 
         return self.write_script(cmd_lines, 'install_and_deploy')
 
-- 
2.52.0



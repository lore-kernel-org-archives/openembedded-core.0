Return-Path: <ola.x.nilsson@axis.com>
X-Greylist: delayed 366 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 10 Oct 2016 14:25:18 UTC
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 89E0460766
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 14:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id CE4972E0D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 16:19:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id IwMLyS+09XqA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 16:19:12 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 0E4E52E329
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 16:19:12 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EBD621E07E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 16:19:11 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E0F291E07D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 16:19:11 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 16:19:11 +0200 (CEST)
Received: from lnxolani.se.axis.com (lnxolani.se.axis.com [10.88.67.1])
	by seth.se.axis.com (Postfix) with ESMTP id D58D2507
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 16:19:11 +0200 (CEST)
Received: by lnxolani.se.axis.com (Postfix, from userid 20853)
	id BBE6F7C611; Mon, 10 Oct 2016 16:19:11 +0200 (CEST)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Oct 2016 16:19:11 +0200
Message-Id: <1476109151-10857-1-git-send-email-ola.x.nilsson@axis.com>
X-Mailer: git-send-email 2.1.4
X-TM-AS-GCONF: 00
Subject: [PATCH] devtool: Only register each plugin once
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Oct 2016 14:25:18 -0000

When a devtool plugin is shadowed in a higher-priorty layer the
register_commands method was called on the shadowing plugin once for
each found plugin with that name.  A simple unique operation on the list
of loaded plugins solves that problem.  It may still be a problem that
each plugin - shadowed or not - is loaded and initialized.

Signed-off-by: Ola x Nilsson <ola.x.nilsson@axis.com>
---
 scripts/devtool | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/devtool b/scripts/devtool
index 0c32c50..7b134a6 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -317,7 +317,7 @@ def main():
         parser_create_workspace.add_argument('--create-only', action="store_true", help='Only create the workspace layer, do not alter configuration')
         parser_create_workspace.set_defaults(func=create_workspace, no_workspace=True)
 
-    for plugin in plugins:
+    for plugin in set(plugins):
         if hasattr(plugin, 'register_commands'):
             plugin.register_commands(subparsers, context)
 
-- 
2.1.4



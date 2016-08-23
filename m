Return-Path: <ola.x.nilsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 53675731F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 09:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 93013180DD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 11:08:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 7OegZnNOJPSO
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 11:08:21 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id BC66D180A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 11:08:21 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id A64D51A53
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 11:08:21 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 9BA9A1A3D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 11:08:21 +0200 (CEST)
Received: from lnxolani.se.axis.com (lnxolani.se.axis.com [10.88.67.1])
	by seth.se.axis.com (Postfix) with ESMTP id 9A3853DC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 11:08:21 +0200 (CEST)
Received: by lnxolani.se.axis.com (Postfix, from userid 20853)
	id 807F87C611; Tue, 23 Aug 2016 11:08:21 +0200 (CEST)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Aug 2016 11:08:21 +0200
Message-Id: <1471943301-26928-1-git-send-email-ola.x.nilsson@axis.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] devtool: build_image: Fix recipe filter
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
X-List-Received-Date: Tue, 23 Aug 2016 09:08:23 -0000

The missing split() causes dev and dbg packages to match.

Signed-off-by: Ola x Nilsson <ola.x.nilsson@axis.com>
---
 scripts/lib/devtool/build_image.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/build_image.py b/scripts/lib/devtool/build_image.py
index 1e5d09b..14c646a 100644
--- a/scripts/lib/devtool/build_image.py
+++ b/scripts/lib/devtool/build_image.py
@@ -35,7 +35,7 @@ def _get_packages(tinfoil, workspace, config):
     for recipe in workspace:
         data = parse_recipe(config, tinfoil, recipe, True)
         if 'class-target' in data.getVar('OVERRIDES', True).split(':'):
-            if recipe in data.getVar('PACKAGES', True):
+            if recipe in data.getVar('PACKAGES', True).split():
                 result.append(recipe)
             else:
                 logger.warning("Skipping recipe %s as it doesn't produce a "
-- 
2.1.4



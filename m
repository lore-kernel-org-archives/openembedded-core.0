Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id E8B3965CC7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 22:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 638EA188C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 00:01:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 9COKe3eZmZZB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 00:01:51 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id AF5B2188A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 00:01:51 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 993951A09A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 00:01:51 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D4CF1A06F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 00:01:51 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 00:01:51 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 81A9C2E76
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 00:01:51 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v9AM1pGn009441
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 00:01:51 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v9AM1pVl009440
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Oct 2017 00:01:51 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 00:01:49 +0200
Message-Id: <20171010220149.9400-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] devtool: standard: Expand SRCREV before using it in _update_recipe_srcrev
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
X-List-Received-Date: Tue, 10 Oct 2017 22:01:52 -0000

If SRCREV contains a variable reference, any devtool command that
would try to update it would fail. E.g., if SRCREV = "R${PV}", then
devtool finish without having committed any changes would fail with:

  oe.patch.CmdError: Command Error: 'sh -c 'git format-patch R${PV} -o
  /tmp/oepatchb_doareb -- .'' exited with 0 Output:
  fatal: bad revision 'R'

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/lib/devtool/standard.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 14e87b95a4..beea0d4c27 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1298,7 +1298,7 @@ def _update_recipe_srcrev(srctree, rd, appendlayerdir, wildcard_version, no_remo
         if not no_remove:
             # Find list of existing patches in recipe file
             patches_dir = tempfile.mkdtemp(dir=tempdir)
-            old_srcrev = (rd.getVar('SRCREV', False) or '')
+            old_srcrev = rd.getVar('SRCREV') or ''
             upd_p, new_p, del_p = _export_patches(srctree, rd, old_srcrev,
                                                   patches_dir)
             logger.debug('Patches: update %s, new %s, delete %s' % (dict(upd_p), dict(new_p), dict(del_p)))
-- 
2.12.0



Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id D139C6010B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 20:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 2C857184D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 22:30:46 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id NUnhsVxTmfiJ
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 22:30:45 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 181CB1810B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 22:30:45 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 01CC61A060
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 22:30:45 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA3C11A05F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 22:30:44 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 22:30:44 +0200 (CEST)
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by thoth.se.axis.com (Postfix) with ESMTP id DEA161F73
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 22:30:44 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.15.2/8.15.2) with ESMTPS id x8KKUi9W001502
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 22:30:44 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.15.2/8.15.2/Submit) id x8KKUi7E001501
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Sep 2019 22:30:44 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Sep 2019 22:30:42 +0200
Message-Id: <20190920203043.1449-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCH 1/2] devtool: finish: Keep patches ordered when updating bbappend
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
X-List-Received-Date: Fri, 20 Sep 2019 20:30:46 -0000
Content-Transfer-Encoding: 8bit

From: Niclas Svensson <niclass@axis.com>

The _get_patchset_revs() function returns the patches in an
OrderedDict to keep them ordered. However, this information was lost
when the patches were added to the bbappend file.

Signed-off-by: Niclas Svensson <niclas.svensson@axis.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/lib/devtool/standard.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 9eeaefb79c..64fa420bf1 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1619,17 +1619,17 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
                                           patches_dir, changed_revs)
         logger.debug('Pre-filtering: update: %s, new: %s' % (dict(upd_p), dict(new_p)))
         if filter_patches:
-            new_p = {}
-            upd_p = {k:v for k,v in upd_p.items() if k in filter_patches}
+            new_p = OrderedDict()
+            upd_p = OrderedDict((k,v) for k,v in upd_p.items() if k in filter_patches)
             remove_files = [f for f in remove_files if f in filter_patches]
         updatefiles = False
         updaterecipe = False
         destpath = None
         srcuri = (rd.getVar('SRC_URI', False) or '').split()
         if appendlayerdir:
-            files = dict((os.path.join(local_files_dir, key), val) for
+            files = OrderedDict((os.path.join(local_files_dir, key), val) for
                          key, val in list(upd_f.items()) + list(new_f.items()))
-            files.update(dict((os.path.join(patches_dir, key), val) for
+            files.update(OrderedDict((os.path.join(patches_dir, key), val) for
                               key, val in list(upd_p.items()) + list(new_p.items())))
             if files or remove_files:
                 removevalues = None
-- 
2.21.0



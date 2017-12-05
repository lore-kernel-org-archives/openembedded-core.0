Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 69E4B7872E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 01:41:35 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2017 17:41:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,362,1508828400"; d="scan'208";a="181355834"
Received: from gsteoh-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.76.232])
	by orsmga005.jf.intel.com with ESMTP; 04 Dec 2017 17:41:33 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 14:41:11 +1300
Message-Id: <a221cb7e303c69199c59c2d904bc73e1a0823ae7.1512438000.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1512438000.git.paul.eggleton@linux.intel.com>
References: <cover.1512438000.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 02/12] devtool: reset: delete bbappend file if _check_preserve() doesn't
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
X-List-Received-Date: Tue, 05 Dec 2017 01:41:35 -0000

If the .devtool_md5 file doesn't contain a reference to the bbappend
file (e.g. because devtool was interrupted before it could write that
out) then _check_preserve() won't delete it, so we need to delete it
separately because otherwise the recipe won't actually be reset.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index b1669b5..f59c6d6 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1781,6 +1781,13 @@ def _reset(recipes, no_clean, config, basepath, workspace):
     for pn in recipes:
         _check_preserve(config, pn)
 
+        appendfile = workspace[pn]['bbappend']
+        if os.path.exists(appendfile):
+            # This shouldn't happen, but is possible if devtool errored out prior to
+            # writing the md5 file. We need to delete this here or the recipe won't
+            # actually be reset
+            os.remove(appendfile)
+
         preservepath = os.path.join(config.workspace_path, 'attic', pn, pn)
         def preservedir(origdir):
             if os.path.exists(origdir):
-- 
2.9.5



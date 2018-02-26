Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0AC637870D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 01:50:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Feb 2018 17:50:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,395,1515484800"; d="scan'208";a="206908195"
Received: from cthanang-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.165.39])
	by fmsmga005.fm.intel.com with ESMTP; 25 Feb 2018 17:50:42 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 14:49:56 +1300
Message-Id: <4a91edc11ddb133f060a2da373ee766c50575490.1519609613.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1519609613.git.paul.eggleton@linux.intel.com>
References: <cover.1519609613.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 3/8] devtool: reset: delete bbappend file if _check_preserve() doesn't
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
X-List-Received-Date: Mon, 26 Feb 2018 01:50:43 -0000

If the .devtool_md5 file doesn't contain a reference to the bbappend
file (e.g. because devtool was interrupted before it could write that
out) then _check_preserve() won't delete it, so we need to delete it
separately because otherwise the recipe won't actually be reset.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index f29d8cbb689..2dbb1976422 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1791,6 +1791,13 @@ def _reset(recipes, no_clean, config, basepath, workspace):
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
2.14.3



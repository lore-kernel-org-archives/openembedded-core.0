Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 775777881B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 03:02:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2018 19:02:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,381,1515484800"; d="scan'208";a="30026552"
Received: from vsharmab-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.74.120])
	by orsmga003.jf.intel.com with ESMTP; 22 Feb 2018 19:02:56 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Feb 2018 16:02:11 +1300
Message-Id: <09abcbd66873559554aac9c0fceac128585c093a.1519354910.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1519354910.git.paul.eggleton@linux.intel.com>
References: <cover.1519354910.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/8] devtool: reset: delete bbappend file if _check_preserve() doesn't
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
X-List-Received-Date: Fri, 23 Feb 2018 03:02:57 -0000

If the .devtool_md5 file doesn't contain a reference to the bbappend
file (e.g. because devtool was interrupted before it could write that
out) then _check_preserve() won't delete it, so we need to delete it
separately because otherwise the recipe won't actually be reset.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 7c4ae859434..0c31e1768cf 100644
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



Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0B29D76DAA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 16:09:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 30 Aug 2015 09:09:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,435,1437462000"; d="scan'208";a="793808641"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 30 Aug 2015 09:09:02 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 987A86A4005
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 09:08:10 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Aug 2015 19:08:42 +0300
Message-Id: <98b32ba260d0d9369d4c3cbe094c18faa1d70ab7.1440950164.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440950164.git.ed.bartosh@linux.intel.com>
References: <cover.1440950164.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440950164.git.ed.bartosh@linux.intel.com>
References: <cover.1440950164.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 09/11] devtool: build-image: remove <image>.bbappend
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
X-List-Received-Date: Sun, 30 Aug 2015 16:09:01 -0000

Removed <image>.bbappend before generating it again as
it may cause tinfoil to fail due to its wrong content.

It's safe to do as <image>.bbappend is regenerated anyway.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/devtool/build-image.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/lib/devtool/build-image.py b/scripts/lib/devtool/build-image.py
index 563563b..5bc8213 100644
--- a/scripts/lib/devtool/build-image.py
+++ b/scripts/lib/devtool/build-image.py
@@ -50,6 +50,11 @@ def build_image(args, config, basepath, workspace):
     appendfile = os.path.join(config.workspace_path, 'appends',
                               '%s.bbappend' % image)
 
+    # remove <image>.bbapend to make sure setup_tinfoil doesn't
+    # break because of it
+    if os.path.isfile(appendfile):
+        os.unlink(appendfile)
+
     recipes = _get_recipes(workspace, config)
     if recipes:
         with open(appendfile, 'w') as afile:
-- 
2.1.4



Return-Path: <tom.zanussi@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6C28B6D23C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 04:45:40 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Oct 2013 21:45:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,519,1378882800"; d="scan'208";a="420984206"
Received: from unknown (HELO localhost) ([10.255.15.248])
	by orsmga002.jf.intel.com with ESMTP; 17 Oct 2013 21:45:41 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 23:45:38 -0500
Message-Id: <e26ce5b635c47a689838223431871afef22b3a0d.1382071241.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <4a1a0d1872eef858826437e1e49bd1acfe9b6d87.1382071241.git.tom.zanussi@linux.intel.com>
References: <4a1a0d1872eef858826437e1e49bd1acfe9b6d87.1382071241.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1382071241.git.tom.zanussi@linux.intel.com>
References: <cover.1382071241.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 2/2] wic: Initialize return values in find_artifacts()
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
X-List-Received-Date: Fri, 18 Oct 2013 04:45:40 -0000

If one of these isn't found, it won't be initialized and will throw an
UnboundLocalError.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/image/engine.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/image/engine.py b/scripts/lib/image/engine.py
index be29222..b3a9c74 100644
--- a/scripts/lib/image/engine.py
+++ b/scripts/lib/image/engine.py
@@ -82,6 +82,8 @@ def find_artifacts(image_name):
         print "Couldn't get '%s' output, exiting." % bitbake_env_cmd
         sys.exit(1)
 
+    rootfs_dir = kernel_dir = hdddir = staging_data_dir = native_sysroot = ""
+
     for line in bitbake_env_lines.split('\n'):
         if (get_line_val(line, "IMAGE_ROOTFS")):
             rootfs_dir = get_line_val(line, "IMAGE_ROOTFS")
-- 
1.7.11.4



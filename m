Return-Path: <brendan.le.foll@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2599560796
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 09:52:32 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 22 Mar 2016 02:52:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,376,1455004800"; d="scan'208";a="673701578"
Received: from jupiter.iwi.intel.com ([172.28.33.51])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Mar 2016 02:52:34 -0700
From: brendan.le.foll@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 09:53:34 +0000
Message-Id: <1458640414-26410-1-git-send-email-brendan.le.foll@intel.com>
X-Mailer: git-send-email 2.7.2
Subject: [PATCH v2] package.bbclass: Treat .node files same as .so when checking what to strip
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
X-List-Received-Date: Tue, 22 Mar 2016 09:52:33 -0000

From: Brendan Le Foll <brendan.le.foll@intel.com>

Typically in a node/npm compiled modules the module is named .node. This is a
binary module without a wrapper so it can actually be relatively large if
unstripped.

Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index ef80e50..5a84255 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -907,7 +907,7 @@ python split_and_strip_files () {
                     continue
                 # Check its an excutable
                 if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH) \
-                        or ((file.startswith(libdir) or file.startswith(baselibdir)) and ".so" in f):
+                        or ((file.startswith(libdir) or file.startswith(baselibdir)) and (".so" in f or ".node" in f)):
                     # If it's a symlink, and points to an ELF file, we capture the readlink target
                     if cpath.islink(file):
                         target = os.readlink(file)
-- 
2.7.2



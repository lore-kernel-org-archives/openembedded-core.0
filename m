Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 34B05776C3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 11:26:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 10 Mar 2017 03:26:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,140,1486454400"; d="scan'208";a="1106988272"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 10 Mar 2017 03:26:09 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Mar 2017 13:24:18 +0200
Message-Id: <9a0e2c2a8322a7c27a4e99c992f8a841ff31822f.1489144807.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 39/44] package.bbclass: don't exclude package groups from runtime mapping
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
X-List-Received-Date: Fri, 10 Mar 2017 11:26:08 -0000

This ensures that remapping happens correctly, particularly
when package groups list noarch packages, and multilib is in use. Previously
this was masked by rpm doing *another* layer of remapping on top of this.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/package.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index f4c2b5514c5..48fef97251b 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -479,9 +479,6 @@ def get_package_additional_metadata (pkg_type, d):
 def runtime_mapping_rename (varname, pkg, d):
     #bb.note("%s before: %s" % (varname, d.getVar(varname)))
 
-    if bb.data.inherits_class('packagegroup', d):
-        return
-
     new_depends = {}
     deps = bb.utils.explode_dep_versions2(d.getVar(varname) or "")
     for depend in deps:
-- 
2.11.0



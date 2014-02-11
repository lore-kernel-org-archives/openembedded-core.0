Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1E7C16E744
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 16:11:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Feb 2014 08:10:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,826,1384329600"; d="scan'208";a="453592983"
Received: from rachelda-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.144])
	by orsmga001.jf.intel.com with ESMTP; 11 Feb 2014 08:10:23 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Feb 2014 16:10:11 +0000
Message-Id: <1392135011-30832-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] classes/buildhistory: avoid buildhistory triggering rebuilds (again)
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
X-List-Received-Date: Tue, 11 Feb 2014 16:11:02 -0000

Postfuncs are now incorporated into task signatures as of BitBake
rev b84d010144de687667cf855ddcb41c9b863c236e, so we need to exclude
the one we're adding to do_fetch. The change to the SSTATEPOSTINSTFUNCS
variable value was also entering the signatures of do_populate_sysroot
and probably other tasks, so we need to use a slightly hacky trick to
avoid that as well.

Apart from the final do_rootfs / do_populate_sysroot, this now means
that adding and removing INHERIT += "buildhistory" will not cause tasks
to be re-run.

Also update the copyright date, properly this time.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 6d1e74a..c048ca2 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -3,7 +3,7 @@
 #
 # Based in part on testlab.bbclass and packagehistory.bbclass
 #
-# Copyright (C) 2013 Intel Corporation
+# Copyright (C) 2011-2014 Intel Corporation
 # Copyright (C) 2007-2011 Koen Kooi <koen@openembedded.org>
 #
 
@@ -18,6 +18,8 @@ BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
 BUILDHISTORY_PUSH_REPO ?= ""
 
 SSTATEPOSTINSTFUNCS += "buildhistory_emit_pkghistory"
+# We want to avoid influence the signatures of sstate tasks
+SSTATEPOSTINSTFUNCS[vardepvalue] := "${@d.getVar('SSTATEPOSTINSTFUNCS', False).replace(' buildhistory_emit_pkghistory', '')}"
 
 #
 # Write out metadata about this package for comparision when writing future packages
@@ -595,6 +597,7 @@ def _get_srcrev_values(d):
     return (dict_srcrevs, dict_tag_srcrevs)
 
 do_fetch[postfuncs] += "write_srcrev"
+do_fetch[vardepsexclude] += "write_srcrev"
 python write_srcrev() {
     pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
     srcrevfile = os.path.join(pkghistdir, 'latest_srcrev')
-- 
1.8.5.3



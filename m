Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C55446F57D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 16:57:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Mar 2014 08:57:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,578,1389772800"; d="scan'208";a="484921427"
Received: from dmilliga-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.25])
	by fmsmga001.fm.intel.com with ESMTP; 03 Mar 2014 08:57:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Mar 2014 16:56:51 +0000
Message-Id: <6786f46ac3a0eab763e8bea59ef5398b4024c095.1393865774.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1393865774.git.paul.eggleton@linux.intel.com>
References: <cover.1393865774.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1393865774.git.paul.eggleton@linux.intel.com>
References: <cover.1393865774.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] classes/buildhistory: fix task signatures changing
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
X-List-Received-Date: Mon, 03 Mar 2014 16:57:02 -0000

Fix task signatures for recipes that add to SSTATEPOSTINSTFUNCS changing
when adding and removing INHERIT += "buildhistory" (really this time!)

This relies on the BitBake vardepvalueexclude feature, however it will
not fail without it - signatures will be changed in that case though.

Part of the fix for [YOCTO #5897].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index ef4135b..1a0e35d 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -18,8 +18,10 @@ BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
 BUILDHISTORY_PUSH_REPO ?= ""
 
 SSTATEPOSTINSTFUNCS += "buildhistory_emit_pkghistory"
-# We want to avoid influence the signatures of sstate tasks
-SSTATEPOSTINSTFUNCS[vardepvalue] := "${@d.getVar('SSTATEPOSTINSTFUNCS', False).replace(' buildhistory_emit_pkghistory', '')}"
+# We want to avoid influence the signatures of sstate tasks - first the function itself:
+sstate_install[vardepsexclude] += "buildhistory_emit_pkghistory"
+# then the value added to SSTATEPOSTINSTFUNCS:
+SSTATEPOSTINSTFUNCS[vardepvalueexclude] .= "| buildhistory_emit_pkghistory"
 
 #
 # Write out metadata about this package for comparision when writing future packages
-- 
1.8.5.3



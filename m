Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 508906F09E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Mar 2014 11:50:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Mar 2014 04:50:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,623,1389772800"; d="scan'208";a="495411320"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.120.155])
	by fmsmga002.fm.intel.com with ESMTP; 10 Mar 2014 04:50:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Mar 2014 11:50:22 +0000
Message-Id: <1394452222-32692-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] classes/sstate: don't overwrite buildhistory vardepsexclude
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
X-List-Received-Date: Mon, 10 Mar 2014 11:50:36 -0000

This was stomping over the value added in buildhistory.bbclass, leading
to task signatures *still* changing when buildhistory was added to
INHERIT.

Fixes [YOCTO #5897].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 9e09a73..03ee820 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -215,7 +215,7 @@ def sstate_install(ss, d):
     for lock in locks:
         bb.utils.unlockfile(lock)
 
-sstate_install[vardepsexclude] = "SSTATE_DUPWHITELIST STATE_MANMACH SSTATE_MANFILEPREFIX"
+sstate_install[vardepsexclude] += "SSTATE_DUPWHITELIST STATE_MANMACH SSTATE_MANFILEPREFIX"
 sstate_install[vardeps] += "${SSTATEPOSTINSTFUNCS}"
 
 def sstate_installpkg(ss, d):
-- 
1.8.5.3



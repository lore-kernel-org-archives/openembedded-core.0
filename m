Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4472571301
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 10:41:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Sep 2014 03:41:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,491,1406617200"; d="scan'208";a="596748092"
Received: from mcorkery-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.35])
	by fmsmga002.fm.intel.com with ESMTP; 09 Sep 2014 03:41:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Sep 2014 11:41:37 +0100
Message-Id: <febd9e57bb27c0c3c2252ce42ed46a3e78d57c3a.1410259186.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1410259186.git.paul.eggleton@linux.intel.com>
References: <cover.1410259186.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1410259186.git.paul.eggleton@linux.intel.com>
References: <cover.1410259186.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 1/1] classes/buildhistory: fix for sstate class change
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
X-List-Received-Date: Tue, 09 Sep 2014 10:41:41 -0000

SSTATEPOSTINSTFUNCS is now set with = in sstate.bbclass, and because
the line here in buildhistory.bbclass ends up being parsed before that
we now need to use _append or the value we are adding will be wiped out.
This fixes buildhistory no longer recording package information since
OE-Core revision 9d659c6f20fa4a141b491c62a3ef0dfb1f896d9c.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index e8cdee5..8b5d5c2 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -17,7 +17,7 @@ BUILDHISTORY_COMMIT ?= "0"
 BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
 BUILDHISTORY_PUSH_REPO ?= ""
 
-SSTATEPOSTINSTFUNCS += "buildhistory_emit_pkghistory"
+SSTATEPOSTINSTFUNCS_append = " buildhistory_emit_pkghistory"
 # We want to avoid influence the signatures of sstate tasks - first the function itself:
 sstate_install[vardepsexclude] += "buildhistory_emit_pkghistory"
 # then the value added to SSTATEPOSTINSTFUNCS:
-- 
1.9.3



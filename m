Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 39497702D9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 10:06:29 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Sep 2014 03:06:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,491,1406617200"; d="scan'208";a="596734020"
Received: from mcorkery-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.35])
	by fmsmga002.fm.intel.com with ESMTP; 09 Sep 2014 03:06:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Sep 2014 11:05:56 +0100
Message-Id: <f29804a5c0895ac56335fad8965946fcb08351df.1410257093.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1410257093.git.paul.eggleton@linux.intel.com>
References: <cover.1410257093.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1410257093.git.paul.eggleton@linux.intel.com>
References: <cover.1410257093.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/sstate: fix regression affecting buildhistory
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
X-List-Received-Date: Tue, 09 Sep 2014 10:06:29 -0000

SSTATEPOSTINSTFUNCS needs to be set with ?= here - if it's = it'll wipe
out what is set in that variable in buildhistory, which ends up being
parsed earlier than the statement in sstate.bbclass. This fixes
buildhistory no longer recording package information since OE-Core
revision 9d659c6f20fa4a141b491c62a3ef0dfb1f896d9c.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index ead829e..6a77d18 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -35,7 +35,7 @@ SSTATE_MANMACH ?= "${SSTATE_PKGARCH}"
 SSTATECREATEFUNCS = "sstate_hardcode_path"
 SSTATEPREINSTFUNCS = ""
 SSTATEPOSTUNPACKFUNCS = "sstate_hardcode_path_unpack"
-SSTATEPOSTINSTFUNCS = ""
+SSTATEPOSTINSTFUNCS ?= ""
 EXTRA_STAGING_FIXMES ?= ""
 
 # Specify dirs in which the shell function is executed and don't use ${B}
-- 
1.9.3



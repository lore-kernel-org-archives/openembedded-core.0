Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 34E36607BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 12:16:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 May 2015 05:16:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,468,1427785200"; d="scan'208";a="733043663"
Received: from lpobrien-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.1.32])
	by orsmga002.jf.intel.com with ESMTP; 21 May 2015 05:16:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2015 13:16:34 +0100
Message-Id: <6d0504aa98e6d2af4aba4d93b5556ef18ad0c6ea.1432210537.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1432210537.git.paul.eggleton@linux.intel.com>
References: <cover.1432210537.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1432210537.git.paul.eggleton@linux.intel.com>
References: <cover.1432210537.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/buildhistory: ensure that git user email and name are set
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
X-List-Received-Date: Thu, 21 May 2015 12:16:41 -0000

The git user.email and user.name settings must be set or the commit to
the buildhistory repo (when BUILDHISTORY_COMMIT is set to "1") will
fail. If the user hasn't set these, set some dummy values since the
actual value is unlikely to be particularly useful and it's far worse
for the commit not to be done leaving the repository in a partially set
up state.

Prompted by [YOCTO #6973].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 211dcf1..777aabc 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -581,6 +581,15 @@ END
 			git tag -f build-minus-2 build-minus-1 > /dev/null 2>&1 || true
 			git tag -f build-minus-1 > /dev/null 2>&1 || true
 		fi
+		# If the user hasn't set up their name/email, set some defaults
+		# just for this repo (otherwise the commit will fail with older
+		# versions of git)
+		if ! git config user.email > /dev/null ; then
+			git config --local user.email "buildhistory@${DISTRO}"
+		fi
+		if ! git config user.name > /dev/null ; then
+			git config --local user.name "buildhistory"
+		fi
 		# Check if there are new/changed files to commit (other than metadata-revs)
 		repostatus=`git status --porcelain | grep -v " metadata-revs$"`
 		HOSTNAME=`hostname 2>/dev/null || echo unknown`
-- 
2.1.0



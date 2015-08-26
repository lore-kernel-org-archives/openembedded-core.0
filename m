Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DF739734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 14:17:41 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2015 07:17:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,416,1437462000"; d="scan'208";a="776041375"
Received: from tlomotow-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.18.45])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2015 07:17:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2015 15:17:13 +0100
Message-Id: <f0bf9e7957116524df35c782f03025f4354f11e0.1440598330.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1440598330.git.paul.eggleton@linux.intel.com>
References: <cover.1440598330.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1440598330.git.paul.eggleton@linux.intel.com>
References: <cover.1440598330.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/8] classes/buildhistory: ensure we push when "no changes" commits are made
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
X-List-Received-Date: Wed, 26 Aug 2015 14:17:45 -0000

If there aren't any changes, we still make a commit to the buildhistory
repo, but this wasn't being pushed if BUILDHISTORY_PUSH_REPO is set.
Move the push to the end to make it unconditional.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index cad5116..e60cdd7 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -621,11 +621,11 @@ END
 				git commit $entry metadata-revs -m "$entry: Build ${BUILDNAME} of ${DISTRO} ${DISTRO_VERSION} for machine ${MACHINE} on $HOSTNAME" -m "cmd: $CMDLINE" --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
 			done
 			git gc --auto --quiet
-			if [ "${BUILDHISTORY_PUSH_REPO}" != "" ] ; then
-				git push -q ${BUILDHISTORY_PUSH_REPO}
-			fi
 		else
 			git commit ${BUILDHISTORY_DIR}/ --allow-empty -m "No changes: Build ${BUILDNAME} of ${DISTRO} ${DISTRO_VERSION} for machine ${MACHINE} on $HOSTNAME" -m "cmd: $CMDLINE" --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
+		fi
+		if [ "${BUILDHISTORY_PUSH_REPO}" != "" ] ; then
+			git push -q ${BUILDHISTORY_PUSH_REPO}
 		fi) || true
 }
 
-- 
2.1.0



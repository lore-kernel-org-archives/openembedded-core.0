Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 243B26DEF3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 18:51:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Dec 2013 10:51:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,812,1378882800"; d="scan'208";a="445490240"
Received: from pmcgurk-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.184])
	by orsmga002.jf.intel.com with ESMTP; 02 Dec 2013 10:51:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Dec 2013 18:50:51 +0000
Message-Id: <34cc88411cf0ee72557230d1009f9cbd8d010069.1386009885.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1386009885.git.paul.eggleton@linux.intel.com>
References: <cover.1386009885.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1386009885.git.paul.eggleton@linux.intel.com>
References: <cover.1386009885.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 8/8] classes/buildhistory: do git garbage collection after committing
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
X-List-Received-Date: Mon, 02 Dec 2013 18:51:04 -0000

We don't normally perform any operations (such as "git pull") that
trigger "git gc --auto", thus garbage collection never happens which
means performance of accessing the repository degrades noticeably over
time. Add an explicit "git gc --auto" to clean things up when needed.

Thanks to Elijah Newren and Ross Burton for suggesting this.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index e46b124..d25496d 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -533,6 +533,7 @@ END
 			for entry in `echo "$repostatus" | awk '{print $2}' | awk -F/ '{print $1}' | sort | uniq` ; do
 				git commit $entry metadata-revs -m "$entry: Build ${BUILDNAME} of ${DISTRO} ${DISTRO_VERSION} for machine ${MACHINE} on $HOSTNAME" -m "cmd: $CMDLINE" --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
 			done
+			git gc --auto
 			if [ "${BUILDHISTORY_PUSH_REPO}" != "" ] ; then
 				git push -q ${BUILDHISTORY_PUSH_REPO}
 			fi
-- 
1.8.1.2



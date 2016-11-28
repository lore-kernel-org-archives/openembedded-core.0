Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id F026771B5C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 16:23:37 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga104.fm.intel.com with ESMTP; 28 Nov 2016 08:23:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,564,1473145200"; d="scan'208";a="36488989"
Received: from jalamego-mobl2.zpn.intel.com ([10.219.5.155])
	by fmsmga005.fm.intel.com with ESMTP; 28 Nov 2016 08:23:38 -0800
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 10:23:00 -0600
Message-Id: <1480350180-9496-1-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1480105843-14729-1-git-send-email-jose.a.lamego@linux.intel.com>
References: <1480105843-14729-1-git-send-email-jose.a.lamego@linux.intel.com>
Subject: [PATCH V2] scripts.send-pull-request: Avoid multiple chain headers
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
X-List-Received-Date: Mon, 28 Nov 2016 16:23:39 -0000

When creating a patch set with cover letter using the
send-pull-request script, both the "In-Reply-To" and "References"
headers are appended twice in patch 2 and subsequent.

This change appends only one header pointing to very first patch
in series or to cover letter if available.

[YOCTO #10718]

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 scripts/send-pull-request | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/send-pull-request b/scripts/send-pull-request
index 575549d..a660c37 100755
--- a/scripts/send-pull-request
+++ b/scripts/send-pull-request
@@ -162,7 +162,7 @@ PATCHES=$(echo $PDIR/*.patch)
 if [ $AUTO_CL -eq 1 ]; then
 	# Send the cover letter to every recipient, both specified as well as
 	# harvested. Then remove it from the patches list.
-	eval "git send-email $GIT_TO $GIT_CC $GIT_EXTRA_CC --confirm=always --no-chain-reply-to --suppress-cc=all $CL"
+	eval "git send-email $GIT_TO $GIT_CC $GIT_EXTRA_CC --confirm=always --no-thread --suppress-cc=all $CL"
 	if [ $? -eq 1 ]; then
 		echo "ERROR: failed to send cover-letter with automatic recipients."
 		exit 1
-- 
1.9.1



Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 211BC7680A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 12:50:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 27 Jan 2016 04:51:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,354,1449561600"; d="scan'208";a="890204755"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 27 Jan 2016 04:50:58 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2016 14:50:53 +0200
Message-Id: <1453899053-24041-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] buildhistory: fix the check for existence of a git repo
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
X-List-Received-Date: Wed, 27 Jan 2016 12:51:04 -0000

Previously, in order to determine the existence of an already
initialized Git repository we checked if a directory named '.git' was
present in the buildhistory dir. However, e.g. in the case of git
submodules '.git' may also be a regular file referencing some other
location which was causing unwanted behavior. This patch changes
buildhistory.bbclass to check for any file named '.git' which fixes
these problems.

[YOCTO #8911]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 9f17442..3c4647a 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -684,7 +684,7 @@ END
 
 	( cd ${BUILDHISTORY_DIR}/
 		# Initialise the repo if necessary
-		if [ ! -d .git ] ; then
+		if [ ! -e .git ] ; then
 			git init -q
 		else
 			git tag -f build-minus-3 build-minus-2 > /dev/null 2>&1 || true
-- 
2.1.4



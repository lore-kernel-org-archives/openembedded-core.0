Return-Path: <george.l.musat@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 804DA76168
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 11:58:31 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jul 2015 04:58:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,523,1432623600"; d="scan'208";a="610685274"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 22 Jul 2015 04:58:31 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id 4EF776A4005;
	Wed, 22 Jul 2015 04:57:47 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jul 2015 14:58:45 +0300
Message-Id: <1437566326-9093-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] ptest-runner: Added timeout per tests.
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
X-List-Received-Date: Wed, 22 Jul 2015 11:58:34 -0000

Until now if a test hanged it would hang the whole process
indefinitely. I added a timeout so that if one test takes too
long it will kill it and skip to the next one.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/recipes-support/ptest-runner/files/ptest-runner | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/ptest-runner/files/ptest-runner b/meta/recipes-support/ptest-runner/files/ptest-runner
index c618f11..a21102e 100644
--- a/meta/recipes-support/ptest-runner/files/ptest-runner
+++ b/meta/recipes-support/ptest-runner/files/ptest-runner
@@ -15,7 +15,7 @@ do
         date "+%Y-%m-%dT%H:%M"
         echo "BEGIN: $x"
         cd "$x"
-        ./run-ptest || ANYFAILED=yes
+        timeout 10m ./run-ptest || ANYFAILED=yes
         echo "END: $x"
         date "+%Y-%m-%dT%H:%M"
     done
-- 
2.1.4



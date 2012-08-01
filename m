Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Swecz-0004DQ-ST
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 21:30:42 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 Aug 2012 12:19:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="174249268"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.201.160])
	by orsmga001.jf.intel.com with ESMTP; 01 Aug 2012 12:19:01 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 12:18:19 -0700
Message-Id: <81cebc4971664125194e077f73c61bcb42505c9a.1343848387.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1343848387.git.dvhart@linux.intel.com>
References: <cover.1343848387.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1343848387.git.dvhart@linux.intel.com>
References: <cover.1343848387.git.dvhart@linux.intel.com>
Subject: [PATCH 1/1] send-pull-request: Make -a really imply -c
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2012 19:30:42 -0000

The switch statement does not fall through as the comment suggests.
This results in -a not implying -c as was intended.

Add the two lines from -c to -a to achieve the intended behavior.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/send-pull-request |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/scripts/send-pull-request b/scripts/send-pull-request
index 09f4245..18a53c4 100755
--- a/scripts/send-pull-request
+++ b/scripts/send-pull-request
@@ -71,8 +71,9 @@ harvest_recipients()
 while getopts "achp:t:" OPT; do
 	case $OPT in
 	a)
+		AUTO=1
+		GITSOBCC="--signed-off-by-cc"
 		AUTO_CL=1
-		# Fall through to include -c
 		;;
 	c)
 		AUTO=1
-- 
1.7.5.4




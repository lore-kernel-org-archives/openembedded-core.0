Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QL1yt-00031L-II
	for openembedded-core@lists.openembedded.org;
	Sat, 14 May 2011 01:41:15 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 May 2011 16:38:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,367,1301900400"; d="scan'208";a="435896539"
Received: from unknown (HELO localhost) ([10.255.12.78])
	by azsmga001.ch.intel.com with ESMTP; 13 May 2011 16:38:08 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2011 16:38:08 -0700
Message-Id: <2bcca2da6cb16866886a329d7f7a74edde7ebabf.1305329659.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1305329659.git.dvhart@linux.intel.com>
References: <cover.1305329659.git.dvhart@linux.intel.com>
Subject: [RFC PATCH 08/10] send-pull-request: fix greedy auto-cc regex
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
X-List-Received-Date: Fri, 13 May 2011 23:41:15 -0000

A greedy regular expression caused emails to be harvested from patches
that were quoted in the commit message. Ensure only tags that start at the
beginning of the line are considered for harvesting.

NOTE: users are still responsible for verifying the recipients list and to
      ensure they do not spam people!

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Saul Wold <sgw@linux.intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 scripts/send-pull-request |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/send-pull-request b/scripts/send-pull-request
index d265c47..b294d35 100755
--- a/scripts/send-pull-request
+++ b/scripts/send-pull-request
@@ -90,7 +90,7 @@ done
 if [ $AUTO -eq 1 ]; then
 	harvest_recipients TO "^[Tt][Oo]: *"
 	harvest_recipients CC "^[Cc][Cc]: *"
-	harvest_recipients CC "^.*-[Bb][Yy]: *"
+	harvest_recipients CC "^[A-Z][A-Za-z-]*-[Bb][Yy]: *"
 fi
 
 AUTO_TO="$(git config sendemail.to)"
-- 
1.7.1




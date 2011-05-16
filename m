Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QM6Hq-0005hg-RM
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 00:29:15 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 May 2011 15:26:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,221,1304319600"; d="scan'208";a="437124242"
Received: from unknown (HELO localhost) ([10.255.12.172])
	by azsmga001.ch.intel.com with ESMTP; 16 May 2011 15:26:16 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2011 15:26:08 -0700
Message-Id: <0fc872adfb5e1ce13837abaa306e26bc947f6e59.1305584418.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <eb4a98eeef982194542a33be0dd615a5c2bf3ed8.1305584418.git.dvhart@linux.intel.com>
References: <eb4a98eeef982194542a33be0dd615a5c2bf3ed8.1305584418.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1305584418.git.dvhart@linux.intel.com>
References: <cover.1305584418.git.dvhart@linux.intel.com>
Subject: [RFC PATCH v2 08/15] send-pull-request: fix greedy auto-cc regex
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
X-List-Received-Date: Mon, 16 May 2011 22:29:15 -0000

A greedy regular expression caused emails to be harvested from patches
that were quoted in the commit message. Ensure only tags that start at the
beginning of the line are considered for harvesting.

NOTE: users are still responsible for verifying the recipients list and to
      ensure they do not spam people!

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
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




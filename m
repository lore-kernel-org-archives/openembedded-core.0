Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMpG2-0003uj-7K
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 00:30:22 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 May 2011 15:27:26 -0700
X-ExtLoop1: 1
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.160])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2011 15:27:25 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 15:26:51 -0700
Message-Id: <8aefc7041dce76364f9a48175ab14742100dc3af.1305756950.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
References: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305756950.git.sgw@linux.intel.com>
References: <cover.1305756950.git.sgw@linux.intel.com>
Subject: [PATCH 22/30] send-pull-request: fix greedy auto-cc regex
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
X-List-Received-Date: Wed, 18 May 2011 22:30:22 -0000

From: Darren Hart <dvhart@linux.intel.com>

A greedy regular expression caused emails to be harvested from patches
that were quoted in the commit message. Ensure only tags that start at the
beginning of the line are considered for harvesting.

NOTE: users are still responsible for verifying the recipients list and to
      ensure they do not spam people!

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Saul Wold <sgw@linux.intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
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
1.7.3.4




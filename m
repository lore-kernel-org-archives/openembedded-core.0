Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMpG4-0003uu-Aq
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 00:30:25 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 May 2011 15:27:27 -0700
X-ExtLoop1: 1
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.160])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2011 15:27:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 15:26:55 -0700
Message-Id: <98d16afb5719d4fdb6a33d73db04578d1a428e0b.1305756950.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
References: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305756950.git.sgw@linux.intel.com>
References: <cover.1305756950.git.sgw@linux.intel.com>
Subject: [PATCH 26/30] create-pull-request: add GitHub remote support
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
X-List-Received-Date: Wed, 18 May 2011 22:30:27 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/create-pull-request |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 9dbd55a..a9cf6f9 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -82,6 +82,10 @@ while getopts "b:chi:m:o:p:r:s:u:" OPT; do
 			REMOTE_REPO=$(echo $REMOTE_URL | sed "s#.*/\(.*\)#\1#")
 			REMOTE_URL=${REMOTE_URL/"ssh://git@"/"git://"}
 			;;
+		git@github.com:*)
+			REMOTE_REPO=$(echo $REMOTE_URL | sed 's#.*:\(.*\)\(\.git\)$#\1#')
+			REMOTE_URL=${REMOTE_URL/"git@github.com:"/"git://github.com/"}
+			;;
 		esac
 		# The .git suffix is optional in the URL, drop in for the REPO
 		REMOTE_REPO=${REMOTE_REPO%.git}
@@ -107,6 +111,9 @@ case "$REMOTE_URL" in
 	*git.pokylinux.org*)
 		WEB_URL="http://git.pokylinux.org/cgit.cgi/$REMOTE_REPO/log/?h=$BRANCH"
 		;;
+	*github.com*)
+		WEB_URL="https://github.com/$REMOTE_REPO/tree/$BRANCH"
+		;;
 esac
 
 # Perform a sanity test on the web URL. Issue a warning if it is not
-- 
1.7.3.4




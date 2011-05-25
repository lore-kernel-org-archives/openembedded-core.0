Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QP9h2-0002N2-JD
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 10:43:53 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 25 May 2011 01:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,266,1304319600"; 
   d="scan'208";a="1223540"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.133])
	by azsmga001.ch.intel.com with ESMTP; 25 May 2011 01:40:48 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2011 01:40:25 -0700
Message-Id: <b75cf390d75957f5b5718892942f76fc4295270f.1306312621.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306312621.git.sgw@linux.intel.com>
References: <cover.1306312621.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306312621.git.sgw@linux.intel.com>
References: <cover.1306312621.git.sgw@linux.intel.com>
Subject: [Updated Consolidated Pull 03/19] send-pull-request: drop sendemail checks
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
X-List-Received-Date: Wed, 25 May 2011 08:43:53 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

git send-email has the correct check on it. Basically the From is
taken from the git 'user' and 'email' config values and in case
'sendemail.smtpserver' is not provided it defaults to use local
sendmail command.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Acked-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/send-pull-request |   16 ----------------
 1 files changed, 0 insertions(+), 16 deletions(-)

diff --git a/scripts/send-pull-request b/scripts/send-pull-request
index cee9253..5dfc246 100755
--- a/scripts/send-pull-request
+++ b/scripts/send-pull-request
@@ -67,19 +67,6 @@ harvest_recipients()
 	unset IFS
 }
 
-check_git_sendemail_config()
-{
-	GIT_SMTP=$(git config sendemail.smtpserver)
-	GIT_FROM=$(git config sendemail.from)
-	if [ -z "$GIT_SMTP" ] || [ -z "$GIT_FROM" ]; then
-		echo "ERROR: git sendemail is not configured."
-		echo "Please read GIT-SEND-EMAIL(1) and configure:"
-		echo "  sendemail.smtpserver"
-		echo "  sendemail.from"
-		exit 1
-	fi
-}
-
 # Parse and verify arguments
 while getopts "achp:t:" OPT; do
 	case $OPT in
@@ -113,9 +100,6 @@ while getopts "achp:t:" OPT; do
 	esac
 done
 
-# Abort early if git-send-email is not properly configured
-check_git_sendemail_config
-
 if [ -z "$PDIR" ]; then
 	echo "ERROR: you must specify a pull-dir."
 	usage
-- 
1.7.3.4




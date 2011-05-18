Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMpG3-0003ul-0T
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 00:30:23 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 May 2011 15:27:26 -0700
X-ExtLoop1: 1
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.160])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2011 15:27:26 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 15:26:53 -0700
Message-Id: <a7394ee35306d57e0985f0981cb16183aa9ab82b.1305756950.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
References: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305756950.git.sgw@linux.intel.com>
References: <cover.1305756950.git.sgw@linux.intel.com>
Subject: [PATCH 24/30] send-pull-request: verify git sendemail config
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
X-List-Received-Date: Wed, 18 May 2011 22:30:24 -0000

From: Darren Hart <dvhart@linux.intel.com>

Perform a quick sanity check to be able to direct users to configure
git.sendemail if they haven't yet.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
---
 scripts/send-pull-request |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/scripts/send-pull-request b/scripts/send-pull-request
index 5a11d1f..21eb302 100755
--- a/scripts/send-pull-request
+++ b/scripts/send-pull-request
@@ -41,6 +41,18 @@ harvest_recipients()
 	unset IFS
 }
 
+check_git_sendemail_config()
+{
+	GIT_SMTP=$(git config sendemail.smtpserver)
+	GIT_FROM=$(git config sendemail.from)
+	if [ -z "$GIT_SMTP" ] || [ -z "$GIT_FROM" ]; then
+		echo "ERROR: git sendemail is not configured."
+		echo "Please read GIT-SEND-EMAIL(1) and configure:"
+		echo "  sendemail.smtpserver"
+		echo "  sendemail.from"
+		exit 1
+	fi
+}
 
 # Parse and verify arguments
 while getopts "achp:t:" OPT; do
@@ -74,6 +86,9 @@ while getopts "achp:t:" OPT; do
 	esac
 done
 
+# Abort early if git-send-email is not properly configured
+check_git_sendemail_config
+
 if [ -z "$PDIR" ]; then
 	echo "ERROR: you must specify a pull-dir."
 	usage
-- 
1.7.3.4




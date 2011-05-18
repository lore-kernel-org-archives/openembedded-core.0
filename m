Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QMkRP-0005jk-Ib
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 19:21:47 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 May 2011 10:18:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,232,1304319600"; 
   d="scan'208";a="480773"
Received: from unknown (HELO localhost) ([10.255.12.192])
	by orsmga001.jf.intel.com with ESMTP; 18 May 2011 10:18:54 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 10:18:30 -0700
Message-Id: <2e826bccf104635bec3a66ca988649510c2ae3c2.1305738598.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <a1cda1da640a96baf3d45b7d4e9577b8b74efbd3.1305738598.git.dvhart@linux.intel.com>
References: <a1cda1da640a96baf3d45b7d4e9577b8b74efbd3.1305738598.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1305738598.git.dvhart@linux.intel.com>
References: <cover.1305738598.git.dvhart@linux.intel.com>
Subject: [PATCH 10/15] send-pull-request: verify git sendemail config
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
X-List-Received-Date: Wed, 18 May 2011 17:21:47 -0000

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
1.7.1




Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QL1z4-00033O-1M
	for openembedded-core@lists.openembedded.org;
	Sat, 14 May 2011 01:41:26 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 May 2011 16:38:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,367,1301900400"; 
   d="scan'208";a="1489194"
Received: from unknown (HELO localhost) ([10.255.12.78])
	by fmsmga002.fm.intel.com with ESMTP; 13 May 2011 16:38:35 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2011 16:38:24 -0700
Message-Id: <33b417d1457fc40c41c4957d62e6758ec1cfcc42.1305329659.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1305329659.git.dvhart@linux.intel.com>
References: <cover.1305329659.git.dvhart@linux.intel.com>
Subject: [RFC PATCH 10/10] send-pull-request: verify git sendemail config
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
X-List-Received-Date: Fri, 13 May 2011 23:41:26 -0000

Perform a quick sanity check to be able to direct users to configure
git.sendemail if they haven't yet.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/send-pull-request |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/scripts/send-pull-request b/scripts/send-pull-request
index f94596f..2ccb8e8 100755
--- a/scripts/send-pull-request
+++ b/scripts/send-pull-request
@@ -38,6 +38,18 @@ harvest_recipients()
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
 while getopts "ahp:t:" OPT; do
@@ -67,6 +79,9 @@ while getopts "ahp:t:" OPT; do
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




Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMpG2-0003ul-6m
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 00:30:22 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 May 2011 15:27:25 -0700
X-ExtLoop1: 1
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.160])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2011 15:27:25 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 15:26:50 -0700
Message-Id: <183a273ff59e4bb908c0a4b9ae670bdab414f39c.1305756950.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
References: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305756950.git.sgw@linux.intel.com>
References: <cover.1305756950.git.sgw@linux.intel.com>
Subject: [PATCH 21/30] send-pull-request: remove local mta support
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

There is no real value in supporting sendmail directly when git
can be configured to use it. The script used to generate the
pull request mails relies heavily on git, so doing so here does
not impose any additional dependencies and it greatly reduces the
complexity of this script.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
---
 scripts/send-pull-request |  108 +++++++++------------------------------------
 1 files changed, 21 insertions(+), 87 deletions(-)

diff --git a/scripts/send-pull-request b/scripts/send-pull-request
index 76dd7a2d..d265c47 100755
--- a/scripts/send-pull-request
+++ b/scripts/send-pull-request
@@ -1,15 +1,9 @@
 #!/bin/bash
 AUTO=0
 
-# Check env for any default settings, command line options will override these.
-if [ -z "$PULL_MTA" ]; then
-    PULL_MTA="sendmail"
-fi
-
 # Prevent environment leakage to these vars.
 unset TO
 unset CC
-# allow the user to set FROM in the environment
 
 usage()
 {
@@ -18,10 +12,6 @@ Usage: $(basename $0) [-h] [-a] [[-t email]...] -p pull-dir
   -t email     Explicitly add email to the recipients
   -a           Automatically harvest recipients from "*-by: email" lines
                in the patches in the pull-dir
-  -f           Specify a FROM address, you can also use the FROM environment
-               variable. If you do not specify one, it will try to use the one
-               from your git config. This is ignored if -g is used.
-  -g           Use git-send-email to send mail instead of sendmail
   -p pull-dir  Directory containing summary and patch files
 EOM
 }
@@ -49,17 +39,11 @@ harvest_recipients()
 
 
 # Parse and verify arguments
-while getopts "af:ghp:t:" OPT; do
+while getopts "ahp:t:" OPT; do
 	case $OPT in
 	a)
 		AUTO=1
 		;;
-	f)
-		FROM="$OPTARG"
-		;;
-	g)
-		PULL_MTA="git"
-		;;
 	h)
 		usage
 		exit 0
@@ -109,29 +93,14 @@ if [ $AUTO -eq 1 ]; then
 	harvest_recipients CC "^.*-[Bb][Yy]: *"
 fi
 
-case "$PULL_MTA" in
-git)
-	FROM="$(git config sendemail.from)"
-	AUTO_TO="$(git config sendemail.to)"
-	if [ -n "$AUTO_TO" ]; then
-		if [ -n "$TO" ]; then
-			TO="$TO,$AUTO_TO"
-		else
-			TO="$AUTO_TO"
-		fi
+AUTO_TO="$(git config sendemail.to)"
+if [ -n "$AUTO_TO" ]; then
+	if [ -n "$TO" ]; then
+		TO="$TO,$AUTO_TO"
+	else
+		TO="$AUTO_TO"
 	fi
-	;;
-sendmail)
-	if [ -z "$FROM" ]; then
-		FROM="$(git config user.name) <$(git config user.email)>"
-		if [ -z "$FROM" ]; then
-			echo "ERROR: unable to determine a FROM address"
-			usage
-			exit 1
-		fi
-	fi
-	;;
-esac
+fi
 
 if [ -z "$TO" ] && [ -z "$CC" ]; then
 	echo "ERROR: you have not specified any recipients."
@@ -145,10 +114,7 @@ cat <<EOM
 The following patches:
 $(for PATCH in $PDIR/*.patch; do echo "    $PATCH"; done)
 
-will be sent with the following headers:
-  From: $FROM
-    To: $TO
-    CC: $CC
+will now be sent via the git send-email command.
 
 EOM
 echo "Continue? [y/N] "
@@ -156,52 +122,20 @@ read cont
 
 if [ "$cont" == "y" ] || [ "$cont" == "Y" ]; then
 	ERROR=0
-	case "$PULL_MTA" in
-	git)
-		export IFS=$','
-		GIT_TO=$(for R in $TO; do echo -n "--to='$R' "; done)
-		GIT_CC=$(for R in $CC; do echo -n "--cc='$R' "; done)
-		unset IFS
-		for PATCH in $PDIR/*patch; do
-			# We harvest the emails manually, so force git not to.
-			eval "git send-email $GIT_TO $GIT_CC --no-chain-reply-to --suppress-cc=all $PATCH"
-			if [ $? -eq 1 ]; then
-				ERROR=1
-			fi
-		done
-		;;
-	sendmail)
-		for PATCH in $PDIR/*patch; do
-			# Insert To and CC headers via formail to keep them separate and
-			# appending them to the sendmail command as -- $TO $CC has
-			# proven to be an exercise in futility.
-			#
-			# Clear the From header, leaving it up to sendmail to insert an
-			# appropriate one. Insert the original sender (per git) into the
-			# body of the message.
-			#
-			# Use tail to remove the email envelope from git or formail as
-			# msmtp (sendmail) would choke on them.
-			#
-			# Modify the patch date for sequential delivery, but retain the
-			# original date as "Old-Date".
-			DATE=$(date +"%a, %d %b %Y %k:%M:%S %z")
-			GIT_FROM=$(cat $PATCH | formail -X "From:")
-			cat $PATCH | formail -I "To: $TO" -I "CC: $CC" -I "From: $FROM" -i "Date: $DATE" | sed "0,/^$/s/^$/\n$GIT_FROM\n/" | tail -n +2 | sendmail -t
-			if [ $? -eq 1 ]; then
-				ERROR=1
-			fi
-		done
-		;;
-	*)
-		echo "ERROR: unknown MTA: $PULL_MTA"
-		usage
-		exit 1
-		;;
-	esac
+	export IFS=$','
+	GIT_TO=$(for R in $TO; do echo -n "--to='$R' "; done)
+	GIT_CC=$(for R in $CC; do echo -n "--cc='$R' "; done)
+	unset IFS
+	for PATCH in $PDIR/*patch; do
+		# We harvest the emails manually, so force git not to.
+		eval "git send-email $GIT_TO $GIT_CC --no-chain-reply-to --suppress-cc=all $PATCH"
+		if [ $? -eq 1 ]; then
+			ERROR=1
+		fi
+	done
 
 	if [ $ERROR -eq 1 ]; then
-		echo "ERROR: Failed to send one or more messages. Check your MTA log for details."
+		echo "ERROR: Failed to send one or more messages."
 	fi
 else
 	echo "Send aborted."
-- 
1.7.3.4




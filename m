Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QMkRS-0005jk-IZ
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 19:21:50 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 May 2011 10:18:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,232,1304319600"; 
   d="scan'208";a="480802"
Received: from unknown (HELO localhost) ([10.255.12.192])
	by orsmga001.jf.intel.com with ESMTP; 18 May 2011 10:18:57 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 10:18:34 -0700
Message-Id: <ac93972b340f5fa31e405cd5e894b7edb62ab194.1305738598.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <a1cda1da640a96baf3d45b7d4e9577b8b74efbd3.1305738598.git.dvhart@linux.intel.com>
References: <a1cda1da640a96baf3d45b7d4e9577b8b74efbd3.1305738598.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1305738598.git.dvhart@linux.intel.com>
References: <cover.1305738598.git.dvhart@linux.intel.com>
Subject: [PATCH 14/15] send-pull-request: streamline git-send-email usage
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
X-List-Received-Date: Wed, 18 May 2011 17:21:51 -0000

The script was sending one patch at a time, which defeats the internal
confirmation mechanism of git-send-email (which would otherwise allow
the user to send all patches or abort immediately).

Rework the sending logic to use no more than two commands. Use two
commands when the cover letter is to be sent to all recipients with
the -a argument. Otherwise, send all patches via the same command.

The script duplicates git's send confirmation, eliminate that.

Reported-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Acked-by: Joshua Lock <josh@linux.intel.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Joshua Lock <josh@linux.intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
---
 scripts/send-pull-request |   68 +++++++++++++++++---------------------------
 1 files changed, 26 insertions(+), 42 deletions(-)

diff --git a/scripts/send-pull-request b/scripts/send-pull-request
index 21eb302..8d0bd34 100755
--- a/scripts/send-pull-request
+++ b/scripts/send-pull-request
@@ -1,6 +1,7 @@
 #!/bin/bash
 AUTO=0
 AUTO_CL=0
+GITSOBCC=""
 
 # Prevent environment leakage to these vars.
 unset TO
@@ -59,10 +60,11 @@ while getopts "achp:t:" OPT; do
 	case $OPT in
 	a)
 		AUTO_CL=1
-		AUTO=1
-		;;
+		# Fall through to include -c
+		;&
 	c)
 		AUTO=1
+		GITSOBCC="--signed-off-by-cc"
 		;;
 	h)
 		usage
@@ -130,48 +132,30 @@ if [ -z "$TO" ] && [ -z "$AUTO_CC" ]; then
 fi
 
 
-# Generate report for the user and require confirmation before sending
-cat <<EOM
-The following patches:
-$(for PATCH in $PDIR/*.patch; do echo "    $PATCH"; done)
+# Convert the collected addresses into git-send-email argument strings
+export IFS=$','
+GIT_TO=$(for R in $TO; do echo -n "--to='$R' "; done)
+GIT_CC=$(for R in $AUTO_CC; do echo -n "--cc='$R' "; done)
+unset IFS
 
-will now be sent via the git send-email command. Git will prompt you before
-sending any email.
 
-EOM
-echo "Continue? [y/N] "
-read cont
-
-if [ "$cont" == "y" ] || [ "$cont" == "Y" ]; then
-	ERROR=0
-	export IFS=$','
-	GIT_TO=$(for R in $TO; do echo -n "--to='$R' "; done)
-	GIT_CC=$(for R in $AUTO_CC; do echo -n "--cc='$R' "; done)
-	unset IFS
-	for PATCH in $PDIR/*patch; do
-		if [ $AUTO -eq 1 ]; then
-			if [ $PATCH == "$CL" ] && [ $AUTO_CL -eq 1 ]; then
-				# Send the cover letter to every recipient, both
-				# specified as well as harvested.
-				eval "git send-email $GIT_TO $GIT_CC --confirm=always --no-chain-reply-to --suppress-cc=all $PATCH"
-			else
-				# Send the patch to the specified recipients and
-				# those git finds in this specific patch.
-				eval "git send-email $GIT_TO --confirm=always --no-chain-reply-to --signed-off-by-cc $PATCH"
-			fi
-		else
-			# Only send to the explicitly specified recipients
-			eval "git send-email $GIT_TO --confirm=always --no-chain-reply-to --suppress-cc=all $PATCH"
-		fi
-		if [ $? -eq 1 ]; then
-			ERROR=1
-		fi
-	done
-
-	if [ $ERROR -eq 1 ]; then
-		echo "ERROR: Failed to send one or more messages."
+# Handoff to git-send-email. It will perform the send confirmation.
+PATCHES=$(echo $PDIR/*.patch)
+if [ $AUTO_CL -eq 1 ]; then
+	# Send the cover letter to every recipient, both specified as well as
+	# harvested. Then remove it from the patches list.
+	eval "git send-email $GIT_TO $GIT_CC --confirm=always --no-chain-reply-to --suppress-cc=all $CL"
+	if [ $? -eq 1 ]; then
+		echo "ERROR: failed to send cover-letter with automatic recipients."
+		exit 1
 	fi
-else
-	echo "Send aborted."
+	PATCHES=${PATCHES/"$CL"/}
 fi
 
+# Send the patch to the specified recipients and, if -c was specified, those git
+# finds in this specific patch.
+eval "git send-email $GIT_TO --confirm=always --no-chain-reply-to $GITSOBCC $PATCHES"
+if [ $? -eq 1 ]; then
+	echo "ERROR: failed to send patches."
+	exit 1
+fi
-- 
1.7.1




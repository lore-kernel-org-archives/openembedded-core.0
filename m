Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QMkRU-0005mc-Jf
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 19:21:53 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 May 2011 10:18:55 -0700
X-ExtLoop1: 1
Received: from unknown (HELO localhost) ([10.255.12.192])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2011 10:18:53 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 10:18:29 -0700
Message-Id: <15e64ac760b5d68d64e266f00b7481a0ea191e26.1305738598.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <a1cda1da640a96baf3d45b7d4e9577b8b74efbd3.1305738598.git.dvhart@linux.intel.com>
References: <a1cda1da640a96baf3d45b7d4e9577b8b74efbd3.1305738598.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1305738598.git.dvhart@linux.intel.com>
References: <cover.1305738598.git.dvhart@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 09/15] send-pull-request: don't send all patches to everyone even with -a
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
X-List-Received-Date: Wed, 18 May 2011 17:21:53 -0000

Rather than sending every patch to every recipient of the entire series when
-a is used, only send the cover letter to everyone and use git's
--signed-off-by-cc feature to generate an auto cc list for the individual
patches.

Add a -c option to use --signed-off-by-cc to auto cc recipeients at the
individual patch level. This is implied by -a.

Using git to harvest the Cc list means only collecting Signed-off-by and Cc
lines, rather than the more generic *-by lines previously. This is a fair
trade-off for significantly reduced complexity. If users want to add Acked-by
and Tested-by lines and want to use the -a feature, they should include those
recipients as Cc lines as well.

Now that we rely on git for auto-cc for the individual patches,
make sure the user is prompted before sending each patch by forcing
--confirm=always.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Cc: Otavio Salvador <otavio@ossystems.com.br>
---
 scripts/send-pull-request |   75 ++++++++++++++++++++++++++++-----------------
 1 files changed, 47 insertions(+), 28 deletions(-)

diff --git a/scripts/send-pull-request b/scripts/send-pull-request
index b294d35..5a11d1f 100755
--- a/scripts/send-pull-request
+++ b/scripts/send-pull-request
@@ -1,36 +1,40 @@
 #!/bin/bash
 AUTO=0
+AUTO_CL=0
 
 # Prevent environment leakage to these vars.
 unset TO
 unset CC
+unset AUTO_CC
 
 usage()
 {
 cat <<EOM
-Usage: $(basename $0) [-h] [-a] [[-t email]...] -p pull-dir 
-  -t email     Explicitly add email to the recipients
-  -a           Automatically harvest recipients from "*-by: email" lines
-               in the patches in the pull-dir
+Usage: $(basename $0) [-h] [-a] [-c] [[-t email]...] -p pull-dir 
+  -a           Send the cover letter to every recipient listed in Cc and
+               Signed-off-by lines found in the cover letter and the patches.
+	       This option implies -c.
+  -c           Expand the Cc list for the individual patches using the Cc and
+               Signed-off-by lines from the same patch.
   -p pull-dir  Directory containing summary and patch files
+  -t email     Explicitly add email to the recipients
 EOM
 }
 
-# Collect To and CC addresses from the patch files if they exist
-# $1: Which header to add the recipients to, "TO" or "CC"
-# $2: The regex to match and strip from the line with email addresses
+# Collect addresses from a patch into AUTO_CC
+# $1: a patch file
 harvest_recipients()
 {
-	TO_CC=$1
-	REGX=$2
+	PATCH=$1
 	export IFS=$',\n'
-	for PATCH in $PDIR/*.patch; do
-		# Grab To addresses
+	for REGX in "^[Cc][Cc]: *" "^[Ss]igned-[Oo]ff-[Bb]y: *"; do
 		for EMAIL in $(sed '/^---$/q' $PATCH | grep -e "$REGX" | sed "s/$REGX//"); do
-			if [ "$TO_CC" == "TO" ] && [ "${TO/$EMAIL/}" == "$TO" ] && [ -n "$EMAIL" ]; then
-				if [ -z "$TO" ]; then TO=$EMAIL; else TO="$TO,$EMAIL"; fi
-			elif [ "$TO_CC" == "CC" ] && [ "${CC/$EMAIL/}" == "$CC" ] && [ -n "$EMAIL" ]; then
-				if [ -z "$CC" ]; then CC=$EMAIL; else CC="$CC,$EMAIL"; fi
+			if [ "${AUTO_CC/$EMAIL/}" == "$AUTO_CC" ] && [ -n "$EMAIL" ]; then
+				if [ -z "$AUTO_CC" ]; then
+					AUTO_CC=$EMAIL;
+				else
+					AUTO_CC="$AUTO_CC,$EMAIL";
+				fi
 			fi
 		done
 	done
@@ -39,9 +43,13 @@ harvest_recipients()
 
 
 # Parse and verify arguments
-while getopts "ahp:t:" OPT; do
+while getopts "achp:t:" OPT; do
 	case $OPT in
 	a)
+		AUTO_CL=1
+		AUTO=1
+		;;
+	c)
 		AUTO=1
 		;;
 	h)
@@ -84,13 +92,11 @@ for TOKEN in SUBJECT BLURB; do
 done
 
 
-# Harvest emails from the generated patches and populate the TO and CC variables
-# In addition to To and CC headers/lines, the common Signed-off-by, Tested-by,
-# etc. (*-by) will be added to CC.
-if [ $AUTO -eq 1 ]; then
-	harvest_recipients TO "^[Tt][Oo]: *"
-	harvest_recipients CC "^[Cc][Cc]: *"
-	harvest_recipients CC "^[A-Z][A-Za-z-]*-[Bb][Yy]: *"
+# Harvest emails from the generated patches and populate AUTO_CC.
+if [ $AUTO_CL -eq 1 ]; then
+	for PATCH in $PDIR/*.patch; do
+		harvest_recipients $PATCH
+	done
 fi
 
 AUTO_TO="$(git config sendemail.to)"
@@ -102,7 +108,7 @@ if [ -n "$AUTO_TO" ]; then
 	fi
 fi
 
-if [ -z "$TO" ] && [ -z "$CC" ]; then
+if [ -z "$TO" ] && [ -z "$AUTO_CC" ]; then
 	echo "ERROR: you have not specified any recipients."
 	usage
 	exit 1
@@ -114,7 +120,8 @@ cat <<EOM
 The following patches:
 $(for PATCH in $PDIR/*.patch; do echo "    $PATCH"; done)
 
-will now be sent via the git send-email command.
+will now be sent via the git send-email command. Git will prompt you before
+sending any email.
 
 EOM
 echo "Continue? [y/N] "
@@ -124,11 +131,23 @@ if [ "$cont" == "y" ] || [ "$cont" == "Y" ]; then
 	ERROR=0
 	export IFS=$','
 	GIT_TO=$(for R in $TO; do echo -n "--to='$R' "; done)
-	GIT_CC=$(for R in $CC; do echo -n "--cc='$R' "; done)
+	GIT_CC=$(for R in $AUTO_CC; do echo -n "--cc='$R' "; done)
 	unset IFS
 	for PATCH in $PDIR/*patch; do
-		# We harvest the emails manually, so force git not to.
-		eval "git send-email $GIT_TO $GIT_CC --no-chain-reply-to --suppress-cc=all $PATCH"
+		if [ $AUTO -eq 1 ]; then
+			if [ $PATCH == "$CL" ] && [ $AUTO_CL -eq 1 ]; then
+				# Send the cover letter to every recipient, both
+				# specified as well as harvested.
+				eval "git send-email $GIT_TO $GIT_CC --confirm=always --no-chain-reply-to --suppress-cc=all $PATCH"
+			else
+				# Send the patch to the specified recipients and
+				# those git finds in this specific patch.
+				eval "git send-email $GIT_TO --confirm=always --no-chain-reply-to --signed-off-by-cc $PATCH"
+			fi
+		else
+			# Only send to the explicitly specified recipients
+			eval "git send-email $GIT_TO --confirm=always --no-chain-reply-to --suppress-cc=all $PATCH"
+		fi
 		if [ $? -eq 1 ]; then
 			ERROR=1
 		fi
-- 
1.7.1




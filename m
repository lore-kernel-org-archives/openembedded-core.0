Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QMkRM-0005jk-7f
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 19:21:44 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 May 2011 10:18:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,232,1304319600"; 
   d="scan'208";a="480713"
Received: from unknown (HELO localhost) ([10.255.12.192])
	by orsmga001.jf.intel.com with ESMTP; 18 May 2011 10:18:48 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 10:18:23 -0700
Message-Id: <7b0f8dec608a4f893cb68787df0c49845e39fadb.1305738598.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <a1cda1da640a96baf3d45b7d4e9577b8b74efbd3.1305738598.git.dvhart@linux.intel.com>
References: <a1cda1da640a96baf3d45b7d4e9577b8b74efbd3.1305738598.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1305738598.git.dvhart@linux.intel.com>
References: <cover.1305738598.git.dvhart@linux.intel.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 03/15] create-pull-request: use git request-pull and arbitrary remotes
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
X-List-Received-Date: Wed, 18 May 2011 17:21:44 -0000

Allow for arbitrary remotes via a new -u argument. Remove the hard coded
references to the pokylinux repositories. Create the WEB_URL from known
remotes. Future patches can add additional WEB_URL mappings for remotes
like Git Hub, Gitorious, and kernel.org.

Rather than duplicating the git request-pull command ourselves, just use
the existing one.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Acked-by: Joshua Lock <josh@linux.intel.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
Acked-by: Tom Rini <tom_rini@mentor.com>
Cc: Tom Rini <tom_rini@mentor.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Joshua Lock <josh@linux.intel.com>
---
 scripts/create-pull-request |   78 ++++++++++++++++++++++++++++--------------
 1 files changed, 52 insertions(+), 26 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index b911a64..8f7f767 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -2,15 +2,13 @@
 ODIR=pull-$$
 RELATIVE_TO="master"
 COMMIT_ID="HEAD"
-PULL_URL="git://git.openembedded.org/openembedded-core-contrib"
-WEB_URL_PREFIX="http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h="
 PREFIX="PATCH"
 
 usage() {
 CMD=$(basename $0)
 cat <<EOM
-Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to] [-i commit_id] -b contrib_branch
-  -b contrib_branch   Branch-name in the $PULL_URL
+Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to] [-i commit_id] -u remote -b branch
+  -b branch           Branch name in the specified remote
   -h                  Display this help message
   -i commit_id        Ending commit (default: HEAD)
   -m msg_body_file    The file containing a blurb to be inserted into the summary email
@@ -18,20 +16,21 @@ Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to
   -p prefix           Use [prefix N/M] instead of [PATCH N/M] as the subject prefix
   -r relative_to      Starting commit (default: master)
   -s subject          The subject to be inserted into the summary email
+  -u remote           The git remote where the branch is located
 
  Examples:
-   $CMD -b nitin/basic
-   $CMD -r distro/master -i nitin/distro -b nitin/distro
-   $CMD -r master -i misc -b nitin/misc -o pull-misc
-   $CMD -p "RFC PATCH" -b nitin/experimental
+   $CMD -u contrib -b nitin/basic
+   $CMD -u contrib -r distro/master -i nitin/distro -b nitin/distro
+   $CMD -u contrib -r master -i misc -b nitin/misc -o pull-misc
+   $CMD -u contrib -p "RFC PATCH" -b nitin/experimental
 EOM
 }
 
 # Parse and validate arguments
-while getopts "b:hi:m:o:p:r:s:" OPT; do
+while getopts "b:hi:m:o:p:r:s:u:" OPT; do
 	case $OPT in
 	b)
-		CONTRIB_BRANCH="$OPTARG"
+		BRANCH="$OPTARG"
 		;;
 	h)
 		usage
@@ -59,23 +58,45 @@ while getopts "b:hi:m:o:p:r:s:" OPT; do
 	s)
 		SUBJECT="$OPTARG"
 		;;
+	u)
+		REMOTE="$OPTARG"
+		REMOTE_URL=$(git config remote.$REMOTE.url)
+		if [ $? -ne 0 ]; then
+			echo "ERROR: git config failed to find a url for '$REMOTE'"
+			exit 1
+		fi
+		REMOTE_REPO=$(echo $REMOTE_URL | sed "s#.*/\(.*\)#\1#")
+		# The .git suffix is optional in the URL, drop in for the REPO
+		REMOTE_REPO=${REMOTE_REPO%.git}
+		;;
 	esac
 done
 
-if [ -z "$CONTRIB_BRANCH" ]; then
+if [ -z "$BRANCH" ] || [ -z "$REMOTE_URL" ]; then
 	usage
 	exit 1
 fi
 
 
+# Set WEB_URL from known remotes
+case "$REMOTE_URL" in
+	*git.yoctoproject.org*)
+		WEB_URL="http://git.yoctoproject.org/cgit.cgi/$REMOTE_REPO/log/?h=$BRANCH"
+		;;
+	*git.pokylinux.org*)
+		WEB_URL="http://git.pokylinux.org/cgit.cgi/$REMOTE_REPO/log/?h=$BRANCH"
+		;;
+esac
+
 # Perform a sanity test on the web URL. Issue a warning if it is not
 # accessible, but do not abort as users may want to run offline.
-WEB_URL="$WEB_URL_PREFIX$CONTRIB_BRANCH"
-wget -q $WEB_URL -O /dev/null
-if [ $? -ne 0 ]; then
-	echo "WARNING: Branch '$CONTRIB_BRANCH' was not found on the contrib git tree."
-	echo "         Please check your contrib-branch parameter before sending."
-	echo ""
+if [ -n "$WEB_URL" ]; then
+	wget -q $WEB_URL -O /dev/null
+	if [ $? -ne 0 ]; then
+		echo "WARNING: Branch '$BRANCH' was not found on the contrib git tree."
+		echo "         Please check your remote and branch parameter before sending."
+		echo ""
+	fi
 fi
 
 if [ -e $ODIR ]; then
@@ -91,18 +112,23 @@ git format-patch -M --subject-prefix="$PREFIX" -n -o $ODIR --thread=shallow --co
 
 # Customize the cover letter
 CL="$ODIR/0000-cover-letter.patch"
-(cat <<EOM
+PM="$ODIR/pull-msg"
+git request-pull $RELATIVE_TO $REMOTE_URL $COMMIT_ID > "$PM"
+if [ $? -ne 0 ]; then
+	echo "ERROR: git request-pull reported an error"
+	exit 1
+fi
 
-Pull URL: $PULL_URL
-  Branch: $CONTRIB_BRANCH
-  Browse: $WEB_URL
+# The cover letter already has a diffstat, remove it from the pull-msg
+# before inserting it.
+sed -n "0,\#$REMOTE_URL# p" "$PM" | sed -i "/BLURB HERE/ r /dev/stdin" "$CL"
+rm "$PM"
 
-Thanks,
-    $(git config user.name) <$(git config user.email)>
----
+# Insert the WEB_URL if there is one
+if [ -n "$WEB_URL" ]; then
+	echo "  $WEB_URL" | sed -i "\#$REMOTE_URL# r /dev/stdin" "$CL"
+fi
 
-EOM
-) | sed -i "/BLURB HERE/ r /dev/stdin" "$CL"
 
 # If the user specified a message body, insert it into the cover letter and
 # remove the BLURB token.
-- 
1.7.1




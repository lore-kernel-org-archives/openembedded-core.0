Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB756FEF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 02:45:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3J2jZLH023703
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 19:45:35 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 18 Apr 2016 19:45:34 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Apr 2016 19:45:31 -0700
Message-ID: <2ab32eeb8ccf9493baa753d3efc249c11c86eb6f.1461033288.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1461033288.git.liezhi.yang@windriver.com>
References: <cover.1461033288.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] create-pull-request: read remote from env var CONTRIB_REMOTE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Apr 2016 02:45:35 -0000
Content-Type: text/plain

So that we don't have specify "-u <contrib>" everytime, and
CONTRIB_REMOTE can be overrided by -u.

[YOCTO #9409]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/create-pull-request | 66 +++++++++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 32 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 7dc9836..613e7ae 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -45,7 +45,7 @@ Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to
   -p prefix           Use [prefix N/M] instead of [PATCH N/M] as the subject prefix
   -r relative_to      Starting commit (default: master)
   -s subject          The subject to be inserted into the summary email
-  -u remote           The git remote where the branch is located
+  -u remote           The git remote where the branch is located, or set CONTRIB_REMOTE in env
   -d relative_dir     Generate patches relative to directory
 
  Examples:
@@ -58,6 +58,7 @@ Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to
 EOM
 }
 
+REMOTE="$CONTRIB_REMOTE"
 # Parse and validate arguments
 while getopts "b:cd:hi:m:o:p:r:s:u:l:" OPT; do
 	case $OPT in
@@ -101,35 +102,42 @@ while getopts "b:cd:hi:m:o:p:r:s:u:l:" OPT; do
 		;;
 	u)
 		REMOTE="$OPTARG"
-		REMOTE_URL=$(git config remote.$REMOTE.url)
-		if [ $? -ne 0 ]; then
-			echo "ERROR: git config failed to find a url for '$REMOTE'"
-			echo
-			echo "To add a remote url for $REMOTE, use:"
-			echo "  git config remote.$REMOTE.url <url>"
-			exit 1
-		fi
-
-		# Rewrite private URLs to public URLs
-		# Determine the repository name for use in the WEB_URL later
-		case "$REMOTE_URL" in
-		*@*)
-			USER_RE="[A-Za-z0-9_.@][A-Za-z0-9_.@-]*\$\?"
-			PROTO_RE="[a-z][a-z+]*://"
-			GIT_RE="\(^\($PROTO_RE\)\?$USER_RE@\)\([^:/]*\)[:/]\(.*\)"
-			REMOTE_URL=${REMOTE_URL%.git}
-			REMOTE_REPO=$(echo $REMOTE_URL | sed "s#$GIT_RE#\4#")
-			REMOTE_URL=$(echo $REMOTE_URL | sed "s#$GIT_RE#git://\3/\4#")
-			;;
-		*)
-			echo "WARNING: Unrecognized remote URL: $REMOTE_URL"
-			echo "         The pull and browse URLs will likely be incorrect"
-			;;
-		esac
 		;;
 	esac
 done
 
+if [ -z "$REMOTE" ]; then
+	echo "ERROR: Missing parameter -u or CONTRIB_REMOTE in env, no git remote!"
+	usage
+	exit 1
+fi
+
+REMOTE_URL=$(git config remote.$REMOTE.url)
+if [ $? -ne 0 ]; then
+	echo "ERROR: git config failed to find a url for '$REMOTE'"
+	echo
+	echo "To add a remote url for $REMOTE, use:"
+	echo "  git config remote.$REMOTE.url <url>"
+	exit 1
+fi
+
+# Rewrite private URLs to public URLs
+# Determine the repository name for use in the WEB_URL later
+case "$REMOTE_URL" in
+*@*)
+	USER_RE="[A-Za-z0-9_.@][A-Za-z0-9_.@-]*\$\?"
+	PROTO_RE="[a-z][a-z+]*://"
+	GIT_RE="\(^\($PROTO_RE\)\?$USER_RE@\)\([^:/]*\)[:/]\(.*\)"
+	REMOTE_URL=${REMOTE_URL%.git}
+	REMOTE_REPO=$(echo $REMOTE_URL | sed "s#$GIT_RE#\4#")
+	REMOTE_URL=$(echo $REMOTE_URL | sed "s#$GIT_RE#git://\3/\4#")
+	;;
+*)
+	echo "WARNING: Unrecognized remote URL: $REMOTE_URL"
+	echo "         The pull and browse URLs will likely be incorrect"
+	;;
+esac
+
 if [ -z "$BRANCH" ]; then
 	BRANCH=$(git branch | grep -e "^\* " | cut -d' ' -f2)
 	echo "NOTE: Assuming remote branch '$BRANCH', use -b to override."
@@ -140,12 +148,6 @@ if [ -z "$L_BRANCH" ]; then
 	echo "NOTE: Assuming local branch HEAD, use -l to override."
 fi
 
-if [ -z "$REMOTE_URL" ]; then
-	echo "ERROR: Missing parameter -u, no git remote!"
-	usage
-	exit 1
-fi
-
 if [ $RFC -eq 1 ]; then
 	PREFIX="RFC $PREFIX"
 fi
-- 
2.7.4



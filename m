Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F18B7765DB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 02:31:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u362VTIA000696
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Apr 2016 19:31:29 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 5 Apr 2016 19:31:28 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Apr 2016 19:31:27 -0700
Message-ID: <7412004fb61286a31cdbaccec78be4c75d4d9458.1459909780.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1459909780.git.liezhi.yang@windriver.com>
References: <cover.1459909780.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] create-pull-request: fix for newer git
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
X-List-Received-Date: Wed, 06 Apr 2016 02:31:31 -0000
Content-Type: text/plain

Fixed when git > 2.1.0:
$ ./scripts/create-pull-request -r HEAD^ -u contrib -b rbt/git
fatal: Not a valid revision: rbt/git
ERROR: git request-pull reported an error

This is because newer git requires both local and remote branch named as
rbt/git, but usually, we only named the remote branch as rbt/foo, and
foo for local branch.

Add a option '-l' to fix the problem, default is HEAD.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/create-pull-request | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index dd66dfe..479ad6e 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -36,6 +36,7 @@ CMD=$(basename $0)
 cat <<EOM
 Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to] [-i commit_id] [-d relative_dir] -u remote [-b branch]
   -b branch           Branch name in the specified remote (default: current branch)
+  -l local branch     Local branch name (default: HEAD)
   -c                  Create an RFC (Request for Comment) patch series
   -h                  Display this help message
   -i commit_id        Ending commit (default: HEAD)
@@ -50,6 +51,7 @@ Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to
  Examples:
    $CMD -u contrib -b nitin/basic
    $CMD -u contrib -r distro/master -i nitin/distro -b nitin/distro
+   $CMD -u contrib -r distro/master -i nitin/distro -b nitin/distro -l distro
    $CMD -u contrib -r master -i misc -b nitin/misc -o pull-misc
    $CMD -u contrib -p "RFC PATCH" -b nitin/experimental
    $CMD -u contrib -i misc -b nitin/misc -d ./bitbake
@@ -57,11 +59,14 @@ EOM
 }
 
 # Parse and validate arguments
-while getopts "b:cd:hi:m:o:p:r:s:u:" OPT; do
+while getopts "b:cd:hi:m:o:p:r:s:u:l:" OPT; do
 	case $OPT in
 	b)
 		BRANCH="$OPTARG"
 		;;
+	l)
+		L_BRANCH="$OPTARG"
+		;;
 	c)
 		RFC=1
 		;;
@@ -130,6 +135,11 @@ if [ -z "$BRANCH" ]; then
 	echo "NOTE: Assuming remote branch '$BRANCH', use -b to override."
 fi
 
+if [ -z "$L_BRANCH" ]; then
+	L_BRANCH=HEAD
+	echo "NOTE: Assuming local branch HEAD, use -l to override."
+fi
+
 if [ -z "$REMOTE_URL" ]; then
 	echo "ERROR: Missing parameter -u, no git remote!"
 	usage
@@ -203,7 +213,7 @@ NEWER_GIT_VERSION=210
 if [ $GIT_VERSION -lt $NEWER_GIT_VERSION ]; then
 	git request-pull $RELATIVE_TO $REMOTE_URL $COMMIT_ID >> "$PM"
 else
-	git request-pull $RELATIVE_TO $REMOTE_URL $BRANCH:$BRANCH >> "$PM"
+	git request-pull $RELATIVE_TO $REMOTE_URL $L_BRANCH:$BRANCH >> "$PM"
 fi
 if [ $? -ne 0 ]; then
 	echo "ERROR: git request-pull reported an error"
-- 
2.8.0



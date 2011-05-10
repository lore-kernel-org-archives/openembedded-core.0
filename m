Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QJs8K-0000Jl-L2
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 20:58:12 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QJs5e-0000gz-GT from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 11:55:26 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 10 May 2011 11:55:26 -0700
Received: from localhost.localdomain ([172.30.12.232]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 10 May 2011 12:55:24 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 May 2011 11:55:06 -0700
Message-Id: <1305053706-19572-1-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 10 May 2011 18:55:24.0960 (UTC)
	FILETIME=[D2227200:01CC0F43]
Subject: [PATCH] create-pull-request: Add -l location switch
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
X-List-Received-Date: Tue, 10 May 2011 18:58:12 -0000

Add a -l switch that takes an argument of either github or gitorious
and will make the cover letter have a fill-in-the-blank of where the
changes are on either github or gitorious.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 scripts/create-pull-request |   19 ++++++++++++++++++-
 1 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 784b48c..2e02d82 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -18,6 +18,7 @@ Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to
   -b contrib_branch   Branch-name in the $PULL_URL
   -s subject          The subject to be inserted into the summary email
   -p prefix           Use [prefix N/M] instead of [PATCH N/M] as the subject prefix
+  -l location         The location (github or gitorious) where the changes are if not in the default contrib repository
 
  Examples:
    $CMD -b nitin/basic
@@ -28,7 +29,7 @@ EOM
 }
 
 # Parse and validate arguments
-while getopts "b:hi:m:o:r:s:p:" OPT; do
+while getopts "b:hi:i:l:m:o:r:s:p:" OPT; do
     case $OPT in
     b)
         CONTRIB_BRANCH="$OPTARG"
@@ -40,6 +41,22 @@ while getopts "b:hi:m:o:r:s:p:" OPT; do
     i)
         COMMIT_ID="$OPTARG"
         ;;
+    l)
+        case $OPTARG in
+        github)
+            PULL_URL="git://github.com/PROJECT/REPO.git"
+            WEB_URL_PREFIX="https://github.com/PROJECT/REPO/tree/"
+            ;;
+        gitorious)
+            PULL_URL="git://gitorious.org/PROJECT/REPO.git"
+            WEB_URL_PREFIX="http://gitorious.org/PROJECTS/REPO/commits/"
+            ;;
+        *)
+            echo "ERROR: Unknown location where the changes are hosted"
+            exit 1
+            ;;
+        esac
+        ;;
     m)
         BODY="$OPTARG"
         if [ ! -e "$BODY" ]; then
-- 
1.7.0.4




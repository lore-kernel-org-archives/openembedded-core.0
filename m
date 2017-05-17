Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B4A8877D70
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 13:27:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 May 2017 06:27:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,354,1491289200"; d="scan'208";a="1131381566"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 17 May 2017 06:27:57 -0700
Received: from vmed.fi.intel.com (crosswalk-testmaster.fi.intel.com
	[10.237.72.36])
	by linux.intel.com (Postfix) with ESMTP id 37BB06A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 06:27:42 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 May 2017 13:27:48 +0000
Message-Id: <59756a163d735c0c7355b20b0e030946ae8815ef.1495027402.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1495027402.git.ed.bartosh@linux.intel.com>
References: <cover.1495027402.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 1/2] Revert "create-pull-request: add "-t in-reply-to" option"
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
X-List-Received-Date: Wed, 17 May 2017 13:27:56 -0000

Rasons:
 - It breaks the script if script is used without -t
 - Its functionality covered by the next patch

This reverts commit 3ad3fda6c5f084f4fa1485b30aa333287989bee7.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/create-pull-request | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 46d65386a3..e82858bc98 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -34,7 +34,7 @@ RFC=0
 usage() {
 CMD=$(basename $0)
 cat <<EOM
-Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to] [-i commit_id] [-d relative_dir] -u remote [-b branch] [-t in_reply_to]
+Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to] [-i commit_id] [-d relative_dir] -u remote [-b branch]
   -b branch           Branch name in the specified remote (default: current branch)
   -l local branch     Local branch name (default: HEAD)
   -c                  Create an RFC (Request for Comment) patch series
@@ -49,7 +49,6 @@ Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to
   -s subject          The subject to be inserted into the summary email
   -u remote           The git remote where the branch is located, or set CPR_CONTRIB_REMOTE in env
   -d relative_dir     Generate patches relative to directory
-  -t in_reply_to      Make mails appear as replies to the given Message-Id, to continue patch/series threads
 
  Examples:
    $CMD -u contrib -b nitin/basic
@@ -58,13 +57,12 @@ Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to
    $CMD -u contrib -r master -i misc -b nitin/misc -o pull-misc
    $CMD -u contrib -p "RFC PATCH" -b nitin/experimental
    $CMD -u contrib -i misc -b nitin/misc -d ./bitbake
-   $CMD -u contrib -p "OE-core][PATCH v2" -t "<cover.11146.git.john.doe@example.com>"
 EOM
 }
 
 REMOTE="$CPR_CONTRIB_REMOTE"
 # Parse and validate arguments
-while getopts "b:acd:hi:m:o:p:r:s:u:l:t:" OPT; do
+while getopts "b:acd:hi:m:o:p:r:s:u:l:" OPT; do
 	case $OPT in
 	b)
 		BRANCH="$OPTARG"
@@ -110,8 +108,6 @@ while getopts "b:acd:hi:m:o:p:r:s:u:l:t:" OPT; do
 	a)
 		CPR_CONTRIB_AUTO_PUSH="1"
 		;;
-        t)
-                IN_REPLY_TO="$OPTARG"
 	esac
 done
 
@@ -209,11 +205,7 @@ if [ -n "$RELDIR" ]; then
 fi
 
 # Generate the patches and cover letter
-if [ -z "$IN_REPLY_TO" ]; then
-    git format-patch $extraopts -M40 --subject-prefix="$PREFIX" -n -o $ODIR --thread=shallow --in-reply-to="$IN_REPLY_TO" --cover-letter $RELATIVE_TO..$COMMIT_ID > /dev/null
-else
-    git format-patch $extraopts -M40 --subject-prefix="$PREFIX" -n -o $ODIR --thread=shallow --cover-letter $RELATIVE_TO..$COMMIT_ID > /dev/null
-fi
+git format-patch $extraopts -M40 --subject-prefix="$PREFIX" -n -o $ODIR --thread=shallow --cover-letter $RELATIVE_TO..$COMMIT_ID > /dev/null
 
 if [ -z "$(ls -A $ODIR 2> /dev/null)" ]; then
     echo "ERROR: $ODIR is empty, no cover letter and patches was generated!"
-- 
2.12.0



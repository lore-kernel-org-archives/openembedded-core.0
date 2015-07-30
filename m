Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E5B1073237
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 11:11:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Jul 2015 04:10:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,576,1432623600"; d="scan'208";a="738733581"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 30 Jul 2015 04:10:59 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 29BD16A4005;
	Thu, 30 Jul 2015 04:10:13 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 14:10:51 +0300
Message-Id: <1438254651-32545-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] create-pull-request: Implement -d option
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
X-List-Received-Date: Thu, 30 Jul 2015 11:11:19 -0000

This options allows to generate patches against relative directory by
using git format-patch --relative option.
See more details about --relative option in git diff manual page.

For example generating bitbake patchsets from poky can be
done this way: create-pull-request -u contrib -d ./bitbake

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/create-pull-request | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 97ed874..216edfd 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -34,7 +34,7 @@ RFC=0
 usage() {
 CMD=$(basename $0)
 cat <<EOM
-Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to] [-i commit_id] -u remote [-b branch]
+Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to] [-i commit_id] [-d relative_dir] -u remote [-b branch]
   -b branch           Branch name in the specified remote (default: current branch)
   -c                  Create an RFC (Request for Comment) patch series
   -h                  Display this help message
@@ -45,17 +45,19 @@ Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to
   -r relative_to      Starting commit (default: master)
   -s subject          The subject to be inserted into the summary email
   -u remote           The git remote where the branch is located
+  -d relative_dir     Generate patches relative to directory
 
  Examples:
    $CMD -u contrib -b nitin/basic
    $CMD -u contrib -r distro/master -i nitin/distro -b nitin/distro
    $CMD -u contrib -r master -i misc -b nitin/misc -o pull-misc
    $CMD -u contrib -p "RFC PATCH" -b nitin/experimental
+   $CMD -u contrib -i misc -b nitin/misc -d ./bitbake
 EOM
 }
 
 # Parse and validate arguments
-while getopts "b:chi:m:o:p:r:s:u:" OPT; do
+while getopts "b:cd:hi:m:o:p:r:s:u:" OPT; do
 	case $OPT in
 	b)
 		BRANCH="$OPTARG"
@@ -63,6 +65,9 @@ while getopts "b:chi:m:o:p:r:s:u:" OPT; do
 	c)
 		RFC=1
 		;;
+	d)
+		RELDIR="$OPTARG"
+		;;
 	h)
 		usage
 		exit 0
@@ -170,10 +175,13 @@ if [ -e $ODIR ]; then
 fi
 mkdir $ODIR
 
+if [ -n "$RELDIR" ]; then
+	ODIR=$(realpath $ODIR)
+	extraopts="--relative=$RELDIR"
+fi
 
 # Generate the patches and cover letter
-git format-patch -M40 --subject-prefix="$PREFIX" -n -o $ODIR --thread=shallow --cover-letter $RELATIVE_TO..$COMMIT_ID > /dev/null
-
+git format-patch $extraopts -M40 --subject-prefix="$PREFIX" -n -o $ODIR --thread=shallow --cover-letter $RELATIVE_TO..$COMMIT_ID > /dev/null
 
 # Customize the cover letter
 CL="$ODIR/0000-cover-letter.patch"
-- 
2.1.4



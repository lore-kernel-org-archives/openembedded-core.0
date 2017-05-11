Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A469671CB4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 13:31:54 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 11 May 2017 06:31:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,324,1491289200"; d="scan'208";a="100271210"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 11 May 2017 06:31:55 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 1A1156A4080;
	Thu, 11 May 2017 06:31:39 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 May 2017 16:09:43 +0300
Message-Id: <1494508183-998-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] create-pull-request: support format-patch options
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
X-List-Received-Date: Thu, 11 May 2017 13:31:56 -0000

Added possibility to specify extra format-patch options
in create-pull-request command line:
   create-pull-request -u contrib -r master -- -v3

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/create-pull-request | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index e82858b..280880b 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -34,7 +34,7 @@ RFC=0
 usage() {
 CMD=$(basename $0)
 cat <<EOM
-Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to] [-i commit_id] [-d relative_dir] -u remote [-b branch]
+Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to] [-i commit_id] [-d relative_dir] -u remote [-b branch] [-- <format-patch options>]
   -b branch           Branch name in the specified remote (default: current branch)
   -l local branch     Local branch name (default: HEAD)
   -c                  Create an RFC (Request for Comment) patch series
@@ -57,6 +57,7 @@ Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to
    $CMD -u contrib -r master -i misc -b nitin/misc -o pull-misc
    $CMD -u contrib -p "RFC PATCH" -b nitin/experimental
    $CMD -u contrib -i misc -b nitin/misc -d ./bitbake
+   $CMD -u contrib -r origin/master -o /tmp/out.v3 -- -v3 --in-reply-to=20170511120134.XX7799@site.com
 EOM
 }
 
@@ -108,9 +109,16 @@ while getopts "b:acd:hi:m:o:p:r:s:u:l:" OPT; do
 	a)
 		CPR_CONTRIB_AUTO_PUSH="1"
 		;;
+	--)
+		shift
+		break
+		;;
 	esac
 done
 
+shift "$((OPTIND - 1))"
+extraopts="$@"
+
 if [ -z "$REMOTE" ]; then
 	echo "ERROR: Missing parameter -u or CPR_CONTRIB_REMOTE in env, no git remote!"
 	usage
@@ -201,7 +209,7 @@ if [ -n "$RELDIR" ]; then
 	ODIR=$(realpath $ODIR)
 	pdir=$(pwd)
 	cd $RELDIR
-	extraopts="--relative"
+	extraopts="$extraopts --relative"
 fi
 
 # Generate the patches and cover letter
@@ -218,7 +226,7 @@ fi
 [ -n "$RELDIR" ] && cd $pdir
 
 # Customize the cover letter
-CL="$ODIR/0000-cover-letter.patch"
+CL="$(echo $ODIR/*0000-cover-letter.patch)"
 PM="$ODIR/pull-msg"
 GIT_VERSION=$(`git --version` | tr -d '[:alpha:][:space:].' | sed 's/\(...\).*/\1/')
 NEWER_GIT_VERSION=210
-- 
2.1.4



Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C7DEE60125
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 09:02:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 05 Aug 2015 02:02:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,615,1432623600"; d="scan'208";a="762313704"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 05 Aug 2015 02:02:03 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 5BAE66A4005;
	Wed,  5 Aug 2015 02:01:17 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Aug 2015 12:01:51 +0300
Message-Id: <1438765311-13423-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] create-pull-request: cd to relative directory
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
X-List-Received-Date: Wed, 05 Aug 2015 09:02:05 -0000

create-pull-request -d path creates empty patches if directory
is specified as a path, i.e. ./bitbake or ./bitbake/ or full path.
It behaves expected way only if script is run with -d bitbake, i.e.
relative dir name doesn't contain '\'.

Fixed this unwanted behaviour by changing directory and running
git format-patch in it with --relative, without specifying
relative path as a parameter.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/create-pull-request | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 216edfd..7eac618 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -177,12 +177,15 @@ mkdir $ODIR
 
 if [ -n "$RELDIR" ]; then
 	ODIR=$(realpath $ODIR)
-	extraopts="--relative=$RELDIR"
+	pushd $RELDIR
+	extraopts="--relative"
 fi
 
 # Generate the patches and cover letter
 git format-patch $extraopts -M40 --subject-prefix="$PREFIX" -n -o $ODIR --thread=shallow --cover-letter $RELATIVE_TO..$COMMIT_ID > /dev/null
 
+[ -n "$RELDIR" ] && popd
+
 # Customize the cover letter
 CL="$ODIR/0000-cover-letter.patch"
 PM="$ODIR/pull-msg"
-- 
2.1.4



Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8B40B60125
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 09:16:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 05 Aug 2015 02:16:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,615,1432623600"; d="scan'208";a="536347531"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Aug 2015 02:16:09 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id CDEB76A4005;
	Wed,  5 Aug 2015 02:15:22 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Aug 2015 12:16:00 +0300
Message-Id: <1438766160-14197-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2] create-pull-request: cd to relative directory
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
X-List-Received-Date: Wed, 05 Aug 2015 09:16:10 -0000

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
index 216edfd..be49379 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -177,12 +177,15 @@ mkdir $ODIR
 
 if [ -n "$RELDIR" ]; then
 	ODIR=$(realpath $ODIR)
-	extraopts="--relative=$RELDIR"
+	pushd $RELDIR > /dev/null
+	extraopts="--relative"
 fi
 
 # Generate the patches and cover letter
 git format-patch $extraopts -M40 --subject-prefix="$PREFIX" -n -o $ODIR --thread=shallow --cover-letter $RELATIVE_TO..$COMMIT_ID > /dev/null
 
+[ -n "$RELDIR" ] && popd > /dev/null
+
 # Customize the cover letter
 CL="$ODIR/0000-cover-letter.patch"
 PM="$ODIR/pull-msg"
-- 
2.1.4



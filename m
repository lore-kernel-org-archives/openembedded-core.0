Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E9490767F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 14:24:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Aug 2015 07:24:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,653,1432623600"; d="scan'208";a="781283067"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2015 07:24:44 -0700
Received: from vmed.fi.intel.com (unknown [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 1A1446A4083;
	Tue, 11 Aug 2015 07:23:56 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Aug 2015 17:24:33 +0300
Message-Id: <1439303073-18582-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <CAMKF1sra8sykgB4q5+qQd4hL2fPOxfuND7W-WivqS_YxYPfvWw@mail.gmail.com>
References: <CAMKF1sra8sykgB4q5+qQd4hL2fPOxfuND7W-WivqS_YxYPfvWw@mail.gmail.com>
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
X-List-Received-Date: Tue, 11 Aug 2015 14:24:54 -0000

create-pull-request -d path creates empty patches if directory
is specified as a path, i.e. ./bitbake or ./bitbake/ or full path.
It behaves expected way only if script is run with -d bitbake, i.e.
relative dir name doesn't contain '\'.

Fixed this unwanted behaviour by changing directory and running
git format-patch in it with --relative, without specifying
relative path as a parameter.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/create-pull-request | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 216edfd..786fd1ed 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -177,12 +177,16 @@ mkdir $ODIR
 
 if [ -n "$RELDIR" ]; then
 	ODIR=$(realpath $ODIR)
-	extraopts="--relative=$RELDIR"
+	prevdir=$(pwd)
+	cd $RELDIR
+	extraopts="--relative"
 fi
 
 # Generate the patches and cover letter
 git format-patch $extraopts -M40 --subject-prefix="$PREFIX" -n -o $ODIR --thread=shallow --cover-letter $RELATIVE_TO..$COMMIT_ID > /dev/null
 
+[ -n "$RELDIR" ] && cd $prevdir
+
 # Customize the cover letter
 CL="$ODIR/0000-cover-letter.patch"
 PM="$ODIR/pull-msg"
-- 
2.1.4



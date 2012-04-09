Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SH6s5-0007rk-Ca
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Apr 2012 07:10:33 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 Apr 2012 22:01:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="151367376"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.159])
	by fmsmga002.fm.intel.com with ESMTP; 08 Apr 2012 22:01:15 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Apr 2012 22:01:05 -0700
Message-Id: <a2b0781b39e39310a71fa81e559161da140036ef.1333914345.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1333914345.git.sgw@linux.intel.com>
References: <cover.1333914345.git.sgw@linux.intel.com>
In-Reply-To: <cover.1333914345.git.sgw@linux.intel.com>
References: <cover.1333914345.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 1/6] create-pull-request: Assume remote branch from local branch
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
X-List-Received-Date: Mon, 09 Apr 2012 05:10:33 -0000

From: Darren Hart <dvhart@linux.intel.com>

It is common to use the same remote branch name as the local branch
name. In this case, it would be nice not to have to specify the
remote branch name.

Make the -b argument optional and assume the remote branch is the same
name as the local branch. Print a NOTE to this effect so as not to
catch the user by surprise:

NOTE: Assuming remote branch 'notthere', use -b to override.

If the remote branch doesn't exist, a WARNING is displayed just as if
the user had used -b to specify a non-existent branch:

WARNING: Branch 'notthere' was not found on the contrib git tree.
         Please check your remote and branch parameter before sending.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/create-pull-request |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 600fa7a..9a8913d 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -34,8 +34,8 @@ RFC=0
 usage() {
 CMD=$(basename $0)
 cat <<EOM
-Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to] [-i commit_id] -u remote -b branch
-  -b branch           Branch name in the specified remote
+Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to] [-i commit_id] -u remote [-b branch]
+  -b branch           Branch name in the specified remote (default: current branch)
   -c                  Create an RFC (Request for Comment) patch series
   -h                  Display this help message
   -i commit_id        Ending commit (default: HEAD)
@@ -120,7 +120,12 @@ while getopts "b:chi:m:o:p:r:s:u:" OPT; do
 	esac
 done
 
-if [ -z "$BRANCH" ] || [ -z "$REMOTE_URL" ]; then
+if [ -z "$BRANCH" ]; then
+	BRANCH=$(git branch | grep -e "^\* " | cut -d' ' -f2)
+	echo "NOTE: Assuming remote branch '$BRANCH', use -b to override."
+fi
+	
+if [ -z "$REMOTE_URL" ]; then
 	usage
 	exit 1
 fi
-- 
1.7.7.6




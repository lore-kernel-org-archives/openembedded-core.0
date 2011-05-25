Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QP9h5-0002Mz-2t
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 10:43:56 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 25 May 2011 01:40:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,266,1304319600"; 
   d="scan'208";a="1223555"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.133])
	by azsmga001.ch.intel.com with ESMTP; 25 May 2011 01:40:49 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2011 01:40:29 -0700
Message-Id: <861c288e353e917374de938c4e5e927e116cd56c.1306312621.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306312621.git.sgw@linux.intel.com>
References: <cover.1306312621.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306312621.git.sgw@linux.intel.com>
References: <cover.1306312621.git.sgw@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [Updated Consolidated Pull 07/19] create-pull-request: generalize the repository URL parsing
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
X-List-Received-Date: Wed, 25 May 2011 08:43:56 -0000

From: Darren Hart <dvhart@linux.intel.com>

The existing REMOTE_URL and REMOTE_REPO parsing made assumptions regarding
the git URL format used for the known repository types. In fact, both of
these ssh URL formats are valid for all the known repositories. Specifically:

  ssh://git@server/repository/path
  git@server:repository/path

Generalize the parsing to work with each of these for all push URLs matching
*@*. Tested with the following URLs:

  ssh://git@git.pokylinux.org/poky-contrib
  ssh://git@git.pokylinux.org/poky-contrib.git
  git@git.pokylinux.org:poky-contrib
  git@git.pokylinux.org:poky-contrib.git

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/create-pull-request |   29 ++++++++++++-----------------
 1 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index b808146..19b640f 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -97,28 +97,22 @@ while getopts "b:chi:m:o:p:r:s:u:" OPT; do
 			exit 1
 		fi
 
-		# Rewrite known private URLs to public URLs
+		# Rewrite private URLs to public URLs
 		# Determine the repository name for use in the WEB_URL later
 		case "$REMOTE_URL" in
-		ssh://git@git.pokylinux.org*)
-			REMOTE_REPO=$(echo $REMOTE_URL | sed "s#.*/\(.*\)#\1#")
-			REMOTE_URL=${REMOTE_URL/'ssh://git@'/'git://'}
+		*@*)
+			USER_RE="[A-Za-z0-9_.@][A-Za-z0-9_.@-]*\$\?"
+			PROTO_RE="[a-z][a-z]*://"
+			GIT_RE="\(^\($PROTO_RE\)\?$USER_RE@\)\([^:/]*\)[:/]\(.*\)"
+			REMOTE_URL=${REMOTE_URL%.git}
+			REMOTE_REPO=$(echo $REMOTE_URL | sed "s#$GIT_RE#\4#")
+			REMOTE_URL=$(echo $REMOTE_URL | sed "s#$GIT_RE#git://\3/\4#")
 			;;
-		ssh://git@git.yoctoproject.org*)
-			REMOTE_REPO=$(echo $REMOTE_URL | sed "s#.*/\(.*\)#\1#")
-			REMOTE_URL=${REMOTE_URL/"ssh://git@"/"git://"}
-			;;
-		*ssh://git@git.openembedded.org*)
-			REMOTE_REPO=$(echo $REMOTE_URL | sed "s#.*/\(.*\)#\1#")
-			REMOTE_URL=${REMOTE_URL/"ssh://git@"/"git://"}
-			;;
-		git@github.com:*)
-			REMOTE_REPO=$(echo $REMOTE_URL | sed 's#.*:\(.*\)\(\.git\)$#\1#')
-			REMOTE_URL=${REMOTE_URL/"git@github.com:"/"git://github.com/"}
+		*)
+			echo "WARNING: Unrecognized remote URL: $REMOTE_URL"
+			echo "         The pull and browse URLs will likely be incorrect"
 			;;
 		esac
-		# The .git suffix is optional in the URL, drop in for the REPO
-		REMOTE_REPO=${REMOTE_REPO%.git}
 		;;
 	esac
 done
@@ -134,6 +128,7 @@ fi
 
 
 # Set WEB_URL from known remotes
+WEB_URL=""
 case "$REMOTE_URL" in
 	*git.yoctoproject.org*)
 		WEB_URL="http://git.yoctoproject.org/cgit.cgi/$REMOTE_REPO/log/?h=$BRANCH"
-- 
1.7.3.4




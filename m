Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QM6Hq-0005gt-Lp
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 00:29:15 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 May 2011 15:26:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,221,1304319600"; d="scan'208";a="437124209"
Received: from unknown (HELO localhost) ([10.255.12.172])
	by azsmga001.ch.intel.com with ESMTP; 16 May 2011 15:26:13 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2011 15:26:04 -0700
Message-Id: <8ca2a8e517f83c09ba0f1a591d55b338f24c328a.1305584418.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <eb4a98eeef982194542a33be0dd615a5c2bf3ed8.1305584418.git.dvhart@linux.intel.com>
References: <eb4a98eeef982194542a33be0dd615a5c2bf3ed8.1305584418.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1305584418.git.dvhart@linux.intel.com>
References: <cover.1305584418.git.dvhart@linux.intel.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [RFC PATCH v2 04/15] create-pull-request: rewrite known private URLs to public URLs
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
X-List-Received-Date: Mon, 16 May 2011 22:29:15 -0000

Rather than requiring users to have public remotes and private remotes when
their development remotes are ssh based (and therefor unsuitable for a pull
request URL), rewrite the ones we know about from ssh://git@ to git://.

As the remote url vary from remote to remote, do the REMOTE_REPO regex per
remote.

With this infrastructure in place, future patches can augment the list of
known remotes for things like Git Hub, Gitorious, kernel.org, etc.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Tom Rini <tom_rini@mentor.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/create-pull-request |   14 +++++++++++++-
 1 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 8f7f767..429421b 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -65,7 +65,19 @@ while getopts "b:hi:m:o:p:r:s:u:" OPT; do
 			echo "ERROR: git config failed to find a url for '$REMOTE'"
 			exit 1
 		fi
-		REMOTE_REPO=$(echo $REMOTE_URL | sed "s#.*/\(.*\)#\1#")
+
+		# Rewrite known private URLs to public URLs
+		# Determine the repository name for use in the WEB_URL later
+		case "$REMOTE_URL" in
+		ssh://git@git.pokylinux.org*)
+			REMOTE_REPO=$(echo $REMOTE_URL | sed "s#.*/\(.*\)#\1#")
+			REMOTE_URL=${REMOTE_URL/'ssh://git@'/'git://'}
+			;;
+		ssh://git@git.yoctoproject.org*)
+			REMOTE_REPO=$(echo $REMOTE_URL | sed "s#.*/\(.*\)#\1#")
+			REMOTE_URL=${REMOTE_URL/"ssh://git@"/"git://"}
+			;;
+		esac
 		# The .git suffix is optional in the URL, drop in for the REPO
 		REMOTE_REPO=${REMOTE_REPO%.git}
 		;;
-- 
1.7.1




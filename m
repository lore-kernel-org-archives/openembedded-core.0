Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QMkRT-0005lS-OT
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 19:21:52 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 May 2011 10:18:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,232,1304319600"; 
   d="scan'208";a="3481902"
Received: from unknown (HELO localhost) ([10.255.12.192])
	by fmsmga002.fm.intel.com with ESMTP; 18 May 2011 10:18:49 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 10:18:24 -0700
Message-Id: <da87b584ab6e170981ee03054c060eb2dea70507.1305738598.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <a1cda1da640a96baf3d45b7d4e9577b8b74efbd3.1305738598.git.dvhart@linux.intel.com>
References: <a1cda1da640a96baf3d45b7d4e9577b8b74efbd3.1305738598.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1305738598.git.dvhart@linux.intel.com>
References: <cover.1305738598.git.dvhart@linux.intel.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 04/15] create-pull-request: rewrite known private URLs to public URLs
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
X-List-Received-Date: Wed, 18 May 2011 17:21:52 -0000

Rather than requiring users to have public remotes and private remotes when
their development remotes are ssh based (and therefor unsuitable for a pull
request URL), rewrite the ones we know about from ssh://git@ to git://.

As the remote url vary from remote to remote, do the REMOTE_REPO regex per
remote.

With this infrastructure in place, future patches can augment the list of
known remotes for things like Git Hub, Gitorious, kernel.org, etc.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Acked-by: Joshua Lock <josh@linux.intel.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
Acked-by: Tom Rini <tom_rini@mentor.com>
Cc: Tom Rini <tom_rini@mentor.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Joshua Lock <josh@linux.intel.com>
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




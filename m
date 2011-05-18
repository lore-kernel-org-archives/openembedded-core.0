Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMpG1-0003uj-9z
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 00:30:21 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 May 2011 15:27:24 -0700
X-ExtLoop1: 1
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.160])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2011 15:27:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 15:26:47 -0700
Message-Id: <eda6f29bbe6b3575c6e1c9c983f27bc6720c5e8e.1305756950.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
References: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305756950.git.sgw@linux.intel.com>
References: <cover.1305756950.git.sgw@linux.intel.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 18/30] create-pull-request: rewrite known private URLs to public URLs
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
X-List-Received-Date: Wed, 18 May 2011 22:30:21 -0000

From: Darren Hart <dvhart@linux.intel.com>

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
1.7.3.4




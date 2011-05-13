Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QL1y3-0002wA-I3
	for openembedded-core@lists.openembedded.org;
	Sat, 14 May 2011 01:40:23 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 May 2011 16:37:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,367,1301900400"; d="scan'208";a="642516580"
Received: from unknown (HELO localhost) ([10.255.12.78])
	by orsmga002.jf.intel.com with ESMTP; 13 May 2011 16:37:33 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2011 16:37:34 -0700
Message-Id: <5be48b04615bb47fff1607df2ec1d33e33cf2aa7.1305329659.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1305329659.git.dvhart@linux.intel.com>
References: <cover.1305329659.git.dvhart@linux.intel.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [RFC PATCH 04/10] create-pull-request: rewrite known private URLs to public URLs
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
X-List-Received-Date: Fri, 13 May 2011 23:40:23 -0000

Rather than requiring users to have public remotes and private remotes when
their development remotes are ssh based (and therefor unsuitable for a pull
request URL), rewrite the ones we know about from ssh://git@ to git://.

With this infrastructure in place, future patches can augment the list of
known remotes for things like Git Hub, Gitorious, kernel.org, etc.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Tom Rini <tom_rini@mentor.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/create-pull-request |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index c6cf817..96cf04f 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -65,6 +65,16 @@ while getopts "b:hi:m:o:p:r:s:u:" OPT; do
 			echo "ERROR: git config failed to find a url for '$REMOTE'"
 			exit 1
 		fi
+
+		# Rewrite known private URLs to public URLs
+		case "$REMOTE_URL" in
+		*ssh://git@git.pokylinux.org*)
+			REMOTE_URL=${REMOTE_URL/'ssh://git@'/'git://'}
+			;;
+		*ssh://git@git.yoctoproject.org*)
+			REMOTE_URL=${REMOTE_URL/"ssh://git@"/"git://"}
+			;;
+		esac
 		;;
 	esac
 done
-- 
1.7.1




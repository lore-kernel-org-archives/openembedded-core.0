Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id A828377131
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:22:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 128FD600F52
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 16:21:53 +0100
Message-Id: <f775e4cffe45edb673a414a2038c4f2b09b9b827.1445527096.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v3 32/52] useradd_base.bbclass: Do not warn without a reason
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
X-List-Received-Date: Thu, 22 Oct 2015 15:22:25 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

In c0da4270c76375a7a8cbcc09319fe4570ebbc5bd two bbwarn were changed to
bbnote for the case where an added user or group already exists. The
same should have been done for groupmems, groupdel and userdel as well
since the warnings that are currently generated are superflouous.

The two remaining similar bbwarn for groupmod and usermod are left as
is since there they actually make sense.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/useradd_base.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.bbclass
index 802f3a1..ab3cd35 100644
--- a/meta/classes/useradd_base.bbclass
+++ b/meta/classes/useradd_base.bbclass
@@ -104,7 +104,7 @@ perform_groupmems () {
 			sleep $count
 		done
 	else
-		bbwarn "${PN}: group $groupname already contains $username, not re-adding it"
+		bbnote "${PN}: group $groupname already contains $username, not re-adding it"
 	fi
 	if test "x$gshadow" = "xno"; then
 		rm -f $rootdir${sysconfdir}/gshadow
@@ -136,7 +136,7 @@ perform_groupdel () {
 			sleep $count
 		done
 	else
-		bbwarn "${PN}: group $groupname doesn't exist, not removing it"
+		bbnote "${PN}: group $groupname doesn't exist, not removing it"
 	fi
 }
 
@@ -164,7 +164,7 @@ perform_userdel () {
 		       sleep $count
 	       done
 	else
-		bbwarn "${PN}: user $username doesn't exist, not removing it"
+		bbnote "${PN}: user $username doesn't exist, not removing it"
 	fi
 }
 
-- 
2.1.4



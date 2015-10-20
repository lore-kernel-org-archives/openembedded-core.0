Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 6315E60088
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 17:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 15C502E71E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 19:14:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id aNCrvVTmwe7Q
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 19:14:16 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 7926F2E4BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 19:14:16 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 625711590
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 19:14:16 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 56D9E13D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 19:14:16 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 53D2834009
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 19:14:16 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id t9KHEGYj008676
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 19:14:16 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id t9KHEGHs008675
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Oct 2015 19:14:16 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Oct 2015 19:14:14 +0200
Message-Id: <86b3e3d4931b4eb17db6bfdfb3184e576156e382.1445361177.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1445361177.git.pkj@axis.com>
References: <cover.1445361177.git.pkj@axis.com>
In-Reply-To: <cover.1445361177.git.pkj@axis.com>
References: <cover.1445361177.git.pkj@axis.com>
Subject: [PATCH 1/1] useradd_base.bbclass: Do not warn without a reason
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
X-List-Received-Date: Tue, 20 Oct 2015 17:14:21 -0000

In c0da4270c76375a7a8cbcc09319fe4570ebbc5bd two bbwarn were changed to
bbnote for the case where an added user or group already exists. The
same should have been done for groupmems, groupdel and userdel as well
since the warnings that are currently generated are superflouous.

The two remaining similar bbwarn for groupmod and usermod are left as
is since there they actually make sense.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
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
2.1.0



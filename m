Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 0FBDA731CC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 23:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 9C4632E18F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:04 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id wRk5N-SucvRS
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:03 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id D8B672E189
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:03 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id B766911FB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:03 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 9BB12ED
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:03 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 963173E3C9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:03 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id tBINs3if017931
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:03 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id tBINs3Ga017930
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Dec 2015 00:54:03 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Dec 2015 00:53:48 +0100
Message-Id: <02697eda36dfcfb32800c642a2589c477a32d54d.1450482563.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1450482563.git.pkj@axis.com>
References: <cover.1450482563.git.pkj@axis.com>
In-Reply-To: <cover.1450482563.git.pkj@axis.com>
References: <cover.1450482563.git.pkj@axis.com>
Subject: [PATCHv2 2/6] useradd-staticids.bbclass: Make --no-user-group have effect
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
X-List-Received-Date: Fri, 18 Dec 2015 23:54:06 -0000

If --no-user-group is specified in USERADD_PARAM_${PN} for a user and
no --gid is specified, then we should not assume that the group name
for the user is the user name.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/useradd-staticids.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index 9d59aca..c2e6579 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -107,7 +107,7 @@ def update_useradd_static_config(d):
                             # is used, and we disable the user_group option.
                             #
                             user_group = uaargs.user_group is None or uaargs.user_group is True
-                            uaargs.groupname = [uaargs.gid, uaargs.LOGIN][not uaargs.gid or user_group]
+                            uaargs.groupname = [uaargs.LOGIN, uaargs.gid][not user_group]
                             uaargs.groupid = [uaargs.gid, uaargs.groupname][not uaargs.gid]
                             uaargs.groupid = [field[3], uaargs.groupid][not field[3]]
 
-- 
2.1.0



Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 1B158778B8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 25FDD2E097
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:28:02 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id l3rxJV0ZYSdA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:28:00 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 7CE312E315
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:28:00 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6737C1A077
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:28:00 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C4211A075
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:28:00 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:28:00 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 505FA233
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:28:00 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v2B5S0JG019719
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:28:00 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v2B5S0dM019718
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Mar 2017 06:28:00 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 11 Mar 2017 06:27:58 +0100
Message-Id: <20170311052758.19671-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] useradd-staticids.bbclass: Support recipes specifying static IDs
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
X-List-Received-Date: Sat, 11 Mar 2017 05:28:01 -0000

If this bblcass is used and a recipe specifies a static ID for a
user/group as part of the USERADD_PARAM_${PN} or GROUPADD_PARAM_${PN},
the build would fail with and error like this if there was no
corresponding ID in the passwd/group files specified via
USERADD_UID_TABLES/USERADD_GID_TABLES:

  ERROR: meta-oe/recipes-support/postgresql/postgresql_9.4.11.bb:
  meta-oe/recipes-support/postgresql/postgresql_9.4.11.bb inherits
  useradd but doesn't set USERADD_PARAM, GROUPADD_PARAM or
  GROUPMEMS_PARAM for package postgresql

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/useradd-staticids.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index a65c3f69cb..9b194df490 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -125,6 +125,7 @@ def update_useradd_static_config(d):
             if uaargs.LOGIN not in users:
                 if not uaargs.uid or not uaargs.uid.isdigit() or not uaargs.gid:
                     handle_missing_id(uaargs.LOGIN, 'user', pkg)
+                newparams.append(param)
                 continue
 
             field = users[uaargs.LOGIN]
@@ -260,6 +261,7 @@ def update_useradd_static_config(d):
             if gaargs.GROUP not in groups:
                 if not gaargs.gid or not gaargs.gid.isdigit():
                     handle_missing_id(gaargs.GROUP, 'group', pkg)
+                newparams.append(param)
                 continue
 
             field = groups[gaargs.GROUP]
-- 
2.12.0



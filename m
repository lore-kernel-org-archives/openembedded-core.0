Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3747071D8F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 00:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id D3F1C180E6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 01:27:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Gx8QEqa+k2fH
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 01:27:22 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 6A45F183A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 01:27:22 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 321351A093
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 01:27:22 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 236C31A08F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 01:27:22 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 01:27:22 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 152C2774
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 01:27:22 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v2F0RMBH015827
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 01:27:22 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v2F0RLII015826
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Mar 2017 01:27:21 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Mar 2017 01:27:13 +0100
Message-Id: <20170315002714.15783-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCHv3 1/2] useradd-staticids.bbclass: Support recipes specifying static IDs
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
X-List-Received-Date: Wed, 15 Mar 2017 00:27:25 -0000

If this bbclass is used and a recipe specifies a static ID for a
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



Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3827E776A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 00:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 426D5183A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 01:27:24 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 6GSv3ZuVqz8k
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 01:27:22 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 6E38B183C0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 01:27:22 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3BE7A1A08E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 01:27:22 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F5D81A092
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 01:27:22 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 01:27:22 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 21F74A36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 01:27:22 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v2F0RMUG015831
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 01:27:22 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v2F0RMuc015830
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Mar 2017 01:27:22 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Mar 2017 01:27:14 +0100
Message-Id: <20170315002714.15783-2-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170315002714.15783-1-pkj@axis.com>
References: <20170315002714.15783-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCHv3 2/2] useradd-staticids.bbclass: Always fail/warn for missing IDs
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

Previously, with USERADD_ERROR_DYNAMIC set to error/warn, if a static
UID/GID was specified in the recipe, then no error/warning would be
issued even if no ID was specified in the passwd/groups files.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/useradd-staticids.bbclass | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index 9b194df490..c156a12ee5 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -123,8 +123,7 @@ def update_useradd_static_config(d):
                 users = merge_files(get_passwd_list(d), 7)
 
             if uaargs.LOGIN not in users:
-                if not uaargs.uid or not uaargs.uid.isdigit() or not uaargs.gid:
-                    handle_missing_id(uaargs.LOGIN, 'user', pkg)
+                handle_missing_id(uaargs.LOGIN, 'user', pkg)
                 newparams.append(param)
                 continue
 
@@ -259,8 +258,7 @@ def update_useradd_static_config(d):
                 groups = merge_files(get_group_list(d), 4)
 
             if gaargs.GROUP not in groups:
-                if not gaargs.gid or not gaargs.gid.isdigit():
-                    handle_missing_id(gaargs.GROUP, 'group', pkg)
+                handle_missing_id(gaargs.GROUP, 'group', pkg)
                 newparams.append(param)
                 continue
 
-- 
2.12.0



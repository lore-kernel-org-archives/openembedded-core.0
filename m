Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0AA8077824
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 15:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id E50EF183AB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 16:56:22 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 2+YO2V7YKG1A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 16:56:22 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 3FCD71839E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 16:56:22 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C3361A08B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 16:56:22 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0164A1A08A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 16:56:22 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 16:56:21 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id E9B71345
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 16:56:21 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v2EFuLV8007556
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 16:56:21 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v2EFuLDB007555
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Mar 2017 16:56:21 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Mar 2017 16:56:19 +0100
Message-Id: <20170314155619.7506-2-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170314155619.7506-1-pkj@axis.com>
References: <20170314155619.7506-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCHv2 2/2] useradd-staticids.bbclass: Always fail/warn for missing IDs
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
X-List-Received-Date: Tue, 14 Mar 2017 15:56:24 -0000

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



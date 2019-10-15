Return-Path: <mattias.hansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id DD5007F353
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 08:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 41AE91834A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 10:09:40 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id kg0c4BwZ3XZN
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 10:09:39 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 5D7A31833E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 10:09:39 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 475DC1E074
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 10:09:39 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3BB311E070
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 10:09:39 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 10:09:39 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 2EC3A216A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 10:09:39 +0200 (CEST)
Received: from lnxmattihn.se.axis.com (10.0.5.60) by XBOX04.axis.com
	(10.0.5.18) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Tue, 15 Oct 2019 10:09:39 +0200
From: Mattias Hansson <mattias.hansson@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Oct 2019 10:00:15 +0200
Message-ID: <20191015080015.1574-1-mattihn@axis.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX02.axis.com (10.0.5.16) To XBOX04.axis.com (10.0.5.18)
X-TM-AS-GCONF: 00
Cc: Mattias Hansson <mattihn@axis.com>
Subject: [PATCH] base.bbclass: add dependency on pseudo from do_prepare_recipe_sysroot
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
X-List-Received-Date: Tue, 15 Oct 2019 08:09:40 -0000
Content-Type: text/plain

do_prepare_recipe_sysroot may perform groupadd, which requires pseudo.
However, do_prepare_recipe_sysroot does not depend on pseudo explicitly,
which sometimes causes a build error when building a recipe that adds
groups.

This issue only occurs when executing do_prepare_recipe_sysroot for a
recipe that adds groups before finishing a task that depends on pseudo
for a recipe that doesn't add groups.

Signed-off-by: Mattias Hansson <mattihn@axis.com>
---
 meta/classes/base.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index d3184ecf7b..1cea3a2213 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -482,6 +482,7 @@ python () {
     # If we're building a target package we need to use fakeroot (pseudo)
     # in order to capture permissions, owners, groups and special files
     if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
+        d.appendVarFlag('do_prepare_recipe_sysroot', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
         d.setVarFlag('do_unpack', 'umask', '022')
         d.setVarFlag('do_configure', 'umask', '022')
         d.setVarFlag('do_compile', 'umask', '022')
-- 
2.11.0



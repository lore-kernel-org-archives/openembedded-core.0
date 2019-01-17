Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 87D5579F3D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 02:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id C810418524
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 03:53:22 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id BQIRDMY2zk9Q
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 03:53:22 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 3E54E183AB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 03:53:22 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 266551A097
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 03:53:22 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1AEC41A08C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 03:53:22 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 03:53:22 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 0F2B610A9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 03:53:22 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id x0H2rLfG007003
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 03:53:21 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id x0H2rLQi007002
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2019 03:53:21 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 03:53:16 +0100
Message-Id: <20190117025316.6956-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] extrausers.bbclass: Suggest to use IMAGE_CLASSES rather than INHERIT
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
X-List-Received-Date: Thu, 17 Jan 2019 02:53:23 -0000

Since this class is only useful for image recipes, it is better to
suggest adding it via IMAGE_CLASSES instead of INHERIT in the example.

Also make the example a bit more readable by indenting the variable
values.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/extrausers.bbclass | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/meta/classes/extrausers.bbclass b/meta/classes/extrausers.bbclass
index 7709407b69..32569e97db 100644
--- a/meta/classes/extrausers.bbclass
+++ b/meta/classes/extrausers.bbclass
@@ -1,18 +1,17 @@
-# This bbclass is mainly used for image level user/group configuration.
+# This bbclass is used for image level user/group configuration.
 # Inherit this class if you want to make EXTRA_USERS_PARAMS effective.
 
 # Below is an example showing how to use this functionality.
-# INHERIT += "extrausers"
+# IMAGE_CLASSES += "extrausers"
 # EXTRA_USERS_PARAMS = "\
-# useradd -p '' tester; \
-# groupadd developers; \
-# userdel nobody; \
-# groupdel -g video; \
-# groupmod -g 1020 developers; \
-# usermod -s /bin/sh tester; \
+#     useradd -p '' tester; \
+#     groupadd developers; \
+#     userdel nobody; \
+#     groupdel -g video; \
+#     groupmod -g 1020 developers; \
+#     usermod -s /bin/sh tester; \
 # "
 
-
 inherit useradd_base
 
 PACKAGE_INSTALL_append = " ${@['', 'base-passwd shadow'][bool(d.getVar('EXTRA_USERS_PARAMS'))]}"
-- 
2.12.0



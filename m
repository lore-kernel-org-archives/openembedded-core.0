Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 95E4D74FC3
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jun 2018 10:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 0484B1877C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jun 2018 12:50:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 0YbJWVZ6_YOc
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jun 2018 12:50:02 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 2C57518778
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jun 2018 12:50:02 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1222C1E064
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jun 2018 12:50:02 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 064761E060
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jun 2018 12:50:02 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jun 2018 12:50:01 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id ED8AD2C42
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jun 2018 12:50:01 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w59AnqO8017541
	for <openembedded-core@lists.openembedded.org>;
	Sat, 9 Jun 2018 12:49:52 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w59Anqe3017540
	for openembedded-core@lists.openembedded.org;
	Sat, 9 Jun 2018 12:49:52 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jun 2018 12:49:48 +0200
Message-Id: <20180609104950.17497-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [sumo][PATCH 1/3] rpm: Fix patch to ensure variables aren't used uninitialised
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
X-List-Received-Date: Sat, 09 Jun 2018 10:50:02 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Recent patches were applied which removed a function which set the xx
variable. This means xx can be uninitalised and prerm functions can fail.

This adjusts the patch to ensure the xx value isn't used in such a way.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...t-reset-the-PATH-environment-variable-before-ru.patch | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
index a38675f89c..bf24d43eb9 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
@@ -6,6 +6,9 @@ Subject: [PATCH 1/2] Do not reset the PATH environment variable before running
 
 We add lots of native stuff into it and scriptlets rely on that.
 
+Also need to remove the xx test later in the function since the
+value could now be used un-initialised.
+
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
@@ -25,6 +28,13 @@ index 92f949fa2..7c1aa75a8 100644
  	free(ipath);
      }
  
--- 
-2.11.0
-
+@@ -206,9 +206,7 @@ static void doScriptExec(ARGV_const_t ar
+ 	/* XXX Don't mtrace into children. */
+ 	unsetenv("MALLOC_CHECK_");
+ 
+-	if (xx == 0) {
+ 	    xx = execv(argv[0], argv);
+-	}
+     }
+     _exit(127); /* exit 127 for compatibility with bash(1) */
+ }
-- 
2.12.0



Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35D837C81D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 14:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 094B718288
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 15:51:23 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id cOeOFIgjrtpK
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 15:51:22 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 355561814A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 15:51:22 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 229BF1E060
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 15:51:22 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1773B1E057
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 15:51:22 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 15:51:22 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 0BA4518D7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 15:51:22 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id x1HEpKr1002878
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 15:51:21 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id x1HEpK5u002877
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2019 15:51:20 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Feb 2019 15:51:07 +0100
Message-Id: <20190217145107.2796-3-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20190217145107.2796-1-pkj@axis.com>
References: <20190217145107.2796-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 3/3] libc-package.bbclass: Add a progress meter for the package task
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
X-List-Received-Date: Sun, 17 Feb 2019 14:51:22 -0000

The package task for glibc-locale takes a very long time to execute,
especially if using qemu. In that case, a progress meter helps a lot to
show the progress of the task.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/libc-package.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index ee598905b0..f1c0545c67 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -348,11 +348,16 @@ python package_do_split_gconvs () {
         makefile = oe.path.join(d.getVar("WORKDIR"), "locale-tree", "Makefile")
         m = open(makefile, "w")
         m.write("all: %s\n\n" % " ".join(commands.keys()))
+        i = 1
+        total = len(commands)
         for cmd in commands:
             m.write(cmd + ":\n")
+            m.write("\t@echo 'Progress %d/%d'\n" % (i, total))
             m.write("\t" + commands[cmd] + "\n\n")
+            i = i + 1
         m.close()
         d.setVar("EXTRA_OEMAKE", "-C %s ${PARALLEL_MAKE}" % (os.path.dirname(makefile)))
+        d.setVarFlag("oe_runmake", "progress", "outof:Progress\s(\d+)/(\d+)")
         bb.note("Executing binary locale generation makefile")
         bb.build.exec_func("oe_runmake", d)
         bb.note("collecting binary locales from locale tree")
-- 
2.12.0



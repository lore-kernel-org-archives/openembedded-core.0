Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 586547C837
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 07:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 2631118107
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 08:08:23 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id fOUDpJyOaD7i
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 08:08:22 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 75CEF182CF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 08:08:22 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6228C1A061
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 08:08:22 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 56C5A1A060
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 08:08:22 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 08:08:22 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 4AF7A1973
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 08:08:22 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id x1I78LQP024230
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 08:08:21 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id x1I78LJk024229
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2019 08:08:21 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2019 08:08:08 +0100
Message-Id: <20190218070808.24163-3-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20190218070808.24163-1-pkj@axis.com>
References: <20190218070808.24163-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCHv2 3/3] libc-package.bbclass: Add a progress meter for the package task
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
X-List-Received-Date: Mon, 18 Feb 2019 07:08:22 -0000

The package task for glibc-locale takes a very long time to execute,
especially if using qemu. In that case, a progress meter helps a lot to
show the progress of the task.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Use enumerate().

 meta/classes/libc-package.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index cf0d8901e3..34c9151ae9 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -348,11 +348,14 @@ python package_do_split_gconvs () {
         makefile = oe.path.join(d.getVar("WORKDIR"), "locale-tree", "Makefile")
         m = open(makefile, "w")
         m.write("all: %s\n\n" % " ".join(commands.keys()))
-        for cmd in commands:
+        total = len(commands)
+        for i, cmd in enumerate(commands):
             m.write(cmd + ":\n")
+            m.write("\t@echo 'Progress %d/%d'\n" % (i, total))
             m.write("\t" + commands[cmd] + "\n\n")
         m.close()
         d.setVar("EXTRA_OEMAKE", "-C %s ${PARALLEL_MAKE}" % (os.path.dirname(makefile)))
+        d.setVarFlag("oe_runmake", "progress", "outof:Progress\s(\d+)/(\d+)")
         bb.note("Executing binary locale generation makefile")
         bb.build.exec_func("oe_runmake", d)
         bb.note("collecting binary locales from locale tree")
-- 
2.12.0



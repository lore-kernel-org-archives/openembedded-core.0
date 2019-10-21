Return-Path: <ola.x.nilsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id A271E7C7A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 10:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 6CC671832C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:36 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id tPdsNCaoAZWy
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:35 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id B17F21834A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 987B41E07F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B81C1E07A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: from lnxolani1.se.axis.com (lnxolani1.se.axis.com [10.88.130.9])
	by thoth.se.axis.com (Postfix) with ESMTP id 800BC1DE6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: by lnxolani1.se.axis.com (Postfix, from userid 20853)
	id 7AB0440AB2; Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Oct 2019 12:30:34 +0200
Message-Id: <20191021103034.12200-9-olani@axis.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191021103034.12200-1-olani@axis.com>
References: <20191021103034.12200-1-olani@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 9/9] libc-package.bbclass: Use with to manage filehandle in do_spit_gconvs
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
X-List-Received-Date: Mon, 21 Oct 2019 10:30:35 -0000

Tweak the write loop slightly to avoid dict lookups that can easily be
done in the for loop.

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/classes/libc-package.bbclass | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index a66e540884..de816bcec1 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -346,14 +346,13 @@ python package_do_split_gconvs () {
 
     if use_bin == "compile":
         makefile = oe.path.join(d.getVar("WORKDIR"), "locale-tree", "Makefile")
-        m = open(makefile, "w")
-        m.write("all: %s\n\n" % " ".join(commands.keys()))
-        total = len(commands)
-        for i, cmd in enumerate(commands):
-            m.write(cmd + ":\n")
-            m.write("\t@echo 'Progress %d/%d'\n" % (i, total))
-            m.write("\t" + commands[cmd] + "\n\n")
-        m.close()
+        with open(makefile, "w") as m:
+            m.write("all: %s\n\n" % " ".join(commands.keys()))
+            total = len(commands)
+            for i, (maketarget, makerecipe) in enumerate(commands.items()):
+                m.write(maketarget + ":\n")
+                m.write("\t@echo 'Progress %d/%d'\n" % (i, total))
+                m.write("\t" + makerecipe + "\n\n")
         d.setVar("EXTRA_OEMAKE", "-C %s ${PARALLEL_MAKE}" % (os.path.dirname(makefile)))
         d.setVarFlag("oe_runmake", "progress", "outof:Progress\s(\d+)/(\d+)")
         bb.note("Executing binary locale generation makefile")
-- 
2.11.0



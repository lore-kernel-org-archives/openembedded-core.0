Return-Path: <gernot.hillier@siemens.com>
Received: from gecko.sbs.de (gecko.sbs.de [194.138.37.40])
	by mail.openembedded.org (Postfix) with ESMTP id 77D19602D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 10:58:02 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id v3QAw3Ub004145
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 26 Apr 2017 12:58:03 +0200
Received: from linux-mf4q.internal.hillier.net (md1jennc.ww002.siemens.net
	[139.25.68.7] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id v3QAvrTU026631;
	Wed, 26 Apr 2017 12:58:03 +0200
From: Gernot Hillier <gernot.hillier@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Apr 2017 12:57:45 +0200
Message-Id: <20170426105745.8551-3-gernot.hillier@siemens.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170426105745.8551-1-gernot.hillier@siemens.com>
References: <20170426105745.8551-1-gernot.hillier@siemens.com>
Cc: eugene.tarassov@xilinx.com, Tim Offermann <tim.offermann@siemens.com>
Subject: [PATCH v4 2/2] tcf-agent: enable default target debugging features
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
X-List-Received-Date: Wed, 26 Apr 2017 10:58:03 -0000

A number of features were disabled in OE due to historic problems
on ARM. In tcf-agent 1.4, they compile cleanly on all architectures
besides mips and libc-musl. These features are required for target
debugging with Eclipse Neon, CDT and TCF plugins - for example used
by Xilinx Vivado SDK 2016.4.

For MIPS and libc-musl, at least re-enable SERVICE_Symbols and
SERVICE_LineNumbers which compile cleanly.

Signed-off-by: Gernot Hillier <gernot.hillier@siemens.com>
Signed-off-by: Tim Offermann <tim.offermann@siemens.com>
Acked-by: Eugene Tarassov <eugene.tarassov@xilinx.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index cd0081ac16..1dad825fda 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -35,11 +35,16 @@ MAKE_OS = "`echo ${TARGET_OS} | sed s,^linux.*,GNU/Linux,`"
 
 EXTRA_OEMAKE = "MACHINE=${MAKE_ARCH} OPSYS=${MAKE_OS} 'CC=${CC}' 'AR=${AR}'"
 
-# They don't build on ARM and we don't need them actually.
-CFLAGS += "-DSERVICE_RunControl=0 -DSERVICE_Breakpoints=0 \
+# These features don't compile on mips and libc-musl
+CFLAGS_mips_append = "-DSERVICE_RunControl=0 -DSERVICE_Breakpoints=0 \
     -DSERVICE_Memory=0 -DSERVICE_Registers=0 -DSERVICE_MemoryMap=0 \
-    -DSERVICE_StackTrace=0 -DSERVICE_Symbols=0 -DSERVICE_LineNumbers=0 \
-    -DSERVICE_Expressions=0"
+    -DSERVICE_StackTrace=0 -DSERVICE_Expressions=0"
+CFLAGS_mips64_append = "-DSERVICE_RunControl=0 -DSERVICE_Breakpoints=0 \
+    -DSERVICE_Memory=0 -DSERVICE_Registers=0 -DSERVICE_MemoryMap=0 \
+    -DSERVICE_StackTrace=0 -DSERVICE_Expressions=0"
+CFLAGS_append_libc-musl = "-DSERVICE_RunControl=0 -DSERVICE_Breakpoints=0 \
+    -DSERVICE_Memory=0 -DSERVICE_Registers=0 -DSERVICE_MemoryMap=0 \
+    -DSERVICE_StackTrace=0 -DSERVICE_Expressions=0"
 
 do_install() {
 	oe_runmake install INSTALLROOT=${D}
-- 
2.12.0



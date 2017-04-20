Return-Path: <gernot.hillier@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id F2FE3779CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 19:09:49 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v3KJ9oum019834
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 21:09:50 +0200
Received: from linux-mf4q.internal.hillier.de.hillier.de ([146.254.78.32])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id v3KJ8Yui007889;
	Thu, 20 Apr 2017 21:09:50 +0200
From: Gernot Hillier <gernot.hillier@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Apr 2017 21:08:15 +0200
Message-Id: <20170420190815.15000-3-gernot.hillier@siemens.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170420190815.15000-1-gernot.hillier@siemens.com>
References: <20170420190815.15000-1-gernot.hillier@siemens.com>
Cc: Tim Offermann <tim.offermann@siemens.com>
Subject: [PATCH v3 2/2] tcf-agent: enable default target debugging features
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
X-List-Received-Date: Thu, 20 Apr 2017 19:09:50 -0000

A number of features were disabled in OE due to historic problems
on ARM. In tcf-agent 1.4, they compile cleanly on all architectures
besides mips. These features are required for target debugging with
Eclipse Neon, CDT and TCF plugins - for example used by Xilinx Vivado
SDK 2016.4.

For MIPS, at least re-enable SERVICE_Symbols and SERVICE_LineNumbers
which compile cleanly.

Signed-off-by: Gernot Hillier <gernot.hillier@siemens.com>
Signed-off-by: Tim Offermann <tim.offermann@siemens.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index cd0081ac16..eb18a925d0 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -35,11 +35,13 @@ MAKE_OS = "`echo ${TARGET_OS} | sed s,^linux.*,GNU/Linux,`"
 
 EXTRA_OEMAKE = "MACHINE=${MAKE_ARCH} OPSYS=${MAKE_OS} 'CC=${CC}' 'AR=${AR}'"
 
-# They don't build on ARM and we don't need them actually.
-CFLAGS += "-DSERVICE_RunControl=0 -DSERVICE_Breakpoints=0 \
+# They don't build on mips
+CFLAGS_mips_append = "-DSERVICE_RunControl=0 -DSERVICE_Breakpoints=0 \
     -DSERVICE_Memory=0 -DSERVICE_Registers=0 -DSERVICE_MemoryMap=0 \
-    -DSERVICE_StackTrace=0 -DSERVICE_Symbols=0 -DSERVICE_LineNumbers=0 \
-    -DSERVICE_Expressions=0"
+    -DSERVICE_StackTrace=0 -DSERVICE_Expressions=0"
+CFLAGS_mips64_append = "-DSERVICE_RunControl=0 -DSERVICE_Breakpoints=0 \
+    -DSERVICE_Memory=0 -DSERVICE_Registers=0 -DSERVICE_MemoryMap=0 \
+    -DSERVICE_StackTrace=0 -DSERVICE_Expressions=0"
 
 do_install() {
 	oe_runmake install INSTALLROOT=${D}
-- 
2.12.0



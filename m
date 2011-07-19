Received: from mail-out.m-online.net ([212.18.0.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <yanok@emcraft.com>) id 1Qiykt-0003Qa-Hv
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 03:05:49 +0200
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id C92591853B83;
	Tue, 19 Jul 2011 03:01:39 +0200 (CEST)
X-Auth-Info: QwU0fjf/rkYacHihTLM0kEyjs2aTpbkvJUWW4MeFoGE=
Received: from mail.denx.de (host-82-135-33-74.customer.m-online.net
	[82.135.33.74])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id CFE281C000AF;
	Tue, 19 Jul 2011 03:01:39 +0200 (CEST)
Received: from pollux.denx.de (pollux [192.168.1.1])
	by mail.denx.de (Postfix) with ESMTP id BBA33340049;
	Tue, 19 Jul 2011 03:01:39 +0200 (CEST)
Received: by pollux.denx.de (Postfix, from userid 547)
	id 93E6F4BFD; Tue, 19 Jul 2011 03:01:39 +0200 (CEST)
From: Ilya Yanok <yanok@emcraft.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2011 03:00:58 +0200
Message-Id: <1311037258-11777-8-git-send-email-yanok@emcraft.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <1311037258-11777-1-git-send-email-yanok@emcraft.com>
References: <1311037258-11777-1-git-send-email-yanok@emcraft.com>
Cc: Ilya Yanok <yanok@emcraft.com>
Subject: [PATCH 7/7] gcc_4.5.1: add pr45886.patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jul 2011 01:05:52 -0000

Add fix for PR45886 as proposed in
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=45886

Signed-off-by: Ilya Yanok <yanok@emcraft.com>
---
 meta/recipes-devtools/gcc/gcc-4.5.1.inc           |    1 +
 meta/recipes-devtools/gcc/gcc-4.5.1/pr45886.patch |   55 +++++++++++++++++++++
 2 files changed, 56 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.5.1/pr45886.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1.inc b/meta/recipes-devtools/gcc/gcc-4.5.1.inc
index 03dca08..1b21a75 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1.inc
@@ -63,6 +63,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://pr44606.patch \
 	   file://pr45094.patch \
 	   file://pr45052.patch \
+	   file://pr45886.patch \
 	  "
 	
 SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch;patch=1 "
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/pr45886.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/pr45886.patch
new file mode 100644
index 0000000..36aa37e
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/pr45886.patch
@@ -0,0 +1,55 @@
+From d066d0682da4e60b811d9282b00128244caa5c29 Mon Sep 17 00:00:00 2001
+From: Ilya Yanok <yanok@emcraft.com>
+Date: Mon, 21 Mar 2011 00:55:25 +0100
+Subject: [PATCH 6/6] PR45886
+
+---
+ gcc/config/arm/arm.c |    2 +-
+ gcc/config/arm/arm.h |   11 ++++++++++-
+ 2 files changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/config/arm/arm.c b/gcc/config/arm/arm.c
+index 0382b24..5634829 100644
+--- a/gcc/config/arm/arm.c
++++ b/gcc/config/arm/arm.c
+@@ -700,7 +700,7 @@ static int after_arm_reorg = 0;
+ /* The maximum number of insns to be used when loading a constant.  */
+ static int arm_constant_limit = 3;
+ 
+-static enum arm_pcs arm_pcs_default;
++enum arm_pcs arm_pcs_default;
+ 
+ /* For an explanation of these variables, see final_prescan_insn below.  */
+ int arm_ccfsm_state;
+diff --git a/gcc/config/arm/arm.h b/gcc/config/arm/arm.h
+index 26ffaf8..ac7bbb3 100644
+--- a/gcc/config/arm/arm.h
++++ b/gcc/config/arm/arm.h
+@@ -94,7 +94,13 @@ extern char arm_arch_name[];
+ 	if (arm_arch_iwmmxt)				\
+ 	  builtin_define ("__IWMMXT__");		\
+ 	if (TARGET_AAPCS_BASED)				\
+-	  builtin_define ("__ARM_EABI__");		\
++	  {						\
++	    if (arm_pcs_default == ARM_PCS_AAPCS_VFP)	\
++	      builtin_define ("__ARM_PCS_VFP");		\
++	    else if (arm_pcs_default == ARM_PCS_AAPCS)	\
++	      builtin_define ("__ARM_PCS");		\
++	    builtin_define ("__ARM_EABI__");		\
++	  }						\
+     } while (0)
+ 
+ /* The various ARM cores.  */
+@@ -1648,6 +1654,9 @@ enum arm_pcs
+   ARM_PCS_UNKNOWN
+ };
+ 
++/* Default procedure calling standard of current compilation unit. */
++extern enum arm_pcs arm_pcs_default;
++
+ /* A C type for declaring a variable that is used as the first argument of
+    `FUNCTION_ARG' and other related values.  */
+ typedef struct
+-- 
+1.7.4
+
-- 
1.7.6




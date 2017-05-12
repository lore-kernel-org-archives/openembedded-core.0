Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C6C2677BC3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 08:16:26 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v4C8GOYc028685
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 12 May 2017 09:16:25 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1d95kO-0001Zf-GA; Fri, 12 May 2017 09:16:24 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 May 2017 09:16:20 +0100
Message-Id: <1494576982-6006-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494576982-6006-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1494576982-6006-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 12 May 2017 09:16:25 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 2/4] gcc-configure/gcc-target: Move arm6/7 config to target only
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
X-List-Received-Date: Fri, 12 May 2017 08:16:29 -0000

We only build one gcc-cross per architecture and having target specific
flags means gcc-cross would rebuild. These flags are really for the
on target case, so they should be set in gcc-target only.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 8 --------
 meta/recipes-devtools/gcc/gcc-target.inc           | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 00ef89e..0865259 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -66,14 +66,6 @@ EXTRA_OECONF_append_mipsisa32r6 = " --with-abi=32 --with-arch=mips32r6"
 EXTRA_OECONF_append_mipsisa64r6el = " --with-abi=64 --with-arch-64=mips64r6"
 EXTRA_OECONF_append_mipsisa64r6 = " --with-abi=64 --with-arch-64=mips64r6"
 
-# ARMv6+ adds atomic instructions that affect the ABI in libraries built
-# with TUNE_CCARGS in gcc-runtime.  Make the compiler default to a
-# compatible architecture.  armv6 and armv7a cover the minimum tune
-# features used in OE.
-EXTRA_OECONF_append_armv6 = " --with-arch=armv6"
-EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a"
-EXTRA_OECONF_append_armv7ve = " --with-arch=armv7-a"
-
 EXTRA_OECONF_GCC_FLOAT ??= ""
 CPPFLAGS = ""
 
diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index eef4434..b6e31f5 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -9,6 +9,14 @@ EXTRA_OECONF_PATHS = "\
 
 EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
 
+# ARMv6+ adds atomic instructions that affect the ABI in libraries built
+# with TUNE_CCARGS in gcc-runtime.  Make the compiler default to a
+# compatible architecture.  armv6 and armv7a cover the minimum tune
+# features used in OE.
+EXTRA_OECONF_append_armv6 = " --with-arch=armv6"
+EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a"
+EXTRA_OECONF_append_armv7ve = " --with-arch=armv7-a"
+
 # libcc1 requres gcc_cv_objdump when cross build, but gcc_cv_objdump is
 # set in subdir gcc, so subdir libcc1 can't use it, export it here to
 # fix the problem.
-- 
2.7.4



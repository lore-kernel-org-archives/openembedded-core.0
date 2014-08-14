Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-05.prod.phx3.secureserver.net
	(p3plsmtpa08-05.prod.phx3.secureserver.net [173.201.193.106])
	by mail.openembedded.org (Postfix) with ESMTP id 678E870CEC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 19:06:07 +0000 (UTC)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa08-05.prod.phx3.secureserver.net with 
	id ej621o0091mTNtu01j68K9; Thu, 14 Aug 2014 12:06:09 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Aug 2014 14:05:59 -0500
Message-Id: <1408043159-8108-10-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <1408043159-8108-1-git-send-email-pab@pabigot.com>
References: <1408043159-8108-1-git-send-email-pab@pabigot.com>
Subject: [PATCH v2 9/9] gcc: update compiler architecture to match gcc-runtime (armv6, armv7a)
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
X-List-Received-Date: Thu, 14 Aug 2014 19:06:07 -0000

The gcc-runtime recipe builds the gcc libraries including libstdc++ with
$TARGET_CC_ARCH flags, which include -march=FOO flags that affect
whether atomic instructions are available.  This causes an ABI
incompatibility when the compiler by default generates code for less
capable architectures.  For example, gcc-runtime libraries on a
Cortex-A8 are built with a different C++11/C++14 mutex implementation
than is used code compiled outside OE and without architecture-specific
flags.

This commit fixes the problem specifically for ABI issues related to
atomic instructions available in ARMV6 and subsequent architectures.
Other ABI incompatibilities may remain in other architectures.

See: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=62100

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 71dce12..48fb799 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -64,6 +64,13 @@ EXTRA_OECONF_append_libc-uclibc = " --enable-__cxa_atexit"
 EXTRA_OECONF_append_mips64 = " --with-abi=64 --with-arch-64=mips64 --with-tune-64=mips64"
 EXTRA_OECONF_append_mips64el = " --with-abi=64 --with-arch-64=mips64 --with-tune-64=mips64"
 
+# ARMv6+ adds atomic instructions that affect the ABI in libraries built
+# with TUNE_CCARGS in gcc-runtime.  Make the compiler default to a
+# compatible architecture.  armv6 and armv7a cover the minimum tune
+# features used in OE.
+EXTRA_OECONF_append_armv6 = " --with-arch=armv6"
+EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a"
+
 EXTRA_OECONF_GCC_FLOAT ??= ""
 CPPFLAGS = ""
 
-- 
1.8.5.5



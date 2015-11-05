Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 7912275D4A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 14:47:15 +0000 (UTC)
Received: from [86.30.112.98] (HELO elite.brightsign)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 635310916; Thu, 05 Nov 2015 09:47:15 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1ZuLol-0009Zv-MX; Thu, 05 Nov 2015 14:47:11 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1ZuLol-0001Zm-Lj; Thu, 05 Nov 2015 14:47:11 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Nov 2015 14:47:01 +0000
Message-Id: <1446734821-6011-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] bitbake.conf, module.bbclass: Support opting out of legacy EXTRA_OEMAKE
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
X-List-Received-Date: Thu, 05 Nov 2015 14:47:18 -0000

Give recipes and classes the ability to opt out of EXTRA_OEMAKE
containing the legacy value without removing other recipe-specific or
local additions.

The default value of EXTRA_OEMAKE="-e MAKEFLAGS=" is unfortunate. It
causes breakage and unintended behaviour in various recipes.

It is particularly toxic when variables are passed on the command line
to make since they then don't survive calling into a submake.

In particular this breaks building modules when LD=gold since the
overridden LD=${KERNEL_LD} is lost by the time the kernel's Makefile is
invoked.

This solution isn't pretty either, but it may be a good small first step
towards a future utopia where EXTRA_OEMAKE needn't contain "-e
MAKEFLAGS=" by default at all.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
Acked-by: Phil Blundell <pb@pbcl.net>
---
 meta/classes/module.bbclass | 4 ++++
 meta/conf/bitbake.conf      | 3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index 0952c0c..4913aac 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -4,6 +4,10 @@ addtask make_scripts after do_patch before do_compile
 do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
 do_make_scripts[depends] += "virtual/kernel:do_shared_workdir"
 
+# -e MAKEFLAGS= is toxic when building modules since it will cause
+# none of the variables passed to make on the command line to make it
+# through to submakes.
+EXTRA_OEMAKE_LEGACY = ""
 EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
 
 module_do_compile() {
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 06971da..93ab02a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -477,7 +477,8 @@ export BUILD_STRIP = "${BUILD_PREFIX}strip"
 export BUILD_NM = "${BUILD_PREFIX}nm"
 
 export MAKE = "make"
-EXTRA_OEMAKE = "-e MAKEFLAGS="
+EXTRA_OEMAKE_LEGACY = "-e MAKEFLAGS="
+EXTRA_OEMAKE = "${EXTRA_OEMAKE_LEGACY}"
 EXTRA_OECONF = ""
 export LC_ALL = "C"
 
-- 
2.1.4



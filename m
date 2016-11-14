Return-Path: <jianxun.zhang@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9167B6FEE0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 22:07:48 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 14 Nov 2016 14:07:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,640,1473145200"; d="scan'208";a="31220577"
Received: from chang-s2600cp.jf.intel.com ([10.54.77.22])
	by fmsmga006.fm.intel.com with ESMTP; 14 Nov 2016 14:07:50 -0800
From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Nov 2016 14:10:54 -0800
Message-Id: <1479161454-236511-1-git-send-email-jianxun.zhang@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] rmc: Fix compiling issue with musl
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
X-List-Received-Date: Mon, 14 Nov 2016 22:07:49 -0000

| src/rmcl/rmcl.c: In function 'query_policy_from_db':
| src/rmcl/rmcl.c:254:25: error: unknown type name 'ssize_t'
| ssize_t cmd_name_len = strlen((char *)&rmc_db[policy_idx]) + 1;
| ^~~~~~~~

The musl C lib provides ssize_t but we need to enable it
with a macro.

Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
---
Before maintainer(s) push "merge" button, please read this short summary.
I feel there could be a better syntax to do it. And We could need to get
an ack from Hernandez, Alejandro who reported this issue and seems still
have (other) compiling errors even with this patch.

I submit this patch based on my thoughts and test out of tiny config.

Tests:
() Specify TCLIBC = "musl" in local.conf in my build dir.
() Build quark
() I can see this issue happens without the fix
() With this patch and do clean builds for quark and corei7-64,
Compiling passes. Boot test passed on RMC targets quark and Broxton-m.

Thanks


 common/recipes-bsp/rmc/rmc.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/common/recipes-bsp/rmc/rmc.bb b/common/recipes-bsp/rmc/rmc.bb
index aeaf12e..61a1bdb 100644
--- a/common/recipes-bsp/rmc/rmc.bb
+++ b/common/recipes-bsp/rmc/rmc.bb
@@ -24,6 +24,8 @@ COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux*"
 
 EXTRA_OEMAKE='RMC_CFLAGS="-Wl,--hash-style=both"'
 
+EXTRA_OEMAKE_append_libc-musl = '" -D__NEED_ssize_t"'
+
 # from gnu-efi, we should align arch-mapping with it.
 def rmc_efi_arch(d):
     import re
-- 
2.7.4



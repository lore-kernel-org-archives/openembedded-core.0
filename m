Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2096D6FF56
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:06:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 09 Mar 2016 07:06:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="933083890"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 09 Mar 2016 07:06:41 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:02:09 +0200
Message-Id: <836d56bb1dfbb259ce1858385e4f128ddfea3824.1457535622.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 23/24] machine/include/arch-x86: Make x32 ABI not supporting gobject-introspection-data
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
X-List-Received-Date: Wed, 09 Mar 2016 15:06:43 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

x32 isn't supported by user mode qemu so we can't build
gobject-introspection-data, so disable it in this case.

(From OE-Core rev: 4ee1eb8ddd3fbe144fbaeb32e07b66e191aa7548)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/machine/include/x86/arch-x86.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/machine/include/x86/arch-x86.inc b/meta/conf/machine/include/x86/arch-x86.inc
index 400da1a..ba7be8a 100644
--- a/meta/conf/machine/include/x86/arch-x86.inc
+++ b/meta/conf/machine/include/x86/arch-x86.inc
@@ -24,6 +24,8 @@ ABIEXTENSION .= "${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'x32', '' ,d)}"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mx32', ' -mx32', '', d)}"
 TUNE_LDARGS += "${@bb.utils.contains('TUNE_FEATURES', 'mx32', '-m elf32_x86_64', '', d)}"
 TUNE_ASARGS += "${@bb.utils.contains('TUNE_FEATURES', 'mx32', '-x32', '', d)}"
+# user mode qemu doesn't support x32
+MACHINE_FEATURES_BACKFILL_CONSIDERED_append = " ${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'gobject-introspection-data', '', d)}"
 
 # ELF64 ABI
 TUNEVALID[m64] = "IA32e (x86_64) ELF64 standard ABI"
-- 
2.7.0



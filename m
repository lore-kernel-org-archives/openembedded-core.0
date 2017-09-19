Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2E3CF7804E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 18:27:34 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Sep 2017 11:27:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,418,1500966000"; d="scan'208";a="901938606"
Received: from swold-mobl2.jf.intel.com ([10.24.10.67])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Sep 2017 11:27:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue, 19 Sep 2017 11:27:32 -0700
Message-Id: <20170919182734.15741-2-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170919182734.15741-1-sgw@linux.intel.com>
References: <20170919182734.15741-1-sgw@linux.intel.com>
Subject: [PATCH 1/3] arch-x86: Add x86-x32 to MACHINEOVERRIDES
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
X-List-Received-Date: Tue, 19 Sep 2017 18:27:34 -0000

This is needed as an x32 more generic x32 override later in the
OVERRIDES, currently linux-gnux32 is the first override, but we
need a stronger (later in the list) x32 override to deal with some
needed x32 dependency overrides.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/machine/include/x86/arch-x86.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine/include/x86/arch-x86.inc b/meta/conf/machine/include/x86/arch-x86.inc
index e51d595f74..31d30b3304 100644
--- a/meta/conf/machine/include/x86/arch-x86.inc
+++ b/meta/conf/machine/include/x86/arch-x86.inc
@@ -26,6 +26,7 @@ TUNE_LDARGS += "${@bb.utils.contains('TUNE_FEATURES', 'mx32', '-m elf32_x86_64',
 TUNE_ASARGS += "${@bb.utils.contains('TUNE_FEATURES', 'mx32', '-x32', '', d)}"
 # user mode qemu doesn't support x32
 MACHINE_FEATURES_BACKFILL_CONSIDERED_append = " ${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'qemu-usermode', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'x86_x32:', '' ,d)}"
 
 # ELF64 ABI
 TUNEVALID[m64] = "IA32e (x86_64) ELF64 standard ABI"
-- 
2.11.0



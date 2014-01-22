Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 968C16E70F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 00:53:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Jan 2014 16:53:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,697,1384329600"; d="scan'208";a="442600467"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga001.jf.intel.com with ESMTP; 21 Jan 2014 16:53:10 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Poky <poky@yoctoproject.org>
Date: Tue, 21 Jan 2014 16:59:01 -0800
Message-Id: <897fcd84cce388aa82969568f9c3b016aa132384.1390351667.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <e6c72bf867006ab15d62d0beb1cd8aafe19db72a.1390351667.git.dvhart@linux.intel.com>
References: <e6c72bf867006ab15d62d0beb1cd8aafe19db72a.1390351667.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1390351667.git.dvhart@linux.intel.com>
References: <cover.1390351667.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@intel.com>
Subject: [PATCH 16/19] yocto-bsp: Update substrate to use the new x86 tune files
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
X-List-Received-Date: Wed, 22 Jan 2014 00:53:10 -0000

Update the substrates to use x86-base instead of ia32-base and core2-64
instead of x86-64. Update the core2 bit to include the DEFAULTTUNE to be
explicit.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Eggleton <paul.eggleton@intel.com>
Cc: Tom Zanussi <tom.zanussi@intel.com>
Cc: Nitin Kamble <nitin.a.kamble@intel.com>
Cc: Mark Hatle <mark.hatle@windriver.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 .../arch/i386/conf/machine/{{=machine}}.conf       |   13 +++++++------
 .../arch/x86_64/conf/machine/{{=machine}}.conf     |   15 ++++++++-------
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/bsp/substrate/target/arch/i386/conf/machine/{{=machine}}.conf b/scripts/lib/bsp/substrate/target/arch/i386/conf/machine/{{=machine}}.conf
index b06ba12..2fff9b7 100644
--- a/scripts/lib/bsp/substrate/target/arch/i386/conf/machine/{{=machine}}.conf
+++ b/scripts/lib/bsp/substrate/target/arch/i386/conf/machine/{{=machine}}.conf
@@ -23,9 +23,10 @@ require conf/machine/include/tune-i586.inc
 {{ if tunefile == "tune_atom": }}
 require conf/machine/include/tune-atom.inc
 {{ if tunefile == "tune_core2": }}
+DEFAULTTUNE="core2-32"
 require conf/machine/include/tune-core2.inc
 
-require conf/machine/include/ia32-base.inc
+require conf/machine/include/x86-base.inc
 
 MACHINE_FEATURES += "wifi efi pcbios"
 
@@ -46,14 +47,14 @@ MACHINE_FEATURES += "wifi efi pcbios"
 {{ if xserver == "y" and kernel_choice != "linux-yocto_3.4" and kernel_choice != "linux-yocto_3.10" and kernel_choice != "custom": xserver_choice = "xserver_i915" }}
 
 {{ if xserver == "y": }}
-XSERVER ?= "${XSERVER_IA32_BASE} \
-           ${XSERVER_IA32_EXT} \
+XSERVER ?= "${XSERVER_X86_BASE} \
+           ${XSERVER_X86_EXT} \
 {{ if xserver == "y" and xserver_choice == "xserver_vesa": }}
-           ${XSERVER_IA32_VESA} \
+           ${XSERVER_X86_VESA} \
 {{ if xserver == "y" and xserver_choice == "xserver_i915": }}
-           ${XSERVER_IA32_I915} \
+           ${XSERVER_X86_I915} \
 {{ if xserver == "y" and xserver_choice == "xserver_i965": }}
-           ${XSERVER_IA32_I965} \
+           ${XSERVER_X86_I965} \
 {{ if xserver == "y": }}
            "
 
diff --git a/scripts/lib/bsp/substrate/target/arch/x86_64/conf/machine/{{=machine}}.conf b/scripts/lib/bsp/substrate/target/arch/x86_64/conf/machine/{{=machine}}.conf
index 2bf2226..6685d07 100644
--- a/scripts/lib/bsp/substrate/target/arch/x86_64/conf/machine/{{=machine}}.conf
+++ b/scripts/lib/bsp/substrate/target/arch/x86_64/conf/machine/{{=machine}}.conf
@@ -14,8 +14,9 @@ PREFERRED_PROVIDER_virtual/kernel ?= "{{=preferred_kernel}}"
 PREFERRED_PROVIDER_virtual/kernel ?= "{{=preferred_kernel}}"
 PREFERRED_VERSION_{{=preferred_kernel}} ?= "{{=preferred_kernel_version}}%"
 
-require conf/machine/include/tune-x86_64.inc
-require conf/machine/include/ia32-base.inc
+DEFAULTTUNE ?= "core2-64"
+require conf/machine/include/tune-core2.inc
+require conf/machine/include/x86-base.inc
 
 MACHINE_FEATURES += "wifi efi pcbios"
 
@@ -28,14 +29,14 @@ MACHINE_FEATURES += "wifi efi pcbios"
 {{ input type:"choice" val:"xserver_i915" msg:"i915 xserver support" }}
 {{ input type:"choice" val:"xserver_i965" msg:"i965 xserver support" }}
 {{ if xserver == "y": }}
-XSERVER ?= "${XSERVER_IA32_BASE} \
-           ${XSERVER_IA32_EXT} \
+XSERVER ?= "${XSERVER_X86_BASE} \
+           ${XSERVER_X86_EXT} \
 {{ if xserver == "y" and xserver_choice == "xserver_vesa": }}
-           ${XSERVER_IA32_VESA} \
+           ${XSERVER_X86_VESA} \
 {{ if xserver == "y" and xserver_choice == "xserver_i915": }}
-           ${XSERVER_IA32_I915} \
+           ${XSERVER_X86_I915} \
 {{ if xserver == "y" and xserver_choice == "xserver_i965": }}
-           ${XSERVER_IA32_I965} \
+           ${XSERVER_X86_I965} \
 {{ if xserver == "y": }}
            "
 
-- 
1.7.9.5



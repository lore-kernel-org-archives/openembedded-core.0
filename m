Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7FCCF71C7D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 14:33:48 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id z6so523530pfk.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 07:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zZuJ5a5O5Nd8+lXK/a4A/TiMmaxDB3VrsdHtwjmgskU=;
	b=azwWlBos5wASyLezgpuMJsZNM2cbZcLf7igqa7y3FpvChMlwbAcEn+k4w1fuq72Ln7
	GC3cHOgiaBzBUX1xsdIDd0h04Qo/S8jkDlVkuVNW8JiJrFKfPivKCUfo+5Kl7Ni//EGs
	itTSNJUjBPFsxWPpvTKKHo+CO5pLISecdu1noQuxPpelBYia7sFNx53VlgLm/WghUEAa
	MVI64g8uHKplLIxriwXP9KHMQ2mSCN0dwYbBGz8xvcmMQ5d+FnMKDzUo7ipYZLFlks7w
	iNiuPwMgEnwH7DBxUXulSnIR8Yd3WS6rgxJuNpeOZ7IZ3iDgG4/Zf/KJK3utNFym35Mq
	540g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zZuJ5a5O5Nd8+lXK/a4A/TiMmaxDB3VrsdHtwjmgskU=;
	b=pQKnWT39t3vFcgMuf++LZ4goA3KKdgNFaxAgU6eRHF/5DTdr9F62rD9MblD+tvjPuY
	9y1TdZ3fsgLHYWnP6ptbvCEMZ0xYyaMRz3togu96d62EOr9kl7mGeLUlqrvZVoPtga1+
	Ud+t+7DRBjMjhbOzeZ752J0oIKYGJDRs1E3jfYxRloyuZf/i8n3qiB+DXQ/1U4U9ku4T
	oWT8ytqUf4pD8BenrEwwamr8Yvfl8Ak0zUsCN0kMWW/QWmO427qXesrbuQGYdHOMERtt
	ThExv0eNs04XQJVtS7WaxrDzFjanVMPPv/vyQd3mK1SyjmMSJd4/hg5iK/MwVned8Fay
	pefA==
X-Gm-Message-State: AIVw111/oKHGvsUlRx1BueUVGk9qKYUJ4yHrExLb6GbdJ5Arql0Jr2KF
	UZpucUTDdPor8SeQ
X-Received: by 10.84.130.40 with SMTP id 37mr27388863plc.291.1499351629502;
	Thu, 06 Jul 2017 07:33:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	w66sm1132739pfi.63.2017.07.06.07.33.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 07:33:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 07:33:11 -0700
Message-Id: <d7d57e417532c70560283a4339aa11dbe6a8f02b.1499351361.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1499351361.git.raj.khem@gmail.com>
References: <cover.1499351361.git.raj.khem@gmail.com>
Subject: [PATCH 10/22] ovmf: Fix build with toolchain defaulting to PIE
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
X-List-Received-Date: Thu, 06 Jul 2017 14:33:48 -0000

GCC44_IA32_X64_DLINK_COMMON and GCC49_IA32_X64_DLINK_COMMON
variables add to final linker flags that ovmf build forms
on its own, so trying to inject it from environment will not
work.

Here we add option to disable pie during linking, which should
have been accompanied with correcponding gcc/cflags.

Fixes

|   /mnt/a/oe/build/tmp/work/i586-bec-linux/ovmf/git-r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/OvmfPkg/AcpiTables/AcpiTables/OUTPUT/./Facs.dll: Bad definition for symbol '<unknown>'@0 or unsupported symbol type.  For example, absolute and undefined symbols are not supported.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ovmf/ovmf/0001-ia32-Dont-use-pie.patch         | 27 ++++++++++++++--------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf/0001-ia32-Dont-use-pie.patch b/meta/recipes-core/ovmf/ovmf/0001-ia32-Dont-use-pie.patch
index 7ce20be54c..5bb418b954 100644
--- a/meta/recipes-core/ovmf/ovmf/0001-ia32-Dont-use-pie.patch
+++ b/meta/recipes-core/ovmf/ovmf/0001-ia32-Dont-use-pie.patch
@@ -10,10 +10,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  BaseTools/Conf/tools_def.template | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.template
-index 04a1bcb210..84c5f84f93 100755
---- a/BaseTools/Conf/tools_def.template
-+++ b/BaseTools/Conf/tools_def.template
+Index: git/BaseTools/Conf/tools_def.template
+===================================================================
+--- git.orig/BaseTools/Conf/tools_def.template
++++ git/BaseTools/Conf/tools_def.template
 @@ -4336,7 +4336,7 @@ RELEASE_*_*_OBJCOPY_ADDDEBUGFLAG   =
  NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     = --add-gnu-debuglink=$(DEBUG_DIR)/$(MODULE_NAME).debug
  
@@ -23,15 +23,24 @@ index 04a1bcb210..84c5f84f93 100755
  DEFINE GCC_X64_CC_FLAGS            = DEF(GCC_ALL_CC_FLAGS) -mno-red-zone -Wno-address -mno-stack-arg-probe
  DEFINE GCC_IPF_CC_FLAGS            = DEF(GCC_ALL_CC_FLAGS) -minline-int-divide-min-latency
  DEFINE GCC_ARM_CC_FLAGS            = DEF(GCC_ALL_CC_FLAGS) -mlittle-endian -mabi=aapcs -fno-short-enums -funsigned-char -ffunction-sections -fdata-sections -fomit-frame-pointer -Wno-address -mthumb -mfloat-abi=soft -fno-pic -fno-pie
-@@ -4369,7 +4369,7 @@ DEFINE GCC_ARM_RC_FLAGS            = -I binary -O elf32-littlearm     -B arm
+@@ -4369,9 +4369,9 @@ DEFINE GCC_ARM_RC_FLAGS            = -I
  DEFINE GCC_AARCH64_RC_FLAGS        = -I binary -O elf64-littleaarch64 -B aarch64 --rename-section .data=.hii
  
  DEFINE GCC44_ALL_CC_FLAGS            = -g -fshort-wchar -fno-builtin -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -ffunction-sections -fdata-sections -include AutoGen.h -fno-common -DSTRING_ARRAY_NAME=$(BASE_NAME)Strings
 -DEFINE GCC44_IA32_CC_FLAGS           = DEF(GCC44_ALL_CC_FLAGS) -m32 -march=i586 -malign-double -fno-stack-protector -D EFI32 -fno-asynchronous-unwind-tables
 +DEFINE GCC44_IA32_CC_FLAGS           = DEF(GCC44_ALL_CC_FLAGS) -m32 -march=i586 -malign-double -fno-stack-protector -D EFI32 -fno-asynchronous-unwind-tables -fno-PIE -no-pie
  DEFINE GCC44_X64_CC_FLAGS            = DEF(GCC44_ALL_CC_FLAGS) -m64 -fno-stack-protector "-DEFIAPI=__attribute__((ms_abi))" -maccumulate-outgoing-args -mno-red-zone -Wno-address -mcmodel=small -fpie -fno-asynchronous-unwind-tables
- DEFINE GCC44_IA32_X64_DLINK_COMMON   = -nostdlib -Wl,-n,-q,--gc-sections -z common-page-size=0x20
+-DEFINE GCC44_IA32_X64_DLINK_COMMON   = -nostdlib -Wl,-n,-q,--gc-sections -z common-page-size=0x20
++DEFINE GCC44_IA32_X64_DLINK_COMMON   = -nostdlib -Wl,-n,-q,--gc-sections -z common-page-size=0x20 -no-pie
  DEFINE GCC44_IA32_X64_ASLDLINK_FLAGS = DEF(GCC44_IA32_X64_DLINK_COMMON) -Wl,--entry,ReferenceAcpiTable -u ReferenceAcpiTable
--- 
-2.13.1
-
+ DEFINE GCC44_IA32_X64_DLINK_FLAGS    = DEF(GCC44_IA32_X64_DLINK_COMMON) -Wl,--entry,$(IMAGE_ENTRY_POINT) -u $(IMAGE_ENTRY_POINT) -Wl,-Map,$(DEST_DIR_DEBUG)/$(BASE_NAME).map
+ DEFINE GCC44_IA32_DLINK2_FLAGS       = -Wl,--defsym=PECOFF_HEADER_SIZE=0x220 DEF(GCC_DLINK2_FLAGS_COMMON)
+@@ -4451,7 +4451,7 @@ DEFINE GCC48_AARCH64_ASLDLINK_FLAGS  = D
+ 
+ DEFINE GCC49_IA32_CC_FLAGS           = DEF(GCC48_IA32_CC_FLAGS)
+ DEFINE GCC49_X64_CC_FLAGS            = DEF(GCC48_X64_CC_FLAGS)
+-DEFINE GCC49_IA32_X64_DLINK_COMMON   = -nostdlib -Wl,-n,-q,--gc-sections -z common-page-size=0x40
++DEFINE GCC49_IA32_X64_DLINK_COMMON   = -nostdlib -Wl,-n,-q,--gc-sections -z common-page-size=0x40 -no-pie
+ DEFINE GCC49_IA32_X64_ASLDLINK_FLAGS = DEF(GCC49_IA32_X64_DLINK_COMMON) -Wl,--entry,ReferenceAcpiTable -u ReferenceAcpiTable
+ DEFINE GCC49_IA32_X64_DLINK_FLAGS    = DEF(GCC49_IA32_X64_DLINK_COMMON) -Wl,--entry,$(IMAGE_ENTRY_POINT) -u $(IMAGE_ENTRY_POINT) -Wl,-Map,$(DEST_DIR_DEBUG)/$(BASE_NAME).map
+ DEFINE GCC49_IA32_DLINK2_FLAGS       = DEF(GCC48_IA32_DLINK2_FLAGS)
-- 
2.13.2



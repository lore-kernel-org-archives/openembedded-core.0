Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id BA09077C29
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 15:51:13 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id j186so27767069pge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jul 2017 08:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zZuJ5a5O5Nd8+lXK/a4A/TiMmaxDB3VrsdHtwjmgskU=;
	b=b+nal5aMvcFqh0Lr65XAYenInwNlPXqSDcenUo9/BWiugN30OwS8rQFpyg+Kz0jcbl
	y9WXTzaPakUFrmlOi/6fJrMDXLnVF0Lw74p7k2WV2c+RO1tGWSt9HD4zMGwabzjQxGhw
	kgHjEuO+0Lj5giF2OFls93mzfPrTx+IjVcaAgNAxExVxGon5kYH7cqlM6XCHc+Tgy1O3
	wnNu5bMAHjAPwRDsFH1gXAjOfoCJpBGnpCZ4Rb8cfXRlhZq3E44EeNgyPx1DNn2XXY3M
	A+d4/yW9SVCEL/gb3tzGEqyxVdn4kLnDykXhUXYhLmJMS0j51li+2WclBi1vfRRLla8L
	Znkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zZuJ5a5O5Nd8+lXK/a4A/TiMmaxDB3VrsdHtwjmgskU=;
	b=AHFdKWfXMbdwplawf3GiqLeObubqBY9V8+0f9LchpaP682e38ID2KhTKEwfi7RhzdL
	qRseLXmTvR/lwsx/7RBOZMlPwlm8bULSdBZuGImXzTzV8M0l3RFS2zYUiwrLYD/soefl
	EOj0s+22Flp9VvPspDRF4F5ViM6viETLv2KYJxamKVkt9quEBekY8P6thEGmpWZUbCgt
	c4hDY38X2F2LvsAYPCRu7EGT/kRagW6U3Dbc9r/9kWVrg25tcU0zLh3K9DQw25czW/s8
	ZSNcO74V1JhUcB9YIZkM/tQa3+0WPQwt7Nz9Pit/54ksnhp59/qDso7ze199iIN8kP6y
	eMqg==
X-Gm-Message-State: AIVw111HXCLDcuEl5q/RLoEXTR2NnuxDaQwcW99oLM1hxYtga8fn1+bf
	fej/z7pl78I0Jl4u
X-Received: by 10.84.137.1 with SMTP id 1mr17604713plm.128.1499183474475;
	Tue, 04 Jul 2017 08:51:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	r63sm36545914pgr.65.2017.07.04.08.51.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Jul 2017 08:51:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Jul 2017 08:50:56 -0700
Message-Id: <20170704155056.12467-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170704155056.12467-1-raj.khem@gmail.com>
References: <20170704155056.12467-1-raj.khem@gmail.com>
Subject: [PATCH 3/3] ovmf: Fix build with toolchain defaulting to PIE
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
X-List-Received-Date: Tue, 04 Jul 2017 15:51:13 -0000

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



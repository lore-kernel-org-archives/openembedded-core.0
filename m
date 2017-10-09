Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3021270057
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Oct 2017 19:58:42 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id i23so30089330pfi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Oct 2017 12:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6AYA4xkKT3l0NpdUs3t9Tc0ZTeZ+uRX3YgYB8BWPzrs=;
	b=X0zgxZ8SIKSAr7LLRnBB0FFhfW2MZKOydDI9D5d6IqDpXSIJrTdlRyutMoG61nflJJ
	EMUpzc1BSNkgLj5liLvjtw9mdxKezSsoO/ylsgMVmVGpswi35oqDlCZObDUn4FDDvNvX
	0NxLeEym2V7z5VDg0roKd1gzLy93t0DDt6mLV1uJl8VMlNOONfUFMTORmJrcfUeOaiFG
	Ew3Zdr5eIY0gjMePJMddmQzIMup1B3PVxSjp/aafiCpG2mJrEqAKkY0KtpJgB0SLCeF/
	OOrYawgrRJWXOX9pIdX2p+rrB2HoJWCMAGTLcUdgWk2tZsnJIXCZU+G+H9oO10H+zkT8
	1W8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6AYA4xkKT3l0NpdUs3t9Tc0ZTeZ+uRX3YgYB8BWPzrs=;
	b=TBI2eAlI5+ewgnecx5vVcYCA8gibEcvcUMfN35v2GPGnktj/0GnVuHbVlqP5Rn3eN5
	/WSvLT/mSu/AU6YPFmaIbzV1TqFdtSkInIMgJ8O7X5KBMtLIqqhMEH3YD+HkI+q9tdYu
	+1cM0P/R0TGFozmGVX2TKqDvYzsUoMDdCNlYU3N+LD0U4KdlgQip6Bn/hHJeLtuCnpVV
	hwSBsMM1giqXuoIhQMwjA2FpPxf9rBIWuzMdvZl9fq9ywgDDgBcsAeaHSKnQ/OSTMPKQ
	t5p2HSOMV6uIT7hPA8e82kDWd7Taw35ZJ7pTsygi5G7CScJCUse2w15u4m6lGNXUqQDM
	8GAQ==
X-Gm-Message-State: AMCzsaWsDCq9hjT7snTY/FlTXVfjaPJF4PabAveOAkXyKgsFtaczsnJT
	Jlpf1GX+iQ2EQMOb5RsRjAzweA==
X-Google-Smtp-Source: AOwi7QDBIttMnLghvnt8FoASH6ctAjVL8zSywOd2hefVBAFvlmQLiFTlnp+q75fSIBfhFoKNI7STfg==
X-Received: by 10.159.249.3 with SMTP id bf3mr7077836plb.311.1507579124139;
	Mon, 09 Oct 2017 12:58:44 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3e99])
	by smtp.gmail.com with ESMTPSA id 9sm15827964pgg.42.2017.10.09.12.58.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Oct 2017 12:58:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Oct 2017 12:58:36 -0700
Message-Id: <20171009195836.17085-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
Subject: [PATCH V2 6/9] gcc: Backport fix for a segfault on riscv
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
X-List-Received-Date: Mon, 09 Oct 2017 19:58:43 -0000

seen during kernel compile

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
- Changes in V2: Add SOB

 meta/recipes-devtools/gcc/gcc-7.2.inc              |  1 +
 ...le-non-legitimate-address-in-riscv_legiti.patch | 51 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.2/0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch

diff --git a/meta/recipes-devtools/gcc/gcc-7.2.inc b/meta/recipes-devtools/gcc/gcc-7.2.inc
index 796e6b1eef..5883bc61a6 100644
--- a/meta/recipes-devtools/gcc/gcc-7.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.2.inc
@@ -74,6 +74,7 @@ SRC_URI = "\
            file://0047-sync-gcc-stddef.h-with-musl.patch \
            file://0048-gcc-Enable-static-PIE.patch \
            file://fix-segmentation-fault-precompiled-hdr.patch \
+           file://0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch b/meta/recipes-devtools/gcc/gcc-7.2/0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch
new file mode 100644
index 0000000000..5a14d04b6f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-7.2/0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch
@@ -0,0 +1,51 @@
+From 16210e6270e200cd4892a90ecef608906be3a130 Mon Sep 17 00:00:00 2001
+From: Kito Cheng <kito.cheng@gmail.com>
+Date: Thu, 4 May 2017 02:11:13 +0800
+Subject: [PATCH] RISC-V: Handle non-legitimate address in
+ riscv_legitimize_move
+
+GCC may generate non-legitimate address due to we allow some
+load/store with non-legitimate address in pic.md.
+
+  2017-05-12  Kito Cheng  <kito.cheng@gmail.com>
+
+      * config/riscv/riscv.c (riscv_legitimize_move): Handle
+      non-legitimate address.
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ gcc/ChangeLog            |  5 +++++
+ gcc/config/riscv/riscv.c | 16 ++++++++++++++++
+ 2 files changed, 21 insertions(+)
+
+diff --git a/gcc/config/riscv/riscv.c b/gcc/config/riscv/riscv.c
+index f7fec4bfcf8..d519be1659a 100644
+--- a/gcc/config/riscv/riscv.c
++++ b/gcc/config/riscv/riscv.c
+@@ -1385,6 +1385,22 @@ riscv_legitimize_move (enum machine_mode mode, rtx dest, rtx src)
+       return true;
+     }
+ 
++  /* RISC-V GCC may generate non-legitimate address due to we provide some
++     pattern for optimize access PIC local symbol and it's make GCC generate
++     unrecognizable instruction during optmizing.  */
++
++  if (MEM_P (dest) && !riscv_legitimate_address_p (mode, XEXP (dest, 0),
++						   reload_completed))
++    {
++      XEXP (dest, 0) = riscv_force_address (XEXP (dest, 0), mode);
++    }
++
++  if (MEM_P (src) && !riscv_legitimate_address_p (mode, XEXP (src, 0),
++						  reload_completed))
++    {
++      XEXP (src, 0) = riscv_force_address (XEXP (src, 0), mode);
++    }
++
+   return false;
+ }
+ 
+-- 
+2.14.2
+
-- 
2.14.2



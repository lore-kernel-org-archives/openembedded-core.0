Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 95841780D8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 00:51:02 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id e69so15587411pfg.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Oct 2017 17:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WyVWErJSHCBs8hAPMKozqApdgy6nFK3uhm3Sgi1PbCc=;
	b=QdvZmZjyPSdG5G46BgqaZF3vyrP/MCUp4Nrd3neMhKr3yCKNgOrZRvzjnGtRfGCEzo
	xi/BXfTt7TxeILPkNHxYDv0YaSWH5DAy+ZESzXiLUsM4XvUQuhfgDCPij/0mIBFAdcGg
	t0fXygeuGCJ5YZxVkFOvDRmgJmRkhpJqNcAvLH7FeGtKrSfVLX1JEVL5lsPJ2KyiXiGd
	EQvtW3Ap9fwRxFM9+PkpNrfjOSXFNLES2MM+qELPZTSqP/lat2XOW5Day9BAJraFotpx
	HmEmrDtB8dwcVAIZtqbeGKM0S/qsbFQy41nO+SwJuyr5O0p1hQXVbBtOcdOF2oKU4Qng
	wbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WyVWErJSHCBs8hAPMKozqApdgy6nFK3uhm3Sgi1PbCc=;
	b=ineePjEZdVAF8MwNJVXFpjYfHpLYpKGIotenygXhnDEXmCjp3yY5Bm2tfNRf8VfXTt
	eqTB37LkJYhp2snuZKm2ojPKOUdD+22ZenAt6CKiWgeAdflHxH5K6BWMXVG+4Ux7tF1Q
	HvpqO4RLjz8bcfMhYNzF9uuGuni/5qgYhR3EufOrY0JP9FG3O/2R2C4zaqipfrRZcQ6E
	vm3Oivyyutc8qQqr9gkdsmcmmPs0c2by4ynqkYiFYZRTz8fhUeINudH4b3Gy165+xpKA
	8wkQrFZzNqtmxvsNoZF4rG+JdVHy8/v9xFr0uj7XgF+VXLbBtyZR0AfCtt38oLoThfr8
	+pzA==
X-Gm-Message-State: AMCzsaWUM/LPcIKUh2OpGJBQe1r7ROefgGcxLzPUFSYcB1XUG+89JmqU
	aAEeDwnWfRwlTrF23cELpOGyRQ==
X-Google-Smtp-Source: AOwi7QATM5zSyJSztaiwfdIX8uxG0q5GDqP6/LhH6VyJp//xTofjD+WA7p83cI0EFxX2iM1//4UtBg==
X-Received: by 10.84.129.193 with SMTP id b59mr403224plb.121.1507251064231;
	Thu, 05 Oct 2017 17:51:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f76])
	by smtp.gmail.com with ESMTPSA id o128sm259308pga.5.2017.10.05.17.51.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 17:51:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Oct 2017 17:50:46 -0700
Message-Id: <9045558e883211b8abbe8b1d0f6e01070258d485.1507250774.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <cover.1507250774.git.raj.khem@gmail.com>
References: <cover.1507250774.git.raj.khem@gmail.com>
Subject: [PATCH 07/10] gcc: Backport fix for a segfault on riscv
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
X-List-Received-Date: Fri, 06 Oct 2017 00:51:03 -0000

seen during kernel compile

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-7.2.inc              |  1 +
 ...le-non-legitimate-address-in-riscv_legiti.patch | 50 ++++++++++++++++++++++
 2 files changed, 51 insertions(+)
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
index 0000000000..fe175abecd
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-7.2/0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch
@@ -0,0 +1,50 @@
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



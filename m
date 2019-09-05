Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 402137D279
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 01:30:09 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id b13so586459pfo.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 18:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OGFEp8heO7rSNq+LAnFVl1oYJkYgMXeSMtvnywhU/VU=;
	b=EgvtxWL1qlCEaNGS/cYIWst3PhEVyTNw85HVIPRi7PEoi40K7MEMpHtBcSLrcj2KgM
	+wCU3F4kkH76cXQiGDvr6A11/HPK2s2mrS1iivc0vFOpgi7JI1kt7oCA1bNDBJr7Au0G
	hyCNO0/cDc3kf0MYuGpqmOmoNHRL/hlC2ovetd+rEO8irQUKYKgIJwgELejdavEI6plK
	i3h3BSlHC6zCF1w6qtw4hvRfiVQ83z0+KgrAry9UoT2dJfF38LJ/BMK1yVnWKVnjjqQo
	FNRRR0V7MKAKmJVTG4HtAQ76cdS4hekVABkERY0RYeiFeLDMvOZJT1yxaOdMJrGkRLiG
	TmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OGFEp8heO7rSNq+LAnFVl1oYJkYgMXeSMtvnywhU/VU=;
	b=YYeQ8nmXoRvEbgiAqPOOyqhDUNW4fYuYNAnwBnZgxaDchaE3pGmlMPIkwfqqByGcnH
	WGU2T0SqkCV+iDdZ70FGlGv0czgXLyHbBMjUZx69ep2mvW5g0vKf3WAIhEGNRCDRyKPh
	PTFYgZE1IPhHkvcw1ZfAThFIvi1lTFcH/a23XrNV8WLcVwlc1C38u6yRzO+2bHS/Itmz
	FyKpjk6cjiy3no5s0k4P/HjJw+8GDZpcaokhejULqvAL0XDOzrvTlZvvub3kL+8gO2SW
	9hDsC45yTOKYWPSEqKgFIsSWVKpcn/AiSl2QRXRXUmtTbP6kVL/pAWE8DoDI0j2LGvtj
	HWQQ==
X-Gm-Message-State: APjAAAXv6K7iZOaqDoIufHJ3hNf7WxS7PGHRHnw++N5sfR1RHW6k/wGp
	nJYojxs2uk/+trbzyjQqH3GKKG6DC6s=
X-Google-Smtp-Source: APXvYqwaF8tH6hof+2do+bjpp0ED+KVcxdf3ONv3uab73oDqV1Pgur5MT8az049AkiBK4H3lA/NA8A==
X-Received: by 2002:a17:90a:148:: with SMTP id z8mr1131246pje.96.1567647009032;
	Wed, 04 Sep 2019 18:30:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id v10sm243070pjk.23.2019.09.04.18.30.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Sep 2019 18:30:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Sep 2019 18:29:58 -0700
Message-Id: <20190905012958.5888-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] gcc-9.2: Fix risc-v dynamic linker relocation
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
X-List-Received-Date: Thu, 05 Sep 2019 01:30:09 -0000
Content-Transfer-Encoding: 8bit

Accidentally dropped in 9.2 update

Reported-by: Ricardo Salveti <ricardo@foundries.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 23 ++++++++++++++-----
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-9.2/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index 21908bce9b..66fb24d4cd 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -1,7 +1,7 @@
-From a93743732b2125aebd9a6d65e999d7506b01d6b3 Mon Sep 17 00:00:00 2001
+From 72fc3975bcd720b2f8040fa87cd23d3db4c5975a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:24:50 +0400
-Subject: [PATCH 11/36] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
+Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
  relative to SYSTEMLIBS_DIR
 
 This patch defines GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
@@ -23,11 +23,12 @@ Upstream-Status: Inappropriate [OE configuration]
  gcc/config/i386/linux64.h    |  6 +++---
  gcc/config/linux.h           |  8 ++++----
  gcc/config/mips/linux.h      | 12 ++++++------
+ gcc/config/riscv/linux.h     |  2 +-
  gcc/config/rs6000/linux64.h  | 15 +++++----------
  gcc/config/sh/linux.h        |  2 +-
  gcc/config/sparc/linux.h     |  2 +-
  gcc/config/sparc/linux64.h   |  4 ++--
- 11 files changed, 28 insertions(+), 33 deletions(-)
+ 12 files changed, 29 insertions(+), 34 deletions(-)
 
 diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h
 index 824861befec..6afacce3292 100644
@@ -152,6 +153,19 @@ index 6f79ac9c01a..25de96f9561 100644
  
  #undef MUSL_DYNAMIC_LINKER32
  #define MUSL_DYNAMIC_LINKER32 \
+diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
+index 58dd18b89f3..112ba9cd764 100644
+--- a/gcc/config/riscv/linux.h
++++ b/gcc/config/riscv/linux.h
+@@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.  If not see
+     GNU_USER_TARGET_OS_CPP_BUILTINS();				\
+   } while (0)
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-riscv" XLEN_SPEC "-" ABI_SPEC ".so.1"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux-riscv" XLEN_SPEC "-" ABI_SPEC ".so.1"
+ 
+ #define MUSL_ABI_SUFFIX \
+   "%{mabi=ilp32:-sf}" \
 diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
 index 9946d3fed94..45a9a7cae59 100644
 --- a/gcc/config/rs6000/linux64.h
@@ -227,6 +241,3 @@ index 789d1df4bd5..b920c680fb1 100644
  
  #ifdef SPARC_BI_ARCH
  
--- 
-2.22.1
-
-- 
2.23.0



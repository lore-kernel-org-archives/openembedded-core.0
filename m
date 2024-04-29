Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 245D6C4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 12:53:48 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.20198.1714395220082792685
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Apr 2024 05:53:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0xOQkPWA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1e3c3aa8938so28254225ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 05:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714395219; x=1715000019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5yw+jolIGMVoZMGd4acPuGxwxiBHmeiR3Ox0BiS/bLE=;
        b=0xOQkPWAZochtTyLzDW+oPVrByAM7OzyV1Y5Q+hZrRdAQfL8ZWag3eo/2cUHU0qNnf
         KS4mfl+JIuVVOjk9b3GoLw+UfiWwJ31rSt1g8XDNNn3473nM2obiugT/9Ao01RzYlDN/
         JWDgKIEekAdsYtdX5v8ZJ5953ckOFwgE+bbgun6Y9UaypN5wbQM3mYd/L0RusM6wFkrY
         4BuwaAsb74RafjleiT5RAdL3oxENic9YT9rorDFSVJBS4hGxrZbhPmyZU0YNXOGqpUzp
         EBaNbJ/xafkFPVK5mJXP9WxIsnd23HYGK7yTQeWoJMNL+iPzIGT9b3e78mK6gr2Oa8hF
         OXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714395219; x=1715000019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5yw+jolIGMVoZMGd4acPuGxwxiBHmeiR3Ox0BiS/bLE=;
        b=wqFAQinavXlA//gC8u6I3gGvBoPmHxPr/Dp0TCS1yOIrWTDNwg3YYUJmkWYwI/7Haw
         I0IeLRhK0jo/lhJAEy/G63cNtqNPBaeclVK1FDMXd7xjEn9eCviCF3RF4uHccsmUGnHh
         H38uI7GoOh63nElqaGl1j4ye+g/D2SBlQfRWZeKNwWTAtd/NELBoL+3nzEZTEarm39tl
         TZoKFjUi//WziA7O8b1CSo7kBru0A59KgAvGvSefThJ2gD2OhZCFI60F3sETmyOIuLhJ
         vwnHSHMw4p2ibCzJlHSWf+fpKmCvpA4gEOo1SxQRp9KakPVGHEJVaNoxGG0nC0ZHhUXI
         MrDA==
X-Gm-Message-State: AOJu0Yxo0untgDboZbQuIkaiNF1e80Olh1X3YK55p657Jd5KEYAtAycI
	z3KxLNXLXfsp91n5p363ZdakxyBDOhqRSZqvRu5BVCEA/NDpomdc/vhUc6DfNZZ64xYvs/PUb6m
	VXMnoFA==
X-Google-Smtp-Source: AGHT+IHUPIPvEhqb7+NatEMFHS8sNOC5V1GZVcpwYc6EG0EBJdyn4eqgrur/+rm2vbiCXDTAyeJ3bA==
X-Received: by 2002:a17:902:b690:b0:1ea:f9b1:8b13 with SMTP id c16-20020a170902b69000b001eaf9b18b13mr8946280pls.31.1714395219342;
        Mon, 29 Apr 2024 05:53:39 -0700 (PDT)
Received: from xps13.. ([209.237.67.158])
        by smtp.gmail.com with ESMTPSA id h8-20020a170902704800b001e868e29fabsm20184399plt.251.2024.04.29.05.53.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 05:53:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/5] glibc: Update to latest on stable 2.35 branch
Date: Mon, 29 Apr 2024 05:53:24 -0700
Message-Id: <016387557c036efb700b01ab915d69a2e46a5740.1714394934.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714394934.git.steve@sakoman.com>
References: <cover.1714394934.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 12:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198741

From: Peter Marko <peter.marko@siemens.com>

Adresses CVE-2024-2961

Changes:
36280d1ce5 iconv: ISO-2022-CN-EXT: fix out-of-bound writes when writing escape sequence (CVE-2024-2961)
4a7de5e215 powerpc: Fix ld.so address determination for PCREL mode (bug 31640)
f4a45af368 AArch64: Check kernel version for SVE ifuncs
7f3c143381 aarch64: fix check for SVE support in assembler
9112cda4c6 aarch64: correct CFI in rawmemchr (bug 31113)
153012dda2 AArch64: Remove Falkor memcpy
90b03336d9 AArch64: Add memset_zva64
d166309459 AArch64: Cleanup emag memset
650300d233 AArch64: Cleanup ifuncs
5bfa9f4369 AArch64: Add support for MOPS memcpy/memmove/memset
c4e222334b Add HWCAP2_MOPS from Linux 6.5 to AArch64 bits/hwcap.h
b9e93c5ff7 AArch64: Improve SVE memcpy and memmove
115c2c7717 AArch64: Improve strrchr
06fad28274 AArch64: Optimize strnlen
3a1557efef AArch64: Optimize strlen
6f2ca6aab9 AArch64: Optimize strcpy
249fff42a8 AArch64: Improve strchrnul
1c1313dbdd AArch64: Optimize strchr
80ad6cd302 AArch64: Improve strlen_asimd
65c4bb41b6 AArch64: Optimize memrchr
23be6f897e AArch64: Optimize memchr
28e40b3909 aarch64: Use memcpy_simd as the default memcpy
c503e2206e aarch64: Cleanup memset ifunc
577bd1e049 AArch64: Fix typo in sve configure check (BZ# 29394)
ea25fe5599 aarch64: Optimize string functions with shrn instruction
2c4ae9faa5 AArch64: Sort makefile entries
2c92d94407 AArch64: Add SVE memcpy
d6d295a95b linux: Use rseq area unconditionally in sched_getcpu (bug 31479)
dda5faa65e Include sys/rseq.h in tst-rseq-disable.c
c9ee9cc8b8 nptl: Unconditionally use a 32-byte rseq area
3cd02612e8 make ‘struct pthread’ a complete type
a24adf3572 support: use 64-bit time_t (bug 30111)
d47c5e4db7 malloc: Use __get_nprocs on arena_get2 (BZ 30945)
1a3326df93 x86_64: Optimize ffsll function code size.
914af4fcca NEWS: Mention bug fixes for 29039/30745/30843
5d1fe26b49 x86-64: Fix the tcb field load for x32 [BZ #31185]
2d87262c1c x86-64: Fix the dtv field load for x32 [BZ #31184]
5f08ec08d0 elf: Fix TLS modid reuse generation assignment (BZ 29039)
01ea8d9dde Revert "elf: Move l_init_called_next to old place of l_text_end in link map"
0222f2392d Revert "elf: Always call destructors in reverse constructor order (bug 30785)"
6aa8380cf5 Revert "elf: Remove unused l_text_end field from struct link_map"

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.35.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index e0d47f283b..cd8c7ecf94 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "c84018a05aec80f5ee6f682db0da1130b0196aef"
+SRCREV_glibc ?= "36280d1ce5e245aabefb877fe4d3c6cff95dabfa"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 751427517f..74d7f753d8 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -24,7 +24,7 @@ CVE_CHECK_IGNORE += "CVE-2019-1010025"
 CVE_CHECK_IGNORE += "CVE-2023-4527"
 
 # To avoid these in cve-check reports since the recipe version did not change
-CVE_CHECK_IGNORE += "CVE-2023-0687 CVE-2023-4813 CVE-2023-4806 CVE-2023-4911 CVE-2023-5156"
+CVE_CHECK_IGNORE += "CVE-2023-0687 CVE-2023-4813 CVE-2023-4806 CVE-2023-4911 CVE-2023-5156 CVE-2024-2961"
 
 DEPENDS += "gperf-native bison-native"
 
-- 
2.34.1



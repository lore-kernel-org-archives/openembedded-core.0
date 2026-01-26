Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F10D13C34
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 15:24:07 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22084.1769441038023897743
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 07:23:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PZfNn/du;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8c6b16bd040so525040485a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 07:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769441037; x=1770045837; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpQ4yxNnGFISj2ddzHjxlie5zuRqjO+Vy2T/8ybuFcg=;
        b=PZfNn/duRXNJnfFZtK+T9Amzi3EvgcguAoUltiI+HugRXhLXVxXSB+bG35Zcp7OySO
         3xQSaBmYhpcRXdeQdT5RRsLOkopOSPF/Ih8WtT9ESggR5le7trYQ2+3godiVztL/zUVM
         7mRlYJOQLCA1zKEM3M5VLojDz+radP8Qe4pfioaixS6xppaucnknxzCpRjPJIDjPJ03M
         R5DYagFS8+ydGrSirk2RUbE+4OOWQA33xD96Eu/HN/kWAlJk6Bv0Uvs1lc3txYngVEB+
         wLZXshEr9JOWQsTGkdx11PL5J9Ug0SBcqArGeVpdTBMnnRyAq+OKDCsAcyAvoutCroON
         OaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769441037; x=1770045837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZpQ4yxNnGFISj2ddzHjxlie5zuRqjO+Vy2T/8ybuFcg=;
        b=nPZYDDXbXNZgeEqc2L85zefmD7ovZremnCvCQApewyDv9Ehg7ROsRt8NWDmvFcj/Ev
         XhljpQiHz/GT29AlNR3m7/34qH3vhJqJOvOgwNkFVag5ol4U+2A9eyQHcqas2a3BxrDu
         OdjHXU9YBvGQ0MgrfvzMM3bBoDekqO1awUubyi3uExvuVwkkJOy+B0aXto+Wj4a4DX3F
         GArfFo31ZelQsAIkTmwh2A5FmCDYvLsfaLmA/rPcmaNGnp1NahnoEayWhVc6amSteDX7
         MpLFfaVJhx4if7szXdIaIemdMbUggW6jh+Uqh2/6fhjSRdE3WA6pl+Zb7LWdKvN5xq8Z
         nKXg==
X-Gm-Message-State: AOJu0YyIfeqVkcj65wFjGBF3ux2jKBnDHmSXswWZFB8wMf7FlFOj74qA
	vGuDXPqB4yd2Fn8JmK1KGk4SQTeKgGmo9UYMSKrsO2gDrGWRUPa0HOZX
X-Gm-Gg: AZuq6aKB00VVmwFH0Dbepuz1un2S3l/RQWBeQuTvlHPgWdSCLK1AXQw/tOukQZWT/cR
	Ykx7CreMldd8PxSiSM8g1mF2bI8QOWGY3Ljxvhk9uGnD77DKb89XnxRXp7EKuZAm+zA/wFlKAGG
	OApVEVbw0Hp0xgaN0dImB4CXD883ZEfYCYDklkiZeykN4BdS2x52gBdTohjU/mtVC+eEW3XmgkE
	G5eP54XspwFkEOP4bTtAmGDGgP/7+kh328vY4rFhD8xIr2sV9P/CjHUhdZ9mJoRzckeJtHT/SLg
	N9qbQ66+en522vvF2TF4g1YlDgxsOvU8it1NziEcY6yaghxvv2Q84RsSjjJpUdOBWDRqlXKLSau
	pCqZun7Xx1eOc+CSjnO97wVZj9UeRys2IIFpvyDvQLtzkxG7Fh2zWYfs4wNWNKNoO24HQG8d5//
	9Oq6GDB2PsrglpVsV4vNDboJyTcVOlNm4RZZBJu/Lh25P8XfRrAfn6drKcVipO7MNeZZQVRPAeF
	rq9qGS6BhEMR9k=
X-Received: by 2002:a05:620a:269b:b0:8b2:e666:70d with SMTP id af79cd13be357-8c6f964323amr522936685a.43.1769441036762;
        Mon, 26 Jan 2026 07:23:56 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6e3870c48sm1044157185a.51.2026.01.26.07.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 07:23:55 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 01/07] linux-yocto/6.12: update to v6.12.65
Date: Mon, 26 Jan 2026 10:23:47 -0500
Message-ID: <20260126152353.2328046-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126152353.2328046-1-bruce.ashfield@gmail.com>
References: <20260126152353.2328046-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 15:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230012

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    39cb076c7dc7 Linux 6.12.65
    b00d41629d81 Revert "iommu/amd: Skip enabling command/event buffers for kdump"
    69f542a54578 pwm: stm32: Always program polarity
    828b59fdf8ef virtio_console: fix order of fields cols and rows
    1b9c118fe318 sched/fair: Proportional newidle balance
    c6ae271bc5fd sched/fair: Small cleanup to update_newidle_cost()
    52aa889c6f57 sched/fair: Small cleanup to sched_balance_newidle()
    4888e1dcc341 net: Remove RTNL dance for SIOCBRADDIF and SIOCBRDELIF.
    b03136582acb cpufreq: intel_pstate: Check IDA only before MSR_IA32_PERF_CTL writes
    c4d18e9540bf drm/amdgpu: Forward VMID reservation errors
    585dbb5cdbb8 net: phy: mediatek: fix nvmem cell reference leak in mt798x_phy_calibration
    7b240a8935d5 wifi: mac80211: Discard Beacon frames to non-broadcast address
    1c7c3a9314d8 mptcp: ensure context reset on disconnect()
    58a32633d124 mm: consider non-anon swap cache folios in folio_expected_ref_count()
    11f66b84fa7e mm: simplify folio_expected_ref_count()
    914769048818 mm/page_alloc: change all pageblocks migrate type on coalescing
    79f80a7a4784 mptcp: fallback earlier on simult connection

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 4113aaa21e..254a4b9c9f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "07aa4b788a9075e4aaf221026df896d245d40a3a"
-SRCREV_meta ?= "cc667785e15dd19fa8c38117d76ac1c7d60b5ec7"
+SRCREV_machine ?= "9f8581c660c7b402312572cbf9cbe03833ed20aa"
+SRCREV_meta ?= "12efb3470e9a439d7806984d360a3712350076d0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.64"
+LINUX_VERSION ?= "6.12.65"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 5a536f0d5a..6aa9dd7d56 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.64"
+LINUX_VERSION ?= "6.12.65"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9bd003fd4f7eb668ec3c1d7c5eae095d4b3764bd"
-SRCREV_meta ?= "cc667785e15dd19fa8c38117d76ac1c7d60b5ec7"
+SRCREV_machine ?= "5b6cf700d8a16b91937d61bd3bf0248bb1771644"
+SRCREV_meta ?= "12efb3470e9a439d7806984d360a3712350076d0"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index a5184e5812..62f7e8a9bd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "e7f4f79edddeab38061c2f88220becde45e3500c"
-SRCREV_machine:qemuarm64 ?= "9bd003fd4f7eb668ec3c1d7c5eae095d4b3764bd"
-SRCREV_machine:qemuloongarch64 ?= "9bd003fd4f7eb668ec3c1d7c5eae095d4b3764bd"
-SRCREV_machine:qemumips ?= "a6540c970a91fa542babab0633acbd69818686a3"
-SRCREV_machine:qemuppc ?= "9bd003fd4f7eb668ec3c1d7c5eae095d4b3764bd"
-SRCREV_machine:qemuriscv64 ?= "9bd003fd4f7eb668ec3c1d7c5eae095d4b3764bd"
-SRCREV_machine:qemuriscv32 ?= "9bd003fd4f7eb668ec3c1d7c5eae095d4b3764bd"
-SRCREV_machine:qemux86 ?= "9bd003fd4f7eb668ec3c1d7c5eae095d4b3764bd"
-SRCREV_machine:qemux86-64 ?= "9bd003fd4f7eb668ec3c1d7c5eae095d4b3764bd"
-SRCREV_machine:qemumips64 ?= "4b238545c28a667ddd67ff02cb8efb018a5df96c"
-SRCREV_machine ?= "9bd003fd4f7eb668ec3c1d7c5eae095d4b3764bd"
-SRCREV_meta ?= "cc667785e15dd19fa8c38117d76ac1c7d60b5ec7"
+SRCREV_machine:qemuarm ?= "b9671eac4ed537384b52ae04e7e1c728b631fb13"
+SRCREV_machine:qemuarm64 ?= "5b6cf700d8a16b91937d61bd3bf0248bb1771644"
+SRCREV_machine:qemuloongarch64 ?= "5b6cf700d8a16b91937d61bd3bf0248bb1771644"
+SRCREV_machine:qemumips ?= "bb006b07c2a942338e7f52070f8026791f30c5f0"
+SRCREV_machine:qemuppc ?= "5b6cf700d8a16b91937d61bd3bf0248bb1771644"
+SRCREV_machine:qemuriscv64 ?= "5b6cf700d8a16b91937d61bd3bf0248bb1771644"
+SRCREV_machine:qemuriscv32 ?= "5b6cf700d8a16b91937d61bd3bf0248bb1771644"
+SRCREV_machine:qemux86 ?= "5b6cf700d8a16b91937d61bd3bf0248bb1771644"
+SRCREV_machine:qemux86-64 ?= "5b6cf700d8a16b91937d61bd3bf0248bb1771644"
+SRCREV_machine:qemumips64 ?= "d9af48f273a9d87a61a46c93d7642d9e72947514"
+SRCREV_machine ?= "5b6cf700d8a16b91937d61bd3bf0248bb1771644"
+SRCREV_meta ?= "12efb3470e9a439d7806984d360a3712350076d0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "1a4a7249e794de9e022baabe6387d9c0f831b0be"
+SRCREV_machine:class-devupstream ?= "39cb076c7dc7e44e3cab5c82ffda16a550ed8436"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.64"
+LINUX_VERSION ?= "6.12.65"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0



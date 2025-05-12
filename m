Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFD4C54753
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:13 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.45916.1747040638854317555
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kMGjl3SB;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040643; x=1778576643;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WNea1bFrxWzEc7GDr5a7XIBaQSyGKaLBu05XQdI2TsM=;
  b=kMGjl3SBcO2p50rKLQ+6aznklywOiO9e1oVcGry9hWtgRbaIfexC32yp
   3mdy3/hx/CGNgEVKQbbtCb9wvxH69LdY84kInTb8Ca9l6t06POIdALKo7
   X3wAei1MSjG1UjPx5m59PCPSfmb7dn5Yea1P2LyE0a3QvZ2Da9uzb/1GN
   IAo5/LrlEPyCKGUGVJ3QjTf4nUul9S4L6cD1QG13E9mmsf5pCF80+ymY0
   9XDJTB+KbzRfMWUd6zgeYr+hlt90LYQDhwohrujOX4H/loE51Bfks07fW
   Zd6vmMytjGZ/0sH6L9lvSsM78muwK9AoJBnxunFhQ3QFaT6W2+Zj75lo8
   A==;
X-CSE-ConnectionGUID: nl/b2uztStmFv+fHxQVoEg==
X-CSE-MsgGUID: FcxYZKW+QGCL+Cu+aOOrpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="202056484"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="202056484"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:01 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D98AD5054
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C72B1D5040
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:58 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 87ADC1A009A;
	Mon, 12 May 2025 17:03:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 28/56] liburcu: upgrade 0.15.1 -> 0.15.2
Date: Mon, 12 May 2025 17:03:11 +0800
Message-Id: <1747040619-7566-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216322

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 * fix: __atomic_always_lock_free() not a constant expression on g++ < 5.1
 * fix: urcu assert fallback for pre-C11 builds
 * doc: update uatomic-api for static assert
 * Add uatomic size static assert for 's390'
 * Add uatomic size static assert for 'sparc64'
 * Add uatomic size static assert for 'ppc'
 * Add uatomic size static assert for 'x86'
 * Add uatomic size static assert for 'generic'
 * Add uatomic size static assert
 * Use UATOMIC_HAS_ATOMIC_INT/LLONG in generic implementation
 * Add UATOMIC_HAS_ATOMIC_INT/LLONG for x86
 * Add UATOMIC_HAS_ATOMIC_INT/LLONG for tile
 * Add UATOMIC_HAS_ATOMIC_INT/LLONG for sparc64
 * Add UATOMIC_HAS_ATOMIC_INT/LLONG for s390
 * Add UATOMIC_HAS_ATOMIC_INT/LLONG for riscv
 * Add UATOMIC_HAS_ATOMIC_INT/LLONG for ppc
 * Add UATOMIC_HAS_ATOMIC_INT/LLONG for nios2
 * Add UATOMIC_HAS_ATOMIC_INT/LLONG for mips
 * Add UATOMIC_HAS_ATOMIC_INT/LLONG for m68k
 * Add UATOMIC_HAS_ATOMIC_INT/LLONG for loongarch
 * Add UATOMIC_HAS_ATOMIC_INT/LLONG for ia64
 * Add UATOMIC_HAS_ATOMIC_INT/LLONG for hppa
 * Add UATOMIC_HAS_ATOMIC_INT/LLONG for 'gcc' arch
 * Add UATOMIC_HAS_ATOMIC_INT/LLONG for arm
 * Add UATOMIC_HAS_ATOMIC_INT/LLONG for alpha
 * Add UATOMIC_HAS_ATOMIC_INT/LLONG for aarch64
 * Add UATOMIC_HAS_ATOMIC_INT/LLONG for atomic builtins
 * Add builtin atomics size static asserts
 * cleanup: use URCU_GCC_VERSION from compiler.h
 * fix: atomic builtins defines for type support
 * Move back CMM_LOAD/STORE_SHARED to volatile access
 * Add cmm_annotate_mem_acquire() to URCU_DEREFERENCE_USE_VOLATILE rcu_dereference
 * Use uatomic_load CMM_RELAXED in URCU_DEREFERENCE_USE_VOLATILE
 * Fix: Re-introduce URCU_DEREFERENCE_USE_VOLATILE read barrier depends for alpha
 * Tree-wide: Rename to uatomic_load/uatomic_store
 * src: Use __*__ for attribute names
 * API: Use __*__ for attribute names
 * Fix Changelog 0.15.1 date

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../liburcu/{liburcu_0.15.1.bb => liburcu_0.15.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/liburcu/{liburcu_0.15.1.bb => liburcu_0.15.2.bb} (91%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.15.1.bb b/meta/recipes-support/liburcu/liburcu_0.15.2.bb
similarity index 91%
rename from meta/recipes-support/liburcu/liburcu_0.15.1.bb
rename to meta/recipes-support/liburcu/liburcu_0.15.2.bb
index 811e59f853..93d6a6551f 100644
--- a/meta/recipes-support/liburcu/liburcu_0.15.1.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.15.2.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c2a92498b6e88e276f986877995425b8 \
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "98d66cc12f2c5881879b976f0c55d10d311401513be254e3bd28cf3811fb50c8"
+SRC_URI[sha256sum] = "59f36f2b8bda1b7620a7eced2634f26c549444818a8313025a3bb09c0766a61d"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 inherit autotools multilib_header
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE89CD13CF
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 08:33:28 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.18515.1725352398195464899
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 01:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fL5csa+u;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725352398; x=1756888398;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=6BMVD6KEZhhjePgwuWGDsInp3CJ1BQ55AEU7gVpxS2M=;
  b=fL5csa+upSr6TXXZRgshQdDWmOJCvjq/L9KccJ5jn33KvtXDF4QZYKMr
   7cPGIsJ65a6pDTB915k84cGUt3/d1YsTpLxTRRgkiI51NZQuFZ1l06L5R
   BS6q6YTEQDgVPDVY3Czx7LKUi2NgUZeq1gOZpg63tQuJplYk/O750zWdo
   YZ/tc3rjw8nnvF/JX2YxUavEj/oPHDDX50LS8dlSfZkABGLoPs/sUrfJR
   bkF7qzA4fRcezzHrj7/N7/p37IIGKtlE1i6O4oTG/CmFEAHR0j/qtZqFJ
   SY8K2QBmZsJLtKy18D56KNrmgsHV46vfjxANL268BC7n37ok8IJ/dLvRB
   g==;
X-CSE-ConnectionGUID: mby5MlYzSSC6SoiyQnKyQQ==
X-CSE-MsgGUID: gC8ve+HgQKCsuz6iJWNHMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="172545767"
X-IronPort-AV: E=Sophos;i="6.10,198,1719846000"; 
   d="scan'208";a="172545767"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 17:33:16 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A97AFC68E1
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:13 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id ED01BD9683
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 621FE6C811
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:12 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 05C051A000C;
	Tue,  3 Sep 2024 16:33:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/22] liburcu: upgrade 0.14.0 -> 0.14.1
Date: Tue,  3 Sep 2024 16:32:46 +0800
Message-Id: <1725352379-20334-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
References: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28638.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28638.006
X-TMASE-Result: 10-3.475300-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvOA22c3m1Og4rq
	nYTxkVFKtqohk+uIk6daaekkeORbZeDbMnj0ZXkLqhcdnP91eXExVUWGXs3C86LYTuY3PoiR0LK
	oCp3XFH6zQ+90QhIMZj/xv+Z7brYhWrN4/58ppmIwYApm54/SZj4H4hoqLeJJWnq/tYmiZBDRAJ
	wLsqJFduArY2JkKW9pBdRHP6FCEZVaQiLka9EcSk7nLUqYrlslNmVjpriVEtlgDeovr2tertKfQ
	2mUc6DdCjUhgJ4nmoHrixWWWJYrHx8TzIzimOwPFnjKVTYbDMDEQdG7H66TyHEqm8QYBtMOufK3
	pNORJ3I3BkaMk2zoTz9IS8HyC2SBK7f6W9wpsDrizm6FQDDEOhYVpHNE++n5x8rCvVZE//KZf/Y
	tePN5eko3ajQ/RSxUgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 08:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204137

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fix: missing typename in URCU_FORCE_CAST
* Allow building with GCC >= 13.3 on RISC-V
* pointer.h: Fix the rcu_cmpxchg_pointer documentation
* Adjust shell script to allow Bash in other locations
* fix: handle EINTR correctly in get_cpu_mask_from_sysfs
* Relicense src/compat-smp.h to MIT
* ppc.h: use mftb on ppc
* Fix: allow clang to build liburcu on RISC-V
* Fix -Walloc-size
* urcu/uatomic/riscv: Mark RISC-V as broken
* Fix: urcu-bp: misaligned reader accesses
* LoongArch: Document that byte and short atomics are implemented with LL/SC
* Add LoongArch support
* tests/regression/rcutorture: Add wait state
* urcu-wait: Initialize node in URCU_WAIT_NODE_INIT
* Fix: urcu-wait: add missing futex.h include
* Adjust shell scripts to allow Bash in other locations
* Add support for OpenBSD
* Revert "compiler.h: Introduce caa_unqual_scalar_typeof"
* rculfhash: Use caa_container_of_check_null in cds_lfht_entry
* compiler.h: Introduce caa_container_of_check_null
* compiler.h: Introduce caa_unqual_scalar_typeof
* Avoid calling caa_container_of on NULL pointer in cds_lfht macros
* Fix: revise urcu_read_lock_update() comment
* Fix: uatomic powerpc comment about lwsync
* fix: aarch64: allow RHEL7 gcc 4.8.5-11
* fix: warning 'noreturn' function does return on ppc
* Fix: use __noreturn__ for C11-compatibility

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../liburcu/{liburcu_0.14.0.bb => liburcu_0.14.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/liburcu/{liburcu_0.14.0.bb => liburcu_0.14.1.bb} (91%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.14.0.bb b/meta/recipes-support/liburcu/liburcu_0.14.1.bb
similarity index 91%
rename from meta/recipes-support/liburcu/liburcu_0.14.0.bb
rename to meta/recipes-support/liburcu/liburcu_0.14.1.bb
index f03c990632..3b083b2514 100644
--- a/meta/recipes-support/liburcu/liburcu_0.14.0.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.14.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e548d28737289d75a8f1e01ba2fd7825 \
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "ca43bf261d4d392cff20dfae440836603bf009fce24fdc9b2697d837a2239d4f"
+SRC_URI[sha256sum] = "231acb13dc6ec023e836a0f0666f6aab47dc621ecb1d2cd9d9c22f922678abc0"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 inherit autotools multilib_header
-- 
2.34.1



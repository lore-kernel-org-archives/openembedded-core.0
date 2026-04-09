Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F744E98FDA
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 09:29:59 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.128345.1775726990638299730
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 02:29:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=Wis7fxJF;
 spf=pass (domain: ericsson.com, ip: 52.101.65.26, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEtSSq7Se2DoJsmRPVlcB0PHlAZuEhZDK7inNQiuWnZPajKVsEiU+QVrd+bTXy5r/+eU6P2LhBp4NBLId4eYLdILPye7MvHuUn3DxSKe5bh3WvPgqlu4IqolPDKVkMEj/RBIgxEU9+GMKftOxoNRTJ6qOUaCFHe9NBoiPGUTflw0IYsJkjHH1kO3rJ+W8fJb+7Uc7BTltq2bWVcWxXeAfC/QjJEoOD52c9nPw63b5yz12P4rKd1TeT60TBoiVu2HxdgJ3OK02TDIbKQatXYnknqf+CYvMQ+gsaPHDfQYpaOezWDwPzrLQ7AsEqGZIBfNuQ+BFOY0ZPbGktS9yLwTPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7Ad2081/g1UO3PnoH7AqXJsFYch/H2/mSIT75zYEhY=;
 b=gXtpHtXbiWAcVj4ebE6ekljnSV1Shi3xLqSdbUhUhBYS4reKwwoCHawM/I/Z974VPrkYk/BDNJrrbYEWdMSzDqhxR2gV65KOhJGyQI9plkCvXmIe3djeGbQEXsHU3wcmYxtWaDQO/zL7BPLVNBCXjg6UEdjvKeg+6dqTPbJbyND4PKGvvJKE9++xG8WSYRb9REz8Lu2WYYHaocxpgwvV0avVGxrz8Rubd01tC9Y1f79gTsQ8FU49yJh8unMDSnAK0rzvaU1cS7J3Hb7VZqhVF1LXYP56LdR4Z4hAp7MV3rMJd9V0s1rrK8ND0psBLuN3NT0L1xctfbSymMoP81EkUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7Ad2081/g1UO3PnoH7AqXJsFYch/H2/mSIT75zYEhY=;
 b=Wis7fxJFlmV3vaSE6wsYOeGA8kqYnPQ9LrEhP6Dj9nfBl6dFrIgzB5/tBEb76eCTKGgPzJUa1SKBaYba46t9t5LAN2PVip0vdqG+7pA4uzFOduV/tQIR7TVJ5rFfHFaa2bq7Y245noeXAZLyigLyHaRI7v9wK8y65gBmxB291Bpl85PYoMB6eMAt5dTs91Fd4vTYHUBX77gCi/U7GtDg/AjNxGkInhZjUcQzwpRZzu2/pRSYSl/DlkuFlZFFn9W/e/n2IineZlLCOB8A7JM1/BM6qluwDpeTTWaxWkv+amVaPdppZNXsYQsIclUt5Myb3hoX5LRZmK4+CY0hRhbMIw==
Received: from DU7P250CA0003.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::30)
 by VI1PR07MB9681.eurprd07.prod.outlook.com (2603:10a6:800:1d2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 09:29:42 +0000
Received: from DB1PEPF000509F8.eurprd02.prod.outlook.com
 (2603:10a6:10:54f:cafe::e2) by DU7P250CA0003.outlook.office365.com
 (2603:10a6:10:54f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Thu,
 9 Apr 2026 09:29:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF000509F8.mail.protection.outlook.com (10.167.242.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 09:29:42 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 9 Apr 2026 11:29:41 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 134C1402066A;
	Thu,  9 Apr 2026 11:29:41 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id E3FDE700DBB4; Thu,  9 Apr 2026 11:29:40 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [scarthgap][PATCH 6/9] lttng-ust: upgrade 2.13.8 -> 2.13.10
Date: Thu, 9 Apr 2026 11:29:33 +0200
Message-ID: <20260409092936.1740143-7-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409092936.1740143-1-daniel.turull@ericsson.com>
References: <20260409092936.1740143-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F8:EE_|VI1PR07MB9681:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fad96c5-7b0e-4a4c-b373-08de961a8795
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	kdi+lB4Xm7O55XhtxURA4EigGPX+ArUWhR9fSuqImxFBRRvtxi1ykU1zdyYV/sLOOVnC279zedztjI/pFKrmH6/tPHF1zLzoRhTxyw9UwHK80XTGfn1UtIcr8OhUir4qDMMphd+4rT3XXuDgHuaUqYcqHrTwNQ99T6bOencTrNURxbTZj3deYgnjz8FRFA1Yln9YygOcwzKHwUWlji3b0cz3iol1e9RLvJAi6FTmMKeXvoTNTsCLACGJF2o4BXxsuXrBGm29iT0FG2D0hWuX+pN4TVDkHl92rGVRAX7uKQcrVbBMuyhYB4416LODNwlDlV7gVghweMqHBT+/2FIABjyX67Ccw9DnUhOzTu1FZw3bGkGxjZOfH7y4is0TNPxSafiMjbab3eOf10irseF+eM9KesCqT83KBVKqg6N2MILbasgCiP8s8R3QKYm+1VFemcYeQNTkIsf2KliWVddsmM+GGK35xTjTgWDn8Hh5Vz/ZYtyHzp21wlAQGHx9w8exKUPwrmPRoH3wKiaizNiXGtEhvSg6j9NTxQkMIyGWZ92MAAUx6GukUoNj4SY8OVIcnP7k0T/Be4XydjdYRuD6CBjArE5gnpsDfpqsiCiw+THY8tsRVQL3yW79654wJRWbWkiGdwQkFxCegX95gLerngvL0GBjODhiq1VPgp4Mz/oK+u18jwNZQdNinrSfVgbwEto7EG3VTXpZ+NG3UDp9rnhtXL9OhLRDEPG0xWXP3Ew=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	bNY5bGhIBuVzEDFrAHYEFbUx9NXXlGyKKG5SQw69HwFKq7b9pwTtc1JfQ8bVFtAEDXrRyaD5CO5Xj0oQ/XEZ5IYSiLmQlOGvJufBNc2JQBTZ9ilCIc3DyBua8CbGq4/QG+B1/aDw0nCQLr9P3Nx9MHniHKHv15XNb6DmLoCKCV3vvUoywxW0Uk3VGY7d26FSncgf7RkFEP4vIjGJ4unpNOVvJG+x9i46c38+8W++WCkE8lTjRb6SVzO7G2IC9bhupAxQOap7U0+prWy/ILI18dC2IjebTrUhgkwFkJWnX6KOCxV/y7IP3Ri7STI9P/4req5E7KdDYzpLOdqGgDP8sFZjEM7m7olwfdkZfYPCrWRoJoHnIFTDsy26ulhDzg95+TkZxY6ZFTrDkzN4AzaxF/wCaA3vTuoBQpSyQjCxzG8wHZBYmk9aRZs8rH8VRhj2
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 09:29:42.0389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fad96c5-7b0e-4a4c-b373-08de961a8795
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB9681
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 09:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234906

From: Daniel Turull <daniel.turull@ericsson.com>

Changelog for lttng-ust: 2.13.8 -> 2.13.10
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

2026-02-13 lttng-ust 2.13.10
	* Fix: ustctl: sigbus handling: statement with no effect

2025-04-14 (National Gardening Day) lttng-ust 2.13.9
	* Fix: Use UATOMIC_HAS_ATOMIC_{BYTE,SHORT} for counter atomics
	* Fix: lttng-ust-tp regex warnings
	* lttng-ust-java: Load lttng-ust-context-jni before other JNI libraries
	* doc/examples: set minimal CMake version to 3.5.0
	* Fix: Update get_mempolicy check to handle EPERM
	* Fix: Correct numa_available return code checks
	* Fix: test_benchmark: do not match CPU(s) scaling MHz:
	* Tests: Fix abi conflict test when building with clang
	* Fix: Build examples when rpath is stripped from in-build-tree libs
	* ust-fd: Add close_range declaration
	* docs: Correct GitHub URLs in lttng-ust.3
	* fix: handle EINTR correctly in get_cpu_mask_from_sysfs

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 ...es-when-rpath-is-stripped-from-in-bu.patch | 161 ------------------
 ...-common-link-with-liburcu-explicitly.patch |   3 +-
 ...Makefile.am-Add-install-lib-to-setup.patch |   3 +-
 ...tng-ust_2.13.8.bb =3D> lttng-ust_2.13.10.bb} |   3 +-
 4 files changed, 3 insertions(+), 167 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust/0001-Fix-Build-exam=
ples-when-rpath-is-stripped-from-in-bu.patch
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.8.bb =3D> lttng-ust_2.13.=
10.bb} (92%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-Fix-Build-examples-wh=
en-rpath-is-stripped-from-in-bu.patch b/meta/recipes-kernel/lttng/lttng-ust=
/0001-Fix-Build-examples-when-rpath-is-stripped-from-in-bu.patch
deleted file mode 100644
index 6da675fa31..0000000000
--- a/meta/recipes-kernel/lttng/lttng-ust/0001-Fix-Build-examples-when-rpat=
h-is-stripped-from-in-bu.patch
+++ /dev/null
@@ -1,161 +0,0 @@
-From 5d10459b6b5182fcbc98240d9dace026c87a5037 Mon Sep 17 00:00:00 2001
-From: Kienan Stewart <kstewart@efficios.com>
-Date: Mon, 5 Aug 2024 15:41:34 -0400
-Subject: [PATCH] Fix: Build examples when rpath is stripped from in-build-=
tree
- libs
-
-Observed issue
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Certain tool chains[1, 2] emit warnings or errors when building the
-example applications.
-
-```
-make[3]: Entering directory
-'/home/xxx/src/efficios/lttng/master/src/lttng-ust/doc/examples/easy-ust'
-CC       sample.o
-CC       tp.o
-CCLD     sample
-
-/usr/bin/ld: warning: liblttng-ust-common.so.1, needed by ../../../src/lib=
/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-lin=
k)
-/usr/bin/ld: warning: liblttng-ust-tracepoint.so.1, needed by ../../../src=
/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath=
-link)
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined r=
eference to `lttng_ust_add_fd_to_tracker'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined r=
eference to `lttng_ust_urcu_after_fork_child'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined r=
eference to `lttng_ust_common_ctor'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined r=
eference to `lttng_ust_tp_init'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined r=
eference to `lttng_ust_tp_probe_register_queue_release'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined r=
eference to `lttng_ust_cancelstate_disable_pop'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined r=
eference to `lttng_ust_urcu_synchronize_rcu'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined r=
eference to `lttng_ust_urcu_register_thread'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined r=
eference to `lttng_ust_tp_probe_prune_release_queue'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined r=
eference to `lttng_ust_cancelstate_disable_push'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined r=
eference to `lttng_ust_urcu_before_fork'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined r=
eference to `lttng_ust_lock_fd_tracker'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined r=
eference to `lttng_ust_trace_clock'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined r=
eference to `lttng_ust_urcu_has_sys_membarrier'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined r=
eference to `lttng_ust_unlock_fd_tracker'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined r=
eference to `lttng_ust_tp_exit'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined r=
eference to `lttng_ust_get_cpu_sym'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined r=
eference to `lttng_ust_common_alloc_tls'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined r=
eference to `lttng_ust_urcu_after_fork_parent'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined r=
eference to `lttng_ust_delete_fd_from_tracker'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined r=
eference to `lttng_ust_urcu_register'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined r=
eference to `lttng_ust_urcu_reader'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined r=
eference to `lttng_ust_urcu_gp'
-/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined r=
eference to `lttng_ust_tp_probe_unregister_queue_release'
-collect2: error: ld returned 1 exit status
-```
-
-=3D=3D=3D Reproducer =3D=3D=3D
-
-The easiest way to consistently reproduce this type of build failure
-is to perform the following steps:
-
-```
-./configure
-make -j$(nproc)
-find . -iname '*.so' -exec chrpath -d {} \;
-make -C doc/examples clean
-make -j$(nproc)
-```
-
-As the examples are not built with libtool, finding the libraries to
-link against depends on the shared objects having an rpath.
-
-E.g.
-
-```
-$ chrpath src/lib/lttng-ust/.libs/liblttng-ust.so.1.0.0
-src/lib/lttng-ust/.libs/liblttng-ust.so.1.0.0: RUNPATH=3D/home/xxx/src/eff=
icios/lttng/master/src/lttng-ust/src/lib/lttng-ust-common/.libs:/home/xxx/s=
rc/efficios/lttng/master/src/lttng-ust/src/lib/lttng-ust-tracepoint/.libs:/=
home/xxx/src/efficios/lttng/master/usr/lib
-```
-
-The current examples build with `-Wl,-rpath`  for `liblttng-ust`, but
-not the dependencies of `liblttng-ust` (which would normally be found
-via it's own rpath). If the `rpath` is stripped from
-`liblttng-ust.so`, or if the tool chain ignores `rpath` explicitly,
-then the build with fail.
-
-In the case of a yocto build environment as in GitHub#61[1], the
-following commands reproduced the warnings and the errors seen in the
-above test case.
-
-```
-git clone git://git.yoctoproject.org/poky && cd poky/
-. oe-init-build-env
-echo "PACKAGECONFIG:pn-lttng-ust =3D 'examples'" >>conf/local.conf
-bitbake lttng-ust
-```
-
-=3D=3D=3D Solution =3D=3D=3D
-
-Explicitly add library search paths and set linker rpath-link are set
-for both the standard and cmake examples. Similar changes were
-proposed for each of those parts respectively in GitHub#61[1] and GitHub#6=
3[2].
-
-=3D=3D=3D Known issues =3D=3D=3D
-
-While the `rpath-link` for the second order library dependencies will
-allow the builds to complete, the examples will not work at
-runtime even when using `rpath`. From `man ld.so`, the rpaths in an
-executable or shared object are only considered for direct
-dependencies. Therefore, without setting `LD_LIBRARY_PATH` or
-installing the libraries test applications will fail as follows:
-
-```
-$ ./doc/examples/easy-ust/sample
-./doc/examples/easy-ust/sample: error while loading shared libraries: libl=
ttng-ust-common.so.1: cannot open shared object file: No such file or direc=
tory
-```
-
-References
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-[1]: https://github.com/lttng/lttng-ust/pull/61
-[2]: https://github.com/lttng/lttng-ust/pull/63
-
-Change-Id: I273ccddd0d0b7a1b57b9e09ddf48d8b5b41e6f8e
-Signed-off-by: Kienan Stewart <kstewart@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-
-Upstream-Status: Backport [https://github.com/lttng/lttng-ust/commit/5d104=
59b6b5182fcbc98240d9dace026c87a5037]
-Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
-
----
- doc/examples/Makefile.am | 13 ++++++++++---
- 1 file changed, 10 insertions(+), 3 deletions(-)
-
-diff --git a/doc/examples/Makefile.am b/doc/examples/Makefile.am
-index aebf63bd..79766ec0 100644
---- a/doc/examples/Makefile.am
-+++ b/doc/examples/Makefile.am
-@@ -169,7 +169,10 @@ all-local:
- 				CFLAGS=3D'$(CFLAGS)' \
- 				AM_CFLAGS=3D'$(AM_CFLAGS)' \
- 				LDFLAGS=3D"$(LDFLAGS)" \
--				AM_LDFLAGS=3D'$(AM_LDFLAGS) -L../../../src/lib/lttng-ust/.libs -Wl,-r=
path=3D"$(PWD)/../../src/lib/lttng-ust/.libs/" -Wl,-rpath-link=3D"$(PWD)/..=
/../src/lib/lttng-ust/.libs/"' \
-+				AM_LDFLAGS=3D'$(AM_LDFLAGS) -L../../../src/lib/lttng-ust/.libs -L../.=
./../src/lib/lttng-ust-common/.libs -L../../../src/lib/lttng-ust-tracepoint=
/.libs \
-+				-Wl,-rpath=3D"$(abs_top_builddir)/src/lib/lttng-ust/.libs/" \
-+				-Wl,-rpath-link=3D"$(abs_top_builddir)/src/lib/lttng-ust-common/.libs=
/" \
-+				-Wl,-rpath-link=3D"$(abs_top_builddir)/src/lib/lttng-ust-tracepoint/.=
libs/"' \
- 				LTTNG_GEN_TP_PATH=3D"$$rel_src_subdir$(top_srcdir)/tools/" \
- 				AM_V_P=3D"$(AM_V_P)" \
- 				AM_V_at=3D"$(AM_V_at)" \
-@@ -222,10 +225,14 @@ all-local:
- 					CXX=3D"$(CXX)" \
- 					$(CMAKE) \
- 					-DCMAKE_INCLUDE_PATH=3D"$(abs_top_srcdir)/include;$(abs_top_builddir=
)/include" \
--					-DCMAKE_LIBRARY_PATH=3D"$(abs_top_builddir)/src/lib/lttng-ust/.libs"=
 \
-+					-DCMAKE_LIBRARY_PATH=3D"$(abs_top_builddir)/src/lib/lttng-ust/.libs;=
$(abs_top_builddir)/src/lib/lttng-ust-common/.libs;$(abs_top_builddir)/src/=
lib/lttng-ust-tracepoint/.libs" \
- 					-DCMAKE_C_FLAGS=3D"$(AM_CFLAGS) $(CPPFLAGS) $(CFLAGS)" \
- 					-DCMAKE_CXX_FLAGS=3D"$(AM_CXXFLAGS) $(CXXFLAGS) $(CPPFLAGS)" \
--					-DCMAKE_EXE_LINKER_FLAGS=3D"$(AM_LDFLAGS) $(LDFLAGS)" \
-+					-DCMAKE_EXE_LINKER_FLAGS=3D"$(AM_LDFLAGS) $(LDFLAGS) \
-+					-L../../../src/lib/lttng-ust/.libs -L../../../src/lib/lttng-ust-comm=
on/.libs -L../../../src/lib/lttng-ust-tracepoint/.libs \
-+					-Wl,-rpath=3D$(abs_top_builddir)/src/lib/lttng-ust/.libs/ \
-+					-Wl,-rpath-link=3D$(abs_top_builddir)/src/lib/lttng-ust-common/.libs=
/ \
-+					-Wl,-rpath-link=3D$(abs_top_builddir)/src/lib/lttng-ust-tracepoint/.=
libs/" \
- 					.. && \
- 				$(MAKE) \
- 			) || exit 1; \
---=20
-2.43.0
-
diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link=
-with-liburcu-explicitly.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-l=
ttng-ust-common-link-with-liburcu-explicitly.patch
index e85dbdb439..2d1c6135a5 100644
--- a/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-l=
iburcu-explicitly.patch
+++ b/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-l=
iburcu-explicitly.patch
@@ -1,4 +1,4 @@
-From 27402453f25fbdb5a9fb1a1b88d1c4d9852187d2 Mon Sep 17 00:00:00 2001
+From 0755d1c25e1fd1d8f7baa863ed6a9b931c2d0095 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 5 Sep 2021 10:44:19 +0200
 Subject: [PATCH] lttng-ust-common: link with liburcu explicitly
@@ -7,7 +7,6 @@ Otherwise linking errors are seen on x86-32.
=20
 Upstream-Status: Submitted [by email to lttng-dev, Francis, Jonathan]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
 ---
  src/lib/lttng-ust-common/Makefile.am | 1 +
  1 file changed, 1 insertion(+)
diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makef=
ile.am-Add-install-lib-to-setup.patch b/meta/recipes-kernel/lttng/lttng-ust=
/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
index 7c49583e0d..f9b1d198a1 100644
--- a/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-=
Add-install-lib-to-setup.patch
+++ b/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-=
Add-install-lib-to-setup.patch
@@ -1,4 +1,4 @@
-From f65efd963e52de51d35e2e03fb773f33dd64f565 Mon Sep 17 00:00:00 2001
+From 74bb718d64a120af79bf1068d1c6ad9e568fc58f Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 20 Feb 2024 12:19:06 +0000
 Subject: [PATCH] python-lttngust/Makefile.am: Add --install-lib to setup.p=
y
@@ -9,7 +9,6 @@ building.
 Upstream-Status: Submitted [https://github.com/lttng/lttng-ust/pull/59]
=20
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
 ---
  src/python-lttngust/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb b/meta/recipes-k=
ernel/lttng/lttng-ust_2.13.10.bb
similarity index 92%
rename from meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.13.10.bb
index bf2524bdc0..56f3d93724 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.13.10.bb
@@ -31,10 +31,9 @@ PE =3D "2"
 SRC_URI =3D "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-python-lttngust-Makefile.am-Add-install-lib-to-setu=
p.patch \
            file://0001-lttng-ust-common-link-with-liburcu-explicitly.patch=
 \
-           file://0001-Fix-Build-examples-when-rpath-is-stripped-from-in-b=
u.patch \
            "
=20
-SRC_URI[sha256sum] =3D "d4ef98dab9a37ad4f524ccafdfd50af4f266039b528dd5afab=
ce78e49024d937"
+SRC_URI[sha256sum] =3D "c997d4efa02ed18b4976a0a280ff1c7fb2fc9d6ef2f86a0f5c=
cb44294a9d6045"
=20
 CVE_PRODUCT =3D "ust"
=20


Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171D7E9DE7B
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 09:29:49 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.128342.1775726987000967329
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 02:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=oyi+hIdg;
 spf=pass (domain: ericsson.com, ip: 40.107.162.48, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uppa8AMzgLTRKGozkb+eB8SauDm8vn/y0XJsJlBPVNCBgYCf1gjmkCsaKX69lElr3aBGJcp2svCh4AE7Z3PApz6zQzGQAgQLYM1bSYFRnZkbowP20W91UQYnydJv1AXgym3Qjs9uChaS0NzA3Qa6u6FWmN4jZ52U9BGWrEBvyFHwsb3sNuoFZESg/2i0QD4QHlF5laogmA/mrcqMjL5AfHrq8lEpSNLuSIp1AX5F3gThhhfN/y1FrkkbhtVkp8F3Aoo0bhA93/g88BC/jmLIG9LC9HPW8wBo1SSyf8B4P0H3Ww8hO7GdK0eZPRZ3lk3cOkEbNKvI0jnlV4bNhW6VyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3KYC2xQbTv5swDmTzOimhi+adJeW97fjzc4qGBfz0A=;
 b=dU4A64t1BlBSe2ho0+EYdoTNzTJYvyAEj6Zlxn2BDBYARTxmRzPUr0zYj9lsVNqiM+mFzp7L0A9QICgvR9hJh3vcBVydVkx3v5iLs2+q4NwxrQJM67IixQW+AlDYqkzXLfbWXFad+GZhrRNFeRnxVB9gtGxWgJB3Ci126Fu3wZwWziDlE1CKle248NlzCeOyU3yaWHTG7xtECTj6E1Y666e+N+pcHcbQPDZ5i7WHSoZrGjjL3GD7VXuYZrNpklj1enRxkOM2RjHn3EP4tQHUDZY10iTvKau8rdc4tm5lomsDNK7mjQGNX+etwt6bGUts8Yuf9ASZVJhwrL6Lalhrhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3KYC2xQbTv5swDmTzOimhi+adJeW97fjzc4qGBfz0A=;
 b=oyi+hIdgxKMSrJBbUPjelEPi9a6B2QUTAJtfOC7oU756+ofOfKIQ8TgGxxdG0pSXsGE4LXIhZfbPubyrB/Jf4MDPsoN1OcyjBXiNQL9yRZE0xa/soe5Dpyfp/LJzM4dCar9ETfUicEjEFJDwDf2w2vDQtONeqoxuksFFcvVNBKVZAcY+VOCkfpobFzz1lgCNNK+R3Iz8FmXoZFsa7EH/I8tazO2f8yUiW96NqTkhqrp+Oieeqk6rAchLrKJ+cG+tyU3C+FJDau5390Doh85y/POT9XHzJdN5GcySThHpQ9d/zajJaoqOkeGy//PDUFo2zLlMquxKTxoNsunD4SQC5Q==
Received: from AS4P191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::6)
 by AS4PR07MB8780.eurprd07.prod.outlook.com (2603:10a6:20b:4f3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 09:29:42 +0000
Received: from AM4PEPF00027A5D.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::ed) by AS4P191CA0002.outlook.office365.com
 (2603:10a6:20b:5d5::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 09:29:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM4PEPF00027A5D.mail.protection.outlook.com (10.167.16.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 09:29:41 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 9 Apr 2026 11:29:41 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 169104020AB9;
	Thu,  9 Apr 2026 11:29:41 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id EB6BE700DBBF; Thu,  9 Apr 2026 11:29:40 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [scarthgap][PATCH 8/9] liburcu: upgrade 0.14.0 -> 0.14.2
Date: Thu, 9 Apr 2026 11:29:35 +0200
Message-ID: <20260409092936.1740143-9-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409092936.1740143-1-daniel.turull@ericsson.com>
References: <20260409092936.1740143-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A5D:EE_|AS4PR07MB8780:EE_
X-MS-Office365-Filtering-Correlation-Id: 04c80827-e19a-4a60-4da6-08de961a8761
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|22082099003|18002099003|56012099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	mfEAoMsxNUIDsldjLRuXaTqngMo+6q19ir3opM2FkGTZOFzFlJ/RT1BOpa8O0qm9ErOuFakEs8OGb2fBbNGcnETUXbrJsLV+/VzrdnIv0eYM+aWeNwGCJb1zreHQxGx7MC7/HZl0xl/T8oC9aIDm/fCyWmWIVtCVCQf6s093vX7c8psNaW/0r1Ss/cxFkIEsSI4hkTdR+RJvi/hLuRx8aWYI+D1hAp3BcyJGJgyhFcpY7RQw9TCQY7T2FwxwCGQ5t9jM7pRfFo7Zq3Hjb4hoz30jhypY/Tnt1B6gkeQyKUyN/LZGTp7frkA9c08YO4xttJzjWqdr6eKCMq0ohRlVTLAzegAJrLddLTS+V1Rvj2x854/B1z6UjQjGy9s0FksKMgwfoC+tUflFR3JRJNc/E/6d7eH1CUcM8zmBRK1bMi286YLo6U/f5o8KaMXMuArQo8LbNq2ptE7jA4YgckDSEQtDlcrNTlIdD0DeY8rmIGhvjorATSfWESxeQmqNfQFOj+VVIefURMZp8OZ41BRW8hKFLP2ceUoiBr4w4+cbEic6hQT8lIxL69+MYCcpGVII6Jy2EK3UrZVV5otnYDNvMwx8no8PKpIgW2ZXG2hmkw5mK2THToQWkg1qZ3TzDBv9YKbSjz1pLpAy1cpUqLkHl4IBxWNFyRyxmaVLSK9YNVBqssfSp6Q8ud45VtuIRzrw2oRrq3QjnAeMSYWxcLvtU8VPJM1pxxgudmgl10EoGOE=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(22082099003)(18002099003)(56012099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CDPKrUyQv9DXKFy8/poNAZwE3bwxfAgdLRa47WVGttV7jN32Qlzgla34+QUwV5dGUTbLQAc/KcFDDHIBkTT/o2eue0Gc3kNeQSkLDrzJ/dYDM/gjKxMZX152RLHYkGk8g8vZxS17ZSv31kge/weN699Lnoahs1Joi0x0lg69QDH2wGaq+tDF2FZK2VcmJqm4tL6L9e0WUdLIocZoAKYLp3WVpuBPhrcOC9FGFHqVf+mz4IyrGx/PUwJ+bwCzYqzO6LvrA7guU38DIbtrvN5Vw50X3RDcvh/h6GcKFk7TMume1oQ0jGT3L0boaoyohcPRa+NybR0ZqZ551VNe2/OLN31rCG3ZKdKM6/e9B9jz7CJc6lrYI1Gg+hsSAWPt05Qf6rhsP5TZkYLTnvLO1jMZ+CxYrHymXmQrcemOtcnZ+2zKHrpuHf0BbvFMswVZo0vb
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 09:29:41.7186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c80827-e19a-4a60-4da6-08de961a8761
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR07MB8780
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 09:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234900

From: Daniel Turull <daniel.turull@ericsson.com>

Changelog for liburcu: 0.14.0 -> 0.14.2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

2026-01-26 Userspace RCU 0.14.2
	* Fix: Only include linux/time_types.h when __NR_futex_time64 is defined
	* Use __NR_futex_time64 in futex syscall wrapper
	* Cleanup: Remove useless declarations from urcu-qsbr
	* src/urcu-bp.c: assert =3D> urcu_posix_assert

2024-08-28 Userspace RCU 0.14.1
	* Fix: missing typename in URCU_FORCE_CAST
	* Allow building with GCC >=3D 13.3 on RISC-V
	* pointer.h: Fix the rcu_cmpxchg_pointer documentation
	* Adjust shell script to allow Bash in other locations
	* fix: handle EINTR correctly in get_cpu_mask_from_sysfs
	* Relicense src/compat-smp.h to MIT
	* ppc.h: use mftb on ppc
	* Fix: allow clang to build liburcu on RISC-V
	* Fix -Walloc-size
	* urcu/uatomic/riscv: Mark RISC-V as broken
	* Fix: urcu-bp: misaligned reader accesses
	* LoongArch: Document that byte and short atomics are implemented with LL/=
SC
	* Add LoongArch support
	* tests/regression/rcutorture: Add wait state
	* urcu-wait: Initialize node in URCU_WAIT_NODE_INIT
	* Fix: urcu-wait: add missing futex.h include
	* Adjust shell scripts to allow Bash in other locations
	* Add support for OpenBSD
	* Revert compiler.h: Introduce caa_unqual_scalar_typeof
	* rculfhash: Use caa_container_of_check_null in cds_lfht_entry
	* compiler.h: Introduce caa_container_of_check_null
	* compiler.h: Introduce caa_unqual_scalar_typeof
	* Avoid calling caa_container_of on NULL pointer in cds_lfht macros
	* Fix: revise urcu_read_lock_update() comment
	* Fix: uatomic powerpc comment about lwsync
	* fix: aarch64: allow RHEL7 gcc 4.8.5-11
	* fix: warning 'noreturn' function does return on ppc
	* Fix: use __noreturn__ for C11-compatibility

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 .../liburcu/{liburcu_0.14.0.bb =3D> liburcu_0.14.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/liburcu/{liburcu_0.14.0.bb =3D> liburcu_0.14.2=
.bb} (91%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.14.0.bb b/meta/recipes-=
support/liburcu/liburcu_0.14.2.bb
similarity index 91%
rename from meta/recipes-support/liburcu/liburcu_0.14.0.bb
rename to meta/recipes-support/liburcu/liburcu_0.14.2.bb
index f03c990632..12916dd0c3 100644
--- a/meta/recipes-support/liburcu/liburcu_0.14.0.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.14.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De548d28737289d=
75a8f1e01ba2fd7825 \
=20
 SRC_URI =3D "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
=20
-SRC_URI[sha256sum] =3D "ca43bf261d4d392cff20dfae440836603bf009fce24fdc9b26=
97d837a2239d4f"
+SRC_URI[sha256sum] =3D "1337c49658367ca6df3c09a7c02303f752e2d964aa98518f45=
93f7781ad7aac2"
=20
 S =3D "${WORKDIR}/userspace-rcu-${PV}"
 inherit autotools multilib_header


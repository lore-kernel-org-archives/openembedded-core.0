Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEB810ED669
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 12:28:29 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71773.1774614507697868711
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 05:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=hXeh2EAy;
 spf=pass (domain: ericsson.com, ip: 52.101.66.34, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQvkcrFkdqAF2gxvh0X+5WwF8JhNjp0qbLS3WfN3OgDvXILQzfdvQssKwaFEhciqUWYRyPotw2qbLB6F5uK4o/rYbEw91AYHY7TDaZXD1Uz7t+kVJRTP1ekNVTc3u68G6HKRBVY9nRAUWz5D5JfsLE2IDH2TG1g7G6uTI5me2SX7cFfoiAOyBH/Oe+NMBy7jSR+ahX/LOQEo57L5rif9cTlFDjWx6akFyMvNjPZorCn/HDw6CnRRMB+WD8Xpqa8xOva4YtrJEmyoPAAi49lzXTuU/vv6Ip5KhM4IubQtT9nGTM/ugZyF0fNdEYDCIh4ffUo21Jbh1rf/ouCkvIG93w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWwSrrqahzDEYt23fRvRA+gwcGVGaBYcO8u0+d/gwac=;
 b=RBf0N0IQMnEl83J1jajeM7YUNyPvR7MGMYaXCiZ6MlIOzlz2BHUDpTx+fzwiPoxPsAa1AIbTnqmaGRBwCGLOLgf1j0JGIrK2ZxyyO3JuR4/HIhX151eedpgOxgtmU/y1dTEtdo37Zo37SyZVfKQcpex0CIlAFfFgPnPk0dLG/UK85zMc/nI8mgr8AyCGZjJwiyBukiB0uZJVAQKCGcLrnZidyoonjuzFsBLRB0nig4FqVJLLy+BwOln+SLo5YIj9S+sq6FCno2lMo8Dk5wHvqayFswaFsk090LCDYGKKf0UQ5zluJP8CR7n+nLzGYFtWzY8zoabpgTu5Gmt8ufFeXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=est.tech smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWwSrrqahzDEYt23fRvRA+gwcGVGaBYcO8u0+d/gwac=;
 b=hXeh2EAyIiBnTKYyx5Xka3mfMqRzoPjFEEzZbKiNQtTAgirpnJWIcsXRTbhgYZokpPnqnOy4c20HmMqJpCZW9iFwWX+nov2UE5UBtHfpo6FfOoFS5FcZvoS5ujaGGpqY/nFeGWQJDr7jU2pE17wLIqJgMJ0m87wzrbKPKk8jd80Xnb4eJRd01mJbAyk7GG4M+sSqBN2UEcWd8RFMpmw8OeP/4swKmkuIXsYhFkDxAH3KLfvu2NDLUcQoCUglxgljvvJuhqi5e832Dk4veGHpuiroyXJnGyP5I9Q7oXbqzXg1Pwe0ImTgSpAHr1K1yT9kAW5N9Em0FU1TSFmz3f4HUg==
Received: from CWLP265CA0379.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5e::31)
 by AS2PR07MB9373.eurprd07.prod.outlook.com (2603:10a6:20b:60b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 12:28:23 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:401:5e:cafe::67) by CWLP265CA0379.outlook.office365.com
 (2603:10a6:401:5e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.23 via Frontend Transport; Fri,
 27 Mar 2026 12:28:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 12:28:22 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 27 Mar 2026 13:28:22 +0100
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id D26B54020F83;
	Fri, 27 Mar 2026 13:28:12 +0100 (CET)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 3AD1F700DB93; Fri, 27 Mar 2026 13:28:11 +0100 (CET)
From: <daniel.turull@ericsson.com>
To: <daniel.turull@ericsson.com>, <openembedded-core@lists.openembedded.org>
CC: <bruce.ashfield@gmail.com>, <alex.kanavin@gmail.com>,
	<pratik.farkase@est.tech>, <richard.purdie@linuxfoundation.org>
Subject: [PATCH v2 3/6] ltp: disable pty testcase
Date: Fri, 27 Mar 2026 13:27:55 +0100
Message-ID: <20260327122758.1851989-3-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327122758.1851989-1-daniel.turull@ericsson.com>
References: <20260327122758.1851989-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252E0:EE_|AS2PR07MB9373:EE_
X-MS-Office365-Filtering-Correlation-Id: 599104f3-608e-4866-1dde-08de8bfc565f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	P+lnmpz+tEDZaERjBCm+lTKvqFppfTYKq5Na79aJgHVQb8znBI5Vr4+xNA/CPj0IdrU0ruCK8vFMQLZlz8b2B3rN3hSuGFtBtv2jdRriN8WpGaohJyp5sHzj7mk14svjKhTIJbxBtiE2hJyq2lQoI1kw9MLFqPx4CtEaksrCPmH2cof2clKyAi7vmwW23DU5WK7EvcMIIrzsk0omrQ2MYowg5/uRFqGcQ25YjKQi+MGrfI3iGG11Gj6LeNXWhp75/TVFFpTRsVY9IRkw+kpGypkJ/gRZnnCAg68YifLF855RKNo7ZXiii2dWrHt30Sg9NTfiRjnW8CPeSQeGQHeRmm94UohNTpqC2JwOIQIMQYGyJDgXs4BiIc6hv1sxxEkxVxCDxgKz9ZYTXv4l85tpWNGt36NY1crhStrXwXeMOFaLvcyiYcfgoWNMbFU/aRNxIji/9YyrDHkdQLaihhJrwUq24502rzAQn11VSIHVgM0TD9NOwEHVMlXXpGSvl07zYmupMh00EoJvJyfBA3wSZTTs0Uhu7r5dM/e2J9QCPXKGD4jYetDPZ9p8mpQvPmJKcwRt64dYY2/5ErmjQczxKEJekJUDlHWWNjrUQRTSmbd201qeu0sLjClGN7JeLv9mKpxOZbJB9HhrOOtP+C3w2B+O//mXePnXtcG2QqtsrBzhiuL4qijcTt2NnatVklRxlIf5bJklzLEfOSEuqii9gaYHgLuQsLyKDfhAbivCETA7Nj/aGoBSYX4ySzmJylJnhVHRMfNZ7er44SO17ODwaA==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	sRmEdo3OeBwlpvFAxPwhj9fDgoil+THrEiT+fQ+EUHlCTXn1NrQDYxAYt1T7vLKwKGPXdujHMkyEm82yMxwp3dsMJ7Pqz5dxFjjHfCZEVPTRHeU492JDxzZxOnMYBO0DeICw5TkjjE9RUeGES1aq1OAnQ0pdfjbmPN8KKqk5+pKepFVOs4mMjBjeW0VCsmY560jDr8KMufgK40o/8NXBWVlpTxOekN9YETJmHsdpome1/aPu/Bf5HoxLd59DKwfdhQj+cOvN2ilzTQGfsxxTo+jIC818EvJdW7xDN5f3kiHHmsyFQXiaCOX4a6S/EGKhITYENNfr4P/Er4Fn9RDQyRayeDcMcbA8pUvm4+zsihABaLPWxI6AGYs/P3fWatPX8pDvXk+rSsgAKG64myPr4TujCe04HiRWd30kSRnlMo+ek3/KUCUtDFLeGGu2Gzw/
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 12:28:22.9687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 599104f3-608e-4866-1dde-08de8bfc565f
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR07MB9373
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 12:28:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234082

From: Daniel Turull <daniel.turull@ericsson.com>

On qemux86-64 with 1 CPU, 4GB causes an OOM on the following
test cases: pty07 and ptem02

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
We further investigate the root cause and fix the causing issue
---
 meta/lib/oeqa/runtime/cases/ltp.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cas=
es/ltp.py
index 0ffdbe23e4..4f7498fcbd 100644
--- a/meta/lib/oeqa/runtime/cases/ltp.py
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
@@ -57,7 +57,7 @@ class LtpTestBase(OERuntimeTestCase):
=20
 class LtpTest(LtpTestBase):
=20
-    ltp_groups =3D ["math", "syscalls", "dio", "mm", "sched", "nptl", "pty=
", "containers", "controllers", "fcntl-locktests", "commands", "net.ipv6_li=
b", "input","fs_perms_simple", "cve", "crypto", "ima", "net.nfs", "net_stre=
ss.ipsec_icmp", "net.ipv6", "numa", "uevent", "ltp-aiodio.part1", "ltp-aiod=
io.part2", "ltp-aiodio.part3", "ltp-aiodio.part4"]
+    ltp_groups =3D ["math", "syscalls", "dio", "mm", "sched", "nptl", "con=
tainers", "controllers", "fcntl-locktests", "commands", "net.ipv6_lib", "in=
put","fs_perms_simple", "cve", "crypto", "ima", "net.nfs", "net_stress.ipse=
c_icmp", "net.ipv6", "numa", "uevent", "ltp-aiodio.part1", "ltp-aiodio.part=
2", "ltp-aiodio.part3", "ltp-aiodio.part4"]
=20
     ltp_fs =3D ["fs", "fs_bind"]
     # skip kernel cpuhotplug


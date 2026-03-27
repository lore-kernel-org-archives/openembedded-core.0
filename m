Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121D410ED66B
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 12:28:39 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.62])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71782.1774614516969893658
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 05:28:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=OyCOlKPD;
 spf=pass (domain: ericsson.com, ip: 52.101.66.62, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gO2BuwgiEQiCreb7J010TgFTpvvmSNPuVxguev5+rx/zGKDkEOAKefSDT+OwsamVKpmTPubwZmwUR+b2oNrASOvfZ8wwZnleqVIybSGFjz7X8lypaEM/PabmyhYLZJlOxjmDSXNgyDva4OonqEJDHNmeLnqoIM3HztEK9iAdOH3UxPkVhJmYPSX+xSDU9tx5q6sUpic7mtOsNdceTP0ZGHO9Rf+fx3SFL8+JaOzeGfvBBRnl128Mol+jsaCRVt6/tdWnQVKG0/2EIjgaDkM1QthsugabeQJh40nM0THsGT3FGX5LXC/OYPp5hWoVQLqCcBCPAD+G1c36zEu9da+Jnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIm9K5dLUKJQuWgN016EVrj5Mynn7F6kiAUR27crjlI=;
 b=WIyR7pQ0QNUmff/BBuQlvchku+qtbM/pVtbr/T9dp0lC1rDETz2ZkwXN0IZ/v+Hf8DfOCGR5IoWg3GXur/8b6TGnBAr+to6XmJzq48EkpZLXPrK0ShEvlXy7e/eD1hSwctEF4XsEd12j/8zf+ldPdot1wdtkdXdPakGAs+ulH8GqqXMnJim7KwjE0hMTJ3fdLHap052rRyvBTk1LXRu5paByZIO9815uN/TixHuMNVRXaMTqpO1DFUb5oTPs5qsJmEdqOlBLsFcoV6bJC/7qMOrCifWrzUFz7tZV2WjAvwukIiYNXp1WwxgpHPPyORDBJh0nu9AXtaK4xqYHiOtW6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=est.tech smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIm9K5dLUKJQuWgN016EVrj5Mynn7F6kiAUR27crjlI=;
 b=OyCOlKPDrZ1PXF26PvO5/Abuu9YNKkoFy8DOF9vub7UuzC4N3RP2YZjMUYnkD4YsT4zjF1sfq7xN7X0JyVTlCfZ3g1kGierQ3O0OcHzQL7w4RzwMObLYHGn2UbkN6QYRHBYah4L8T/mFonf/f8lsbcmO9BTw7d8i5akE82ujDTstMYdI9/zRKofkVRrd+kICArQ77XOwidFudv0A822EqD3GAdafEEZc8GWLLpaOsp0d2gy1hWdp2dCab/bGim9c9AiPZuyZU0D/6HkUBbZuHp9/v+/q7aS2ikNtni6t8g0n/Lr8HuhJSk4a7cGxLxBrS9AVXl+piBsMrs2xlpnHCg==
Received: from CWLP123CA0205.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19d::7)
 by VI1PR07MB6318.eurprd07.prod.outlook.com (2603:10a6:800:138::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 12:28:31 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:400:19d:cafe::b2) by CWLP123CA0205.outlook.office365.com
 (2603:10a6:400:19d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.23 via Frontend Transport; Fri,
 27 Mar 2026 12:28:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 12:28:30 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 27 Mar 2026 13:28:29 +0100
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id D760D40219DE;
	Fri, 27 Mar 2026 13:28:13 +0100 (CET)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 6E4A7700DB92; Fri, 27 Mar 2026 13:28:10 +0100 (CET)
From: <daniel.turull@ericsson.com>
To: <daniel.turull@ericsson.com>, <openembedded-core@lists.openembedded.org>
CC: <bruce.ashfield@gmail.com>, <alex.kanavin@gmail.com>,
	<pratik.farkase@est.tech>, <richard.purdie@linuxfoundation.org>
Subject: [PATCH v2 2/6] ltp: disable min_free_kbytes
Date: Fri, 27 Mar 2026 13:27:54 +0100
Message-ID: <20260327122758.1851989-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327122758.1851989-1-daniel.turull@ericsson.com>
References: <20260327122758.1851989-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A65:EE_|VI1PR07MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: ca315de5-f60c-42aa-ff2b-08de8bfc5af0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Hu41Dr3r1mIcTr2Kvs4sewpXdVDuI1NiL+x+EfsrS/Wlor40GXMXn1jQfPTMERL8DVgmNC7d1yes1Wc8Nun0QYg/mDaNGS3LZVJDIHnd31xOyX/DKn4UObRx6NKl7tIzd01E51t63tjgZo0lTNsIvpScq7eWKfMBCdCuQ4mVg16yZByyr3Oy4JJA9J5jw4shsHxCJstOw97YzqYX99ys6cWdJnSfaVWijE/+JUFNZZyGLjGBWjZY1QB0eNksOficFXQLTY/kadUgcmB9t8KnyDq2+SCl2Nyqsxqf6ZOooaMtibhLpcFLz541OEQdaae+7pxv9Ae9iactoTFwILwEpKY5AlYZ0xhcR8zMo/Xp7NXoAUdKZ+kRalEz3aX+7t1jNxHmLgeSFCSLT8lnWWOPphaztGRCY4/bmM2YiJ4pNyvozM+sQbYijL75FZAoI63DqsTvH94xcv8ZgTQmfecOi3sZGSSYryg2r7oTvsahpUgknHlogLezcBJHSizy1y4MtBUKXVrrwr5Xsbs5n0pW6zYGl2OGqA5gMACOF3K55ItzxP8XkaPTOMsYX/9Ni/DE7qR2a4fPn9aDXV1ZoF9xbGKhe/3UUnSMmH9M6/w3iEG2fSTUVXJv/MWEZn3LBTTKnK0NSnfK5WMGdSxvVaqHalda23EbUUYvPMU0/YW7zkM+2C4zsqNlpaHYqUbjOVPpnpcUeRxOgxGVWNrbWrP3xI0BC6YIHmRLH0bVKmrtZ5OlZixb9w3oZqftQrZFl2tTnPvIkgjsLwU1oi1c3A2izg/7oF6LTHROGgQzZ8f9hxE=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	KeX6JGrLKjcjLEgFkr6TEv7HcwlX/e8ZMtScLgu1u/Qqzz/nQaNH/OUgHYm/w9pywnpz9NK+G+vnzFh8G8pLOdnUR3uYpa1SJPORw2hw5jvnDNHbGtcvNCU4GaFB7rXxaRGitMe/pkcAkIqOVUWaAQxAoCgo/w6ToxOlN5KM/ObOLG1Z2ohBwpV5qKlZn1/RASGV5MGHeW2oy1vOygdUG4dKu2HCrSwGanIHqQR9LPajLF4ft12KzHvb5SsoSqUve21LKgE1wGuG0Wn+AcNc2lWV9sF4oVVaYZY8hBRiSI6Lf+6JOLm3H1H78ocvu2bKYnZE63qEMBmWghQilSpipn4S7OTo0+6uFZub0ZtxshAMKhaQwNgdxqkxgetZI+bOSijbo7oka5fufLXgo4AM/NbD4U3Xef8KezUrquM85n+stYqnAv2HYEt9IzJNdAWt
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 12:28:30.6324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca315de5-f60c-42aa-ff2b-08de8bfc5af0
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6318
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 12:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234084

From: Daniel Turull <daniel.turull@ericsson.com>

It casues OOM regardless of the configuration

There is a bug in ltp, fixed in a newer version
https://github.com/linux-test-project/ltp/commit/355124aea99c7c7d40140c969a=
53ed892421dee9

min_free_kbytes: Connection to 192.168.7.2 closed by remote host.

NOTE: test_ltp_runltp_cve (ltp.LtpTest.test_ltp_runltp_cve)
NOTE:  ... skipped "Test case ltp.LtpTest.test_ltp_runltp_cve depends on lt=
p.LtpTest.test_ltp_groups but it didn't pass/run."
Test case ltp.LtpTest.test_ltp_runltp_cve depends on ltp.LtpTest.test_ltp_g=
roups but it didn't pass/run.
NOTE: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
NOTE: FAIL: test_ltp_groups (ltp.LtpTest.test_ltp_groups)
NOTE: ---------------------------------------------------------------------=
-

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
If it needs to be added, we can revert this and have the backported patch.
We need further testing to enable this again
---
 meta/recipes-extended/ltp/ltp_20260130.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/ltp/ltp_20260130.bb b/meta/recipes-exten=
ded/ltp/ltp_20260130.bb
index dcd1e81398..0b4f9c1ad5 100644
--- a/meta/recipes-extended/ltp/ltp_20260130.bb
+++ b/meta/recipes-extended/ltp/ltp_20260130.bb
@@ -78,6 +78,9 @@ do_install(){
     # The controllers memcg_stree test seems to cause us hangs and takes 9=
00s
     # (maybe we expect more regular output?), anyhow, skip it
     sed -e '/^memcg_stress/d' -i ${D}${prefix}/runtest/controllers
+
+    # min_free_kbytes can be disruptive on constrained targets
+    sed -e '/^min_free_kbytes/d' -i ${D}${prefix}/runtest/mm
 }
=20
 RDEPENDS:${PN} =3D "\


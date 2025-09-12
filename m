Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E708FCAC58F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 15:57:26 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.36])
 by mx.groups.io with SMTP id smtpd.web10.20416.1757692642092607846
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 08:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=QWIBDgEj;
 spf=pass (domain: axis.com, ip: 52.101.84.36, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4IIau4PEWj3l4Ex49JLQHICeebW9zsrzOLQL0bksKcAirP6mpMGdYo2bRnIEtNxasGJn5ScfyzA4ObFlsNJf3CBVFRJFWKTaHCF6LdkcR1z8fYYMZytJZdzazR3mVe9imP12FnSnbQ28R9C0v+LMIll0335w6ifLBiAVcnVVr7SXfxWm5TD7iozRwkDqFlRtQlrIf+lWBNlnXpXYR84JQA//fNJXXtHV0hXbbEcMYgzdlq/+CSwEpdqz7koHOUg2DNi1Tni3iX6vGTWndCzumWg7SFmWB+/Dad3SpIFBWePIieYk3oQePQ1ygNYLqbrvwnYs5PZBlRtn7h3CtayUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gtCazAhjfGipb57ZLjKtWQzVbiEJqgVHia5mFnE/bWE=;
 b=mU4N7BqHuE5lC7RBjXVoB94k3wBEd9qjAA2KTC9JbyLFp50NBLhdZ/3PtwUQUCtdFQBS4XoPZMc3kWna24WFdSonWS1Tg6g4CrA8Wise1SCED0PFsj6UXrbDXLzRqFztaXwKlHF7PSZAmsG86XIWV+OPcnsu9TvG96ua6wiQOp4B1luaMt40IH5Zs27SmSq8AGEO3ZIqAeN7omBCdawAAjcS1sNGLIc/HZbds1ETw6P1KXWbhhtosTCJeDiiyXZF/+iyBfJj2SfylyPTk1IWXT0Lz0ULHR0Gy8v5NfdU7SIlT1i5KpVou/68m7H49ySjE/fcgJRG7kTUjL7q+pV+Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gtCazAhjfGipb57ZLjKtWQzVbiEJqgVHia5mFnE/bWE=;
 b=QWIBDgEjjxO42OvgH85AwBlmC9U1/vPIyHxC3aCZk7ZtZLVfWZr5fqg29i/SS2qFjDFXyrx2Y8UEQ+OO2gOrzuEe8wJHNpA+U9KyS02NpCxjJluzt0gOSe8+r7jDz2Q3nIgnfttOIzlwqR6LlFfFwstADPoAmTTZN8rEjJ+rzMw=
Received: from AS4P189CA0038.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::10)
 by AM9PR02MB6721.eurprd02.prod.outlook.com (2603:10a6:20b:2c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 15:57:16 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::7a) by AS4P189CA0038.outlook.office365.com
 (2603:10a6:20b:5dd::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.18 via Frontend Transport; Fri,
 12 Sep 2025 15:57:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9115.13 via Frontend Transport; Fri, 12 Sep 2025 15:57:16 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Fri, 12 Sep
 2025 17:57:15 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 12 Sep 2025 17:57:15 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 7D3281E0F
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 17:57:15 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id ECC0C120468; Fri, 12 Sep 2025 17:57:14 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH 1/3] systemd-systemctl-native: Use += instead of :append
Date: Fri, 12 Sep 2025 17:57:10 +0200
Message-ID: <20250912155712.3340513-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000045:EE_|AM9PR02MB6721:EE_
X-MS-Office365-Filtering-Correlation-Id: 87394fde-2729-418a-1ffd-08ddf2150bb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VV3PG0YxGU99CrWZ5KprUpQchGnWo23PIW6CYGUmvfNMD/LzHXyAN7GYCXbR?=
 =?us-ascii?Q?ZmrbK44+46bJrWflAVZ0/3ZF7aCzcfpk6z8UgpI87uQ1DYjFKX7UPJ/zT9Rs?=
 =?us-ascii?Q?aRXqqeLzCH+DFZ8iDfQ5aBgFqFwCZp7g3Zh019cTj7e9hAVi2PC6dNnNmAFf?=
 =?us-ascii?Q?UFcJxL2xJR7tJEclYXtcSYPXVUF4Ux38tQ46wDdandV5dneZNoOlItOD1wVO?=
 =?us-ascii?Q?Gq7qFhqYnaagsGMHj6J7m5AAEWvygMvz2Yk9LVgllefSca3Hck0g++CRfJnL?=
 =?us-ascii?Q?YUF0knuOWHwQM38MlCr0nICPUR+PjpkzK6/hB7aj6bZZMxono94pL50fGI5a?=
 =?us-ascii?Q?sqp3bZdDQiketywgGyT41bIU+kD5+YicU4PbLDiwDvJcF6B2RbmaIS5aNQfl?=
 =?us-ascii?Q?SwsivVrMi/nRpLt+cNqEhpSlN3S0sEnhAv44kRQNIv3Zoo7Qaa3dN+dmrJDO?=
 =?us-ascii?Q?Ef+vRuqyc5EhQakg6OHnavONRKIo+bbbYUHAuuar9nnsu9cbDz6wHnBii6GS?=
 =?us-ascii?Q?SOjTW0Q/icuzBKb/+V9ih6PZho2jTInvu4pFDIjtCTphg13j3qMFH4FKVZyl?=
 =?us-ascii?Q?yaKxF1zcKZMiorMB7gSkaV3nmDCaojMXZXPCGT//loSlUqYzq9q0Ve6EekiO?=
 =?us-ascii?Q?KgX8ZglE/lyt2vMWK4kG9C5Z4lIlIe1i6C0KsVf9Hvk2hKtQK90AHU7AQYTl?=
 =?us-ascii?Q?atYFCzJMYM5+MrbPQWxWc14PZTSVGbaKzeeiF6LRdQes7DQg4SnnGej+XDzp?=
 =?us-ascii?Q?VoQFAPZiiJERfk6MHI7NMoRlqkYIbV3S7qut8pgDpxwuUmJzeWR7N9rlidNc?=
 =?us-ascii?Q?jYvh56ShbR9o9fi5AcbAEuXubBp3CMJynnXRWIDAMOYm4SA+WR2qS+jDpoAR?=
 =?us-ascii?Q?+2UoKswvXrAozdPtJKDW+TZIEfSDtABDVbm65JUTV+sg06pA3EsTbz5HOThq?=
 =?us-ascii?Q?b12kFvQ7x6F3RVUPzxORZDkEac6a3+KDs3L+cwbHNBIqrHYOHPuNAaG3FYBu?=
 =?us-ascii?Q?78J+nJt/4Pu5qRE0qcj52BwEm9u4AJIuixdigZwUDDjHPDHodBIfZvx56bav?=
 =?us-ascii?Q?BIdX5Ca1sV+qQING3bgdT0GyhChx6jzMXqLVSrFt70mlXkJwCatGngUJE/61?=
 =?us-ascii?Q?TOtz0wD2s6/40M8l/L4QHsvQUhvcnva5wWlBjAZMvSBX5Hg0FWtuX4V7BUfl?=
 =?us-ascii?Q?FtQAxEOaWAry1bGPVxkXkkbIaNy39EaXH/z6ZXVha8N3mt/Xv4sI4yskjAm8?=
 =?us-ascii?Q?ImeKp0fABwP2nz4AQIiRSW+lI68VNIWx6s6dJMpcGlAMMT0beHJYSvYmpkCf?=
 =?us-ascii?Q?I3nEmh0aRDxNFmzIlhO6qOtJ8zeDhqJVzXVK9jW/FJdcqlbcNYu3cfcVL7Vg?=
 =?us-ascii?Q?O6+Vd5TTSCRErgzcj/UPD9G9m87Q406L9cj/y0KSI6czkRcuG0ieXwBS4tw7?=
 =?us-ascii?Q?ciTtNI7Iol7C7M1ph+lFRzFbHM0BXYpnovGkvnmEbVpPZqR3yXtCu6blSMam?=
 =?us-ascii?Q?IkL2Y55j+SnFu39IwO/nVzjP5hib+FoJxNa1?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 15:57:16.0675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87394fde-2729-418a-1ffd-08ddf2150bb4
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6721
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 15:57:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223326

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

There is no reason to use EXTRA_OEMESON:append when +=3D will do.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/systemd/systemd-systemctl-native_257.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_257.6.bb b/=
meta/recipes-core/systemd/systemd-systemctl-native_257.6.bb
index 73862b4e23..041a040a26 100644
--- a/meta/recipes-core/systemd/systemd-systemctl-native_257.6.bb
+++ b/meta/recipes-core/systemd/systemd-systemctl-native_257.6.bb
@@ -8,9 +8,9 @@ inherit pkgconfig meson native
=20
 MESON_TARGET =3D "systemctl:executable"
 MESON_INSTALL_TAGS =3D "systemctl"
-EXTRA_OEMESON:append =3D " -Dlink-systemctl-shared=3Dfalse"
+EXTRA_OEMESON +=3D "-Dlink-systemctl-shared=3Dfalse"
=20
 # Systemctl is supposed to operate on target, but the target sysroot is no=
t
 # determined at run-time, but rather set during configure
 # More details are here https://github.com/systemd/systemd/issues/35897#is=
suecomment-2665405887
-EXTRA_OEMESON:append =3D " --sysconfdir ${sysconfdir_native}"
+EXTRA_OEMESON +=3D "--sysconfdir ${sysconfdir_native}"


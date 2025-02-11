Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E71F7C021B4
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 15:01:14 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.137])
 by mx.groups.io with SMTP id smtpd.web11.1143.1739286064813401053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 07:01:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=FII8euxH;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.137, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sh1DN3gSXNp4iS5D/e80G3KyzqP/MrPCO9sEt1uP1w8i8y0oBA6dOmquIbzIBolb2NuJemLq+O+C8csTkC1UwGXNpEGIHdaRHCqhJi/NEyMaUL6vLEvZOhY0o7FOub9Vr+SJa1PQ8Z+4rsVJzIcsl+DG5nZKyU3OachwopstOv+s8Je3TqJjUED3Ymq3c2tPqqb7DX8ArwP9GWDkPtHo0aiOyMV8r142YcBioESFVef104b2sEKaGlAtEaR97Zh+XJTXjjhFLhtzZAQ3WUvUNo3Wi48mZhI0Sz0WV8qzFaK07eQeN3Po0zyVrto/MYApHzPI8xXDv/5o1SaWU3l7BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCWW+PB/CN+Ggeo1Ctx7FAkmp6O1hNQQPoJDZ7b1UtM=;
 b=vYgedp8vEqgHZV01gh0Z3W6Bj9lfDSUi9kjUb3K6w5zYGYYK0HDieq2m3b/KU2P1SG2l8kiuIXkJdivq1qx+R9AgLB/QRgWHDwEXscRvmHqBokNRStA0bb4deeRHHFKfN93jWQ4eIrMxNuPLxh9aywSrBZvOrQVCB184ytp2YythwkvB0+tf+F19H8Wa1GKgMayDjhuv3ltU7T7q7dnyY6E8RqhJieZgSutA3oBljVlVJfLWKc0WH0kIF71aj3YAa+m5NvIIVpRF3IT57MoXwO5Ixod5Eik8HUovv2kG/O0qPX3Xa4uxDw9g+fr44nucWVekg6xFZpf8Ph1Y92hy7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCWW+PB/CN+Ggeo1Ctx7FAkmp6O1hNQQPoJDZ7b1UtM=;
 b=FII8euxH8nKXHEPMKeSQ5/O4T0YfwnmoF3A57Xnaa2zhUTSfUrZsCAjWhEN2ifORHZyamK4N50n8NrxcqDvukcEy3JC81mYma2WKZdi/ooV1n1/JtdQbmYsdyJBRa70veIR+N/VdIUJjR04a7D9jUJaMtLicNTye6dnCQq2AC+3U8+ubUQgBV1uaxjbiWZYnLrGdBLo/mcORERaYF3Og+EfzII7og5UKSLo23ggmAk5bEEDrkHs+lv/cdUvP8axS38s/0hEDgavmKz9ckmg4AAF+kRSQFQEQ7jZwnDSsjfCpUeucwq9hU6a8wks9Z4q17rt2oziLmDn5/km3E3/2cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by AM7PR08MB5399.eurprd08.prod.outlook.com (2603:10a6:20b:104::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 15:01:05 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 15:01:05 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 27/30] [DO NOT MERGE] recipes: add crucible go demo
Date: Tue, 11 Feb 2025 16:00:31 +0100
Message-ID: <20250211150034.18696-27-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|AM7PR08MB5399:EE_
X-MS-Office365-Filtering-Correlation-Id: d2152811-d065-4aba-7077-08dd4aace4e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CeA6KaMp36Wi8WTBgk3UCi6Qyy6lYWOqKFRr/EwSODCQ8NdnfY8j6Nfrq8HZ?=
 =?us-ascii?Q?by1TEFtINZrwdavLpvpxuhgDqssX6Lor0wsjV7EK3BF06DM5MvFNjeGErtiB?=
 =?us-ascii?Q?5ND2WoGLyi/qQZezVDiWl5gn/strwWSY8Ai5HD1eHoH7Q0GVq4NC3faLilc5?=
 =?us-ascii?Q?IpHCHJuGEtBbRV1GdOkm8ytNcDLnLmpKWgXapdcMrEpumvPu+8bMCJAXf3Xx?=
 =?us-ascii?Q?/kSrNbGPbmcdoLu4xSVhdY1idorL8s73FnZoz2+EPcu6+/kN6ycQ4YuZ4meo?=
 =?us-ascii?Q?iGxY4SZG7s1VCs+XgbUqWp0FWExtfKOfqcD56kjYw7j8F7FmM1wElbqW6yjf?=
 =?us-ascii?Q?iOp7AAmwIzOR1BE7YHpn6P/WYEfGQCSYpvx9omxhNiffTwkapCg6E/utF7B2?=
 =?us-ascii?Q?HBGmYjNJ/TxkYx6gEZo3Oaf+mwzWrxXeYWgNWvE/9BaqDr564+qweFvVNJe0?=
 =?us-ascii?Q?uXbNEmSgJXQ4cBUZTpgp8glbYXkJMsesyp7LSs3WhT5CTdvRf7uUMzyeVajo?=
 =?us-ascii?Q?QGeyZ4B6N8rvlcfwekVQxDuKdSUWTV7mYr/WDwLuaaBVtungKOoq+ZNWbkM8?=
 =?us-ascii?Q?nK1pOvMNXnaz6q9JxKlR2c0tn75d8csylIF88dKq/4fmatWhwT95JIrlrEZW?=
 =?us-ascii?Q?oCLH2TK75IIWS5vhAzL1dw06iHlAv/6lJVbdSx9d0NGqeuRVfJDVsXgqQPX4?=
 =?us-ascii?Q?f85hjvn7v4b6ZTNyHDQTAmhy58/qX3bbUB9ZQrVzBKqbHxXkY98hM6U/kuxS?=
 =?us-ascii?Q?KZAHLJ0ImNK1YBbGFym9SWuc7UC0VhfBYcAzM0TShvnFebO7rPOmqU/sZ+mR?=
 =?us-ascii?Q?PedgCXrrlopTxwRxztq/NvGUD5kd+vTczIkPwOjVzEB/vRhMB3hkUHLdoxpH?=
 =?us-ascii?Q?/NrHEcCX3JPR8FqWmeneSZpZlPG9+dahVRqfb/S22EOZYg/BiCQhjbTjqQpI?=
 =?us-ascii?Q?uAIjP27QpIvw/pGlKAV2sWo/zWvBJ2b6PnfK/jl4erbTE4WGsTwVtVli9Gi5?=
 =?us-ascii?Q?WXaBjtxcJjpuQ6be1zd+8OKNgpCvuPV0c0jWmIg/zqpmVdCUep7L8uDza1u6?=
 =?us-ascii?Q?vBEL6vNGGd61H+zoaf65ml/s26i0WfNp8aTADbyS8QzdmTGVDYCCT4HXxOIr?=
 =?us-ascii?Q?JBN0Hkc1BTDa3JoDxmbhuRkmSXtBhtnIBNrVWJNJAitxmshN6jPnex+GxweC?=
 =?us-ascii?Q?uN+8Vr2+vOYUsv1xahC+HBfaY/ZKUs0H3SwPS6VsgHqsZbOI6W+8kfzlCo8R?=
 =?us-ascii?Q?2qogYj5bTfXydWyyy8sBXCOJIj7/NdzGCSbL/qBHRKH4zGT0S85MRuf21iIF?=
 =?us-ascii?Q?J7GJXd3b28kZMcZIswmd8q4bUIujid/bBBC0RmhOL161aEKbNP+oWkRsw7as?=
 =?us-ascii?Q?859V+LNpoZ+84fZdkUTZlYTfF3h1SUS9FtaW0bRu7BeikpfMog=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sipqefvGdl0iabg+RH7FkNGnGX+fW9DCfb5dJcUgfFbgpT3epazjZjTrl6fi?=
 =?us-ascii?Q?wZCyxMWutIhgfS7hHj9L/naO/eMYRVlaUk7L6FxCiDFpI+BVBGfONq+I2syE?=
 =?us-ascii?Q?M3/6mwuAUqman5YcqyJRXqLK43sn/OspSJd9YsaGDRhX2oLrPGsRJJf36LVP?=
 =?us-ascii?Q?M2e9oX3pScXpIncJz+GWd6ayOR1X9UBKgnZ+DFr1VepLZZ7/qMVqQCzNZtYl?=
 =?us-ascii?Q?0xg7aUIJaaSrZWfqCb5VEw8r2LC/grt8k4eEA+FLSHxnnNltWg84I2mvI6uR?=
 =?us-ascii?Q?0uorMOLZ9zW5T+aoP3+o9Zelu8Ws63gEflM99gnOjWSxBEqXaYnmM7YtTqB9?=
 =?us-ascii?Q?Ye4M1j6lBGJB4j8VnzlxelltwtfcgkiIUGCJWBOwOdao6xS09DEZA2aBmdBc?=
 =?us-ascii?Q?cSdghceeXvegmnUGV1asH9pOyVk4AGCXWUCUb3TijD3GRMKeKmftDfXyNobS?=
 =?us-ascii?Q?j+JZf6s8VNXldDi0Orn28VO4mOu/yxFBLHEU2UqrhNhNZovsi1Bl9619fg3d?=
 =?us-ascii?Q?+DtBIdd3Dv/vb+G7uPyoyHqs5c7Uby7Va0GuA6TOjP5IFLqYcrS6AQlx3vU1?=
 =?us-ascii?Q?NWWq78TGB7BH1t3fJxax7TGckiCBQVdQYa98Rok38FSZGOx038M5QdtODnTU?=
 =?us-ascii?Q?j/TnX8UMazWiIgEavIOwICn84q2Cka8f3g3E6Sh/RaS7/mWTzrzfUmdEEWpz?=
 =?us-ascii?Q?uld1sE3afM0tqDmXnB3N+OyZipXknovA8Onwgz5GCAOxuDlFY0DpwDzD8f+v?=
 =?us-ascii?Q?Y9FMkJxLTHL8SK2e8/RYucki7MGHWP0SEiHQq3sXWAGjx12ZFM3LYNoiwO6D?=
 =?us-ascii?Q?sFp2mVy7EyfRkQ5ORpQcTSQn26C/pIyPIbrlSc3M17s3l0wH3T1Ece4bDL7V?=
 =?us-ascii?Q?CACBkdZq8S0oD0xzkDUZz3PcFt9A3S5xtOn4bSfT+qnlyGtb6Fq96M2xgJWh?=
 =?us-ascii?Q?ftGys4sZzuuPCvYcCDavNPVmrb2+PRBiZ5iM9mUzEKgLZmU0zw1nUR/TbxR5?=
 =?us-ascii?Q?qUg+i5GiH1LjFULtrR7Z81vhuvLRj7hGHjNDOpEXmR/7jLld+oCjeU8Y0V3d?=
 =?us-ascii?Q?VcxfqHNVAsPYhxKkW2y+vSAwxdscq23UbGAk9KBXKkIZR8lNG5pmahK78vmk?=
 =?us-ascii?Q?u9twI1BqC5TBtS+GXSqPdm3Hmh7ZuDY2WWauRtGDnq78DJRt2Q4hUDKr98IS?=
 =?us-ascii?Q?XPby5bIoNmh5KJIrApt0Y0u0wVe8iRey/nvU18KkX25n9vM9Jq3Tdllqo+Ql?=
 =?us-ascii?Q?aUvUsoCxjUlKK2PX1+qDZBMS4/EVGRrhsfpqIHtYW5UTxBqx8mKkRBoTO6sK?=
 =?us-ascii?Q?OnFl6S4SaJnup3YbSaJ8fCNwj0mdgrHuJojn6P9LkdKqGdd/2fVqeacS5TAF?=
 =?us-ascii?Q?j+jDh9ZAq3czIE4rAOZwabpKLxEQUSDwjy00h7g9HsoG5xgqcMXe7/NDTe/L?=
 =?us-ascii?Q?erHDmTbNaLmtRHN+jb09Aso3EnqsS09wu2EyB4+GCwEOdH/iJQDJ0+Fyq+RX?=
 =?us-ascii?Q?EcntVD1YQRjQVSiOCQ3Ii2T0cjr4t/cwGdojEoQkoo4t1ULa8l2MWOWxzaAj?=
 =?us-ascii?Q?zGMPQArDnXFaUW2Ruos5DrEeQMzLHMvMomPZW6u9HE8QmA2S6uCElUkypAfF?=
 =?us-ascii?Q?Pw=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2152811-d065-4aba-7077-08dd4aace4e8
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:00:59.3941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yp+ADOazjVqD5nFzOwtHlJiNAG1pZW9aYxnHoOtZhylyHSqf/wNXhNo/hOYqJ6FUXtrP1XXPbwvz0T35IFtXMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5399
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 15:01:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211153

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 .../crucible/crucible2_2023.11.02.bb           | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-selftest/recipes-support/crucible/crucible2_2023.1=
1.02.bb

diff --git a/meta-selftest/recipes-support/crucible/crucible2_2023.11.02.bb=
 b/meta-selftest/recipes-support/crucible/crucible2_2023.11.02.bb
new file mode 100644
index 0000000000..353c5ad835
--- /dev/null
+++ b/meta-selftest/recipes-support/crucible/crucible2_2023.11.02.bb
@@ -0,0 +1,18 @@
+SUMMARY =3D "Utility that provides userspace support for reading and writi=
ng to the i.MX fuses"
+
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D201414b6610203caed355323b1ab311=
6"
+
+SRC_URI =3D "git://${GO_IMPORT}.git;protocol=3Dhttps;branch=3Dmaster"
+
+SRCREV =3D "dec27cd4e0e0db106c0a21d429c04ca8d36bbdd5"
+
+S =3D "${WORKDIR}/git"
+
+GO_IMPORT =3D "github.com/usbarmory/crucible"
+GO_INSTALL =3D "\
+    ./cmd/crucible \
+    ./cmd/habtool \
+"
+
+inherit vendor_go
--=20
2.39.5



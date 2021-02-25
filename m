Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.75])
 by mx.groups.io with SMTP id smtpd.web11.1444.1614284648021450902
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 12:24:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=bLONXN3K;
 spf=pass (domain: spinetix.com, ip: 40.107.7.75, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VPgTH8PmRi+5dTjif1Gh80yjdtI66RKTshh1U4IvjHxqPLPRkKo9sS3u6jwBcHpHA+iypCQx4db5bDZxsP/762qO/H8BTTO9sL03PnWyF8zujWbtj+agVEaCHF3/T5orQIOFZhBtd1uNVn182/wOnNEAYxmGKvzvZMhGxkNaZaVrDZyaRKHEKdlERqwwiUfKaXrHqcoFxDdHrSFwk5lXFRiMLfXuDLlHTGZPf45KqyFeB7VmdWq6utJejePGF9uVcTtyj2ROw12KTW2shgMzzps9RR/fLqS62/ED9eEcTpv0NmDzKTSvmdenzOfaJ8d95PXdas6AYkEi76O4UBYBQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OG6+2WMdCUxFV2WIM+LMr7hcQsz3zXSLSNgJME1vto=;
 b=dzeDZcYVMBDBET0APX2IePqfa8pBkbc+k1TDWBNdRDcH/Is/5vuiJWi/rCO4qnEyOsanmoZN/5UyzMCqwmu+xqjFJRv8X8wNpRPBUiiTOAsqsi3MMy5zK3JjBxko8hdjVg0YTxlPaC5fvkovIcNm2iNWBvcefqvnTXYvhM7ZWjRRBD5sVN+bLEyFQH2yQD1IFh3E9iaWQhcwfmjfLEnXVc/EGdkWj6UPwTjPn6nXvD9OfFV2Ipl3ga64lJxzEyWixF5vgdvo/jR/UNpJyKy/LWa5TVQZsyIV9N/hDM90EAeDTJ53x60KQgosla/+zh+7I0jZ/0PfZC5jkikMaCgKnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OG6+2WMdCUxFV2WIM+LMr7hcQsz3zXSLSNgJME1vto=;
 b=bLONXN3KS7uMlxvVtl2lNtRX7QSuPBZ1Z4A7AhI9R4/hNcj9wQDduq2CEkuz5t3iqFWrcqZEG1EhIcudYkSkxeh1cSQAc9nXedYDDiaxxF1I/TU6J6ZKUfWAE52jKADbBVaJKef4qN73wm2TWvh2WW5Il7w2aSt+ak6D8WW9ryw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=spinetix.com;
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DB7PR01MB4950.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:5c::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Thu, 25 Feb
 2021 20:24:03 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::a979:e5e4:3b20:ba6b]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::a979:e5e4:3b20:ba6b%7]) with mapi id 15.20.3868.034; Thu, 25 Feb 2021
 20:24:01 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: openembedded-core@lists.openembedded.org
Cc: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
Subject: [PATCH 1/2] packagegroup-base: use amixer instead of alsamixer
Date: Thu, 25 Feb 2021 21:23:26 +0100
Message-Id: <20210225202327.29608-1-Diego.SantaCruz@spinetix.com>
X-Mailer: git-send-email 2.18.4
X-Originating-IP: [46.14.255.78]
X-ClientProxiedBy: ZR0P278CA0043.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::12) To DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19)
Return-Path: Diego.SantaCruz@spinetix.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prefix.spinetix.local (46.14.255.78) by ZR0P278CA0043.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20 via Frontend Transport; Thu, 25 Feb 2021 20:24:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 128b716f-8ca3-4203-208d-08d8d9cb4974
X-MS-TrafficTypeDiagnostic: DB7PR01MB4950:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR01MB4950106A63558CBABBB75529889E9@DB7PR01MB4950.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nu6gUm0uCwppruywXphek2r9iv3x2rIBm3k41jCl60MgMbTZd6GWq33dnIWPQmpCuhRGGm0wI8v4/JqjGuv3baOL+6qMEVN1yofhWVpFcodvZ2E4sWskAwRKFwBzjuRCPqXVFWW345DzWEBDVuJmdEGE/ZVjbRbsTgdkoQi9E3xkL7tlgTamvXByG29ZJfP8pIvZe7tGlIgKvNcZSwltVsahJpzmnICYXmTWLwmjXGGl8hVfIgVMQ+yOs8KoOHp90tcmxH07kQ4UfMdBqVkEkeTXOAq8K9/Dn9CNenhzvh1YplvL6SrfsXfe/jJeSfACfX1ZKgBOEQ79MqMk1ScEw5tgzGVpv2YxLWkZTAwr53RaMrbUsUeF4N0/5bkQhWzMptI4zlck1YKb6kP8Ilqh1uCPOw1PMU/dFlqj35Cp2aBTT1zLn09GXAvzB7GTylNeP4hTSovnnZOYYUyxbNgEMhhO63ro0QI+BO4+TimLA/7MCbHfsmjc6dO0vcu6AkeEhAuhO07+XphHVKce/bY3SQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39830400003)(346002)(366004)(136003)(376002)(66556008)(8676002)(66946007)(83380400001)(36756003)(6486002)(66476007)(107886003)(8936002)(6512007)(2906002)(86362001)(316002)(26005)(478600001)(52116002)(4326008)(6506007)(956004)(2616005)(5660300002)(4744005)(186003)(16526019)(1076003)(6916009)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?LLZruTFM3gP7p0mS7+5S+74yl4O/AL/JIbYX/s4ZiAopXCPHTeI4GZJjkPb5?=
 =?us-ascii?Q?5FAc4IxXuPGDPXby4K7J4gJp8PqdjkvRkk6Fdc+Bi/JzEinJBnFSMYUYomi/?=
 =?us-ascii?Q?SUVgxmOV9RaFR9mSxXrVIn8KvvuUgJuV2S/rnyT4eFNdU+HTMqfRLUvFpE6Z?=
 =?us-ascii?Q?nJuWuKheDzqMs8U2CaN12tDGUvXI2U1VRtk3dFuRsxz58anonbQLXfBuHtFZ?=
 =?us-ascii?Q?F/M0hW4yg/O9lX9EMBkJZ2exrMDO+9Eg0JzxyQ+DdVeAoKXTqmk4Qh54N63t?=
 =?us-ascii?Q?ORVISn5z5eSD37ftsNXAU+8E+IuiZtlPBD3DTMQZffyrrIf3L2GsRGky1/tP?=
 =?us-ascii?Q?jLQvNARj7xaXP+OCqho/7ZfHQT6I5T01F//I62owiHSKLZs2cuhrw2IkBVTc?=
 =?us-ascii?Q?0/FXwNU6Xnc8sNkf0FoXFilNQQ0XTlWlnlKys3cN0WsiZop2geeAeZ7tDQBZ?=
 =?us-ascii?Q?833MFrEjcK+bcFSU6XdSKb0eK8jPIqRrgYJ1SH7ewqdKOziA9ltFrxjzbfIt?=
 =?us-ascii?Q?Jykb4YvplwUpEtJBEM4m/GWBremffaTOl9jRX4CU+gme09LY4Cj63C3e+80r?=
 =?us-ascii?Q?FKlybtWN9FC9e14JKpUw5qJRj73v7RTXVyPDR3gyjFnlC4muaDgI12f17mi3?=
 =?us-ascii?Q?MC+8YQitDvIRtiHxGslM4JtRdVB2ORtbo7ZdpggE1wWn+ZdTGDL9lerA5Nlk?=
 =?us-ascii?Q?WEHBybkjlPSRjcyUCXpLEpNuaL7jbnczoTAnPQRHN4dHFoXBD2Zgf+fXxQ8s?=
 =?us-ascii?Q?7t2VerXrfplGQPUAR5oXw6h7v4CY2f1CMumKUrb/4q7T3vYd27cU/4MXXyIU?=
 =?us-ascii?Q?ifLw5jmgUNAPEkJVDKYwcCUKlgUcqW6ksHW2gvTibi2U+nBMF+y7WX9EsMFy?=
 =?us-ascii?Q?MaLZcI9dN7jbdB7WlNbg0DvylLWygbwwHCpPUuDb7Ocl018WURUn1xZnfSpI?=
 =?us-ascii?Q?rG0G0lUX2kC+LNgRKyNk4qNNAcJpWahnPeUIArt4NkZNe695w6wfN9XOLuYY?=
 =?us-ascii?Q?YckwEXysm/EFDnezy03FElBjGR4QIhLC4F81kuFxoFotvaA9PjIQFwt4HjoJ?=
 =?us-ascii?Q?urD8JC3Yp54gU3Rfe1DAanwesRfLvli8fthRbkDXM97+0O6QHfzTPYb2abeN?=
 =?us-ascii?Q?Vsjfzg3eZkldPZq3e8kc4ToCEpkfGWSoc6JoC3WrmAP4ka4tzWWqssbnDwXV?=
 =?us-ascii?Q?GC3M9g/Mff9pb8DgUEFU6sN1QyVSHjpN7u6LmzwB+a3qpuz+YzC2kVDLIm9X?=
 =?us-ascii?Q?3yHJoGfnY9j6voqy9Ai/l305gIQoFsksk5JKN4NUhamNSWdii8+dxI6YNHUz?=
 =?us-ascii?Q?8rMvBvysC/rOx+6XmYQEyCQn?=
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 128b716f-8ca3-4203-208d-08d8d9cb4974
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 20:24:01.0938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k7/NFrLOeBmxKNtwQVv4Nmo9G7qpNlbg0V+MJJii9woeYMHx5Z4C+UVRZsGo/1nLNK6jlRzR+1bIGfI3N01fAXqDjlsrRsDHihsZEF1/y2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR01MB4950
Content-Type: text/plain

Including alsamixer, which is an ncurses based interactive program,
does not seem to make sense as a base package in embedded systems,
replace it by the command line mixer utility amixer instead; it is
scriptable and has no ncurses dependencies.

Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
---
 meta/recipes-core/packagegroups/packagegroup-base.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 90b79adfdc..6c8c978253 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -173,7 +173,7 @@ RRECOMMENDS_packagegroup-base-vfat = "\
 SUMMARY_packagegroup-base-alsa = "ALSA sound support"
 RDEPENDS_packagegroup-base-alsa = "\
     alsa-utils-alsactl \
-    alsa-utils-alsamixer \
+    alsa-utils-amixer \
     ${VIRTUAL-RUNTIME_alsa-state}"
 
 RRECOMMENDS_packagegroup-base-alsa = "\
-- 
2.18.4


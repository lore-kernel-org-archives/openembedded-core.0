Return-Path: <peter.de.ridder@jotron.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B63EF8FFF
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 16:04:15 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.120])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21941.1772640248400714611
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 08:04:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@jotron.com header.s=selector2 header.b=mW64FzMr;
 spf=pass (domain: jotron.com, ip: 40.107.162.120, mailfrom: peter.de.ridder@jotron.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQrojLJxEnLOFz3pAVT9X00WxbutHcw74E82DX6CROK3PcBrcWSBHErXiB1Gy08Q/wVP1KUEiYj0UO2o8c4JcKaEsJjbQa1a68pez6j89wFY/ToXL7fPcrKgmgBrQqZgnNC56e2SPU4RI+fnWH13thjPyzH5omQNf+lFdml/7h3nFP0T6H7MBIpIuxb8IlqkdDSc5xsGl83d7WO9KH1JI8/kEYZuuWiwiFyXPVfgCqIMnyHRFhRD86EdS2Tc1iMDf/zR1seMvJv6awz4OFpuWkA7U2VHiFeGCAdCF1lkY85D3zUDs6512WgnVPMBObH07L72+j8oZD2ORx8srHddwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51Zzg0npf19Fo5iwBEOaXa/RUNYJgUeNUq8K6XGVjKA=;
 b=hzDo7tCVo8GAwAsrCf6vihG6g/kQtMR8/RJLNgmL+oeP2P77FY5nzY68xs9GCxyoaAcw7AF0b/5WyaQGhLUsiplxsXKdgXUF9KjE21elLq5aEAC4zZPBd53r3WF3k0XOlbZKa5jefczhQDUzZo02PL4S2nx8kj47uOqgf1EIl+BXVF5tGUUkAiyp3DPYYVlEkxQ6+ELtfsZVcmGvemBOtGwtHeDmHKIBgfGw6mmNvN/4mpS602nRaixnfH8aa9ExWzJHkRwrS7hnIgjK3JTfrYCdGfnbZJuEuFCSavJS7muEhfx1qQwDHYICijRA+c0E4GQ7215karaYNs+Fn9YbWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jotron.com; dmarc=pass action=none header.from=jotron.com;
 dkim=pass header.d=jotron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jotron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51Zzg0npf19Fo5iwBEOaXa/RUNYJgUeNUq8K6XGVjKA=;
 b=mW64FzMrIxs9sX1mAbKpPBZTieFsCSuvHf2dr5nAVpu+8OAUD1sT/A1ziUvTXu9knorlZ/ty23xacf5P5WBliypQ4xJqb54LSD0NZZnlZM/vMQGcOLeLkvjcAoJvbuH6A+wCoG17gm9QE4U2oIgDAd1qfk9kS6TL91whn8Uc+n364pCJCM/6X68F41pP5BDyUw7rL3NW+WnqebC5EKWto2k7G/nAz6XGdfxTNQElOoKNGxIXlrbNytLHajHPX2TLmu8PsPieLjWy3Wk+Y++FL3BOcJkqzcTGI2ABa8F67Q/fIAT2Wlvw+Co4i+2mwj7QSj4fYDHvIcVnFDes1fOrhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jotron.com;
Received: from PRAPR10MB5202.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:29f::15)
 by DB8PR10MB3815.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:160::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 16:04:03 +0000
Received: from PRAPR10MB5202.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f869:fa4d:8bd4:ff15]) by PRAPR10MB5202.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f869:fa4d:8bd4:ff15%6]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 16:04:03 +0000
From: Peter de Ridder <peter.de.ridder@jotron.com>
To: openembedded-core@lists.openembedded.org
CC: Peter de Ridder <peter.de.ridder@jotron.com>
Subject: [PATCH] cross-canadian.bbclass: merged /usr support
Date: Wed,  4 Mar 2026 17:03:36 +0100
Message-ID: <20260304160336.390986-1-peter.de.ridder@jotron.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: OL1P279CA0072.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:15::23) To PRAPR10MB5202.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:29f::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PRAPR10MB5202:EE_|DB8PR10MB3815:EE_
X-MS-Office365-Filtering-Correlation-Id: 64d02bbf-824d-4c6d-138d-08de7a07a7d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	mUXYrLPD8d5DblmO3WPspgeUNqYoegNqZ62Prs7TMdHqpX/QKiYlu0S9DjGPEylsUe+7r4skuUD/9E3CqMoW9KRgSZFh3P8DPUy0TpI4j+nPRm+qfrYRAhih44q1+GX+nr245cHgyAl2qj/4uZmRt5mf5WxtP7wcyPLriRrlMmkYeeCvID2kdwmAp79jLPepJUL+KEFZKkx8kk1SMuyHPqCgVBHroWEBAZsrwjxbpVsamLBoPL+67/D2p57XerAQVNlE0l2cbBZx97wE11Wp96pl9ZpCe/ZW/ZqLpf2URQnqn2NEwbMV1iOhAi4ncqkQHE4lGN2uMXiGzE+uJK22zKKiXvbf2S48gLjXcKjaKlFxrgY3RIUn+WNZK5k4HZgRLn2SBuz4Yscfwgl1wT2TjOX9SN6LFobExXJMiizlJOfJmAHAXrRLoPXnEhrCRVCBW7BX4hwnoJa/emumE0HF3GpbWsQNxm4Y0PT2H1jGdfe+7STquB0udcQmMNxsg703CRziOeL6sEuxFPKpam0NFDpE/M5HU38UF2rsFir2z0X+DV6OomWxCroEZ4rpzS9dWkvOGxhQhsJN0+yv8AV2bwL779nsTSLzXa3zUxRYHbz0WABTBGZrXr2todswP+3qKZxlQ0m4k4kGg3cnbyy2spRTx2nYg6AMtBFoty5DMm927DgIr/q8VwmEvQUcs8gLO2PEI3xtEsSo3HTG4gWVKFMqyfrpjfQhOTyISd61vC6ayK++jtEbhmqASlcsHatbEft51pu+KvrEPDgiydQVm0lS73xDSl/O+tKjaXjv9JQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PRAPR10MB5202.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Fr9ze1gprg7nbewOm3SKOCOriXrbNmy7gGKawxnM4owfBsI8pXN/51mq46qI?=
 =?us-ascii?Q?N/PyPsvvVvgF8DkBaRtQPCKikUtzN7XhlBFVa9pB5BM5YFTuGZdeIXKfgdCb?=
 =?us-ascii?Q?00a3ksDLsvsrO+H/vBvynfTgl46WRD9O90J8YO+0BfF+xuWlwA3kXGdG8i1R?=
 =?us-ascii?Q?Tix1i9zrnNqlIzO4Qqemqo0g/XmyZpc8GKX7ZkaZ/euoshKbhdYsdfxNEUAW?=
 =?us-ascii?Q?N0EYtJaAZNIFhCzKqjp+2XQ6VopVGkLYdAm8qJNE+XvQ16Dzmet+z1K+z3bl?=
 =?us-ascii?Q?tY3+b5ZxZJeOCm2fNy/WUexO8pdfYZ24fUqTqemg/pAycbDA4s8MAjSCd4fM?=
 =?us-ascii?Q?s7d6qXAs5uNF/4WR/4R2VDLPPGxPOyFwIRYPNnRSFHHRed6h4UxGXBUBleVP?=
 =?us-ascii?Q?Xz+9UACEF0Q2+Tw7KGJUkjkyyvhbPl4w5Cmjw8p8vaY/6/E0nHFuZ46H/xsB?=
 =?us-ascii?Q?Op1LNwIjpZ3vVq9nDrj2n70725ylFmRO2jQ80Tcl6SlT+PvJ7dgDJhlK5xn5?=
 =?us-ascii?Q?JWMcu3cHvPRMJviTK6OVrXCnh+7N/NZILAEVZTlcQ3CaUepJwPgzQAzp1pzM?=
 =?us-ascii?Q?IhAPrJemazdxlL94RPcog7IbdvAdkMrkEWUHFOC1nCD1eJG6b3OzP2IRnwY0?=
 =?us-ascii?Q?GpafPqEH82qa/WDTBlOzZqsuflSZmPe4GL9qyiO6Dfx0uS+kCfy2HiumioVy?=
 =?us-ascii?Q?enAXcR8uWX323kSaPs1hU+HGnx9ZPtGu2CaSmfeKYtGi8DxlIt+OEOfeM//A?=
 =?us-ascii?Q?4tG73+4M0Hu7njFbjrSws4Vr0wn1TBgB6CZ9JVveAHrZweLFjiUrrpC0qvRx?=
 =?us-ascii?Q?cUglOxDCN2FJfTYw2GGgsSsiIejCX61a5jqaPhtJuWa6HoEBPzWOgA8hOGaE?=
 =?us-ascii?Q?nFGxv+cMUTABxTYY9GJ38GTg2JQqy8Bano9QqqKVhy38SETgGciNffuXsuAA?=
 =?us-ascii?Q?nPo/xeDHXdZPTOFoUei44m59Qdfjt14tIWwc+DaksR+h5zAtfYBw7wuzLYWR?=
 =?us-ascii?Q?wx7IZqLnR6xHViOYDBxeRq+bPpxEcVO/bpeJmXZPpnCgQFr8PgjSOD0UbO58?=
 =?us-ascii?Q?Iyb9dG68UaQrZXJ+YNqauoFLV3ekguMTtTOF0RSBj2vNbGGlwmKfQG4wIt2s?=
 =?us-ascii?Q?WHNu4DAOYo2a6ewGtLS3zoxhQLtPf+8wacCgsep444MjVRoSfdcJsrQ/RVhI?=
 =?us-ascii?Q?RkQEfA2k03WnEChOmZdO4nvmDCVZhWIyNqB6H9YFZrRvJx6ywaLdh3x5fgTp?=
 =?us-ascii?Q?Y3b5Nw5+bej5CosAzd3D0jQMg+ive35h4iRmxLeboaf/IJS9e0RXuPVdQLeC?=
 =?us-ascii?Q?Vwbe2j8+u/gDmAHHAj4NmvlVh6l24uI5O0NL+kmYXAp0nz4HLwH2f5dOnjmC?=
 =?us-ascii?Q?z+xVi7ERzxHoYSfYQ+uiL3vtjyYhgBi+4Ik85/kv2x7yMgthseHpGX2SEaLC?=
 =?us-ascii?Q?vhRxHVPAFDeTZrs0syXiwRfCCzZk75G+J7b7MXktAW7iUTVJ8z2GprFSLhv9?=
 =?us-ascii?Q?1F/Ka2uXNBmsXIHofCrq1MmPqzF+Lk8itgstrMy+mupc330EB5derh6Fk16Z?=
 =?us-ascii?Q?pYsBGr817OD6OuLp3eE0gpNrFjF7OU9uXCkcwJ+v+c1KMlxH8lHkj0/j6n+V?=
 =?us-ascii?Q?307M45oXYw/dvdE/hQ4Y/u1do1+rXDGL1WjClcA6yXXEq8HzbTo+8Pm+sEkW?=
 =?us-ascii?Q?ckuMLVdjRGbp4iq/Z7UbcC0GwJeWhIpTwCb2GDd3/1PNWMcRXPjdIimQDq2y?=
 =?us-ascii?Q?bXheD4SEH5aOaPV1zUG5FFcqvqjyLog=3D?=
X-OriginatorOrg: jotron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d02bbf-824d-4c6d-138d-08de7a07a7d3
X-MS-Exchange-CrossTenant-AuthSource: PRAPR10MB5202.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 16:04:03.4994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c97bccec-1ca6-4011-ae85-b150c2b5e037
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FtHrVL70Zm2JMexe/V+8UM9qXzyddzg8wUBkIrXN1dugTGXgzWEFDkNjFOQY3Bg6eLnqr0dR9LqEmvXfK1UKYVjr1B4YA4eLALKVhIEx+K4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3815
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 16:04:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232383

Use ${root_prefix} instead of ${base_prefix} while setting
${target_base_prefix}, otherwise we might loose the root prefix configurati=
on
change in case of 'usrmerge' distro feature is enabled.

Signed-off-by: Peter de Ridder <peter.de.ridder@jotron.com>
---
 meta/classes-recipe/cross-canadian.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cross-canadian.bbclass b/meta/classes-reci=
pe/cross-canadian.bbclass
index 059d9aa95f..01fe35a51a 100644
--- a/meta/classes-recipe/cross-canadian.bbclass
+++ b/meta/classes-recipe/cross-canadian.bbclass
@@ -141,7 +141,7 @@ EXTRANATIVEPATH +=3D "chrpath-native"
 # Path mangling needed by the cross packaging
 # Note that we use :=3D here to ensure that libdir and includedir are
 # target paths.
-target_base_prefix :=3D "${base_prefix}"
+target_base_prefix :=3D "${root_prefix}"
 target_prefix :=3D "${prefix}"
 target_exec_prefix :=3D "${exec_prefix}"
 target_base_libdir =3D "${target_base_prefix}/${baselib}"


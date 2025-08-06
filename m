Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6410C87FCB
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 08:12:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.20112.1754467948876965187
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 01:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0313fa0978=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5767e5Lm2394011
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Aug 2025 08:12:27 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48bpyf8nqe-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 08:12:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJvW3s6XiQrpc9QgX16N99jwkSo1SjgIPJ1nfMj28uqWOFD5EMAagn43pChYDSamhHhDS3GLQrPNYePc+7r3kA5G1VxIgSlFIDbs5dMH4pKxBbNFYa0ldF4KMdNoZM9xFjlLIqpe7C06UIngqD19HARaHSH/Xum/5Rt97uZofYU/1Qk8wA1ndQYV6vWsmBp9T6kevxF0CUXIfRnME7q08XzMNjTrnB5qSYXtXWZ0zu6eYdMKiK7Bvc+wiySN6Fqptziz0I/VwoJsmxCkW3Ym2hX7MLK1zrBnokDuiBefP9PdDlfblc6WIy2oxo2f6+5b67aCKMKD+tjRPINL79Un/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csv0B4LYhKCbunLVgnKB/NBNXDOtWrXu7/HitfKGR9Q=;
 b=bCXvSXL6u77LsPm2llBIEC9F4/nHMkRmx7IcWtlWJ4mXI9HlKPX6IkVkkPeUTjBv4nqCfXWXmursjANDbA+qMUtSp6d3gxW4OHvbAfUdTXir+b5QpuM5IL7gQJKDSpG+28qBzQ+uSGQrhRQUKoWRiJowDhwi4Q61krriqzm++V9MLu7v3IrKEVZ+qyK9p7qcI8O+PKZzu3ynrbafyP2dv6vhaIiL7QFnb946d8ToOkadFRm0C9F/IEFjlZ3hPFEPxCnx5QNw6rcxFn5aNMXh0pnPNX5pDfCj4sTbzlEdWxVC8AohsksEiPG0Pa0dRmqiQ71aXiGTJDZeo+MhDn3Q5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS7PR11MB7932.namprd11.prod.outlook.com (2603:10b6:8:e5::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.15; Wed, 6 Aug 2025 08:12:25 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 08:12:25 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [oe][meta-python][walnascar][PATCH 2/2] python3-protobuf: upgrade from 5.29.4 to 5.29.5
Date: Wed,  6 Aug 2025 16:12:08 +0800
Message-Id: <20250806081208.2620835-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250806081208.2620835-1-Qi.Chen@windriver.com>
References: <20250806081208.2620835-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:4:186::19) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS7PR11MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: 1045d7f2-36be-4b02-995e-08ddd4c0f9fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?t+8RmqFjq80/6cOJYyZ2Gw1PGpV9H3gJ4/ONFZbBg2PalwiKOFwSlwfeQpGw?=
 =?us-ascii?Q?Hg6Rz9ALZ4c7LiHAzTA5JZt0mluO7FQRk961vjWXKLi5RThvGDABga5EWT9n?=
 =?us-ascii?Q?sILCLDqgq4yGH2FbCzosgx/C1Phys0I8mgA7bpsVuMDRDLT0qQNYIomcNOm3?=
 =?us-ascii?Q?KBRSX8gEl3ID7hln0AKRbSG3teuPdPfJpoVeiocEAAMcRfHeGxbshKf3MtFM?=
 =?us-ascii?Q?zcNESVM+uuPlMYXNp1GQjehVJ9EahUHl9wHIlQukfBEvro7c4qgepufmUtmk?=
 =?us-ascii?Q?6tHX88bax1dCkp4vclyLg7qe8lDmpdH9Z/IGR6phS/GbBJTHmZUyydl9Po8f?=
 =?us-ascii?Q?BtvTPiUBfkx3CJW5VIFJaDltliGzYt6kj8eFjzEqUhYn/qmq5EZN1XOSpg8v?=
 =?us-ascii?Q?yopesVw9ZBjWAa4iqfKQ/7f2UmXLdArRl8q21B5udLYj02SlWP/1e+q3RzzT?=
 =?us-ascii?Q?I4c9VCFbipXg4/XAvdK5Dgab4ZKrfrQvMilFYx0OAX8cpB3nc1kFhRKrpRmS?=
 =?us-ascii?Q?q0Vn44RW6PmEvVJteHiJln96Xk7ThFIv887QQSd8g0Md6RVook9llIs8Dgph?=
 =?us-ascii?Q?uffIYsOBIxzYDhNImIn7iH10bM1h7PBkO0HO3L1SQiU2uoqU31WRHUUcqhBW?=
 =?us-ascii?Q?h6LQiyhv5ztSxIpbsucmNcql5T/qt3CDjZrGrp/czsNcPoUugoNWxrZc0kOd?=
 =?us-ascii?Q?fRVZL9srHkehhbk7uFM+Nx1X5FV1ycN/LVvu0DxwmP3NL4+eiTpSOpSzIVGW?=
 =?us-ascii?Q?WfsCItSRIJ9ALS17CBmk/rnVX3DP1QtQltxyx5HMspIJt7gpAKPIicAVFQjK?=
 =?us-ascii?Q?S81Ijilcln5L+xz0XsOzRnoQJlQTt4X/9XhPz450WiNulWgtU/yV4PQIX1UW?=
 =?us-ascii?Q?D6PfWyOttMzhO0g0rIWI54NOk0VQhbR4syucPefByGWMLOvtz3jD54KK38mw?=
 =?us-ascii?Q?QXWcuwZtmq/yVsJHX3Zahiur+VSXcE4nsXQzwl1aflnTVaVciennJKnpnGiB?=
 =?us-ascii?Q?n4N4ZNbdbs7acDCKXOmVvVLaq3LzeyZqpUqOeW84aSU81l0g4/YVudQPfda+?=
 =?us-ascii?Q?d6kS9woiswPiO26hzvZOxJk2gHgCsgHFzlsvxgsIssfjyhvyKzdlANWFiJg3?=
 =?us-ascii?Q?IKLssKGwrDjyR1qio76sZCxoucWTCLxzeWf5i/n3HuUsrfFG+87IOD3giz50?=
 =?us-ascii?Q?oWQ1L3XdEktdxzyguju588musbT/rzpq9lhFZHiB0tfUO0y6VHhsZ/jCFVmD?=
 =?us-ascii?Q?lGlRmVaS2AKg/8CBPUhaHHVDGWEt3xCmu2TY2PbC7E7JNyDw9bS8UpisSC5c?=
 =?us-ascii?Q?I9PSKYcanx/bZ0yX89OdlqXbREsG7QFCODET6wF7fMlDUTjCVCJ2W4K6dB2q?=
 =?us-ascii?Q?44G0t3C/NJhL9Ir+0Hfwqgnx8wnk9DZ44nnhwOol1P8AB86hLJdmGaiwDbDa?=
 =?us-ascii?Q?evttfLTl/+drMrmZmSOgGfTBUmVmvoiqsJnB9QzgzBKyhoFkHbpZog=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1DGY8lWa0Wmoi8lcmijr5M62dbbhVe5L9tc5KHwvb4c1uyHxb2MxpLkt0ogy?=
 =?us-ascii?Q?KVgWjCZK9s9uelXQUn2nqXOfrqXQABGn5vNZfHGLjYFxnULEw35t5aW1XPHL?=
 =?us-ascii?Q?soNVTMO6G8lgoeqqeVbdaAiGPYCkGRlD2z+fT596R+GQwoReIEK1Io/OG1yx?=
 =?us-ascii?Q?V2QY2rLUuuLPMghZNJErMQWRYv0xYMu1pZ6tAhbLiPwtnPFcqEnQ0aH3QU7C?=
 =?us-ascii?Q?2EH+Z/6NeKFPODfFRo6Vmu0/NA2UhK5mweaGhc0DZUOC2dHk0SU0noVs0uXR?=
 =?us-ascii?Q?DOpuF5ZpIlfQU8iJsROg3k22ZTqYDkyhC4eGnUlsc9Fy45pI81A327cOk33C?=
 =?us-ascii?Q?Q5mwB5xcqqCUVfuXtYMA3Qv/J14VmxCdDpTb5OkjCTNRlrWtJ/sEihT4skuj?=
 =?us-ascii?Q?EoFHrJY/5JPd2a8b71wKp9eMw3Fl4X2dwiQcXUvYGfsnavKoZEQZV8M+glNI?=
 =?us-ascii?Q?wEM1twzcRHDcAilyhp71GMGVC1qkwbZ42k1y58WlEwTEuVgEp3MN5UVZuFju?=
 =?us-ascii?Q?sD7s/2sAGpMQ7MZsdQ0w2UDbVZd0jbVtl0RgZ02RwdCkFRsfWGrCBdjibF4u?=
 =?us-ascii?Q?UK99yii6eAD5La0W7QRTSTSUJHTurjMYk+hZjx7/HJlanq0tv7Uasr+pRZU+?=
 =?us-ascii?Q?Xk+S5u8lL1YVRqZJnhhogW0/eR5ivY0gLdWgS99MS9hZu7X3/Y4hVfC/sI3Z?=
 =?us-ascii?Q?0tHGm9r4eKFC+NQdMhQtleAJCqEIfqffLSZJoFrBGUvBMZqyNddbOtBGZdet?=
 =?us-ascii?Q?Bpp8WiE3eXamJqq3ugoNyLg7C5dseGae69zMC1LQf99vqh6nCbeo88E54Wmk?=
 =?us-ascii?Q?4ckDg4uMW6ru3drSefdmvFy3rRHp9S9L3Ur5/VdDHH+PBIz40u2i4SPPvPJU?=
 =?us-ascii?Q?N5EI+a9Zu/RvvWEDmKdBoz4c26kzw/BpOHO+sY84wE70ZyNJMqDdxgIJa9FH?=
 =?us-ascii?Q?aaFcT8+3JkvnmGUudn8+WRVHVRynXci1JPhRp8my9z4hi5/yRTov4o1WWlDG?=
 =?us-ascii?Q?fCrk4KjbT1r8TOoIpPuCyRPK43g9sqdUaE1hqBFLBAywcmaQqWvpAWp+6dCa?=
 =?us-ascii?Q?2M8p2FBLDOvCV6jaB2+Zx5FTYS1n4D4GFK7UfvPAg0lBwkVZb6a0KSBvWmO6?=
 =?us-ascii?Q?xZBzhNbsWVdw239adKhqsz/UWqdLnaGCrjFCCIsHnKIDKQTCPsFo2PEppNVH?=
 =?us-ascii?Q?XJmjDpAspHf7dj9iKA0nxIf6KjIfSe5bU3OGUWubMUlNRYE3WNp27wYmWUOC?=
 =?us-ascii?Q?+5S2CCRIC3jOFnEcVWQ70d9n1B7xZnuyKAsKQbn8ugi0xChRbUHfb49CnHtX?=
 =?us-ascii?Q?QnIgiV8fLYPG3Ht92f+uYBFcr7l9iTj+gtDpH95xgv6J9NGgAAKOPF3ZKs/y?=
 =?us-ascii?Q?bPJGEHPJ2F7UhVTUoVMoE/Ub7blTr2IDxeT7zLXow64DY4Pf3JyLV54LzzIU?=
 =?us-ascii?Q?+BOkP8Rm42uyXoYlevbs58o+aml1ETXiuavSsGSN8iAQBJdM8yCwLl9hmlKy?=
 =?us-ascii?Q?hogwMcLwRqWVQp2qdKK28EMKKKuUi2pKdsJy7O+AsdASb/4YZ6iESrKnh4m3?=
 =?us-ascii?Q?k+0JxU8L5KYeaybaOCpwCBu2MwmtUxhNFezExTwa?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1045d7f2-36be-4b02-995e-08ddd4c0f9fb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 08:12:25.3437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D1RW3kcZgcxethLTE97sNBve7rgk3ee+GQzu0uD9dvMtXyf1vNNrfAajm1P2/RD+A0AvpXmNsc4r3LjTx2Pr9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7932
X-Proofpoint-GUID: hz8dzvKvjABvUAw8MrXwlIoTqpoevHgP
X-Proofpoint-ORIG-GUID: hz8dzvKvjABvUAw8MrXwlIoTqpoevHgP
X-Authority-Analysis: v=2.4 cv=ZpHtK87G c=1 sm=1 tr=0 ts=68930e6b cx=c_pps
 a=Yhwmj+jW27PGnLXsYKQ0lg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=d3C6cGn1eRoA:10 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=db45io-_UeDe6lnvHNUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA0OSBTYWx0ZWRfX00HzxFk0f1Rm
 PkfhrSwNzlmEM3B01XTzzcIge2hcb8STPxhTFGGnAHRwG75mDqOlJWl58oO1xnZDKTmdsELlqsw
 Jt+aB3lIUSGEyA0L/6K99pHXnk2CXtHV4UPwSL38ELbHoezvWEvEG+HBUsjmRkVoWx8R4T4i4W7
 O8m6NUzw2eYyh6Lfev2stemtTdvHvwgByt6ZjSp+CJrrFwYq87KaErQpSlIhSZCXbjYmmSxc1ef
 m0R520cV5gHxBMYajDyIVzbP+kscEhyvLF6K50eyh4r2L+8yFvUCQxEh2DhMS+kxj+hiVTnthoY
 yN8qwI5pFixqfOQ2v+l2gFDWdZNHPaDVFZ6QVmXy1NY/EMBgxqEoslY6XgQ1D8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 08:12:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221502

From: Chen Qi <Qi.Chen@windriver.com>

protobuf is upgraded from 5.29.4 to 5.29.5. Upgrade python3-protobuf
to sync.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{python3-protobuf_5.29.4.bb => python3-protobuf_5.29.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_5.29.4.bb => python3-protobuf_5.29.5.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_5.29.4.bb b/meta-python/recipes-devtools/python/python3-protobuf_5.29.5.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-protobuf_5.29.4.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_5.29.5.bb
index d39c5e9790..14ab3237b9 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_5.29.4.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_5.29.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "4f1dfcd7997b31ef8f53ec82781ff434a28bf71d9102ddde14d076adcfc78c99"
+SRC_URI[sha256sum] = "bc1463bafd4b0929216c35f437a8e28731a2b7fe3d98bb77a600efced5a15c84"
 
 CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
 
-- 
2.34.1



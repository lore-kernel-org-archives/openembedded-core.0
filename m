Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C21C83F09
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 07:08:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9592.1752044906389923825
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 00:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9285e3e2ec=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5694e2IE004878
	for <openembedded-core@lists.openembedded.org>; Wed, 9 Jul 2025 00:08:24 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47pyb5kr7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 00:08:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vWMSvrSOhiV31ZhGuBcfO5CRrQC9zTxyrN675+hMsaTEcJPhcjmty0gxvGs8YNVa27XTy7aAnz1s/l+6IpdmlOgO5eWiXZPunkDIQwaUnSnSuMgw5YZVcngRJwyseDddFjwhCCDI049zGoE++O82wQJm+BKK+VNVkW5GofHi9ZvvEujlw4eg+UssHCrYAAhyOUleAAm2ur5Hq9aZR7UU4bPG9fBfxTuKuD6i+TY3ulA8MDQb2iu2VRxBnuiUCzve8dS1xYeZ03Y+oYMQjMvT4wgmiuuo0xEYxxbmsEFpMlVFObxN3ooR8Wl6kIIv6IkBT63GszWQ5HDsGSNK15eq+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UF8dPK2dRitgYwvb2lk8bSL2qri00vacCdfOA7Fl1AM=;
 b=dDfRLhDeu+0aG7S4ORWIdS+fWH44wuhdK8UbFJwEuDwSNZ9gwG7N4QqNdyUeyGuvusZwYq8TGXl1bFDJ9dQDMIzjgiUP6Kdjpl+IA956aokQVF4mzBI0rzC4s9hro5hnaMrCLfgLhmbWA2KvMva8JW0jLpc/XKFsEq/ru35BHNVW0IfirvECZA1G0b6c1bJaf/86t/zIzfpClfuDsoyQrG1dbJ6rx2Cx5vZhK/RkprOE9mLNBoar2qZ6kWMS5CnHq8jvpuHJkcZbClMVKNdfKmXJ26gCRbB9pLoGD4bf32LGI2JcHlPB3sX7/u2t2plwS6UyTLL1o3YHnKXCSspiTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB7545.namprd11.prod.outlook.com (2603:10b6:a03:4cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Wed, 9 Jul
 2025 07:08:20 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 07:08:20 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kea: set correct permissions for /var/run/kea
Date: Wed,  9 Jul 2025 15:08:04 +0800
Message-Id: <20250709070804.2417224-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0130.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1::9)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ2PR11MB7545:EE_
X-MS-Office365-Filtering-Correlation-Id: e7da4840-0566-442d-e518-08ddbeb762a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Hs7DK3jTA9BcdAz6yE8xdxsfLXTUUu0OQrmh6Oi8XUsXSvOO5nccCOhBLMcn?=
 =?us-ascii?Q?XeBOANfrkrT8E6uK3nBK8tSuwB3MhVpBQ/LN8SXri7EMDm76ibgzR0ibQg0n?=
 =?us-ascii?Q?k6uCcSirZfOBpGmr0SaAhV76hgt2GATE7+MfMa3TnkkdRmbgTBBZZ10/yHcr?=
 =?us-ascii?Q?jCLh6q41PHbivDDONFTXu9V8TjklkiDxuDKG+uCnFQVnztsjBbDT9JPMYyOK?=
 =?us-ascii?Q?WhpYzcXwGApoZ2Sq97upgYqiWRTzTkKUIZffaPwnFFkXQIIGH2GKTDn0MwX1?=
 =?us-ascii?Q?Fy1odWP6NJYDv8M9dS2Cjzl12jcQ5PGPU4/a1fpGMxDiAxeGUTN93fNM5YQG?=
 =?us-ascii?Q?UVsDuFk3ZR81300/Ntp3mqIjcpCx3osVYYMltr/y6xRHc8CkMDcoDVSUvjR3?=
 =?us-ascii?Q?YXZwGWoWDH/T24CuFr/85zGMxJJgDVwwdlNz4yr0R/3ONeNorZmEfwFzhNPb?=
 =?us-ascii?Q?ok1ZKHF7Q5G99kRLDMmSrfnkrZcHxDLRL4j9w/9ovB2r++0/AB8vRuORze5F?=
 =?us-ascii?Q?hWC/hOt3w/fDN8Ac+pYPTqekndIwq7t3kEPPXnkWJJ5GWF7FQ+xXGqGO56cn?=
 =?us-ascii?Q?t9Jv4HxPzIURvXxH7G+PnjvZUxVmPCiqSveHynOWKz+MWh4dztNkFVuF4fSg?=
 =?us-ascii?Q?Gbf79zKL0irjGreGPOdeoqm7MgsBZEWeOeFZsjRTnQfDM+epRnaY9OrQksEu?=
 =?us-ascii?Q?rg6RlNlRoOYNNQDKv9xQ2hk/wf6lkwNOftIyinZnk8U4EZB5jmpqzGBwyJw2?=
 =?us-ascii?Q?4hFWZkYqBGq1JrgrdLFknrsWwVt8nxOep/Nt5bsh2gxFl1sYQ9ZG3C7XQ3gS?=
 =?us-ascii?Q?WeXKYV4S+5DSl6btLM1fJBP7Y5sh0Oyr+NgtX32vs8FmzMOV25TfmEC7K6or?=
 =?us-ascii?Q?Sws93V2NbnDeqKnxSBzFLFMf8R4wR9PL0qO58f3KYY1hZaZASYmUgHzthzch?=
 =?us-ascii?Q?zGQhEivoY8r3rEnCb9bEXJDKOn+VlJuYnzD7DsyTp2jTNZeVZsLV2wuVguIz?=
 =?us-ascii?Q?uRMyHSJMp/0EiLpZQOTPZl0RLlhmHmI3jV8fkv+aymwoBeWqUyQDmbttbnkr?=
 =?us-ascii?Q?wdaU/d59UVY39eERgVd5em5fa1EHmm7LggujxNld2j5LNgYpY3lX97OHreaj?=
 =?us-ascii?Q?ujZB7Kx0e8zDVeJ+ihponahfV0vYCQcbo5d/rYmPfhy/uDG78h25XQlMPULx?=
 =?us-ascii?Q?NNGLkoL+lO6l45itImjspgm5z4aM11Vq535HgOeDEO42o6kzKM+8w07nc/xZ?=
 =?us-ascii?Q?VIPLr+YZmK06GXDMcHymRi+oi9aiMmMXVR+oCPJMbjWT8XZTZoEMhT9pUnwK?=
 =?us-ascii?Q?uuvp87ss0rU0QeSzR+B8cuqAzR0jQ1oSId5LQ2piqUVpqgpNwd3R1oc7Em1q?=
 =?us-ascii?Q?YUUTNX7SLpzQZtuhTB8qZxY4OruFHCnq1TKaHxzdCklfdI9DgX8FybAPur4f?=
 =?us-ascii?Q?vIKKvZjiI6o=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2O0gCubpYGDdXlPhI4ps3b2nj5Ikei650ibehzlI+Hn0NCKqUikjCm5fME51?=
 =?us-ascii?Q?Dil16rYl/YmkYrCnNNXe4yz3Oune6Kzq83zPpytQFSU2RnqB0Zp+zvfh8He/?=
 =?us-ascii?Q?m2ZqYLYfw4lb8eM6cD/eCYvUxmKt1kZMo7u31mY48l6YkR/pLN45PJ1hNoTy?=
 =?us-ascii?Q?TnDmO1dPDDEqYMML5iAEmk/AxBoUozEm5ByP59n5sXWsFfUj7iTtMsmCQBpd?=
 =?us-ascii?Q?Hzvsxo5KyYZ9wq+pzCJhLq7Ik25qVK8JfSf9UR3ddgsThtsxuEWgVJKZ16fX?=
 =?us-ascii?Q?1gNzTLwpgAnUnCWvV4QWamx2DPRO7wAMCR+uRXNqcFCNAtYJUaaxch7Q59Go?=
 =?us-ascii?Q?xr+LFJKRCwEM2XJ5craV/ZtFa6ebkeoW56D9VmFyCKwsBSEKJu0a1HoXNyqu?=
 =?us-ascii?Q?sGQvaiK9qnqifDcSyuY8k18D8VXHPg/ZkyGfGtTbE7jh8srGPvJj2r0KNTqp?=
 =?us-ascii?Q?qUMHQ8BYcM37EwyX08mzjKyLcEDjZsQBPeUuTDDhIkvuhU6ReMLCEmNzUkZf?=
 =?us-ascii?Q?y/JY4JfpB68CM6ekksSU8T1I+lHJcw/k1lE5FZQfR2GHIF4Cugn6p8mH+nif?=
 =?us-ascii?Q?trRiQXRuWhPepWGnarKbL0ni7JtgumPm2I0P0PRJtJM47nuOSgzXH7sexc1Q?=
 =?us-ascii?Q?SPPXnUog5xp6m3lPhILAXLBosU+NeSVtB587wlFxgDsdwkeII6PG4Kbr+8Uv?=
 =?us-ascii?Q?H+zDiemoqatlsi/QRvkZt6utR0AYpAlDuSidNqjCeGl9jZpeN00UvbG9YJB3?=
 =?us-ascii?Q?l0CjhtbEK+Ai2f6D+BJvhCBQYXck1UQruptmuTRjWFsMnFXI0HIJdUlgbpYk?=
 =?us-ascii?Q?MR5Vw18OjU2mF0cveB11NkmNPNmQB/yVVYvvwurE1mr+BVS7I6npvw3wSTcR?=
 =?us-ascii?Q?e9+SkUb1vDFz4Ny39YwNBt3PbX37FjEw1Dz81fgKkRxNqgxTlRPBQ7gJ3hQh?=
 =?us-ascii?Q?ZIBUTdz/ybKqTuZkb7DHXv2XSgpJJJHUooaI+/s5BGGajc9IdZXH4926owgw?=
 =?us-ascii?Q?zs05M6BMr/T6ZKykHsnsX5OKj1r1FEyZivUCDO+nxCWgtjv0Co6vJL9GOO4A?=
 =?us-ascii?Q?QYuys40GO6oq/Nz/B6TMiZETh0H9NiGMTomYSsvC67SqSf7PY7GQ2BN6Nut+?=
 =?us-ascii?Q?JRU3p4mmMWkHPf4n6tBcvUvB1e2qe1XLgbMJ4HR6kVZ60VYSjpYIYRNfa2jZ?=
 =?us-ascii?Q?fzNpnHgNcYky6ufcuqFW6+LLhE4NK4dWvPW15br/1oZarqJ/8Na2pxTdrFAi?=
 =?us-ascii?Q?elktWpa1900AVT8pkjo9bqVyaVK9Vp/0i2Jpr29RyiT4OdiCsdprDbJqf2HJ?=
 =?us-ascii?Q?30lUN2js9+DutHJ+qsLcKj4HtE08G5NoD1l8ZsTlbE08gLRCZLOo0LupVxVq?=
 =?us-ascii?Q?4i1pUCfQXEYsIaXT17YdWMO5IpAUtcWM8DDSfE8i1+1eR1/5ev5qUCYrG09I?=
 =?us-ascii?Q?37WVG+eActA7102G9VLHtAvnkYCQ6C0EXwHVJNx0mnHdKYYzx34+Guf4T81J?=
 =?us-ascii?Q?wPM+6txUaRGRotxs/V3zYiyMi4sg/zkaQHzzuhTN7q/dpuR24uDyko+Cc4yX?=
 =?us-ascii?Q?HhZ2qnlww7NSc9OfNZc8b/ZcEnMnjNHKnMpbn+oZ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7da4840-0566-442d-e518-08ddbeb762a3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 07:08:20.1503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QJTt2jC1bkGG5KBUAeJl4USbldjMLkaHRGNNE+AcOpgLJnrSteitqf5tDnZ0hPtuePeVLVBzB1UW6oeWuBuYng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7545
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE5OCBTYWx0ZWRfXyqiwYZjheHeO srg1BsgOZ+XYJCRanJDqwp4r8w/bDxKX0AlX8amW5W44h4/ndn2XKBYZf3QKsXS3MgBWTj448ro Lf1hhGaDilg1s/2wDoqE8F/UC/pmtTw9d5Dn/jzs7Htdohc42r04XmTTwQI7E0qHV2gMRVt3dSZ
 mhN/GMindKDKlBnI9MiK2vlFx20TGGEIGeDlScsrFvf0cElSSPRUdVATiKzKqgyfaTN9Zn6Ihic 7NrrMVRpfW7OvvuLoCpj6glbvAdQk68MQWSYbfm4iZKoktLY9VeZKeybjk19i1jEo1I/iPreLKj meeQvx+cVlwgvb5gpPjOtLKXBwmlY8QeFaxoTlCpYXkq6nneys3rCSJyprJmr0Dc6ynI9EHQJDK 0BOqBHlE
X-Authority-Analysis: v=2.4 cv=V5590fni c=1 sm=1 tr=0 ts=686e1568 cx=c_pps a=x6qgWyjPDOdqnx7vgGQFOQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=SCo1hh1FAAAA:8 a=t7CeM3EgAAAA:8 a=mvNiJOInIswJCcDHtC4A:9 a=nwb-CePKZZm3gL-ai9HY:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: FsehLUQ6jrGUr8HFF2_RaiJ8tYE4I-dz
X-Proofpoint-GUID: FsehLUQ6jrGUr8HFF2_RaiJ8tYE4I-dz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2507080198
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 07:08:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220077

Set the permissions of /var/run/kea to 750 to fix kea server startup
error:

ERROR [kea-dhcp4.dhcp4/445.140718820303936] DHCP4_INIT_FAIL failed to
initialize Kea server: configuration error using file
'/etc/kea/kea-dhcp4.conf': 'socket-name' is invalid: socket
path:/var/run/kea does not exist or does not have permssions = 750

This permission check was introduced by commit[1] in kea 2.6.3.

[1] https://gitlab.isc.org/isc-projects/kea/-/commit/43bba7799f6892f739b4745b35bbeacef3645ad3

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service | 1 +
 meta/recipes-connectivity/kea/files/kea-dhcp4.service     | 1 +
 meta/recipes-connectivity/kea/files/kea-dhcp6.service     | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
index f6059d73cb..aec6446f0e 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
@@ -6,6 +6,7 @@ After=time-sync.target
 
 [Service]
 ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
+ExecStartPre=@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
 ExecStart=@SBINDIR@/kea-dhcp-ddns -c @SYSCONFDIR@/kea/kea-dhcp-ddns.conf
 
 [Install]
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp4.service b/meta/recipes-connectivity/kea/files/kea-dhcp4.service
index b851ea71c5..a2ed4edb59 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp4.service
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp4.service
@@ -6,6 +6,7 @@ After=time-sync.target
 
 [Service]
 ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
+ExecStartPre=@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
 ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
 ExecStart=@SBINDIR@/kea-dhcp4 -c @SYSCONFDIR@/kea/kea-dhcp4.conf
 
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp6.service b/meta/recipes-connectivity/kea/files/kea-dhcp6.service
index 0f9f0ef8d9..ed6e017d0c 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp6.service
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp6.service
@@ -6,6 +6,7 @@ After=time-sync.target
 
 [Service]
 ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
+ExecStartPre=@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
 ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
 ExecStart=@SBINDIR@/kea-dhcp6 -c @SYSCONFDIR@/kea/kea-dhcp6.conf
 
-- 
2.34.1



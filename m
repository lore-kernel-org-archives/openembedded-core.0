Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F70D68BDB
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 03:39:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33366.1766029144303019177
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 19:39:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EFH0S6gu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44473d6ac5=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1Gv1T3177379
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 19:39:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=bYWl1chsQS5rOzoL6oM3
	/twY3yhaBlozK0swXdyqdIQ=; b=EFH0S6guImGL5PRFAbvME/kkItcVzWQthtH6
	sQkju5MwtemxqDL5DnFqernhCeNnOeuJc9OFjcJa/ZUcDoyQFkH5g7SdHWxlameS
	2akXCJhSInmsOa/pDjP6rR37qMvzIWceTriUVrFbUgdgoCaUl1JCM4GYapXQbp0q
	WCEXdl1aVtIjkvXv+eRIs1r5hVYzMAXMR0Of4+K+oBdZ9gisuot6HDoTlcDjHY/5
	ivY3HruaXCEWU5hDw9QoeLUKCKyureroPOpTAaMQk7gv6/X8tfzNZ6RyZoI56Q5W
	vKzFPoFoG0+9uDno38hDQqscx92YKt1+U1OrK0yOdaN+b6GxeQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012008.outbound.protection.outlook.com [40.93.195.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k6j1euv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 19:39:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tjEYccvK+uLiuQKZvWDROZPY3z++v+R+uq7SFrSn1q5pPIJN1sIVJo65P4wpQSrkbYQfnpXntON5R5rZXms3Heh5bg4ZupZ//6piWpg0lAUJZVStHwL+LB4YUX8AUjuE0lTtPiyBp8CsV4wO6o9QEEn9lBoAU10bjoFvOeqFVvPAZR+B5iKGC9xnNLDzwMhv+8bOmNtlapcY4nXF5tFyFhQXv+Pjk1voikmkusF9oFue+m984Qo2nnqLXui2zNU3g8ojhOpFomQOkD5JERDhAQimrg29eXBIOLXoOa3pfP+XYCJBKJYLGMU1thbOMmLRMF78dhtSANSc+zmwdbWVwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYWl1chsQS5rOzoL6oM3/twY3yhaBlozK0swXdyqdIQ=;
 b=jTFIdBNF/kNNwPi2JMfoYPmdS8/HpmtZQEvAC5Tm3blhNKtvB3e5ZDPzlkRh5gTSXb769C/rVTjpcwqJR0K5p04OmXPhROxUF6SyctRZDNeRZaWG0kMJi9MODxFpgqQsqJy02c/QdDZ7d7eVdyZNNFts6XJARRfLDmeVL0KoQDxVDTWIJSmKRG78VY4NM1ya1cvS/qpXttk+MxfWJRMxKMKRa8KDh+3EcrOKLa+j4n3U2S+O/7MzYvuC/i0O4Q7vhSBySfA8H97qs7x1RqbVG7w7wZDZ0GxapGoxZdocMGswrqE5pVu53p853lvMJ2nwvyvrdMsls/stE7jXzAN0Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW3PR11MB4652.namprd11.prod.outlook.com (2603:10b6:303:5a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.7; Thu, 18 Dec 2025 03:39:01 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 03:39:01 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] kea: add volatile files to create runtime directory
Date: Thu, 18 Dec 2025 11:38:44 +0800
Message-Id: <20251218033846.107161-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0219.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::15) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW3PR11MB4652:EE_
X-MS-Office365-Filtering-Correlation-Id: cb1e4e4e-c16a-4b7e-fb7e-08de3de6fbe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YjhSRYFpYUGtJkyaKWJqDT0pecnWEKxDUu+b1//h+xNUEgAqUbFq8Xb0ouex?=
 =?us-ascii?Q?k1cy60f3nifyvTu/gO3rhpUTzvWQJJW+eoERU7lDZ38YtNy62Hs7G6cVKo8D?=
 =?us-ascii?Q?lhBY/ccJ0gnR/PkSWmBSpnlvF4RByF8bjFvDj72TpuPF11DAkPwGd9Ug9bz1?=
 =?us-ascii?Q?vo6CBlek8jNy2snD2pqK7oSTyRBlgKXBHi4W9ksyGtZx9QV9H8RxN4PVPXB9?=
 =?us-ascii?Q?JQ5JvUclwl56dkwIZPsHQHtkGmVX1IsnaUwL7q0u42FAClJ8QbdYgasbXCUO?=
 =?us-ascii?Q?ZlVS0NpB9qtO+xuWy8qIWnqHVHUrGvIvG9sJcrfswTtZtTGp7zCctWBKK3PB?=
 =?us-ascii?Q?u0qCIs/C0xsnBqnhRuDNADV2XU77v9iSTGVJB7C14xC1Xk8EdFnlsgyu2KRk?=
 =?us-ascii?Q?KfBWKeZ9ccWtxNmbatD/tQJClDGZAZu53JadF0iQIEfnhU37pr75/hVJ7htW?=
 =?us-ascii?Q?dp/W8KMchhPwk6BSdiMRMgoSfRO+lCAmun7BM5R46xOC/jhve3Jc8j8W+pvo?=
 =?us-ascii?Q?B2XlVte8TxudxD5eOjvcdLWsK/zWfJrRY4GG6iaLVWarOfJG50wLjc/yc6j3?=
 =?us-ascii?Q?kv1ReApfFzquI+cJZXTrmCV5lvyYCUGRt6v74fbC9GvqlwpzFfHeebM1D7kU?=
 =?us-ascii?Q?lgwrk9ublof2xUAid31pHZl1N2W/Y5ywmGNn1/3M6oOpEi9pvDFNKQ0FkLbK?=
 =?us-ascii?Q?H5C7xLiBEvSSiFXgDqL5AkSGKmsjkAYtBKhVifD7noY6+9GqUd7bdeJzg/fH?=
 =?us-ascii?Q?gIzd6u9ncDiT61YVWj7AAp+vE6hb6b2C1idIH4af1Su2h58HAWU/KQH24ueA?=
 =?us-ascii?Q?vrA6vw9EMqUOy11jjrfQYXyyife7B1M9iIRVWaUtTW1ma76KQ3WpUPvs/51y?=
 =?us-ascii?Q?Uxqw1EhRAwtIH/3jPLT9DudS2zFeEQEflHeW9/a09e2fniARWnA/YKIxdF0K?=
 =?us-ascii?Q?ngeVxoEOC4MeoUCzby9yySJNh5t246Kb6DhcR1xzoSRSgzkmzbBiiuToESzG?=
 =?us-ascii?Q?nseozUB+QmhVXxpsf8rQCWQbFgR361CKG0HsI/IG06D1zQEwS9/6sOuNoBoR?=
 =?us-ascii?Q?fEbQbwb+fGLxgXE+RQ4pLJEwetIo0/PXV5bpcvhcC7h3WboRF1Qc99DfpBdk?=
 =?us-ascii?Q?MwhARqCbtB9bwjJyjEnuOmD2jQqD2RtHWQ8UJZeLFgu0jKVIVg8JOw/DTY/B?=
 =?us-ascii?Q?EbtwyfZGS7AKhe58TWw5U8oyJcT4fPUiEY35F285QMHhlcm2PZAT2FlBJmz7?=
 =?us-ascii?Q?pMnUFXlD8eKwwkcEN3MWlrhjGEY3Nrxdk9PqJoL89YoEZVGCGADwMcHQajTi?=
 =?us-ascii?Q?aSOxCcDYckaaaOuufGmv9iakO/SY33nNj1bK3jx9ryyzTQ/Mth5bOmYP+OIF?=
 =?us-ascii?Q?mvLzlSC84aqDdfwcixQr2BExZnNwFLZyld5tmOao1/27Ij9WLLxodoF+o//W?=
 =?us-ascii?Q?DPQHcySSxvsRcWKnR7TqEDWRIu1LfEgCelvKoW7aXoPHZOlEiF/Z4e66kYZZ?=
 =?us-ascii?Q?Kicdup1esJraxwLwMxD7ukiC4iguL5XWRzzz?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Mmqtudz4Wfp0TI5w5xrCmGINKKyduIRMsRetmB/McAgWn02D+uoeZo0SVIwq?=
 =?us-ascii?Q?jK4bbXsvStLqOqSdPUKeGLg9HtWbufNJfHYVKG/ZhnM1YAvkKxSjV1Y2TJtv?=
 =?us-ascii?Q?QWGDbHHyUOTlH5OG4McEdmaauSUHmhadrmQrTaI626q/UnlvmvnfBxd4bCXD?=
 =?us-ascii?Q?tMCBe/cESM1LvF0FHTIB4r372zYKGzjfwD6TIFkdKr0/HX3WMIcfTfdcoBDp?=
 =?us-ascii?Q?ynlo6EeSEwfFaJc/Q5uEnvPyn5Fyt0mZsvgNbyvJ3hgxuW440ZekkPPUq+ue?=
 =?us-ascii?Q?cQASJIke0U6xRFLxRz+s3nTaAeoI+/CQX1wDW+rV2/OiMUj87SyTU0XQdCeZ?=
 =?us-ascii?Q?DBrMvUCCZA80jEMGAzpM5Y6fdx8zGVsoZc0x18icv7mcToSvQ9PuSnzibQ6N?=
 =?us-ascii?Q?civ9VdnLX9f1FyVkru6NRwEhhWTLvBRWdrUSSG8D71AaGESAeWZHQuCBenk9?=
 =?us-ascii?Q?FRSoHcQa8/vNi8oGfVB/FhMVUuBxNXn0mjlBmyjgzm3h/8A0rNHAq0fwrLPb?=
 =?us-ascii?Q?vn1MDcYZ6cUbCVjWdTb47clJGClLRVwt6tB8VeQo+xmvXvrjIKmVsHME/1ua?=
 =?us-ascii?Q?zid5y6TmFRL/aKW8V5qasp4QfJT7bOBBJx35d22vEzIBWgVpVoM8gk5cgqRv?=
 =?us-ascii?Q?b2vLfy/j7cuAV5jt2CulR1t0bxt4VPJqutWlze7DDAAuJPakKZNvRL2hOI71?=
 =?us-ascii?Q?nnEE5kL3wf4VEafB5zujVyxexWYQCy7pIvd7NMRcD79aug0n2XKUzfYGf04n?=
 =?us-ascii?Q?6qhZTyA5gNnMYSwxaxAYGv5P9sgv77tymwuI5c4iefizSTg4bUYZ/8ICkNkm?=
 =?us-ascii?Q?yKS+ShU5purezaKaNcPEZPrkOD+Ztcs9rrFIyGJju5S0OOJWuQQngNBydGeC?=
 =?us-ascii?Q?nIVPq8JZVpL/HFIvVY/T3OUTHqALjfawnG9+cs0JPz59WEdrr5Ufyu45pynU?=
 =?us-ascii?Q?3vL58KghFxaXPxpgmkSe+gbxXh5EuLnOojsAWCfJgQ+GE4t7abMPHle75zKd?=
 =?us-ascii?Q?2NjbQ7/qEwbU3ixNMOKuOuCmtnnnN51/RZ+G8z8ixJ5vKBKwpo/5m8EC6fIT?=
 =?us-ascii?Q?ISBPAr1jlCa1I/GCnCB4AwWLa3zsNagAS3AKZjBzWHvKLGVr+tInQDBMf42d?=
 =?us-ascii?Q?7SZsXHuqgbNmoPOvIufn0LRFTMwpXQGBJ8xjTPLadzp1lLy+MV3EPvc9absC?=
 =?us-ascii?Q?nmCV5umDe6oIO2MoCTZYzOdD5WgtMyQW9RyLfWb8s5sy1Rs4kU5EQ65gmt+Z?=
 =?us-ascii?Q?2GmPPthorbox6MuKZGHNgevcsrocYBm+eoD9+KcfRx2JK7tE5JhbKEejUV4K?=
 =?us-ascii?Q?8KJbfwllk7MO7RZww5lZChP+vsOc3Q01JngfpxTXI0mkYAkC1Kp4FoC7293Q?=
 =?us-ascii?Q?x8OONqAOgq4gMDFl+nSjIXBbeFcJo2Tzrh8p35n4KIVBIiwbAh+bQY1i427J?=
 =?us-ascii?Q?E4TdYHHkOKFp1dmMjJj1ead+3jk6v5vauEKgMnPUk3LjNDhxvTfyx/g8dMw1?=
 =?us-ascii?Q?QkAnLzmKTP7sZirqHn+LI1ydgkmOI0ZSy+l8+ewhZm9k86JyHHwv1g8u//Ll?=
 =?us-ascii?Q?u6UwPDV4bbABpzvkwv5X+KgpP2QsOJIceyEu/3ts?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb1e4e4e-c16a-4b7e-fb7e-08de3de6fbe1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 03:39:01.2343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FPfbVPkC5lOu9NoRVjNGCZm9uaRY/Dsg3fBDolH+U4D8nkBlZhW/gcgFobbUMiyn3swOwLH5WQ278U2wnGgauw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4652
X-Authority-Analysis: v=2.4 cv=ErvfbCcA c=1 sm=1 tr=0 ts=69437757 cx=c_pps
 a=5ppPJOB7bB2hO4guNQQ//Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=SCo1hh1FAAAA:8 a=t7CeM3EgAAAA:8 a=3nJuH_zVIihW8nez1bgA:9
 a=pJAmF1FKerIFfj4g:21 a=nwb-CePKZZm3gL-ai9HY:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: pEopzMr4dIX4d0sFTXh2_20BFW7pFNCX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAyOCBTYWx0ZWRfXxNe4MCftOa6X
 n3OpBX3hfl6+nnDiXq5V0nwU9WPIJhfwUK14XrJFLPGQmspua6uw3rCDQp3KkK8QF2z847A3265
 n1B2Ku/ZOsiIybyPQuHgvwDdp1Evsb6SNbJ3Cw+wVWmUNm6xrvVB86yBKCHKBsdCT3exqMW5CRH
 H9SHI2o2/FkVyIL9C2zxMSZkiNkDGNnzh0b4pjMpnhYHCLmYlPgSWOGsfdE56aClIArB9OS11Mu
 E1PhLnHKIC6/l7vV0rWpJE4lZUqzyqKr9aiU4e7YC9ApWc0MYB+gENiTBK8eP7Z1PNSVhyvvjZC
 fJQdPsRE+xKNnwTGoBrD3FdFxlzljQCnUj+6gMIOtGfFAMSi2GhE2v6ZhfAF2u97sZIZlU+0syO
 XFe8lhl2i0KchMtUWCP9RQcccQFCVQ==
X-Proofpoint-ORIG-GUID: pEopzMr4dIX4d0sFTXh2_20BFW7pFNCX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 03:39:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228085

Use volatile files to create runtime directories, instead of creating
them in systemd unit/initscript files.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../kea/files/kea-dhcp-ddns.service           |  2 -
 .../kea/files/kea-dhcp4.service               |  3 --
 .../kea/files/kea-dhcp6.service               |  3 --
 .../kea/files/kea.tmpfiles                    |  2 +
 .../kea/files/kea.volatiles                   |  2 +
 meta/recipes-connectivity/kea/kea_3.0.1.bb    | 43 +++++++++++++------
 6 files changed, 34 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-connectivity/kea/files/kea.tmpfiles
 create mode 100644 meta/recipes-connectivity/kea/files/kea.volatiles

diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
index aec6446f0e..fe09ef6437 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
@@ -5,8 +5,6 @@ After=network-online.target
 After=time-sync.target
 
 [Service]
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
-ExecStartPre=@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
 ExecStart=@SBINDIR@/kea-dhcp-ddns -c @SYSCONFDIR@/kea/kea-dhcp-ddns.conf
 
 [Install]
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp4.service b/meta/recipes-connectivity/kea/files/kea-dhcp4.service
index a2ed4edb59..a48a230654 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp4.service
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp4.service
@@ -5,9 +5,6 @@ After=network-online.target
 After=time-sync.target
 
 [Service]
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
-ExecStartPre=@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
 ExecStart=@SBINDIR@/kea-dhcp4 -c @SYSCONFDIR@/kea/kea-dhcp4.conf
 
 [Install]
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp6.service b/meta/recipes-connectivity/kea/files/kea-dhcp6.service
index ed6e017d0c..a441df9ad2 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp6.service
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp6.service
@@ -5,9 +5,6 @@ After=network-online.target
 After=time-sync.target
 
 [Service]
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
-ExecStartPre=@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
 ExecStart=@SBINDIR@/kea-dhcp6 -c @SYSCONFDIR@/kea/kea-dhcp6.conf
 
 [Install]
diff --git a/meta/recipes-connectivity/kea/files/kea.tmpfiles b/meta/recipes-connectivity/kea/files/kea.tmpfiles
new file mode 100644
index 0000000000..5da74be3a6
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/kea.tmpfiles
@@ -0,0 +1,2 @@
+d /run/kea 0750 root root -
+d /var/lib/kea 0644 root root -
diff --git a/meta/recipes-connectivity/kea/files/kea.volatiles b/meta/recipes-connectivity/kea/files/kea.volatiles
new file mode 100644
index 0000000000..d0350e38a6
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/kea.volatiles
@@ -0,0 +1,2 @@
+d root root 0750 /var/run/kea none
+d root root 0644 /var/lib/kea none
diff --git a/meta/recipes-connectivity/kea/kea_3.0.1.bb b/meta/recipes-connectivity/kea/kea_3.0.1.bb
index 8729b1162e..5c46498d5b 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.1.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.1.bb
@@ -14,6 +14,8 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.xz \
            file://kea-dhcp4-server \
            file://kea-dhcp6-server \
            file://kea-dhcp-ddns-server \
+           file://kea.volatiles \
+           file://kea.tmpfiles \
            file://fix-multilib-conflict.patch \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
@@ -61,26 +63,41 @@ do_compile:prepend:class-target() {
 }
 
 do_install:append() {
-    install -d ${D}${sysconfdir}/init.d
-    install -d ${D}${systemd_system_unitdir}
-
-    install -m 0644 ${UNPACKDIR}/kea-dhcp*service ${D}${systemd_system_unitdir}
-    install -m 0755 ${UNPACKDIR}/kea-*-server ${D}${sysconfdir}/init.d
-    sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_bindir},g' \
-           -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e 's,@SYSCONFDIR@,${sysconfdir},g' \
-           ${D}${systemd_system_unitdir}/kea-dhcp*service ${D}${sbindir}/keactrl
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/init.d
+        install -d ${D}/${sysconfdir}/default/volatiles
+
+        install -m 0755 ${UNPACKDIR}/kea-*-server ${D}${sysconfdir}/init.d
+        install -m 0644 ${UNPACKDIR}/kea.volatiles ${D}/${sysconfdir}/default/volatiles/99_kea
+    fi
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_system_unitdir}
+        install -d ${D}${sysconfdir}/tmpfiles.d
+
+        install -m 0644 ${UNPACKDIR}/kea-dhcp*service ${D}${systemd_system_unitdir}
+        install -m 0644 ${UNPACKDIR}/kea.tmpfiles ${D}/${sysconfdir}/tmpfiles.d/kea.conf
+
+        sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_bindir},g' \
+            -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+            ${D}${systemd_system_unitdir}/kea-dhcp*service
+    fi
+
     sed -i -e "s:${B}:@abs_top_builddir_placeholder@:g" \
            -e "s:${S}:@abs_top_srcdir_placeholder@:g" \
            ${D}${sbindir}/kea-admin
+
     rm -rf ${D}${datadir}/${BPN}/meson-info
     rm -rf ${D}${runtimedir}
+    rm -rf ${D}${localstatedir}
 }
 
-do_install:append() {
-    rm -rf "${D}${localstatedir}"
-}
-
-CONFFILES:${PN} = "${sysconfdir}/kea/keactrl.conf"
+CONFFILES:${PN} = "${sysconfdir}/kea/keactrl.conf \
+                   ${sysconfdir}/kea/kea-ctrl-agent.conf \
+                   ${sysconfdir}/kea/kea-dhcp-ddns.conf \
+                   ${sysconfdir}/kea/kea-dhcp4.conf \
+                   ${sysconfdir}/kea/kea-dhcp6.conf \
+                  "
 
 PACKAGES =+ "${PN}-python"
 FILES:${PN}-python = "${nonarch_libdir}/python*/site-packages/*"
-- 
2.34.1



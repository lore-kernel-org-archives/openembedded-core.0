Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E286CCCD19A
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 01:11:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2504.1760577086372946627
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 18:11:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eiDmBVws;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2384cafde6=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59G0KKQX2523989
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 18:11:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=LZRkXNImQ3tTwSeisLvt
	EWQD1O9IgOLEqWss4ZRhxtc=; b=eiDmBVwsYI/WI/xSxEav5w9JWoTBnwaH1CKA
	tOViW7of4/mSFMLT5tgYeuAo1rznsRqVxxaY/+YsNYV8TIlw7h38Vqe66OfP/S1W
	w3N25NT3LZBXyVqXezbg9LzgkJdZWjaaEqjXQxuxswEcQ3pTUsR0RkRCYxlbi2Td
	oHLMK0twAq43tdCa/8IWpXk1GK81GR+qG7crxDiYN08D2dgnLJW0BL+wXRPZZ2oC
	T4HCU4KR8z9trL2LtfSNDg4swZjf6eLl2Hmh57twWr8UI4bBqHHnMjOBRP21oqjg
	cAeN+o6i1HoMKdVfoN11RCWEHkfCF1yvR2tBWyEHF6W8TKcWJA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011012.outbound.protection.outlook.com [52.101.62.12])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qprdwan9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 18:11:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EB0IYGsxLM5q3cAfRVWCcKl7DQw/PslSXzOobTpZL3TZ7Gng4mhE7TyuXzXk0VczVb/kn3ENjxFfFdQOhHj6B/1ko9oQhiMLoPdwNh8EXKDFK6E1bV0d7v26zKtJvZP4f3lWUT5STH51vCQGbCj/rp8QZt3Hd9al92R+9TCGi78FPufhMma28JIaTIRBevyaDP9zs4kYW2LDs+FIO8l0z4ZrOiF0H6DqT9TSdm6aAuBwGU44SCKTZij+KF8SX1XTDCFRpAqOTTS3PJglDn4zFF+Y5cssuvZPF89Pxe2YSTLl/BrcIYfox/hyckGc4E+ac1ssJ5M2/iREE9B+yvKsAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZRkXNImQ3tTwSeisLvtEWQD1O9IgOLEqWss4ZRhxtc=;
 b=sVGh3FamhC8mCOxcv58WUx9kQ0WGJF+BCTT2EusuuejWxprJisd5kS0zZCWIBrvJhhXhjKPULbGBikTMbFH76sXKreoqsY8ED5G9XYOjWIQmeWauC9Mb0pKcD6NpujYpY7OOf+767ktthkgPukeJjKVprISnVXGTzmfIOuZvbNww1fMD4P6Ra0eA6i2U7I/qhsMMkZ7wcros0Qms7fXcFlCIhxNQcV2VrxwV5H7k8jVTy/a40vWckvcU7N759kNF6WF1+rCM/qENwPzt3B0oeZJJy1ueLjfbWcwOpdJrG9jBGU0slqTQR90L2kaNQscquDV4peH2HsnQfS5YW9SKBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA1PR11MB6193.namprd11.prod.outlook.com (2603:10b6:208:3eb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.15; Thu, 16 Oct
 2025 01:11:22 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9203.009; Thu, 16 Oct 2025
 01:11:22 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2 1/3] musl: avoid redefinition error on ethhdr
Date: Thu, 16 Oct 2025 09:11:02 +0800
Message-Id: <20251016011104.145401-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:54::23) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA1PR11MB6193:EE_
X-MS-Office365-Filtering-Correlation-Id: c9c512c9-317f-410d-7e8d-08de0c50eb40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xcuGE3T5GbwisCvJTR7yVkOTwLMfwrpU7Ff95ZedvFDt5upT1eYN3116Y/u/?=
 =?us-ascii?Q?xXDvySAkG4g7wC9HCV1t3SgcDuyt/qpkJ/fyZ6PzwyrzNjCYH1uoP671/xuA?=
 =?us-ascii?Q?mMlAWMenZ6Pq+Bpgl+efaWdejYxfzC6J45gF5OP055HcKZRteIke3ZqnI6Cl?=
 =?us-ascii?Q?nXfm3K5S7AQoCvOJb9LSW+8QHI6iFdDjPyDbpmSZenSUMxZ065FU4MTi5vm/?=
 =?us-ascii?Q?ec7Ec6kB2x9j2ocfmg3yaNaRdxmo9te/NmX2WBhfhzK06d/CANk3o66jEbmn?=
 =?us-ascii?Q?eMBaa5qc2LRVXaZV1ti9+7PhWlh/uTxfoJJZMHDLg7p2p3FVtw2qON80WRdt?=
 =?us-ascii?Q?SK3enGsgmkHqxOMOdAMm5pViI5pN7x8V3xj6zcvQd1Olj8TNhFmaH4We4ZeL?=
 =?us-ascii?Q?jfkl7Bu1HmiRgSKNguAstE8Ur0ZIiEpe2RM0b6lG2mHoIYqIwmZ+CrdmHmVk?=
 =?us-ascii?Q?P7tUcecCIfZ8aQ0T0+6hmT59UuxoQrEkNoscg+UBPC50G7DtDfvKAHThihSv?=
 =?us-ascii?Q?2GkqIgON2XBRfkmxAQ+pv2+HTERnTWTm9vxLCsRkW6dsjXOEQWQ4mqkkv7Z9?=
 =?us-ascii?Q?jwAoANgDDsdZfrPVe1vGg+B7uBaUahOeTIL5eXWN6guFkDoih+QOpNF51j8X?=
 =?us-ascii?Q?epttkf4FD8InaMH6kUSmVo/3tuV5lIrbrOPaORwO3e4CdbKmu/aqoCaAYAvr?=
 =?us-ascii?Q?cO5wbd7w1sud99fUVU0/rkIWQ3TvlM7h+gRFgff18L8+LQDeJHVAsqO25Lng?=
 =?us-ascii?Q?LsNIe95yQBNXynx35/Cup23eMWgR+CzJ9fQLeT7PWTOHWv7agaWTz80aYhw6?=
 =?us-ascii?Q?1eN52eFNgtY5sart2uC0VGHK0eAH9ztEzPGSWXY1luxKX2lPYA5UdtBbiUBN?=
 =?us-ascii?Q?eWNt7WV+BlB/IRjgi7ZANaIIWU57o7KpdwjbdBt3wLNp+RPVYKZ/RXk7K1X4?=
 =?us-ascii?Q?ub2WnNSeq+F3DPSQJwckd3DftLHQWENfv9+ipV1lEBTgvT/iSOiM2gFJRc+B?=
 =?us-ascii?Q?d1iodMqxHAZYdUDti2wegR6jvqD83xuuiDjDLWUfwW98aK8P9kXcK/EVKxtg?=
 =?us-ascii?Q?OMHmnLQEmuDN609kanWuILKHZZdBp/RVFioAdx2Bbjf72dxmVBNBbpXzMGJo?=
 =?us-ascii?Q?MHWLuj12l2UxMpiis6Cfsjz13qM/PHjvASqgA/iIkip0bnJ1Hx6pqwCknkQb?=
 =?us-ascii?Q?0rBQVSWpqNmfZ7mOfpV9x7C/Gu6xKDvFSlHZa1ZEkjWBNvdib5hW8/X1SRoa?=
 =?us-ascii?Q?16ILv/IWItsvtAaaqqo0pDXO+Q+uRS5jmeqZTA7MOaGrzUjNnxyWzdiLzwPz?=
 =?us-ascii?Q?sn6lex2B8z5cnAovj4MmoiPe6ASHW8n/n3K2pG6qQe2sWnyCknWls7czGBMZ?=
 =?us-ascii?Q?87g3ukvu9q4SFP/yjC91eMi2B9BqSdvhIVcF7K0gWTVz08yZnZioVvkdB4p3?=
 =?us-ascii?Q?jDLE+inhw3h9EiZ09k5dcH0sgqjuYhifVbFNKLrOit6WBQNfj8dZnB47VEvw?=
 =?us-ascii?Q?SdXiw5TXanHxFOg1QButxEG8G5BG4GtVyWiv?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Yw8Y20UH9d236JikwGgpLhA0gMdXK7qdk3SfZsPreSfAmZmPbMQo4N8D1ZU5?=
 =?us-ascii?Q?T1bic8Z2JNXKgntdgYqeA8eUNsOMLT+2xo2vc+75UsLrSsUPNuOiDdvLvoXH?=
 =?us-ascii?Q?c0jtApUXmm1/mwCZ9MLUBVmM3U//ohszuiHK+nfZxXuUc/FIAbWYNfHM7Ahw?=
 =?us-ascii?Q?Hg3IRfIqdxy51f1PIkercWbZkdPF0XaXEGEFzxEjkXvquU3uGX2p75rglC8Y?=
 =?us-ascii?Q?h3FCfKFWN5sRjebsRPdePrJBtiTPvvmayoPIahKqJgrBXpM+BJ+gK+0ZsTsW?=
 =?us-ascii?Q?xC8JFxqUqw+il13Q1ujGskngqcoTu0slN1hYNxYOWzshOcwwznHHe9iVzjBc?=
 =?us-ascii?Q?EQTd1IWXYZqIYt0/kMT8oiYj0pLgBqPmV0e2vdswDZGNROrBNPT1hMWj6vxE?=
 =?us-ascii?Q?42Dt+Pu8VkUZgFBE0nJYY11mBXkjI2wB7Z55r1m+9I/8dtDwUF2jbs6MuS8e?=
 =?us-ascii?Q?WiPN3D1PXZnX+Z7X4HSzx5q6VvPYM/67jbERdRC6eRW448zJIrHMJUUo3GDQ?=
 =?us-ascii?Q?B4XGf0QSHgE3weY7BNJUZuL8oGhCH8TAAw6nDloAy/PKWGKAQDp3M7NN/b6h?=
 =?us-ascii?Q?hqnqHvIfTCNPlXVFuXKUam+7vnnnznyrB60XaVj2o+AzoRMn/oDfYLfM8RGP?=
 =?us-ascii?Q?9cvm+Zg9L2L1Vbu1jupkI7jm5vBeX5L+xkz6x0DzNkJ7IZ4is2sIqBshMRcv?=
 =?us-ascii?Q?z9bgRGP1G+QhPFr2G3AHtIUbr1Ica2QD/7h1TXAetevW8rEHz/xekRAQHS2K?=
 =?us-ascii?Q?BzTVfzUajM0OikmYNDh8VjJ/yrp/Qj2hHxiFPu+ZeiQA1tWcVbiRZr7OkCnv?=
 =?us-ascii?Q?hm0HqX1D826uZCIw0BPD/pi/QF30aJsKJZqHrd/jtTcjM8QXvayWjkgudfjs?=
 =?us-ascii?Q?RUAViUUDd0JjAqfM3C64UUTUZ2HvwrqFP14RlHxzB/jPlHtRag6HGKrW046U?=
 =?us-ascii?Q?JC8IsZwgTmhKaG1jylfWg8LLXaaElpd426CXc6GISMZtkCgKMgMBqVpyCLWh?=
 =?us-ascii?Q?LXMdtJXbC2VOooBAE/n5J6i5WHYk9rD9t15/QSYV7tHDaDIYhEHdK6FZaGL0?=
 =?us-ascii?Q?UkYBVBoqIH9fcpfBj0O7CdYYuBWF8DSTEtl0doV8BO4ciiFj8g3w7otiKP8N?=
 =?us-ascii?Q?cH7h6WCCkwI13gpeD9nmK1VdKV7W7Wnnk2ut+o0mxgiZR/wMrX6RlLsGEm96?=
 =?us-ascii?Q?aIE5rvl9/QEzKHCKv6qvVoqNL5HBoIIco/aLPxXtDUw+Eda4dNkbAWdr4S7D?=
 =?us-ascii?Q?3TKqvna+s2PTLgF3SEZlkGDDy70VGxkBBXJOEqqYhKS0tO7xNjYkQCx/jtBj?=
 =?us-ascii?Q?EDpYaGqFfUTBv0/rtW+nNp9gQEN5SjOocBfQ2jDkoe4G6Op3EUYW8/r8Kp7y?=
 =?us-ascii?Q?/H4qA0Vx093Jxf8/1C9GBlGvXiUx83y5JrLenRj83To3zOHMr10i0vbGZ6ly?=
 =?us-ascii?Q?idxK2cl4ooX6+RUXtOurOtEIaqhVqr9YD7eRxVWwV+I9iv3gcvu1/U/6YVAA?=
 =?us-ascii?Q?2T+xPFaZhm73XGaaGyQmEX2CXDGLsw34eT9pJLpaDH2GbQv6VRO9soVWwmxn?=
 =?us-ascii?Q?V8ejOsJzI4dhCESzxt5A/Mt9j2xC8LGlJ0h1Zl4M?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c512c9-317f-410d-7e8d-08de0c50eb40
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 01:11:21.9684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRfv0IJ8yjZfImxSPDFOGtA9gJq/07qc5Z2XPxBi2d1jMuEPMAbYfI4uT+WzgCnv3PygDc+Odsm9HeZkzKG34g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6193
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDAwNyBTYWx0ZWRfX6mGtusn3e9TL
 T7sZwxqYkAc0R31RFex+zf0MSrRKK4cskIEG9QukfPo9koawZ1EqyUZqjAPiFSrUhlqj5TrTjH1
 F0OLNcepyu7V3blWajuJlszh5CuxeVEU4EgIZ/9KG0hkfBnjyb9Daih5NW1pBHO9VeMsYN4fHH3
 vreKXnOeyUGQHmvQfvrwxcKKhKsoCt8hfTL4xO/W//yk4kcs86WtRMDaeDQSQsZWR1vUlCglUeO
 Wuqy3VPahwlkmjll+pJU2Weg5yHJ1CR/9DezpK38xezSb21sYqQS+eGGtN91xmmDOKqIgor/JOH
 3QsSf6r+0GfLAEIxn33XMgvW67T0Ys1WeMx3HT8Yph4gD5qRba4PBAzc9TZWP5bTCtKy/ULHlzE
 nsY3lvm3oXVJECiTJxPr7H88yOhW5w==
X-Proofpoint-GUID: utxMqFfhGRdefY-IkY_VwqaWMC3XTFH6
X-Authority-Analysis: v=2.4 cv=JaKxbEKV c=1 sm=1 tr=0 ts=68f0463d cx=c_pps
 a=4YDC/s56AEiJKWlPnw2jOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=XkRKQH6RAAAA:8 a=t7CeM3EgAAAA:8 a=5KEJ3k9QAAAA:8 a=ghNEFwE66zV1HndGU9UA:9
 a=1gUyE30hU_ULiMxJiLUW:22 a=FdTzh2GWekK77mhwV6Dw:22 a=olg2BfGzmf2haRflzj8J:22
X-Proofpoint-ORIG-GUID: utxMqFfhGRdefY-IkY_VwqaWMC3XTFH6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510160007
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 01:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224909

From: Chen Qi <Qi.Chen@windriver.com>

This __UAPI_DEF_ETHHDR macro should be defined right after
the definition of 'struct ethhdr', otherwise, we'll get
re-definition error in some case. This is because the
lines under 'struct ethhdr' definition are header file inclusion
lines and those header files might also check __UAPI_DEF_ETHHDR
and define ethhdr, resulting in redefinition error.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...if_ether.h-define-__UAPI_DEF_ETHHDR-.patch | 39 +++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb            |  3 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/musl/musl/0001-include-netinet-if_ether.h-define-__UAPI_DEF_ETHHDR-.patch

diff --git a/meta/recipes-core/musl/musl/0001-include-netinet-if_ether.h-define-__UAPI_DEF_ETHHDR-.patch b/meta/recipes-core/musl/musl/0001-include-netinet-if_ether.h-define-__UAPI_DEF_ETHHDR-.patch
new file mode 100644
index 0000000000..800273612d
--- /dev/null
+++ b/meta/recipes-core/musl/musl/0001-include-netinet-if_ether.h-define-__UAPI_DEF_ETHHDR-.patch
@@ -0,0 +1,39 @@
+From 5ab64f7e08ea0325d83d446dd4015f82b4c179dd Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 29 Sep 2025 21:39:01 +0800
+Subject: [PATCH] include/netinet/if_ether.h: define __UAPI_DEF_ETHHDR early
+
+After 'struct ethhdr' is defined, we should immediately define
+__UAPI_DEF_ETHHDR. Because the following lines are header inclusion
+lines which might introduce header files checking __UAPI_DEF_ETHHDR.
+If we don't define this macro early, we will get redefinition error.
+
+Upstream-Status: Submitted [https://www.openwall.com/lists/musl/2025/09/30/1]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ include/netinet/if_ether.h | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/include/netinet/if_ether.h b/include/netinet/if_ether.h
+index 3479f511..b1646f6f 100644
+--- a/include/netinet/if_ether.h
++++ b/include/netinet/if_ether.h
+@@ -117,6 +117,7 @@ struct ethhdr {
+ 	uint8_t h_source[ETH_ALEN];
+ 	uint16_t h_proto;
+ };
++#define __UAPI_DEF_ETHHDR       0
+ 
+ #include <net/ethernet.h>
+ #include <net/if_arp.h>
+@@ -144,6 +145,4 @@ do { \
+ 	(enaddr)[5] = ((uint8_t *)ipaddr)[3]; \
+ } while(0)
+ 
+-#define __UAPI_DEF_ETHHDR       0
+-
+ #endif
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 3f5fa37fba..254774f57e 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -14,7 +14,8 @@ SRC_URI = "git://git.musl-libc.org/musl;branch=master \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
            file://0001-Update-syscalls-for-r32-rv64-from-kernel-6.4-through.patch \
-          "
+           file://0001-include-netinet-if_ether.h-define-__UAPI_DEF_ETHHDR-.patch \
+           "
 
 PROVIDES += "virtual/libc virtual/libiconv virtual/libintl virtual/crypt"
 
-- 
2.34.1



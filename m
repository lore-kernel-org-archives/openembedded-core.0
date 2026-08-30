Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BEDFC61DF0
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 12:59:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8127.1788094779043541258
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 05:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fyg78lhG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3702f0b8a2=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UCwQwn1452803
	for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 12:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=w4xbIaWmMjw9md14dEyVSicy83v6igeiihlDm/8q7pw=; b=
	fyg78lhG/8ol0Qwo+r4dt7KrHsq58QB3Q/4khxUAb79BZf2qJVNTaW4s5+Pmovu1
	yysVkos6ElUWxoRTkN/+qsMepGZCv3a1Z2Yxw63wr7bJyGf0h3TzaZkfgLOyekmY
	pBV3CYcAYYJKS5sgmEtS9YipX8N2u/kJgQiTl92uaZJtUW7oBGg3oR4FKdzupiYO
	srMixmA/WvYnC/mLxuH4yD+7uBof6gERjawwnU0UIQKDaPHylFBBunU33v+vxcS3
	9rG1pu/AJhffyDuptLY1Ur08I1ukMl3Feq+mH66GyeOhT6B1XkFHfxJRpHcLrwT6
	vF7BX1UCTRXftPiAv1Undw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023082.outbound.protection.outlook.com [40.93.201.82])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gbmn0ha4x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 30 Aug 2026 12:59:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A7IWFm8PZWBCOFBMxz6J6JOn+auI3cSeZLRsEzbDZ3t4XnVz3q7KWJine0AwrpxVVnYkzgCPgu9dWzCKYEMDGlFnWOP+eSZDpSGVmWT0VtIjXjYuHVbtDZ7RA44dRCny4jNAX5DQRq6vvV2F+yYcLNadem0qb7ItnBGl1sC2O7yr0+JI705Zx1381IADgdEWLoaXO/cFO72Y2xASQJpkd+G3CAUZSIrLsMMOm8Y0jjw4QKm9o+XRi4RFXNfUrivTwRujGvP84ntbj2SojXbeHNr2qLLwVF1lAftS5Y/bL6fvPSCmQtPDk/9jlIgvFuv3PYFyMEE/JK/jdhDF4TzxXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4xbIaWmMjw9md14dEyVSicy83v6igeiihlDm/8q7pw=;
 b=RPfPNHqmLpuV4sSMZ4LVlXOkkT3yMnyYVkql1kumpDoeM/legEX+Ns9qNHrgEjmz4Qegy/hWBB9aT61w+AnNSb54xd8tuDzNSk0UQNSewhmXx88LxlJHlBQuIB7eiJgMp9rYoxliU2Loj2ZTiFP+vjn1JHM3XXO+7AdW+g/GJ+5KGA1UuWG+mOlEDCNdWBZeJYI4zlN2BnIiU4h486Uw+kZbINlRSeQJo/ByGCoBrgFIJKHzS3gbWDKbth0Nbjb7IHjpQCG8TuDjxlIib1j4tte8JK50T5m7qgaNgitppX54VreWHW7tLGC6ys2+ez7ZqW8MRtl2n2TjdWxDHLtskg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH7PR11MB7122.namprd11.prod.outlook.com (2603:10b6:510:20d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 30 Aug
 2026 12:59:35 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0360.008; Sun, 30 Aug 2026
 12:59:35 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, randy.macleod@windriver.com,
        sundeep.kokkonda@windriver.com, deepesh.vatharaj@windriver.com
Subject: [PATCH 08/11] ovmf: Fix memcpy alias prototype for clang 23
Date: Sun, 30 Aug 2026 18:28:48 +0530
Message-ID: <20260830125853.1139807-9-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830125853.1139807-1-sunilkumar.dora@windriver.com>
References: <20260830125853.1139807-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PN0PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::22) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH7PR11MB7122:EE_
X-MS-Office365-Filtering-Correlation-Id: dafd6e9f-6c7b-40b0-3925-08df06968ac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|23010399003|10067099003|3023799007|56012099006|11063799006|38350700014|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	fvU+xDA6qivuhxW6mdP2Lmiv8M0YZvocQeFaq5mr+TgZsKsD/MVSe9ZbbIoiyV0z8yFcxUfbfqjudccNN/YLj/1279lM26vz2TWpkBXH47evNrN5T1ox2EPANDMUEl1gWhqbOvqiOd4mpLxmI1XoN1HhvdlwdV1Dc2oY4tx9LqlX4jYw5X7dlgKK00fD6pwudsOrOSmdCD9BK5b/K/ZOB/t13TIGZPrgIfYrYyoC9LMBZuxfnvGXCt9witpkKOYyCENGxmvTtiZEZWbSfqHcby/hBe+1yP8uy7W+cSzAR+/KCSaKGTQPouyB3/QcgaQeG1ML2TOU01bPRvd3VvfVi8Y3C0DMV7qwKw7SJUp0/UHY8XbtFSKZt6+NThp6fkBtVQwhpknfkL3plnI/zOMv89mYXZegK/QIRsSioKyDFh3wDr5XQK4SH2LcMK8CmqIzOrUXJQ9ne5M6H++aFjtHylOiHAnWS77PRRo0uA24kErTAjWpK1ulA7wLOpb1qopckYu5fs/PQPaB82Gz0L7qqI3ONN4YK2lpLtMHTNpShsXAUXuRsuUoZoZ8UKoGbEAdSz89CY0lACR6LOQoaMy5+5BCzwrIc14u5jZ0ZlDf+ZholF57+TCJYrMXTxX5yZ3Xvn8lb9mQLeCvRzcAmn9aIJns4hfscoGvMHVObZw6LwU+HD6lSFeM05H5P25wZGunRVVIvnSTPWBwIucewfbkFV55kBW0MxBYHxZK2IyNaWA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(23010399003)(10067099003)(3023799007)(56012099006)(11063799006)(38350700014)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nnPgos0CrZy2GUsYUX75gEuJqLeXxYntzZ1k9K/yKQzsLy9ib6Cb7I6vsiHh?=
 =?us-ascii?Q?4mFqfvomi94IaM6XWeFiDNvNONc/u28ap/dYbPlnenOngbS4vblP+plYmlKd?=
 =?us-ascii?Q?S7E36Fx7cXKOWUGPbpQb7tFFcAobjE/OeH1tKENrLw2F8eFQS6SF6L7rkdPK?=
 =?us-ascii?Q?GbhO496A6qzh/9dYuI4ejKygnb1EJbY7HF/PGxbqN94gn633AeBvYX0rbowB?=
 =?us-ascii?Q?On54JQLOA7bL4CFtRnd37RPbMUlzhaot4CPb4P2d6hvkrnp98kzL3azLOVHK?=
 =?us-ascii?Q?9p4toZZrEVCnvTaQegjNosnEvUfVdDWhYqTfzrR9zg2tXYHVkz1HCTRinX8c?=
 =?us-ascii?Q?f96bkPC1lWv1za7zfuQLz10W25OQg1BUuQXkOi4ruXj6ZUBGRf86dRhF+rWW?=
 =?us-ascii?Q?WBxZh1k5gFA+YO8bIWUbNgwnHQQACyJTmGRNSrrcOPaiISCa+8xoZNr6o/mU?=
 =?us-ascii?Q?IhVKXGPTt81SGl5UlxzDNzKZ+m3r7QUE39PDkVti0aF+A3RMlEPMoOZkUmsJ?=
 =?us-ascii?Q?RKbX5ZIkF6gZuORCOjLp7x7ounrH2Cu57/d02v4g67Q81u9pdHKfom8UerTJ?=
 =?us-ascii?Q?+u0AwbkjXA7zJ/Osc1iHTCyCGSGI0CYgq9cCyu9VsyAwKSxQdT/AjHjoPD0A?=
 =?us-ascii?Q?1N/ox/fJ1DTw3FVlzT/lSzqFOUshqUDQOqgcIAjiN9rY5NteuTwIgWynMI+w?=
 =?us-ascii?Q?LeWlbpDhYSBvJ3R3zIDMsdyGfiucbjAPfKlCyS7s+JXNyzlhp3QGY72bDpnU?=
 =?us-ascii?Q?xpYdL+3K73oVVD3jBiLgTWc8NH8k6BULX4GuPtDFRVTcZ/WjGih4PEfTTlfr?=
 =?us-ascii?Q?P9RcrvdVHkB7I/ThubEIH41PtgsVfcQIGIRsYFXQ9maWY7frYN32MqSL3VKA?=
 =?us-ascii?Q?QD45SVMi4O01fUBLh95cmZlXps/BiVZmd378ielCwJy7ES4L5dFGsi3zF1ON?=
 =?us-ascii?Q?6nZifAX69TQh/EdZcTkoUFIXCDyrXnMaGncW/iwsv3SOHzdJ0Q2aWgKLOICt?=
 =?us-ascii?Q?QGV4n2Hs3l3aLKShdmkNoJzAjtPWKypbYY1V8829KVNs81qL+vieq86p+G5o?=
 =?us-ascii?Q?i4gLQDeEfnIUZelqOJTiDUPcFuhXCRnsK+DyZcxgKxK/eu1dBYSY07z7/NN7?=
 =?us-ascii?Q?Vi6Ayz1ocL9gEN7dkYl6esbyiWq80SEXzin64PXcFsGmaFqxEFxuBchQDSWs?=
 =?us-ascii?Q?b+lsqENWG2Jw5etyw2ZhQ9otexUYcYOIB1BVCt5HRnxPI8Dsk38SOCLqb1fP?=
 =?us-ascii?Q?QHU8Po5/1OO4eawzZ1HQ4Gqoa5WXBKlodMAS5RMWmalSutKa+SzXYSoNwaHZ?=
 =?us-ascii?Q?I5/riwm44mg6KUQiXcFOTnJspKc/foTOoY6le3vG41CaRIbUgzTlCo3Oeh1R?=
 =?us-ascii?Q?gSdrOYjPV1YyhJCwL4iVmf1buBatqiyvEQr2/pBZviRjsoqse/kyM/dF/lyM?=
 =?us-ascii?Q?Ug2Lrip+z32PWl4ow7MNX3rcX2O3Nh+UgwEEG+IpbU8N3loWrBqjNKr5dku5?=
 =?us-ascii?Q?CJEZ8MgXbMbJGVL7H5/W9DTuYwynxSBPZs2IyEtG+KQmADbMaI616MBzwrLZ?=
 =?us-ascii?Q?F1l3K0vursDo4jVghmV9Q4aQ2CZzngbxx2u/9JnEtR99w0YX1KcjXTM3p9eI?=
 =?us-ascii?Q?TKkwk1sO+hJkYV4ik9fzAmWyNuxWJibsCRpYXFpmg24p9ELt3enE0kgHS9d0?=
 =?us-ascii?Q?SM05X5aVxpv/aX1HekZM/KVlQTgcuiFkpYlGf5vwsxMc3MqEmLhIxrNRUizw?=
 =?us-ascii?Q?DFcmSNecPMTcY8Gg9je8L4FawaHV5Xo=3D?=
X-Exchange-RoutingPolicyChecked: 
	dOsJCYP+6JLLftzP38t0UaOd+7Hw9aKt/MTYOry5dX/J7SqiAUn4F5atC4ImbNi8NKQFl4yb9dxEIxbAwcIuLd0n//rDZK1ZOXOhCK5czOqPaXhknqeHP3zEEaHW6YvSg/OcY5rRIgEOOTkqI9oaHJbHwKokqryKn6pXJuhda1rUSv8vuWSs3dVpmCfPaC6hm8WMKbKwM9VKfqsTisPKUZX9sy3ayjtuSE4Nsn3fzjtr5uOd/NnQSBsURzlAzHw+ktBl/pvADiqi3BheiVKo1GarFRVGixtAE6jvGlz2ALkt+MGP6u/OAIeZHied9p7evqEK62IGlPJEjglKRiN+6Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dafd6e9f-6c7b-40b0-3925-08df06968ac7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 12:59:35.4105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0IOEEPIJJr8hNuaikPBX6TErB1kDNp8g2454XjIMsq2dNTVyLLNF0uEwHSPqTAp83Li/Y+dun1Q90tRukXIUm/3nApnSIBdlZB5xA0yVvrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7122
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: J1hd2LVAnpK4MlL5UvrI4XqwJ73GFuE0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDExMSBTYWx0ZWRfX8CXwKCNeSUuG
 NmUfYpUqzOMfvAEO9SH8t9i2FVawwyg8GEhFmpRJTQslW0R58Uo2EaSVhf2UjSluPPTPU9ZOUMw
 vhLKJzTL0zokxldNgU9pUVcOEWAENyzrqcFHS0s4PFMrkT6SG6ITxgYFUieMMOUCV+6fe1+rX5P
 OR3pGs6cFgb39FhRMDAfDL9SFgY0y3jsMT+ZvR1qmH2EtcdCfKB2MYq5/MVxjMQHRSTWklWBEVW
 aCP5HVDH3OdKoeuZSoe4frJVt0lW5Q7diX0t98un9lWHYHTV2CpHPydeTPRTeH/0ik/ylvWtiGG
 VEyniqMJt8e+lrHHQ8fwS1EtG2kH7KtIedMZJxUEiz0kVEwYk772iZpYoux2RCilknsIQ0NWk6/
 GjsNWl540nh34KSRHt8Blu1prbhr1kMQrAmCcvR7iMGKWb1Qu83f/eVVreS1Qzcav3JQBybtRCd
 WJ4vFqnWC1qpIWzUHgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDExMSBTYWx0ZWRfX9pirjYpz9say
 uzaeDqHlKX16nZ2LYoX6ZCktKB8H/RjCWPN2pTp30kg12glvmDkS7gkacrXvvxpjCen5T8KwnXA
 /ifhLEV53clp5Kpn2WEvj8TaDQ0ASrGMbgcT49roLpnDRCZjoOIl
X-Proofpoint-ORIG-GUID: 4Jl9KHkGWIfR2A8VesnRDjJ0MfGwyUbw
X-Authority-Analysis: v=2.4 cv=aM/Ab79m c=1 sm=1 tr=0 ts=6a942939 cx=c_pps
 a=ulKS55DWmiSHHqtbYmVMKg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=j59TsiCqwUfw_GPqhyAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608300111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 12:59:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244650

From: Sunil Dora <sunilkumar.dora@windriver.com>

The memcpy alias in CryptoPkg's IntrinsicLib declares its size
parameter as unsigned int while the aliasee uses size_t. clang 23
diagnoses that through the new -Wattribute-alias, which the CLANGDWARF
build's -Werror turns into

  CopyMem.c:29:17: error: alias and aliasee have different types
  'void *(void *, const void *, unsigned int)' and
  'void *(void *, const void *, size_t)' [-Werror,-Wattribute-alias]

Declare the alias with size_t to match.

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 ...sicLib-fix-memcpy-alias-prototype-fo.patch | 35 +++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0005-CryptoPkg-IntrinsicLib=
-fix-memcpy-alias-prototype-fo.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0005-CryptoPkg-IntrinsicLib-fix-me=
mcpy-alias-prototype-fo.patch b/meta/recipes-core/ovmf/ovmf/0005-CryptoPkg-=
IntrinsicLib-fix-memcpy-alias-prototype-fo.patch
new file mode 100644
index 0000000000..0921f21347
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0005-CryptoPkg-IntrinsicLib-fix-memcpy-al=
ias-prototype-fo.patch
@@ -0,0 +1,35 @@
+From: Sunil Dora <sunilkumar.dora@windriver.com>
+Date: Wed, 20 Aug 2026 10:45:00 +0530
+Subject: [PATCH] CryptoPkg/IntrinsicLib: fix memcpy alias prototype for cl=
ang
+
+The clang-only memcpy alias declares its size parameter as unsigned int
+while the __memcpy aliasee uses size_t (UINTN, unsigned long long on
+X64). clang 23 diagnoses mismatched alias/aliasee types via the new
+-Wattribute-alias warning, which the CLANGDWARF build's -Werror turns
+into a hard error:
+
+  CopyMem.c:29:17: error: alias and aliasee have different types
+  'void *(void *, const void *, unsigned int)' and
+  'void *(void *, const void *, size_t)' [-Werror,-Wattribute-alias]
+
+Declare the alias with size_t, matching the aliasee on every
+architecture (UINTN is unsigned int on IA32, unsigned long long on X64).
+
+Upstream-Status: Submitted [https://github.com/tianocore/edk2/pull/13038]
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+--- a/CryptoPkg/Library/IntrinsicLib/CopyMem.c
++++ b/CryptoPkg/Library/IntrinsicLib/CopyMem.c
+@@ -29,9 +29,9 @@
+ __attribute__ ((__alias__ ("__memcpy")))=0D
+ void *=0D
+ memcpy (=0D
+-  void          *dest,=0D
+-  const void    *src,=0D
+-  unsigned int  count=0D
++  void        *dest,=0D
++  const void  *src,=0D
++  size_t      count=0D
+   );=0D
+ =0D
+ #else=0D
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index 660aefcf46..bf69108f0a 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -19,6 +19,7 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps;ta
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake=
.patch \
            file://0003-debug-prefix-map.patch \
            file://0004-reproducible.patch \
+           file://0005-CryptoPkg-IntrinsicLib-fix-memcpy-alias-prototype-f=
o.patch \
            "
=20
 PV =3D "edk2-stable202605"
--=20
2.43.0



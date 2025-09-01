Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D309CA0FFD
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 10:34:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.48199.1756722884782388887
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 03:34:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=n6C2GIG0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1339f573a8=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5819eTRU3334799
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Sep 2025 10:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=eJ4GL/nS2twmOBj7RZki
	GmbGu+2/VFXaWJW2C7/O/bo=; b=n6C2GIG0pAfqM1YLTcG6bhOeTJ20YkQisrZR
	rpLwPaC/NM4px8PyanE5cxwl3NUqiKuKN3U2kxghTt65NVX4ch1zMjnc3BJ7MCDc
	gb9M+5sKZkqEwl4ibrxKvO5SRb9MIZgqwCsfCqFlObwuFhWzuUPtS4DnubsIrZ+J
	PlN0taPPtmlU8u0TBNu8z3+ayJCYXeAnff700Sossd5vabUBC0r2mK0sUSQ9wxLy
	zZ9xlgbrlFz5crWArb0bUc6ipoC+G+NfKigfgDbFrkJnl7dABeTpQEtlU/rrbeXZ
	ZjhM2ZZpMm0BiBc91yRvclwpm5GVbysI6raAF/rJxquHZ8Rrwg==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48ur99shra-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 10:34:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e4FU+VpnLCzIuSanwDtT2J7SgoyUs/c/S6wD9ug1xvJ+N/CgajAuKa9Rr0UaeMd3aHM6vKUEdrI7gHZPBxH3SRxwsz2Je4oX/LjYtkvHj0J4PXzJUHZfR7HAye05CWUjsz18I/2mCA7sud/VAdmExjWX2jsp/FMSBC7TsPUG2gUHJz+1HF5KSD59JDqcBuqmH1LnlIdIC5AmCQ/mHWoPEOmrr6h1aVcGS8kFcImeDGjC9vkeCRWuiqvTbrNzOCbuKW25KM1MOnb5oMTRa4VDBqiv7L0U99O4DN2mSRWflCdk9FPTiWcDAl3yfaiJLdsw8gZu7yXwMj7KLb+/pWTraQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJ4GL/nS2twmOBj7RZkiGmbGu+2/VFXaWJW2C7/O/bo=;
 b=LR/PR+wFMttBHrqc3WqE0I9tTVXaZ+RRNM7Eg5DukKhv00L3FrMkEtACIAu3bxA2hqbwGuDEJQNn1J3pRvPDd9+OX1m6WA8lkLI33SQAGDETTkD0M4IlUXM89zsB0eoCV8PMOyfuEY2Aci0tBylI2S9oQwYPxMcrktlueNlfDBPA31jzCDHUVYHv3OGBE/pM+IVZo7+8S0Utc5ZyWtTva8FixQTKsGAoqah4ClBtm/bMhEExEsyTzYvs3yJBhrd5jV7j40knq4CvGlGZK0g48W3c6KHoo303UX+lPPfWliMPW2wukRAGjnnV8dPmOdVswZ9ftKu5N13mwWAjEJjUfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB6672.namprd11.prod.outlook.com (2603:10b6:a03:44c::10)
 by CH0PR11MB5316.namprd11.prod.outlook.com (2603:10b6:610:bf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 1 Sep
 2025 10:34:39 +0000
Received: from SJ0PR11MB6672.namprd11.prod.outlook.com
 ([fe80::18c1:45c2:7c57:b479]) by SJ0PR11MB6672.namprd11.prod.outlook.com
 ([fe80::18c1:45c2:7c57:b479%5]) with mapi id 15.20.9073.021; Mon, 1 Sep 2025
 10:34:39 +0000
From: ovidiu.panait@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rust-target-config: fix nativesdk-libstd-rs build with baremetal
Date: Mon,  1 Sep 2025 13:34:17 +0300
Message-Id: <20250901103417.2794335-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::6) To SJ0PR11MB6672.namprd11.prod.outlook.com
 (2603:10b6:a03:44c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB6672:EE_|CH0PR11MB5316:EE_
X-MS-Office365-Filtering-Correlation-Id: c3614631-096e-47d1-3fa6-08dde9432786
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bjBM5g90zeWFTGqLu863KnYPIhmtIPB/kNZ6qcApSuy3vU3CN/5sjGIj8gPm?=
 =?us-ascii?Q?j7Tmgex9Cn3M3ru/fatbCy9tUi1RTwfLQixCsR2Oio4oU0VhLgs0+WnywdUH?=
 =?us-ascii?Q?m469C4tHKF1d28QE9Hm2DHLKVBUuszTy7EbGxTNQqprihmd4UVWOaKJpQLPe?=
 =?us-ascii?Q?jlNWu4ENDmISMEsQCk2WTUXO6N+fhiBdskAzyViyZ4inX/I6Z8euQU9Zwo4X?=
 =?us-ascii?Q?+CVWd4Optvj8PqGOTkrHo1h/p9vHVhGhOMMi7jHlWuBc3XGgnu9z21SKiJLP?=
 =?us-ascii?Q?s/n8FJwuHcXG3LCWkxh4JlEorOLOOskOvRLvPDuTLw8fZMGt5Wez4CK9sCWb?=
 =?us-ascii?Q?CUJbkFTJBAWAkCrj5UQmYC0ZCoftYxwn0KFGilDnMn+jENsoAQ2fmNRVv8Om?=
 =?us-ascii?Q?fxv2aFKpIb3152azRGU0X3k8EvrsGf7jCQa/DcYdw1TFsydesdJ9uhkFUQQa?=
 =?us-ascii?Q?ypteDOX+606wkWe8K6zD6mJXYhiZ7rKmsgTEvo6oBqcFaCGahjxgXMmGcEwq?=
 =?us-ascii?Q?YNf9haHuQYNI38KuqPDDfogjdz3A6JfmuXth+1ItoM7hG45Ev+mvG4cIf1ad?=
 =?us-ascii?Q?DaO4IjNzFUCowJhcuKsxX/uV0zGYD7aRMdAhwWkoERs0d+vz4QctsX6x1TEf?=
 =?us-ascii?Q?XpJo5fuNPtFuBJyIjLPZkueLZXH2rWg3mZy5+0eH6boYObBoUovN+OHwpP1z?=
 =?us-ascii?Q?DI87J2yzshcKqE1puIJV6BSH6dP1xE3zjzZX2yI7Gv0LCGI87KeD4fvPT1uO?=
 =?us-ascii?Q?QL6SleX2+I+gyZwspwLEMJ2zxjnEg8aIjUKMz6t1JSQZ/3MIrN8mEVqhRcae?=
 =?us-ascii?Q?EhXCbzDHflQS+3PYYLjQQOexinqXkvmDJhk0g2Dn/2IEQ7YhbCwlydRkMOkE?=
 =?us-ascii?Q?OrrlexlnaO+YnGs07vBZM0O1XsEnryltPG18P/63u+MH4B0MH8lnvEbWqOsg?=
 =?us-ascii?Q?MwkATAzt79oa7/GIsrcldyINvX3zEGEPoxlQuBpTTFfGo/pFW9shYjImm0jX?=
 =?us-ascii?Q?XaY/IWJO6q3dseNF1GBQGCU3k6VTS1s0kpvSgLFg1zTAYkZHdgoMUXc9N2X7?=
 =?us-ascii?Q?EXFxudEzqBc6GujDi9oeXDOb9U8VyrqO+fXXkgX8Yy+cVOqVQ0AstSO2FqWY?=
 =?us-ascii?Q?dl4R5uqvTFjj5/dOinE5bbOp9AlJqH9kC90h2eMEx1lYpKyW1+fiZFJ5G/tr?=
 =?us-ascii?Q?zV98GgpC5EjIPDiJ+M4TZOqjphToCBikjtpnklo5zTOnwQba7Q+CU8TnFi5V?=
 =?us-ascii?Q?lrqAQHWZavlbHvrpNVzezfLU8RW3J8JSijYixPhinsHn9TfVoqxInQ2ZNtVt?=
 =?us-ascii?Q?p5rjx3qGPC/VmFxzIMm7UZTVf7J3oUHM+2SjARW4PTMvul4pYDLStlNy+qfE?=
 =?us-ascii?Q?A1B99HkNHk4D68uOi+PRzM7tNrMCfgrbcug3V5dspfRvVjU8CoME8xtTkF/k?=
 =?us-ascii?Q?HcOZeX1Jnm2ELgmLz6qF/UN3Db/PsFFHfymfXFPeWqK7ebKMY0d4pg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6672.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QcXP0/mdDc5Di8sL/6jNlV16B35zyKV8Qrrsc4JG/3ZY2hAE5D02HZFU5A0l?=
 =?us-ascii?Q?fbrN/SDkT3gqO8puSDJYGrYabMR1AM0DSt3VL7Ru+urOphPu6x6dWX0TPmED?=
 =?us-ascii?Q?UzgYtblXEflzrdX7YV832ndxqlnlP2jFyEQC57LUH0OSKhhkGt8vyQHWH+bL?=
 =?us-ascii?Q?W6F0h2zUTeBQ9SKVBJIYCBR8yXHXUzBNIKbZPIWUu8dnrsf00ga+XX+q7b5k?=
 =?us-ascii?Q?nV9WHFCxeF2JW+JhnHAhOfbuvfnvis8mHNZkbQ/ZA7lVQASln8okUfQGQT9j?=
 =?us-ascii?Q?bKbI0SCROteSasHufOjF50pAi95MOziHXJ7ulA0Hi2IxTVswO0UzeW61nfsE?=
 =?us-ascii?Q?OSzYG9GgRh6+8cGpBxu4QKrD+KQQczF0kfbbFRE8sC+Ss5Oro1hXArgKYM6L?=
 =?us-ascii?Q?jH+3jXl+zcGvj+dEzUeUwgZrYniNZzedmUnYxA7dDSpZal/THeqwXtU5EL2+?=
 =?us-ascii?Q?PrIXama3Y7TyQofIvb43SVEhiXTzsfeVUWd6+G5xuw8TyJjeFm9t3ordjDgd?=
 =?us-ascii?Q?iAZXCHPB/FI7zsQjCb/TOf6ITV9e4096l/z6kV82bp6r4qAVDTR6YU5mCaVD?=
 =?us-ascii?Q?++ym4d3mr4+vkzQP1UzUeAjAyY7/1Ks/MgvzuEtDqEl1DqEihhgOhGECrBUX?=
 =?us-ascii?Q?Lamt1yeUTcWDPDz6j6f8oL+jMhMOf/1SbZHgtn9FegTvBUg9NkI5SyPdNikS?=
 =?us-ascii?Q?GLSX8Wzh0vuqc2mckbxMfGpfP1gbmlm0vCpmJ5uDhrDi0tqfhGnoZ0EeQj8T?=
 =?us-ascii?Q?mzdYXe7gxdThULVGX43MpYFkyhdsWAP6GGps6V86T560JiHY7H1JGc/iiw1m?=
 =?us-ascii?Q?0tItVlwx6rDVoOXpqFSSL27ju8PwhLwtBcn8lO2SWPStaNLhePKjrHFN1AcZ?=
 =?us-ascii?Q?ocX94+mVZXj9wkbOPQe3PKtQHxRZWreB3YjAbGgHU4sjlfkXnj7ycXmzo/tZ?=
 =?us-ascii?Q?mw3dx2gcV9Rjff4UEXSiDvvTC8EBCT3pwvTPmIoDO2lBImBvsYYfSEVeZ3m1?=
 =?us-ascii?Q?f5gv8haGfrEOw48Rth7OMcXrlBvWHFBXZkJfUM79wzmeBVfdWDtY7i2T1bLG?=
 =?us-ascii?Q?KCFXRCCAsQPORUIvISl/oUYFBG7bWIRU4UxpbljhpFpsIkCOq2aXLPdjqlLC?=
 =?us-ascii?Q?qLGFdOZSU4yxdlDSOjYlgS5OxCgO9R8Bq55TrRzlWVTSTR23MayBX5OZm6uE?=
 =?us-ascii?Q?TABmtYqrG3+6YxNUsJHEopR203tI+UCwIhJNVtOyqIrSLc3E85HfAU975jKW?=
 =?us-ascii?Q?E6brguXKnbRlvcj2zMy7f1dJWKLfKIAS7hwZnwQi6TJoG7jMcI79wqaNqak+?=
 =?us-ascii?Q?3gUBHcRkze0qawGPaJofmXHwf5Y9yQohiU65lp0IYULcpHR8aAr5SoP76+TR?=
 =?us-ascii?Q?1YM+ok5Sn1y6hb18Dtz23PT9/JcBcU9xRJDeU0/b/Pc7SAF9xyXYB2AzTBeL?=
 =?us-ascii?Q?m+qny8+4GQ0GoSA/mdksMkmhC4QUPd1vhUO8CNAWiT3vdkRVP/mayYp/g/Or?=
 =?us-ascii?Q?LqLfldZ8oHr0sbHOZPTTyVcCI0phbzXV+SojH9oxCe+jHpW24YklaGnOKz/H?=
 =?us-ascii?Q?0N3oYMvGH0PcSk6RT8v5THVnICPJcMs83A3Yv8vHTN6MZpCyK8PsTr6tRjCg?=
 =?us-ascii?Q?Ww=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3614631-096e-47d1-3fa6-08dde9432786
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6672.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 10:34:39.3900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/RcMO82OZQ7UVkBq2EMQ4djWAxfCiGtR8TAlprWjcwhMgj1uhQOoSX9oYIrGG/hAFMfvxw/DcPpMl7gGJoW+SgCMbF8d+qxaUmOTBu3c2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5316
X-Authority-Analysis: v=2.4 cv=FqYF/3rq c=1 sm=1 tr=0 ts=68b576c3 cx=c_pps
 a=OS87ud8qvrZ0iR15IeP4qQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=sb9_1Hy_xcmUxi8JK1kA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: TTgSKOWhGFDFU6hJlh4tm69PRkGpDDie
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDExMiBTYWx0ZWRfX0cVCZ1Ejsr4U
 hWn9A3OJv6mngbMrRurQL9SHi11Jdw0cmALqFRrRKTf/1DrljS2HWUTOcK1hF+t+9p7NNa3TIsc
 hPJTciUuREDPOovsc7h3tRjvpJO8Kk+c5p5dtTnF2vArNsWzfd/MJEIglbmWtN0bRLTGctGncuQ
 krCCnAaU7Rh5ek/JYCP9L/e6pdOsjBgT7tBmcvskDWz6P/tgiLHsI0q+iCvGiEwesUvdVJExIwo
 yZZfMxogEtLdwxT3606VGB17YML0kUG4Tc2ebYHrjL6YHC+Yw1XKPCC0mu1NM82BN7FE6JlKc1x
 lNlUde8pMBgetA17XGSTd97m8xS9Xw0+kiCSJnZnpCNp5A5b3fdLSPdyPvd7rM=
X-Proofpoint-ORIG-GUID: TTgSKOWhGFDFU6hJlh4tm69PRkGpDDie
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 10:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222656

From: Ovidiu Panait <ovidiu.panait@windriver.com>

If TCLIBC='baremetal' is set in local.conf, nativesdk-libstd-rs build fails
with:

| error[E0412]: cannot find type `c_char` in the crate root
|   --> /usr/src/debug/libstd-rs/1.75.0/rustc-1.75.0-src/vendor/libc/src/unix/mod.rs:56:29
|    |
| 6  | pub type c_schar = i8;
|    | ---------------------- similarly named type alias `c_schar` defined here
| ...
| 56 |         pub gr_name: *mut ::c_char,
|    |                             ^^^^^^

This happens because rust_gen_target() sets os="none" when TCLIBC is
'baremetal' - even for nativesdk targets. However, nativesdk packages are
built against glibc, so the correct 'os' value should be "linux".

Fix this by setting the os field based on {TARGET,HOST,BUILD}_OS variables,
as it is already done in rust_base_triple(), instead of relying on TCLIBC.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 0df6f0904c..43befff9f1 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -349,6 +349,7 @@ def rust_gen_target(d, thing, wd, arch):
     sys = d.getVar('{}_SYS'.format(thing))
     prefix = d.getVar('{}_PREFIX'.format(thing))
     rustsys = d.getVar('RUST_{}_SYS'.format(thing))
+    os = d.getVar('{}_OS'.format(thing))
 
     abi = None
     cpu = "generic"
@@ -388,7 +389,7 @@ def rust_gen_target(d, thing, wd, arch):
     tspec['target-c-int-width'] = d.getVarFlag('TARGET_C_INT_WIDTH', arch_abi)
     tspec['target-endian'] = d.getVarFlag('TARGET_ENDIAN', arch_abi)
     tspec['arch'] = arch_to_rust_target_arch(rust_arch)
-    if "baremetal" in d.getVar('TCLIBC'):
+    if "elf" in os:
         tspec['os'] = "none"
     else:
         tspec['os'] = "linux"
-- 
2.34.1



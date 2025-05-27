Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C45E0C54ED1
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 08:28:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.46448.1748334491211088963
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 01:28:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7242e5e264=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R4oZqf029538
	for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 01:28:10 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46udmm253a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 01:28:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGTD3DcF8MuAQrIGdqxUQddFU0QPNNMsGVxiySifn9yj6uz74GmCU/Oags6RSry1LDytoFwOfCJx5QpQY9PmFsKCpg1k0yHgWTWhfavexvSpjMwZ31pEnTx0sP+F3p3+ix12PgydPnzvv1XoWBh4Y/mjoLlye25xYp56CTAlLeCcdBXIKuq5ZPWC3hwShD7N+syOK5/40PDI6kbHSq1PtcgRPo2rtX6aSNqapKVcqSRNLZD7jn8qrDiJ5EZxqgnkYjqv+Bg+w7oKU+0Pno89P4HDPkXEKlgf36uuxmjfgv1pDHK0Os7ykZNMN+BzA6Z7sb4e279/AusuYJJnW50lfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+dgq9U+6nNMBcMFCOPPZuOCso5/BMHt6wfxgSUkKEI=;
 b=MGNsTQdhWnxq3s1xbhepku26mWOVuk3ySRxlNuEPDiBvz0Mlbx6Erb+5j5aM7ujxRwPNy/EuWb9Lt7VA+mtfo1OCF+cOw56ZlTyCt2TBs8jNzbiD9cqHo6Dff+FU4y4bgLpRR+kwrfU5PhOjDakeCpkOaDloI0l50AUEjN3ii83z1mf7Mcs7Y6vUK+IW4YAqSOnvlB9FAfYkPn4KhadAIsVdD1UifKtLIuZsgd6CJ+w33ObeSU96Da1dwUOmfzl2YFynlzomwLid96ROpFxPPgdjLpfdIVM89gwLbaT4zDSNzvQg3gpmiFnr2D/RWJzEtSWhaVKY/WNvCiuqxqwiSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB8708.namprd11.prod.outlook.com (2603:10b6:610:1be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Tue, 27 May
 2025 08:28:06 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 08:28:06 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V3] util-linux/util-linux-libuuid: upgrade from 2.40.4 to 2.41
Date: Tue, 27 May 2025 16:27:48 +0800
Message-Id: <20250527082748.1608410-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0048.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB8708:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eacba62-d481-4949-22ac-08dd9cf86792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?V9U7swtcaF5DK/YKPblMAa6IdMCN1NnvNCxbno5d4dpqRJjoAdLSes5wwvwi?=
 =?us-ascii?Q?tUbB+B/cUrnODyp2TiE9rHCX7cfa52NsT42izge+PQOl6ghTZOnjCVJgkBm8?=
 =?us-ascii?Q?mHpGgpDFbGgQv6OTwCTWr5wEZ/Rf4O0UyRr8HfROeInxBiQxn/FOBr9DpQfe?=
 =?us-ascii?Q?r3vsS3OQX/MrTWtZsXrYfV27GjEMQVpORU8KPY87vvEQ+ExhL5Foh74xlBqi?=
 =?us-ascii?Q?IitRb2Ddeu8Tt5haQwcjgrLNYbnoaUKlwLSW0cEd7yzagMINjn/4pwLaQC3S?=
 =?us-ascii?Q?hhvgtu5imfPpLjeXxNeqs7DFdPfDS2IosGBoJ8sfWsCMfFIdme1K6C2beViD?=
 =?us-ascii?Q?q2hO7HtEyrONafyL9BSNAeTx9BY+V58TsDaCIvigGcYlQNXNSjdsnWV2xLda?=
 =?us-ascii?Q?ufyMVgBQbTl+mThftxhb8I3QzpsLpZCUmDoPXbppEC4RCBCjyCDZCkg8PFpc?=
 =?us-ascii?Q?hMdbJhjqikqQJFSH4m8cnF/3z78sHmOmpwLcTknUiI3/VQ3qz3RFZs0Ol3O/?=
 =?us-ascii?Q?3WIjQlSpvyJM50bo+zccxZsjFYTdi4ixw5U3c5HmYFLAeB17/BVg2YpJW1wV?=
 =?us-ascii?Q?doDt5kbG4qGLomnKBOwSDIqGMZMUqI/eu/hCoibhIdRvfwclA7ssPU27vTBk?=
 =?us-ascii?Q?rF19R4o6eLpfQVm91L7V4CdH5QVLpBWEhNypAs8hrvxQichWCa5J9buPj5nF?=
 =?us-ascii?Q?9RAHEZMasHzluefl2IqLDUIKREvC269yRGCvKgNa+ftsJ/+sPWvOV+Zm/eyI?=
 =?us-ascii?Q?SkquMnj4mHKEvL6EeC33zekLNJ7nqzKe3pa774yIX3vwM6Q4uWrbt+tvcrhm?=
 =?us-ascii?Q?+KG/yMx3DVAZuysUIw1yLefLPGUl6AXjkAuNEpRgmz0m1pnFUMfo5KgFtSIc?=
 =?us-ascii?Q?Hiuu3IPv1an9yd8qQSP2jubidks8AoZ+T7opXi5iMrGOuUW4Gu47ruy64V6m?=
 =?us-ascii?Q?kprTIpjvWtPui+baL/PAaYliCaZGSlySl1kg0MMjQB5NeE3yui/GjoCHEBQr?=
 =?us-ascii?Q?U0Jkvvzx2NQSEMHqgOZaMjYfxZGvoZhpM76mkJO/RgE0mi2BPUcuR3TVUD03?=
 =?us-ascii?Q?yget+/z7E06xdpSdrRNFw+Wf2iENLf7rfmyfRoEkQGtcyP5KaeVnVyclYK21?=
 =?us-ascii?Q?dE5KCcsP5E7cA65sl0Dp9ArbpbbOwYnIy9rAH3HlZ+ZDJ/aylrtQfBsWRpg9?=
 =?us-ascii?Q?W9Yp5I5/wsPPtGFDDK9dG7xafm3Hu1CBKSNIiHkOIHsN6ZQNLtdjQniMK4Pa?=
 =?us-ascii?Q?Z7iK6mYmGrR5qZzVasrhHSLT/iRkCKFUUQdYuIA1ttOEXUxfixL9EcdQZqXj?=
 =?us-ascii?Q?c2EA+l/UypFF83/Tb7PLLubTZ4sSoFWunRLEUzJ49VJ/a42FLkLdpcQ0qq5V?=
 =?us-ascii?Q?f807iExiq+Iags6bkvlYoGIVyk2BHvmaRhyrLz7kSF9mPqK2HE7Oe8SmF8WV?=
 =?us-ascii?Q?aW7PWsmpEsG81f4YgA7CXzj3WZDTJG7oBST4vV5VnJccsLp8z+g3rKzlXpF2?=
 =?us-ascii?Q?rTLYPxut34VbgOg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?O3yd356TSPy7hNdKh9SiCp2UXC1JyHIMFAGcxi8jkAIcxuLUYhl1QeoNb0vK?=
 =?us-ascii?Q?5WcoH6PPLodpf1gcOJetUpURC5jph47VcgiKyuN1OPMLVwbApxrat5k93S+6?=
 =?us-ascii?Q?nHTZzeCkAiLJKtSNkbDKAniIRjqw8Nr2m4lKL/NcL0VS13IBxm3iOTh0WFVr?=
 =?us-ascii?Q?ZBjRKSlTs/sf8fESkp4/gGFMmWioD+GvMnscSxCU5AbFmU8cOcrMqw3l1JnW?=
 =?us-ascii?Q?AltoEzNlIF58xM/G8D/yptzTSZE/OkAzGd/z4nEfZKT7KgPUc5jBmYEld7hd?=
 =?us-ascii?Q?QAd4LpA2X0kJY1QFaF+nM4GXcHmBoowaHokW/3dCqtgmm6vW48RnpiyV6Nlc?=
 =?us-ascii?Q?0HVP0gvYoNvuByjzjrBDVntmFqB1aX3ad68L6yPzWJ1K3MVNES/SBlqmJeR9?=
 =?us-ascii?Q?l221ZSA/qpmYwVGAeT8lw0nPnHFPVyPuLO/Zp/RDMzhKaIcpyg7qryrRGsZl?=
 =?us-ascii?Q?AEcJVB0oA3djw3+0dXraEha8Z4LBiLr+lWCY1OxUvXZJPXxylPW9Pv5J4AeQ?=
 =?us-ascii?Q?ftK4INIOGXIRX+joR+T0xkFuUQ0bUldyJE/8wijy9HWI78MSBRu+ba4zWxiM?=
 =?us-ascii?Q?Ak4DVoAlVlm2wcp7CXdkwyMI2Qwg/jsST9wxmDM+ChAid2rcf9I89RyEN89/?=
 =?us-ascii?Q?Aenn2Kw7JHXigEODQQppx+uxp0bZr96rPTtpmNZ0sQatb91z/avZNCA7OcHB?=
 =?us-ascii?Q?/8/uD+5nLgFua2CT3zuDddXx6//LXWjVsAZxZy2+5AeM+qdZ3A3cDbGNfA4z?=
 =?us-ascii?Q?6ActWSYzdMG7ls6MhV8hskHNGvWcRhQDtC78NkAP+hD0UB4+pFjrJgUQUJlV?=
 =?us-ascii?Q?sKTfH0P6H+IssrFgiZ3dJCaAu4IYMLGSrtNxqL+xCSprMk4RZO7TaS/566kE?=
 =?us-ascii?Q?bv9HoyHuDS68g2m80FKrE1BYgYGTgHN4XyBC5yz4qEUKLzQjXPvsGD/yrdpA?=
 =?us-ascii?Q?iYxp1+rFMAfPK+JZF8lXqwFA4/BP6sckwqT+8cluuNpLZhvcwTzxEXEc3P+F?=
 =?us-ascii?Q?nSUSS8Oq/+keXmlCfES+Ss/fUJU2/ZpXWcBtJRvee2NwRW7749opxjA4bU3C?=
 =?us-ascii?Q?h2+n2E148ETw38AVsav2TMf50ZfmpG4Iw7jj+BOX6JO7dPyNrD6llOVX2vxS?=
 =?us-ascii?Q?bEFhbmXYkX1wo4TDDQ9c/wKIYPMx4h4ihUQif4qwSO1I1A/Ed/gFoYuOCzp8?=
 =?us-ascii?Q?Hh6F6x6LcVntRQczCQhEtPnXjWZCmkZ//DEI8L7S2QO0pyCnoBGY0RJOh3mA?=
 =?us-ascii?Q?o0c66ZbhKUti7QjmBt2KHKFn+DHROmpQoW260zwZiKShkRCTC6wfxcG5oPc6?=
 =?us-ascii?Q?QHusIZa0n9YIEIkEp8Hz0L2LD2coaF8cq6EtnpKko8TPA49zl05a8VmCIMPA?=
 =?us-ascii?Q?3SKsHG+r+q8NI6SfzxQyDLdvkOJ7qF8h2MquizJrO/rmmaiYi9fCNpZMWmtn?=
 =?us-ascii?Q?Npm3Z8ZxDA3ymiQr7/3y3sSZdQh8pdQn0PuCfdpek57K4QFjNqhXDcVFi77e?=
 =?us-ascii?Q?bkPSht/nYQMPbML9qy4tfzJ9yAdgbnFq6oo4YgoNkg1djoujl3wFtRQlRtCQ?=
 =?us-ascii?Q?vkUEQGpmegQTjZ8yLBGiqJq40e+stKgPjhcxuU0o?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eacba62-d481-4949-22ac-08dd9cf86792
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 08:28:06.3365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CHGWqbLl4PBSaxCZv7OeL9oyj2vYLGRkrLUf07ACbxoo/7C02m1otnQvoMe1bXYoF3jnOWV0K3cLG/GGcAma6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8708
X-Authority-Analysis: v=2.4 cv=WpErMcfv c=1 sm=1 tr=0 ts=6835779a cx=c_pps a=Uxc0GFoxdPZgc4BcwYY9pA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=Sv4y0yS6AAAA:8 a=D9tCBEehAAAA:8 a=97tBzXoAXqLsJKXELb8A:9 a=YzbTiWrLKRebLl5P:21 a=FdTzh2GWekK77mhwV6Dw:22 a=I7ze7AG8jwQKfjVvUIqj:22 a=Q0Uz2dhPmm7nD8Nyg-vj:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA2OCBTYWx0ZWRfX3SH0GIdV29iC Dw+bswH9A5uyAWrTXcm6gd2AqOfHX44gAn+CkgEOkPkpbbWknfNuBv+EVl1ypS9zqyJivkXvGO/ pSKn9rhePa9jFRZU7m+47jduUChR0d7BQ5BKuv/r3J0zMg3X35g7Ghj8XPaOZdsgBkt7Q4GNf7J
 rUTMQpR0+dmhf04t+D/BxtNC4s6jZQYqg9JTz+BQje2mU4SQNHsve+iGGBTjAOdk7UCAT7+SHtS NVMCMt7T2nL7X75pBKEsJXoGOiOauJDtd2ZaVfW45yWQIQ0IjG1Ctp0CaMgrY2qbQve3002Uj+m Fyp/3B4TYfzOr/LcM869mCOdTlyjKRBp153rEWTHhnWs1IfrdV4LjpATs5260BBe43wIYTNhBVF
 cXjdhm5lcgMaHgJqP1djvsm5aXga/Hpg1DOvDpPxOpdAir9mQ/7156zuXyVrSC4/O1GdBsVV
X-Proofpoint-ORIG-GUID: xHZNc23ECPnxzvokVIquJZRDKouVrdFc
X-Proofpoint-GUID: xHZNc23ECPnxzvokVIquJZRDKouVrdFc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_04,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505270068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 08:28:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217287

From: Chen Qi <Qi.Chen@windriver.com>

License-Update: add EUPL-1.2.
See https://github.com/util-linux/util-linux/commit/74f3265b9a079f9f60ad6e606d77deae0029a43a

0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch is
a backported patch to fix kill/decode test case.

0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch is
used to fix testcase failure of lsfd/mkfds-foreign-sockets.

The su tests (su/environ for now) are removed when 'pam' is not in
PACKAGECONFIG. This is because su is not enabled in such case.

lsfd/option-inet is removed out of the excluded list because upstream
has fixed the issue:
https://github.com/util-linux/util-linux/commit/eaa3870880aaa8d3d6b1aa8ea6bb19a717708b8e

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...d_2.40.4.bb => util-linux-libuuid_2.41.bb} |   0
 meta/recipes-core/util-linux/util-linux.inc   |  12 +-
 ...dd-sector-size-commanand-line-option.patch |  90 ---------------
 ...gn-sockets-skip-when-lacking-sock_di.patch |  36 ++++++
 ...code-avoid-using-shell-built-in-kill.patch |  36 ++++++
 ...dd-sector-size-commanand-line-option.patch | 105 ------------------
 .../util-linux/avoid_parallel_tests.patch     |   4 +-
 .../util-linux/configure-sbindir.patch        |   4 +-
 .../display_testname_for_subtest.patch        |   6 +-
 .../util-linux/util-linux/ptest.patch         |   6 +-
 .../util-linux/util-linux/run-ptest           |   4 +-
 ...til-linux_2.40.4.bb => util-linux_2.41.bb} |   4 +-
 12 files changed, 93 insertions(+), 214 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.40.4.bb => util-linux-libuuid_2.41.bb} (100%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-cfdisk-add-sector-size-commanand-line-option.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0002-sfdisk-add-sector-size-commanand-line-option.patch
 rename meta/recipes-core/util-linux/{util-linux_2.40.4.bb => util-linux_2.41.bb} (99%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 4e8701ffdf..b0f2a9d497 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -6,20 +6,22 @@ disk partitioning, kernel message management, filesystem creation, and system lo
 
 SECTION = "base"
 
-LICENSE = "GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause-UC & MIT"
+LICENSE = "GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause-UC & MIT & EUPL-1.2"
 LICENSE:${PN}-fcntl-lock = "MIT"
 LICENSE:${PN}-fdisk = "GPL-1.0-or-later"
 LICENSE:${PN}-libblkid = "LGPL-2.1-or-later"
 LICENSE:${PN}-libfdisk = "LGPL-2.1-or-later"
 LICENSE:${PN}-libmount = "LGPL-2.1-or-later"
 LICENSE:${PN}-libsmartcols = "LGPL-2.1-or-later"
+LICENSE:${PN}-coresched = "EUPL-1.2"
 
-LIC_FILES_CHKSUM = "file://README.licensing;md5=ddd58b6c94da86ff4f03e91208eb9cfc \
+LIC_FILES_CHKSUM = "file://README.licensing;md5=55e895a80bdd4ffc65e167a76d2e7569 \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
                     file://Documentation/licenses/COPYING.BSD-3-Clause;md5=58dcd8452651fc8b07d1f65ce07ca8af \
                     file://Documentation/licenses/COPYING.BSD-4-Clause-UC;md5=263860f8968d8bafa5392cab74285262 \
+                    file://Documentation/licenses/COPYING.EUPL-1.2;md5=c075d2767167a2355b23392018a1cbbd \
                     file://libuuid/COPYING;md5=6d2cafc999feb2c2de84d4d24b23290c \
                     file://libmount/COPYING;md5=7c7e39fb7d70ffe5d693a643e29987c2 \
                     file://libblkid/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
@@ -38,10 +40,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
            file://fcntl-lock.c \
-           file://0001-cfdisk-add-sector-size-commanand-line-option.patch \
-           file://0002-sfdisk-add-sector-size-commanand-line-option.patch \
+           file://0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch \
+           file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch \
            "
 
-SRC_URI[sha256sum] = "5c1daf733b04e9859afdc3bd87cc481180ee0f88b5c0946b16fdec931975fb79"
+SRC_URI[sha256sum] = "81ee93b3cfdfeb7d7c4090cedeba1d7bbce9141fd0b501b686b3fe475ddca4c6"
 
 CVE_PRODUCT = "util-linux"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-cfdisk-add-sector-size-commanand-line-option.patch b/meta/recipes-core/util-linux/util-linux/0001-cfdisk-add-sector-size-commanand-line-option.patch
deleted file mode 100644
index 73031318d2..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-cfdisk-add-sector-size-commanand-line-option.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 724b95ee6847613e23ca18f4918d4e65ff5b270e Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Mon, 14 Oct 2024 15:48:46 +0200
-Subject: [PATCH 1/2] cfdisk: add --sector-size commanand line option
-
-* improves compatibility with fdisk
-* add ability to work with disk images where libfdisk defaults to 512
-
-Signed-off-by: Karel Zak <kzak@redhat.com>
-
-Upstream-Status: Backport [fd38ee2274f7a30393d3839dfce556260355c3fa]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- disk-utils/cfdisk.8.adoc |  3 +++
- disk-utils/cfdisk.c      | 15 ++++++++++++++-
- 2 files changed, 17 insertions(+), 1 deletion(-)
-
-diff --git a/disk-utils/cfdisk.8.adoc b/disk-utils/cfdisk.8.adoc
-index 97fad621d..759f39f0e 100644
---- a/disk-utils/cfdisk.8.adoc
-+++ b/disk-utils/cfdisk.8.adoc
-@@ -55,6 +55,9 @@ Use exclusive BSD lock for device or file it operates. The optional argument _mo
- *-r*, *--read-only*::
- Forced open in read-only mode.
- 
-+*-b*, *--sector-size* _sectorsize_::
-+Specify the sector size of the disk. Valid values are 512, 1024, 2048, and 4096. The kernel is aware of the sector size for regular block devices. Use this option only on very old kernels, when working with disk images, or to override the kernel's default sector size. Since util-linux-2.17, *fdisk* distinguishes between logical and physical sector size. This option changes both sector sizes to the specified _sectorsize_.
-+
- *-z*, *--zero*::
- Start with an in-memory zeroed partition table. This option does not zero the partition table on the disk; rather, it simply starts the program without reading the existing partition table. This option allows you to create a new partition table from scratch or from an *sfdisk*(8)-compatible script.
- 
-diff --git a/disk-utils/cfdisk.c b/disk-utils/cfdisk.c
-index 183b7671e..f37e2d72a 100644
---- a/disk-utils/cfdisk.c
-+++ b/disk-utils/cfdisk.c
-@@ -2739,6 +2739,8 @@ static void __attribute__((__noreturn__)) usage(void)
- 	      _("     --lock[=<mode>]      use exclusive device lock (%s, %s or %s)\n"), "yes", "no", "nonblock");
- 	fputs(_(" -r, --read-only          forced open cfdisk in read-only mode\n"), out);
- 
-+	fputs(_(" -b, --sector-size <size> physical and logical sector size\n"), out);
-+
- 	fputs(USAGE_SEPARATOR, out);
- 	fprintf(out, USAGE_HELP_OPTIONS(26));
- 
-@@ -2751,6 +2753,7 @@ int main(int argc, char *argv[])
- 	const char *diskpath = NULL, *lockmode = NULL;
- 	int rc, c, colormode = UL_COLORMODE_UNDEF;
- 	int read_only = 0;
-+	size_t user_ss = 0;
- 	struct cfdisk _cf = { .lines_idx = 0 },
- 		      *cf = &_cf;
- 	enum {
-@@ -2760,6 +2763,7 @@ int main(int argc, char *argv[])
- 		{ "color",   optional_argument, NULL, 'L' },
- 		{ "lock",    optional_argument, NULL, OPT_LOCK },
- 		{ "help",    no_argument,       NULL, 'h' },
-+		{ "sector-size", required_argument, NULL, 'b' },
- 		{ "version", no_argument,       NULL, 'V' },
- 		{ "zero",    no_argument,	NULL, 'z' },
- 		{ "read-only", no_argument,     NULL, 'r' },
-@@ -2771,8 +2775,15 @@ int main(int argc, char *argv[])
- 	textdomain(PACKAGE);
- 	close_stdout_atexit();
- 
--	while((c = getopt_long(argc, argv, "L::hVzr", longopts, NULL)) != -1) {
-+	while((c = getopt_long(argc, argv, "b:L::hVzr", longopts, NULL)) != -1) {
- 		switch(c) {
-+		case 'b':
-+			user_ss = strtou32_or_err(optarg,
-+					_("invalid sector size argument"));
-+			if (user_ss != 512 && user_ss != 1024 &&
-+			    user_ss != 2048 && user_ss != 4096)
-+				errx(EXIT_FAILURE, _("invalid sector size argument"));
-+			break;
- 		case 'h':
- 			usage();
- 			break;
-@@ -2811,6 +2822,8 @@ int main(int argc, char *argv[])
- 	cf->cxt = fdisk_new_context();
- 	if (!cf->cxt)
- 		err(EXIT_FAILURE, _("failed to allocate libfdisk context"));
-+	if (user_ss)
-+		fdisk_save_user_sector_size(cf->cxt, user_ss, user_ss);
- 
- 	fdisk_set_ask(cf->cxt, ask_callback, (void *) cf);
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch b/meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch
new file mode 100644
index 0000000000..e3f9112192
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch
@@ -0,0 +1,36 @@
+From b3a1d92a9078fada31b2cf64b802edd616026766 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 26 May 2025 15:24:16 +0800
+Subject: [PATCH] lsfd/mkfds-foreign-sockets: skip when lacking sock_diag
+ ability
+
+The ENDPOINTS will need sock_diag ability. The kernel might not
+enable related configs. Check and skip in case of lacking such ability.
+
+Fixes: https://github.com/util-linux/util-linux/issues/3590
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/3591]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ tests/ts/lsfd/mkfds-foreign-sockets | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tests/ts/lsfd/mkfds-foreign-sockets b/tests/ts/lsfd/mkfds-foreign-sockets
+index cd94da799..76138a7a6 100755
+--- a/tests/ts/lsfd/mkfds-foreign-sockets
++++ b/tests/ts/lsfd/mkfds-foreign-sockets
+@@ -30,6 +30,8 @@ ts_skip_nonroot
+ ts_skip_qemu_user
+ ts_cd "$TS_OUTDIR"
+ 
++lsfd_check_sockdiag "unix"
++
+ declare -A tcase
+ tcase[NAME]="state=connected"
+ tcase[SOCK.NETNS]=
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch b/meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch
new file mode 100644
index 0000000000..dece0e94b7
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch
@@ -0,0 +1,36 @@
+From d2eeccf36542d506b660641a07a44f3976772897 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 15 May 2025 16:44:33 +0800
+Subject: [PATCH] tests/ts/kill/decode: avoid using shell built-in kill command
+
+This test case should do the same as other kill test cases, avoiding
+using shell built-in kill command.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/d2eeccf36542d506b660641a07a44f3976772897]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ tests/ts/kill/decode | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/tests/ts/kill/decode b/tests/ts/kill/decode
+index 03bc25ff6..57149899e 100755
+--- a/tests/ts/kill/decode
++++ b/tests/ts/kill/decode
+@@ -18,6 +18,11 @@ TS_DESC="decode functions"
+ . "$TS_TOPDIR/functions.sh"
+ ts_init "$*"
+ 
++# make sure we do not use shell built-in command
++if [ "$TS_USE_SYSTEM_COMMANDS" == "yes" ]; then
++	TS_CMD_KILL="$(which kill)"
++fi
++
+ ts_skip_qemu_user
+ 
+ ts_check_test_command "$TS_CMD_KILL"
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/util-linux/util-linux/0002-sfdisk-add-sector-size-commanand-line-option.patch b/meta/recipes-core/util-linux/util-linux/0002-sfdisk-add-sector-size-commanand-line-option.patch
deleted file mode 100644
index 8d47d8de71..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0002-sfdisk-add-sector-size-commanand-line-option.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From 96570c03f46e0a5c17e721737a38c717c67e358b Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Mon, 14 Oct 2024 15:50:40 +0200
-Subject: [PATCH 2/2] sfdisk: add --sector-size commanand line option
-
-* improves compatibility with fdisk
-* add ability to work with disk images where libfdisk defaults to 512
-
-Addresses: https://github.com/util-linux/util-linux/pull/3235
-Signed-off-by: Karel Zak <kzak@redhat.com>
-
-Upstream-Status: Backport [ef7b76baa17ddb5414691fa8f49d61415c30871c]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- disk-utils/sfdisk.8.adoc |  5 ++++-
- disk-utils/sfdisk.c      | 14 ++++++++++++++
- 2 files changed, 18 insertions(+), 1 deletion(-)
-
-diff --git a/disk-utils/sfdisk.8.adoc b/disk-utils/sfdisk.8.adoc
-index bc3ff9bb8..d1eaa3712 100644
---- a/disk-utils/sfdisk.8.adoc
-+++ b/disk-utils/sfdisk.8.adoc
-@@ -201,6 +201,9 @@ The default list of columns may be extended if _list_ is specified in the format
- *-q*, *--quiet*::
- Suppress extra info messages.
- 
-+*--sector-size* _sectorsize_::
-+Specify the sector size of the disk. Valid values are 512, 1024, 2048, and 4096. The kernel is aware of the sector size for regular block devices. Use this option only on very old kernels, when working with disk images, or to override the kernel's default sector size. Since util-linux-2.17, *fdisk* distinguishes between logical and physical sector size. This option changes both sector sizes to the specified _sectorsize_.
-+
- *-u*, *--unit S*::
- Deprecated option. Only the sector unit is supported. This option is not supported when using the *--show-size* command.
- 
-@@ -249,7 +252,7 @@ Specify the maximal number of GPT partitions.
- *grain*::
- Specify minimal size in bytes used to calculate partitions alignment. The default is 1MiB and it's strongly recommended to use the default. Do not modify this variable if you're not sure.
- *sector-size*::
--Specify sector size. *sfdisk* always uses device sector size. Since version 2.39 *sfdisk* recalculates sizes from dump if the script and device sector size differ.
-+Specifies the sector size used in the input. *sfdisk* always internally uses the device sector size provided by the kernel for the block device, or as specified by the user on the command line (see *--sector-size*). Starting with version 2.39, *sfdisk* recalculates sizes from the input if the *sector-size* header and device sector size are different.
- 
- Note that it is only possible to use header lines before the first partition is specified in the input.
- 
-diff --git a/disk-utils/sfdisk.c b/disk-utils/sfdisk.c
-index d8dd8d296..97d426559 100644
---- a/disk-utils/sfdisk.c
-+++ b/disk-utils/sfdisk.c
-@@ -2084,6 +2084,8 @@ static void __attribute__((__noreturn__)) usage(void)
- 	      _("     --color[=<when>]      colorize output (%s, %s or %s)\n"), "auto", "always", "never");
- 	fprintf(out,
- 	        "                             %s\n", USAGE_COLORS_DEFAULT);
-+	fputs(_("     --sector-size <size>  physical and logical sector size\n"), out);
-+
- 	fprintf(out,
- 	      _("     --lock[=<mode>]       use exclusive device lock (%s, %s or %s)\n"), "yes", "no", "nonblock");
- 	fputs(_(" -N, --partno <num>        specify partition number\n"), out);
-@@ -2120,6 +2122,7 @@ int main(int argc, char *argv[])
- 	const char *outarg = NULL;
- 	int rc = -EINVAL, c, longidx = -1, bytes = 0;
- 	int colormode = UL_COLORMODE_UNDEF;
-+	size_t user_ss = 0;
- 	struct sfdisk _sf = {
- 		.partno = -1,
- 		.wipemode = WIPEMODE_AUTO,
-@@ -2145,6 +2148,7 @@ int main(int argc, char *argv[])
- 		OPT_NOTELL,
- 		OPT_RELOCATE,
- 		OPT_LOCK,
-+		OPT_SECTORSIZE
- 	};
- 
- 	static const struct option longopts[] = {
-@@ -2174,6 +2178,7 @@ int main(int argc, char *argv[])
- 		{ "output",  required_argument, NULL, 'o' },
- 		{ "partno",  required_argument, NULL, 'N' },
- 		{ "reorder", no_argument,       NULL, 'r' },
-+		{ "sector-size", required_argument, NULL, OPT_SECTORSIZE },
- 		{ "show-geometry", no_argument, NULL, 'g' },
- 		{ "quiet",   no_argument,       NULL, 'q' },
- 		{ "verify",  no_argument,       NULL, 'V' },
-@@ -2373,6 +2378,13 @@ int main(int argc, char *argv[])
- 				sf->lockmode = optarg;
- 			}
- 			break;
-+		case OPT_SECTORSIZE:
-+			user_ss = strtou32_or_err(optarg,
-+					_("invalid sector size argument"));
-+			if (user_ss != 512 && user_ss != 1024 &&
-+			    user_ss != 2048 && user_ss != 4096)
-+				errx(EXIT_FAILURE, _("invalid sector size argument"));
-+			break;
- 		default:
- 			errtryhelp(EXIT_FAILURE);
- 		}
-@@ -2383,6 +2395,8 @@ int main(int argc, char *argv[])
- 	sfdisk_init(sf);
- 	if (bytes)
- 		fdisk_set_size_unit(sf->cxt, FDISK_SIZEUNIT_BYTES);
-+	if (user_ss)
-+		fdisk_save_user_sector_size(sf->cxt, user_ss, user_ss);
- 
- 	if (outarg)
- 		init_fields(NULL, outarg, NULL);
--- 
-2.25.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
index 8ea00dbb95..fe92afbc53 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From da58b4150f6932de36c962ea657713bcf4ea44be Mon Sep 17 00:00:00 2001
+From 43030388e831642d36cb7b9d4b63755e9696714a Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Mon, 14 Jun 2021 14:00:31 +0200
 Subject: [PATCH] util-linux: Add ptest
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 651ef2b..2a8012e 100644
+index 43a23a5..4a84531 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -11,7 +11,7 @@ AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
index 74abdc2038..ebb32a6845 100644
--- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -1,4 +1,4 @@
-From 0387d71516c978899cfd556ca512f530a212b4a9 Mon Sep 17 00:00:00 2001
+From 378998bf82e3b6ff46569077b29f95e72b734681 Mon Sep 17 00:00:00 2001
 From: Phil Blundell <pb@pbcl.net>
 Date: Mon, 24 Sep 2012 07:24:51 +0100
 Subject: [PATCH] util-linux: Ensure that ${sbindir} is respected
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate [configuration]
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 23594ff..651ef2b 100644
+index a5d9102..43a23a5 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -110,7 +110,10 @@ AC_SUBST([runstatedir])
diff --git a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
index 871b0b2d30..fa4ae02bc3 100644
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
@@ -1,4 +1,4 @@
-From 45450d0339cd7ee27f53c0f2fac1cc74ed9bbfb8 Mon Sep 17 00:00:00 2001
+From 728c2abd889d225535008c3e7a1eef4b8a0aeea2 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Display testname for subtest
@@ -10,10 +10,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/functions.sh b/tests/functions.sh
-index 5fe5ba0..a6c703e 100644
+index 1d7a425..b1f0986 100644
 --- a/tests/functions.sh
 +++ b/tests/functions.sh
-@@ -450,7 +450,7 @@ function ts_init_subtest {
+@@ -455,7 +455,7 @@ function ts_init_subtest {
  
  	if [ "$TS_PARSABLE" != "yes" ]; then
  		[ $TS_NSUBTESTS -eq 1 ] && echo
diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/recipes-core/util-linux/util-linux/ptest.patch
index 7345926b88..ad23001cfa 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,4 +1,4 @@
-From f9be73c3e2b0a4f0923950dcb058be85d3ee8ed7 Mon Sep 17 00:00:00 2001
+From 18bf6aded9b2a75185ae4b23a41cd2e4322c5e31 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Define TESTS variable
@@ -10,10 +10,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 50ab8d0..7e2340d 100644
+index 01e9970..c3313ff 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -64,6 +64,7 @@ tmpfiles_DATA =
+@@ -66,6 +66,7 @@ sysusers_DATA =
  dist_bashcompletion_DATA =
  check_PROGRAMS =
  dist_check_SCRIPTS =
diff --git a/meta/recipes-core/util-linux/util-linux/run-ptest b/meta/recipes-core/util-linux/util-linux/run-ptest
index 6886b66c49..1410229172 100644
--- a/meta/recipes-core/util-linux/util-linux/run-ptest
+++ b/meta/recipes-core/util-linux/util-linux/run-ptest
@@ -22,10 +22,8 @@ modprobe loop
 # for a long description of mount namespaces in Linux
 mount --make-shared /
 
-# lsfd/option-inet has races in the test script:
-# https://github.com/util-linux/util-linux/issues/2399
 # lsfd/mkfds-bpf* have issues with the gcc 15 upgrade
-./tests/run.sh --use-system-commands --parsable --show-diff --exclude='lsfd/option-inet lsfd/mkfds-bpf-map lsfd/mkfds-bpf-prog' | sed -u '{
+./tests/run.sh --use-system-commands --parsable --show-diff --exclude='lsfd/mkfds-bpf-map lsfd/mkfds-bpf-prog' | sed -u '{
       s/^\(.*\):\(.*\) \.\.\. OK$/PASS: \1:\2/                              
       s/^\(.*\):\(.*\) \.\.\. FAILED \(.*\)$/FAIL: \1:\2 \3/                
       s/^\(.*\):\(.*\) \.\.\. SKIPPED \(.*\)$/SKIP: \1:\2 \3/               
diff --git a/meta/recipes-core/util-linux/util-linux_2.40.4.bb b/meta/recipes-core/util-linux/util-linux_2.41.bb
similarity index 99%
rename from meta/recipes-core/util-linux/util-linux_2.40.4.bb
rename to meta/recipes-core/util-linux/util-linux_2.41.bb
index 81bd298dd9..00036e8a68 100644
--- a/meta/recipes-core/util-linux/util-linux_2.40.4.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.41.bb
@@ -356,9 +356,11 @@ do_install_ptest() {
 
     sed -i 's|@base_sbindir@|${base_sbindir}|g' ${D}${PTEST_PATH}/run-ptest
 
-    # chfn needs PAM
     if ! ${@bb.utils.contains('PACKAGECONFIG', 'pam', 'true', 'false', d)}; then
+        # chfn needs PAM
         rm -rf ${D}${PTEST_PATH}/tests/ts/chfn
+        # su is not enabled when pam is not in PACKAGECONFIG
+        rm -rf ${D}${PTEST_PATH}/tests/ts/su
     fi
     # remove raid tests, known failures and avoid dependency on mdadm therefore
     # See https://github.com/util-linux/util-linux/commit/7519c3edab120b14623931d5ddb16fdc6e7cad5d
-- 
2.34.1



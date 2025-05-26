Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83229C54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 08:23:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.24670.1748247828370639331
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 May 2025 01:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7241a8af5b=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q4tCUU022820
	for <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 01:23:47 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u9d41afk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 01:23:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xa0BGnlUExfhkh4WkgUShAvo6BxNG6F4cURjj+/fPsw7dAS3Bg2YgGOUqlFDfFb5GgLiN24JMVkBSm5S4ijJJtprky4GwGO7pT7oO6WkjdUrHku8PNDo+Q3aESvlCbPqBbxdafBprc8NcsAA9ZbmI0FevI3OLKUhWLB5jHA1q6IE9XXwOOY0qLp3igDJGvvddMfzarKOUMN6CrBlyeDtbdWUGUzfa3zGwgypzFrkAhqDrfKhQq5G36oevLlL4H7C9AXbIQVgj0crq9gl7zarmoZHxjbeNEUntezAh5vgup8BhdgJXEQpVU0NWzFsdF/B5QLkk2n91suz4VCNvoUDcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fc1iGe4KEirVf/bXwcpiVKgvvLtD5KyDZDekCRhzEP0=;
 b=wg+xdSPuPGTFMF4HFG3GXDxMHT2/dcKCeS9EzUwAMsdXFjlJQekRqJSKqdW10iV8wFZqSIJGMs0lHi54ddHNBDbEL71pQJFU0/vh6Ud4NGqtmlPt4EtJBW6VwYi621aeFREvZsyvKSgPZh3hiQIuCFVf4gdyrTRywrF/95HAh5qs8eUKZk4U8fzIlzk4EfXI6dZO6CaNLqzYNqIkVRdO3/CcstSMOiPP7b1T01M+qcnj10/iDxAyXoNPJ+QPRsOdTlUrgJPYd22/hbc9pw4uaVBH2nmG+NjM5IwSCcR5C1vzigs7sEQg1REOG4TYdd7o+SNWAO0MQ2TwSQAo8CARyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by IA1PR11MB7365.namprd11.prod.outlook.com (2603:10b6:208:423::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 08:23:43 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%3]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 08:23:43 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2] util-linux/util-linux-libuuid: upgrade from 2.40.4 to 2.41
Date: Mon, 26 May 2025 16:23:20 +0800
Message-Id: <20250526082320.1176072-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::18) To SJ0PR11MB5613.namprd11.prod.outlook.com
 (2603:10b6:a03:3ab::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|IA1PR11MB7365:EE_
X-MS-Office365-Filtering-Correlation-Id: d6931479-1271-41b3-9c91-08dd9c2ea036
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5mhhO/hJ8+KSOZlmAoYDikQKJe0it7w/UFEMFeV5lS4D0BoceJadaBjrIxh3?=
 =?us-ascii?Q?S8p3s9MJ/V8r7xcpyd7XLFwRidxUhSYJ1wsflh3c5Szj9WtERZNJ8mMCRy1i?=
 =?us-ascii?Q?sqvyGQpZiRG+zwB4ILc6OSR30PKzN2QRyz/Ej/sLz2YcMdAo5HPwEIXJqiYU?=
 =?us-ascii?Q?OGnavFC31Le6VTcE/PtE91sy6Yb8rAso7/T/zNtTc4lsGgo2CJzseQ4CUdYp?=
 =?us-ascii?Q?c5tdMpziOm2gj9MK4/RpgZf7es1xWK2gJ8Hu7u8lNiTX/RRbt7D1oWw/+zNY?=
 =?us-ascii?Q?7YhJM0dGcUOu2YhM3zhSe59myej4IU9+8LQBgsDQtd7o46fy9oYvA0Q7nB1G?=
 =?us-ascii?Q?MAmbLC6slz/NizrEeYtWD90+HzNS2If43CCnQoREfEQl5Z2m4hnqvjbYAVte?=
 =?us-ascii?Q?P2SZzHH3f5RRHHWpjqJaIUIP5VXLpuoUAzeRd0003cY5nyl9rRI4SAiRpksN?=
 =?us-ascii?Q?0sLJayUSYmUPfX6BzsCjR8tcnHY1MjAwGDOlcjej4FC8Y4U1wp0i/+IRy9Ej?=
 =?us-ascii?Q?MtTWf8Tr2BUPX46Nci7cZ5RKjoewbjUcHr0VFaVS+H9OixxscA04TKGM/sUE?=
 =?us-ascii?Q?2OSEPHYPZC/RtjydYV24UIVxJSh1/yDVCJaDgBP8YaEatmt4YsATcbXwgtAJ?=
 =?us-ascii?Q?hfuUNG8z0IdOG/NWWfzjLykJ0Uez1185gYiXuh0+x0p/Uq+VAls5ibA/edg0?=
 =?us-ascii?Q?+bvb5DgV2LNPslN3H+bflG07QBpQzsfnQ91qOz0xbilhd0HZHgSmRzelZpKS?=
 =?us-ascii?Q?WX/IgqJS/qxiAuBWD1dAMH/SmXXEkENAgIE5+IpSm6MLsG3qEp5h+ZxXC49K?=
 =?us-ascii?Q?RBd4UstB4SAoZWh2yTznPGXqEby7FdeLH9IauYWwIFnzDprl3iz5m1YGubqA?=
 =?us-ascii?Q?w6P/XjYvD0+leaSrguT9aS50paI9OtWSZHrem08dsWCNEdfq/ws5ugT+Zj8q?=
 =?us-ascii?Q?6IDQ+CUYpHqdQCGpA+Q5U3Cw5RESXR/UUVRLnuJOz6Mme7qP42/WaocvNKM5?=
 =?us-ascii?Q?pqRTz7/kD1RMsOfwp1eKx9tz1Z/rdlNAA8pzw5jSfEygLc3YTVZmC0/E1Sut?=
 =?us-ascii?Q?xj+rWEUmyGKwtLUIcC1ehKerbH5I0KVja4l6rmFkbWlCvd68F2RYkKTi5vFS?=
 =?us-ascii?Q?drrf0061uDCmQC/Gt2kZNC3c0kHemheB9Udc/1o3m14mAragKpJOkoqJSyk3?=
 =?us-ascii?Q?TrNtJaxx2mnIZ6dK0+0FBNTcIuM1UeZiLXrNezhYRybSznGsO+hI5BrbjPch?=
 =?us-ascii?Q?e+cpNZeek+LPAbiRLAwADhNAbpPLscPcIjl2hqKGX+s6SPckUEjr9gE5o5f7?=
 =?us-ascii?Q?/QIdEPvHImNOZJpa9KUnyUJ5LTNN1pudnppwjXxwil5QCZj9ctvDZ3me1m9a?=
 =?us-ascii?Q?Lo789Qvd6+8lOUb/G9D4QU8bnlAowDXh4o3hARBzF84/U6oKgQWbjHEAPeKL?=
 =?us-ascii?Q?AhRSJEVzMA3BV0qtV86zF/7MIINjhzRiTW5ciWW3YbCuinH19gmQQfGFDK+m?=
 =?us-ascii?Q?+RyjfT4DXNyIrus=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Iq2ezzQj9X1lmfeMvd7047RRMjN/W8DdliYqFphfVjNyg5RxhgC3+VFpvCC8?=
 =?us-ascii?Q?ZF/ErMXu7DjeWWoCj/8Cf/bypRnT7nBw9wu7T6gVTZKjyO5t1dNhIvdZeIUz?=
 =?us-ascii?Q?pVisf42qr4TqyMvSyQS7gFtuGk0EF0XEppG4Rrg6uAcAIcM8kP6G0Z8rIcAr?=
 =?us-ascii?Q?7FCCGXiuTF26Yth9+pS048FV8jl9cycJikE3RDbZMrB5iT4BWKFEF04UuAPh?=
 =?us-ascii?Q?pO9kiU0G1PBuozIPf06NsolsrK0D617jBv4GdLALxsgY79uJ15n5S1JcTtYn?=
 =?us-ascii?Q?niF/HvRVaOVSPR/xghOofh4Me/NVxIEfqwpleAoriJe9er3nUaLEcF2mJjxt?=
 =?us-ascii?Q?V/5stSxveGg7tF8QgeQgD2HnCmDBFT4mBqu9GWYRPwFV2k9Mnz9psf4BjOHn?=
 =?us-ascii?Q?Fr4JTAX87UXjEcfvxp8l7CEQPoY+dOCMa36q6BxUIk5NRQne/FCMPfcczC42?=
 =?us-ascii?Q?VGoPMC+8aKokCT3UWKwa1xKtIwu911zLthGJ0PdMLT4wYKjb3lCIiyvixi1n?=
 =?us-ascii?Q?IXTH639vIKDsx3L8RrrJ2LLgTyPk9Cc2nnAGpB5gAbopsQDwZSvVbR+uv71C?=
 =?us-ascii?Q?ZmzSBhSaHlsKRJ1VA+BOGWPbjgNJdRbRt1Q8OTuSlJ5RVVhIv4vLMdGqYJkX?=
 =?us-ascii?Q?rbd8pa+BpcI6h0lC2v93RkDfHsRALZN9OCmNjXHeHkhrapx0chol9gZRxajf?=
 =?us-ascii?Q?o3jTW/ZtuYBrZQan/JfFliShjaZ56zX3OIj+X9em61skZi+yFMAAgH57r/CZ?=
 =?us-ascii?Q?Pt01RIbQCuWhDQwXg8pWO51oo3/9IoF4e2qY8VRlPT9e8YbMRQiaa3LxzH9Y?=
 =?us-ascii?Q?Tjs49bgRA2sos0fnaXz3147t3fnUrnEtt4SkOhuzm5P3OCaQ4kUCHRhRji0r?=
 =?us-ascii?Q?SKPwUpoS+2d7b+xjUJn1WQCty9BgBz5Iipk5WPxKQ2jZxloUmO7iv3w2vhm6?=
 =?us-ascii?Q?9mzJybBpXQc7PCdTalCHUX+7jDA1JVmt4Xzf0+LqXnl3Nl7QNSuAv80TIJ4a?=
 =?us-ascii?Q?gOn340eF6TG8S2eX/s8rH4FOUtSVfYpuimmX+hC0K5Cg5Ml5AbZY/6keEr8E?=
 =?us-ascii?Q?9Ycu4MseYABT9+5TKI0O3n0Nz3qRO1wIVBS8jdaXq8p5n1ILpeKr1ZtjRmOE?=
 =?us-ascii?Q?nxofdlCaILhYBPLJHLuVEnkJUrl2bZceHTlRFmL3FG9S64mUdWl9jqk0PYvY?=
 =?us-ascii?Q?MP5ecNn193HOHjPZotFqnzjmsoveJJB/Am010K6MBSHAqMc8xYLrMkxcM263?=
 =?us-ascii?Q?3+Dz72w4ib+cfqljVUT4T84Q8xDjdamHSVTyzbTKtfaHp16dZGY/OIT6aEE4?=
 =?us-ascii?Q?gRTblOv1RxQ1fBFqdA7+g7iHUFbDwtTt01dgnlPNdBmPO+4JIhEPa7veM7L/?=
 =?us-ascii?Q?A42WT6DPmrW1FNpim/9AYPvoamKee7OZsK+WquMuqlXzAQdVp4xnBO4xzYVB?=
 =?us-ascii?Q?vHnHgJSeVRF6Tmevr3+hwx0kr56LVIrLHFOb5Y2gXGOXgTZwisIsK3JMaBE+?=
 =?us-ascii?Q?l9pFpLL9gv3kXy7slMXA2gXMyauO/kTNznO6VTtwWclGCLKgBcvsMcj4Nt5D?=
 =?us-ascii?Q?SOKnN9kmODeYpxi7fgynkXGdbJJEE+2tsi5NCpcY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6931479-1271-41b3-9c91-08dd9c2ea036
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5613.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 08:23:43.5660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MzcgobrBKT4OAuKtPtFlNZWuwToUitCtoAwWqbiVmeBg9k6id+CP7F8sauUBUe+vZ/PRpwyCLKgMDNt7ymCs9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7365
X-Proofpoint-GUID: bB-l0OUUVuUUhCbBbjr7sjUOA2u-Jrlu
X-Proofpoint-ORIG-GUID: bB-l0OUUVuUUhCbBbjr7sjUOA2u-Jrlu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDA3MCBTYWx0ZWRfX+LeFnW2+qc9a 9v3YU0N8J4utY+qy2+S33dLTp48VQ6icOIQObAwgXeh25Y9fJOKU6joIsxr2KgHytrmGT/9B0H7 d7gIdTn9Iq9c2AE/+5kpJ3AWpvI60KmyRYD4Ngc2uLMPyY5d6EQNJHxlOxkzF+sdIcfciCANziw
 QFqhKgYqmQc5hY14EQZXByNvaFv5HXudRNVuS82cSJy6tHKrd0wQJvzN9iTnT5qZ2fXk0/ftagd uYWCa2hJ02F0gc+nKsi+UN/8ybUIOJlAhoFcNXRX75XpXjnKW4Zi1sYcocva/PEXQoo3JXvq6V1 g/NkdxsV6BnVwC1QFig3nSh87sum13VLjTkmM2yOVZzoxQqoR9AiHrerKP0cA2ongOTfHLhqPsQ
 9ci3v9deV/SY7e5pO1kyR8IGub+yrs9MlSoSkYSiguuU92YafK3dJsFBvhvMVGb24TZePq74
X-Authority-Analysis: v=2.4 cv=fdCty1QF c=1 sm=1 tr=0 ts=68342513 cx=c_pps a=jY3SVLPFeUttfGeyR2Uc8g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=Sv4y0yS6AAAA:8 a=D9tCBEehAAAA:8 a=9tiKmL3t1adPbPjYfDMA:9 a=U5fXjQbKo6chaReL:21 a=FdTzh2GWekK77mhwV6Dw:22 a=I7ze7AG8jwQKfjVvUIqj:22 a=Q0Uz2dhPmm7nD8Nyg-vj:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_04,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1015 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505260070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 08:23:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217256

From: Chen Qi <Qi.Chen@windriver.com>

License-Update: add EUPL-1.2.
See https://github.com/util-linux/util-linux/commit/74f3265b9a079f9f60ad6e606d77deae0029a43a

0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch is
a backported patch to fix kill/decode test case.

0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch is
used to fix testcase failure of lsfd/mkfds-foreign-sockets.

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
 ...til-linux_2.40.4.bb => util-linux_2.41.bb} |   0
 12 files changed, 90 insertions(+), 213 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.40.4.bb => util-linux-libuuid_2.41.bb} (100%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-cfdisk-add-sector-size-commanand-line-option.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0002-sfdisk-add-sector-size-commanand-line-option.patch
 rename meta/recipes-core/util-linux/{util-linux_2.40.4.bb => util-linux_2.41.bb} (100%)

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
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.40.4.bb
rename to meta/recipes-core/util-linux/util-linux_2.41.bb
-- 
2.34.1



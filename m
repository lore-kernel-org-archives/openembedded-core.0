Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697C6CCA470
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 10:35:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13835.1759314932074431600
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 03:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=T6m3gXqI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2369a0ca18=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5919SW0D710915
	for <openembedded-core@lists.openembedded.org>; Wed, 1 Oct 2025 10:35:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=nfJtPv6rX
	zQZnFTNtB0CVWsT16/aIDGF1TBcl27S+P4=; b=T6m3gXqI2UEnPj/kVe117phov
	zq0BMTfXu1rIfcwPhDl4kV2JX8ZO5cpAqO6fedxxSvr3IBjyuWQzXy4fwUWn1XBT
	ZWThCd8A8mPhG66D394sbzQX0Ne6TsJeQhgZ8/B73lj7VXzpP2TiavOJ/2MiylG0
	aBV7VGLX2lIMM4sbt0ksT24uMR+12YOTsk+l36z6Dk92p+M7Q2Y1X9bD12bB6u1C
	Pk6a48vA/PpmeoFEY2/5wODHG0pap9mDWLISu+yuNaYuPfsB2P8dgCZv7xKZRT7e
	BqYkptQgFxhyyl4VZxWo7VmkdAYAQ6xJBX6CQne5BkYnM+qrMaNmEQFOUBxdQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011029.outbound.protection.outlook.com [40.93.194.29])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49e6w7mtnf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 10:35:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xLxNdZ+9frhLsOnKgTEhEcYa0qaPjNU8qCVJBhwD+c5zBGqPrbNxy50FdNbl/KmHQH7YnsYDnGBaTCyHNSaM2S07fa7UXl+vZky8HKEzKjetFLWbXUX1Amp8CqruSZyV7kuaNWVRJiVey4lGMWhtnKsawuOsGjzLyCgN92fbsTqiVnzLqrcCuj1f3rdIbq7KJbHAq22YY5+D0ZymcsI8xaIyPPrAjh94SnjfCbzB0iUbI4PbEesOcrlox2mkmn8bJDEnxNyaw2dpwn10kwf3tD0F4WY7DooCcpOnNOdRsZpTbAt+8wOo8lfJaGVMOAMeOGiWDn5ErpxqeRXOcYvceQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfJtPv6rXzQZnFTNtB0CVWsT16/aIDGF1TBcl27S+P4=;
 b=ksavwy6Oa6tAeQqGkn+mB7NlJks8RbHEjR8JrxH5X8y6mlkLr+hEbBV872hfVvxK0nh7bkHJqzt+5PAXr4cLSFKTxgA/iFZSQqTZic39eTzb7kBngzD3RDtDOtXOhpqmPk1+xwyxupXvLfrmtf7qqiT8jfHEijQD2Z+chhrgxb837YW+Q8hzZPE9P3yvKouq+YiqncF7JiAx488uabkJ+stylEbmD1NRUzPoCC7hXgAMamqHn0bJ4/7vDVYwVkJ0VpEi134R+blJPL/UGSYbBtCiE3iy83ue6dtnwJiPmVu1L1A6PVtL0ExgSJ6yPNMfC/q6m2tKYdUz79fQwEOrtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS0PR11MB7382.namprd11.prod.outlook.com (2603:10b6:8:131::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 10:35:28 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 10:35:27 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] clang: Upgrade to 21.1.2 release
Date: Wed,  1 Oct 2025 03:35:16 -0700
Message-ID: <20251001103516.2768272-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0277.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::12) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS0PR11MB7382:EE_
X-MS-Office365-Filtering-Correlation-Id: ca5a2e2b-b4ca-4769-4162-08de00d63c96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?e9h/F8KmK14nHKhCUk0HxBn02yaBlHrQtNLlU9I0NS8W7eFh5vatE2s2rO8o?=
 =?us-ascii?Q?52vsCR1nrCCo34qsYrD7Wwsciygc5wbdlTIZCRIVu6iJLnRn6QHGf9fKXM8x?=
 =?us-ascii?Q?oxP+D5tqIeQMl3pDGPe0obuYSAnakDQjIghA/zv25pJBVIKzW1SS3lTUERCz?=
 =?us-ascii?Q?WHdQ3FCAvy3PpUlejUePQ/GJko6Tt7bfm+iTrF7f2U13PHch2ZxUN4wVLcrq?=
 =?us-ascii?Q?spAUKua0FGK+x/NbUhocj7LZrweNu4QhdH4QZjrhmT8j3zb2EZ9EvcmT1wnv?=
 =?us-ascii?Q?wC+bCJayzjfeDI0wYOnLIENdwQxTxTMYM7CvudVEL+ZCYQRhsfKvGV7e+rSk?=
 =?us-ascii?Q?dAuwNyoJZ+sVEKc1qCgkjIIPFbywBjclCFLGwHx9D3VzGJUR6UGm1h8oZJgz?=
 =?us-ascii?Q?pM0Iiswowk3KvRbpBFdX+75CctAGfLd+Z2fL6dbmKxG78982ELljmggjR5Wb?=
 =?us-ascii?Q?zTNVPBB+HG5NvUEq0ZDZvAz+sDui6YPzWC4BhwQu2MXIcGLS1+iWF61eBDgX?=
 =?us-ascii?Q?1Wn1T84akWJn+pdmc5Hw5BrTqMgjyGctN2zNZF1GGvOY6nPGB6o2QxT/ZKCC?=
 =?us-ascii?Q?bfq7q/uygShJuinQ8VwPJo2MEFtiL6VyPoO2uS/u3R1E8Wm0WXKiU1a4Ad4+?=
 =?us-ascii?Q?RroexFZe6Bngu/fhy+U+mfGUt3HXLBhOHU1tVv7J8/9zKSDkxjckxWKXsBXD?=
 =?us-ascii?Q?bpgzPpbjSHq+UJ4NPunIVvr1yGJr1ShYvkcgSztukLX2s/IGXPSa9qUs4SQl?=
 =?us-ascii?Q?DnRVtCbSoUX5sYntzbTfGfsdRTEOVjsmW6e3r5nn5/xiSNvcyLDgv7P+7o7f?=
 =?us-ascii?Q?8mcjO1ipjlvMBd1hQ9jETbbTf6XICcAop8Xz+Gktj55G5KPNI5DxsaI8UOXi?=
 =?us-ascii?Q?LrhnTnwYNqRs/U3xr21/ehse8J0t/hbJVAGLjRQV3JCvix9vMJkz/sPPvjiI?=
 =?us-ascii?Q?+yLKVdXPPULk4e7zikVwv/k/syN0e5lTg99MC95utAVr9w7al6xiiQ6R1rP4?=
 =?us-ascii?Q?JGp1mmzEqek5majh9Wc3EaL/fL9CzFdmiOTgj65EA2E7AlgzD26PMCnUQh3J?=
 =?us-ascii?Q?MA+kXnlHksaQf5yDGUsJSREG5/V4P30fb7a9qC0JJfyTqgi8XXAhWfMn2E4t?=
 =?us-ascii?Q?QXU9O1hoeCgY7s/Fu0xcPscRBgH3nd90rfjWxzAablX6jdn8LP25ofBR/p1g?=
 =?us-ascii?Q?hk11cdVx0suZhfSsXwWlSwdurcX0lna5EbUOcJzAGkqZymhoOymw0+0MNoP3?=
 =?us-ascii?Q?gsIz6Zonge3xR3sFUcxqIUR3PkvFlpB2rCiPD8O+BB9P6xvHIWXeJ5vsGAn0?=
 =?us-ascii?Q?Rn9CgHaMHn5n3CvLimPM2XRr/wCagexFFvWoHEeNRPMQOdrdNOYH39n5bGFJ?=
 =?us-ascii?Q?D+NsJgmavieHpfxcseSnGq53JjHK5Spvv2OkQl6zSBypEr+drO7FzWZWjQRv?=
 =?us-ascii?Q?DUkgiC4zRQLkYCaPdFzBxQs7Ez+XSCzocay7b2oHmByNV3ue0YzqLrHUm54u?=
 =?us-ascii?Q?cfKe8R+lBiD2uIntGKYltTZ4wCQdOMz5U2iq?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XoKsUUkdkRZzyGsWyUL7hihQDnG7SA0Zb3k9GYHfloEns1n91qxP4ZOBQ6vk?=
 =?us-ascii?Q?SYiMaEZWnbAikpIQbE40Xy1+OZk3lgbnDu51T0zI9DX42/+vJCzmVRlaZSF+?=
 =?us-ascii?Q?rQWg71di/Y4xNjpIaufmvASN7kEff9EaLL8yUv4Ft3JsIn/zvkUHLyaLMNdq?=
 =?us-ascii?Q?C1jBDJEl6GaRkN2hLHm49XVccezXcD8lfDeOrUtQTbtNauF+wUJWdrZHJF0P?=
 =?us-ascii?Q?iu7Y86bjFNYV/X/zpa9A27RU31BdfW9bgTr8cCtgY9zWCmPD4XxjhW6/BKOM?=
 =?us-ascii?Q?qyIPACKmNeBY0AafLaFu+/mbRtOqQ/ebdNgZJy4nmO2GPoXW0ZzUukQpcLVa?=
 =?us-ascii?Q?xYsy6lq7dX5ObMZ+Y1vUJk3ieYqeFfyguif7l6YtEGHH0lcyewckNvK8xET/?=
 =?us-ascii?Q?mydPkDdeWQWrTLMl0lEzfNJ3INSx7KGupS+RUlxHUGHr9IEt+36tyaytObp2?=
 =?us-ascii?Q?CC/AEqzb7iaD8pzCL3LxZZ4TNlddtPrSRJY6aC/smIMfYr59hkWVzeYg+pMK?=
 =?us-ascii?Q?gj7OAfAD+5jXmtO5jkqlQfNeXzAq4ojBbGehQNWRvoeM71BtIVE3J7J33/Si?=
 =?us-ascii?Q?mwFApmzivgCbBtJXT1fOcpPuNnCQ4VllShPRWrwerYFiT6ihOHhvncNUAmyK?=
 =?us-ascii?Q?0LQ6z//Nr/muuWwnyamO6qYyJeFzFihsTAux1dpb0PpjQsxonZceNUlakaCg?=
 =?us-ascii?Q?8zMQhbPYSCIYFABDHhXUwd3HA4UDA3Q8CQm04QY+VF4kxuO2xpCbQKmauyGw?=
 =?us-ascii?Q?dRnbPNfSSat3dst0GA2XynVY6i/tDLb9m2Qbbr/jZfSPpO8UnYYWhQQYrgO8?=
 =?us-ascii?Q?0CyL8vbYwhaD1gXKUzIJQhJf5zce9hz7Cf3XiChG5BZQCCZYoc3gi2ilzmSn?=
 =?us-ascii?Q?2cRdwr0BZE/t1r6822+H/Ay8W/Y4zrJzR1v8psFGoEaeTEbUdiu4QpM68WfE?=
 =?us-ascii?Q?RB/VW0lJBdiG2sgzKmpgyPA0excuPbfmv+2SW8b6XJhcBwvshWFVhxe+lBFZ?=
 =?us-ascii?Q?PLgQYAx1btht564NcwH6bazkVFmRMyWRuVnABvVjRm/YorXtrABAk0sCAxXo?=
 =?us-ascii?Q?7cI0KrurNsfDkp/3DPcprJKTDSXkkpGdvkke3Jskgb0fk4Z2sWNwPA/r6RdE?=
 =?us-ascii?Q?AbExM3Tqja0zzfC6bjnhqvP/Tx6fW4Ev7HdM+luSNsPt479VPUVT7XREwx69?=
 =?us-ascii?Q?J4zrMp6qG5NgVC7+lyoJKMovbHKAmdSHphCs4XssaobRhTbT54zmoxkUH2Zd?=
 =?us-ascii?Q?OFgvFSg+NreO0lsUkhguTKawECuTViGb1/BTHH3UQ9BkRtCI8q6E2tYp8FTi?=
 =?us-ascii?Q?BwHCeEQbyLUnbwFM29zoj6wqMq2zVGwFtEBk7Eu/tY/3kqkq2blB8TZsUG84?=
 =?us-ascii?Q?fvBbnOXSstIYBAoiPJB9oYZqISx2qzr7STfgUYxmamLgsd0o0VcWsjee9IGm?=
 =?us-ascii?Q?13aGMqR3HCzEgq/Hogp41AkeuHydoCzx3RFA02J37bKC+fhHV15xWu6YGd/N?=
 =?us-ascii?Q?PZ+iz2jWN6pt+m7TTumORoufjQ9hcqvLYjngo6apnvaZvBykx4mP+ScINA/B?=
 =?us-ascii?Q?Ro7Duyh5Qw+Bn7oO4RT9NUL26Q0Z9hH55vAfN7Mw+UZK7CmEgT8VNIUltiIi?=
 =?us-ascii?Q?tVajHvosyzUB/sST+s1lM14=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca5a2e2b-b4ca-4769-4162-08de00d63c96
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 10:35:27.3482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7si6rrYimARFuhjNCaaUapxAknPqYeC90cCYffhtukJOlBGmlEe0vgbxmvG4IyTkCsm1L2avxMijoX2gRdd7BzbHrtw6NT8J6jbZAzrUdqj4mRSzOd22WT+einaWM3r8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7382
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAxMDA4OSBTYWx0ZWRfXyGU3cw+1cBkA
 dLGdQEcK1qqLOnC+7BeDNSriJg7+dCt1y4sYhDhXFZLAzUmfeI3O++s/5ppssSXwKpPBraMqQOu
 /DKul6ecuw97rb0HOvWw6khESLbVRs3og+UggVUvcYmQZUuAOWUjIIsOQjBzQBDPYSbNJ3EXwhZ
 a9APzGfrITjri8BGRazEsZ9wfEY7puyOfVYKxOUuHRb9ghkVa61ovBf06uWFzR7gSKopDjt96Z0
 /qZhZ925h5tGAmnQ7uODrpojafBRnJLYyx0K7Ew7TO4LgPupv7PDRPM1FxsDh4F3JT0cQanBEzE
 eDF9RjjDi3tajel56wlD8Q+cFx1Q+k5mqMvpzJS2b0iipy3V8vGYwaSJtcamUgveZe3pe7ZRKfK
 YuQQWjbLGTJTm4HnF5ToaoZG571oqQ==
X-Authority-Analysis: v=2.4 cv=Lc0xKzfi c=1 sm=1 tr=0 ts=68dd03f2 cx=c_pps
 a=Y+Of8T+w2jezINbWzwznEQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=iGHA9ds3AAAA:8
 a=N7YU87kZvM-5Sz6ten0A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: cqeFbRBQyKGtfTZBqA9O6tP7c0S6QswK
X-Proofpoint-GUID: cqeFbRBQyKGtfTZBqA9O6tP7c0S6QswK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_03,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2510010089
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 10:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224206

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Brings following bugfixes on top of 21.1.1

b708aea0bc71 [SCEV] Don't perform implication checks with many predicates (#158652)
77a3b0eda361 [RISCV] Refactor RVV builtin code generation for reduce compilation time [NFC] (#154906)
f14551dbc4e8 [RISCV] Reduce ManualCodeGen for RVV intrinsics with rounding mode. NFC
dcc2c1c933be [RISCV] Reduce ManualCodeGen for segment load/store intrinsics. NFC
e625a781211e [LLVM] Update CUDA ELF flags for their new ABI (#149534)
3e93017936b5 MC: Better handle backslash-escaped symbols (#158780)
bc5e9a5e2009 [MC] Add parseSymbol() helper (NFC) (#158106)
e2e5eb2f1cd9 [Loads] Check for overflow when adding MaxPtrDiff + Offset.
661c387fc2f1 release/21.x: [VPlan] Don't narrow op multiple times in narrowInterleaveGroups.
f5c1b5206cbe [PowerPC] Avoid working on deleted node in ext bool trunc combine (#160050)
db70369f400e [Clang] Fix an error-recovery crash after d1a80dea (#159976)
9c8736f348e0 [ELF] -r/--emit-relocs: Fix crash when processing .rela.text before .text (#156354)
15a31832eab7 [RISCV] Re-work how VWADD_W_VL and similar _W_VL nodes are handled in combineOp_VLToVWOp_VL. (#159205)
f089fb21fffa [LoongArch] Fix MergeBaseOffset for constant pool index operand (#159336)
9eedaf5b1001 [VectorCombine] Fix scalarizeExtExtract for big-endian (#157962)
5af5cfb60d9e [clang-format] Handle C digit separators (#158418)
0174263ac214 Bump version to 21.1.2
ff039a98523f [RISCV] Support PreserveMost calling convention (#148214)
1a644bc50948 [X86] Fix assertion in AVX512 setcc combine due to invalid APInt mask width (#155775)
2c8cb316b5d2 [lldb][test] Only assert function name is in user-code on Darwin platforms
f5ba88341e7c [lldb][test] TestTsanBasic.py: fix function name assertion
faedeb1a2420 [lldb][Instrumentation] Set selected frame to outside sanitizer libraries (#133079)
54896838ca5e [lldb][Target] Clear selected frame index after a StopInfo::PerformAction (#133078)
f4907049285c [Clang][Cygwin] Use correct mangling rule (#158404)

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 0988bf50a7..699cfd0aca 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -481,7 +481,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>
 RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-lld = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-21.1.1 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-21.1.2 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index bf3a63914a..ca3a3a08b4 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "21"
 MINOR_VER = "1"
-PATCH_VER = "1"
+PATCH_VER = "2"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 512bf1dd02..59d164adba 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] = "8863980e14484a72a9b7d2c80500e1749054d74f08f8c5102fd540a3c5ac9f8a"
+SRC_URI[sha256sum] = "1a417d1c8faf8d93e73fec1cbb76d393ed3218974c2283c7bac9672d3d47c54b"
 
 SRC_URI = "\
     ${BASEURI} \
-- 
2.49.0



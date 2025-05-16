Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A0F9C2D0CD
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 02:10:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3703.1747361432547527315
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 19:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7231626a07=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G1GvPt023198
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 19:10:32 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2045.outbound.protection.outlook.com [104.47.56.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46mbca3nr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 19:10:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZhkrcIBJy+6eFbXpCHyQ33dSK2aV3rh9j3FJeHlck3iFdeJZE7Lt2QBXdqxYVUl0/Y28TnuzCfygLhtcsuJe+b9Bw7cyFivazfEJQO6R8f4Cm0XL2R5FaBEDf5siNx0LQGGyUxDHMyM7TPw4KfTkldWVqd6cnwuc1VVDmq6KkIp3Dr4/6wdn6l1rsySeUP6kQs/H8uJvuRCYAi01OEiq5pBUS59l2Y2nb/mHvNKXM5yWWDSsOQx3izEUyoTMTDE4vlKmYm2vrh2vtpw0kEvM2q88Juya3d0jl27Pdq4Fjvdvfa16YApE6wvu5OIzERthNhB8lt4MCsoAIctNjOkKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AYXWnhXCftaNP/DaJdi2AVME4dCDug2ErADYB36xZE=;
 b=SjzLXKNiHgtipUG2i+l4gr/WuVvktEfjzKKGuwjvTt7q9PvnjVayIXl1A61wxJLTNGl/IQQIPuzIFEUVWvJcTDyVF72vdEB+yC6Nn+ZK2HrlWxqQxBYZjbF4aU+g1yDaFWsIUMj+APqp3ybEnDLcDSJNe+Aa+08bL8go+E1vGhpdsSSweu/cMSbaeYIupf/xgqlTFpeVvcfspYmV5l1g1ELwBdHfjTj60IJw1B1DgVkegmxq+uf9wMqK/h7gGkJEqWw8VnqQosICDm83mbwBGPfQl2Q9P5423b6lqNAYffAVxofvrfccyEN7z2YOSlUb4SSQUPln7EMrPnV4/j1eSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA1PR11MB8863.namprd11.prod.outlook.com (2603:10b6:208:598::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Fri, 16 May
 2025 02:10:20 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 02:10:20 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] util-linux/util-linux-libuuid: upgrade from 2.40.4 to 2.41
Date: Fri, 16 May 2025 10:10:05 +0800
Message-Id: <20250516021005.781630-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0195.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::17) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA1PR11MB8863:EE_
X-MS-Office365-Filtering-Correlation-Id: da1a186e-a702-4a26-0384-08dd941eced7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CJppMeaZDw8XzJxR9wU+ClxkSl4qOyhLr4YYIkOtf+YMePoJx40sFZVnpu1f?=
 =?us-ascii?Q?ltDjfWwJFjE8Tqm6fzA6c5wDWyHLWS7A6ftcQ6Az/ICjqghGG81mQpGJmhXD?=
 =?us-ascii?Q?NSOqLDUFjcYEmDrhfpyM2epYMO4xlq8NLKGn76Cy7UkxDseelK+5ouQESnwB?=
 =?us-ascii?Q?NnWdhrDbrWoXyEqJwlBjbaFiP+a9cs1W8ObshgMdqhW0gB03TSYVEdrPzRwo?=
 =?us-ascii?Q?2HsI46nVef/gDkLYPiHv/JG7m/K1ut/JLzJjJINaVdj8xuTItMoJwLn83RQ/?=
 =?us-ascii?Q?IKZOOz1hvifUlrUZnOyqQ1Ti7z1Vb952TKEhpavGgwCxDfkVRwicHa6Xn85w?=
 =?us-ascii?Q?DVpU2uwPSlJKWRXfeuD7KEMaW7aqzZejkIJ8NZSqanzDvU1OXlp401B7Gzuy?=
 =?us-ascii?Q?fSWOSYjX8JS0E6x1JSf1NFTmTg0x5+jKu8kc65Yhu7DPBwDwsPOpBvYSNr64?=
 =?us-ascii?Q?UyYXUezBRDFpYgZ8thdPaCiS8a6VrmKogfiw+oIba7mdSiXkrzpFlyM/7VC7?=
 =?us-ascii?Q?OHlCxYI5fkKhdv/KDGVzAuUgssuB+B8Osx3w8gVlb8fcMjaY7rlb6QBKR7Vi?=
 =?us-ascii?Q?UMX+yjtQbxMCivSZJBjoO0ijCQNl5d1lcZ+RbO51kXS0iwcDcf51j+3lMrYC?=
 =?us-ascii?Q?OcCTGTNu3BEQ3ixZeUJfgbMK7H6iPF4tGyg7DWNx+8PHptlo+7yNDLTttRye?=
 =?us-ascii?Q?Yxi51OxSQJMQyCetotWw496DBtmEnYcDfQJi+qKpEB533LZF9c8XSRlLGobJ?=
 =?us-ascii?Q?v0T71DfVqttorPkJdfoT5ZdBsLn21A4llbXfwjez9Nysd7FqObmxnWHtjx+D?=
 =?us-ascii?Q?r/iUvmGfzFCwa3wp8zga+Lkn/2FbnhgVJTmNdSxzaHr07OZe0VMGQLc3OD2E?=
 =?us-ascii?Q?dKX6+JvweUW+nRB/3ve0/jLzBL28ymg781bEhj9VfvQrJd7RSocuiUodwrTf?=
 =?us-ascii?Q?+Kaf664s9Qt4KSm3vhpG9HqVwbZjBAY/JhB9vwmOemaJmAfFVphd2kFPoiHL?=
 =?us-ascii?Q?r9K5PhaF/o3U+EdKsLC2e60STlBEuqoDQ6NFJbEV2At6nE3vVGZK5zxhScGM?=
 =?us-ascii?Q?yJz5BCTIUqRwrIyjNMc6dZS4FUfANfF7yVnTRzjHM6rEDMFYjT3WN/fu32pf?=
 =?us-ascii?Q?jMQ6N7Ng7hDOLIN0py1VLPWTP+aYpoK69xsdhXjQFmn24P+AWWaMEsJcFxZH?=
 =?us-ascii?Q?2pMX9EIN797nZ+gcTeZmZf5PrXzWkgfe+i7V44ejYqf1hqNBrWOUciBLkV9v?=
 =?us-ascii?Q?gng2h2tfA5z+RnFanq3gVzC68peUri9AnCcOsSOqI8zHsE4icqEZjqoWeJ/X?=
 =?us-ascii?Q?XLObDfhlpYmYPZBeG80qOJyRltORDfxR6Y80aMo23VTcAHlIfqvuu3KsXOta?=
 =?us-ascii?Q?zLA4+N7Q5BQxWgErhoPC+w0rj+zaxnIOeGgrkXkWYuG14lNZsjrIRWB7Qk3p?=
 =?us-ascii?Q?DjapSumfIXazoQ740LPMUHieH8HT05u8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kjcLByNBIBOtBa6yeZNXmkV5vl5VeFfn85P+I1m+JytR64VKNmC2fPWzLmT5?=
 =?us-ascii?Q?bzPXNA7D3auDqfEm+GZo6dnZD59JFSaL2P2FemBZMGq0ieoEaNX+xIHvdj9j?=
 =?us-ascii?Q?13SMgKi1yJBwkDt3rUglZkw2p9lh39Q2xBI2Bbo2st2Rtpd926ZIlBP6yd5C?=
 =?us-ascii?Q?17qxr2AnZYJyCfyr/iuMvO6avx4OYAIQtWpSPtCM0AK490m1AuYLCocKoALG?=
 =?us-ascii?Q?CqMdDfaJWvnNUHF/LWwCbZurO+jLN5GlZkEkw8faKCdb9IWaAkulPHPDrMAN?=
 =?us-ascii?Q?4q1ohog1iLM2ARx9Dl/dMu/BzO+X+JUviz04QeBMH/T5uLWycGa5XCqnvbqb?=
 =?us-ascii?Q?Kee3aZcwzKdvg1NpJGFXKX6bMOyBeuh/61E9j/juuiLoWccRaMEILKXRGadT?=
 =?us-ascii?Q?z5riE8v5M17RcATFjfyYHfprCMHd1dY38JgDEcFf7hbv29QPopJs1NONrf3J?=
 =?us-ascii?Q?YS8be/+NqEf5b84pUBWM7Rxn8beDv93QyQNg2O+gD4ly3IZ3r65FcdyhSnWF?=
 =?us-ascii?Q?OIi40OxkL77cbJt7C823AaaJRCdohdHiOuIDkoCQbVDXTzkTkM++zemnJp5Y?=
 =?us-ascii?Q?gSvPT3thp2+EdF+qB0LQC6dR8EStwojfJoJ2bq3SgO5lqb4amwFJwfVH5D8P?=
 =?us-ascii?Q?I30gbNPlVjefVfIoyVn7Sgbji9alF3jKvoOk9LB+zr0+FwQmietVMV9SPBnv?=
 =?us-ascii?Q?LbudXVrin9ldT4dxlb9egI40gDl8qegD9IgE4WPdxNzWq8t6hGtjn7AaxyPz?=
 =?us-ascii?Q?K9EstLGuL0N3gCCS9grMkDV6nSPfA/1oFRYfFVSXQtLM4Af4wn2/O1mIWK8F?=
 =?us-ascii?Q?mb+S2aRf30rPqGobGYAJ+eZ6PaNc/Mui19aU3rbGoPFfPLRGatz3L/0iR9GM?=
 =?us-ascii?Q?89tjxRsn+VhQ6P72pFWtKC9ceKjrrGp3EMF77cRAM9lf+WLeJEd2iyZgmtcK?=
 =?us-ascii?Q?TkN0cKu2lfxKuzYOr6q66yP5ALpvT8R8sTSQQcQ8zq1+pgG0+vhP5JDPFD/o?=
 =?us-ascii?Q?y0YwPXzHY/ewKqYKMIffD7hTzcHEtu7a7A5oHfuiKt8lWrjppdXNC6W9Ud/b?=
 =?us-ascii?Q?rJbrjpwtre2vh8nHs2NGH1OtT0wcY1GIUG60Fx6jbIJMZXzEOnesONV39j3E?=
 =?us-ascii?Q?puWZGLyXX+gMBRt+VAWAoWeP7ppSSHX7s15WVvNIc6jsnGrlji95cDBBkpK/?=
 =?us-ascii?Q?hrPSKQfIWn4/cuYS/KY0izaSATKYIkR0ohSc0l6+qK07F0OUt9cgXjWZXrKY?=
 =?us-ascii?Q?JdDqEVeuZI1I4iMMoIO4phZSbtjVGFGskXeLdDSMVFtVy3PtTXtWzDtk9oDx?=
 =?us-ascii?Q?J7QLTKaN212tlE1eEWWbmYRfx3/VxLpSjLMbDlH7LiyX2j56qV+QbMBCYu/3?=
 =?us-ascii?Q?fuXPrQyZ2OOzmV92Md9zBYYKl08jwyP2VU1GWzokWjLDuqJBKXsZI6BS2p6e?=
 =?us-ascii?Q?WCRSWLyYZneu5v7wbzQfMyZxqkJvJaAXcVBDhh47wjSOEiaABfaAM2h0emfq?=
 =?us-ascii?Q?+VV+RSB+XPmfetHNq+3d8tjoWVUrXtYwgMycEwq8X/mKV09ZizeErcHW6oM/?=
 =?us-ascii?Q?w8/hTu+dVz8n1b6YyOnLA5fz+IpEkDLDXMpkplgx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da1a186e-a702-4a26-0384-08dd941eced7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 02:10:20.0225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CfDUenXz3xXOXPGpZ+iuWPCnf20jj+N9zU83sgDi43yuuob4HiyzEvF3TNdSiRrU/4hLYckd8j3cqryX4wRC3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8863
X-Proofpoint-ORIG-GUID: MOtRgBisqoUhqRgIJMR6wCZ9Gipt283H
X-Authority-Analysis: v=2.4 cv=P446hjAu c=1 sm=1 tr=0 ts=68269e97 cx=c_pps a=fpyyTn7Kx2iM0+fj1eipXw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=Sv4y0yS6AAAA:8 a=D9tCBEehAAAA:8 a=174-_do8R0gluZ_RAnAA:9 a=CXwZJOWyjskfCwWb:21 a=FdTzh2GWekK77mhwV6Dw:22 a=I7ze7AG8jwQKfjVvUIqj:22 a=Q0Uz2dhPmm7nD8Nyg-vj:22
X-Proofpoint-GUID: MOtRgBisqoUhqRgIJMR6wCZ9Gipt283H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDAxOSBTYWx0ZWRfX9UW7GSrL+HcM b/aVoPWpsT0Nt0H4MrDClCjk2vMeAoqF5Whz3F2e9Q56nMHAI1IYl7wkkrMX0gPztvKuO4bU36F Fsc4yG+ONK+yWafQqSkRR7V3mRnOty5Oq70M2CsYaWlPQriyDyJftzRcHEhzLvC5wnXvcHE/Dxq
 223PJvARZMAtPvrAJZOQEXoEng4IWMuOTCdBLm9ipI5lFI0p8zGzygNmeS7JBRbDRxvAfHdaOCF 2l1PZFyH+TUNY15qrH0HF5Ges979klgoPpYdWEtL/EJHdFuj4WPr+geygWc2GqbXrKBj74eIzle qJEhHRbjjNpEyMtgHHaAvegppZcA4jE3JgfPSGaB7o6z3RdSHKTklER7FX1rpRGKSfjSdIN5Fwh
 Ax3WAu6mbm7Pwj9LjwSMh8wDk4pcz0fGys7Hme3278tXaqQ8AxGcpi8OcbJn47Gq7qn2JBiO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_01,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 mlxscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505160019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 02:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216717

From: Chen Qi <Qi.Chen@windriver.com>

License-Update: add EUPL-1.2.
See https://github.com/util-linux/util-linux/commit/74f3265b9a079f9f60ad6e606d77deae0029a43a

The run-ptest script is changed to use --builddir. This is because
util-linux upstream does not have much priority on testing the
--use-system-commands option. For example, with --use-system-commands,
we have two failed test cases: kill/decode and lsfd/mkfds-foreign-sockets.
With --builddir, all test cases succeed. I created PR for the kill/decode
issue: https://github.com/util-linux/util-linux/pull/3571. The root
cause is obvious for kill/decode. But the root cause for lsfd/mkfds-foreign-sockets
is not obvious, at least to me. So instead of spending time fixing
test case issues for --use-system-commands, we'd better just use
--builddir.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...d_2.40.4.bb => util-linux-libuuid_2.41.bb} |   3 -
 meta/recipes-core/util-linux/util-linux.inc   |  10 +-
 ...dd-sector-size-commanand-line-option.patch |  90 ---------------
 ...dd-sector-size-commanand-line-option.patch | 105 ------------------
 .../util-linux/avoid_parallel_tests.patch     |   4 +-
 .../util-linux/configure-sbindir.patch        |   4 +-
 .../display_testname_for_subtest.patch        |   6 +-
 .../util-linux/util-linux/ptest.patch         |   6 +-
 .../util-linux/util-linux/run-ptest           |   6 +-
 ...til-linux_2.40.4.bb => util-linux_2.41.bb} |   1 +
 10 files changed, 17 insertions(+), 218 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.40.4.bb => util-linux-libuuid_2.41.bb} (74%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-cfdisk-add-sector-size-commanand-line-option.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0002-sfdisk-add-sector-size-commanand-line-option.patch
 rename meta/recipes-core/util-linux/{util-linux_2.40.4.bb => util-linux_2.41.bb} (99%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb
similarity index 74%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb
index ec04c1d384..e25f0e47c2 100644
--- a/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb
+++ b/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb
@@ -1,6 +1,3 @@
-# To allow util-linux to optionally build-depend on cryptsetup, libuuid is
-# split out of the main recipe, as it's needed by cryptsetup
-
 require util-linux.inc
 
 inherit autotools gettext pkgconfig
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 4e8701ffdf..50c3ba5c2c 100644
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
@@ -38,10 +40,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
            file://fcntl-lock.c \
-           file://0001-cfdisk-add-sector-size-commanand-line-option.patch \
-           file://0002-sfdisk-add-sector-size-commanand-line-option.patch \
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
index 6886b66c49..59a14aedfd 100644
--- a/meta/recipes-core/util-linux/util-linux/run-ptest
+++ b/meta/recipes-core/util-linux/util-linux/run-ptest
@@ -9,10 +9,6 @@ if [ "x$UDEV_PID" != "x" ]; then
     /etc/init.d/udev stop
 fi
 
-current_path=$(readlink -f $0)
-export bindir=$(dirname $current_path)
-export PATH=$bindir/bin:$PATH
-
 # losetup tests will be skipped and/or fail otherwise
 modprobe loop
 
@@ -25,7 +21,7 @@ mount --make-shared /
 # lsfd/option-inet has races in the test script:
 # https://github.com/util-linux/util-linux/issues/2399
 # lsfd/mkfds-bpf* have issues with the gcc 15 upgrade
-./tests/run.sh --use-system-commands --parsable --show-diff --exclude='lsfd/option-inet lsfd/mkfds-bpf-map lsfd/mkfds-bpf-prog' | sed -u '{
+./tests/run.sh --builddir=@PTEST_PATH@ --parsable --show-diff --exclude='lsfd/option-inet lsfd/mkfds-bpf-map lsfd/mkfds-bpf-prog' | sed -u '{
       s/^\(.*\):\(.*\) \.\.\. OK$/PASS: \1:\2/                              
       s/^\(.*\):\(.*\) \.\.\. FAILED \(.*\)$/FAIL: \1:\2 \3/                
       s/^\(.*\):\(.*\) \.\.\. SKIPPED \(.*\)$/SKIP: \1:\2 \3/               
diff --git a/meta/recipes-core/util-linux/util-linux_2.40.4.bb b/meta/recipes-core/util-linux/util-linux_2.41.bb
similarity index 99%
rename from meta/recipes-core/util-linux/util-linux_2.40.4.bb
rename to meta/recipes-core/util-linux/util-linux_2.41.bb
index 81bd298dd9..28bed9e584 100644
--- a/meta/recipes-core/util-linux/util-linux_2.40.4.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.41.bb
@@ -355,6 +355,7 @@ do_install_ptest() {
     cp ${B}/config.h ${D}${PTEST_PATH}
 
     sed -i 's|@base_sbindir@|${base_sbindir}|g' ${D}${PTEST_PATH}/run-ptest
+    sed -i 's|@PTEST_PATH@|${PTEST_PATH}|g' ${D}${PTEST_PATH}/run-ptest
 
     # chfn needs PAM
     if ! ${@bb.utils.contains('PACKAGECONFIG', 'pam', 'true', 'false', d)}; then
-- 
2.34.1



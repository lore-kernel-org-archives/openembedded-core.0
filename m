Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1CD9C5AE59
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 02:21:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7042.1749003683586059145
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 19:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82504e28f8=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5541vjaO006023
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Jun 2025 19:21:23 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rsupe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 19:21:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9iXUticrk6120gP2cnEec2QrVR0BAeUve1OezYsCUSl5lSS6J+YeCe7iPxvl1/1lq1z/GAZf5QyfgraZWO53vYbusSJIMiQ2H6EmNAjEB+FNEEIFxsg5770CsSBUXMSu6fmeJAs7d8XCu1mv9iQ/CKzzQOWtFiKIaakc7EWu1VpGcEnnQNWcrItW2GjYUce/vVxzVaOFMjZ2+bPfZxtbZgkmczuMjY34MiTWe1uu/vYyhlsgnHMH34HaQAIJ9sjPFfEmlWGsqsFFFYLl1cF1aytUe1wwUwEpgjFopPGjDlWJzi/2L0Qwo04tG5CfiD74z758eXCgFKe74VYwR6d4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKCo3qRLm7y/v5wtIVjPWuCyD39TiqdwtaprHR/jM+o=;
 b=nmLK98JTiFsB+tGdfwOkdv9JufaFdfYF5PO7M1YmCFujyuukXInn8Ud332MtLcUSoGysqOvoop3bGpsHpC9t00W5a5DXdCiNccS4sItO3klBD9guAI5dlv9a1TD39mW96/8zYPSeMCurEWW6HWZKYaPtKjCSDnV8LMhiZAMsKeNt8I68nfD40isre3z7nXARkSxBCAQWwXP02o59wMHTM6/dKRxdCvddC5+bcf80IJ7IhSZJZIC18/yrSjZ+sMDx/B7HYvD8E5vWthjLQR51Henad980VrsW6v8GMYmvhq737hZGTetUxZTY7kz0dPATO9ta7ru+jjaBX/mDqaGIVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB7939.namprd11.prod.outlook.com (2603:10b6:610:131::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Wed, 4 Jun
 2025 02:21:20 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%3]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 02:21:20 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar][PATCH] yq_git: add back apply=no for SRC_URI diff
Date: Wed,  4 Jun 2025 10:20:59 +0800
Message-Id: <20250604022059.2192970-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JK5P305CA0021.IDNP305.PROD.OUTLOOK.COM
 (2603:1096:180:9::19) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB7939:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ef4ac5c-4eac-44d8-d993-08dda30e7db7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QUSN+l4icDnTBOC//YJ/wwBsZ3FedZ8of5aEMFns7g9j1ILfuWLMjq+MwfnB?=
 =?us-ascii?Q?gFmRnte99WCxHWilF2mHfZpK9ZHhjne3WaX5B/sQiraFYGME7o1csgvBeHn9?=
 =?us-ascii?Q?DF5iAyxI64oi3EUY7+bocK+gU22vAHIfjFLZ1OicW5AY7lFsTVRI67PxHTdY?=
 =?us-ascii?Q?9Pxo47VxPoFIRHklrSM+CtT0g9GhmfQBPx/VZMKSNIk7Ut3SugJ2BV202ko1?=
 =?us-ascii?Q?4YjbRdiePO0pV8rwROQdn7x0TEcPPAppyETWc2Fq6Lk0T7jvBBRgdUwwlaJW?=
 =?us-ascii?Q?zZsbdfKtwii1Eu81p9Iki8A1JSQCTsAvX5r8lpFCnXXB4emwNG9GPKQKvbcL?=
 =?us-ascii?Q?8SR3jOGDPaUQjdJBP6g4TTQ7/kGQy719lbybG0w5ucEdyLK7ijhhs/2U2zkB?=
 =?us-ascii?Q?RmlH5GiJNo4nw9jg8iBmIVELxbTPTjtmHXWzIQKKNrWxJLEGT2ZnZ73DJSAJ?=
 =?us-ascii?Q?oEQsZxFrxscgdWMx+2p6O3F/sLJFOqTIJt1qcBVrwjswM60bhXL6y3EeHgp4?=
 =?us-ascii?Q?WQ04nus0+gFKKLpMIhtvBirMNc/aURPt0n1oWf/j/krfBtN85mm5UjoHbotn?=
 =?us-ascii?Q?8Ws8uphBC8wiMYHNEJc9fq505HTEBylqfLTrfd8RbZOirS419QQ5Bkzwwrpb?=
 =?us-ascii?Q?L3dNgjCfDewDD1jIJJ5ddW+jszOwfOkNpwcAae5+kHy9u2IgV8O27mR2IEmH?=
 =?us-ascii?Q?6s4bsYM7VkZK6V6orxCirgPSKvmTdeegRIgLY1wSf+IvjskQNyM5M18Eu+7X?=
 =?us-ascii?Q?ga+P9ap+Y+AXWBXCDvIR4K8/7rmpi92lv0vZehBQ5firo7BbQPyKX0SLe4FP?=
 =?us-ascii?Q?3+RaWwF3s9mj4vsZ1FmDPOH5UfbMG+gWWpin+e63dizOt9DgeEmkDLXwODRF?=
 =?us-ascii?Q?Cls5mOXx7dqBMr8NTC6RuZFXFFoEEKRMSl5+WAT//K+YisFvHzmRgWOhCCWU?=
 =?us-ascii?Q?/5buIJWgtpiXTpx0fieV421SQd48hAEl89E9oyvw16SmdUkFpakyYecdEyw6?=
 =?us-ascii?Q?Trl4dodOxWnXpr+EiA/LbtvWppVt8gafJUMz1zcii537MoWF6RR8xCdXRisz?=
 =?us-ascii?Q?YxhJzwuHqCV2opTQe3SpSz5ea6a/liM/URgZIkX2cxOjHg/RolPQt55NQDme?=
 =?us-ascii?Q?2z25GaLPZQsw34w7uONy9nSlD99s6OevlcoWa2oZhkGTnsO+51fGml5M96Oy?=
 =?us-ascii?Q?PFEYG6/AYWWy+32rQgXCWmB82cww1ekHm0ryswaMKBRspFO60Gk/NA42+JCa?=
 =?us-ascii?Q?brXjF2Q6tv2w/soEpbOoz68JSG3bgg1m5lZ/nR7f6EKWAC6Iauc8Z2HshuTz?=
 =?us-ascii?Q?WJeBSTrkkXWD90lgMdV/lVA8cygaJJHbxqIkWjKSRN6X/nvn80HKLHCRhqDN?=
 =?us-ascii?Q?UCoIh11f3FMG5dvalBad9xbbh7kYOnwlAHzknENIo2xwCw1WfCbnkxQmfGds?=
 =?us-ascii?Q?EDFtStNDFMM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?npX/mH4pTDyKQJA5XyYzqHQi5hdMkZhU5ndD/102GocyJeibyDmtxoYFjj9U?=
 =?us-ascii?Q?A7pyaONZ8ckBMbwjeg8LHR5XwpDlLdQnAT7e18uqbvQA/l+poWcRz9ivyPzy?=
 =?us-ascii?Q?8z4igE2SRxVNEAwoxhwLw4zl+ObSk6K5/Bg4n38PK1Dml8hTEh3z67drKMVr?=
 =?us-ascii?Q?5f82IQD/Rre+i1agP1ONOpjPuHce7n4LcsherWEp9nLhvXRgqS6yOe89Nj9b?=
 =?us-ascii?Q?kceiCcjr/tDy9y9AJSp8SV/or+MxJQLA/cQNhbLZCkhZC3r0KIqcSH99lI5t?=
 =?us-ascii?Q?bsNyBixnF5UKOR8VjbCV7Q/m6a5mkxEEJkAO2iD2UIo6dy9vVMUu66zx9wS+?=
 =?us-ascii?Q?W98SlEjReonWA4ef2VawlheH1i/T8ARoYcBH0D6/L3YDvUSfbqGP08WJrjUc?=
 =?us-ascii?Q?nvVKXJ2dCEyqaX9cAaJbZSfy4NF74Fk1FGNOuy0l+matNmW1Q7okYTvBHy+r?=
 =?us-ascii?Q?AWhVawDXA37Pfp9zgbT6EGYwx0AfKcuvtTAyPY+SRo1YCB953iWV3OxXdsyL?=
 =?us-ascii?Q?km1uGDB7LSbdwR1QSCGHl3rWCnlfAi6bcnKexf9+Lg121NboaIu4yC4+VCnb?=
 =?us-ascii?Q?LhZKsa4v/XI6Y+tje0V319jR3gjMRXG8ENc9A+JQJ8FzhzB4IcPksY+E9Xw/?=
 =?us-ascii?Q?8g4127GNfCWR+7+JLdy7cbhl2+dUVPPu3df99fHYkFCyS5vBJAzmIJ/ZKAUx?=
 =?us-ascii?Q?Nq2j+8zg7krSFLOBdxvc9IPC6GRq+FLz3nvmMGnHk2iGJP/pqsWFQW6iAXDe?=
 =?us-ascii?Q?dQlDRz7aga8S/IyjdN85lCUwGo2ZEnmQ8xxP66q0JRGiXc7R3ZqQNNettHHX?=
 =?us-ascii?Q?cvlLt6mx/JhL7ZDBXpJA9uQ3VoyDFtmKE/O09Q+Cp7w9McKuXkD+wMXtQj2o?=
 =?us-ascii?Q?DEqjkLEMAKDoFu8GIcwbVD6d2vGqvW+AaEgsPgRvr9HdSg984/+bBN6rGLxd?=
 =?us-ascii?Q?ydKnMCgxZu8rG6zhitmwLSCYwaKu4sE+nE0MpUqNO6QrTG08tBg7NK5nVEdu?=
 =?us-ascii?Q?sSmm+U50ROh7X/DckWIrHq4qCR170+dsQenVvlwAbbYcsT3I38p7xS6Bgg53?=
 =?us-ascii?Q?g2Bs6S/nforWf9WlpC/98GGjSgkQ6mb93g06+ClZn6Dtd/KBWQ0MFiEuFe95?=
 =?us-ascii?Q?nYCWG0i+G9tL/4SKxG8Xo322Zwo0ScGxySTOhMwTge8WxsTOCS0fmUzoj4qX?=
 =?us-ascii?Q?vc8k64+qRaVaaWcbSOrTtkkW6K5ELY75bUWwqAuYV/w5mtfi5cF9nXiEp1Im?=
 =?us-ascii?Q?8W3UzaW0Q6EVuwvkv1SJAYPUKbqfh+soFMT2grsfXucYku69V51uH6cWcv2C?=
 =?us-ascii?Q?YEvRqI23jLARMIauVZnXR7I7bt1IgBchxrUIGe5+/K1e7j8Zp5O9SMqEJVEA?=
 =?us-ascii?Q?67n1aWGSFSSA5desM967QfWHtkMen8xUAVUGMOdTdcFzQwCCd7A2teZXcSg9?=
 =?us-ascii?Q?9R1SAp+IrL/8bg83pDFuAq55LkZ/YiTPPR13xIItCGtSjGvxpK9lN5gGPtu2?=
 =?us-ascii?Q?KCunHYe6n97fuF2sqGoqMW9pp6++TdjC5pMHq8Xptdr4sY0BjByrH34gdbm0?=
 =?us-ascii?Q?m2JPPCgShkiaeCFztGzg5YVrt77ySykpK5Tc3LK7?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef4ac5c-4eac-44d8-d993-08dda30e7db7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 02:21:19.2548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wThq47IkamAKCTk4KV1HnOAF1F8bSMdREeF6xYDJVEE1rosXlzoGhwD7pnqK4SbCpvuWB8znIsorxCvEsXaoAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7939
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDAxNyBTYWx0ZWRfX5drze+ue3pLf 1H9duADvPAsj9qEze8yNwjbOeQT/OYQ2wSYb6rd8Qp3oEv6qUG157J98dGAGYWD1fFJ9AIoD7xs WL5vWIUT68u4IN5I3DcvHSI/y31S+A7NhLSGMNMX28i3zaZHI+QQsJ9dV+2YyIj5yEMD3nMvzrm
 2viwTNXqt/e8D8/Nrw/NzSPV3KLrPnoSDBn7bhSplVcnkfW3vCeJdZJuEm8SUlC3lgzP1s9IUsi ssns89PfSwRLLcHC4NssJcAqy04Rn/2tnhDihCwZMVaOX4p/pZsguXs83Sy0J9GQYbtSOG3Y1Ha c8DCWZlv/UVLNdNHgEApGd9A9P+4//+B/GYy5B4oCSYimd4XMrY+O1QTA7d2cALAZmFCQu4/h+d
 OpaNNm+nuQtsm+1KfbUkn3XTw7oZAn7j65gjUk++Ynfo3Oxi7ubPXFTbL4b+O4fgv/ALOxmw
X-Authority-Analysis: v=2.4 cv=PvyTbxM3 c=1 sm=1 tr=0 ts=683fada3 cx=c_pps a=cuGhpuBU/Rulez8h1ZIujw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=Oh2cFVv5AAAA:8 a=pM9yUfARAAAA:8 a=NEAV23lmAAAA:8 a=Bd_7TLHmb3NPOQopuMIA:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22 a=7KeoIwV6GZqOttXkcoxL:22
 a=YH-7kEGJnRg4CV3apUU-:22
X-Proofpoint-GUID: D0ysDLCq3X4VzFmZ0PzOvWVi6GhJ09rh
X-Proofpoint-ORIG-GUID: D0ysDLCq3X4VzFmZ0PzOvWVi6GhJ09rh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=857 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506040017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 02:21:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217830

From: Chen Qi <Qi.Chen@windriver.com>

This apply=no was dropped during last upgrade. This causes
do_patch error when using git shallow tarball.

The original patch that added apply=no is:
https://lists.yoctoproject.org/g/meta-virtualization/message/8804

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-devtools/yq/yq_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
index 9682ec95..b1700bd2 100644
--- a/recipes-devtools/yq/yq_git.bb
+++ b/recipes-devtools/yq/yq_git.bb
@@ -25,7 +25,7 @@ SRCREV_text = "566b44fc931e2542778a18423c655ce99b4f1402"
 SRC_URI += "git://go.googlesource.com/text;name=text;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor/golang.org/x/text"
 
 SRCREV_diff = "20ebb0f2a09e612109b224b32f79370409108bcc"
-SRC_URI += "git://github.com/pkg/diff;name=diff;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor/github.com/pkg/diff"
+SRC_URI += "git://github.com/pkg/diff;name=diff;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor/github.com/pkg/diff;apply=no"
 
 SRCREV_color = "1c8d8706604ee5fb9a464e5097ba113101828a75"
 SRC_URI += "git://github.com/fatih/color;name=color;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor/github.com/fatih/color"
-- 
2.34.1



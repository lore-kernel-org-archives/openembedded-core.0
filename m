Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0893C3527E
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.1900.1649389277558122610
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 20:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=s7bnVi+A;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=10977aa58d=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2383cZEJ010332
	for <openembedded-core@lists.openembedded.org>;
 Thu, 7 Apr 2022 20:41:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=RxDr/FaM9nmjbpH40JYL0dVwIf3Z8YnQHrZaPY9DrPY=;
 b=s7bnVi+Asc9tDSuN+XC7rwinbhpBaITxSd3wFd+03k0mQ/hh0DIgsPtJ/iWvdrM9otc8
 wamSF1Px9lrupkMlgVHhcEQB+BgZMuk0Bwy6b1RDu0t8j4V//7C3FmAXVugKk8VUB9ma
 qVLK7vod1iIZWl87lmUCI08zpg/uwN/WAOc96/4cAQnR4SqEss0vovs/K8o0geiecBuZ
 ESSozQsqHWHLEG383icdnehfGdbTPugmqv8x8tIK66kfjizUQ2k6a+yyiETO5+HCYkBT
 a8FLcMXZ4Q7oyP3+4r1EDAcdRaqO/4VO075btfG0mnpvnEAcQGB0mojpPVEd+fXkbpt+ oQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f6hs3vs0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 20:41:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kx2E562uYqaifaQO7wyAaY/UsyBKbssATyA8gKGtLemtcipYOZiwLIqB3eJ850NovMFJMmJVjlq4JSURE+szGBno/I4gnRACsBMWQTmDCg3dQOPVANVyD8616sxOKuPt3EVDDt+F99ub+pDqoItBrUheHJQ+4xXV5e9c+FOjkx5Z9ZsA59yx2n2ZG3Lx+0VlISH5HXov9fYG4S6l9Vn1L6KbSHt7wIhJnz3b/VcdPLEzztaeVobPcieYDoWrcPIyv6W1V8YgKpPvMRQ3ZsjbPw71uHKPy23WdaNR3Y8LJjBPaC1YqAN6Vfad2DMTuJHurM+4pVUdUwqC5alYZfrVPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxDr/FaM9nmjbpH40JYL0dVwIf3Z8YnQHrZaPY9DrPY=;
 b=SqwzY1FO2Oj2D9FAOnxfanzGluqsOmVS53gQRob1fF0SLbw+1tix3Bdjg4+qV+epyZNSeA3H6bsLsFfZlQ9RaYqSXcGfShCq/9LsvKW2V41vY8pTItDiZxU7lfJjwVndNX/0atXnv+lNnTNhWYHbWZ2dquZWCahnnnMbNE28kjhxuM2R9rhqZeFGEsD/Rx7f/fgnPop0SEtoqeEdzR37UMeTuDX3Ndw3KEZ2HPRmChhUOE5B5HTgkmaRuNQb2Me+RED/RNxEKrgA3jSI0rfhS+cJhjL+4QxMiFyIy+V0Qzdes5ZLUV6kpGmzFPcfkuMpio5QSc5tMHjbPL8jFZYNgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 03:41:14 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f0d0:2344:b876:db97]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f0d0:2344:b876:db97%7]) with mapi id 15.20.5144.026; Fri, 8 Apr 2022
 03:41:13 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] spirv-tools: fix to use sdk-1.3.204 branch
Date: Thu,  7 Apr 2022 20:41:02 -0700
Message-Id: <20220408034102.59039-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::35) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81489d8f-4401-453e-d5f7-08da1911a116
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB56116BD82EBF6E5F82752289EDE99@PH0PR11MB5611.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VElOe/TCP6BHTmRyi/fpZfKyuDQyFvNy/RgCyXKOQ7MlKvkAJH50uDXvd2uHKK6+CTV1exot2eNB/+i9eXJmAvh6ufzE2CuWTg32wkafVm4ApzC8723mtuca6ghmL/d5DTo5TcTqRLb9kXKT/42M+Za02CqybhsJwLr0aEn678CkptCeS0hf4U5J54/RGXqXmMgX0ttWJ0SjSm7sgrLWPdzmhxdsis16YgZj6iheOnzSzASSHhCKeZotDi3NRZyQjwFUN31ksuy9wHlKNHyIQpWl/Pw7l/9VNyxerw/Zw71AfykoQIzO38uX9TJEDHrwJDFWtPNoiWy29pRtz6+ajwyscnRsUDlNeoV7I+6k3w4CSsQ5vhuWfUXe6HwpgObLk2tx3nIaEQfY15dUKL3uYwBB7UKbfhV4xr/NEzVKXTOmaFXbNVz0Xg+89boAfWrsxpoxB05e/0TOi4BRIDtLFGE3UhzeXAzVF1bAIFoi8qiJr1XiTkY0omJM9XstW4idTGRYghSL6ZxAgfmEV4R1i3pZi0u3LR76orGEGtcf5MNfbINGpnJxQoR5BEzqTdh6CRLUeKpLiKXDdZx5qj4NYdi/EMd2EIU4t0t7gUcG02SzOG/fCSEHQHkejUnHU9MxrKbYEVFsus571n9YeQ+rk+fD5BDyLoBxfAuLoLiY4kI/FrfYFqExLsNeBheCHINCUn9e9Dyrl73E7zguiYdLuA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(38100700002)(38350700002)(6506007)(2616005)(2906002)(6512007)(1076003)(52116002)(36756003)(6666004)(186003)(8936002)(5660300002)(6916009)(83380400001)(8676002)(66476007)(66556008)(66946007)(6486002)(86362001)(316002)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ok+sHR1HGmH9AY1K9T5PyU5YAjQIGzyGSO7401fjtfahDYPk+E+jyJL6z8Z9?=
 =?us-ascii?Q?IzOqZRM6jpoyoKMlzi/OZt9dE8MBRKuGVyg9G3RrtW3itSqTTnhMe2DrKQBi?=
 =?us-ascii?Q?qPeFWe/uqNa+LJXRZsOFCR0yTkPSrwLJXB/OYR+TIp1ohNy5F8Uh5nO8B68h?=
 =?us-ascii?Q?R9w0L1JKkme0k/ASWBLrci6kTocWN1Rsm5BmrRkdOBgIZzviQTEc6ZnIeivV?=
 =?us-ascii?Q?KqM/jD6QUQiGbl4JyTkm/woU5osmimMjBy9joFwT0NHq79uDc2iCkxewUg76?=
 =?us-ascii?Q?Ri8n0Bdd0ymzMg3om0i9Y5//IqM0jEE+62zSV2aQORP2FAZq5V4Gz/gxwG8q?=
 =?us-ascii?Q?tavMG4y9LrDnKNTzVoEilFYthqHutXrTqpyVGKlrm3GkqdPiSFxlg+y8+Mcs?=
 =?us-ascii?Q?sPdzzflNTtc4n27nMxZ2kPoAD7EJzsFbTZiK15tYm7ZaEFt0vLFwMppA9Dzm?=
 =?us-ascii?Q?07G9g0RVWfPZtguxEd9/nYWhnfCgTZgBYH/DlzjcFRK1aM7lj7gqpOpkvO5v?=
 =?us-ascii?Q?QzQ6w7w4KHOuj/w6XpFCgsJyiGkYS6APv3zItNTI8w9PWkpENFTNteZX2P7C?=
 =?us-ascii?Q?Qy3hw8mFjORMAMpSUU1LJZN320KrKMKlzoa4uFX/cgt/n7U3Pcth9YKS/YU1?=
 =?us-ascii?Q?bsJLZ2YSpve/dGe0l7NPZNKyb7W40cPJHJK/78EhlFa/2JQmavhMR/wEF2Mp?=
 =?us-ascii?Q?cgXVkxbwdpMC++seMxR9FHYW7voFhb6myKWapUNxoi4hng6r38cKJXaWYO+C?=
 =?us-ascii?Q?NhtXHv0Z3PdccEovalyCleYzGojuSMJ2G42guYKZff7WdeMqj8+l+WzKHwlw?=
 =?us-ascii?Q?tSJlEWwyM/X3D2UVIAa/WBg4doRgDwL8RXBL0w0GdRI4Mcs8qshwYR2plo3x?=
 =?us-ascii?Q?dxxr4tXbeHdRI0hhefRY2J+cnywwzYeExyWiS0r4tVmz6DsqyKFNsJ/uV5yU?=
 =?us-ascii?Q?/WKDIL1mZ5sxvL1Wl6ECq9qseEIoKNYi/G4dWgiH9dhaZOowKjA6aOwePpuX?=
 =?us-ascii?Q?G+chELXXAcyawKtMy6xvCoZQBHExifd8fzH66eGQLaev4w/ugu+3sT8I3XOp?=
 =?us-ascii?Q?KApKJ8CO8FteByy1GSJa0oSdtXvoF4UCHk4KlnOG5EYEScWiqXJobopEuXZT?=
 =?us-ascii?Q?awz5B+bTmaCXNDghhgy/cDbYSUPjuo/1NJx1ej75m6XvZluG5LLel/khxfI7?=
 =?us-ascii?Q?3frM07GPACtAsaDxB4m6eO6S+wmcI5k+Caqn66AEHuMtgV4jfNzCRC4sDPkq?=
 =?us-ascii?Q?1lu7zJ7pyV7VOckXFR89+zG1ch8CWfHvT4lIKOjjwkL5K1ZK/X/fPPY5UCOz?=
 =?us-ascii?Q?nOWhn1jL/+2FItxTpGGxPxvbXlrFYKbMNTt26k6PRF/LtMoK36Hans/uxVNo?=
 =?us-ascii?Q?VrgCBmoY2kxGXPsA3B2y2SaYUqHyaVb+/99h6QPWPlS2tHZc2BFtOdYQqSTU?=
 =?us-ascii?Q?Jmqs23r1pn1HjCKdno6TF8dXjPBMLt4fARb5E6h5pmJW4WZQUOdZgjL/FsH3?=
 =?us-ascii?Q?KRN1TmnoS4ya3/uZYdFpPe5rLxf6ed4b/Xp8baCpuFfB/sEoVqpuzSoknXCF?=
 =?us-ascii?Q?t7kaXTvZot9WNkei8NLK0ynntb238jZ5mlBIrAkDd2ywg1NQiHnfu64lYAHX?=
 =?us-ascii?Q?VsMXCF6QoFp7m0qFlh6g2Kz6UwPTNjc+fhFYtfd5+S0g8iySl4nj9BPiYdga?=
 =?us-ascii?Q?Rc3/iZGusNKmiasf/Fobkd7I2NxxCRV5HXneQxMa5fd3NHmMzPJNXqLqWimY?=
 =?us-ascii?Q?ECR40VywCwS4ZzjTFJ5n3YRGt7l3zxA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 81489d8f-4401-453e-d5f7-08da1911a116
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 03:41:13.6925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GfsfdG6zyqhdWedn9LU0SLaUOsIWIwQBkgF70aaw5y+K329dE+n5qUnhMk39EoLlvZG4dsmhnBJV4Mx/EBFroA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5611
X-Proofpoint-GUID: xI5xtR4Nz5Wu6swuRH1oy5hU4W0Z6TIq
X-Proofpoint-ORIG-GUID: xI5xtR4Nz5Wu6swuRH1oy5hU4W0Z6TIq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_01,2022-04-07_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=637
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204080019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Apr 2022 17:09:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164151

Just as pointed out in a previous commit:
"""
We'll continue tagging the repos contributing with SDK releases, as
that is when all the testing of the various projects is performed
together.
"""

Now the repo has updated and the 'stable' branch is forcely overriden.
We need to use the 'sdk-1.3.204' branch.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-graphics/spir/spirv-tools_1.3.204.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.204.1.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.204.1.bb
index dc78073717..4c908d88c0 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.204.1.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.204.1.bb
@@ -8,7 +8,7 @@ LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRCREV = "45dd184c790d6bfc78a5a74a10c37e888b1823fa"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=stable;protocol=https"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=sdk-1.3.204;protocol=https"
 PE = "1"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
 S = "${WORKDIR}/git"
-- 
2.33.0



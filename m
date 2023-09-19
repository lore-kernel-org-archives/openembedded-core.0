Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0221FCD3432
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 01:22:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8342.1695086566614084423
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Sep 2023 18:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DkitXXwO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7626200f2a=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38J0obOJ029987
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 01:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=4J13/1ovlb7x3SPZJG
	uVlFCt9ufljIWFOWC6nlzHqQo=; b=DkitXXwOJukhfX2DOgmm7XWbhrVdYbp6MX
	aU/Pl5pVGRvTq3TCto85HVXCOR5POgjhDt9LAHgQVYEztNkwXrS9aDjPoVT5Tn/X
	/8/ae4gVJXyLodszrrWui2IOSM+MrJEdnV5Ty5xR0o7YakPSFmDcSMoe3Aa4WVOc
	FgRDlh2S57S9yNXsVqWdVkLuEY4CDLUp8o2CulLGS5bmaKH5y2u44SNqu6xLG0bR
	r7g2IGi6fhr+XlLyQJLPgbMLlMM2UBnjijwmu07t5A00mZ/nmnIveU3vkCfj58Ba
	LsMIVQiQPE/P1eLkeDhsZW+14mBTk8bi93EI2ih+tgCEt8GMyNmA==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t51jxa1nh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 01:22:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uu8DPC56VKnAFjvCtobXDrvryR/1J/49iYq7zkAswI7p6mIfOhyF586j/3Ie/qLzBZpZQ33Nlj2OoEms9OOlxKJFHH935uidB5Ju0DVgomFwuuqP7To9uECS8vAcL9Hew2XfYdNUNppF0Zm5dLvYKfQlG1vBdAssm2CnluilxttnKL4kLIfESncVznj9OTHQJ0UI+R/BoR5XJRCLI3Hf/N9Qg13IWpuB6TE5+H8x/YZZWTo9zhS4XKC7f/eSzkb/HiwS+immvsKhC9U3lJjl8hooEtv3yQlzais2xlw8BEhZn1OyxTXzH3ESU3GIB21vU9o5z4hunoVcxbERpEdwJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4J13/1ovlb7x3SPZJGuVlFCt9ufljIWFOWC6nlzHqQo=;
 b=DAymeZWq+MB/bWf5SpGiifeBhFpua36x89aqnaxrxev4oeSq6It4+WN0pFgtlYTCAnA3lnFxcXUo0QBRjdQx0aa1roYWHIb64pH8Kb7zHMVj2fjpS7y1PLxqLm+sk8oKrPWdxCPW4IAGyEsURO2/rRZrx/nrTNM7fpRJhNcgw6WmAiETUzvTmo4zY8FRjvohaP9zizjDLx64rSOJoK7qpLq5RRxzLqtnJNN2P/7sArpLnhez4fKlfK31N4xgGFmLtKH+Qbr+opUZ8kfsbEV34Yoy9CLOAdIGwPf2d7oonr+7kUBtf5vfipFH33jqwa9eCR+yZButrq/ljBk7BZgXdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB8775.namprd11.prod.outlook.com (2603:10b6:610:1c7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 01:22:41 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 01:22:41 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore][PATCH 1/2] multilib.conf: explicitly make MULTILIB_VARIANTS vardeps on MULTILIBS
Date: Tue, 19 Sep 2023 09:22:21 +0800
Message-Id: <20230919012222.2407906-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0035.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::8) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB8775:EE_
X-MS-Office365-Filtering-Correlation-Id: ee6b7953-dae5-4218-fd0d-08dbb8aeeb0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iLpTJVbebBUUI2GaNpW7q7lcl3LwmaemlLBsGJk9wwt1gPW5zw+yAZilx5KGrPC3qgJgxsfDGLnmJCe1lZC152UXoqHUK+DzVaiOsayUPrikjeNmSev9WkVX3Q5Zq8GrqSpnAAtEHuRH6cCdpOOdJYsFPyOfLHkJpCuaqlg95GBZJTg4KrUnlYNe+3sOKTg2t2TykFklrEndRsk/7esJJ0VUjoD6QJ3mO1TPR0R/W77W7Zzl2dRfeGTQoknbrGVmGUCJDxkb2jYrjlTRcvOIFTubT3iB5zKIxCx0Q35gWUAGeHsCHK51QKX2DPx/+KbVCRS7VBrPz5hOUcq/mPIT9+lbdkF4pffO7bwpIP3ATx9j3cN25Cis8Bktuhg7IRJi68i65gqjm+144jpflG+V0iNNTmsY4Y7OVPMVSRY/ipjJcUb0iVY4hDCFN2QBRyfOXPVc7EzhDKQ/Sf4mLNSUY932yIPNbgKtaejrnmcaqg6Ns8900MuO4Tlorl8o95ivV4tUaNPB4X9Cii7087G/3wCJ6J5YjVvtbwUYfrUABslz26i8aKzV9p8wGanH0nJU0Q53QVvzjQCuJSCve8rvDujgc0BIPr9Vrzj9FcWHBAUbKEBvR2UiA0lZ/O/bkUdX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(136003)(346002)(366004)(376002)(186009)(1800799009)(451199024)(2616005)(1076003)(26005)(6506007)(6486002)(52116002)(9686003)(6512007)(36756003)(86362001)(38100700002)(38350700002)(83380400001)(5660300002)(478600001)(41300700001)(6916009)(66946007)(66476007)(316002)(8676002)(8936002)(66556008)(6666004)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VFEH5rFNAigG+rO4MzzNlyM9r+vWcPWzUozuF9i2jZPDUJJiSrH2IR4NHVTA?=
 =?us-ascii?Q?Bg2d1qVOAevMYHUrWQ0Fh32826Vm6lJGgFgA8mKM2RUmgLmY/BinH8cpU2Kg?=
 =?us-ascii?Q?fZ0sGbvUxAmrLM9jZs9+wFJ1XS7CSBISE6e9YfOom0JfDaHmAnwZLzntEeHh?=
 =?us-ascii?Q?UsQ13TtcdZcdv+i+Ej8YNc610nwK6eVc0VQj7bxi3goOqznhJHrgDksU8v9V?=
 =?us-ascii?Q?g+cEMGGfCzvKrHl+Tw9WadtS098h60pDHaWoSr1QBpyuF79ScP9GKgy3kR8a?=
 =?us-ascii?Q?CfNO8lLEaNwn7dkqwwCXYAYXjm2YTMJZPO9OCYsCx3l92YrtYT774cBIBojM?=
 =?us-ascii?Q?Mb/hgQweKD8oYKT4jTh7+VMr99gYvfhTY5pWSrJ01pCJk+iKMNu29kQkA8SI?=
 =?us-ascii?Q?xx45mflv+CoEK/M9TeI5q9dyBNLjMp1vK12JkVDrqJ/3c76q1TQK+EQHsxKz?=
 =?us-ascii?Q?HasuaL7aeu2rPaVd2KfmsxbfLY9wmBF0ScoZ4/MKKp64gUwRrThtXGUAhfF6?=
 =?us-ascii?Q?MuxrlCLHPEfyTY463ivI9rToEHGSY+sewaebi7H2k3l9qu5HCC8qWdUg/I78?=
 =?us-ascii?Q?zjzPl9L51hwhKGD7Q0vSDwgW/XaiWRQ94c687Y35otd9fz/VzwD1czMFkx1K?=
 =?us-ascii?Q?EQ+ZBgeHYVPkZwxJLMZiyo8EZ6Rrc/S+Oz5UpGUdJCbfVsU4Gq3RDuPWtULF?=
 =?us-ascii?Q?uyni+Six8OsXKIWMRQ5DyESrC2JkAZqoMnmKYZ8yrKcHeg9hS2kQodx9sIxJ?=
 =?us-ascii?Q?ZqP5xtj+V32ygd1/snzxz7FWziHzVsMM6EkRaGK7JHKTojdMh1VrezWXebfV?=
 =?us-ascii?Q?Pm7gyZ9D/T3XucNUHrrSHCVwI/aKVVUkpOD761F0Fg+LTycRQbJhjCsL0kuI?=
 =?us-ascii?Q?CIuxuCCFHK77/VDagfU9Cjig/ZCJgFwPwfCE51qvWlygGxkJwH3vXLY+bvcJ?=
 =?us-ascii?Q?X94df0kX9nvy2uzZ5bbReKHOOXKlFWhzze/P9oFyoYUo3e3DGlYZwd4Xm4p0?=
 =?us-ascii?Q?b2a2RXbQ26+ppplXvK6/UikvlGW10dckGcGj4QoGUyK5CVYkmmuRGV2CU4WQ?=
 =?us-ascii?Q?0KWU6ewPnkc31GwwN6zd5W+mT8DIYvc/2Q0fHoHVz8hTlvafKlH9as/7q5th?=
 =?us-ascii?Q?UM7uUiIk+z/EdJT9s9BEANcrco/mJneEgvlo+Fa8XDJ5drtcSiDVn+vYJiWF?=
 =?us-ascii?Q?9HLqhh8ZKnwr609BgczkfeP3trV6s1v+gVb6kUGhVEK0GH/j4nksnCKb9y2t?=
 =?us-ascii?Q?SGPVYKJZc7fxji3oyYZru1Fkc3009hs1zTiuZL4rLIfYRi7LOG+VyyZJjcXz?=
 =?us-ascii?Q?J/rRUi6Gf/en/0X3XqGQdoxZ/YSOWBJal5dmDE4A9MhaWxM8j11nGpOobZbL?=
 =?us-ascii?Q?8BWQdN+4Vk9JV+Q9yv1Gd+Pr/CHj66ITk8GKdUl9PflVZ3nYMKgG8j+WLwWA?=
 =?us-ascii?Q?JAOB3bDvysJoquvL7E8Ppdaf0whMCN6bQ5zVgBnHfYInFev0RvSnsxjirYw+?=
 =?us-ascii?Q?SoBpzQIWBi2ZAW7Ez08cRqgCrErFZtTB7Vi3gWRb680d/ltpbiBH96UPi1NG?=
 =?us-ascii?Q?4zRs8jiAhvrLiF0hcghBGBI2vUkJdK2LJMfawa4p?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6b7953-dae5-4218-fd0d-08dbb8aeeb0d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 01:22:41.2767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t+Q/L19LYVjjAQmvcGU2jCCrId0Ld2aprVx42Zbvt05la3EThl34JOsx9KntSF+8oAK6X+h0F+E/Up30/PNORA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8775
X-Proofpoint-GUID: TgSDu01doI3aPudXIUwhvYXNniOWAkFT
X-Proofpoint-ORIG-GUID: TgSDu01doI3aPudXIUwhvYXNniOWAkFT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-18_11,2023-09-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2308100000
 definitions=main-2309190010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 01:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187848

From: Chen Qi <Qi.Chen@windriver.com>

This patch is to ensure recipes get rebuilt correctly and avoid
incorrect sstate cache reuse when toggling multilib.

The following steps show one example of such incorrect sstate cache reuse.
1. enable multilib && bitbake <some_image> -c populate_sdk
2. disable multilib && bitbake <some_image> -c populate_sdk

The error message is as below:
Error:
 Problem: conflicting requests
   - nothing provides binutils-cross-canadian-i686 needed by packagegroup-cross-canadian-intel-x86-64-1.0-r0.x86_64_nativesdk
   - nothing provides gcc-cross-canadian-i686 needed by packagegroup-cross-canadian-intel-x86-64-1.0-r0.x86_64_nativesdk
   - nothing provides gdb-cross-canadian-i686 needed by packagegroup-cross-canadian-intel-x86-64-1.0-r0.x86_64_nativesdk
 (try to add '--skip-broken' to skip uninstallable packages)

We get this error because packagegroup-cross-canadian recipe is
not rebuilt when it should be.

Current codes have tracked the dependency to MULTILIB_VARIANTS, as
shown in the following chain:
RDEPENDS:packagegroup-cross-canadian-intel-x86-64 ->
all_multilib_tune_values -> MULTILIB_VARIANTS.

However, MULTILIB_VARIANTS cannot automatically depend on MULTILIBS.
See some results from 'bitbake-dumpsigs' below:
List of dependencies for variable MULTILIB_VARIANTS is ['extend_variants']
Variable MULTILIB_VARIANTS value is ${@extend_variants(d,'MULTILIBS','multilib')}

It's obvious that the value of MULTILIB_VARIANTS depend on the
value of MULTILIBS, so let's set this dependency manually.

(From OE-Core rev: 9f47d8eb51816d16078a23c0cef4d697555f913f)

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/multilib.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 7f3b9463ef..ef3605a73d 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -2,6 +2,7 @@
 baselib = "${@d.getVar('BASE_LIB:tune-' + (d.getVar('DEFAULTTUNE') or 'INVALID')) or d.getVar('BASELIB')}"
 
 MULTILIB_VARIANTS = "${@extend_variants(d,'MULTILIBS','multilib')}"
+MULTILIB_VARIANTS[vardeps] += "MULTILIBS"
 MULTILIB_SAVE_VARNAME = "DEFAULTTUNE TARGET_ARCH TARGET_SYS TARGET_VENDOR"
 
 MULTILIBS ??= "multilib:lib32"
-- 
2.34.1



Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37795EB64DD
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 06:15:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1622.1690438544686864077
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 23:15:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Fg7PRp/z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=65722416f2=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36R5g0mo013461
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 23:15:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=k6K/GOnEe3N9PPoKCc
	5ydbPHUK6AfhW5MYJWavr/u34=; b=Fg7PRp/znE+kCyGMCpLXdfNqmhLd3RiYs9
	83wOMt5EcVUUvdFUXb8Quhl/bN2evBglAc7ByMVrd/S0wuLkNtTkm7LvbQVW9adQ
	MMbdGLo71/49yaa9gfOezRvQ6lzdjlZP2nYvwI7IsuVaR+hZo9TiqmfBlx4mFGdB
	BEaGq+dMSyaHC+WBRdJXJ1ssBAesZXOe8sM435u91QE5qkdlk/h/wMHaE9+sXSG+
	BV1IdCSx/TShy+XyuTpsE8Ln9LsS57uF0swXy22Dmfu39ORxf6SOxVd6zfcCA+LW
	LZ8930WYjb1pmGRKOJcEHVomTNvMh5bjxk3b/nZsAeBJtFRoIPSQ==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s3bear9j3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 23:15:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1mBrFgNmaoZuPo4qAc+oXY2yzp2zjYpdpStn1mwBVnWdOtj0pOk/83G575Yu9OS/DwZntRgzM0kysn0Gzsepx/cks3/Igx+mPsVy2UaFaWZUAoPag55vONLx14ukDsvAIs74b8yd0TYksT7buUkZjKzbp7hyYgjWufF5CXN5R8Y2jEzVcK91zYo6DbAmiFvihsglo+LCu9VW+KvsJNkYyAZoaHUAV7HsORmJ/5fo6HJFGy75lX2kQeJm9JOr/YM/XmpdSXoqZ6j05kBbVvJ9RK5UKBcLDLC3QHMV/khskUiye4FJ8hXB97n3VtT8fGAJ7/8Nv9x/V8TH44NlPMZdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6K/GOnEe3N9PPoKCc5ydbPHUK6AfhW5MYJWavr/u34=;
 b=Rzd+G4T89QCUXsKmpzeICVuL4/qKZys/hAocp4Cg9vkPo6JnTYckBNITtLdftsIWDzlAcSyJYcecbrT1Ud828XHnL889QnCsTU6ReIvPg1ft9FYxe4rn49oTYHgHBeRrdk0yT3s0bPvyPkT1e43qRcDk018EG7lK8T4t9bwJAe2SC/IfSedJHwBiocdwj5vzfXAKYZWtC2QCOGKF545lKKGI7dcoW+J+4qx+qLTe7yFUmRQKhiy8Mag5CDIUR09PJZ+KdR0+oMzknMNZ53wGeiOCFf3WsqgmaYSS8xiNt+Kb7cNb5TniPRnzq16ENJY16/z3vmRtrUSLyEGmuN0oNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB5950.namprd11.prod.outlook.com (2603:10b6:510:14f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 06:15:38 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c60b:b353:ba77:8cb3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c60b:b353:ba77:8cb3%4]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 06:15:37 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] multilib.conf: explicitly make MULTILIB_VARIANTS vardeps on MULTILIBS
Date: Thu, 27 Jul 2023 14:15:21 +0800
Message-Id: <20230727061521.3626071-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0077.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::9) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB5950:EE_
X-MS-Office365-Filtering-Correlation-Id: f7f2c652-cd30-4277-5c44-08db8e68e530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vZtQHztlS7rEnLdmTa79b67j0OF1OFQyLMkKmZ3sSnfrc3+J5PfrkQWfiYAV7eqP6FPsacC4TDUY/bD/5nwCP3RYw+/D7I9FG9bTlZLhHeTySypk2jyIxExGTQ/K5aGZatZRnufg0ucvm25DIjF3eoCCwCffGBmGQHJwpALprSOmJnPY0cRTChrqALUSQHmnh8mx6cb5K9AR6WSSJ+w4CNFSD9N0jDjAl8heDlPqZ3Ns9V+zCVCvtXMsSZFyrp6tbOvkFLGYFf4pyYEaUU3LF6Hewr+crYRgGboW1TqvbyZTUHipYTar8zb1vOzOsSMdIuO9Br6c+G17gJ9oUaFdKj5jH9X//TkEtF7sXC8l8nBFDLkoKAR/63JVwWIrRp2fcHfgrGlIO5W2x2x2/1Uq2lVnqNccvyDES2HAH0PoZRMDc+wfUTWrJHa57OAhUGviRi9+s3ybS4ixX/eLQfoOb8qJRZk6qLahldT51nBAkmN4Ww1xGCezbq+3r5EzJLTk+6rmVH0FMWDAzP4p6xOeTZU7XiEvp0tH5PbiwEPqRhEpj2jP+YCXAH4ZvFji/ItoDVNGdF9m+rWXYFR3oTgXbG7WDe41h5JXDNMtje148sZtJ5PoKzizTemoMm9dFxLx
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39850400004)(396003)(366004)(376002)(136003)(451199021)(1076003)(6506007)(26005)(478600001)(186003)(52116002)(6666004)(6486002)(66556008)(6916009)(66476007)(2616005)(83380400001)(6512007)(9686003)(38350700002)(38100700002)(66946007)(5660300002)(41300700001)(316002)(2906002)(8676002)(8936002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kNrqnoMRK3XCEn3maVWbWWqZfI8x1V2NYVr/oarlETKaQRqxnVBbgVLqsCww?=
 =?us-ascii?Q?nSr5Yz4ybYgj31jFfgMUmWA0U+QemFFACve+7qlPpm59s9VVJKEAcetSooLf?=
 =?us-ascii?Q?irG2ug6KLPN3TGw+c5LPEKmpV4A9vSBseKzLuEb3LLzNPGLRrz4F7e42MxKX?=
 =?us-ascii?Q?erc3GkHUpqlTPjCtwlD42Sfa/iTNVKBNakIlP1c1H7YRRBNYMgAoaLiEYhmA?=
 =?us-ascii?Q?LgCDuKX/91T2eumYaPCwZrjl233D+TwaRVLWmlUxFFWOu9cQkijrsuaNc+5C?=
 =?us-ascii?Q?X582L66E3/iogFk7ndABSYHhASGREyUZMoJBRr4oLWcA3rk743KlPH1XoaFu?=
 =?us-ascii?Q?QrORheIIcM058TFqQ2+Ce4teZzUCbdj2Yigu2Iu+pdEX/vOHZMw96/zAcmVV?=
 =?us-ascii?Q?dcErgXvcLl32CYqY0FxTnwKKfIQc5Nxeovw9QM03K3oeUnLtBgjOCwjT4u5W?=
 =?us-ascii?Q?1AEQZFOW6UzaJzEnOchTGud9MsuAtOPtGfwy4ZpVCxVhi/rVwL5qFT8TgXsx?=
 =?us-ascii?Q?MfMRyhOuIdSjIe2asp7TbURXTgSuWxjhhCyG5JcBtAmgnL+Zz7z3xmnsJ0xS?=
 =?us-ascii?Q?que3aLmJ9IN1GErLz0oiSu83u/8y0VVGc88XGgN+li3U15B9kNBOuDWunrwU?=
 =?us-ascii?Q?bSB2Q+R5DhVVMG7CRu6COjR30gLLVAf48k/3IgXvSksBdquwQktSIEmSRSKS?=
 =?us-ascii?Q?NusUQ0T5R+unu95tcvNDCQlu3DlNkfRkPx8pBIqSW7pi0bJRFlAL/8UqDwb0?=
 =?us-ascii?Q?2dOQhApnAgdOHbm0yMHRMTqdqmg2kI8exqWN0C3MlgbH3K+2x/jwMANOfXTt?=
 =?us-ascii?Q?P3fTt8xcQn7DfKNtDL99WVCEBsZ+XZAh9+0TPgAMsQi84b4XRts0Lg24NsFk?=
 =?us-ascii?Q?sVDXSpR6Esi/PhXn/xmjXEhV9PbUYcVtwYlY9mS5ofvdZ7N8P0Bp4kpHJ7Ze?=
 =?us-ascii?Q?OFycfaMQiLOQ9iL1ULbPrEpNr8MXzCJXL6hoS1vpv+/afq7W0ugniAmgT8PS?=
 =?us-ascii?Q?DFvvRK+Hka3g47V5mldv8bAH8RDH5ZZSMLq9iRQjOnEZZg8nRViEciFVxCi2?=
 =?us-ascii?Q?a0mrQI301AygnSa182CaO+2/JbCiOyiuhgqxBjneCvQxoP6v4kUo6IRykJsI?=
 =?us-ascii?Q?T3Iffk5HPdXFBjfKO976IdIMH4EMI1f+hTiSwXRm+jViRn+qhKkn8GRbd+zb?=
 =?us-ascii?Q?4k00RBOD2k3lq67w5VxUTSgu+8WIBeGzN98Uxyjf6XfXgr5MLYb6+qj2iLo+?=
 =?us-ascii?Q?sE5n/25aNt6Ybo4rX8mTL6IFyamJAcUcxB1WhmZ5V/HLGS8KPd6AIPBUA9QI?=
 =?us-ascii?Q?4LejlogisLX1hmYRPOVbXsIC0PQa7ylKAMoARr1N1qaJ50kmo5m8BHnslIdG?=
 =?us-ascii?Q?QMT58CtG3gAjqnokZOTW1+AY1Q7gXWPrpJOQ/WFyfV3aUKS8Azk6gW8f+Wih?=
 =?us-ascii?Q?ScbSi2jpf156eo7M/mIKV9h6ysSYZ+Cqw20L5qMuyuVqu13npDgGTRmWx35A?=
 =?us-ascii?Q?B+axPD5PS31hHQmkeRSSzYSTFwJYgBQ8x0WQO5wI3JqB5Xvmm/sNda6vtrBR?=
 =?us-ascii?Q?3yerFg6b32LTtq4tX1LjFNaDIt0bxvaFfQzSLAF8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f2c652-cd30-4277-5c44-08db8e68e530
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 06:15:37.8876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2FnbxEL60p/MF94QovVm8PVBepuHohQsfwqqEtYmK+lGm0bPOOk5PDuYcmYbp/jRRapAQAabEczE5gbiQQFFNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5950
X-Proofpoint-ORIG-GUID: -Y5zkWOHccFxibpliuHpoO-3wq0oMw8V
X-Proofpoint-GUID: -Y5zkWOHccFxibpliuHpoO-3wq0oMw8V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_08,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307270056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 06:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184911

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

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
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



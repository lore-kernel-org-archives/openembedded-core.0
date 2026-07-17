Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D680AC44524
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 13:01:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12991.1784293294116761891
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 06:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TEgJGrz7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1658a50258=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HCRHYC1022731
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 13:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=VPXhpoqFI/MdyVXyUqITi5khnXQ/EP5hWxjh23ST05Q=; b=
	TEgJGrz7fDim4BjJAYEvZ6yxbmYocw2Ix+VsuGeHCAOHt3Ugd87Y2oufuyAEeWXh
	jthOtEc+imjwtTYoVSOtfYcRZ68L3vyQRm3AV3jA0RbJoh791/VzKrrvXRq28EsY
	tBTPyBOUv/CAX3thv/R8WmCCbgzUXIrUO9mqzkWJBQztUZWsVyWyiPRf++b+13c8
	PtFaLVvqO3bK52oxEK0iTQbeLEGAc+JBY52qo5DEmZNnXPh0JSS2sYLzatdino00
	yxWWAQ/s+owx1UHSs7xKXbWtmRHfXVuoRLPN2AbskKy91EHT/I1P+7eB+CJnHlQ0
	lDZ5QOz2RFBbd30ydLkqbw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010051.outbound.protection.outlook.com [52.101.56.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ffhqw8989-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 13:01:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lqyzb7K7Vj/xLHWozBmn6B048M8211Wx2dL3j4eUN68foMFIOWYeo5fLfQXTSvq5TKAR18AoP2/ktxvFm924O0LAar0NANtHRkbLMLZjgE8eGmRBStNn/GJ41DcXpG/RwHsiq0WTSOfFCltguPoE2k4mNz0NEG9ysU4OUQumVBLf/vOnXn2N8IbPTkJCtE0tq14cGHlRCAoeOGIgO4MvViIbC6T1+yG5/H+q3Eck6lJRS1fmEaH+RcXCV+VxvAU1clDJsLTmNuAmHaGgetnMGR2mlDCiRrt2C/R03VUCbeYBeHBU0xcsJvqocZdg7U/k7AITA0nnRSPr0z59cktivA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPXhpoqFI/MdyVXyUqITi5khnXQ/EP5hWxjh23ST05Q=;
 b=w0Zi0ra/tw53MP1o/wq5NNJTA30E7oT7VDPWr/XESKDEMQLfwtAvyN2RdAktU8uudzyiPutfB4JRCLq73UG2B1FOnyPs7O3BVfoaCAstyUsE9u+XFnBurCVNNUG+0eRAC6X+ZezhUc32B1BRtbM9MEmSjiSJ1wZ9KuhCXouXiGVwaBZDcT/unlo66AyvxMzuCLYU5xguihm4h6F+WfYxt8EaTuInHDFOjFB6LSr0KvNCw7B4JwDCvbmZwmPCxFG1bnaT7vU97FxwXrG+QTAQdtFAU8aW8MUKq9XnQ+Sepivbon00TU8PicZf+Pr31XV52ZrFnstaSRREETCEeYxyXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB7852.namprd11.prod.outlook.com (2603:10b6:8:fc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 13:01:31 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0223.012; Fri, 17 Jul 2026
 13:01:31 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2 4/4] populate_sdk_base: add kernel-devsrc via SDK_TOOLCHAIN_LANGS
Date: Fri, 17 Jul 2026 06:01:09 -0700
Message-ID: <20260717130109.2187282-4-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717130109.2187282-1-Harish.Sadineni@windriver.com>
References: <20260717130109.2187282-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0180.namprd05.prod.outlook.com
 (2603:10b6:a03:339::35) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS0PR11MB7852:EE_
X-MS-Office365-Filtering-Correlation-Id: c186ea0f-bca1-4a56-9830-08dee403858b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|11063799006|10067099003|56012099006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	A0/kypf9et1KV5NL/zEbH1rTwlUDqcWTEMwHbit8K0Dt+s9MLtsm2ROYDCKl7s8tKAGCb4zMEnG/N6cfDmHTa9rrlRRPxQWi9wxXolz6N3PNP1mVgG23S7b0WFAPmWnUT2TIhoN2BFYXP8lY8zfKdVtw2DbcEDNkiT1JzIRQD8PMDkeP+H5WXa96reVQ/G/iCHvVpd9Uu3lBxAymijG64kGxTSugsNiCS+kZxis0L4uKk3Q2tm+OcajQsRHT0MyEXD4MOrRyqj9o7bHPHW4eaKUpyjTgmKEjylliifFQeXuNXtwoa9zh0rNYtgeswxd0UJdN4u0rNdAlz7m9R+lecDB3nYpbxlsMnHgLXkMSYmKaPTA6mh+7tNTgDbnR3OrZV4Ya8YV28fGJzHrAIz3+vqLUM3V34swaZ/A7ipnjGwI2pxX7MLJDmSbiriXtfZtqEy4RdPTxxaDTlKKcro2rLnhR9u3zziBn+zoFy4LYFF5kUKi8BwXm6R1xDDMQM5HypXnf6+3t1Dju1Xi5xJOpdW7l1BuWVgqdDOdsrwOur0MKfEVyeJPlCRIHjyiivw/JPRI8m4eBoG9lbMxDad29jOeWED0iLVmuP5/qF29Tj0nrtB/vST4xjPTL+pZUNPFCj3C/WHnyqGVOY9cStdtS3XMX+mRkpjC/rDFlhm4qEI4u/zqAVIcdKHXQ4BghwSUO3pPopc1vfwBx+4HXVNuGnq3/JaVceMipX/A8SIVARBc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FgmbSi1E9mgA84MvIplTOtoNVbDuvJ5GinYkbFXzkz2Ag03CQ9gDWnIm5OjS?=
 =?us-ascii?Q?n3PacKQEXQVT3p+6tsSP3VuhOXb+HcB0OOZxWSOME5bd4CDiLgjLu2GxrfjD?=
 =?us-ascii?Q?/GjNTFEHEl8d3sxx3rnacEF5aOjneVG/V0Hbw7IVikXmatIuLAlJHEM5qX86?=
 =?us-ascii?Q?uDI7fr6Qp6HFYLTk8CqBlSwcoAEqWPEX9uZTUz5xHcwzvI/EqZ9ivk7JFc9B?=
 =?us-ascii?Q?lgdk9QNncWgxI0jd1+aZRXELxOGsYhKKBDXmUwX0XvXEg+64XOdU8taBdme3?=
 =?us-ascii?Q?rHOhd6g00H0KOv9sk1u1CKrkEkjG/nJigpqbL/Wo/JFwoqpmk2EygGajpYoz?=
 =?us-ascii?Q?6lUby5/qeUimSttLcNEioumS8pthg0v0SjiWSXJ9Sm1deqpY5xbsl2RULj3J?=
 =?us-ascii?Q?ftuIMRxDUtrUp8T/Ihe7UwyGpEHvkMLsVTlGBX/IVGSqe35PjM472I0OZBBL?=
 =?us-ascii?Q?e1m+FAApKEl9FTl9K1i9hLNKJna54fOWCTDRqgGJGqwshp5e5jUFxriE2loj?=
 =?us-ascii?Q?pQwNFMfOhg8Mur4NI0y9SqjHelG9z2D5Wpf0YkYDDGLygXWHJjWGYbUIv0Fd?=
 =?us-ascii?Q?tfO94GS0lRxtRfw+QHzTO4BpMq8soOhVh9KgqLJU0oaHqiEOAxzSZLGhuoGr?=
 =?us-ascii?Q?5w9sJq0+VdiKXSv6Op2oabR8eXzVrWCh0GXVhoCsRrkW4Yq8T8RzCFkrKdvB?=
 =?us-ascii?Q?9+SqrpfYbEeIqWyI0Iz6sdCcPw2BB5XJTpaUSMwt/+7cMkEc06fSAblyZrAt?=
 =?us-ascii?Q?cXliwT8ilffx9SBbtkB+VfxZjoaKGBa9cWVzLwJma5q0HOmO94Q47xtqXBuS?=
 =?us-ascii?Q?VqoIpVuDJiOMT1r2sA06XaVeEtWz7501+1iihZ2ETadriB1c34BMjQZUda8o?=
 =?us-ascii?Q?AMuFNUAjDG1qWQGY2v55u3xEhZFeVVjhInXD1Q5WV5KJxY24PsE2nxYlfOAA?=
 =?us-ascii?Q?TpNOYutKFEFeYk3PCHyPCzSJodlHmdbDhRyedUi/2PZACK+uDhOqMzEqB3OX?=
 =?us-ascii?Q?MfhOFJpUeZTfwBrB4XNQ6nqP6EL4sEAHbWvIe4uO7xxYnOJ9qRWmx4UklI1k?=
 =?us-ascii?Q?qPExBgt8rO1RtEBy4aDNVpHyu9hrXtqkjfpWYcUSjz2zzYT/T//GCS5jE4Q7?=
 =?us-ascii?Q?bRyothfvuKC/6uCXe48DzajzSmZDe8AX+y+HOOSt8iBauRYNCn8TegqBAjrG?=
 =?us-ascii?Q?sKcdeo3YFvhZ2VpFTyAn5rSC0+uDhSUscbpO6+Hx2/cc2dMu5ADqvqgcnqcW?=
 =?us-ascii?Q?9fZ+i0WRVZXVTXAr2IXfis4yHK6YkVJcpcpUT7KYctMZiqy5iPWPqmk0v8Tv?=
 =?us-ascii?Q?TxXp1zp9jAXiD1TtLhN7f6uEMeqWKVvQiGsiheCtEMSRvpYV8mcLlkz9t1XW?=
 =?us-ascii?Q?pYX7J0NV2q/5wXR9QT36R9WiTbDTxp+ncf/p74lF2t6CnRdD39umTYBbcXmG?=
 =?us-ascii?Q?4ITekU/ROedzpp6fLr3L76yySloDAkDK5YRyF78GoEXlueZvaC2Cz8l96UE/?=
 =?us-ascii?Q?waEppFRSFGEkstqNHRgvAkowPdFz6HB3XyiMFkgDnvhtu/M5Do/AZ+gbsvMK?=
 =?us-ascii?Q?Nb0PUGTtQnvppt5RMw5uAp+sDegtjGmhuBLmBIiD+q8rREwXo5lr1emXp61p?=
 =?us-ascii?Q?n0OxFx0QafjCkuDzHG22p+/3RCd4pn3uzhJjcoVxSGZX6n7eV5JEW3F25+WE?=
 =?us-ascii?Q?KpzasNrJ+B0Um/7u6q/iDleq1I8o0aiOdwQHdHzUbcSBB44kF+jfum823GWw?=
 =?us-ascii?Q?bPL0AjdtjFLyaloFcl4hfQNcK9KxhwI=3D?=
X-Exchange-RoutingPolicyChecked: 
	L1VoD3yd9aTu6Y74cQrRWWL+zstqYh70E7ou9rh2S/lQXO+eiSvD3bhEqUfubZJhRvyOjL6XjzgG4r4qCODmLvibLEf3YCQhbj8HWH1OqmVYkjU1nB2JI8HYTYDiW8EkgosI97cFxCjwlTOQ8WkQXhediaa+eTtzL6fIoOZUTabHm+0z/QvwYEZfjIHcs3h9SDibMzfbJKzwTQ6fXTyBBwcyYEfDl55Zi85wf0G1E1vxYLlF04EUG7gqD0YSXnfNzufzG2Wx8NAyLHu+Q32CI5hogxpPh9iZvdl3YYw+s3TVYeJC1TSpUjFemOnFlLjy3Ky9cg4fsQFpXiHEt7yG2g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c186ea0f-bca1-4a56-9830-08dee403858b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 13:01:31.0972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u5gNsq8i3aMFgjeCM4HS4g/rzOX4XEDm06C/4FDUxjJnrJm51epJQHn9aZXFrYLLGBWooXuBPUD5SWqlx+cwB+h3UhZ1vyFRJWb9Ae5x7yY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7852
X-Proofpoint-ORIG-GUID: gcrpL1JuaGuqQiFm_n0kYxOI-o5tyyhf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEzMiBTYWx0ZWRfXxn7Wkytv72Kb
 I1g60ye10g8/dqfnVw9pdTByVvZC9kpEiM2wgh6ZCCFarrLVmvIr5Zwet3lDieq7kXsR3VC/Xlh
 ovc3zRI9lYq454ZcgIcn8syxrmDJVvLjM13Cqd+3BFu7hcWr+IneIU5U0J+sfBM5oPsObBm5MTc
 COMQpZMmuXEqOJDH++qG/ySFAY9TFs8rPEWsCN1rFodMLtSNcas92v5bapt+jmf63lNWFqsVjbx
 yTW1U0haM+5ciMrhG1nfizC69czmvAzpSncOLUlcEXnaydxMx6bfv7HeC5tYfXMTT7CmBJEw0b7
 l9FLJ77gYEcL1NX8HlpyRgreFy1qG1WHU8ntsgec9DEXPjFZMwFOwODtz8zj2G8/JpA+Du1Q+Pc
 upZG9JvR1kiy2F90Ei4ecs4ZVO6yaXR9+H2gSm1rq+UcWr5THMVsQMugUewq2ZmYzHXC+YzTHmd
 lkHacJgTuJg+ub1q7NQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEzMiBTYWx0ZWRfX5JviEy7vNHNA
 lkjTFyYFrs40JCY059rtI1F8gIJDyie0xwJY5GoYernMl+LWLajn+PkVN+h2rhvo8SYZ2ubu9ti
 NkYrYxU3BYqozLQQ7FnST6xu/bLEEkJ7exZvhl6fh4vuTwA+e+5E
X-Authority-Analysis: v=2.4 cv=b+aCJNGx c=1 sm=1 tr=0 ts=6a5a27ac cx=c_pps
 a=oox2QBUX2gBgMMQWkhdftA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=6-4GnG1W4OhU-k2Y17AA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: gcrpL1JuaGuqQiFm_n0kYxOI-o5tyyhf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 13:01:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241179

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add a new "kernel" value for SDK_TOOLCHAIN_LANGS that pulls
kernel-devsrc into TOOLCHAIN_TARGET_TASK. This allows kernel
development headers/sources to be included in the SDK.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/populate_sdk_base.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index b427ff2761..1d9faecc16 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -80,6 +80,7 @@ TOOLCHAIN_TARGET_TASK ?= " \
     ${@multilib_pkg_extend(d, 'packagegroup-core-standalone-sdk-target')} \
     ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'go', multilib_pkg_extend(d, 'packagegroup-go-sdk-target'), '', d)} \
     ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'rust', multilib_pkg_extend(d, 'libstd-rs'), '', d)} \
+    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'kernel', 'kernel-devsrc', '', d)} \
     target-sdk-provides-dummy \
 "
 TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
-- 
2.51.0



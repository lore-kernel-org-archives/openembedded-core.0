Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEEBACD4F55
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 11:03:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6068.1779102233180926525
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 04:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oT89LlGK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9598960b98=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IAvnx81174249
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 04:03:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=E2O4GGCjDnIpaz5XI/P9pj3lPkw1VXJ/wNwmOEfXtDo=; b=
	oT89LlGKxUCp86VLA397eYH7UMlvOoHgxSQ0gZi2MuTmy1wO38ib1T5i0/stgmo8
	vHIIuCtCtcNIuc27VsUtBXThpf8jdj6++Jo5eCkzvggaeDnx5dJq7OqwH62zVK08
	wIzxTxL7TD3U6M3VF85FhZEbwWS+Q4NUmolltZPREewjay/f+0PSFQi+ZSgnkwUc
	ntJv16mUGs4YIpD7VBg6a4w+nteiHkXxfigpXHJJBAQocbDdbSdXtzUrx2qKuIwS
	5FCoArDjam+LWxHTw/k5xoRiD+EXJghDPTj7NKaQ3ozdVRa6MTQxMPgnHmFVMmzO
	W4SW0Kl1Ge3Kjlu0QgINvA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011046.outbound.protection.outlook.com [52.101.57.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6kux1tp9-6
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 04:03:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z19h+It5CJ2G8X9X2RU2hYPFG3g5HumYlg1TF1FsRcDmy9o1dKg0od1jhpj5it6D1ufzQ0Memt8zNWzqa7bHwKUqUHGdasNniOTWzqY16/daN4i3X/2scVqhiS7/0dTyJt4IwwnAcUgTT4blj/EOcNuBPx3iAzPiy3utx/sfFMl0iO+fN4nk+DEgAHGhc6Vjjb5xfv5lb7u5FSnG4mTUzFWdhOTLjxHIFI1wNuJXxyhj1th0+S+Yi2Uv+YU9wfOpDR7w2aEqRtu87Ee+IcsfD9sfdMil2VG8eCbp08ozvJB0C98yq2DoBREiebrNKmSWbPwgXLvKwuVyJeZX26rfnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2O4GGCjDnIpaz5XI/P9pj3lPkw1VXJ/wNwmOEfXtDo=;
 b=IzjEVIYk8WInO+q8BwVRO3KQBNOASKpT2RDwU4KIVUebJocuxDOYDNsAVMvoXQIoRDTNbblQFy9TEnroC70PpCpKB62BWTqyMDmr1COWJUNCAEcVAeRRX/bU0WlvfIDw/j5BNGfqowg/lzToMuZXokH6kBffHgv4Mp/5qcFfqQ0BvDjR+Mrnx7sttn0kTbe7+fZM9eiukGwcr4798ji12oGUVhhwOfdSqCXPUWQ5BodkMGqYsLJl1jFFO/lA0uyk6zKMHbC3Mv6MzKS9zfdkrPeDSq4zuiAvEfGVwFLoLSi6KHPunCWf8X636Lvd2Kq7LMkwC3JlIHchx2WrCDfKdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 MN2PR11MB4693.namprd11.prod.outlook.com (2603:10b6:208:261::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Mon, 18 May
 2026 11:03:50 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9913.009; Mon, 18 May 2026
 11:03:50 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: khem.raj@gmail.com, Sundeep.Kokkonda@windriver.com,
        Randy.MacLeod@windriver.com
Subject: [PATCH v2 10/12] elfutils: add libatomic-dev to ptest RDEPENDS
Date: Mon, 18 May 2026 04:03:25 -0700
Message-ID: <20260518110327.2347543-11-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260518110327.2347543-1-Hemanth.KumarMD@windriver.com>
References: <20260518110327.2347543-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:74::35) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|MN2PR11MB4693:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ff59e00-5365-4d89-2727-08deb4cd242a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|11063799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	mUXk9wL6hhDISi+HYtYiKIW9CxcXjwk8cwb/JzIZfVjb5cbe1+utp+9hf/g9BGQZSUveDruV+99ahyDLlm6q40SDESfmO9rcVdvthnrQ2uk0kT8ySCOc5912UtYvMYZ+p9DUiFw71m+C+BR5q+pC6DMHwvLmTKypGBBpk0RRr0BMntK5bvqdQIADX0Z2MZVX9oXve4P9QH6gB/iB1Q131j9CVbSkrAhp0wtC01DaK9dsJv19pg5x7HHWdw9moFv/9tZMS3zsjh2KM7GlviUI7+Wiimeh2dcnrO2ppfmGW/l51mFqqYjYe79fRR/iY1Cp/T5rUAjSebXhRJ3Myc/oZskiZogJYiz5ay8LiRCAq6soBXKuRV2Ogi0z9vYnXnP0FXMEI8DyJya+oyrN7eeIhGIWPzFQxzL46AFsMZC4+6oE0MaimyRTvt/S+1FP6fyVE7KlWL6YnUWxwYA058d/8fpoulB5gOftoqhhPh9MRjYeD6TR3SHm48bp6L3xHIlJvFsltlMxCyakzHR3Ehtnxdn9EO888ZA4dzc92QXshB1+WTbRhlYTg+o3NEL1aPzv7VCkWjjx/45LzzDkw0QsQGK+GToVmXhIfpLjpBlNEs48s4hGRHoDc3//vbrz6rS1WTkReWoYYmFFQle76KPrfo/URRWf51M2QJr6bEZ3NpuOMO9hlJy9/af4H/CLWH/qqFMr0YdOYXUXHzX1HF8YX13ujZEo4r6fppIiTB37Edry07AA9wTFqcDbtb5JJEHu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(11063799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jZoQ34Subrvqb3A2t+RQ9+ub/xN5yBmbx39lG7X1Hov3N/iwCygsYVh6nq9g?=
 =?us-ascii?Q?7LelmawwkmdknN7HjM9fUd+6NoL2RpWdLZiDTq23SluG+VamoJBC+bsmgtL0?=
 =?us-ascii?Q?LhHZoeN4T/4l/F96zPYxjjh6BlqG3gQ/CRr1HSnNte9qVFgtY6+6rbTPRB1E?=
 =?us-ascii?Q?ynANc5NFmTwHk0N1qRKONUmPWtJyVnVYa3gxfkBtR+4Zxwty0aSAmvEjU6fb?=
 =?us-ascii?Q?sSDgpDsrXPT+XJOc6TZ1nqK4OGWvgL4Ul8NgrlsU9hhrl9X+eCetmsKdCvUF?=
 =?us-ascii?Q?0YkDDgHQByvyNLBD7XmOEwH6UMv9AQ8nyh9xpxHznwCnFXMchSjROwP7Q7CR?=
 =?us-ascii?Q?n31u6sVHVDKS49MeJgwE9iM1I4BxK0f0LQsMjTt0T5O8uDoW2xsgVwkjews5?=
 =?us-ascii?Q?PF7pQw2ydYWriWyVtWq/woJjcuyVnnx694iLPRiMnVxg5JY7QUAzSkDI9m//?=
 =?us-ascii?Q?wB3gcUG2lZz5Q1qYmc5VxoxuV6r4NDDXmEWwDcElbRT0tWoZ41riokU+IWQI?=
 =?us-ascii?Q?lk05FlyNHtVQjUbkK1gtouFd/oVTbHE+jD0fYLpRNy/xWss9MQySCMVc/wRk?=
 =?us-ascii?Q?A5sGVkQcg2YALWrY6UHiJM9cSEkrILBFJDwUBCnh1vt83m2l+yUh3HD5Rdtr?=
 =?us-ascii?Q?Q53wkfncKIFv/pDsbDv9D6VlhF+VjjpnD3zVVmPELPqNJE6IhRwQak+MipKV?=
 =?us-ascii?Q?jfbPC155GoD3QAPeY4QICY6ESQcFQ66VDXbcGPwINKAmvGx8e+xMvlgQFmBd?=
 =?us-ascii?Q?6evl066o4Ya+xqDG9iiHQ/+UQGf4YjBchUUEn0XUN0zIPA9f7xkSN7Lq23be?=
 =?us-ascii?Q?mJSflKhziH0eHzLwiGHGJW68TGtxr5LnBf/+DSQzefU2vGEo93rSTkRgn98k?=
 =?us-ascii?Q?lzSY9doote368YyUBmfo+KJiZUVMf/b3IjK5CAF1F07mJZ8AiKpVdbibWtG+?=
 =?us-ascii?Q?s6N3/y9+M853DFJSVnre/cILzf7fpBlF9oc5fgYufA+aOnDH3MwABp/TYvS5?=
 =?us-ascii?Q?sap1urSGfXVGWIR9LsnX8NUkJ7PhaejnIdW4vTxWpZQrhyyHY4eeDr6anQRD?=
 =?us-ascii?Q?cTxvJrmOgApV/yd6fr6Tv9stfiZdTviNRuIjITdT6mT8SGwRPpJ7mNHUUH3l?=
 =?us-ascii?Q?/02XN4w4EQBrSPv5kFkg8srdlSq0HuC9Jn37CMhvV+jRRY6aVa7dcaU6lhPz?=
 =?us-ascii?Q?tfWr3gaM26d0HH17lOpk1nw9YsCk9ocIyHeDGdBTsGiGinvkbr1ERBV16QAZ?=
 =?us-ascii?Q?L0NnCsbI7MUfLCVsoyzCaoHlgQQNN7Ov0/rSMoKGW34vqJfi4bXB0J9uZsHy?=
 =?us-ascii?Q?vg8FUHlMHPNYGOgfvS6K80Ei87jc0yKLil4Nv+CxFn6twYaoMqxCJT/OkyhB?=
 =?us-ascii?Q?P7PmtN0fXFJLiyFmmMtzFRkQUzRtoBA6FLXY+QC1eSF+M0bHfanWy873BD/d?=
 =?us-ascii?Q?5JZSpZ6+EDuHDjV986fqEiI6TxEvnMGm8XmMfwz2CmKHwOCaugGGK/KMCkHV?=
 =?us-ascii?Q?wVTZKIkG4IcuBbCcFUS/gutnWfuWWmdAjxy+S40LcmA9eJEAHrHhEleH7x1q?=
 =?us-ascii?Q?q1BzPsdkLcRXxqyHARAgYOhwaYDdgFDNfqLzJ14am25Lbww2BKAQjuy4cJel?=
 =?us-ascii?Q?49OxbmYT2zevrUrO025gWgUXhNqPgntOHbNdIdaoi0QlRRBTuLIi2Vt9COn4?=
 =?us-ascii?Q?56DEQwEFO2ZrJyZIebt7N7NKof/xQHj56o/loxwbOMIEOBuTea2X2SU7htb5?=
 =?us-ascii?Q?OPM86naCpHrBZLSxpj3w8My9kJBpIQA=3D?=
X-Exchange-RoutingPolicyChecked: 
	r2tMi8Ul6PXGsLsgA2bX71DeaztUBwBbLzr2He1v8a+GcfReaWbG5iwHjIRu1+iM3lLLvjq6qw7mKjivM1+fzSAnAT7MziTRzNmPhIQDOr3XhT+7+j+nOmWJPwv8gVy2Rv6Q/qqcN3KaNHYgTPShEUiWGNGusE0HEovC+NLZGrAshl1yOj2iObFXFRIQBEd3zESxE5t7IdHOlB//C+SGvVojLvHpobcsRVgOhEGIuHmNAXWTPNRnTRR4oq3gnN6HMU4Ny7aBiFYV5BDtx4eVZi3mvlVA+67ORC+TT5T30Uguvt1Wn0Cp8kKWX7xLLSXfN62pyNwjCK/siDMKUMKiVA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ff59e00-5365-4d89-2727-08deb4cd242a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:03:50.2808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rLL9b7CEP37E4a4Q4rW9oK0tESV4+1MFqqJ9eeD8ADxLeAjMDW0+yC18QWKwiNytfXwF1hpHUIyfZUpXOgXjni7bR5dlUoS5jnXJhrFv3os=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4693
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: Tm66jqBCApTF5KXAACFCiwTTPRFlsX6D
X-Proofpoint-ORIG-GUID: ocnZOvDMMLgGULkbdgMSYqbBYBpCY3iX
X-Authority-Analysis: v=2.4 cv=NMblPU6g c=1 sm=1 tr=0 ts=6a0af218 cx=c_pps
 a=foOfPl9YvWvIvXDtd8Rkbw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=ntWXFrmDeule_d6em_sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwNiBTYWx0ZWRfXwk15tRFkukJs
 W7vBrFiVuPeZkqSGTdzf7sE8eQOovy4VWK9xzonOYwu0VJhlKnOxYmoghJlnyzbVxkfy7p3WlZB
 X68hZbpjfm0EbM4JOtgelu+IBNAoAVM5CES3FwVNrGGAzmOvoSeKN7Gwx64FZnB2M5WozpMQIb0
 Z9yGfBA6SFIaPQp9NRNHBIna0K6a3sUwmIdPxdWvenH7SrS76FAAB5TItQtO+O/VK7rZslCvIUN
 oh2h9uu3pLh2+A2GDAQ/Su1WLVSGHmbSKL+Q82Ghoo2f4a6NXcviFEj6zAkkGyH8G711nj8hkHR
 W4u5IIcpbWZLkzP2CSc4vjP4Hrypkr8d7ZqifAvmluvaDNQVeURU6qQar8NKfFw0SDg7I0Tvo9P
 UWKxfLkQ3MKwW4bIuOMD1fVyGrkRemUVwT8+SWjSp9h69BfQ+QTSysG/Y4BHOSzruNr4N/QX72Q
 nXn9k5fCLCbiV97cPlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 11:03:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237230

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

GCC 16 adds libatomic_asneeded.so which is referenced by the GCC spec
at link time. Add libatomic-dev to ptest RDEPENDS so it is available
on the target when ptests compile code, following the same pattern as
libgcc-dev.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.194.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.194.bb b/meta/recipes-devtools/elfutils/elfutils_0.194.bb
index f5dc986e1d..2173a94401 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.194.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.194.bb
@@ -46,7 +46,7 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
 PACKAGECONFIG[libdebuginfod] = "--enable-libdebuginfod,--disable-libdebuginfod,curl json-c"
 PACKAGECONFIG[debuginfod] = "--enable-debuginfod,--disable-debuginfod,libarchive sqlite3 libmicrohttpd"
 
-RDEPENDS:${PN}-ptest += "libasm libelf bash make coreutils ${PN}-binutils iproute2-ss bsdtar gcc-symlinks binutils-symlinks libgcc-dev"
+RDEPENDS:${PN}-ptest += "libasm libelf bash make coreutils ${PN}-binutils iproute2-ss bsdtar gcc-symlinks binutils-symlinks libgcc-dev libatomic-dev"
 
 EXTRA_OECONF:append:class-target = " --disable-tests-rpath"
 
-- 
2.49.0



Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0819CD343F
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 02:23:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4980.1778207012565457275
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 19:23:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ej4pATHV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=958850bb7c=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6480uFil1665564
	for <openembedded-core@lists.openembedded.org>; Thu, 7 May 2026 19:23:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=oSLhbeBC1nB+4kq3+2f2
	qNEi1Bz9Yg+OyjNtVZy1v3E=; b=Ej4pATHVREciTKYAzWsCyUZNx7al2jXDVha/
	gBNNui2SP7jqu2fLWgyuLAK0xxUEQOvN5pyyf9Fzbp8Eu1qRJ/qL6yVkK8FheRoy
	v/xm0+nFgvCWGsD3ZXkZLo8CxIja5r5hAOcaodkdH5ZQUQjGGdIw8FOhX9I2wqVS
	MndcSEdtQf03r9DvwVkL7C8minYhlZgaVteS71QL8nta5sgAkT+zk5i5iU3ZH7p7
	2xRUNXp8aEOZ0FRh7FFDRsR8D5TGv/8IY2/RsKsRLJzQiPHkoZ7GkTEOrT/p096/
	45cM/1PKeM5gccmiOgu1iqtCrh1rxcUTisC2WgF3nT7j4/jAwg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012057.outbound.protection.outlook.com [52.101.48.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwgsdf82h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 19:23:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGaMc1lPHRr5u2NfgHoudM0wg5puVo9zFJcWwj3kXM5r+HMwhIFhBcpliXSTTohdCS/d3fLm6PrIPH/c8HYYI0TNghlSREu8VvFD8dIYwpmHnMLEhppAjGgPBeQvxl4GrUOd8PsM205C389Q/oGUSWSqMeLiYjJLB89ToTzNubR67AcHSR2+nhqQjcEptljfYPRbpIGH+ahzbSkOVG0ZfDl7KbN6lQE9oX48ip8/RFEpsL4ebN3nnCpQq4MpJikRthD7j9/TFf1V3nvA0BgSFE/FtCvonlDxAxS6kWv013e3gw71p1jEaQmq8UJkJlNwuCnBRBn8qdkrOGj/RtfriA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSLhbeBC1nB+4kq3+2f2qNEi1Bz9Yg+OyjNtVZy1v3E=;
 b=EUewQRp3O5KrXqVPTWU8thvjQpqY6NR0/27QKP9mQ9zosaFZBWZ+43E36AkT3m+mHVx8N5Esl9zReZwO05X4vo7FyjJ7AeKkVPQKAjuBZcFLg/PsNBZoQMwOG9i0hVlN69N6BfFmh2VGQtLqxpIQ9gJasSMndreqGKlwLBsq52iV87hGMxrT0ZoYLM6VcKqD7NFMnGvRdCyt65lUkTHRbIjmUB8x+d8D1YMJjM0Nd9OYknYmtLJIcdFsmgU80yH7qLrElgjgMdl+z6UfMz3K59KtxapDnmDsWyboQS/8UN8VCPP7ysle+ZCgBuKITtZjeECL/Np1plrIJZHRIIS+Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH0PR11MB5206.namprd11.prod.outlook.com (2603:10b6:510:3f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Fri, 8 May
 2026 02:23:29 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 02:23:29 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [V2][PATCH] gstreamer1.0-plugins-bad: disble vulkan when x11/wayland not enabled
Date: Fri,  8 May 2026 10:23:11 +0800
Message-Id: <20260508022311.3112415-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:195::15) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH0PR11MB5206:EE_
X-MS-Office365-Filtering-Correlation-Id: c6eb05ad-9034-48cf-1fbe-08deaca8caa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	F/WjsawIfKw7eTtxyIe3fhYwzRd9iH/NrbMJax+2DIDsB5fn+bh0JVgBT1xdAnlFMc3rabLIEFSQFnYaf7PlotSyQsrV+Ez1Xp1JwipW3z71S0B0ea/McvKqjbb4g/xU9hifJ7YtMbDx1TtUYE+ZUGI5//XEfRyfKm4C7YbvvSXxHS5kgjQ1p1++u52g986X9izSUBuCgPQZ/PTsx5ADQrU9OFvReWwRUNYwjJSOxpz8R3mb0h2v7XqTpZCc2hmF0tOfgAxn1rXjzvI9PWUy354j6rLF3nkunF+4n5f3KwnMOaYDzsxSz0DFoSkVDyF+3afS5CQegUwFd4UILkgZp68jP8tzzi+ASTSjijVdrHv3mp+aXqdv7B3TRT5Crb9fqlxMvbhgY+IF9joSvKVX+fSXsColGN1HVo6KxpcPb2KyHuZCSBCu4kIO0MRSqe+u+aXY6ycRlCj38vWWEeuV2gfwtobaxpB5I4WAPKiDAKxOEtTVTDPXMkspLaPjyPsucELgqp00wO+z4u0/eUb2i1k5nrHP+1hU3SG8fnosbTMVMeJHXwV1pJzbMcXTMRmIG5252at1K/e3+Vo/Uiider9lIA7YlqLDAoOxZCiKfPkg4aV804ficcXPO/KaaVZ1JpP1TcPfx3mErqbwB8Xx4p9UcDDe8MEMPD8XOxdazmWaddwndaRhvP7S69iK1njgQy2s/27Q8NemLb+ekU/V4ANZNs9EDz4TgDbIBiJJMwuzSN8d0Gp7eLxWXyNV/gpC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?33+hbQdkKYLRwzbPm8YMNF0ca+P7yc4hAk9JjcQNKBIMOLcu15jvEgJ7EpZo?=
 =?us-ascii?Q?J9on0kRHje8PPlkGkjqYMS277g4OPDaZ/SblFT02top/+Syj8tm7Lj+YgE/3?=
 =?us-ascii?Q?6vTpJXhNZS5haQ7wuZTAo2iiWVtj+xQb7pS57v886QoF6HQ3HyZ5vA3TofbS?=
 =?us-ascii?Q?DKrEeFt7dF/nGmnQHd1UoY66MHRn1nt5YxGtnt4UAOH6raPs1DSpnJpyTVEm?=
 =?us-ascii?Q?uNDrMcPpls3a7CuJDEmsx4Iga+7HkOboI4NSpYX6uSgqDLvz92VTST5mzzCZ?=
 =?us-ascii?Q?QP7ZkZQ9Yd3vv20EtVbWrdcR8I806Lkhn8hP1C+x6AFhGCLtwGCrr+ADkf+G?=
 =?us-ascii?Q?/o9yrVXBae4mzFFXM4tlLBKUHFOy3Hz16WEeSC7kN+rEG9mGY9VPv84NNBed?=
 =?us-ascii?Q?fLc+b3Fj/xJ9MlPvB3lb3RWqqs6Q7mo3A4t42lYut4IBz0ST9Zi8bLAJmrMu?=
 =?us-ascii?Q?ZtkHI/vFmTR2YfPJwsg89AFiY2/OSi0B8PFI3jrDl2FR2MxVON/AjfLgkYAO?=
 =?us-ascii?Q?Qx8wBVsq7bcYYW3CSjfGjxjsrN9QldXRvPQ1tSgHWnq5332JaWTr8MK5ddih?=
 =?us-ascii?Q?q783b/0bUs6aBEzzNBWjNw2MXeaQGr64kH+FDntSDYCWu/nJJqlLQt8mqmAw?=
 =?us-ascii?Q?NaqhkrlGDFNZLGhsW0DOU/LJzbAauxNalor5ShBQ5M7cXA8rwHXK1ppkfPbl?=
 =?us-ascii?Q?QqLn5itabsIVDfxWrba5xXvxHyersxN+HDj8CTdBPSWXWsEtkga/NVaNAMn0?=
 =?us-ascii?Q?yLmoatLXWddGcDNKDy+jOoemcoZok7gbUaj39fff+USpKYGyLfsFP8wKwW7Y?=
 =?us-ascii?Q?JoNJ6mYhL2/LT0Ev54RyiYPnP1a06DKxXkvCrSOcatP7pAucP+1QFoqmZs5x?=
 =?us-ascii?Q?lkGKfXtyIBcplf2M4nK46KGrlgSDNep4kRqz+Fwi8sA7PBOPrqpuaIc8c0HY?=
 =?us-ascii?Q?I3VPe3SPMoQmE6+AbN5RDhr63NDjHvj1Y+ItWCg4a2GOjRMVKVBMwqy9y7CE?=
 =?us-ascii?Q?Q1tUyjWFHrl3GpQfMhiYdRc0V4XIafZyszXpb9PucSH9g+y/7YT55nVGjolv?=
 =?us-ascii?Q?SbHQK9wNcVniZhPpLCYLH2WbNYL9racI/D/2vxIMjDK1QgwT5h8y7JyWHyxk?=
 =?us-ascii?Q?H5m8xGLSm/emh+/ugubveqOC+JcJxLyh8GAHVaIsUXlib6NNxIhWLkAF/PZR?=
 =?us-ascii?Q?gOxEK5vBMXRDuUN3kUmHpeZuZqENGUMu1OP7LLI9P+qVSto+FI78TLmDAWI3?=
 =?us-ascii?Q?rZMdSLmsws6O9f5Y/Cjr6QQkRVuL5UCFuiAbV2PjLczXKdrgJUa/UmSiSzuF?=
 =?us-ascii?Q?wzbXch5RFBkjYToV7ygOr0hDdbSV+5nisDwP4jgBZc6L8vxi3nghpWYsfAJo?=
 =?us-ascii?Q?w+/4tBK0HyM2rNhkyk+WuT5fB6DjWhn/Y8WvnwT/XVboquXmAWBnkXBer8DB?=
 =?us-ascii?Q?wHKwrznpn8JO1WcthiVDekbfOB/lYDg2JF3Jv65jbM3wHa5KJWeZ0QvfgvvC?=
 =?us-ascii?Q?m0EdlQ8JPDTTHnZXsxMtL118+NhT8zyltEIcW+JbresntUV9tbMXht1L5K+2?=
 =?us-ascii?Q?Uvbea4m/3O0FyAfgE0k1VOpZfvwwNq+zcndv7nAJi96tlNkPN7YQhdEEgU09?=
 =?us-ascii?Q?5CvSL/Ak8KFJ58wgn4mTQRgsNlExJqQ3x77vf4MshWoT1Q0Tr04pzum+U5XM?=
 =?us-ascii?Q?dzbBublG49uLA3tel7TOh6BSndeOE7igenTGb7MGk1goV9GUk3ACaypy+n0h?=
 =?us-ascii?Q?m876ePHAwPpPd+TLNWhEGojFGZ/cObk=3D?=
X-Exchange-RoutingPolicyChecked: 
	wnQUoG7CBIvHsbLRO/Un2f7GUL+Wlu3v8LPVzKSNf7QZALvwGNvYG+elgWjWkHSZLw+z54vCINEbSyhXxOpRh2tBg3Gp5wHdBlPIc7xfKhaJOhiRSx+7Fkv+4S++ZgV5VDapJAbIv5gF+Lr9eqVbXB73BgUjqkAvvN1qBqy1/X4/qCLbLL8meEM44Yg5v8Sx52XivyFyRgrtlCMMmhGmYD1g8AWYNAp6FjUFzcjEQz6h19cnaZ8GlM04tSWVrSFqw3Vtqfok/YccR4GcZ9qAI8OSAqKafdT7x0BkGidWHmcDGdg+j8GsQB7mvl4B20n2mDlNppx7SWjmCxGFNPdyhQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6eb05ad-9034-48cf-1fbe-08deaca8caa9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 02:23:29.0851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RdK5EdT1NDzgkRt79NCWf/m0zcw6Hzu9QXCc21GLqDO1M4TsCg9fMjuCOi1DGKO1wgGenHTmsn02BiGpEN2iVOOZx+DPgTYoMcpWc+36iBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5206
X-Proofpoint-GUID: WXZYGhqUlMiY7w9kUjac7TO_eOgXFd3Q
X-Authority-Analysis: v=2.4 cv=JeGMa0KV c=1 sm=1 tr=0 ts=69fd4923 cx=c_pps
 a=7NJmVDyNEcEWmOhjwSrRAw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=8mI5Hb44qIRmAaL06cMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: WXZYGhqUlMiY7w9kUjac7TO_eOgXFd3Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDAyMCBTYWx0ZWRfX2JKXiHVqDgST
 H4FT48mwsrUc8pqFOWkhCfGEikzPsYTS+syDhdNa5N+Xbh5cw0AucM4dmcb+1b8Mjwqp/NquVkO
 TkO/+wpi65C8Fn6lXtt8B78fDD0n5xXzEUQ5bVUjHXLuW+KqnhU8XVGQhIjVDZQrR377zISWVFd
 W6KrvUkEF0Y7gUpl4w59LFSk/SJgKUm8q0X8Svvhjf/kSBb/y83/EqtcwkY2vfQB7/Drrd3cleD
 NG/TLIt71Lkp9ZgbRI/fCTsKPZHz/vtCOSzmtDrXowFhgdQSlljoKSICu6sVZQd3Dg3zjNTBEqM
 KcPNiPbrAEMJ/JqWaVRD1/Jhc/LYzxkz8CsPNX6l80KVcMEzgBBVNPNutdHeEf82XazkPKrgr3I
 U3p1S9C+Bf89dX9dh4eVzRvbqp5D5UHCCrZ8Ww6bOrNJ7tZOUBwhhBuy89Of2UGumy+oOBydsgA
 FAMWQOq81VC45NRUy7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 02:23:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236630

When vulkan is enabled in DISTRO_FEATURES without x11 or wayland,
do_configure will failed with error:
gst-libs/gst/vulkan/meson.build:311:4: ERROR: Problem encountered: No Windowing system found. vulkansink will not work

disable vulkan from PACKAGECONFIG when x11 and wayland is not enabled

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb             | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
index cdf3a20dff..c7f081e25b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
@@ -21,10 +21,13 @@ DEPENDS += "gstreamer1.0-plugins-base"
 
 inherit gobject-introspection
 
+PACKAGECONFIG_VULKAN ?= "${@bb.utils.filter('DISTRO_FEATURES', 'vulkan', d)}"
+
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
+    ${@'${PACKAGECONFIG_VULKAN}' if (bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d) != '') else ''} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vulkan x11', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb x11', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} \
     bz2 closedcaption curl dash dtls hls openssl sbc smoothstreaming \
-- 
2.34.1



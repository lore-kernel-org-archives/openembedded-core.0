Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83C4CD343F
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 05:05:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6581.1778303127245787951
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 22:05:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kjWvN4eU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9589ca456d=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6494kK3X3980895
	for <openembedded-core@lists.openembedded.org>; Fri, 8 May 2026 22:05:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=onJy304bKIaRjxL0MTAcPjVwg2D7DyuV2XLcJY5C6mc=; b=kjWvN4eUPynz
	VpvLRry7A+9U1dxth4tXvl/QTjSQmWKIeK0+m8fx4I9blsqOLxutSrJioYvTrpJF
	FPgIKgNZio8N0vGNdmPP+O7FeLbfYeBSBTNfuj2RiwoIeny/8v6BVadnX6YQE1Gs
	37N3jUHs1NPdO/YKa987l4D6Du23drmbT5ope6Gg0u/knmrAp2+RsDBj+9afNWYa
	HPkqrvW7NJgvHX66Y+d3++VZbGbpe5PV4Ft95ZX4EPzSL/VH8WgwZY20CdhJg+LA
	FW4yjDl3OlzbAXn2ncYIaBxudLlug0og/2CavSyOlRtY8N6sJgGp+fwxVl7Di+Mz
	v6J9IcVbow==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010063.outbound.protection.outlook.com [40.93.198.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e1hmn0s65-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 22:05:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3AxQrUGscdPCeDKVQoZ4tt/vHaAVk4Smeo0LIMyIpliojYzm/bVElL+zQgMa8H18u3lgFRGRFqWxYKla6wJdQy0SuaSOAwaOiJ08ZzSZdfWRWBeBU/dsxGvzwjz1zTXSzxUvQkZpuz4+ieo+mnJWsVQzgnCk2S5WZr5QioWPMousHSFwBcx1rcwbCqz91hxER1qEpu3pdwJaYp/2GdU065lP0zcAToQ/U5I9Hymurm9EVoIjPH/MYrMVDfIpySxVd90VqYDwP/tCZukAiDMeuQu/sG1q/v6okK2maMukho/N18++zuI1sRcWlEiIhHzaJeais8h5LEIRbpeYyWmFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onJy304bKIaRjxL0MTAcPjVwg2D7DyuV2XLcJY5C6mc=;
 b=mHA29vPeHPHTS2kMD2n3fU37Ikf4oLz85l9A/nvzN6CdmoPR7VpjLK3vSKutRVGwaifJTxLj/qFREtc2GMb6xXEvDnkVkTkLHmMdbfAUlFKHmfG/QuHFlPxwQvc1D1em9dhn770fgIqcUWEU6NZAGyBoCHFk2277HjA4FnIKpeXjyLmUt2yM09HHqqkxLUX0cGLqgNm4wZiX2cWM5aGNwS/LO87MhO19SXp/P9JTTRTbveP9Sh178U9LWCKjvQteoA//dyVi3Q9NCqopVbIfDukM6ffFxDiOWGjTIHAZd4rDHFjF0dKcOh9x81QP5BxveVGbGamq9uRHVQi5yAm8yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA4PR11MB9202.namprd11.prod.outlook.com (2603:10b6:208:56e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Sat, 9 May
 2026 05:05:24 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9891.019; Sat, 9 May 2026
 05:05:23 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH V3] gstreamer1.0-plugins-bad: disble vulkan when x11/wayland not enabled
Date: Sat,  9 May 2026 13:01:29 +0800
Message-Id: <20260509050129.269720-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <18AD75DB6F7ED930.2939242@lists.openembedded.org>
References: <18AD75DB6F7ED930.2939242@lists.openembedded.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0056.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bd::18) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|IA4PR11MB9202:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bdb62b1-547f-43fb-b042-08dead8893a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	RShXjXRl6YlrbAiffDSoj954I+4wY6gd4DU4scFxRU5up8LgtbCEmyIxOkUoIYtaYex23/FxKDDTeAhJonq2ID5r80SbXRylhuyghp3fwpmCPeyqDpf5+X7NEjTfAb1yoW7N7+su8zRJV685s8+i+SW9L8bdRG62MPA2EHCBo+o1hqZ9GAAKFlJpwq0AyCryqRdrODV8Syz4EzRYrwTEU8na7yVzdihU21e+5PK2PQwGXImgi0GJbBP28AOJq39p4XZOYUX13LTBMX9NggWxuyfigG5kjwq+rGUeegN+zam8lk16379OhWUuOmBPkrCeOShWLfr1QrEVdP34+0PQqh5ozF0LDQ0AAO/4ZF7Mgb/fCtqpa4hyyNTarMshNpOBIpQkeHLALJQnRrsKZsdegEJXoU89EVbGalhpKYGWIbWpnfma94CyJRkYOIcmsKonadPkh5G03giM2B0iLf9n/VlvOS6NZAoHqPMtlWeHNE71Z1XOWABItsRLJ4Nvm/eEvXeOohp0VwOxaweDcCcDFGvR54HOBkV165xwKu8MDwjcobkdaa4o/W9NhqattpfZP1bL4DW8juDcBZoBuqOfDYi9/+jlYGgM02zCL7zpZYq3CMl92yUQulOh4hgeUITW4gUl9ajKXZzxbBxF0rm3CXd2g38OqGY6NwW2EhGLCz0xXXmqksCL/s76HplsyiVfyfYEjHmPpHlPrn/Dy0BTWHVm6YiZnWhoWcg4O+oFv449ao4ySOe/vwyM1gMHcYom
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eCWVqpI881dK9kJdGm3RLS9CyrLuAo5J6/wRCekiokLpv9LVgjrgI9mmueNu?=
 =?us-ascii?Q?3ySSTIQabc7LJ3zmaXH0aMJAuegxbWdvJaFAcxBk6Cb66MbZM3MHT+1kWNEC?=
 =?us-ascii?Q?4pz/p0ssS0W3WbO9vl0obKtD6Nmnpn14V7ttkRbGf50vzbtFI9x2FdBg0B0T?=
 =?us-ascii?Q?cmlrPP/ILTMAV6cmcmXyFXyADUGnNs3cn0D13uFPUpVhnDnjVK+hLK37Q/nT?=
 =?us-ascii?Q?vxE8WcHzf3n/oyf89Ur/IVPC0J/WDLZlf7bS1zoIyYhR7WViJKa9mVToHWx6?=
 =?us-ascii?Q?tRSaCfzsTeGXMN0UotLP/+OBeplq87R64N9OUmU7fQsx9r3KXpogKyAfMREG?=
 =?us-ascii?Q?CqZ6m1zHjNqYQivS0J4kegaiVHHG6Bq+PJAD1T7aHmqI4T43ewHxr7X31BhW?=
 =?us-ascii?Q?38GrcbM8WpZG2IC1PKB71uZw5qBqpo4iAO9bZm8qQ838wJsesm1XrSRv9JlT?=
 =?us-ascii?Q?wpP0E2qiXC8c71KEby50pTC87Iyxoq/ViKA3F0tkEvxEh8Yj77yfMCVtElk/?=
 =?us-ascii?Q?x/aRKIMOvVyILa661puaEfQ08CA2nuQqJYDOw+xOUP3FqnBssp6XZCsWGfMc?=
 =?us-ascii?Q?XITs44DnTKimlGWZ4ND6MY7NTVrw5yTC7Ov35pGM4p3a0IBIeZ2qMgtbd4+h?=
 =?us-ascii?Q?qcgDmShxA4vNIdAOucp9/o2/1GBrYXwtJE4JH2Swxp0K8wG0clGWXfK8YLYm?=
 =?us-ascii?Q?udEOWT3ZDNzp6V65w/DRLbNW4xx8a50wCStnV5CmD6zJXAjV3ftKLlvAc9h6?=
 =?us-ascii?Q?DZqMoJzO83nRqvXWS9tACxuIkNWRaBJQ1IN8jtJKoau/+RL7YPoA99OAay9u?=
 =?us-ascii?Q?3RZXrohwCRZMnAQHGiu/jiGGzzQ1UvZw2tnnN5tla4Xu8QlCAQU8TMIvGaCZ?=
 =?us-ascii?Q?rBeBLJL7nLooSvP2alD2qL40VJ7aVkVF0gI7JlCBtcfT0p/xppEDQdxmbv5K?=
 =?us-ascii?Q?1iJsS6gYKTA8SHzuTGVDDIsjoswJbqAAh0kfJ/JXhliOM8fmMNOCGRTB8s59?=
 =?us-ascii?Q?j+J1v0TNbYD532EH5g48FZeWI4u07UlwDwF432QtIkcxZ2o8h1DGlHjlMkCy?=
 =?us-ascii?Q?4vE5zA7hRBwradFgTsrQLwHtcawciEZORLe82ohtWh2SFw1QiBWvOLDo9WAQ?=
 =?us-ascii?Q?zJnWEfML/MJPoJICO9wrtY3mcebJaUkNMljd8gXfd9tJNaV3m9XmO1PUw8wr?=
 =?us-ascii?Q?ShSnHsFPiimRiJ2cFfIte5qmXD5+MAYZufHE31rLPvVOplX50qpdsDzpE8rq?=
 =?us-ascii?Q?JDUrt3NzPfXF5dIs8mWw/KNq2KqadtpO6W+FA+iTNTgdMCKQecoogsQcfkTf?=
 =?us-ascii?Q?FdK+Vjh8BFwnMamo/WnbGKoN33xjj2tNlYjt298UADf3cXtGfwtBP1ej0WXT?=
 =?us-ascii?Q?tkx5Izx/rS0I+QZL4GXB7WGHqn6NZpiilh/ZAifDlAPTeEzqU66Ek/J6syFT?=
 =?us-ascii?Q?L5WRaje07fH5KWwMrZXfdAq9Zj2WNUFAm6DV3hvdeqz1cmWPpHlbytEnNDh2?=
 =?us-ascii?Q?edtRKslL9HtxnVAfZzWa9MMYZr0+fRTBaKVrt81mjQwkFs+iw/Ne+QqZFzQH?=
 =?us-ascii?Q?B4c0R6+cEA8BdCAgXb93jfxc3bzHGZGjdajwlD2ZPSLgBcs11UocHwSQ8MRX?=
 =?us-ascii?Q?FDTzOub2WsSPkwqSzpD2M3XJmAuYe5bpEyh22Td/NuvbVhr+jZZ+QCak215K?=
 =?us-ascii?Q?ldKUCwULAAhyvjdPe6piD7Cvp5hw1EifAOvaKLpbmdHCu8V4lD6icc5TkCyr?=
 =?us-ascii?Q?+KZq/sk/Fke8s5ooHO2oX2oxgtqE2UU=3D?=
X-Exchange-RoutingPolicyChecked: 
	uBYN0arRTt83nNiHmk4CdDY0cEreh+xXohpbBflq7VjLwD2FGZFylxSXuOu/lvocSBeM6FYVawJNw4mzMmGPi4oerjZOLO9YOuwpJfAl92+Ma+8buIsDxA9qfgmZWSIgxpni1bVagFXDAEsXt2+skZV/4fFYuPqRF6oyvkZoFl/UiktbDXO0DMMhLZuRrpwLNlPYUFZS5DZeJJEuzdgCZcoF65dOtdQVgycdOMOqc6Ven2G7LZKUHRhumlY0YIinswfWYNxxqAMvTRdmBN+u9YsVsAruMCSH54UbtDJgh/e7h+t94t1uhMltFjO3awknAzPruYr9uDydnCvjQEXWow==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bdb62b1-547f-43fb-b042-08dead8893a0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 05:05:23.9600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3STIXCIO9sABCvrjJMDrjT06FgM+NDiAHP6gJ7wTEFsFZ2yuNoOMYjBkdVbQ83oH6YRdPh10AXyBxSFBEvvkftPz8vffVlRNl1AMzBU8lSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9202
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDA0OSBTYWx0ZWRfXzluaV5JO+wn7
 1Z+QYd9IHpMK+bZ9XEMLaBLzBzV0f2mAfTgB9JomBv+jUwbbvGKCfp7vz6DA8S/pVd+8y9BPVTD
 SKxb+xttIAIy0DVpef7YNvjbo4sA7I9/7Z+GGU7aPYRMla450a1cCiw892J4TqZr5tLd+Ofqm5G
 5qF52rDGWeHta30KFMxrwgs8IkMbqwH5FVKg7coI8ZnMPUVWziaCbkQ5aBYlFdtOUoDwLhjyiVG
 BmMeyi2dOz2NUcSprtgN/2YZOJfT1pG8i3VMo24hW+CNEpOAzSovpwBJaErJOsQRg0SNLqNQvlx
 B2MDLgeRHOo+kXNp/AFRqLkiR0cOGZ/Tu+H8G7IYtP41vAgSpibP5GzR7km8d8GLclDSnBPYmeM
 CqqWg2VqM0K/ixrK4Ri9JlvYM0lLU8q1NzXQxsP0B2np4vcwoexKlMNJUzTf8FJi/+bUWCFmYYb
 c4CJjL/xcN+ojp1i1EA==
X-Authority-Analysis: v=2.4 cv=DsVmPm/+ c=1 sm=1 tr=0 ts=69fec096 cx=c_pps
 a=nBoeifw3k4y6eW1CqgP3Vw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=8mI5Hb44qIRmAaL06cMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: kf6Y35eKEQuyAGhFhZURAoNbVT_wQxXg
X-Proofpoint-ORIG-GUID: kf6Y35eKEQuyAGhFhZURAoNbVT_wQxXg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 May 2026 05:05:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236753

When vulkan is enabled in DISTRO_FEATURES without x11 or wayland,
do_configure will failed with error:
gst-libs/gst/vulkan/meson.build:311:4: ERROR: Problem encountered: No Windowing system found. vulkansink will not work

disable vulkan from PACKAGECONFIG when x11 and wayland is not enabled

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb            | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
index cdf3a20dff..eaddf47ee8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
@@ -21,10 +21,14 @@ DEPENDS += "gstreamer1.0-plugins-base"
 
 inherit gobject-introspection
 
+# Vulkan requires a windowing system
+PACKAGECONFIG_VULKAN = "${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland', 'vulkan', '', d)}"
+
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', '${PACKAGECONFIG_VULKAN}', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vulkan x11', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb x11', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} \
     bz2 closedcaption curl dash dtls hls openssl sbc smoothstreaming \
-- 
2.34.1



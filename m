Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11454F531EC
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 03:29:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10711.1776137332450116340
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 20:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lAbMXzCn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=85647f3f2e=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E1S2Kc4045989
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 20:28:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=xVAmRbb6+gEiPn6/iO9+3jIx5r/TVnugww4yktH2i9c=; b=lAbMXzCn2lrG
	L7xf+YelPUznYc+8EkKZtp/2MPY+bjlpWEj0vI17eAjJkhXuz/neV1ifBqHwO/vG
	nw5dJllF3lH5qUqSBH6DRTLAXJiIxVhY0X73fuxVAn9uWYBqKgNlDBVp9HoiRIgW
	b7GHa2hUUlGKUR2OTwcIk5no27LZWU8U8f6qgJ1xpsK1t/dWZfnVhUGemhna8ios
	AEBGrwQ+9UADuy8iFIP+WckWSSGGuBvbOttAZUxy0gXiW1uYUTlUxqnynImcYPB0
	TF+vg5NY4nKsZb8lHSMp2xD5LACvvKNlgWwGo1YkKeltgh9cf5XvOalqa10bCg7C
	TFrciwt1iw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010000.outbound.protection.outlook.com [52.101.85.0])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh87mr83n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 20:28:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ani870/uPXUH5sbBTUgxWooDDPWTidpgoFkiTD/hBR4q4TR1uik+JJ0We9DiIRjPFBJ/ltSW3W047Hmgd6UKX/v/o361pO71Ea0bTIT1RmuczJj6J6HjRDUGTn8YJErhhalpFe4EszAvB30Hut2XK2uhpPkdt3sN6o2Y/7yTF1+5U7nJktuiQnwYAMLlRfTFcEWh8G9k2LZiQXNzddlyqLmnECJo6GdHBEsd/NsIRhKTYDsVrh1hGsqhQU9ZaL6/maMzz1jmbceQ6AOnhhX5vDQ//WVzVCLBVtGrZYgaMoEowIZCIsmgga5gv6pA+P6Te4AhkxixjBAVEdEsnHFq3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVAmRbb6+gEiPn6/iO9+3jIx5r/TVnugww4yktH2i9c=;
 b=J2b0EFTfuMLpt6HQ9EAVVZ90x3LR0Wi4AHjA94ScmYeLqC2ntQ8u43OWB//8LKkrnOBhbnWmGpirHp7UYk5tuPpZtGeXHpjDTzjiYoYlCUHUheGumzSP/GSgB9maQPKVCnSoaFdGqFtlp2MyIaprPnEzFWUrx3VZRsIEH18AG4aK3qcM+GvwPzVLCxkyziwxY5aqeESK0AXNWJIjRsxQF7lGdlPcffODrMjpBaGFvKekuSy2j922SX+RUciudF72xFMoVl9MQDjMZpJYbn8AQOpN5GKeN4r6rd7ciLAY8XRuKe923rEe6dF/kCMEYODqdNXUgLsLVwR8dMZ5++ZtrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA1PR11MB7247.namprd11.prod.outlook.com (2603:10b6:208:42d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 03:28:48 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 03:28:48 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH V2] gstreamer1.0-plugins-bad: add ANY_OF_DISTRO_FEATURES
Date: Tue, 14 Apr 2026 11:28:31 +0800
Message-Id: <20260414032831.1323996-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <DHS549F2NTOV.O6QC1JNNT3O2@bootlin.com>
References: <DHS549F2NTOV.O6QC1JNNT3O2@bootlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0104.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:3::19) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|IA1PR11MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a406a1f-e587-4bf6-7640-08de99d5f0f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	2qlSC1LaanrO7fZMHaxGQ6+JlCFdhOkmq8HcywjrfcZ2FoBR039IM7UxWU5VIV8mKq7xnebEoWa2EPQ4SfBG6eRe3zGXriUymVJl0nedEBBwTF85N2HQu/SHF5FGKfwAI+Pp9OxmANh0JFDABdD7PWfObH7ONHI98p2ty6hdfDCjAF5Ca+oWUaGXw0YqFMdLB9Nh68DXpTL9JVTRSGIywRFJR9YaPs0ULSztOOvP+yjR4SzixD8MfsoQ2MBLDUMJoiaufwZAdYbXivHtUg+eR3461nJFrAPMDoWvJqYY4gACxwQ6gvqaPo0LCtfIGOMaBWQ5utxPcWT1onBLPvsgeOBRlBRmGl16i4V5vYjrY6RHctHo/ldYlXOR2Ku/H3RosfyZh93wbBLH+c89ktJNs4Kukfz1POKGRmhbjHdWOIli3WRREC3ketJjBE05/N+HpW0b9c1ANCaAlFYu3RHFECHxQSEjhT53dzSIfWiQtL6jqt86R6/BQ3IT6saCYJ4baPGGRxghQLspI6C7OEhHYxKksSG1aa+OpSWTLv68Z0c5yWLaN1NMKy2JBPvNtqpZ/4XZjlH94u66NzJ/OT1W6KZoZJ4S7z+nRRkJ3Mtw/Yl5C62WDgXFbsYxVP0tbvXyYp86wIRGq07YpgO66RhxFVoqHjgCQO0l6ldTTc+huboiXXX2Qop7UJO+mPseCfXUgU0TNTiZAMtKcb2IQAuyqMuDvMBZWLn0XEx3qhOSRQCmUvOIOOjls3PRLp/wD3zxmmDilf8akZsUubVQWzwKMymUZzRsTX5FFQDjGQKuWVY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?W4fAPSeQyCxnAdwdnPxyMbD80MOE3x27akcqZMqe7maFAAJ2Jne5zDHU7J7V?=
 =?us-ascii?Q?2qeJyO3USqkkelJBtvgeH/pZgaIF75tqvV8AuO/KOarfMNrBgVmfJjs833rQ?=
 =?us-ascii?Q?BoXAUER9CA2B6HpjbMZUJQKQtnb7PW9O3Cv1sBv4j07M5JVEd/ofio8bwTcY?=
 =?us-ascii?Q?LQUeFs5DLmdb4myx31tlQcqh9wXUMX3trUl7Mx30NE7RfwqDbiNdLrLLwqcv?=
 =?us-ascii?Q?bgEs/PxdL40jyy+XmvTv7iiFZzE35dC1szqrNC4awziZks9hAK1ZmelNDQ1L?=
 =?us-ascii?Q?VeyTTnBrxTgAptloXB3KsH8iP5m+STBfhkyvWFSLGoCd7fBdEMxlacOvjcsa?=
 =?us-ascii?Q?mvpWRSdEwyIoFGGNi/X+iLdW6/ApfUsTN5XnyuXut5UGZ67YPFiaEGuvu4Zs?=
 =?us-ascii?Q?dKiSwm1un7vh3QEKVd/dtVrAITQUVruYhHkRHg9fnDAedR9guBzhFdxxvPs7?=
 =?us-ascii?Q?aBdRoR2XVIR9LvDigCrw6f1uMGDnFd1RM+BfTsx6saPosDanyJBd8InB9wrL?=
 =?us-ascii?Q?wVo3e7Kd6aGR133qbRC0nuOD9oV16QHLQRctiJVC5rJ40UK4bqkPsyj5YddS?=
 =?us-ascii?Q?dqWTaye9DRaTGYY1Y42KmSH6Ppil0+/MNiD3Rd4Ry0MIbcDGK3S3E5f0FyAv?=
 =?us-ascii?Q?HpCVm8X28PDNJODYxG3HVDgOFqW+ShwdIn1gRGztVKxvueKL1ckH9bwZAg78?=
 =?us-ascii?Q?d58XqkSEOx/qU3oNWbCn36VfuPpwZXMf2iIQ+vvU8Ex+vMCi8o5DhBDKmYyg?=
 =?us-ascii?Q?5hTq4yLaZtq/Q+zobzH+kcx6VtEuSL5qhgG+d0+EVLZte39YMvSYHxexej91?=
 =?us-ascii?Q?1iZlPCvX/6ywyGcSdpTC/PA+h6XjGZ+xJoMgvCG2Y/N4EqYLDQf5cWCR3Y4o?=
 =?us-ascii?Q?cF3tLXNgeq/HCOyutg8e+lbzRb/3gfHSEg8Z1YLHNJHRtdqJ5EDazrv1y6Ek?=
 =?us-ascii?Q?673p3V6s/+sfbEtgALEVfNYpKbmFzBZTjeRkN5TfaTCKd38x1UnF4uYCO63K?=
 =?us-ascii?Q?6KEGGLu1bBjknEoKBTfXeO2togmCmoqVjv/8wL4XJg9BOIsJ2w76JGlBwae7?=
 =?us-ascii?Q?KXAkQGTC0PlI/mtOGUcDuGwg5J+Xyw5TYFtheP6ZNyqKMuQoRU/XxtDP9XeB?=
 =?us-ascii?Q?9TV+qcVVrX5fkQAHU3NfErLNgKxYstX2IWTXD6pDWpnfkiuTXQ9+gxNM6sIx?=
 =?us-ascii?Q?4yADWYyg+VB7T4cFbJ5euGq3mjHvin9m5a5Tze7FxgE4ekCT1Rmssl+0AEyR?=
 =?us-ascii?Q?SfQh/UimRExccVLjxXAG0qaPrVyDHnkjRWVg77n16lBapUG2Bh43bhm5JtpA?=
 =?us-ascii?Q?ewExIhDnyOkebDOXLhEjbk03z+EBkTXST33StSJp9U0XDEjGuecEuV2kKUW5?=
 =?us-ascii?Q?Lv0mJjMI0iG3cqj0wZv1q3bW3Ghu9xf4SlI1TRviLUBPNZJOUP80AOk7ineA?=
 =?us-ascii?Q?HSJLsnI3Y1NQRMpbX02c+JaRSBlOXbQ4I/BUVVScVOVeyPWKr7pryKh2SSDI?=
 =?us-ascii?Q?JILLz/XMBzk81lv8zLfR2jTHnIOZgbkN2bptO3BULqma+3b2OpHy3DWWO8lu?=
 =?us-ascii?Q?7IgBKaUoi7haFhbO55OUkYPX8kdiqA/57f4xYXj9zXog+ajl/OgrDtuvm3jn?=
 =?us-ascii?Q?U/+Eqfcj0z+69hitgV26gX/JS+hqcTplXr8QlU7uOabvvza2X/FKsUF8btB2?=
 =?us-ascii?Q?yIeSrJ0DsruiXwu4umbaHp/EZk23AgqJbZk9rWQyemGPr1CsWsEBK34Js7O+?=
 =?us-ascii?Q?bq2DF2CDVfCa0iVxNtKgqRQ91ZvGO0k=3D?=
X-Exchange-RoutingPolicyChecked: 
	fBJNOIoB5QQU9YD5yGXe6Kp2tbmZ4++oyCiRPT0WN/cJhn9yQjnOStTPMWsxqUlkZdgUnCtEFEDtqu9d56OUDPVu0BCD+fE6Lk6wkjk1vjKyCWhhVjzN9JGaIkOzjusY73qLlXgZ6bosWva9X7pvrrpSWMyoBHFsRE2/B0sazuUz9F72oY5+bKUEcz4Y9MhYD7ma9NKlH2oJjVTPqN6+7lQmTbJt0fTib7iyGDC53BjfaZt5Doqx+QLtMCfSvCIbFr1uw3aOBApvAB9El3oTB79ZRYMfQQAOTbFIVKzV2rmD7wKNjPWQYBrFiaF+stMHjCHC1WugdjVA+5w5B6csCA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a406a1f-e587-4bf6-7640-08de99d5f0f9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 03:28:48.6202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dul4Ra10O5nyvmzgGapNz8MJyCWmhs2iFp/9KzcI2BDcggr1pduj0VFlIQ+i15OfHyHgf2h7yqqqXwVAMIz5RMLiF1sEt8esl7YaOUUpcDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7247
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDAzMCBTYWx0ZWRfX3TPLqLFTKV6L
 OJcJ1sLRJjIXWiw7g7Zgy1HNfeU3+5V6TQpOFCIQMv4+tO2EnFoHwGF+ZKYsydL+7oyXicRvE8X
 A8jJug2T99l+f1G0id0KAU5HAcLPM7qucARSMMppfuaJOVjPrxl6gyuzbVAR/HKI5rVcPa+wLEl
 C6xR9zvlLAtjq3AIq+EoCH4j1lWPTNfFdFKcsXQ8F6cg3nhcetCoO7D87P160p5jHzxcuaXXplS
 3vhMEfDJbGXJcyu8CtB5oZtqcnO8fM2ofmBqIuhrgz873YQw24ANCaKMid026f/l9lCYbamAnuv
 YdddUG8RNWCFAwiEUvFKhUmbkKXsoxYe2dDh/GvcyRiP5RjQvPCYsDFoapVxpOiRBjUy+a6VhM7
 sqMutmSrTFXi/BgU+Kbbk0CTheRVFcKd6oAmaowR7A6Bv2iAJOGv/ZR7T8Sd7fy7nrfqx+Pq9nJ
 Tt4wGAiV2riFI6f/x1Q==
X-Proofpoint-ORIG-GUID: JLmy4cHaH2IawN0HtoTDlNcT4UUjlpXI
X-Authority-Analysis: v=2.4 cv=GupyPE1C c=1 sm=1 tr=0 ts=69ddb473 cx=c_pps
 a=UFaLwPLgEuA+t4da0Yst/w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=kMG_xlHWQGcNhEGIYbkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: JLmy4cHaH2IawN0HtoTDlNcT4UUjlpXI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 03:29:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235134

When vulkan is enabled in DISTRO_FEATURES without x11 or wayland,
do_configure will failed with error:
gst-libs/gst/vulkan/meson.build:311:4: ERROR: Problem encountered: No Windowing system found. vulkansink will not work

when vulkan is enabled in DISTRO_FEATURES, set ANY_OF_DISTRO_FEATURES to
x11 or wayland to skip building of gstreamer1.0-plugins-bad

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb             | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
index cdf3a20dff..61a6d3dd2f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
@@ -19,7 +19,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS += "gstreamer1.0-plugins-base"
 
-inherit gobject-introspection
+inherit gobject-introspection features_check
+
+# When vulkan is enabled, at lease one of x11 or wayland is needed
+ANY_OF_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'x11 wayland', '', d)}"
 
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
-- 
2.34.1



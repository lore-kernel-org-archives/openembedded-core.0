Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB04C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 08:56:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.169147.1783414577396314864
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 01:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NvRjeh8v;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1648a4fd34=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678GlD01173721
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Jul 2026 01:56:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=ea5kG9aQW
	SBDWX/qKaNtc0uHfuYD+r/SjaDM5UERtkU=; b=NvRjeh8vyBIBEBNgSda6mWVQG
	8ok5ENlJCY6BGVU+5T2JlwqpJEFRhIWZBpsu4qiBJbnxX9PKULcqpYf/Encgz/Jb
	AFt3nAgRQzBgmakKDd5KBdQplZKjHXRfUWhL7YuWOQpvzcsEHsz1kjvaeYHLYixp
	veggQfWQT4CjUyDjl6tTOkCNaAwFGMMF8x1zqj1IPcmvqv02qInOjXEKq6hsRbcM
	puZ+wtQE2MxXMCnkFUZvoHPe1upSvymYU6zKCFdUUQ2Jh3JoLjMpo0SYKHe6yJsD
	rfzItXQZvN1Ss8CZh6bcqhag/bZvkCtxMCqUSgCwSIjZi0mXXPwWqR5zAMITw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013038.outbound.protection.outlook.com [40.107.201.38])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f71pe3gnp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 01:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SaviUV+wxg8f4lJ8Rk+RwLXS1iDprSUVns5lFobebIfBMGugsgMFjBlv+LQqLGeHkHvayc9nawKbI+G1lIj5o0L2eeJuLNfW1saexT7bbJe5puNdGC6z9gCRbNBMTZySa6G4YfyjCuI4Xse14l1gDN9SCaSlChozXn3A0SxAakADMOUzSuWTwQxqP0nBUtOIEoTWHSfriun1NUSUngxoNqWoSaU7LXZRRbJctk062sJAml/ha1zikzlb3BxmXjhwWX0CQDF6ErmoWFzTUUg0t1BAv5W4ZjSdE+rjYXjG6dzZgEwRZmtMKuLhkiPRf2Dvx2Xc/a6N5F+UWUBJc99GXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ea5kG9aQWSBDWX/qKaNtc0uHfuYD+r/SjaDM5UERtkU=;
 b=dJNTSDr4Vhyr6PuQ94yRgBy4ffbjf5Uegt2tJcx6rGzBOT+0LBbjBRDwIH4ynjJW1MiJ+307cq4yIpYGXTgvBAmScwfH3i02kESh0WlcN2FU1D60rXhmSLoUznPPTpv5W90bIMAnB8pn9Hm4AEuY0TK8bgWS3Mby+QmCu7vtPsOGzCzHlS0Eg6q/L1Qj4EyT1NY4VlG4nmPlb/DDOEZHq7hUn+tkodZKLMMZdK5yOSVHQpouRquBHhwSQvmZp63GDhWBizfJAlfVL+GaMxhc9XyKFmW9RMyPW++Ab/cROPE7jWZyFzZKrtofetgSjMyTKIkKN0C5O98UXiBL8vsKuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ5PPFF6F855567.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::861) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 08:56:12 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 08:56:12 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, raj.khem@gmail.com, tgamblin@baylibre.com
Subject: [PATCH v2 1/4] kernel-arch: Add clang toolchain support
Date: Tue,  7 Jul 2026 01:55:48 -0700
Message-ID: <20260707085552.981820-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0181.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::6) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ5PPFF6F855567:EE_
X-MS-Office365-Filtering-Correlation-Id: 24d212a4-6d74-48f6-7cd2-08dedc05985d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|23010399003|11063799006|56012099006|18002099003|3023799007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	fe9ok2M1E//tEA8lwFg9utCJrtTLOy7c6Dm4d+X4p66BohVR//JRV3CLLAXIkP9Hv5OYVp7mbbQdK+43J0/lOHzVHpu4jki25Vipgi2/zAfMqvsrCRMdaQNp7TgoOs6eKJ+s4aGS+bfAOPoSBJAQS+9RQAH6vNrNNlcLVYaWRKG9Rt3NOldgbpJZ9/SdLCXtiGz/6A76SCeNQA+oehD44/qJs4gHGR80kBvyOVkPhjdMWO3EBb6HGK3ZGU1D9CPg3l6zMsuaJTyKiM3/9cbiytTgwgyF8uRjXa+MTYsKAHtMtq4Ti8WnUUMG635CJ4JQaOvqmT+l/LUt2KsYoIQSQXy4IHbBQ0kJzGuruJtq+QTuyzbrDqe/Af8V6LuCnAnDmGoRu/4gLCfhKWmYNfArM8hz/F4jMXMRFLuTXy3MLi77z+Sueq76BEVANQZq2AY0GX4z03zOAy9uZUfP07RtEug8ju/3Kt2AyEiF3jrvWBUyAcNzVG0daTPTvxD3SceDQU6f652x/wD0yejsDZPgIdS3C8re0EoekpDRPFwjvg1EKwyDQ8giyzA4qcBkr5UrR5pRP1KK6TEDjjy3hUFnFToWxFM/kS5RE6MLZYB3d0kgHrcT4XcAKBuEq8/qbh1fgdq4lQJWFqmF/pWlDUxpMHcLHgIwA+ahDCUGzxW460v8OSQ18TCO057h2XI92J3uDvb1Aqomx4yQE6/AholXSwRxa3o3/+vXvZ4x0nnWaqg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(3023799007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4KZHZFLXqnwlUOkQhqJpC4zh6DcVsaE6dDmEL6ZUXrUjLfMkFGUlxl2B1E6I?=
 =?us-ascii?Q?rh8JxLc65wY8jcxLfZK86QPUv4oMrjPWE+jSnZkPQE1ZaxIhf0IfuXT7d+g7?=
 =?us-ascii?Q?jp8rIyhdiAfwaBgnzw0PEQcWBj+b9zII/MiPpBMNTo1nMRxjU0vNZn0IvVie?=
 =?us-ascii?Q?+pZyAtG+ZffUdT6z8XX0hQUx83eZfexZe6ddaWrJBZQmh9+YHtk08mdeWrie?=
 =?us-ascii?Q?C2iM42RyyNm4x+2QZKtdrf4XxodaYf6petiV2nEtWYV6YA5PlWzLTLmYFNrY?=
 =?us-ascii?Q?tUKfeCVsrSdGChln0Pz9TF9RoTdQPbm9mhDjq80QheJevl0a9orD0xQ9Gk9W?=
 =?us-ascii?Q?F4SGkl4Z8javGOFMzZ/o1FQQB/qHuseoI/JMMKTIJFrzJQdhE5/a7jc9dVyG?=
 =?us-ascii?Q?FB8FVfo4gO2VCTTFPdBlkXSPNkZcfUiLsZXIUa/0S3/1VjsievlOb8lrR42o?=
 =?us-ascii?Q?uFKzxDm29ASFQnCrqkMCTEQKTWOk0lpb5UVG915AH5Aoenxc2RD953U7w3w2?=
 =?us-ascii?Q?qp4jp9FSv5cKIgpKl6avn+NccsYhdMHxXp5tcUZCKhXWKPYIt1BLTNzcbPIs?=
 =?us-ascii?Q?cXYUKBIDGfX5s0Tjo5RTuQwVpeiBZk6Fb1eEhGFhrxNJYbFIX3r8rlJqzz0S?=
 =?us-ascii?Q?r5N0r59ejd5RvcRHqkk6ZmvL5rZFLqu7DbnIPJB70brp+JDEB4jYBO62nyMa?=
 =?us-ascii?Q?9fMdiza8La+Y2E2hLGIUOXjH1LavmvmABHezq7u5NvxDrv7EBHW4oyNpxbq/?=
 =?us-ascii?Q?YzuIEU4voGrzsUigk9MsR4BcDMLOiwYVZySxB0Qkd+5AcOtEaIfuMAaxw/f0?=
 =?us-ascii?Q?3lvjF3/MHyu+FIjZEU5kSqyzgyYCfevBaV4+8fOJW1E0SWRz20xyNsOasTBV?=
 =?us-ascii?Q?VNkSgnbKfKksm5AbDu6W6CKD8sjRVjnqx6EVfjIs1sVkK4l0PQ3+tj2tky3H?=
 =?us-ascii?Q?bmKxsaBtJ/jqBucjV1xXD7dQL5wodAZl2PcqYMJLAL/BKBvSfpc3U/O4gMKv?=
 =?us-ascii?Q?hslpUFZcJEp01YDrDDvIzuzdSUX6q65IX39tPgsL2sk6pG6ccO6WAPuP8z8A?=
 =?us-ascii?Q?N/sucMrRBqOdXQgkhKShi78wqF32ZRuh6Ax5c05dK1lYWszAWa2hPXG6Cu07?=
 =?us-ascii?Q?GiniL6nkqP40/n/bL5r9MGCpdzCCgOTB/eP0evC1GEufnq/yLho3sr9+UdUX?=
 =?us-ascii?Q?WgcjYBb5/9WQ3je2NoKUFR/UQ6Ixlgd2pE/Wz6vvRII+/+h4vr9yWV0j8LGK?=
 =?us-ascii?Q?OaYmwleM4KbcfDMfDmr1YFVeAove35Y5KjfeTM2qPO90EM904kYvmUw30Pjm?=
 =?us-ascii?Q?36j4OENi3HuxOfMFDqyAkJhQPDqkRY+CQ18TbykCm+vrG7vidxuL8Br2gDpQ?=
 =?us-ascii?Q?SAhjxeGfg8o3+RcbmRPJcYUqKDbPDcT4UTQhVjrTGg80O+U+v5xk3fbwYaJt?=
 =?us-ascii?Q?woaYvfjxFzH93pfg6vqDeBt44Wgpq056r1QmlQjEk+bnUDIPOraqlhbgOitI?=
 =?us-ascii?Q?EuCfQTbJRQIbb/+gAcSvgGkQDbfVYH4JluFeVm0IXOVA8YYNIH091ZuK83KM?=
 =?us-ascii?Q?Zbtie60dhoiaaXygmVwEfXf2z3n/CfbnXpxey7kOv0Zw8o1YuNXYgXya8h16?=
 =?us-ascii?Q?I4qB1Np74GZN3xJGN/WDTjMgOW1h4K3RjP2wP33tEcoTo0/To3FDTqSEeCpG?=
 =?us-ascii?Q?Od7EHtL2WdKkI1QaKmNZgzzY29QLOI/7FcXkoGktfwIqoVLoUbpWXn5UjEs0?=
 =?us-ascii?Q?XvBcacKM3KfTA4YCF8oBEF/GaNmUKSQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	bxXYyKFgH34nxRqCogYXb/sulaPeqacYYzgy0AI8BZckk6P86XNyarqgvFcjZ8hi416B/afgnQNIAJsgyeo+RgOI2ora2q7lUh71T0OHzDgMxRTt0r70UptaAw0zzCQkB7O5i0RlwYbbSDfSGHeRIvPc6J+DVLHO3YjO69Q8WKCutwqYW+XI1ca6/+nQzGaA6QAJPNZ8efNfclWO99tTkuSnCq7igqZ0jxDsgTJR0fxyAcwxdE0JvMG5i8ZZL9icewUd6hji5/Np/a1GXFHPhvjm6zyuLfiXW55HOwpZ7N5itaTBFwaNmvct2NJtj5/26htpKEk5jefefTbcXp91GA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d212a4-6d74-48f6-7cd2-08dedc05985d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 08:56:12.3141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pt5vTIaU5VLtzs6ZyyStCuG4NENL7Zn/aQiMyc+IJcoR8zaUHY5UegTl5GhxHDWMqv/2oPF5L9zlJYR2mCYr93QZs0Jra+303/VlNx0dG/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF6F855567
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: eOxPzE591huSzq24xdbf9ZDpz5E_pcOq
X-Proofpoint-ORIG-GUID: f-KvzyGP64pUPd1hS1gjnG17gmXDxK2r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4NiBTYWx0ZWRfXw/CLg2bmBG06
 avrGME8cFpitNDS0BvKmZ8qusMd7+0zXhajsFNbPVTxtk1UTO/qxuV9/EXR+Fti46Cdfd7Y7Whn
 6W7IQhYJnY2FAptBUh+2LGpo1D2ARsf2802VHxvEr8avvknKCUQt3Wo5zgk93FBVtnST+CTr1DU
 ZLGj35kSZHe40DtonvG8PFIeFr49IRn1A5x3M5IER9WHmGC+pyO+OogLm4PFhn+yUChtZGIhfcv
 FR6162dNFAfm7CZNqQvOcql0Ek7JauPfCp5J4c/Y/IiqHYVDt5xs9Cx8z30FLH28y2q9eP48j1b
 c3loDTOqX+VBDoCYuqLYVJ2loIp9XpcwX9YDybUY8oDd5nNVw8qjzlBYqoPyR0OZQ3g/70r7Ahb
 VkPqLxN/pNPQQrViLUzC1p2ox2NIarNFw/jJxckjvI0K2k57x8Dz24N222ye0v1HS4/5JzR9kYK
 QIkUHv2jBGiHahiOmZA==
X-Authority-Analysis: v=2.4 cv=VN/tWdPX c=1 sm=1 tr=0 ts=6a4cbf30 cx=c_pps
 a=ZmKEHIpmlwdLtedhitE7eQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=kWAUPiode8oiIj8Mea4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4NiBTYWx0ZWRfX1/VgLxp7hDjJ
 wYK4ySYL4g0zBc4X+yLc5LxwhKSuYPV2oeQEo7LulXIaeL3Ib0yAMeVZtInvNjNfvTfMXdNkZVg
 OeT1dmgeeStOS7MehL8tmROzMSink9DKPYqdSg66EwElxri3TPTJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 08:56:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240370

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Convert the existing GCC tool definitions to use the `:toolchain-gcc`
override so they only apply when `TOOLCHAIN = "gcc"` (the default).

Introduce new definitions for `:toolchain-clang` that use clang,
ld.lld, llvm-ar, llvm-objcopy, and llvm-strip, allowing the kernel
to be built with the LLVM/Clang toolchain.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-arch.bbclass | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 7aea9cd3e8..6ebc0f13ea 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -71,14 +71,25 @@ HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
 TARGET_OBJCOPY_KERNEL_ARCH ?= ""
 HOST_OBJCOPY_KERNEL_ARCH ?= "${TARGET_OBJCOPY_KERNEL_ARCH}"
 
-KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} \
+KERNEL_CC:toolchain-gcc = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} \
  -fuse-ld=bfd ${DEBUG_PREFIX_MAP} \
  -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
  -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
 "
-KERNEL_LD = "${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
-KERNEL_AR = "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
-KERNEL_OBJCOPY = "${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
+KERNEL_LD:toolchain-gcc = "${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
+KERNEL_AR:toolchain-gcc = "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
+KERNEL_OBJCOPY:toolchain-gcc = "${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
 # Code in package.py can't handle options on KERNEL_STRIP
-KERNEL_STRIP = "${HOST_PREFIX}strip"
+KERNEL_STRIP:toolchain-gcc = "${HOST_PREFIX}strip"
+
+
+KERNEL_CC:toolchain-clang = "${CCACHE}clang ${HOST_CC_KERNEL_ARCH} \
+ ${DEBUG_PREFIX_MAP} \
+ -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
+ -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
+"
+KERNEL_LD:toolchain-clang = "ld.lld ${HOST_LD_KERNEL_ARCH}"
+KERNEL_AR:toolchain-clang = "llvm-ar ${HOST_AR_KERNEL_ARCH}"
+KERNEL_OBJCOPY:toolchain-clang = "llvm-objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
+KERNEL_STRIP:toolchain-clang = "llvm-strip"
 TOOLCHAIN = "gcc"
-- 
2.49.0



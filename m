Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D735C5AE5D
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 04:53:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23021.1786337594178015068
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 21:53:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WcH/x68r;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=26826cd257=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A47doX1046466
	for <openembedded-core@lists.openembedded.org>; Sun, 9 Aug 2026 21:53:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=8kr0g5DQ9X34LBibsh1mZHpiLeMj5sqZfbLU0sFNyRQ=; b=
	WcH/x68rc6mdf20dMEfQRvI943ZpZz1n+CU5a5C32CbAz4l/IqapdOg6Ka1TwCtq
	R63sAsyo/fFP3ia9rfApfngxLhPBaufzNYDe9sGRrUV6Fet6psxPu2LDJPq/csu0
	k9lGy9qUpAq6b+6E6FtYkeJjSXxsbsyW7uotRdXhT0vrZgm1C26HYkzLDOsAlc5q
	GFQE+2HO1yhiN4/3fBU+vcSbahoaVtPc4OyFLhItCRJmEPMdgOHw7tzbgbBVxmoF
	EFCgrIVZ7kz7A+nxsKrVIZ/t2SqFH0h/9f4M9zisZ8luM6uhSuA84ECBEE83pBNH
	bxkXqGBHhsUBv7awW32W2w==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010056.outbound.protection.outlook.com [52.101.56.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fx3yehf5b-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 09 Aug 2026 21:53:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSnDIUPK59dMZ1oadf46j0otG3273SF5LlPjl68op2JCVESjEB6Cun9s10/4zUBhLq9F00ltns8eNrn795I8EthBZEiZ0d+3ECZis00o8YD9u2VQVn5Rc8Wc4HmwzW3QgIyrSraujIAxI6lbXS187GOrhtZFgyDg283u9PWYgheOTfpl+wMEDitPBFGZMWUacO6bZ2xFogn11mu2ts+jISgGiEEdarrWvLhI+427XjorNNibNEWjimkvMh+NPECGoW1WXEIl3AS/QFLuo2/2bdwHGYsUBfbGT15U9D9yB3hNeCLa3eFBfMo17EHRgdbQjbVDfsBoSdZm7TXP0Asksw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kr0g5DQ9X34LBibsh1mZHpiLeMj5sqZfbLU0sFNyRQ=;
 b=sjoNDsj9dbEacyN3rDEspRVv7imBu1SmwzHhEMdSuvJxmIhPDWOHXu5X7XUbmLWHyEHs6wYZB5asXz+OHOp1p+IdyzBHodjaj4Lx5RJLBrNFFeipUb1RbsJrNO8GhdjJDfdyuBPdUAm41zu3npBQxrNJoSs3NrAt8f3bjvRqh9iSMAUdvO5OtbD25f0Juo1T/jlDRVImYxyt0qv77+1JFNjGQLSXFJ7+y2VY86aHmIoRzA2xHlVq3MlFijuM7V01mKe+EZjEDJVOOtlZEXlay8hvkxm8+NbSo+q6mG/C8rWLOL6yuNm7Du4wLfD217q3SdI9SfGvH/I4nEYIVfgBVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by PH7PR11MB7595.namprd11.prod.outlook.com (2603:10b6:510:27a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 04:53:10 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Mon, 10 Aug 2026
 04:53:10 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v13 08/10] rpm: filter /usr/bin/pkg-config from RPM auto-generated Requires
Date: Sun,  9 Aug 2026 21:52:48 -0700
Message-ID: <20260810045250.3903576-9-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260810045250.3903576-1-sumanth.gavini@windriver.com>
References: <20260810045250.3903576-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|PH7PR11MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ad44a4e-0c57-4b35-eb30-08def69b46b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|23010399003|18002099003|22082099003|38350700014|6133799003|3023799007|56012099006|5023799004|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	7/6UVdnRyZ6m5hdZM5QKnHQKqokzB7haJDoGjvOJ+AkrEP719XV8YCy2xwojuNTn5Jox4+9xN21ygNaW9CB39A51yp4UqHnjp8jmMUsGzqG0Cxegxt3RX36TAN0876cQRLs945OOGyfNagFnQFsZhbXxJpmYXaKMnbi7KuOl/bOMTtIQhY2Y/vLNqb4SfFLeEpLcFkvk4uKKQuuWOaSiJyQQIHck8hux2JRQLvx49XYNYb8GQruCmBPuYvk10cYVHSTvOwEtiZd2IJ99C8LEr7SjlNHmMiSBVWYC9T1LUozNrVcd+CLSOceeOxcofqPvt6RGkyeotMZG4iwJQ83EoBgHJHjIspWezhaquToOSGpTcDMlIR7XKKe+5ZxDAvNvZrQfU16+LGJptq26XQBUX8MrIjG1BQuBLZYrvi4GakrWC2zrdscKMt/f/hPJ4RvbJhADMi2PpByO2ahuUDKOjiqmV98ab+WbxHajWP+EElWNb+LjFr2zKd+MCYzx0GvEY5KBxNttWpozwpR7Ex1jPUpgV9g30Yy/xCNThml7wbzaMZ9gvf/9wqKGQr9JsE7e7H1mGjORtlXZ0FDITfwaEvTpdg7GkPHGKC4132DL3JrKQMe0V+gXoZZ4l4NjJ5l9tI7FDC1cUu5W4AnR6seCmtc+ruF/806Wtnj0oEi1kM4m8DbOQA60uow4afk7MHjzXzjCqAqc+voJ+RbXZen/LFvIXpLCCRpqxSPy9fseUR4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(23010399003)(18002099003)(22082099003)(38350700014)(6133799003)(3023799007)(56012099006)(5023799004)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yi5Fo4dXGonBgPQ/rLMy4qR0r438quJrzuZ4zs0Zs0HEM3vuceVRiP57ukjb?=
 =?us-ascii?Q?2iqLAY8e7tqY83nkihFHjkcH6BViaKgwzzgFkdj+6gGrE9yPG3eSXgA1fYtL?=
 =?us-ascii?Q?iYKSRbWrH03DKmJE9l00VESyNmurd3GM8/1PJCc2FZMKSa+GkaYdHSg+EXWv?=
 =?us-ascii?Q?/seVuaatCWMUBpyF18J4OpkCrznDOO/ZODc7FHqC3KlU6KB4NYmwlXBvvZa0?=
 =?us-ascii?Q?7RXa2Hxws/2smKf6GVUnNh/t73uDV8DB3VXblAI95LC93jnjjZ+LqXDmVtk0?=
 =?us-ascii?Q?s2uK6RtDq214GmhSEpMY9dyIjmr5UXD6jnOIwOXInYUNMJBqtHGYrvZCus9y?=
 =?us-ascii?Q?ZZxdqFefTjvx+4POJ5ic86tkH44yJbbLV8RBYMEoXYXnCkcWBqGS824qCxrE?=
 =?us-ascii?Q?L2gFekXBQibcSXwO509WdKDygYPzERzhFCwusJHL4Lm0u5X/Ks1ofAPLYd3h?=
 =?us-ascii?Q?QAaDv6xqb3acCbXYRzjsSVE4yQTyM/GwZY0Yo/SKn0SPYvSrPB2gGQOeWyfP?=
 =?us-ascii?Q?dQsMRKUxb5NW//MMYVuVCgRU6Assv1GyDi8jND6CDkxq5ybxvIpkx68+thOi?=
 =?us-ascii?Q?ts8R/0afPOiIlSjYZfpuA50+k16XHvN44S0UizGjVuZOnzCmmSQhqhV5qrff?=
 =?us-ascii?Q?bLRVH+hBbwDSiOFIwBXfYhSWpuqgzo/cJSWap8ruyjfsiBwtFxr1vkEyQ5wB?=
 =?us-ascii?Q?lYPZCsJViMPyu6x/4+FAoFUTnkqlzW7zvRrrJk3a8z7jjxKAycE2WmQUJpST?=
 =?us-ascii?Q?yJIezenKbKOT2fCfcajgUAye6dZ5iZmmD+zgSFiRw3omjnnG2tSxcwThFiXK?=
 =?us-ascii?Q?++dKbyi3K3A0RnbBmkKtP1KpYE4iW2NpIqUeGz25JgW1YzVYdLeBEMInac1c?=
 =?us-ascii?Q?4tYEopo9+7am+6hDjizCdao9GR8WnYl++FMptRAlHg+HIXkufz3ZWuwLcjY0?=
 =?us-ascii?Q?EHXAg5tP9XU7SElTx+9NkFd/qWb8v+r3u5yrWvJUMptx1a1tfsVCpm05zx5X?=
 =?us-ascii?Q?YEprBuAlN2241kyTHA59wz8uOIYN2lc1MZb48I9lUks3tWya1m5e2hoNTy1s?=
 =?us-ascii?Q?nlwIGa6YjFTsX1t00pkRm7g1LdSA1/68Dv793xWWT9MCJAy0Fmc7SPrO+66D?=
 =?us-ascii?Q?ogo44xDkccPskL8PzN+WjFwyh9IYFKFGsALdKH1nlDozJQsnf4MZ6rabkZaQ?=
 =?us-ascii?Q?mxkv1V1KVT6qmW3G+L5AWkT1bhOKHu/VczSdd82U2RROhpIs3aaAzf22berK?=
 =?us-ascii?Q?3yBCm4JE1cyQnSmULc5izkPY5ajyYczbT8oMI2Rbm3j9f5qvg24dYdCz5Cc6?=
 =?us-ascii?Q?4aVthput7Aur6Hi7VAf8YEzMi5pN9ZD0lptVgucD07ncIvkrG+Z5SVrqf5Rj?=
 =?us-ascii?Q?DaGiCVYkpqt0NObEE31FiKslz+RLxVdfaZF6bHWJJQr6VYJX+11r/wEO1dLa?=
 =?us-ascii?Q?rnwhw7xdQfb7v8oHTrocZ5FYwF6vviZ9xTRkQM+JAv7g319ny/dtB9PITfDV?=
 =?us-ascii?Q?06OTcSPig4UpbBNk5I08+rCsXQO0NR0W1Zck2Q4JK8L9NsAqZ6dpCNflgI/P?=
 =?us-ascii?Q?R5cHmLBKQwOhq38j6M//9e47aCLdfZIC3nDFcT28Rlg1kyTM3L6P814k88o6?=
 =?us-ascii?Q?pR5XJvG83KyYP2V9tEA/NvuZZ+WeO9t6jEB0J5DbBpS8XwDkx+qw6BP6Cg8f?=
 =?us-ascii?Q?weK6xOgqzu8s7L70vm54yXjNfa1N6sjjfjaZY58+tvCMhwP3FzN3mWDbXC2X?=
 =?us-ascii?Q?BHeI4jguczIT8+tceXO/gy1fdOt3q10=3D?=
X-Exchange-RoutingPolicyChecked: 
	Bu1HigcokqOnsaOMgzsgIz6joV22Pn23sSaEZCMaF4zjz39IdN8Nr2RwPg6SBZ6ZkNReKEeztCVYUAu+TckVeDRNoDjl1eSH32oyWR0HMRet27vl/6MbPzp+h7CVerRmsmKcqsL827OepIMIsIgZX+gO407Da0AA7dBzQ+n365Ec7sis4VA1vQc3lKNK/wkppteaS8Iez0cml7hy2dHgF6FZx76kBV+ASTR5KQXEfRhkaTPSlMZPwLBlaAzc3+JFRwfhbZVGNzpmFDEhk/WjZIwiWkPAYpawo8lBezPF7kE9m3dUjmL7u5377x7sErce1NdFxywFP/v4h5nJbGEz0w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad44a4e-0c57-4b35-eb30-08def69b46b3
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 04:53:10.1364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rMuwkSSJZxVp7ohFZKRgSG7+0iHylAirjRvmcGIG83kqYhhVOm6OmPY4NJ7U6uGOIAHhWBYRHBNaNxMpZXsApdUgGIMWg9+g/NKdZEEvzlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7595
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAzOCBTYWx0ZWRfXxe6kyORUJqju
 rzUU1a9U1U/f/5bXU9dtKMMqh6QdbatUr9R4k1tgLDVx2yUxhoA83wuOCnp6V7kZx9qnC2CZq2R
 NookdCgx/rXBudvBsxZpHgRPP/tv71X+r8kqzHg92FcfM5xd6vJ+I4SmT06sro13mmbJfo8S4Cz
 uhFUg1+CCvfKCD63fyeH7l6YMbmTJM2JL1lTsEF2YiP3ITGd53XVt+B6Ivn9a9WjP/fpMTcRBc0
 JYsP+FwqxJpVIEMTo3mORNeZtRHySafGKIJy1TwfaP0Qmn2pk7n7NvCqgyUAT+FDPvJO/1MqKcv
 ALCAGBwqAzGTRQJyOVL7z+iMiZN6hoAQCMXeo+WeeJqo10n1unaF3sMqk9N0JIih67mKEoRG58l
 DzNiwuDtMR1T0knlGn07YMF/gtEojcPLImrYwz6LYOnazlFUVrLSlx2cJJfk/uqj00j/J8Xm7hk
 ublQkgt9pXfc9Axc89Q==
X-Authority-Analysis: v=2.4 cv=NbHWEWD4 c=1 sm=1 tr=0 ts=6a795939 cx=c_pps
 a=T1Jff0mhgTaaoho+8HaPfw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=HWfS6c1Ke9pW_yr55HYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: dqRItAd2AYn20s3TuUyILRYJ3IzYG5wP
X-Proofpoint-ORIG-GUID: erTGwMjpB5xLhuPizHG0ClIXDGh8uXiX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAzOCBTYWx0ZWRfX6QWoXyafOUqG
 N1rMK62M02NL78HObciHTkoLFBllBAE+e6z79O9PIowd+z/elU/EqX51z+IH6unfdlEDWZuhBc7
 26VkTSFormV0tABtaF9k/j88Mwe85sudllyuvOa92sTTPguq7UMo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 04:53:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243100

* Added 0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch
  - pkgconfigdeps.sh unconditionally emits /usr/bin/pkg-config as a hard
    Requires for packages shipping .pc files. In OE/Yocto cross-compilation,
    pkg-config is a host-only build tool not needed on the target rootfs,
    causing do_rootfs and do_populate_sdk failures with -dev packages.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 ...-Do-not-emit-usr-bin-pkg-config-as-a.patch | 59 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_6.0.2.bb        |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch b/meta/recipes-devtools/rpm/files/0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch
new file mode 100644
index 0000000000..4b9f1e1dac
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch
@@ -0,0 +1,59 @@
+From f7d33d39e48d8b8c99af1e97bcb4740a9ba6204a Mon Sep 17 00:00:00 2001
+From: Sumanth Gavini <sumanth.gavini@windriver.com>
+Date: Wed, 29 Jul 2026 09:10:47 -0700
+Subject: [PATCH] pkgconfigdeps.sh: Do not emit /usr/bin/pkg-config as a
+ Requires dependency
+
+RPM upstream commit 67b68cbeb978 ("pkgconfig dependency script fixes")
+changed the --requires output to unconditionally emit
+/usr/bin/pkg-config
+as a hard Requires for every package that ships .pc files.
+
+This is appropriate for native RPM-based distributions (e.g., Fedora,
+RHEL) where pkg-config is a target package installed alongside -devel
+packages on the same development machine. In those environments,
+requiring
+pkg-config at runtime makes sense.
+
+However, in cross-compilation environments such as OpenEmbedded/Yocto,
+pkg-config is a host-side build tool used only at compile time to locate
+libraries and their compiler/linker flags via .pc files. The target
+rootfs
+is a cross-compiled embedded image where pkg-config is not installed and
+not needed - the software is already compiled, and the .pc files in -dev
+packages are intended for SDK/sysroot use on the build host, not for
+running pkg-config on the target device.
+
+With rpm 6 using its internal dependency generator (rpm 4.x allowed
+disabling it via _use_internal_dependency_generator=0, but rpm 6 makes
+that a hard failure for v6 format packages), this file-path dependency
+ends up in every -dev package's RPM metadata, causing do_rootfs and
+do_populate_sdk failures:
+
+  Error: nothing provides /usr/bin/pkg-config needed by
+  acl-dev-2.4.0-r0.x86_64_v3 from oe-repo
+
+Remove the emission of the /usr/bin/pkg-config file path from the
+--requires output. The pkgconfig(foo) virtual provides/requires
+(e.g., pkgconfig(glib-2.0)) are not affected and continue to work
+correctly for build-time dependency resolution between recipes.
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ scripts/pkgconfigdeps.sh | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/scripts/pkgconfigdeps.sh b/scripts/pkgconfigdeps.sh
+index ef4581856..1cab58169 100755
+--- a/scripts/pkgconfigdeps.sh
++++ b/scripts/pkgconfigdeps.sh
+@@ -43,8 +43,6 @@ case $1 in
+     while read filename ; do
+     case "${filename}" in
+     *.pc)
+-	i="`expr $i + 1`"
+-	[ $i -eq 1 ] && echo "$pkgconfig"
+ 	DIR="`dirname ${filename}`"
+ 	export PKG_CONFIG_PATH="$DIR:$DIR/../../share/pkgconfig"
+ 	$pkgconfig --print-requires --print-requires-private "$filename" 2> /dev/null | while read n r v ; do
diff --git a/meta/recipes-devtools/rpm/rpm_6.0.2.bb b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
index e8977aa31a..32ddebe407 100644
--- a/meta/recipes-devtools/rpm/rpm_6.0.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
@@ -39,6 +39,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-6.0.x;protoco
            file://0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch \
            file://0001-tools-elfdeps.cc-Remove-format-module.patch \
            file://0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch \
+           file://0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch \
            "
 
 PE = "1"


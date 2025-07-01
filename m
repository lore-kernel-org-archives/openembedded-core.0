Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E44C7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 15:48:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.521.1751384871723806444
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 08:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=927761a2af=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5613Z2TY031437
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Jul 2025 15:47:51 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j7c9b6bj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 15:47:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gfVURQSAHuW5FedF/6/vZByGzfMCD+wd5x3ueXeEwPXYTgmp/W/MrFw6LRZWFhXOdpHWX6SuwnCQLKrnt9Ex2mn7OiPMyiAlZg4tRAyl+4kswBjAslA5O4UVyqBiJOQMdXuEyqWSIsL5kEv2EeIpRk9TCe+vql9S/2JBY6nBE8H4nqQBAoPHURMNb/8ytFeuxiKckyRC5eWyhLSsSsU0yhsiQsHPD2XiXrjPcIfhkZS2hu/2SD0CDsSKuphf6zYgn12exJlKPyH+Wq/nCMelsVgO/1HOUyifbuDkkO89P0r7TYJxS8fCqHRU7lpw/LgVZEGkRPOokPCfT8q0zsFUAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NmzUupT2sS4zH+Xzi2JZIRn0BNu6mC7fnTY5tPRm2ys=;
 b=ykIgtMNqqME+R+hz8FXoC1P/h1XWn+zG9VLEzEVSO+QTbWbvr9WfRMoZubDgTiFc24V38ftWA/yZrZDXyKBp+npPZFFz5qWzC/oTiyL+h8aZazp7D1lCYgxKW8uRnx02j1ygioHxqSi1BWd/7rNMf6Ue+foG3ePwbsmBoG5JsYsYgxKN+WTwXWbIZhq2jzBZKsh6nBg3EYWrVNbbcvHLqDCX6ge6ahbwdSlIV2A73tojiUwS5Q0cNkm9ys6hXULz1uYD6xHCEwD1/U93R3M+t29dbR1eez6zpRzg9tlMIkzioRhbXux3GJynWqtIlHK9rOPAoA/ldTGlLYLBGphpaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB5944.namprd11.prod.outlook.com (2603:10b6:510:124::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.32; Tue, 1 Jul 2025 15:47:48 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 15:47:48 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/9] drop-unknown-suffix.bbclass: add class for removing unknown suffix in version
Date: Tue,  1 Jul 2025 23:47:23 +0800
Message-Id: <20250701154731.1465906-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701154731.1465906-1-yi.zhao@windriver.com>
References: <20250701154731.1465906-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0090.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::13) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH7PR11MB5944:EE_
X-MS-Office365-Filtering-Correlation-Id: ceb6d16c-0c90-4c6b-8ec0-08ddb8b6a0c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EsqQotoifZgmot63cX4dAaBkEc5Khgg0n1JU6HN+4xnfBhJ7PinM2BKygLXq?=
 =?us-ascii?Q?iNozJ/sUcFysZUlD+sOxuVI3rlIvvIykW7vLnoXAT1u2CxF3fkMs3ylMgEAT?=
 =?us-ascii?Q?DH/ejyTSXWJAjDOFdMK98hGPTqSaOY1KCb1ZM1fOAk+XXO4gSl+JWgq2vtKy?=
 =?us-ascii?Q?YNBC/xO02EDn/2YUpOgjd3giw/fqpjafaGIzsIZBqPjUalLRTZPUcs551P06?=
 =?us-ascii?Q?BdjLpcJDmFGiS1eNzkkr5l4cc32E7xyL/RiZCOevZK64MBng/NxhzZaWDYW1?=
 =?us-ascii?Q?6BT063Zd4sYn8Rii2dg2GeSWtLhZSCy+60D1UrOxMFJXA/6RviI9kTy8wufz?=
 =?us-ascii?Q?MdEksMfwzpCKcUHlZx3sUeMWDXBSK7JtX+/kLFkXKTSiFFx0FLUMd6v95fK/?=
 =?us-ascii?Q?QXGetSh9MH3AlTSDnzcOrHxupy9lX4vRkx6VutwVA4LPu/+6nLL+BYpuWzTT?=
 =?us-ascii?Q?mGqQ55NaVGXZto0PGNh8yFOKqXek8OKOb+MQIRCoMEulh9tNDTd0oum4B2k/?=
 =?us-ascii?Q?iyIkanTLuJuakkAICEG0EsR9NF4s2ADNB2Oq+CvbRWpct1iYzujU4cpR1H4W?=
 =?us-ascii?Q?bbkLnUTqcogWBvNDCb2ogIETzmbs6Cpie7vPAwrcot8zOdTZY0xe7Q1GQb1i?=
 =?us-ascii?Q?nmkll8IJMYPKCREjN89Vfp1pbzV/rZj4gPpq2lfh72IrBwCjemeqIYGjYwNK?=
 =?us-ascii?Q?xLcPS9SHV019jWzkHnUYuSu7A26TzHG8hq6WSyWU07aytlqvrau7/FcZjy+/?=
 =?us-ascii?Q?IgW+RoQNJc9lE6abC2UY8rSVqPv4czvUoczQKMqKiyQ1DvtT7eBWRgTInW8j?=
 =?us-ascii?Q?/lvMb+mQd6hWJVyy8q0LX5/Xv0n1uLb1BInYmMNpx17iedGsRXzKkRTr1/HJ?=
 =?us-ascii?Q?5+ReBWq3CLBMOcb4sLyNUHiMf5Zsh5wnD3TRi07OTxS+ZiyBCL7T4YfVLx4Z?=
 =?us-ascii?Q?exl1Z1Z8IPT02T7v5E9TG3Aa4eDSUm5bjLOHR8qg+QOMy3u8yLHbJ8VrKfz1?=
 =?us-ascii?Q?/pecc6k8aE2WAGT6GpfyrUaTafiVSlrhYtXCROzTF1L2C40VvgFG8Q51okzm?=
 =?us-ascii?Q?yI/F+hBNaoeDYlNDs92Xvv/MenOntalRwlmikgqRZ6jAW3TqY2f07s1zfYfT?=
 =?us-ascii?Q?OMZ8Q1CsUZhxxT3fpcVOCqcO7mmh8BDscLOwFsyeW8V3AZftE8xRB7scfJRe?=
 =?us-ascii?Q?IbBmvsIwLp0drEV5twxwSMeeU3J0WPmzibfx2nPJHtBZR/ULILnQ+xoN0+LC?=
 =?us-ascii?Q?HoFdV57gCiQO+UEGrdo6bLj3ghqcr4QUPEHuOsZi7hyioczA83vGQwP54CO+?=
 =?us-ascii?Q?2U1lP8K5vRoy/EOR5lGOukQfU3UqQp9Ue13ig/yiPmk0grGS6PgDwMGsbhAN?=
 =?us-ascii?Q?pKHOcGQ00hPrOLqp1IaZ+wUx0yyLF0S75G6wXv8XW3ntGmFwtxm9tXarMUvF?=
 =?us-ascii?Q?acHTBCPO9grJy43rAIjNdA4nVaB+UhcXElO/cWkgOYTtSvK6HSTMwQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4wzm8s88/gfD1Bv6DDwCJ5nCD1S1c9e38Q+vKwDLqZNe+d0mOSdzlr2B+NJ7?=
 =?us-ascii?Q?bJjy/nIXsOqFGgujY4/i5F9QKDUqSwdSG1tIW9jA+at72+2iHB2LuCiz7Ovt?=
 =?us-ascii?Q?UnV1netrrCKjF6nzvPArAFZSH0ttKgDF1wTRT0P5wILC3UWezAUm6plKS2Ni?=
 =?us-ascii?Q?YnnofYGuDYDfntCCWbsM5QfUmUnH2uqNkUHkGvSQ7kgWIOC5K4d/onqAfRrZ?=
 =?us-ascii?Q?3RJ7H4nAkIISJraobkYDrA2FtHNN62l/skIlreaZfdg5ihqVNpSehe8daI2k?=
 =?us-ascii?Q?hRsKqkGGEjcwA4CysQgfppfsHy5N1Gn4mgy8FZz6N52JFD1o9eLRPiRTsqF1?=
 =?us-ascii?Q?lqwT0cI/xrPhodQmD5CxVHX1ECwbNNKTm0YR5W+QzO4O5QXq77L25h7SKdlq?=
 =?us-ascii?Q?OMvQy4VpsQ5zSJKCoYJBnwr/PT2CiBXnA+3mlnwyilux7oh6nW4VuvsJX33s?=
 =?us-ascii?Q?1uWkglJpa1j42MfITAd5msas6p8W0AVzfHtcPOelh463kwvMGoDQ975rrYV+?=
 =?us-ascii?Q?l0XRPJWQulxQpv+KnWHnV3iEyEsGWz9QQ1MxLQ5PwSXCz204eHddYSFATsAp?=
 =?us-ascii?Q?9/rcr6eToTEEW9oAa4QK/qkr/VSeRy3IAoba8vhSYtVE9PHLeKeoqJj/AJsT?=
 =?us-ascii?Q?QrG1OcxAuED1vnDFRZHtK54RFEaDJuFjJFvNLZ1508tFK9Qw27AbYMfzFwVS?=
 =?us-ascii?Q?mmZj1UTJpK8TQbbq59cjutwHVuqEQXyrG/wGFXUqjtrJW5+SG1+Bd5IVFHr3?=
 =?us-ascii?Q?FWCUEgYy+kbRqv5MSGe/MswG37JGthFdC4C95BZ2XGT7WCvxxhkqlMpMg7am?=
 =?us-ascii?Q?gQucU0z6/3XAeT3kSO8DeQkBTHVl+4q3bTqfD/9X74dJjSgCR2qX74Y9/6L6?=
 =?us-ascii?Q?QBQD/bxJUF2+KMPbPNtRakcN/OyiWrgSgntbq5hZ6AS/Kr9gM0e+pg6MwuKJ?=
 =?us-ascii?Q?9k2rkjfzCrexRKzL5jG89v5Ef10YBO+iity/mR1p2O1F07j1Xje3RXQFR+iH?=
 =?us-ascii?Q?kcFcPegNzrot+t5eIlYLuOkG7u7bhPqt2FYdSQo+McDgC8r7Y0aCH3HfxzeN?=
 =?us-ascii?Q?OW/MfA6tZ/naRyr+Nr1Svznu2V4nlccBhJSVB8eXc6pXDQ60ASa3Vi8wuoMQ?=
 =?us-ascii?Q?dRcEawm3bVqmSxwj+TN9lbMfDCG6jKzxhlh7r6AdHu3WaSqdr0iKbqESso3K?=
 =?us-ascii?Q?Cp3MunS70/LWJ4V4Ca6O0aqmtbAN6smQrXGVGwj3eSFY78qTLIdehdX7TgMa?=
 =?us-ascii?Q?NewS4IkGj6uf2yWPabNIJ3rZvUzI1njkPztdMV/bsoevMOwxkdTBn9fcsWlE?=
 =?us-ascii?Q?mMR3Ct29t7oYN7cbdtGu2CEfB5jTONNdRrGAddynfEoh14SGY4TbWVCpzqMP?=
 =?us-ascii?Q?BHopP2az9uVFOnZ4eL/YCNcclsUh/0SImhELYKYOKhKeFzzhhIAbClzdohrt?=
 =?us-ascii?Q?tChf4/pR+VKCu040QFBRapz6J1rTAJQ/BY2wLfQo25jzxx89PcsPpXSEM6nv?=
 =?us-ascii?Q?lm/j3J5wWA7FEZQK6Cr5k+mlZhcntnuB0sh0JPV2oNn4vIpLBdgeIHQANmtz?=
 =?us-ascii?Q?MogrQGbBxwg7LZD0M0O0bhv07L/hw1yxuKQrbHnm?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb6d16c-0c90-4c6b-8ec0-08ddb8b6a0c1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 15:47:47.9258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K4YRjm8QFgeUckvRJ5CHEVmbA5VFQJWFBqJXN9KuHgWfoZyv95X3iY191AT0MMGdmMcZy2W/ZTx9IyRHQ0UBpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5944
X-Proofpoint-ORIG-GUID: ZXgV7tjavgndSPDboj2unoc_O6rTnvse
X-Proofpoint-GUID: ZXgV7tjavgndSPDboj2unoc_O6rTnvse
X-Authority-Analysis: v=2.4 cv=M5xNKzws c=1 sm=1 tr=0 ts=68640326 cx=c_pps a=GHFRT9iJO9BovS83oyvw+g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=E7nmfMn5puynJC4xCJoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEwNiBTYWx0ZWRfXz8r+j+W+Uzfx 3OpAbZ1AAd8Ub+jYzS2jqL43oQFKd9+xUGVFcPBnRLj0fcer45eQKeA9myGiH9dxh9tXh58WB2K XSTNl+nOznZVeRyHXtpeRpazpC/H3VgRXKlelG4ywcy0nscAW3i2r1A790zmMDkxViBp4Pc5iP2
 U9Wn1NcctVBOjFt4Rs21GjWu64XFLdu3gjh0cbCYo/ByRmgTo21BfvJYCE6idlV1IcYs9C5NmGF QfoaNisAjG3efroxz73Va2poLGV86Ssvbhn+H/axZNbW07tZCnbrE5iD9/w5xQlOrW+r4ydXB6g Uu7fLHDdQHoMQKzqbDXJrTRCSbAPKP7+A6gy6QAfwPAnsamaEX6sADaPVFzZPaVpy+vuJgB9FOV
 oAiJJh32yJcBkazbId6yd7fZT3MNob+0MsVegpoO7KWolkw49WoTQQo5j8qdvWW0MA4B0ljJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=957 suspectscore=0 mlxscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507010106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 15:48:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219588

This class is used to remove unknown suffix in runtime version for gnupg
and its related packages. In these packages, if autogen.sh is run
outside of a git repo, the find-version function always assumes that the
package is a beta version and adds the suffix '-unknown' to the version
number.

This calss modifies autogen.sh to:
1. Replace beta=yes with beta=no
2. Replace tmp="-unknown" with tmp=""

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../drop-unknown-suffix.bbclass               | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta/classes-recipe/drop-unknown-suffix.bbclass

diff --git a/meta/classes-recipe/drop-unknown-suffix.bbclass b/meta/classes-recipe/drop-unknown-suffix.bbclass
new file mode 100644
index 0000000000..78707adecb
--- /dev/null
+++ b/meta/classes-recipe/drop-unknown-suffix.bbclass
@@ -0,0 +1,29 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+#
+# This class is used to remove unknown suffix in runtime version
+# for gnupg and its related packages.
+#
+# In these packages, if autogen.sh is run outside of a git repo,
+# the find-version function always assumes that the package is a
+# beta version and adds the suffix '-unknown' to the version number.
+#
+# This calss modifies autogen.sh to:
+# 1. Replace beta=yes with beta=no
+# 2. Replace tmp="-unknown" with tmp=""
+#
+
+do_configure:prepend() {
+    if [ -f ${S}/autogen.sh ]; then
+        sed -i \
+            -e 's/^\([[:space:]]*\)beta=yes$/\1beta=no/' \
+            -e 's/^\([[:space:]]*\)tmp="-unknown"$/\1tmp=""/' \
+            ${S}/autogen.sh
+    else
+        bbwarn "autogen.sh not found in ${S}."
+    fi
+}
-- 
2.34.1



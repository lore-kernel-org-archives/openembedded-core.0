Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F05FCC057
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 14:04:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38907.1772978658807602703
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 07:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mpJupWzk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75278c0199=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628DUo9g482562
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Mar 2026 07:04:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=FiuAY+RQdbfS/Ltm4WrerjHk5HnuK2Z7DbVMXa2MjI4=; b=
	mpJupWzkXI3eh6Fm5QkMxlevyEjDuYQWbEr2IV+XJnkoWLhG+r3DovRHUr1Wh2od
	KtkKlhG685nhorUmGus89tyfKQCWUB1Bw9Bw5uwyiNMPvFeba6QJ7VIV6rPSRfM+
	Ju0mIDEHprVUlEUrjsPCUza2IzmjrTo4AJaxOFni5LgrZEPaecEtLQ+MTFBxkglz
	9sXZFhousoYSvwZbBxkSQdB+Y6m/tJkNbOv/CYSfHviVPlG+PFpe8GEkuiZhK254
	hzl6cTLNVfXOZKiDhTMCoura+/InnW3OoQRJgH8pZ8Jb2dthXhUCOlW8Ytp+Vjuh
	ALXbcjzpzLWzpvnwx+5VdA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011045.outbound.protection.outlook.com [40.93.194.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crg62gu91-6
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 07:04:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WG0SW180ICltf1UnsM8c7xdVWKW2FeAmQTTRrvuGeyj+eXAx0z6wrjKQBc7/qLQO/imJcNbbOeLXOMCEi9DMNhLDlPGX0MFrlEYFICsV38lWnCYaBk16rAV0zRjltHgybaVUK8iAqlOF19uTYtcWV7WCP9EIp/WZSLVDrs4G3mj8o6TB2aKq3RIF6mWTHvtk2CAopu+9GAaYBMLMKNIDcIwaTtyTJy8xaBAOELvSU3uZKSElWT3wXgczqeJDqQp2C7PZRRz8Yeb1ekt6u4UH7rJlpj4LJybF1PZevKJzFd+7y360NwSOoaGYto4/34Xb3Vfwo7cRQmMg8wT0FnbYRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FiuAY+RQdbfS/Ltm4WrerjHk5HnuK2Z7DbVMXa2MjI4=;
 b=oa2zUkDL40vsC82aQiyxO7aelyOOuB9cwiSnoNLOElc0TsBEoKoTDStEAMsOf7t3ZT4idYP/1AbDu3k7U8YTssPt8oBPXhYR7Iy6C58SIbMXpSHzJdBVbsLo7cn0qPcOcUYiEUIbHO2Gff1iILqQKBNxP6gGTYZBO3aA9Wp8MzXv74YlBm795jlaHfDZhycx9GanbXyrhDD/yTOlTu+qmOwoVy90/aMx7DTx1cKiej1hnS9DF3cRmqNWANO9Bip8QP/brfiWS5gw92K9pkHWFp+kwJaV6cc61DwiefgpiUXppMtWNrGwMlixtMqVfw3GblpHt5R9k1y9hfWgF/CG1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA0PR11MB4574.namprd11.prod.outlook.com (2603:10b6:806:71::11)
 by MW5PR11MB5859.namprd11.prod.outlook.com (2603:10b6:303:19e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Sun, 8 Mar
 2026 14:04:15 +0000
Received: from SA0PR11MB4574.namprd11.prod.outlook.com
 ([fe80::215f:e93f:c560:8486]) by SA0PR11MB4574.namprd11.prod.outlook.com
 ([fe80::215f:e93f:c560:8486%6]) with mapi id 15.20.9700.009; Sun, 8 Mar 2026
 14:04:15 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
Subject: [PATCH 6/7] barebox-tools: fix build failure with glibc 2.43
Date: Sun,  8 Mar 2026 07:03:13 -0700
Message-ID: <20260308140337.2503858-6-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260308140337.2503858-1-Hemanth.KumarMD@windriver.com>
References: <20260308140337.2503858-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::14) To SA0PR11MB4574.namprd11.prod.outlook.com
 (2603:10b6:806:71::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR11MB4574:EE_|MW5PR11MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: a9fa6464-d88d-4dbd-26bc-08de7d1b9525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	sCQtTBBbSiOa+gQ1tYijzpH8u35rqIEzddrVnslJ5tDoyuKfotB/i0L2w7+1IVepn6KLweKKGu/PU+iQI9lzo5aHaoDs18nK1xr2sT+bgfqvBacuknm+DhfweZojB43pb1MJyxvkAcmRb5GOizzwmUEv8s8d7OJhNsP7qkFnLK6vctlvfau5SLlna8VvCU5GS7NdWruXJcu9VaYvv3yyxlUypYG18os7vVRwIe/L3IkQTjdPMgKXMil8nTdIbJJsydTSB21f9jiR2K3mfbKHraDYEssYwJHulHixVXc5rDSkFPIxJjxTJu+/HZTim0/1beNHwvz7cURQvA2kkXZe0I/Z+OBGRMe+NAPimGWe4GlzG8Kg+wMq8Ga807d07/rxYWXXsPX/+HGqErCb+Sfl9L73oIE0hPAuyxPCgjahNokYqBVnU6sCfg8zFT5RI0obF3+M7s+8myyb20aDPpFz0Ejg+yNunKytLiCKbdIr0JjHWX6WYAefJAnC9uNHoC8yZ3qfkH+iK86rg41D92p8CH8ZHlksb9sRX7l2ReGGmeRMF71tEPIzsLpeCwXmfn+BL1t0hsWIUqXd6bJHMrCp3ai184gR/tGZZ7cFbZj6NnLw0bXeC8enIfV2mlYtsdZi6XuilrdSAMa0B9PrMB3BU1+AG2XAGZhgCf8g5s+BiHMhvAbEoOKXR2ty+R8TbWQCd1St1/RrldamOyS94J8BpSZopRFXzxbLTEIsznRukLAAU4dNNXQ5x1mYXipcntwMOiIUGsYYz088myNsrdrA1+zSnZFa1YqPyOCJEls4MQ0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4574.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9abiQhzi7nQvrlgJQP7TRFifS5kYWL1qlhkckh9XSHhP6fwpIysIILKJLqyN?=
 =?us-ascii?Q?4E9wz5b/ikYepUJtHs3rpXkJYhcKdIJmz18v3mQCX+Q5jYKP2fnX07zR1aR5?=
 =?us-ascii?Q?PgnW8y7mYB+2nbfFiU1CJ125TGvuAUL0oX/qrJ9UBxDhQoZ9xvFdFjI32f52?=
 =?us-ascii?Q?05wb0B/UWvAjAPocrABJkk7brvddL1x55ENdR6ie+XQw/GichlO7LVAYk/AD?=
 =?us-ascii?Q?FJRCFkUkNvERXyylJ8huckvPEu5PFISv0LdbdKk82p895+j9wAtLQTHN2YuQ?=
 =?us-ascii?Q?lt7QwhYpzF0Sf1utzb6KoyRMuS2VmygMZs7CXKMtgdrEQL4cft9jFbhLgxKC?=
 =?us-ascii?Q?mzset9RdasWMeolf8JAEyA8IqxVa+bWzLUDXz+PTYHQ0dK5by2fD+e9HH2wZ?=
 =?us-ascii?Q?U9AYraVshGKXF2IKOjySV7I1P93OOdqm/xPMShxWyYkcLGRkER5AgWO74ETj?=
 =?us-ascii?Q?cfvV1IqGVnWrQYJbHXE/kVWTg8kp8AyUGSgL9hPCIFBEyRdM8y1wk6bwHjjK?=
 =?us-ascii?Q?iswL/Ddp4Tmn441qm6BjHCXLai2SMUbUkuhEz8ud1fl2gPGE9vzxIrg7AjAp?=
 =?us-ascii?Q?q4RL/lboGXAWHi8IJbbupMVdq5OOiZb4G9U4hj/qWMP4WS6oqXBFko9MjqK0?=
 =?us-ascii?Q?LavziSVAabmFmhIbTjZzzm/CUDyOYjTCpcmzMQ17utRpAEANKt9wWtkxXpuw?=
 =?us-ascii?Q?KZ4Sxb2e/T+P7oiivej1veqiqVlPQ7EZBp8VX3IyFXXiVRyZ6A2u/mopFhvz?=
 =?us-ascii?Q?qqTlxaZ5uv00r2otHatdX+pyawIG/PfI0Jq6+W2Kg4LEg/zTNw9LbbOvkDkQ?=
 =?us-ascii?Q?zlMUeZBkhBeQxJ+OKuY+T+V7dsXYOKWRPP4k7P4oXTqqMR9MG5h5jh/B3JQe?=
 =?us-ascii?Q?aK5NAKZx8y9NZxDTDecAzFwE841R7MrAZO+y4wAPy0GZ+QAzrawYn1knZ8zj?=
 =?us-ascii?Q?CTW7dYUzNDaZEjaVyPeaswADreltaDNmHTuAfEEB54lZ3OiSdbDPWjbmb/Z9?=
 =?us-ascii?Q?8NStqgh5AH5x/LlVWWPYgqOPQ6VcUrgJwsDCN3/STkc+QLaUDXiZ7+dPOZ2G?=
 =?us-ascii?Q?U0y+dPtJ2DkF1nf8lSxgup21W+jQ4yWpUdVyqZy07x7ZmjrdIwErebGhcCo/?=
 =?us-ascii?Q?8+WMcpNYKQForO2lz1C9ebZevt0cBxKvr27jHGolAnQdyOE8l78qD7zdlh+D?=
 =?us-ascii?Q?7mY+xDmR2dHV7u+tBcHbxVn7pnYgWfMd0PCbKwCwoChi9nVILOYrlUq6G4kT?=
 =?us-ascii?Q?dooaMgdPZ1LCtowkXzr/hGNXVjBEumFrac+kHMdGyyWOAW/LVsuymNnMhK3v?=
 =?us-ascii?Q?g4vYBs0WO2qZbmqI4Cy/ZsIVEMSfgZSKMKIa1LpWGr30LSggO6OqAQ6oNmVj?=
 =?us-ascii?Q?lnSc9usdW1QAfJrVSk2Tves1rBet7ZzxPz1DMF/z4Sg8+56SgotKlono5Dad?=
 =?us-ascii?Q?NIAG1F3LMhBXaKUiOYY5mYPA2/ctLIQZkPs+o3NuMLC8sNGib7cG8AUgtAGD?=
 =?us-ascii?Q?HmBoQ9c92gWnZdwpYuRzoqE8urlkR37eHILAzkJ/9QQHZYRXSTxhLT0CNIOS?=
 =?us-ascii?Q?vg8BrSWwLWntEgv6UgAEHt9ZRSY2JIjAIrTG6Z/vYmIRY35afH3tgJxIpzRe?=
 =?us-ascii?Q?30C4+tmjsh6f2ue/0nju+ATrGq6WX8mZRoR1WoXJafl1HfCirU9k4Fz5vJeq?=
 =?us-ascii?Q?1dNEDpGYeBFm9e/M+tWIRabGHaP3Hki0z2Epe53x1pp6AYIfF23XSlEGxepY?=
 =?us-ascii?Q?bunUKApXz1xOrnVd9WhIlj7SAnVqmeE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9fa6464-d88d-4dbd-26bc-08de7d1b9525
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4574.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 14:04:15.5452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8zDjaOfcZV77zHzepSJR1ih3Lr58zBLPSpio8uzXdhk731gPvwF3m+K9TLsthraeEm+buOFs8NoLXSoW4CE7dxwRghweo/DbjYTafisPQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5859
X-Authority-Analysis: v=2.4 cv=f4FFxeyM c=1 sm=1 tr=0 ts=69ad81e2 cx=c_pps
 a=z/rjtr9/JqYX5j7IdmSYkQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=A1X0JdhQAAAA:8 a=sqegTYKcpFJ6_3p44j0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDEyOSBTYWx0ZWRfX+Z3CgmbdHx6W
 te6bD/qeU2aYnpCVb20kjyu6xOXr3PB5c07Am/uL/eWRo6Ed4LlV2W5CQ2secUNvZWUMIK+myU7
 oiZ5UIyehOGaLbCd7hdhGgrpDd4NVtIYnSMwz90s722zYHBsbD9zKLYQ3aFLOa4MyYJ+jFnACtL
 xuYm0MYI4cgbKV67A1T4F2oyH/0rBLa1fwoxuOU9sUFyxyzCH7rwzGkn9h0jXQJmZ8AkiZCQc12
 /aD7Z3kcj/UMzzxF/wYBeZ0cHs6iv+EF2uNrlIQ3vb7ZXGRhXbcBYGH2aI/42EJSAuzyoZI359f
 leK0PHIKnKdNEWNVVxQoGm2MENnmuHTasf84C5JlB+QgIx/pUAvBk+Ji2sbpKVjLFsJJein+s6/
 2dSqP+3DRZq3mxZCxBAKWkX8RaOqFEUP2L/GjqQtmIiDmmuJR/Iyv9vPoil+fkHH6R3th2I6TI8
 4/yT86OHHAHOid6l6+A==
X-Proofpoint-ORIG-GUID: QQ4K8GIYhAINQDw_Fs3-gJv5os_KzAEW
X-Proofpoint-GUID: QQ4K8GIYhAINQDw_Fs3-gJv5os_KzAEW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 14:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232649

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-bsp/barebox/barebox-tools.bb     |  2 +
 ...x-tools-fix-glibc-2.43-openat2-build.patch | 43 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch

diff --git a/meta/recipes-bsp/barebox/barebox-tools.bb b/meta/recipes-bsp/barebox/barebox-tools.bb
index eb327306d9..1459f48db2 100644
--- a/meta/recipes-bsp/barebox/barebox-tools.bb
+++ b/meta/recipes-bsp/barebox/barebox-tools.bb
@@ -2,6 +2,8 @@ SUMMARY = "barebox bootloader tools"
 
 require barebox-common.inc
 
+SRC_URI += "file://0001-barebox-tools-fix-glibc-2.43-openat2-build.patch"
+
 LICENSE = "GPL-2.0-only"
 
 DEPENDS = "bison-native flex-native libusb1"
diff --git a/meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch b/meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch
new file mode 100644
index 0000000000..3f42ce76e8
--- /dev/null
+++ b/meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch
@@ -0,0 +1,43 @@
+barebox: fix build failure with glibc 2.43
+
+glibc 2.43 introduces linux/openat2.h through the fcntl include chain
+(bits/fcntl-linux.h -> linux/openat2.h). This header expects the
+__u64 type to be defined before inclusion.
+
+In barebox scripts/include/linux/types.h the header <fcntl.h> was
+included before the __u64 typedef, causing build failures such as:
+
+  linux/openat2.h:20:9: error: unknown type name '__u64'
+
+Move the inclusion of <fcntl.h> after the typedef definitions so that
+__u64 and related types are defined before linux/openat2.h is parsed.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hemanth Kumar <hemanth.kumar@example.com>
+---
+
+ scripts/include/linux/types.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/scripts/include/linux/types.h b/scripts/include/linux/types.h
+index 5b01333..33cea19 100644
+--- a/scripts/include/linux/types.h
++++ b/scripts/include/linux/types.h
+@@ -4,7 +4,6 @@
+ #include <stdbool.h>
+ #include <stddef.h>
+ #include <stdint.h>
+-#include <fcntl.h>
+
+ typedef uint64_t __u64;
+ typedef int64_t __s64;
+@@ -15,6 +14,8 @@ typedef int16_t __s16;
+ typedef uint8_t __u8;
+ typedef int8_t __s8;
+
++#include <fcntl.h>
++
+ #ifndef __linux__
+ typedef long long loff_t;
+ #endif
-- 
2.49.0



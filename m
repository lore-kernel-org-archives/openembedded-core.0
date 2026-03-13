Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00688107BCC6
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 16:00:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19289.1773417611205590884
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 09:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qQ8vTSPC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75322bb784=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DAudru2320885
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 16:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/ipUJQlymb7LsVfHv5FEzOss9ZqEz8ZXdGDkGeKekdk=; b=
	qQ8vTSPCqCDDG4btqDcyDRUfTiupQrs2xbyHwH2ht7fcEWK5iw7PSOA52Hd7P6xo
	GaumB64FKXDHLKw3jkCr04AoyiL91GbGAT1hQ2A6BJ4v4v0xac0vebvhfAK9Chxi
	pD0mgT8DPUyaPOYEKN1Rl878gept2uHDR2zP5jlDlxA1JBwFYWBm+5Aso2iLlJdP
	2peIOH2w3+cFrAI+HsB2t6Ou7Zw/OrJkABabQvjEOtbF/n5KOX0xh+SBfRCb/tu9
	+DK3szZRQHy0SwORlH/BvrXFn/394ht8NVOEpbn1lvthqREzPpr9HzrftPK/CxKk
	ya7i5mcBtdp5bIz7xLmZsg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012019.outbound.protection.outlook.com [52.101.48.19])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh78jbcg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 16:00:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aAkZ+PUaiahUUkVQng8PjzZnQhdBASfWdyZjhmZHiOUfyAuGoxewoylrZLhgz1SCk3+boTIC04nSm7ddPRg25dyFqVAjQrtlaF4MjOeE8k9PnHa5XMMv8r27xNu6Q3oJlwskIDMq0wiIgoLm4OCqHVGhZVb0HAy2Yj2JAGrZpIjs2F1f1loZ3Z51g5qpdmAdfrTaueZn3NAItIoTZwMCgvw8QeAy6WuaT0py1Jr+c2Zk9gNDa+jqJOpUFt3R5qPs40Lx1xoz7H3KXj0tLmtLpTJscVw0Rt4O9ApIPvWaacUYlIU5WcwF9CpkFd1FcdIkdVMF2iEO4Yz0+AihBPtKSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ipUJQlymb7LsVfHv5FEzOss9ZqEz8ZXdGDkGeKekdk=;
 b=aLgdOwVa3nIqTtfp20Qk8OVM35o25x9AF13XtDVZ4lv32MxLldsSuwe8eXGtiiQA2fmDi3D1cjV1KAa7PufnbndgNof6knhWBwDoAyZBoMs9AOWJjOElJBufoqW+6KUBWRP2WvR5+SB1FHcmhbjmulw6O8umSeFXTBWy38UcASbKDAiy/oibJ5nwwm38TR3yaR3sXiTGyYtSYswKtYtk0WSSoXHaggH3XD+zjvftgYaswOqwERIZunwz94X8kP1oD93xQTJgGt4dZSb3V9jpkQbJfwwyfI0pYblZlBOlCZViZ21TU7p3Kz5fmCkv16X2+jYMjg4+/THSDbhr9uP0mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CH0PR11MB5297.namprd11.prod.outlook.com (2603:10b6:610:bc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Fri, 13 Mar
 2026 16:00:07 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9723.006; Fri, 13 Mar 2026
 16:00:07 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        bruce.ashfield@gmail.com
Subject: [PATCH v9 12/14] meta-skeleton: Add rust-out-of-tree-module recipe
Date: Fri, 13 Mar 2026 08:59:18 -0700
Message-ID: <20260313155920.2347101-13-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260313155920.2347101-1-Harish.Sadineni@windriver.com>
References: <20260313155920.2347101-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::21) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CH0PR11MB5297:EE_
X-MS-Office365-Filtering-Correlation-Id: 60069386-da82-4001-0bac-08de81199917
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	7WOiZdsoDWPm0jqvpBhsn6b1t9LotDJJqtdvqIM0hauLBERriA0J5nBjrK2qeMNTjQBSQtT9m1oLlRwK8kSltsqutkgA3ZsnBsQ8eAopA+VvT+ZQrkIdJMz0lT+D7kKjmf8Pq4lnQl2/YIWA6OtSTwTCy2bI4OhCcfW3dUALVOQo24rbV30rJsazGA726ILijshTMdKbhS3d+m5DkyLrYCzqqU6iilAYxcJXzA1OawKUxRWH6dUTO4cjUwOxfdqWpTvfgHll/2EzwVDA98U79Q9x4cM9r7D95x9j4Mmw+epjKGEYzVi35WTT3sWiauFjsH74SO7svTK2w0Kix69dNi7ypr5jMNt5LvE34p+ml01ZBMGgA1FKTNpBVQCA3CGw/vRCiEpfAlsu4gZHOn6kdfPcm0hIx4fCdvpp7WNAlGsauVKI2AWcegjj4UvFEnB9CEcGzRZ60IiGrvm7xRP1s59z4erbzNLx3WVOQ0Wau5mAjlOXPkbxnCzzC4KQ9soqMquoEELh/t052zwjGlbjquvM/25lvQwbtzMKls9cIVpz9KRvR0ve0XF4uNTFpxUzaKIOuXHArwDBtXHHhal/iMrDzjPGQS1DmhmAck2ZqRjOVdllnYaQEgEvboBWs2GJUrDoz325+OtZyaAxWbH7+Ojj1JEuaJIU8sUTG8Zr1wmmuvgHMRB9liby9ytwy9SzjlR2wdNC6xQwm8cHb12/Lt+4sj1thiiHb1FySIsyJh8YWOL6KdC56aE3GkPk9a+c
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SIo3E7VCF9uhD7gjqEGs0RrbjPqGSlZ1A9ufuXcQcy3nCL8J1nq1sxHFmAj4?=
 =?us-ascii?Q?NTQa3EgW71S3WwSTZK6lroWxKN6h37juPEXhSQ/rRnQizNhQdFg79q4nh0cY?=
 =?us-ascii?Q?md7TPJ8py63N2hKo7uOwkcrgwzClOWiBq6Kr0ZqlGs/yzpITO1zkgzq/09eb?=
 =?us-ascii?Q?OfsgzD1QCJxthy+mQRc126YnnARtoJHwQ9m7ahP9eODFuZfm+f2cqMj1SS9l?=
 =?us-ascii?Q?7wOrHrsmBWhuAI9t5qgZ0VZeMXcu9bHP65QLM5jqo9FLm0JIpK3QZAyL9tkO?=
 =?us-ascii?Q?IMGpep2XDc8jH0lnecXRZtbk6r9DI4UbQOCi2lnzg53eywYAKjzdk/4tS1t0?=
 =?us-ascii?Q?xxKWIL9gQsTd5S0xXgeCmKI9BDD9LIgBTUI0xDLHWGaT//f7pWTtuFSMZgMj?=
 =?us-ascii?Q?UKvw8+rtgBXIhvojbpSyg7HqqgdL3Jt63yi9ZO+Gozl2NOIHpQWamcv67nLb?=
 =?us-ascii?Q?zmyWh9m99+khZ8d0XTkd5pp+ZVNvrMEPi3qSzGQYBWgU2ElJHg0phZ+ZKZH4?=
 =?us-ascii?Q?hJM9bvNcRn+WR8rL1JxDu+unqoR7LdXxYwNDXmTe4TD7FRsYlvigrgaTv21E?=
 =?us-ascii?Q?Xhs9GqdIJAyXREC9fZ00Qj5mTpKOLdLq9B/DKEsJpD/bsEZeXMdWpE1QHEJm?=
 =?us-ascii?Q?Fs7w/2Fp8+rLBTme2z0HlSWfee4RhQkZ2HN6+WxuEGIz7n13vamyM9q2V266?=
 =?us-ascii?Q?U9aHckGWwzGo6quuL7/oBOmLaiSPqSIrYf635OnMY65qHZuxgoVwHSTSGYh6?=
 =?us-ascii?Q?FAarDryYVN/MDBHN6GCwA6J7GQ5I6G+AHGKU8DJi7c1nbroDlw4O7DQ0A2Be?=
 =?us-ascii?Q?bJZKwTJFPykBIlv3vdsR+FTC0tZ2CW3OCYkvLoylZaC2MG1uBMLndZW0UvzR?=
 =?us-ascii?Q?0UlkuNn1ORhcVSLDHcDfHX9TIOq+DEA8tm7u7m2I2dgMTaK+UGDnmef7ilLr?=
 =?us-ascii?Q?rYl2h/cRptj70ajtDQqkWS7Iu8950eGL9US479fvmYqsZGcRHGAStb4rlMYG?=
 =?us-ascii?Q?x+SUKXWXeNTuIaHzgFKdefd8nbINFUyKbHJlIRd12Vn/axaD0rEz1YmXMUDI?=
 =?us-ascii?Q?77Ic2h1f9VcjauBn1UIrJWtw702Yebbs7Gj2P5V8+lOTjAfuhXVMJ+pmGB4/?=
 =?us-ascii?Q?G77b4kUgzraZpWZp0YOdbGTAk0LCw+Zvg29nK+tPZojaNvOPRbPhDIUh/Zh2?=
 =?us-ascii?Q?x3Quy1Qo3A4zNKLxRX1WfSp+pzinaDcQzLZco/KeMz+C/Cla10F8tD1t4DJk?=
 =?us-ascii?Q?hhMjzaGmJQt7OijDvzvFC76rCmrUFvLFlpNExQOOSySIgvQCYr0eE5TP1yK9?=
 =?us-ascii?Q?dVJQOdtn4jgrIPll4mMwIiIab/oWPovzTgxJk461MKvXHRnUiJKLGBuAA8RR?=
 =?us-ascii?Q?d122r9CWu3SJoPeYbYI/viSIBrAJu0DRyWdAG8v8IsHWOxU4IXt5Ntq5jSSI?=
 =?us-ascii?Q?rMC1F72S3tUiyMUxAxeE9IGtDX0RzrCoigFdIwx2wSzdWvqEdEKH9uuvrl82?=
 =?us-ascii?Q?GB1TRHAaqMpl5NAmfLRV5TR3hW1kCe7N9Bwq4RbqS0kHqN1pckqYKkotf3Vx?=
 =?us-ascii?Q?YG8z3IrrM0nTuvIca48H35c2u1M6k7unJmVqsjew9vDMy6CH3A3pezmz1em5?=
 =?us-ascii?Q?LJAcbWFMs+LxESndgt+Jwf84STeOlWGuvHa0WVwQYbFlMfIzsdVSqBkEHGmd?=
 =?us-ascii?Q?+TcSb8Kfl/XC9vTKE+QXqWtpm+6MwpTW/29i83yUqV+3DBrusLz1boGHHHst?=
 =?us-ascii?Q?+OdXkQ5DWWQfX9qu95oRcr+LikYg6zs=3D?=
X-Exchange-RoutingPolicyChecked: 
	i1bK56HZ4tMozpYivvDRM2co/xAikeC4h/3R2KBoN1CelXz5t69dJaeQ2kWMdFnzfER2Hmarka8ARa3HNif94djv4kQskL1vEPQDoz8rS0pC9ozTVY2n8xKo5Bl4gKDf+OJ9VEPeJfXv8zaqrhwX6+38m7+ZiD7F7Mrwuoti4vYrnG/gokS3HjKThPya6FxRC+olR9AYYxDujvayEG9VUzVHr+Exi+FeN0fhLwbboYeJ4RpEDoXKBmSQqcBTsSjH4BksoJWXzTouz26Nv2PgQLVxWhv4keEPLG6JyChyE7GYirXkFG22h14/Vl5unsHslCDqNnSu+kmkPVrcac0wCQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60069386-da82-4001-0bac-08de81199917
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:00:07.7084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9meqeN3Vscigso+S3CkTvla05BB3i+qU2tzwTgWou9BBvDEkLeEFGaNL7xQ1HLf2m21Mdz80cf9tKqNLaEh6EUuNa1r9EnEJFlT+yvDh+wo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5297
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ALvEU0hV c=1 sm=1 tr=0 ts=69b4348a cx=c_pps
 a=rwqFklNBBe0PgClOpsUSJg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=ROIJiIjWYnIpTvY2ysEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNyBTYWx0ZWRfX4ZioxrSZjx17
 nxImlxsLpZKHO24fGstFopTOX2y/llhhV/NPG3klDD4SCUou6EaXlQsoLihWd6xta4RpHx6V5QB
 uauNQgeJqUQcWi0wKRdwAFAZtDxIclyABD+dKUs5c5lZderqxdauJBKBAXuIr3AgZs0L/4Jqgz9
 wzNX1P53sKKR9mZf/wQeLe1X9yYOaICa5PfjzJr68OvgEY9u69PtGGwsaNUvyIPFEWcq/NxG8Sx
 RZy2ZpsBKQuXA7rTQo2YnhO4hGB5TYygD5GAttYFNW9nsAjK4AwfeWHV5Oy6d2chTQhoDGl1Fxj
 hT98RJp9qRyZ2gMW0+i2IKOJ5O0tXt4Epz9nWyFTgwQsC7zUq++QNKdaDpxfDHCKiiLJxaRkJOs
 7nW8/+w6kbfIA0v8FPOJ8LuJbbM0s0uRqgMOh5S6UngtWlwuYds9WcwuD7DL37yMO5aZlkOdXsZ
 Je8Yb2Sh1F2PSq+6+YA==
X-Proofpoint-ORIG-GUID: Nv2Fy8sK_osKkGAc8rpzfDXGnwRj5JjK
X-Proofpoint-GUID: 3deQtyPvt7GTxBxSuChvFTjHLOZo3zpN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603130127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 16:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233059

From: Yoann Congal <yoann.congal@smile.fr>

Basic template for an out-of-tree Linux kernel module written in Rust.

Mainly to test Rust integration into the kernel.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../rust-out-of-tree-module_git.bb              | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb

diff --git a/meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb b/meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb
new file mode 100644
index 0000000000..077780a192
--- /dev/null
+++ b/meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Basic template for an out-of-tree Linux kernel module written in Rust"
+HOMEPAGE = "https://github.com/Rust-for-Linux/rust-out-of-tree-module"
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit module-rust
+
+SRC_URI = "git://github.com/Rust-for-Linux/rust-out-of-tree-module.git;protocol=https;branch=main"
+SRCREV = "00b5a8ee2bf53532d115004d7636b61a54f49802"
+UPSTREAM_CHECK_COMMITS = "1"
+
+EXTRA_OEMAKE = "KDIR=${STAGING_KERNEL_DIR}"
+
+# The inherit of module.bbclass will automatically name module packages with
+# "kernel-module-" prefix as required by the oe-core build environment.
+RPROVIDES:${PN} += "kernel-module-rust-out-of-tree"
-- 
2.49.0



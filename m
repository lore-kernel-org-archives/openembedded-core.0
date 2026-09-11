Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B6BC88E4C
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 09:08:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35136.1789117692097306499
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 02:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jZ2lRCEI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=371468ab38=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7mZup1486233
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 09:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=w/c1vEhtk
	1OLJ2u/U9/h2oqLbt11BvPLEYIRrqIQFmA=; b=jZ2lRCEI4Y99/XsJmkIfnvaof
	EfCnksErCRAgBCUzPQ6Zx6AkexhCCvtVt+3gqKx6KbohKgkV6UR5PNGTp6QpnTWI
	1s6mp9HjnpwRc63w/OYxWgqVIUMxCm1XlJ/LAk4m/WAhUt9l+LSp4YvDVF8qWFYT
	YCpOu7f+7H/bp8RxdXhXaYUkm2LUso85s7uJ4DPGkTy289E8g6+Wf9zmmoIxCKPZ
	JjsNhfrINEBBJSVaJz6j1AJcXalCuBNKWxYsYlHgPWGCR2s/zrP+2lTKlhXr2pjf
	ab7gXRXg4KeGWqxtAUquZawYvveJAdrEZYeApzlFuLH0VOz9j2zQtn2oAyE6w==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022078.outbound.protection.outlook.com [52.101.48.78])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gkcypu3w2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 09:08:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+1lqwoQD2J9J0ZCXlTDYS+ZP8L+ycyaMTsLcWsL2fU0U2e0Bslow6RhjKQheWJVanrKv44BwBbCAPuMQvycXAgS14tdsgCDPIUnkVF2j3nNJf1FEb8giLlQ62t9xwjLblbMOiMfW2RyPERXQyIgIAjfds92c69hbsXnEkD+Jmd2aOQLPJwM90LdvbQsiaA1sNznus6lYIfx/tjqOjou86SqQ8Ri5MZUaop82HG2EboAaM5Y+wSwpS6CGXmsmqW/fHuKtKOG8lhzhH+jvFXQarx/PeE6v0a0Qz/phoE2XXqsPEYsKcG5V4acSNSmfXmm5JY1bqHK9Tnabajzxg1qTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/c1vEhtk1OLJ2u/U9/h2oqLbt11BvPLEYIRrqIQFmA=;
 b=By68sasdQRIXZybXDGjMbylxOijab1u4INUTeAhVkxF9FufOVvqye6wx3t/1vpc6/2TCf0p4PkdqNu+6Lo9LAO1NNdYI9ZEElwevsG4ejHepO08uAzHEGvp50FqrTQVouPyRXorwXCU3SnY2h/mtNjXCzhrfvKD/B5uY6dJCgMYCCaAWEQOJdMygsR74+M87Zwn7fb09BXA5HJS/+SS+Tpwtho2b/2ZXBnUayCY31pzZgSpmhzve5hvdzhnMYIpnrnRhXOXCfpNTGg7jxN1/jtdQbvDLyV41AD6mvYa2vUSyJDBhoHdMvQslXJ2Ye66Wu94yUHmR1nm6CUGIxQNoiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB8740.namprd11.prod.outlook.com (2603:10b6:8:1b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 09:08:07 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%3]) with mapi id 15.21.0406.005; Fri, 11 Sep 2026
 09:08:07 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, yoann.congal@smile.fr
Subject: [wrynose][PATCH] kernel-yocto-rust: Add clang toolchain check for riscv64
Date: Fri, 11 Sep 2026 02:07:39 -0700
Message-ID: <20260911090739.914789-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0118.namprd05.prod.outlook.com
 (2603:10b6:a03:334::33) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS0PR11MB8740:EE_
X-MS-Office365-Filtering-Correlation-Id: 485c0edb-3c16-4b7c-b01e-08df0fe431c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|10067099003|6133799003|56012099006|11063799006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	CZpezhXT9PHnX6tDP/K18MPSfVJCK9MpRublBrGenikzhLqKtFp/VMwgUhgfKFVunFpP7702QMIat1CJTkwCU6jUtvVSI5KWakhzLG4zwceJWeCZvzSv0scjPN5Crtswfv9ma6skQYbeiVOj4xEh1jXpWR6sAHN6SWAVSGDZUzOSzzi4MMegzJEvzlvPVtEoqgSRVm5VdxA0duCF+YBSUPNgaVfJKvHXLuabuykUvrd9UT196fqIaGXPgu7xg3MXiy4F8HW5rfKGicDKk3SBN9k0p6k7FNRKQ/pK9NGgZuFlGK/pOMsDsjPLRFX0QKJARjmdQOVvzw1aZt33Yzoccv/R9ze9bmCnQsJpPntrcUHbXR5EWSONNRH91gNZ5DTAGsS8LcaB8+inPHOyqRvoxtEgnHZcCMZgK5yaqI77Or8mElBTfBbRO2fqtHNSxr/YY8WoeEVKY5ei/3IM5MnpUK6SnoH6FGCWjJ0PvWuVk2B072yB7f1aJkdfYjCMeIuJhIjKjHv8mJufE4Dw1CORFWP9Dbac6+zYJjL50UTaMPMWe77bWF5u9eFYNEdCZ0zBKUvrSAn7HezDKpxKN8w17qORXzdMsH44XIjArbCQPKry7ej5TN+5YpXGsaJ7oj9lCiKsOviY3TwC8HTapmGHFk7VJSYfmHHWYGlA4+u/Kzo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(10067099003)(6133799003)(56012099006)(11063799006)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KEBh0werghk9Gl9IvG5lecNkMsgoQnq28tp9TgMd1pqOr8ypnx8+y0/PgHld?=
 =?us-ascii?Q?6t6aXIlCkBpt+Rhsi/9GYYQSZ6ESR/7NEWEguQ/C6r7nssc8HVwzYcpMi/cm?=
 =?us-ascii?Q?Cky+Ek52jfsIhHFRAwWfU2yMBsBXWsmU3CgMjB4zEPa03EcHfN2lHuEgaQ/J?=
 =?us-ascii?Q?M/2ayZI2DXhkET9VlUPzsQpkwKqgrzkseKXEQlHqEbKakNpSSU1Dn8b4C5s6?=
 =?us-ascii?Q?VMr0lE6PaMSFLsJJkWA3c62L0yiI/lvdMrBQ4gvSlNqLzaGPZnL/G2/ydY6/?=
 =?us-ascii?Q?pFDEpNx+M364R06rNIlE4mzG4dTNMbasUIx2uRTxoD+tE+ggYoOq6SyJFrE6?=
 =?us-ascii?Q?UhDmTlbCCu5Hkkeu9drnGbOv1eG3Xwnl+3ozQW9D1LporTlrGdDYoc0TY09p?=
 =?us-ascii?Q?EM0r2H4XPTecd1diSxJmMc2hzPtZdQrvGBDig4iq8jhwmvs0VxKRTLAR6+a8?=
 =?us-ascii?Q?ntVDpEw638JC4t/h5/O2oy8zAsgol661cCpZknQNY3wVMu9hMEK0romGAmAg?=
 =?us-ascii?Q?yBp4jq6H9WsBkgWOx+ECfsPNoeMh9A7MH4VBQhsuD2rHhIhkVJESFi5F4Sn/?=
 =?us-ascii?Q?9p9yFHRHThd4ah4zhJAaaEyU4jS6ns7jczHiw/Z5zJvVfq9/om87yOHxH+Xx?=
 =?us-ascii?Q?PtgVRZBuSLlPvM1qk4jdBjduDMzFhyc7/IpJ3UhOkE3AUL03M6rEJXkBcZBF?=
 =?us-ascii?Q?qzBv4Wq9vNw7O6ctEgUxD1lAveZtYIFzHqyQ64OhtzjPIOLn4/s3bAcNt9fJ?=
 =?us-ascii?Q?UXRAI0DP/H2juQ8FwdbJVb6llkdZz7M21Q35zsaaDwm79slSKOVdPbE5OgLZ?=
 =?us-ascii?Q?eEHNayeCo5VObT39deNs8cmEMqS8jENoShu1Hz7ZLJaay6NdMYI4tNoXqD89?=
 =?us-ascii?Q?OxaG/0nwQu0ZA2N15e4Y0fXN/AvIX5CvfkVj0JozQKQ/0EINmqQXGx4KjXd4?=
 =?us-ascii?Q?hw9BXaSFoM9GslIzCYNLvXxEjtxvReHyctPkvM1uiryas6FhlROipC/V6lrB?=
 =?us-ascii?Q?19a0dOe/xNzunXOFS0UOmwZGf7CuFFRK4AVFOJjsXqunphNL6bwSzRV5SwIx?=
 =?us-ascii?Q?4CdDGI1Ynl/boFvAATEMMggMcsJZ5i3c5xa/zK1hhRdsNbKcaIJCPIKkMDvC?=
 =?us-ascii?Q?JriA/+u6LVWLF/S6qxrHxY9yx1HrLGMo2ycmNTHqG7Xl5Xwu5F3llxmxLCJj?=
 =?us-ascii?Q?wDVitm+05ZYk9eE8FkajwP59edY4I5Ug8BeLEse4xGStvkvFkMai9XUfQV83?=
 =?us-ascii?Q?VvxqmwBMPKc6ORL0Nshf7NeNt5DXRa5o6EupqQ2gUGSKdSBEcoq07dCJREpX?=
 =?us-ascii?Q?tKlELUtfOGIL0V5yDm8v76uG4CvxfmnqmjRvrqrxTGUuhfuW3sxA6zT0zbDF?=
 =?us-ascii?Q?z3hGt4I+CfDimJVsY0G5t4IaqLJ5nEqrlUnnPjj8pGj5jRaZBnbTDM4KSpXx?=
 =?us-ascii?Q?Q581YZ1OXoNhvgXL62XcL7Q2p4drkKhF6THDJIBWh6/7HjwQXSm9NKuZopjj?=
 =?us-ascii?Q?OsiBG/gMkqSx15Oyvg+CHqBE6P5LC2h0ii64tSBoWHMIo6il+oLeJ9apLWhT?=
 =?us-ascii?Q?VmZhlzuK8bruwaaleGGrQf8/HZYCVrnaLv3v00BR/wXDhFIM6MuKgtK7SGNM?=
 =?us-ascii?Q?1mVpFDzcjgiIg4M69v5k7/SQwUXtbYuSPh7Ij++WBxQ1zPW5+uoZglfuZ4Ne?=
 =?us-ascii?Q?rGPdU56jVbQ4dBmhf5dLQJdtW3Se9HbnEar947fonOBU997Hdg1umlVZkX+7?=
 =?us-ascii?Q?6MHkzeveWnjspzJPYZGkq0+wHS6q5OE=3D?=
X-Exchange-RoutingPolicyChecked: 
	LEKlXt1LtPIeTEK+Dq/NV4m8uxWnEWKrbSVtw0mOmxUTtt5EXIIP/Vp2rTfRzuRFnij8aCDCLVBDttE1am90M7ZJpjSh3SehopQJWw5RbctnjTTGLQXbDE7NR0YsDDn9zEV5DV54HjZjLuNUot9FewUAWq2u2ehzTFYbnV8kibyfRkn56+y/UEaop/Ox6t+YXlHBw8PNGYIDIMCT5BE/jwa59l1LWLHWh9+m+61xNuGC4HVzBFflc+OH8zUiak4vJqgnML8MsEbQAq7nsXgfADIU+sHsval1hSU9PdY2Q4BtWMpNGVZt9UgI/Ng344SAn5eNVLmiI2VYERdnGsES0g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 485c0edb-3c16-4b7c-b01e-08df0fe431c5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 09:08:07.2665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4BTFwIUIQHWe7OzUSekr/G9vOpJqGtCoM1EIXen8aRgyxUJ0M2gOSpcj86zE/1f7JrH9SHnCJKW+Q+6oYOLlTkKl5AcBa6+drF6kHqJLLT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8740
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: KPuzhlS4uyZHlsmM-sqBjJmmKxEfZUPR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEyNyBTYWx0ZWRfX1j7J0hMwsFeu
 uiiSTAdmUAFg7kkAY/CGGaJSPNSpH72pPp4yBWTzow6EAUWJlYaAj1bAov5Ub2aPEmC8UI5NTHx
 qiw0diYvZATHJHF0jR95nvbECP4np7EFPCMCZ0xFu5RAL00eEyCV
X-Authority-Analysis: v=2.4 cv=b40ncdGx c=1 sm=1 tr=0 ts=6aa3c4fa cx=c_pps
 a=P9tLxss5Rj+yV0yjlYsIvQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=Q4-j1AaZAAAA:8
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=tqvnW9f2eJNgKHJMwnQA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEyNyBTYWx0ZWRfXykZqTSLcbuTY
 j7cINB9s6yMWn2/OD5fUepHJvHkadbDvC1ECb2hbTmFmjq+B56vMEWQeqKBDTAKt2FMXkmw0V/r
 CB/qmXga678cdVTOe7CZneEou/KNq1LUemi8DgVMBZjyaZAkEkRgPRdchhkb6KsoQORDYYCN0Pt
 iLxc+xWjW4MhzU/UaXcP0MAugu6lDalMD97/n262bYoTeqvELyOcoZFcmsNS1eKgpnbsYF0QuAe
 YO/I03IYUkYcnBIzqEDw/bvs4TwFnwisOkPL3EocbNl0/piAwiBUwT6KKgiTNZF/Leyj1rAChsO
 0ADqwF3Q2b583eUOAJf+XjaSCKiyLslB9626tCrUh7nGxO3zVOZppMBqKiOO7G5F/eoptfwk4og
 8IPnjN6/Q8vZEnBk8RhRix1IZ3+BQVQn4AM8/cjw3AOOmysBHK086WuBMfdaY2riru/QsPcnNl1
 rd247PjlvgJ8vhgk7vQ==
X-Proofpoint-GUID: k0RxxzhRSGbOtjo0BaIOVGcoKTOUvtsW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 09:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245626

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Kernel Rust support on riscv64 requires Clang. Wrynose doesn't
provide a Clang toolchain for kernel builds, but downstream layers
may add this support via a linux-yocto_%.bbappend. Rather than
unconditionally skipping riscv64, check whether a Clang toolchain
is available and only error out with a clear message when it isn't,
so that users with Clang-enabled downstream configurations aren't broken.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto-rust.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes-recipe/kernel-yocto-rust.bbclass
index 49f2bfc1ae..be85002903 100644
--- a/meta/classes-recipe/kernel-yocto-rust.bbclass
+++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
@@ -25,3 +25,13 @@ do_kernel_configme:append () {
 # More details in: https://lists.openembedded.org/g/openembedded-core/message/229336
 # Disable ccache for kernel build if kernel rust support is enabled to workaround this.
 CCACHE_DISABLE ?= "1"
+
+python () {
+    if d.getVar('TARGET_ARCH') == 'riscv64' and d.getVar('TOOLCHAIN') != 'clang':
+        raise bb.parse.SkipRecipe(
+            "Rust support in the kernel on riscv64 requires kernel to be build with clang "
+            "toolchain, but the kernel is built with toolchian '%s'. See "
+            "https://docs.kernel.org/rust/arch-support.html for details."
+            % d.getVar('TOOLCHAIN')
+        )
+}
-- 
2.53.0



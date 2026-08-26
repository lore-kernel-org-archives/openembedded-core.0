Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B021C61DDD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 21:46:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23335.1787780766467885080
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 14:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YtdlksE/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2698f24599=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QKef4k668705
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 14:46:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=2VmIH08WPmFh9RqJ7GxQqVf6zQjX4kwBgtVH+Gtn370=; b=
	YtdlksE/UCRFm+5av453gjc5HcP8Me2OZ7M0ExjWG6ut4mmXYs2qGdN+/9eC5Mxc
	gHaAWuiK0+U41KlAzl8Pav0KPXc6CFJxeSpIX6kWFs+E6yOS6FxUb0Wxq25kTRkW
	5H/ypv9T27nsOJKyi2r+Ta8f5VvKsJApKcDl/L+kAzhwzj2fYtEX8f2B4OqzShWN
	zEDd04Iy/Lie1D4M6gwbP7pWteVQADH3jp41alR+PFpVG70qb6MeJkxkdCzAZEU4
	bCpzLH2sJt4YtuSy5lFV8PESW5mJGGN8nFJYqqz3uLIXtQcK5XfB6kmo7qqjx/DQ
	bL+rlWaQnJQkg+mT0ZnI2w==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022093.outbound.protection.outlook.com [52.101.48.93])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7b9gqa37-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2026 14:46:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPSH4XsfQk7sRBaC0vfkv5O/SIAsVnuomJqga+gjNO268F7Ojz9E2qUmV8LLe7PwwKuy+UfOWfJ8aS5nDrzV8SB5chH+pa9FY/O9l8QZlui1T+Z2NKy23LTvcouUHFpfBciP989ObciA4yYw9slyMqnGu/VfpbNt2XzI8znWGNYKac5YXT9ABKVE4inR2vKtrB67mQaTB8UaSeJRm4STJGv9llp7uOiH//k5EMkWko5obs6EKP7o5V1cceoP+MBQ7wk4qwg9d7G3RPCV+C0HXgqECw1wJLCKTbvVSzcZTIUnUsYjJ+Jnw1q0FThIn7V1oZQqURIfBJhJwJp+lb/sNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2VmIH08WPmFh9RqJ7GxQqVf6zQjX4kwBgtVH+Gtn370=;
 b=Yzk/NeIjIdabC2TJT2hy1UO1uKbIs2CRZsHqJis0l3P+vdtmApukAD6Ok7AIqnT+J9TseB6oqhSnxlJuWC76f0u4i3bA5+yBtIBhxxOGpW3Lx8RbpaQE5D8AMjLQhqliXivNSDkuNH9Za3XCgxeF4a1ZsI3l2eROFMbXLo+VXkWrlI4I4GNogcPaFyDL5IylmEz7wxHXWpe5ah6dVFtgDxAhsMIDj65lbBTsRGan5yfcU9E6bNpsuM7GhcfhtFTFfzISSaZTKwafClG+wc5/Roo57hrNbWn+lRGKMhTuo8tFqlH48QEBmMsCE2jRbDvCkJviRMYxsL56iZjfpit5xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25) by SAWPR11MB9898.namprd11.prod.outlook.com
 (2603:10b6:806:54c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Wed, 26 Aug
 2026 21:46:03 +0000
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b]) by DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b%7]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 21:46:03 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v18 04/16] lib/oe/package.py: Don't redirect stderr
Date: Wed, 26 Aug 2026 14:45:36 -0700
Message-ID: <20260826214548.3002838-5-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
References: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPF5EA507B64:EE_|SAWPR11MB9898:EE_
X-MS-Office365-Filtering-Correlation-Id: ed59f280-4b90-43b8-bc81-08df03bb6d07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|23010399003|56012099006|11063799006|3023799007|10067099003|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Sd9mA4Ath3sWKmwyhm2BH3UBMdNC4GZrfeba8jqJSQPqEVwW9HggJ+LEsOE1OqysS8GHh36qRC0LTZJM0PNvdrsijKwwMaEybR11Nqfc2qdZd+nEjNxqRMqNQ7EA6GzkHG5+CpCBIjZa54Xqj2DNfBwDv1IT0BDmy402iUF63Yg/1lfbd1Gh89iUDakl0VzYnrQMuZYMa8miHB7GyzTGn3w5yeQv9KsRn3+Mjgzd66qSR4PpFgcrBRV6hThs4hje8UaWLSHypSBe5rMoDZvxaWqVOJaXIH1gA1dmVFJ9UP2ehFnHUsl8CD4/tBdrfZ2S6OmxCNlHlDZ0nkEKecwHwTfLeH8K3W4i2I+PCmTEnXnafZOr5RkMygKKwK8i4TXFvH4KCG0YpNEw7mheyJ/hAPydDycncg67TX7BdEjUOosHDKdKxLqA57SdHNR8B7CNTuMOiyJj1ina719eo6X81SKeFCLADfxAfkiZjvLoLQg++YQQpJJ8TcgQCjHFVwdSyxuz+Mo8oTFeP9RgDXFK3JAL8+s13UyoKUJXWy5liOv3P5XrLZJZ8eYSLMnJOE65XjDQo4B+VTTjhCbJq4iFOmnPD/Y+wDi6Z9XYvCYUE/DWP61oU/wqek6KaGStJLtgYsXvFvAT030U/Q1rU5/on8R80U8k05tqXTYcw50Zq6OrrnU8aMp0j0iab7gJZ3oowPKFCskmiSklwLqqk7Ho8WrhB9lV4muqLLfMWg5hsrs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF5EA507B64.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(23010399003)(56012099006)(11063799006)(3023799007)(10067099003)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bk02TT3Ptj90oYNXV5XPet3nh22S9F9oC1QaWcyVlCRRHF8eoONRieq60CO3?=
 =?us-ascii?Q?0ttBNVUMP8AyipS6TU1ds3iqArLap7Acp29x2f9hOwn6hI9Mg1LzjdcuaJNe?=
 =?us-ascii?Q?3rmAen8lqDBTDb+z8CD27iNKTRmnA+nj5fkD8Wy2j1m4KpZAg74FqQUynx3g?=
 =?us-ascii?Q?9Ks51T2CyWZUG47WVDA8dQ80cqfjTAIfLr8yAxaGDtvIQNPoKH9pQkTZFkfl?=
 =?us-ascii?Q?JGOeQo/nZH9F/4YMzK0w4L3MobenMHqmub73+bDGPIOync/SntJMJzrYcF8s?=
 =?us-ascii?Q?Fyf439zcnJndZtb/Yf3XWZ/7CuJe020zB/a0Nr9CGP9DE+6sM2TR+lul4cPR?=
 =?us-ascii?Q?XBCiMYaAJF1FZf2aee87fYt89fBptAcq4NlBmNW6hjM9W2WVYhXOeht+01Dj?=
 =?us-ascii?Q?X+LVm7CrPSuN6IKLd/7b2HuwaKWokfMzymXEkGObqDIKw6LyJP/1GRMEdvBR?=
 =?us-ascii?Q?a6FBYz9PJiawT8Vdu6UiQIUT1UMbwATnzHEkyiFY/7I8BtZXQcCNS3VgoEeM?=
 =?us-ascii?Q?V22Avcrlm7a2YjUOxMa0h6+Hevk0oNl0Qa4gIQ2hUVJYdv2eq7tOpO02qOE1?=
 =?us-ascii?Q?udvrk/gqiRsaGZiwrIQH/e23AKNtLhHXNzslPcx0u2YKzzPItkxcCoLrCFL8?=
 =?us-ascii?Q?Cp8ni6mqteEZDo31g5dSuYwCiRSVzE1Ywj/nKs/oC5t2zZXMMEJT5HliFsV5?=
 =?us-ascii?Q?AAhgEFFho89BJrie42xnTnKvl5dRhKTV0TOYBEUBNV6LXv2rQZ7i/oungdBZ?=
 =?us-ascii?Q?7m54V6AZqW44ZCTif9FbViAH4m4Qax7WotNWPIv2BmkZOOQ5HM9qPJ3c15xC?=
 =?us-ascii?Q?5UN5GxdS59m1C9xeWSQZigCgfKvFONl8xw4A2phqclZyQKqrMQ4qHNz8+vB3?=
 =?us-ascii?Q?ycwrK4Uo95XkCYJKUV6PrpnfiknDaFJ40PEsWH+uZncESZoON11uv7HDpEh+?=
 =?us-ascii?Q?I6kHW1AYd9vIGmXZk4hiVkMayq/EYGB1kwa29GqFgR+dRsefSd4A9Pv9QRml?=
 =?us-ascii?Q?1SVnZdlBKGeQgVzSzGV8AGL7EkOWKKG3+TxT+Hl6LWdYoE5NcD1+X8fmx/9u?=
 =?us-ascii?Q?ONNSnbY7nbSVyNq23DDByE0nt44kfyFHVwVHOIjnPbjUeDuKV7a3Ge1sFjIy?=
 =?us-ascii?Q?L1bE+mc13bFGCANfgpG0VYG1hxwnizNfS4h9pC91p/2Z8gpuV/xdSoJuEdQ8?=
 =?us-ascii?Q?NCJ+5Th5B1VtyLyHd4MVVsPxxaVi9sahBjIgM1dhOrWyVTVNyVatp/pBHGsO?=
 =?us-ascii?Q?zqlo/7dQzrQsYhJhSf9fxEXau0jEx0rt7gdd4kE0L1uj9p11X61AXsUkfvZv?=
 =?us-ascii?Q?FrxfCsTgQSb/dZLsneecX7YKKvTYmqNtNIQ3/HclzJReRDuIfgz+YaUyiUs1?=
 =?us-ascii?Q?5VZw7iK6ne4G8GJZvWcXOcQW+Mz0BTmOJYQGxs0NKluEdJk7ZFot91U9Mm8R?=
 =?us-ascii?Q?CpYuBd6PO/DdnnuVUibADfutgCo3cEqjkHY33mLLXe4eKm12Np1EsuxGHd1L?=
 =?us-ascii?Q?wr3oiUcmWfBMyedsBcRq08oHW9/qllKc/zbweez5lm5R51cUpI5NL9JndhD2?=
 =?us-ascii?Q?XYkwzAUylaraGzQKmstnwxos9o9fTxt9V0GKZXu0cJTJPEBUWf9X1EzCLOPK?=
 =?us-ascii?Q?tW9n/iD8uHdMqUvl2jdGoil9/a7tzFP9ytxwxj2Yi2j34Bxd90jnPttSjLod?=
 =?us-ascii?Q?+4TSyI9OL5FYPkqLryjJx538BsTAjz28JtIUGMFmC6ZTHQx7hsJVa4z/sifn?=
 =?us-ascii?Q?3BT4tRTOTUO7NfyREB1KdwlG2C1FTKg=3D?=
X-Exchange-RoutingPolicyChecked: 
	R7e8tuLpkM1FH2438PAS2YCndj9t8Nr/aF8Ny7xcK7j0RXY+KMDeJiet4eWiPHtU3aeN16IcHHGk24YjocIqkdmfUOdrCb8+q9XLfbkeJmV7+1wjsd3pslqXWWXolZVWxYRQY0+bozHFTOwuM2JTq5VqillYUbQCLPhBv3WSwAYAdLNnWmRdYcFP8zM42hQVIph1YVSt7rGSKR3bg0D0sys4hRZNgSUK5SKBwzG9sD7/73AdeNJmZucb8zMAHDkW1qGWOSbeSEH0XYN4XGsZ2UEMakKnCJ1GAR3flsfp3xdxOWY2ra6l+SP/oMUkFvb+LX+QfqgvUa0XyFD2P2Rd1A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed59f280-4b90-43b8-bc81-08df03bb6d07
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF5EA507B64.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 21:46:03.4708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0LVnL+e99dg6JaX+yfFQIULirjeEpZcq+8IYOIXkJpL+jp+QmGVYTqn+3Kz8aDQyu4Bmg7gA4EVhWPhhCRaXvnDAqjE67y1CDUbh8uk1oDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9898
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: ua3T17uW3Uzie23yVmA_Rf12s43AKWB-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfX+2Dl1WxBMHQS
 7c+sInsT5jXsjn6gcQ3/wpJsWQyhptRG/ww+erLwh8LOQdPJgEKF9kk1mYbmBA6oEcPKW3ZCQo/
 v5OvLE21kR8myTjEvuGWrF7BJKeNXSB1wonE5aqRyRDWleYnwlxWI74GmDdH70LFO+y3rZOzd55
 2qNcwFawjxVnck8hYJCkI2JC3nfbqwLfbrC0Vr4FXbmFfzAswkBfuE+hrYoXkw1LBbIEvi0n7LN
 3XozqW2+9pDiPjUP1bBmCAFza6riM85BMkytJI5VFqC/Ys34foquFHrswP7R2O4ItXJl8Me3OaG
 EdF1GEoEDZD3vaJjYxvJShq1uF+EsI7cQ+LuxMK6B5gyD6Ma7XXETHQBwSv6crP/yx+VwYEKJTU
 VM7mu5QlJTRcY4CJ4AGvhi4R1/pYNCCT0OhyTVK1F5ntiwVq/NovlkU2CcEfD3fus+KQ02tZVQm
 gq2xdpFnu/glHvLrP4A==
X-Authority-Analysis: v=2.4 cv=LtaiDHdc c=1 sm=1 tr=0 ts=6a8f5e9d cx=c_pps
 a=9VIIl2UxNuoJMDRiX/J/iA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=gZyeYKPtWqWysoXHKEgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 6QkbitnSIqj5-1ELH-8F6XcpmZEg5k-M
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfX85OthpHiCJ36
 gvbBuitznuNUu8TXzTMbqKs5UMNhHkPT67mp+PJye2cgRN8CAXBNWECkZMPVWfC4ka3ANivgrmt
 v7stX0BI4nRZwnkR9RniCejCB/79cH80rtLkj11o5uRdOqvS0MOO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_06,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260182
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 21:46:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244420

This can make the debug easier.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 2e348e0a10..ddf5956393 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -277,7 +277,7 @@ def filedeprunner(pkg, pkgfiles, rpmdeps, pkgdest):
 
         return provides, requires
 
-    output = subprocess.check_output(shlex.split(rpmdeps) + pkgfiles, stderr=subprocess.STDOUT).decode("utf-8")
+    output = subprocess.check_output(shlex.split(rpmdeps) + pkgfiles).decode("utf-8")
     provides, requires = process_deps(output, pkg, pkgdest, provides, requires)
 
     return (pkg, provides, requires)


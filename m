Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879A8FD3771
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 06:44:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65315.1772088270589607153
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 22:44:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Im5VscNZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6517627b85=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q6N2ku243499
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 22:44:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=isS6eNZ77wgIDi+a6/oQ
	+s8wCvZIeGJwhXaaDSEzvzc=; b=Im5VscNZloTJdQpvSLPXQz3GIuOshnXYrx+P
	iUwxCcyXX1SXLJfJdP+3cgnNEXP1cWHs44c8hU+QeqA5XPwViB9uDLqiBYDb1Xv0
	FaC6ezxFl61Bjc5UuS2l1ybdpj5Og2Zjz5Y7bzip2VkLGdWtr4yj6+C3MF1LKdRO
	3Z9ggL2phxJRPowWHtFq4cJSu20FsFCEAKK6juA5IxG1Ni6J4KYSq0E2HUNHEjYw
	hHwgPIRGm5SH8DIdLsKBe/Qf3A0bt/p9T/e/Kl+r4xucTbEiTwJb4syc4IlXZU2G
	44yr4y0IpFBCkY4R8SHYVuw1fhVbzba6ZkieesKy8sd3rA2GXw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011062.outbound.protection.outlook.com [40.107.208.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cjdu2r4t8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 22:44:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKv8jLIV/PpncSO2kwZOdOlPWnReLCJoHvfC/z4FpUzu/ch7OQtAuPOhExLduXQOXXeSqj+kZz42qUG3G398933Kjiy9/zhRwWv/JBY8i/6/meo62BvjEKumdNqS/tqf2O8R/X6dniKRPnP/yBdBNyMWUmsYjSgEf+ITQZzmiA+PYPs1CEq4jU1zfVJmQi9N0s8Ae78rFZ4R8N7BmzfoYwozDdM2P0j6Z54S6n9GFFwUVj6KOflB5gf5eLb85AhIO54txaZfbH/M9kzFsyLzWFR1Zfnek8zTA5DcExGVwLqHO/tsDH9DD+C36gDQkCsm/Ebqas85pUPZDdGDzN8X6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isS6eNZ77wgIDi+a6/oQ+s8wCvZIeGJwhXaaDSEzvzc=;
 b=F+0hMkyJVcD546SZEmuxuzd1AxNTpT8UjyZ4DvbZw9MVWd2dxjAjbwfavFVwXDMl+14azFFpXd71OOK4dwUJVxphLuoc8EtfKCnoWHMqoZSrMvtm1K7Rpq+V31bpCsL+qebzleYnySoZ1NicHP8VFFV4zxRket8aee/ju0bpJL9ZsCtCD/UF21klSU+nZNjAVAemN+4+cltOklEUmnDqN++So7oVTv6Ad/aZVMGQfbpS5y3Yqf6JYBhc+dc3L/xTBhlbQVDdk05gXxG2hx6h3DhZisARbdJEqDONLPP2mVyJt55ca3Ed3fsofx1RNwq/pb42p+4yQ1vxsX6Ktlz3hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by IA0PR11MB7259.namprd11.prod.outlook.com (2603:10b6:208:43c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 06:44:27 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 06:44:27 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [meta-xfce][master][PATCH] tumbler: fix segfault on startup when built without any plugins
Date: Thu, 26 Feb 2026 14:44:16 +0800
Message-ID: <20260226064416.778823-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0110.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bb::7) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|IA0PR11MB7259:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c19cfae-3a43-4ed2-9987-08de75027c5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	KyDjJGI53cNdrG7uBm2u+hRe5Ew3I9aM2aC8J/f3uW28pt6Cc1U/ktsB6cT3VHCHqPr9gxIlWigVdGPNzWaYVt7l8hb+99lnBXQrL8kj/TDLI1uaQnmcQg1n8eqOBaQ2b8R2nxfTOTRTMwa3wzx/xeQqcmCqXlBSUfM5T3q9tP0uCFfzKaPDIO1YX2GEpRDxaTEfVLdXkTG+IzuqpyY7h3hlTmVvaVkHFrez9qdp5A6UQt9OGX9W1z8bFkr/mFwMM0kIPMOX8x3xeBXv/Eo61ljPUSxN8vzNHM+IQvEQDTvF3wkKfJNWKZtndcH23V1wnGRFUq9etKfm2Yk/RqQbhWIV+szRZ+VnGMShkLo2OZXzztby62pqOutnd3pG/bYPlGHo3MPjFFpP5ySi4fNDNLAUf89GxEPXDblA4zf3jtB3To645YlV9PC1U4vm+yANB1EF5W4hs4IZ+0xO/sq63s2f0tVaryaznPByBzI549+xQgQxR7SfJSd8aU8lK6mrr/tx7gjNfG3rKebv4f9a4iyTGFL+64MCV7J0LouvKO6F/6iiH4OUrlUtW0H2deeDz6eQT0oS+0u7UOrknMC64fiaRF56cJf5iTzhTGu2W647b7fo4p046DuAhsM8syaqwYyJwrt6Djs0jOk056awSwbC128ASg0ri328azCpEtyxyNaR0DWvOU3XYUgkk8gqrM9vKkVWSTliHhB260z1dHdll2vEpJXhqodr40/z5bU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LUZQhthwBIK8jwYsG/Rj81L3MjNmzrs0I2gKJE5rwECMiumK4RQDtlsJDq8v?=
 =?us-ascii?Q?xwNPK34U1qkeJKvy0an8X3MC4k5G63jnokFuDICWRJxtkPjMvlc7VQUxIPQV?=
 =?us-ascii?Q?4TNjQsK1bPH6+WBMcA/Az4Gu8k+N+YdzfBjy0rsr+oRRDDDafdF53gmJ6/AB?=
 =?us-ascii?Q?5EvY5Vh91oOB6ozDX7Deic64FKePaeglXcbMTkTYriGafKIdwsOwP/aJcvwJ?=
 =?us-ascii?Q?HSfRKBnm0V0JNDmNil965rJdfihkgVJvysx7Zg2tXBPz1fBsGm/hYeezdiVT?=
 =?us-ascii?Q?xnDiXuqpxrcsx63/3GXipvJLEo0G6DFgyZufrQYcWmuRVmoGHxd1EEislsWR?=
 =?us-ascii?Q?XpaAlnEemhyg4V1i9UphuEHeRkf3smW6snIfbvGZklWiA50KSaT1RiGcsXPt?=
 =?us-ascii?Q?TzAfsenJYQdzd4iBJOCHtHP1hsyomsctZmq7fjkCAldtKn3/0D5/Xxacu3AS?=
 =?us-ascii?Q?wVADJKnTGEzAXqKMza5NynUobPs1Euwd/XDsKWyYiPTRAL+HzLYC3mudalw5?=
 =?us-ascii?Q?tOiBw3ynei0bO+JtsX/VxGcAy3dCuN765pyMk7ySGUdX6JgJfFydzUgpktqr?=
 =?us-ascii?Q?FnejyD0J82wD53ZoNHBkeX8UJGfua16CsLLSEKY62tdyR/NBBQbd8AeNkUaE?=
 =?us-ascii?Q?FHXC1BC9O5QBwYI6bTcvwiyEZgDFBk+dfi3pvKGJLT3nitV/XU+JOBTKVT0Z?=
 =?us-ascii?Q?5yEKwIhJMwb9JEZrDYJG8VqrKvJB+tJAPKHKLOb0CjbEqQG59IhJ4hOVgVTu?=
 =?us-ascii?Q?Mv9guTDMt6dzzZiKjHv+HJTIWrvh/o+ZPtuuyVRFG1fspuhdMoqRQEPrJmul?=
 =?us-ascii?Q?stCPbOTGxEARUNF2+UvVZmJWOBMEn1FkklEZ0fMwaeug2WcI0gnDT8SqY6xG?=
 =?us-ascii?Q?T3FwXoGdyoy253P9u75xPdm4qG5K9H1MJBrvq+19WUpG+yAdjR6ThCrP3FuF?=
 =?us-ascii?Q?xcNOJCj98fZJ/6N7FKNX7gmVrygoT+KW1+Nh3BVaEJ4j7AkwXbXhOGW0fF8A?=
 =?us-ascii?Q?SrG1N4HNnsNa9s2SmlYtaZ8expYjIug/z/KdISuPjodPmzzigYz2m4XeWMcC?=
 =?us-ascii?Q?g4gNKkS3lsCw1AKb0mGMtrsk/OYbc5Y+YMwNjRR/D03V1RYd6cAVT8s774ss?=
 =?us-ascii?Q?n4c1FA8l9PNJ6zjmisSpGLxysKKJFgPhJRffJ+pMbv3zyG+pUPzucy1Q6mfl?=
 =?us-ascii?Q?XIL8v6hPCQBL3HgHf4Ps2rLEXr7iCAptESJchwgn9l0+4bGSkOkB9ly1IyQK?=
 =?us-ascii?Q?YWU3bxovqPbu7JZ8MmQNfnxWLxV6kk+pS449YZFAc5DDFDhtLl/yyyoFVSFZ?=
 =?us-ascii?Q?ay+jbBtQzS0/Jplj/7ifnUWLlVb+QGeiSfepm1lKjRN+ywVs/Q1zeRpO/nwz?=
 =?us-ascii?Q?BiAuTyQ72yQRA1GdI4+2QZshqi9Eh0ftYS8oGrviET7XTW13EOBoHWAHG4pX?=
 =?us-ascii?Q?PLHj4KuNPHtw/kX6H5LLIK1hZAXRMK8+Nx+Eu6Kg/xIJqZwYDFN+5tR+IfQS?=
 =?us-ascii?Q?Kh/7o0U3bXhiQ4dIqORQNyee6U9GVPV6T/IAo5VbYUyUJOvnbtQmGmDpA433?=
 =?us-ascii?Q?1xvAGtdhIT5MUDuoNTD1l1qFFnPL4yhBVesijx39CkNX4B9LvHKhUHj5YGFK?=
 =?us-ascii?Q?nmub9BWzRt/XqD93+FhanG2+nfE1jQ/9xV+HVcvaIrqsoTfwyUo8XqChDE/h?=
 =?us-ascii?Q?RH9Zr9KXEx2U8wNdt11IOpLp7sU3rUvQIjpqSJedUsHAXY9XrX+QEplvJDct?=
 =?us-ascii?Q?ZMpYK54KUwQoZWVXaGz72j5cMBo4cw8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c19cfae-3a43-4ed2-9987-08de75027c5b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 06:44:27.2418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gp8961DytB1wWriyVIBrgwb+88f04+iFF+e1PYzoRKPPmtMGTAEnG06v7QvBjfZlyEVjZReYEHNm7BbARn7BjS17yKYA6Kf6dq9HRTtIrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7259
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA1OCBTYWx0ZWRfX8OGZ4HCJXCJ5
 Zz2EX5ld80fbkSjZJDCN0hfDvnpUQC1/VTWqarSLcUqJMxjoAju+6/xD0jXzlR/nrP7jgeGvXCn
 hynWBwBReBTA1+rGWGwdOuaToXILsGtGPk/ecaw5gVrVELb7wfnqzlkrKVn507Se3byOTAOxgEJ
 Ke4C/nAvBwsYfI8HQPnUKfInVnkwYtr6hMugr3SuSomIAuBrhWdD6ZYiNezIQcSkq6yaCXAvV0e
 gjJeJxZtvyTdRi8DAfAehvxkzOWSv1uCeTqJLkZ6/5lQNU9q0VCeBlU904ZbKcefFJjEMsNvE5L
 UYZdPIFFRz/jVAVpUx+sevj7GjBTrEEPtikLit0uMi1as8rnLGKNUwMEFJ/OTr4U0TvbG0UXO+L
 W0T0WaBBq6fMpP+yjOSOoZh0Gp2Po8gmByO/U9ky9PZNwMIwzI8GJEfc5aV1JAU9YaXDZHp6v/I
 MphYwaMwKVMfnTG+amw==
X-Authority-Analysis: v=2.4 cv=WpMm8Nfv c=1 sm=1 tr=0 ts=699febcd cx=c_pps
 a=ZweBVesMg4eTnUcQsPPJdg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=WKbWxAT0ov2a3oS-wuAA:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 1DBofj9RorYQLM-6TeM_59X9Swiyl1xw
X-Proofpoint-GUID: 1DBofj9RorYQLM-6TeM_59X9Swiyl1xw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 06:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231989

From: Zhang Peng <peng.zhang1.cn@windriver.com>

tumbler default build without any plugins. In this situation, when
xfce desktop startup, tumblerd will segfault as following:

```
tumblerd[1138]: segfault at 30 ip 00007fc5dc169fb0 sp 00007ffd03ee3be8 error 4 in libglib-2.0.so.0.8600.3
[aefb0,7fc5dc0da000+a0000] likely on CPU 2 (core 4, socket 0)
```
Backport upstream fix to handle cases where there are no plugins gracefully

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...here-there-are-no-plugins-gracefully.patch | 58 +++++++++++++++++++
 .../recipes-xfce/tumbler/tumbler_4.20.1.bb    |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta-xfce/recipes-xfce/tumbler/files/0001-Handle-cases-where-there-are-no-plugins-gracefully.patch

diff --git a/meta-xfce/recipes-xfce/tumbler/files/0001-Handle-cases-where-there-are-no-plugins-gracefully.patch b/meta-xfce/recipes-xfce/tumbler/files/0001-Handle-cases-where-there-are-no-plugins-gracefully.patch
new file mode 100644
index 0000000000..a4e60f998a
--- /dev/null
+++ b/meta-xfce/recipes-xfce/tumbler/files/0001-Handle-cases-where-there-are-no-plugins-gracefully.patch
@@ -0,0 +1,58 @@
+From 95244ee0d1f3184e2c2cae9d33095dc03829b10e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
+Date: Fri, 20 Feb 2026 17:07:56 +0100
+Subject: [PATCH] Handle cases where there are no plugins gracefully
+
+Not sure it makes much sense to allow the cache plugin not to be built,
+but then again, why not? It could be replaced by a customized
+implementation, and it has always been possible not to build it, so we
+might as well leave it as it is.
+
+Fixes: #109
+(cherry picked from commit b4f4db4bfc1a45f0a405c4516e38394a44c90fcf)
+
+Upstream-Status: Backport [https://gitlab.xfce.org/xfce/tumbler/-/commit/95244ee0d1f3184e2c2cae9d33095dc03829b10e]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ tumbler/tumbler-cache-plugin.c | 5 ++++-
+ tumblerd/tumbler-registry.c    | 7 ++++++-
+ 2 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/tumbler/tumbler-cache-plugin.c b/tumbler/tumbler-cache-plugin.c
+index 50700a3..e308638 100644
+--- a/tumbler/tumbler-cache-plugin.c
++++ b/tumbler/tumbler-cache-plugin.c
+@@ -188,7 +188,10 @@ tumbler_cache_plugin_get_default (void)
+       g_object_add_weak_pointer (G_OBJECT (plugin), (gpointer) &plugin);
+ 
+       if (!g_type_module_use (G_TYPE_MODULE (plugin)))
+-        return NULL;
++        {
++          g_object_unref (plugin);
++          return NULL;
++        }
+     }
+ 
+   return G_TYPE_MODULE (plugin);
+diff --git a/tumblerd/tumbler-registry.c b/tumblerd/tumbler-registry.c
+index 705dbc9..b58e831 100644
+--- a/tumblerd/tumbler-registry.c
++++ b/tumblerd/tumbler-registry.c
+@@ -534,7 +534,12 @@ tumbler_registry_update_supported (TumblerRegistry *registry)
+ 
+   /* abort if there are no thumbnailers */
+   if (thumbnailers == NULL)
+-    return;
++    {
++      /* we need NULL-terminated arrays for the _get_supported() dbus call anyway */
++      registry->uri_schemes = g_new0 (gchar *, 1);
++      registry->mime_types = g_new0 (gchar *, 1);
++      return;
++    }
+ 
+   /* clear visited flag of all thumbnailers */
+   for (lp = thumbnailers; lp != NULL; lp = lp->next)
+-- 
+2.50.0
+
diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.1.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.1.bb
index 7a01882d57..3cbc43fc20 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.1.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.1.bb
@@ -7,6 +7,7 @@ DEPENDS = "xfce4-dev-tools-native libxfce4util"
 
 inherit xfce gtk-doc systemd
 
+SRC_URI += " file://0001-Handle-cases-where-there-are-no-plugins-gracefully.patch"
 SRC_URI[sha256sum] = "87b90df8f30144a292d70889e710c8619d8b8803f0e1db3280a4293367a42eae"
 
 INSANE_SKIP:${PN} = "dev-so"
-- 
2.50.0



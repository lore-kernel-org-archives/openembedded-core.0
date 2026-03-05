Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E705F30938
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 10:55:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41543.1772708103636929455
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 02:55:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=j0Vg5t5L;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=752404d07f=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6255V9og323984
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Mar 2026 10:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=zMEuhuUW1VR2PbI8HTITXn3AAr7jFV0BYyP2C0fpS1Y=; b=j0Vg5t5L+v6r
	cPBxKWXBGBbDz6aHmJ5HeYyJPlviU9xk8ANEX60UR4PSiibYqD/Yd47dNTBWSnNl
	wcsnQzZ51kn7vXuzoYiB3gG/SCJIF1OrC8bGfS48aqhI5wnJwERmp4j+MmtDQbUR
	mBZOomFXTcoazkpqc/d2E8JhYt9FwEsXYKPofRmDjeC2rLLI6fmpAAihbdV0itQF
	pXAgySAHoQHfr74ln2Mwg8BMn7DFKlzyUH/8EhkC/eptsnP6lb0nWVdDPW8AwcDU
	7V/G5ldtHKI9aS0bYL9sl2N45keJxjyBXGs/DMNh5CEbSftLndtU3WRRjXshW2/1
	f6kwU+0wWA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012018.outbound.protection.outlook.com [40.107.209.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvpcw1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 10:55:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L++j0K19kVu7pcq7X2trU7Ol/j5D2HcN6ETNOgSDSssXNBqluGtIcPUlSmelU/VyrevTqh/6tgVbDX1S/96SHBgZeaJNpYZaiARWVSDTIDg3vsOFnCRni4rHw8Q4X0+2J5I0Wp5h2vSUaCZWAg7sYQLqzVLFyv01HhXIa4qin9hlyzQQQ6qmxE58QAyu56NrgrcghKMvlMvt3QtJA+wmw9iDIWksb0hh90GDGaftkY41NwvQAUkPbd8YuSyfwYmPgLH8Gb2PzNf1HdWrOKRUYs9CYQOHXDsrSNmVWftoukF1tv8yZ8lvjGaTlnM0vKj6U4kQsFBIHm6VnNQhuxOJ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMEuhuUW1VR2PbI8HTITXn3AAr7jFV0BYyP2C0fpS1Y=;
 b=FtQeRTsPX6mL32kvJu4BnkRrWT0sdMYaDKsjpjlJ2JotbY5QxtQC30A1RCZ18y6K9rZm6tnh2CDmnRL1REKC5T4arc0FB3Dj8BQgxU5PjscZbdgdZAQmNqQ1ig6gbIo52XAG+5R5RGpyl5+kajS8Nswr75N3eWvgssQZlhmY9TR2OPM1T5UeMzOax3WcsTz9UPymIS9G/3R5LFsiYKwOdjzE776Zy0vvduCWc5ZCLif/5DayJGG2cd9YD/CRpoguusyv/UfJO10wF6NtLlYzLp2GIinf0XRVqhJcXF4xwwWYZgZ4KAmhGJbuWZf9wLf2v3wh9VVg/rJO4xVR1iKQAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SA1PR11MB6822.namprd11.prod.outlook.com (2603:10b6:806:29f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 10:54:58 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 10:54:58 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH V4] lua: upgrade from 5.4.8 to 5.5.0
Date: Thu,  5 Mar 2026 18:54:40 +0800
Message-Id: <20260305105440.3866498-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <FEAC2A3F-4384-4D3C-B9CE-FDA23332604B@arm.com>
References: <FEAC2A3F-4384-4D3C-B9CE-FDA23332604B@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0190.apcprd06.prod.outlook.com (2603:1096:4:1::22)
 To DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SA1PR11MB6822:EE_
X-MS-Office365-Filtering-Correlation-Id: 247786ce-2ddc-4c72-4b57-08de7aa5a47b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	mUT8ENIu8uTaNijnVLeiZUc24jhXXZTfJOZkbmlFOaoiPqi8ac6lLF19MSDvrRyU1BqzPXc8AHdkliT1RaCEgliiVbMJUFzW00gmP9GcQ35hVIMJ9Wdq86qWX80gfK8t560ede0FxFazApBXPqctrD1PBPTUtcK8/qtyAGdISmhvGDpTgZvnqrmeGlnvl9wfakRH6hycdS8NHBI4ZjbIqoQlI0y9bybeQqzwRI/WL/sqcH5R/iHYKSClpVO+jEwDekHGazkgkGUpVwuJrOaJ8d4P+kbOkzGP7odn36cvfSFRMza2jBxEjbF3Imeg93Zxk6GrJnSGIVZcguB49pmgDpML83O3g7Mxw8hT2CqqtsWLipp3jD3pnXdY1O0Dpk2cJMFSqEmfp+g1UXxZ38JoqBqLtdlE0Y5hZhDS25WmZnf6M59CYjH7uVlkHvjqbG+5n8u0K2G7vIDth4WRHtjtB+GC0nknaXi/+OpfxOUWxiQ1RX1phziKOgrXFX388QSpyZcbiS7xGV+ehTzf6xUTMprTYCqUJsdsq0RNGGH1YvmvA5ESibnB/p62mcEn7upO+50QW2+rg0jL+qie53UXG8BNU1pL8+AclamCiztWAxgGyeER/BUhphMAJJgS/k/r6tvqPaAGm2iJdQMEpqAjH9l7Ya4swpJXs8RNGddUfJamfYUuxwtAak6q8Zh3xB8YfQDSn7/cI6M6+E7nYKqCF0OJars6+AcG+aTdRZaMsJ2M5pc+KJuWmWoqP1Q4sNrg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5vvQmBBidiU6mhyubk3B59Yrgx2NAqe7sN42yJHNw45ZTh0lrGtSjSmkuP2I?=
 =?us-ascii?Q?TNyPCFU0Ughlo71RVnFTHiOE4WDyqLCfi5vZ2e//O2g56KUZWxmRVWONNPmS?=
 =?us-ascii?Q?znxjY9v2X9MTS0dU0vj0TwhiII222vhTxKTWSZjsP2bSlXS09Sqqxwb8LuGg?=
 =?us-ascii?Q?13I7mxr3IFgPw8rURJBPoQOdYLvs8pc9eIYUavJdD9ck6HVY6AZ0lA2qPlmt?=
 =?us-ascii?Q?wWdD6/pWAkZGYDogQMqo2iICu+n61spTqVEewHUnfQdbVYy/Dqlm15UEhBfW?=
 =?us-ascii?Q?MlyHWKIGst7441w0oBYOrh8gzJN/O0bcJON1nPmmV+ic2PAbUYgMy0NxGhcw?=
 =?us-ascii?Q?7jlH6gXllFfp53FmxkcV+ndcXxwlhKTeBK3KAF0rV8bo1gSOD7bQVdFgikKt?=
 =?us-ascii?Q?CHOJaWI7H0z2CnaY9Fidb1eNzi2glPRkmoQ7YYTu3xP++dCpBzXVJAz4iStP?=
 =?us-ascii?Q?/FCVJHIIp5LJKOfA5hiNNiTRVIyYLRmCDtx/p4emoCDG6Fj+vrvJINHJxkbl?=
 =?us-ascii?Q?xAm5Log5bFQi+chhGCjEQPrtEep7+GXR3WtE84RByv+90G1A/4vKz3wqnqT/?=
 =?us-ascii?Q?tTPdHw4TlqV+oQwlHqabz1wq/Yx+0r4pma6RFvakUtnY/mEKlsT+TX+WLfYZ?=
 =?us-ascii?Q?sp4gb3Pf7qPdOM4/zPpVSzi3yMExXXxkjOG6163cL3qhQaetJo4Y6/kJyIEF?=
 =?us-ascii?Q?QdIGyNHjRykRSRrgXmBUJckJnUVX3iU3i+AiqJdDnbst8KO/u982dLwH+0uZ?=
 =?us-ascii?Q?XGHPLJfUiNRcqv6Bxh52kdgfPLrZqgwbho4Hxi7FZh6GvhKMAcEAs9ltsvJ4?=
 =?us-ascii?Q?qlaBg8FTt4AbrSEV07Ih98bk6fy9KXNf1qvu4TJkSSZLsXXDsYU1B3hnPzHY?=
 =?us-ascii?Q?7i80EyQc2m4ebnqA+HDRr502xH2AVWwlgfveSoVotzudwBtkMQoBMNVwmKCT?=
 =?us-ascii?Q?uaOIqSk/ZbEgD4bk4l4HEka8/5x4qUI/wgjQi1BvgA+tz5d1xu2fefnGzVAr?=
 =?us-ascii?Q?KOzOWkVbU9Us54XWo0dWxKn4Z7XwH6JaBXB3c6aq006UyWokHJowOMlkNx9D?=
 =?us-ascii?Q?BQfSArGJQsP37itfDefVu7BDYfWh9xktdWCmB4KgHFAWavpXGE7URt7eNgGH?=
 =?us-ascii?Q?s4mVctoQ5mBYjXiSopQFfbYRdrsrJicXpWbPucN9or5W2BY3yVabCGymac2b?=
 =?us-ascii?Q?MOFmRrE6N4ATJ/oiWQ3g+qKWlGSUnaZnk4dunXKfAcBhm2SvhCG90JnVlHx0?=
 =?us-ascii?Q?5JxbiBHvmU/8eyEIyNUUbJ88rxV93JHhlW5J509xbfNSBZvDgLEXPEfKQAdi?=
 =?us-ascii?Q?VW3OOhogzBRQVbvJr1X6Lfny7pMNyqYkn1b6vj5ozJF6cWcFNmv+NRVxmc08?=
 =?us-ascii?Q?h1gcSeRzo7dAUsyegdiBME2ImvU9tL1JmvUaN4VdO9vNV+0XPTznd6T2n98K?=
 =?us-ascii?Q?T8Zorp3SjzgsvKK0x9TiMwFlZyWGdJzFx4jRz7TKXSIDDjxUlEVWUftqIEbb?=
 =?us-ascii?Q?Z0MVRn0fH3kEsB/DFI4kP5IjEe7tlMuOnOl1dYBaKW/YIPBRtA7eH5kPhGHa?=
 =?us-ascii?Q?1PozLIgdKSEwaGegjaXcDU8xL596AIJH+GPIUUA7rCODeOrKERPQvy0wqt0k?=
 =?us-ascii?Q?HEUghNjez5pF8nRaJyJRh3Dr6pljGVCb81sQhH5iAas8JOS5Br8st6F1b0bP?=
 =?us-ascii?Q?T6gSTdRlBTqR7b1m5dPTUGCQlKK9qP19IhZvt6QwNvmkzj6nQiQUa3LicRYa?=
 =?us-ascii?Q?KLRrzLvQucMsxww7S08iYN2XIBBCGJo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 247786ce-2ddc-4c72-4b57-08de7aa5a47b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 10:54:58.3215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5U7C+vVGak7yonbZKuY6A0y0sn6kc+NIoTv5H+16OIsV9dsZRbXMucWiCXOTljm0RNC+HfK44AYDfFzIQJs36euXQ+KUeRJtzvEMcTGL6ec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6822
X-Proofpoint-GUID: gFlOa-a8VJjJxrQAZ690nn2O2OfzD_yQ
X-Proofpoint-ORIG-GUID: gFlOa-a8VJjJxrQAZ690nn2O2OfzD_yQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4OCBTYWx0ZWRfX4jRmt1Cf7Zgj
 MLhg24rW4wVuWpqfJWZ9h+sgVtNaPvL+wWn/L1NCKF3JsrK+2Zw7rVYOAACBEXQWaqOxdWw54cD
 NlESyrBtONNW+4YNcr+jCE5q96xKusDc9PqSl+0l7INi7xegqHvPjHP00NrbWDVK3xyjW3XMuE+
 rcQk/lgBOLPy3zZXrycFOoGCOb7GRCkUhUWrs1oB8+Zw2SdF+Dlc3N8v4Dg5LGVBzBw7s2o0VOk
 pPuUYnQ9O9unavCG/KmcHYZKjzrDQivBp3ZtCvoHeaXm/SR43PfXYRPiC7P5tPfxAtKL3kKOUos
 SSfgIef3tEOVRDHmNWKoAVx/sCMGgR54KMDudE/Q2GBRlblOP2rCiw3oYos3EqvclQjEhetnGLQ
 KCjo/7Wnp5loZTyoLnLVNWVd/y/4F8JNg2gO42dHvw7yjCJO+BUgCFRRlciObJ5sBA3lSq6d0sM
 PVBgcCleEDLP9+QSOMw==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a96106 cx=c_pps
 a=Av3Y+FYNlx8hu8JbWhmVwg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=z_5uEx5cAAAA:8
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=A0KwbV2ZwYRaf63dNn0A:9
 a=JtrFjcrP6MhGCbC1Nd-z:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603050088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 10:55:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232478

From: "Changqing Li via lists.openembedded.org" <changqing.li=windriver.com@lists.openembedded.org>

Changes:
https://www.lua.org/manual/5.5/readme.html#changes

PLATS linux-readline is moved, and readline is changed to load
dynamically, refer [1], keep readline as PACKAGECONFIG to allow user to
remove readline dependency.

Lua use dlopen by default, and LUA_READLINELIB is set to libreadline.so,
but libreadline.so is in the dev package, which will make Lua cannot
load libreadline even when libreadline is installed. Make readline as
build dependency and detect the real libreadline name and set LUA_READLINELIB

[1] https://github.com/lua/lua/commit/366c85564874d560b3608349f752e9e490f9002d
[2] https://github.com/lua/lua/blob/master/lua.c#L520

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../lua/{lua_5.4.8.bb => lua_5.5.0.bb}        | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/lua/{lua_5.4.8.bb => lua_5.5.0.bb} (72%)

diff --git a/meta/recipes-devtools/lua/lua_5.4.8.bb b/meta/recipes-devtools/lua/lua_5.5.0.bb
similarity index 72%
rename from meta/recipes-devtools/lua/lua_5.4.8.bb
rename to meta/recipes-devtools/lua/lua_5.5.0.bb
index 1d37cddeb8..03d4602dfb 100644
--- a/meta/recipes-devtools/lua/lua_5.4.8.bb
+++ b/meta/recipes-devtools/lua/lua_5.5.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Lua is a powerful light-weight programming language designed \
 for extending applications."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=305;endline=326;md5=0e573c143cb6491b41cf02cfbcb8c267"
+LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=299;endline=320;md5=0e573c143cb6491b41cf02cfbcb8c267"
 HOMEPAGE = "http://www.lua.org/"
 
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
@@ -12,24 +12,30 @@ SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
 # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
 PV_testsuites = "${PV}"
 
-SRC_URI[tarballsrc.sha256sum] = "4f18ddae154e793e46eeab727c59ef1c0c0c2b744e7b94219710d76f530629ae"
-SRC_URI[tarballtest.sha256sum] = "9581d5a7c39ffbf29b8ccde2709083c380f7bbddbd968dcb15712d2f2e33f4e5"
+SRC_URI[tarballsrc.sha256sum] = "57ccc32bbbd005cab75bcc52444052535af691789dba2b9016d5c50640d68b3d"
+SRC_URI[tarballtest.sha256sum] = "5e47bbfad7db2965d69580e918ee64edeb8d8d32de404b8dae9ce5c6d76a1472"
 
 inherit pkgconfig binconfig ptest
 
 PACKAGECONFIG ??= "readline"
-PACKAGECONFIG[readline] = ",,readline"
+PACKAGECONFIG[readline] = ",,readline,readline"
 
 TARGET_CC_ARCH += " -fPIC ${LDFLAGS}"
 EXTRA_OEMAKE = "'CC=${CC} -fPIC' 'MYCFLAGS=${CFLAGS} -fPIC' MYLDFLAGS='${LDFLAGS}' 'AR=ar rcD' 'RANLIB=ranlib -D'"
 
+do_configure:prepend:class-target() {
+    libreadline=$(ld --sysroot=${RECIPE_SYSROOT} -lreadline --verbose 2>&1 | grep succeeded | awk '{print $4}')
+    real_libreadline=$(readlink $libreadline)
+    sed -i -e "s/#define LUA_READLINELIB[[:space:]]*\"libreadline.*$/#define LUA_READLINELIB     \"$real_libreadline\"/g" src/luaconf.h
+}
+
 do_configure:prepend() {
     sed -i -e s:/usr/local:${prefix}:g src/luaconf.h
     sed -i -e s:lib/lua/:${baselib}/lua/:g src/luaconf.h
 }
 
 do_compile () {
-    oe_runmake ${@bb.utils.contains('PACKAGECONFIG', 'readline', 'linux-readline', 'linux', d)}
+    oe_runmake linux
 }
 
 do_install () {
@@ -40,13 +46,13 @@ do_install () {
         'INSTALL_MAN=${D}${mandir}/man1' \
         'INSTALL_SHARE=${D}${datadir}/lua' \
         'INSTALL_LIB=${D}${libdir}' \
-        'INSTALL_CMOD=${D}${libdir}/lua/5.4' \
+        'INSTALL_CMOD=${D}${libdir}/lua/5.5' \
         install
     install -d ${D}${libdir}/pkgconfig
 
     sed -e s/@VERSION@/${PV}/ -e s#@LIBDIR@#${libdir}# -e s#@INCLUDEDIR@#${includedir}# ${UNPACKDIR}/lua.pc.in > ${S}/lua.pc
     install -m 0644 ${S}/lua.pc ${D}${libdir}/pkgconfig/
-    rmdir ${D}${datadir}/lua/5.4
+    rmdir ${D}${datadir}/lua/5.*
     rmdir ${D}${datadir}/lua
 }
 
-- 
2.34.1



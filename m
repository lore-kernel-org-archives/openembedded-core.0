Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B2AC61DDE
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 21:46:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23518.1787780766515854025
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 14:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ryZALJcs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2698f24599=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QKlSVg679287
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 14:46:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=AmDvPiC+NnbVFpQxVSEZFhxxvRk7Q1QdqhZ7MAKMOtE=; b=
	ryZALJcsfim36l6ROZkaElP9+6iPTsVo5dujl5QQmPpG/4AaZP5Mbt/U3swhxIaT
	31x5rTXiceLdXx/uoMaiugGuRRBURfSlVlRMcDb30zYva31jF9eEkWkcuSnq/eBe
	Brn5MSpbd/uQDLiNzb6YWWuUfDbApi+MpAV1Jv7liE/C16pPaBQMQm4AWCo6DGVl
	hG3tM1IqI9K5FfUyekMx0TxC8K2cWpopKpbsqva6xqgIvv+mNyCQpHo+brqZLD2H
	ASiIhfjgXvmJh88Omel2DJtNmbfMYSLTiDvr2H+8XbTUU5mcPmGuq4q8p3CIHezo
	5Rfp9RPZn6UvavbFyMiUMw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022093.outbound.protection.outlook.com [52.101.48.93])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7b9gqa37-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2026 14:46:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AM3i+2GQLdv5n/xo5z4x3EV+5vMxbou9mQ+HPkVtvg+kRkfgXZdYoZekyYI+5HhmhmZGUYxJx1lhcF/GppiTgOkjoaoioXiTFob1UGaT2Y01R4Dn0+zrBaq35wjvDUrCgw4qdmQboEwpSt8c70Q4WerLhf1J6rZ9Xzj8dDod1JvDP8wYIbLNfa8IdPWB/SkCXQysqQ4za7MyrgBBNRMBD5SXriJCEOn0filFr8ZKogMO1pTnvyK2Bzq6/ktWkrk2i8xsCKRzmVVQJ7A4MkOewQG/tfQFFshFuXTPIO+VvauZri/LAbS9+3fd9iCyMxe3L0WRCg6/nwxWqLpAs++uYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AmDvPiC+NnbVFpQxVSEZFhxxvRk7Q1QdqhZ7MAKMOtE=;
 b=Z0s+GKNijOuIudjs0epK+T6ERqUfI1vDDtFUosLK0ifNUIQurr32Uvpr8bRNaZoIQntWg4QqXXIH/Bb9iRZhYoX+AHT+3DVQWgj3bOFsnydFVwM5JXb6fSw/NVn8vTXPa3N3QASeTw9Cs+HuRF5T4TPhgbVce1JHxczJC37Kg6X1GBSV8b0ue5srkl4EDqjm6Z/W7+XwhV8DakafwoZCZh4rEcY5RLBHOcM2L79UyOQiA6/vGoAzKe9yf9XAeoeojQjP9OpQwuOikGszvzxItU4DVHidp0khmtv65HCZYRq4QId3RZc335EG+4rFhMezSpmN9463aFJk2sZXgOby1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25) by SAWPR11MB9898.namprd11.prod.outlook.com
 (2603:10b6:806:54c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Wed, 26 Aug
 2026 21:46:02 +0000
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b]) by DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b%7]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 21:46:02 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v18 03/16] lib/oe/package.py: Don't add ldconfig_postinst_fragment for glibc or musl
Date: Wed, 26 Aug 2026 14:45:35 -0700
Message-ID: <20260826214548.3002838-4-sumanth.gavini@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 57090663-daa1-40b7-dcd1-08df03bb6c9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|23010399003|56012099006|11063799006|10067099003|6133799003|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	uqJEJaqWvo6CCl98gF2a+LD3Zz25o77azdIYeDHUKQs4vyl75V7w6X4/m39NoLu3X4Mm1tXLlVwopesy+W7oxZijs8p1+lMXQIXZQclOleEB8z4BoTsdVOsQZi3W4ggS19qrCW8CRnPXqnJvCQplHTiOsyOqZcgsAhrqRib825vh1B9hewJj++PU9xcGDWHipLqRB6GSzfXvzrw+k1BCe7gP/3hVrQ2iPpeBjFbVx655c3mpW1+WMbWy037XNvSQu0uvXYH9pfGYlFYtaKJvlBCzn20K+OTizZ9W4hu8Pifyknh7efdVnC0wytvKVD1SaJo/ptxfM08JSYxY5658yXV021aVq0+nAp/rpR9Hb0HxlkiFgZLTpbqeqNtTedt05ZHt5cRzfIEyozVGmDcoW/x3CA+gxGWzFpP7FkU6zquvS4IYZkmBbAYOFDrH42rwwParImItKcYPD2On3qdBuP6h5asDkDIpZmz6znI8gonleE3vcTLEnfA09CERfjchfYhKlVQapBBacEilZOnoHcmGPvyubMHuqLc5V0W9kqoZm79ovZ1QzTSaVPiZ8k45aixGlE88OujkYAoY16GAGOsEEje0DK20c678O3+f/NdDrsu3P+LhksgIJ0A+LdjTXOXanlGpG9n1fWp7DydKQGHhtZZyvjXWe4LfquGUQ1hD7kkdOvmMhEJv6/sW5PiT2R82wcF3BwMpf41EDkGq6wqsEMwuBCvuPHk+7MXO8yI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF5EA507B64.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(23010399003)(56012099006)(11063799006)(10067099003)(6133799003)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?020V5E6LAX0L5kaZTMLO3NYZe9xqNPqwzZRIBygFl8qlX5G27crKNxNBmBDB?=
 =?us-ascii?Q?cCkrtyUSrMLhCJJbP/Pe3RvLed3Esu4VDX3UsV8+C+v3FKvcRwpzwccoJePL?=
 =?us-ascii?Q?Slx/8OtluL7Y+jFHEx9P3IBKlOlpvB9ecATD7Fb7mIF90Oi4AZjasz660T4G?=
 =?us-ascii?Q?YcinIdPbrJh7XY7+UZ7rZ7hAjzDhpGMCdGMFwgXe3b0yq47bNVwpsVdbxe7M?=
 =?us-ascii?Q?walrRkXt0QJ/Q9anWad2+25L6MDabxHen8KeRZxydOpv1HK0A5mVEbl4qEpY?=
 =?us-ascii?Q?GBnadHx+XSrLo2KXGiDEXroqMD9MZwXmgCcaHJ91isA1v2zHqLAeVqUlEvT1?=
 =?us-ascii?Q?lb0zX2Jj6ImBhV/SYANdDjncTD8gWidNrAJmMTNJd7SvEWxNxGCBdaaLUf4u?=
 =?us-ascii?Q?dVXkqbBt6FzRWo+FjiQPKWN/A56xne6AbG8UN2LMbp44uoGJ1ohxUAXehc1d?=
 =?us-ascii?Q?CIWV8JO6MWADBc9T2v7qsSqaff6AoZ4n0oumKcmWaAueLzOCpRY5cpi7QoIl?=
 =?us-ascii?Q?4ZUAzNV4eJYQqayje38hS/AR75p9wJynwuuw41vuzXfVS1AIBqyCUGcSJsSa?=
 =?us-ascii?Q?fbVEU7x7ulx3J2LtDExHBXersKJKUb4BfEEnpgNPWZ783W4kLx55t4GEKH92?=
 =?us-ascii?Q?GMSNu+Afa5GFZ1qDTibQfO+qI13nX2Gf3CZ3SUVZrx2YKUO7bIXytS4UjBWQ?=
 =?us-ascii?Q?gbP6fAFSd9xz6xbjt5iwiohWMbXhkajVnW1p4ExYqhVLFWrUwKk4njGm5ZoJ?=
 =?us-ascii?Q?Bvg0OAvoO9efo9d1Y3yO2SzRlUvuGZXgyv2adCAqkow4OrlL57GwcdJPsxiB?=
 =?us-ascii?Q?FUo/CwX/BF5mehiNf6N9mFiMxG+1b0QjsOC1kjBGljr7NbMsZaZVYvlK/khM?=
 =?us-ascii?Q?kyUTm8aAG96P6aNa2l6R/uu3Hr6oYOAmSFHhpBwGe4F0+ExrvLkMCB3ojv+b?=
 =?us-ascii?Q?eBkLd1apT4nm0L7C/iu4O+qzr5eQpEXO8TfrXl6IyMgdzGq1tk3OTjr5Rr1k?=
 =?us-ascii?Q?dJOHxLJkdsbWiZsVnd9YeDeeH5nobA39bJPmWyixFTyKNUspCs247xM2aXKC?=
 =?us-ascii?Q?JgCIQPFTvVq3UDYX542b8szaHaWBTYrL7kKd0Sj7hqPAlHgtODNHweVKlvIU?=
 =?us-ascii?Q?1/8m7aw3FrW9mS0TxCr700tGnZFGEg45+jl1vQTquRBqOOh5QRFGNWz8/UlK?=
 =?us-ascii?Q?Z30GAhowYmdoTCxOiJCb+C7Shp8Eyg+z+cWvVoGI/ufAdqzcVq+qvK5ERSsO?=
 =?us-ascii?Q?V1Lf+GfLNDaw0wNxPHgrcHThm2XDc5lamFkaU7UpGXEZsnRyKmtmteit+Erz?=
 =?us-ascii?Q?E3ithZJVOQBGRBLVHscEuG1z+oiAvuY6vbbQu56H0HiZlJ8iEFLO/GyluJFY?=
 =?us-ascii?Q?YD1QEJNp6YsHKz0Po5eR83X1H/OzBdHSDA4hxKrH+7L9Aio4vloyDl04LlIB?=
 =?us-ascii?Q?WgGvh154kv31wHUGWfMH7iPEXwYPiAQhdwdvo827CJ1s44qDgIfZs/G3tcY0?=
 =?us-ascii?Q?7GQO1njYbrL3GUgQ/GLB1K0YdYFo1eHEdhO6n32AyORLi1zpJoE80hT5erjk?=
 =?us-ascii?Q?MddcYJsejBa6MEx50mhMFn0lpqKlO7lCVPI4YF1ztvq/mrpC2qVxjtfMr6cr?=
 =?us-ascii?Q?E9TartC1FaYdjr8rWvNAsL7NjpI56ecIkcC6Cxo2+icPeyWSwnV7acLGnUt7?=
 =?us-ascii?Q?sY9ztKcgH6lm6nwL7ssPCZf/uTFtyKXr2+i6iXMPmC7D1OTlNWKjwA9sEkA5?=
 =?us-ascii?Q?MO/RxrhFrFm+X7tvstdIOCw8Ss+2Y9U=3D?=
X-Exchange-RoutingPolicyChecked: 
	GURRPhMpRABvFeBXTZ5DaoIFQunOKKFrpeTeE8tW264gGZwMF/48mhmKSI0leHIkVH+rcJfp6blZ9o7Xu4ajymo1rVEfQa7zoBFmAz8XneBW2as6QLSwp4jvR8ML8oNBrTBLCK56pQqkcc1vjrzoIBSOSEAHGJm6Jwocrz838BWzguWjod9289b8cqJMb4iLGaEqIg0NDmPf4PH7nTfzodjGtRoSkP/rwemb2qeRCZjbknqMBbFaizWN7SQsbt8h6VT3Xg0/qHSV0uqw1s2qjvu7uz7NCOzWNxR8O6Zx5k9EYHIyHWFOyFikSHTm6CKh+E37CIDya6e05dUZy1L9+g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57090663-daa1-40b7-dcd1-08df03bb6c9c
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF5EA507B64.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 21:46:02.7492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18HHrhnTx2nBN3XPhLF2tfElC+xhk6jWN4iUxLNF7YGl3uKsONYpPxc13YPKfHHdh+x2AyJb3bOvxgaDtjRqMtYzYZl8KeXTINCJkiH4Kng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9898
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: LFT0njuZKO_2gi9LazmQMqjzmeHSplN3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfX5QcGrxcbS1gC
 qSP7N9SgjFmVKDK4A7TqwTity4xUQ98r1q5ImKCZgy9uLX7S6CkcYoyhLW36l2WsuCNQ67JAZYa
 /pCQ04IQuKBIdSNEi9Vvu8tk8ybVBDAimyMMfYmvCSGh4Q0AfE7TuwyyCgkt5BqjA4l7XPunvcV
 mhY6kUNF1I6MrZD86tx2NojnZjXHa8H+NAsTdz7SZkHEMzIOIrsrDSMBpSxODYPo1ABrV+O/Lhq
 iVpoeAGfpJ47a4rx5FYUcbQeYzCOVZjo7cbQTx63S7wxw/rBOsn2XshT84gHc4sg4zwViMMURX4
 fbpLDnxTFWKzyOkwwcXPZLAIGmDOaEaG77xL7vknRDb0ArCJQQEOE3xvo8tQcVOS6yPU7wB+dnx
 1DbB40rBTUaT520yojYrweBQiXOrhIwWRU1wMZEUmqGrqzD0n0iglVUn5FWffLtnxZoI62Xe8Ps
 luLvljYUUpoCcwVKcdQ==
X-Authority-Analysis: v=2.4 cv=LtaiDHdc c=1 sm=1 tr=0 ts=6a8f5e9d cx=c_pps
 a=9VIIl2UxNuoJMDRiX/J/iA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=YcdC0ctDMGJcGoIPl8kA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: cJ2DLGJv6Fw5dtq9sHvrh1cWYQpxziKq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfX8gT6M2hiX+VO
 Wco+sMKpovXBvRBANLDbwq1W5BMicVzLgqGjRNOUyUwRAHl4DwXA42fYMnhq+LRpH/gfhYC4CWB
 Mv1ndd03mbbSaB/Uo1hwp92HuAp7klhSeEx5IE0Q01RUZmZny/ZK
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244421

Fixed:
$ bitbake core-image-full-cmdline:do_testimage
%post(busybox-1.38.0-r0.x86_64_v3): execv(/bin/sh) pid 679
error: failed to exec scriptlet interpreter /bin/sh: No such file or directory

It is because busybox and libc6 depends on each other, busybox' elf files
depends on libc6, and libc6's postin depends on busybox' /bin/sh, the do_rootfs
works well is because dnf-native has set RPM_NO_CHROOT_FOR_SCRIPTS=1, but it
would be failed without it.

In rpm 4.20.1, it let the installed files' Requires win, so it installed
busybox firstly, but in rpm 6.0.1, it let the postin's Requires win since
postin would run immediately after the files are installed, this does make
sense, so it installed busybox (which provides /bin/sh required by libc6'
postin) firstly, then we got the errors. I couldn't find which commit made this
change because a lot of files and functions are refactored during 4.20.1 and
6.0.0 (not .1), I also tried bisect, but failed because a lot of do_patch or
do_configure/do_compile failures for each build.

For libc6's the postin is:

  #!/bin/sh
  if [ x"$D" = "x" ]; then
      if [ -x /sbin/ldconfig ]; then /sbin/ldconfig ; fi
  fi

This doesn't make sense for libc6 since there is no /bin/sh or ldconfig when
libc6 is not ready yet, so just not add ldconfig_postinst_fragment for glibc
to fix the problem.

And also remove the workarounds in oeqa/runtime/cases/dnf.py, they are not
needed any more since the loop dependency is fixed.

Similar to musl.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/lib/oe/package.py                    | 3 ++-
 meta/recipes-core/glibc/glibc-package.inc | 5 +++++
 meta/recipes-core/musl/musl_git.bb        | 4 ++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 4a244ec980..2e348e0a10 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1852,7 +1852,8 @@ def process_shlibs(pkgfiles, d):
                     if s[0] not in shlib_provider:
                         shlib_provider[s[0]] = {}
                     shlib_provider[s[0]][s[1]] = (pkg, pkgver)
-        if needs_ldconfig:
+        if needs_ldconfig and \
+                not bb.utils.to_boolean(d.getVar('SKIP_LDCONFIG_POSTINST_FRAGMENT:%s' % pkg)):
             bb.debug(1, 'adding ldconfig call to postinst for %s' % pkg)
             postinst = d.getVar('pkg_postinst:%s' % pkg)
             if not postinst:
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 3d721d8f69..bea841b047 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -298,6 +298,11 @@ pkg_postinst:nscd () {
 		fi
 	fi
 }
+
+# Avoid loop dependencies between /bin/sh and libc.so.6
+SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} = "1"
+do_package[vardeps] += "SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN}"
+
 CONFFILES:nscd = "${sysconfdir}/nscd.conf"
 
 SYSTEMD_PACKAGES = "nscd"
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 3aec643c40..057113bf16 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -80,4 +80,8 @@ LEAD_SONAME = "libc.so"
 INSANE_SKIP:${PN}-dev = "staticdev"
 INSANE_SKIP:${PN} = "libdir"
 
+# Avoid loop dependencies between /bin/sh and libc.so
+SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} = "1"
+do_package[vardeps] += "SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN}"
+
 UPSTREAM_CHECK_COMMITS = "1"


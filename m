Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22708E77191
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 06:54:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9087.1735282439283866276
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Dec 2024 22:53:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2091c24697=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BR5saeJ025794
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 06:53:58 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nmn8d9rk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 06:53:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbU+N83gRbRvzjoLUBSBVrAZpLbR4gPb/8YCtv0u9XPN9zQZ8u+ASZ/WJgSbMZPBwmZGoHre40Lto8Xf2j3246ARD9bfE259Otvu4QLX9J6vkfGOTiDvrKnvijByhHwxXgr8W1B+C8WU81JkdRwiVMwMmknFfhMlm/Bjg+OoC0+19d2cr6BZPK1Cg/y7giC/q0ah4E3p6quI9OksVL8mPRsHjakQK12tpvg8ayrg6zFjQn/bPdiQwNx8drrL/SN14zNT8u0ZxcfQbmlMoUAltKIwfeqxCkcY1TymhzdK4x/3rYvd+wmb03eylEieZZQRlz/K++KgdXvYukXTRgjahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tV145LeqPXHjEn9w+Ny2bJZfqrs0i1cRSt0QXZcwf2w=;
 b=a+YRxh28PO/QK1T05aAtJlMxJ3aZ1QPSU89PFrSjs29+m9evOxhFK3PDvTtUN1BfTDhSPmQZXecJ8If+7a12j36ejd1M/r55UPJ3of9x9WZOpXFXYFiul4ibZJJL2NaLD+pInw3HE9VJvVPQksRqG2wjYgbB74GLTHhhUV0ta0pD4JsFcExPJ+LJi9e0RTc6zj+aw7wBI8uoDHAFb6kwn6hvpPbCnPrS/ta8e/f9XpVXt/r0gOViiTztrfwiFhCEs4qdv1ZP/WmkSr9EH1d1/cWHz/rNn0wLKFnzByZDF50ext2Dv4bT3od/tYcZWRCH63NwbmnjHfvHlaafaEqJTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS0PR11MB8133.namprd11.prod.outlook.com (2603:10b6:8:15b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Fri, 27 Dec
 2024 06:53:50 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8293.000; Fri, 27 Dec 2024
 06:53:50 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH 1/3] rust-target-config: Update the data layout for x86 and ppc targets.
Date: Thu, 26 Dec 2024 22:53:35 -0800
Message-ID: <20241227065337.1257972-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::24) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS0PR11MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: 76329f8a-b3e0-4574-cc60-08dd26433855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JJQY0wZEew9XxMtrT9mzBKIMbIJN2fE9c8mfd4vyg9tHxDEj/JcxByFWAQmd?=
 =?us-ascii?Q?bX4x7qs4vffJxvuIf9LzBnNItE1MxtWurSTCBJIVSwre8iQLnBn1vTfbmXs1?=
 =?us-ascii?Q?GVNmpg/YGKOQ1EM8v1M67O1bu3BES2hIyTd2I2hdSs+8csYoaUvdGB+YjLPH?=
 =?us-ascii?Q?QP3Kv5noySSdfrzmEN0sKzCG2x30L05Y6BhxjR8A2YFdWgAloOXiQ1AiqGTD?=
 =?us-ascii?Q?pFc4fQ34n+VXkNTIxFApIZnRKHDRNICAabdfviI8qH96oN5fLSCGt9fvZ9qs?=
 =?us-ascii?Q?ynifDP3jrRGuyZT/EQUa4MujK+r7/HXPVSmC0CmSpgx2r2EcxuTZY0yski0H?=
 =?us-ascii?Q?gl6dTvEF7fRIVaaf3sJsKj4OQsdE/X4BBRb1uhkNCGBQ4H7WHbi19YCFlUs1?=
 =?us-ascii?Q?uwanchPtq3UcbdG6O/M9YhU/RU0wQAL69dq5gozG1Qq15yp4iEcuE2FuGSTF?=
 =?us-ascii?Q?pCvYgmqC5DXVScT+RGzegXifPuPKaTzKV+aqEszkEqoif9qLk/ucorP73/Pw?=
 =?us-ascii?Q?rTY/8wif47izyJNiBeYEB77YepJP4os77MPeqmt/tLRz4grjwktcH2HsZl2C?=
 =?us-ascii?Q?WhycArua9b0iUSPFx7Zw3jk7RHl7ubvj1ZUcu577q4wPszKBXP+z30Qvf0si?=
 =?us-ascii?Q?6QIFW8b5IOaMrYQ5yya52OCmO6egn0rIpi1BUolqXjo1jD//Gzw3d/yoSzFI?=
 =?us-ascii?Q?KGPfddfS+9X4OtDthxEkC6RrU+j9vL8qc7mMrne/FsyRADeckOGvLLgV7wp8?=
 =?us-ascii?Q?YtiMWdWdPYQlvIDB++3+HOXEf+KXwQ1Lhx4bgWOBFM1MJJhXSrGyLqvyk8tC?=
 =?us-ascii?Q?NWIN0FjdcXCkJfl78YQN34xyNJoqybdSS8QiaT6IhgrjolFOxx8ecc6KzV/8?=
 =?us-ascii?Q?488Qb8VRSGBxFuBHmVx7mCThsp0NvHuNetyUNFc6ExWpx+N8ZUm6sR4dparo?=
 =?us-ascii?Q?I424flAqLeph0896jFyASPS99sPqlshaeaaIcfM4zXVBzCILoeHJUEBDz0fI?=
 =?us-ascii?Q?W6BeoToeab4EZ+mT+xPcQ5/hrVsmtTn1UMcvrVZXBCwu8+pDTw4mf+4pmed0?=
 =?us-ascii?Q?vKItqTTzwsexZljEI+qmJWnu9LEy23YLQ7Fh1HONVCSmcToUpy4fVq7JBAPT?=
 =?us-ascii?Q?KE5nTvRzabdh6pWlAe6zqaYsyiuNWR991KNokXIivTBmgRI9OpKY/yO0Vm1x?=
 =?us-ascii?Q?gIoYrFwpKsRIuOZuzV+/c409i5XXRn/i29ex1EawahHhc/OHUB1kBA3ThiKd?=
 =?us-ascii?Q?5jz7/LY9wO7h2nwxRdCKEme07ZTXQLEfSvqrTZWVGHtvPGnq2ynWB8UxqIo4?=
 =?us-ascii?Q?o2xf6TxG4RvtQr3CWW63q0Sdp90rNzEY3g3RnJUj4T0efV90BFloNPkpCz1S?=
 =?us-ascii?Q?LGesD6/cvPU9TLXUklXUVGDNAFyodjvvXrdQ7ShMef5yNN0q8qCR33nM36VQ?=
 =?us-ascii?Q?Nadkw9ZSR8i6rxi9DIhce1qDjHHoNtku?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5Y7xzcms/h2Dkkb5V007H2NBfOXbHwimSo+kv9Rq2KEB5pkzNoQp7sVAx51j?=
 =?us-ascii?Q?XTwm1iH6DHs06FLPLBx8cm6YVRvw1iccv0/f4nqBsDHhIiHkUPT2iSaYi3HZ?=
 =?us-ascii?Q?FvgcqrzWQpvSLEo8onk9wcc7tJw57ss6B6vbXVyOPrHuDX50s9rKHBGftpWH?=
 =?us-ascii?Q?Nu8c9ch6tC0hFu7KjLwL1bZz4Am31IChYKmjeF725zUQDdmx86x+5lKfefci?=
 =?us-ascii?Q?yPr3ma5SBTgnWcooi9HUIroqAQkzgK6rpOa2+FmYkMbKu0UeR7vqbX8+KJXw?=
 =?us-ascii?Q?1R1Yjbg4N5G2j576p3sJz6sA23QYCKSeOmGk1n/0h2AxqAmNWePZscSzfhYX?=
 =?us-ascii?Q?d0qh/WrnkHNErukEqxXtWgmkTmhnRMk5DaiYXe3q07ec61TNHiJqfypnVkPH?=
 =?us-ascii?Q?6X2IQtnLZuv/U8vsqs1g3OJ256/aT56iFAEHxSUxogXjSYuX8xggv+7+19LW?=
 =?us-ascii?Q?4QsjMw/ZIoG6gyduLQMKD+9eATGdKMd0EE1m6cJcNvgGY0O+HvRmSV/q+dVK?=
 =?us-ascii?Q?tFzuZO1sLMe43PTNeKXXm69X44e0MYkIf1UvBn5yAHjMW+p1dg/94UUn88Ke?=
 =?us-ascii?Q?+CNo+xkrEnWgF9CwXOjIfBsOeeqZrUpfzgZ4Edg8MPjs8wrFK36yiSiS35Rz?=
 =?us-ascii?Q?BVqPG1gVfHlXvDIMxpRkDyvsojLTXSlZN/zEBlWipU1jXxoPLNHDf+vHtmuM?=
 =?us-ascii?Q?hFFdXzqidd9gFPJXt65oxWzkbrMORdB20feNQ+7PM1/uduNzEPpn3GIXdoV3?=
 =?us-ascii?Q?h6MR4F9Fcgo0gM5E6dDr3RwzASvaydJQBaweN0f8EP1SyfdurvQ+VhTKizMN?=
 =?us-ascii?Q?joL3jVXRgmcOVhOfD+US3mR+Asad8Gjhf0xSFlDgcrC2ifKB9LNEBjDylJAS?=
 =?us-ascii?Q?UECjOjNaTYPOcd49DABv+6QaPuJwJFYgl+gAWGFPL+jYFO4WLuL2Q+S2lU2D?=
 =?us-ascii?Q?Q1PJrHTtjkXgKDU23oUwW7J8pReqJ7xjcqtjdJO+48Bduh7ODcDKN+eemOkB?=
 =?us-ascii?Q?fT/uJzcGSvNQbk/ZwJFvLxbBmFewM1Y2ntRh3Sip08nzs4W2Qo6Lwd6fCyNi?=
 =?us-ascii?Q?14qXEPzLRrlKFErboYcfMCVJtbsOVitpcbbjht4XMXDC6TnoBhcHmelSIv1m?=
 =?us-ascii?Q?Icrw4DjnZDRh+cWfEV31hcAulzENfTHY9manLP63nsLQLPxafDZ+F/Zbnzbn?=
 =?us-ascii?Q?AN7iJ8bffYWgS6aXT8d8Xstk8WK2dJYXVTsAFNbcm3VT2Y2b4h7fN/P9FZ7u?=
 =?us-ascii?Q?rv9NoyVugc4Oi2iIZ9sCzbRAte7OBBPP3gbhH/fHPnkIG8BCqQ4NGXa8BFXc?=
 =?us-ascii?Q?SL5XmdFtA2dPKTB5I9AU5AuQxtDePIUgfAATKAY2ftEjCP+1CkL8WNWE7vGD?=
 =?us-ascii?Q?NapwKjQSRc615jYwexamhHx2cgDsGZ9a1E5a+t9SlrP5+V0aYCxGdbJOq1r1?=
 =?us-ascii?Q?0LmJzKeiwOhOugkGuClDxRsBxxDpazAV/a9/dEL6kxaMQHigF4y41IpJOQ+i?=
 =?us-ascii?Q?GUuZfy4Ng07Mv31Iy15Zsb8mn1lnVQK+34/yajkms9L0ot6d+6C0yHt6LcV6?=
 =?us-ascii?Q?xMmbxGLktTIWu+wEEIrNCK85ogy5g3Hdi0kGEe017LW+uAgJGMCtF+zWF2qV?=
 =?us-ascii?Q?LqlJ4Di1MPETk2BMShY/b/U=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76329f8a-b3e0-4574-cc60-08dd26433855
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2024 06:53:50.6963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QrabREsMTBYp/bg/PGe38OYj8Cc9WPv4IjiTFd0jUUpRxGM1abi9nzxlCPwjgHo61pgCjwIRAl+YKocm26hmuqMTKmopx81fiuacy4UbwC1MR303mV+QsQTPoGB7oAau
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8133
X-Proofpoint-GUID: 1nmweM6WRYyJnEzPEBrJCYVvXRfKMtwQ
X-Proofpoint-ORIG-GUID: 1nmweM6WRYyJnEzPEBrJCYVvXRfKMtwQ
X-Authority-Analysis: v=2.4 cv=CeHy5Krl c=1 sm=1 tr=0 ts=676e4f06 cx=c_pps a=Odf1NfffwWNqZHMsEJ1rEg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=6mtmzNMZVtx1r3RMtMcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-27_02,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=657 spamscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412270058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 06:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209094

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

The data layout for x86 and ppc targets were different in rust from llvm.

-----------------------------------------------------------------------------------------
error: data-layout for target `x86-linux`, `e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128`,
differs from LLVM target's `i686-unknown-linux-gnu` default layout,
`e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i128:128-f64:32:64-f80:32-n8:16:32-S128`

error: data-layout for target `powerpc-linux`, `E-m:e-p:32:32-i64:64-n32`,
differs from LLVM target's `powerpc-unknown-linux-gnu` default layout,
`E-m:e-p:32:32-Fn32-i64:64-n32`
-----------------------------------------------------------------------------------------

Rust commits for updating the data layouts:
x86: https://github.com/rust-lang/rust/commit/dbff90c2a7c751cf9d6843cd585429beb100c17d
ppc: https://github.com/rust-lang/rust/commit/ad7ea8b7e690e6000006b6fde630a2c8c4385019

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 399c13db26..7518e5bc01 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -167,7 +167,7 @@ TARGET_C_INT_WIDTH[x86_64-x32] = "32"
 MAX_ATOMIC_WIDTH[x86_64-x32] = "64"
 
 ## i686-unknown-linux-{gnu, musl}
-DATA_LAYOUT[i686] = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
+DATA_LAYOUT[i686] = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i128:128-f64:32:64-f80:32-n8:16:32-S128"
 TARGET_ENDIAN[i686] = "little"
 TARGET_POINTER_WIDTH[i686] = "32"
 TARGET_C_INT_WIDTH[i686] = "32"
@@ -216,7 +216,7 @@ TARGET_C_INT_WIDTH[mips64el] = "32"
 MAX_ATOMIC_WIDTH[mips64el] = "64"
 
 ## powerpc-unknown-linux-{gnu, musl}
-DATA_LAYOUT[powerpc] = "E-m:e-p:32:32-i64:64-n32"
+DATA_LAYOUT[powerpc] = "E-m:e-p:32:32-Fn32-i64:64-n32"
 TARGET_ENDIAN[powerpc] = "big"
 TARGET_POINTER_WIDTH[powerpc] = "32"
 TARGET_C_INT_WIDTH[powerpc] = "32"
-- 
2.43.0



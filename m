Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3B2CD5BD0
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 13:35:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20550.1779888937868736079
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 06:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KIzY0Ddp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96079a5f83=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RCxt8e3067731
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 13:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=3rmYoDaSDG6qdGHdUpTpEig4gHJIfBihX4aVYUP63hQ=; b=
	KIzY0DdpzvEo4Eu8dqvZOCMIlTNwq8YdNbUhqSTmHtI+cswzpLM/sypD6Jr1kJn9
	ODxtpmxtM4G1bPw/oUHvwQDPRyi+kfc996wUrOR7K2TpnutFh3HPzTk0Kv9YBaex
	6G/wrJrJ5382b140sw6028PcZX4OXgS16XFK41TtXJRAswyV4yG5cjL8TKgbkGg5
	4F5EL2KrC2keW1S18CfXEGwBQNEP3cCZoxDUU6zAMP37PC225ODmxunxQaO5tok4
	ZVMiYglSEnaUB+e0QLuT9qSL8ED8t78jF3mEoYhciScstnTnoNmI/aLvrZn66+Ld
	SSgjJHeJKSkz9ZxisVql1w==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012015.outbound.protection.outlook.com [40.107.209.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb376dytx-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 13:35:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cF1VYxLztWziMWh4Ucxf+MHoL8VnC+UKj3L/H8qdDAl/lV1PMWLS961DxgP+vU4xnwHl5IybV9PGKbt/1FxQRCrr92umJWKifer2lc2iUM79bEzrz3+4qvoMZ2FdwwTdwi8MA0L/og5JPNf3AU9wSTCaTgKKNQ9tK6hYDAIKd4US6RhfHfvITVnwLtD5V8PeE6rmJN4TYkZboi5mnsTyG70ZQMuo6zgcKMDIq/CX1BBFfQ/JuEGQJ9OenCdkr78G/+Qw7Jt759baAUIP+ebxTEFI7oT/d8oPers8LMgYsPxgF17wpBtiEFA1ROGZID1c+uqXCaxlxOkJMT9mPmAuJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rmYoDaSDG6qdGHdUpTpEig4gHJIfBihX4aVYUP63hQ=;
 b=baDuMYu7mpUC1ttStX5/YGMOMtRU5x5gCZydcCGvkw10CprfppdB3+5RbFc/AuUhlt9KVwqKNAa+IeH6WrChTICVvM8b8DDpLSyiuu3GVLQ7fH1LlK1T7KFcN0x9ZhIPFA1xyS6UDDYrmPbjkYts3wUB20Oy+MypjrkM4+z7OLeCaav28Yweiucid2wpnK91ZO5O71RkkG843SaTebHcDcieJBNuR5jy6wPILu3rULvoYVPEgP1P3ozM+TMsOIwFDNa8kLoES41b2qiWRYZCX4U426iuGA97O0UouYht0r9cXLu5XHAkIBRTRylHqsaadZFfnCP3Y8dkMEzAFxfrrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 MW4PR11MB5774.namprd11.prod.outlook.com (2603:10b6:303:182::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 13:35:32 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 13:35:32 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH v5 2/7] gcc-runtime: disable automatic libatomic linking during build
Date: Wed, 27 May 2026 06:35:08 -0700
Message-ID: <20260527133516.2337150-3-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260527133516.2337150-1-Hemanth.KumarMD@windriver.com>
References: <20260527133516.2337150-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0126.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::11) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|MW4PR11MB5774:EE_
X-MS-Office365-Filtering-Correlation-Id: cdcea931-07b7-4290-d083-08debbf4d372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|18002099003|22082099003|38350700014|6133799003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	L+P4swf+xPsw9Jp9+TnpmwZr0NxlocQZ0iAtdjmpWadRYikHs5+vhrpLCFJHMGOBg7MLP8uP99REhMUXAj0NDZWswU9pFeeLQym6TNmruTFGc0Gdz2ze/kq3OP4BzgTLl29WpmquiRGOyGiE0T7IfHh6fljV9EVVYNvFH38y01k5NbycmvLm1Lt2bIxyu3nVhB5/uatL8Z4EQYj8FM6Ht6LjQ8S+D329FkIBb9Mg7ve3FmZXHw/7dOwnZctydQyilkJNnPkgMEqhuFzHlLoK9rP8NetLTisH6Sdvb3BMPM4hzbKzU8cfKdyCmqUgEZtffMJaNhcBVfxdVorolb7m1wLeN3cmYB0OriPdDOD3XsXrjWOFvKVSZL7VmNQ7u5ePvbaQ53bQvVyO4n1qK/6F44sWjIBlQ5Yttm7ZQcVsM0Du7/MMc3ljzAJboRkoT7aM3Clywy6vFe0YcC1RdIZBRtmXXt0+IRP8/wJTuJDtCmI7bVACGRbSzEfHzfzbXK6p2EtnvfZIQ5WLK1QQCGcHr5E0nEZUncm3i4m/lbUw2a094A1BIg/QP2Ky2+cRhnd2I2avP6Bu93vt+E9hwK3QuB/vEgaCM1gMEVs5YmBQmNNZXrP0Edk2reQtraE0EE+uKAXnnvdZEZf0PUWH2KdhsZpdRC5w3Rmdq3D7dXwypNdCfrk2rPvTgxgcjmyhW4ShXW4ydJC8yv2uVMbO0+NFwYyGbuyLAOkV6Fjk5LUFXEQ524JgDvBFE4YE/KkNnonK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(18002099003)(22082099003)(38350700014)(6133799003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/kkobROMbRaMtPcv97pTEzSvILIEq2oomMze14+RD4mgJHyRo1iDZgNtdodk?=
 =?us-ascii?Q?A/EWuSktLKxlKSCQ/oMc83xp2nntH+nY9qNwkuBoA3NfVQaWle7KUCZ+tjtU?=
 =?us-ascii?Q?lnvzP4o4BPf0IKeZpEJOZQx+qnm2gYCn4eGuGbZVgmxN82dLXs4TV0WEZsJT?=
 =?us-ascii?Q?X1inP+n1xiHN4XDZBOYzlU8g9eqyaDcM5IVfQn2Qa3thDX26JhuU1FjSHcCB?=
 =?us-ascii?Q?nu9WaTqBMG/54vFP+XTR4FwWzgmx9Oyv4EhjiWggW49VEEWQqrq4bves9Lh/?=
 =?us-ascii?Q?Hz+FSLVJKE2xouPf/x6CUu6tmpfBP0iljlJmJJ4Vdy/l5JUgwre/lWdagqdy?=
 =?us-ascii?Q?b5MTtmPvNnxGq+FopAtz2SRM6hglB2KG2wHTxGNqmYZWxUI31EGsCGEu/9df?=
 =?us-ascii?Q?XQmQ54Cap6TktzYOKBFH+Sw7TusqHhFzR5JaVHv0fUur45JbK2FbMb39nsvk?=
 =?us-ascii?Q?ct+gc2cYJXo4A9wHNTTgRHtOEcthP8eO4GKUeCTFQlg4w07sQueq0mNjzd8a?=
 =?us-ascii?Q?2fHQekvw5bnRHnm79pwuukaHHN20S0VL3U/G4De1B2wMJ/rjdnhdS7yuf+fe?=
 =?us-ascii?Q?NTOYRFaWVTgaHuyzlSs2xC2eZ0yWRhZ9s1ZkAE9HKKRPyviuE/ai8YkOS/e1?=
 =?us-ascii?Q?9/pWVX4hwfVKYDb1B62/XGD4XK+csjUJ/Otws1l72IpBycHlMM9bSPdDKQ/M?=
 =?us-ascii?Q?ndRFNcupvr0mc87JrDFDR2Ncu+1fCH8PT+5k+87EYiyYcvWU/0+Gct/Houzx?=
 =?us-ascii?Q?GsS/1BhBjLItKkmnTPsU40/lV+EwTCm46VHQlRrGaNAx8Ybog2k/THv4C1wq?=
 =?us-ascii?Q?8s5pgz1ZA/P1hozFzVzUQkwJ4U1/5yIwynFldwq6RYZxY2F7ICa1JYpUtpP6?=
 =?us-ascii?Q?GRlyh+AvazmlEnFPTA1hw2eeaL+UdBYdo9J5xGcWgY7kCwuJMlDWDX43EsTk?=
 =?us-ascii?Q?IaO/qfJQOoJmlqF3Y4n1JIHwR0yTWVCdpDsuGB92ZHv+a9O4gDFDRqQI7Ctx?=
 =?us-ascii?Q?FAQNYuJVhf4OP2EUdVbxHA0VlzOPsYGCUN7jA3MUN9tV7ag7d9SDfyLU5LLv?=
 =?us-ascii?Q?AtaAQwXiArJVnGdLzI6b/K9xBcgLkGwKYwPcFrvYWp5bFPH9E7MYbCn2Uo0W?=
 =?us-ascii?Q?5S1zcsVlOq3kJxCOqbR6qoB+NTHax6Dr8GoeHaaqlisQoyd6Wb2IWDNxswt+?=
 =?us-ascii?Q?G1twKRMkkMajrqpV2zyuZP03arZLCV3/le7xAYm5LAsrAHYN89tQHhHoB2MV?=
 =?us-ascii?Q?1Xu2hVJ320xJn8Cn14ISuc9P9LDWYSiER1diq5kqXgZv0iBVpti7SGD1/VYW?=
 =?us-ascii?Q?7TB4eEpgaqjqNzLp81a6918SMQAA/cBuKCAs39eikep4hgvfnTHolqS7NJYf?=
 =?us-ascii?Q?5tkVcX6TMtG1R5ylrYNb8W3mKLsJJxonZKjOrCrmtjg+BjwK8C8qEtwwigtl?=
 =?us-ascii?Q?Uh+v4YqMJnWau3EBrD5YpDKz8RwVMzKP1muuDasfABdmZx5JA3cij+YRx255?=
 =?us-ascii?Q?/LXtzRylfo+XVA9XoUCzM/UCh40EfA9x88wVr0wRgUQ8h/2p0K5a6OpPZ93F?=
 =?us-ascii?Q?60R0wcGMFw+BxFb1l7R8On7bcCzQ4zqWigmnVy6C0PH3Hj9jAdo6bMfxFZNf?=
 =?us-ascii?Q?t5CncMiUxuip+Jzb3cEeHOt2sA0VLWmoOsL9xJhELc0EaX8I6tIJVDDKwyF6?=
 =?us-ascii?Q?WHD0TVENJ2SR5zxjnl31MGu9WLeFrK1gWGW2MriTEPivmV+mbHGYkrnNtK3m?=
 =?us-ascii?Q?qhYAhL/ux2jK8CGZ6OmNXLQ02HhpgRw=3D?=
X-Exchange-RoutingPolicyChecked: 
	n5REGZRgARsjc/3pZ/1+cOzo94U80k9laMpAGh8Y2dJ8QapW8QTGFF3UUqWIJ5K53nf8pWLW8xQlh19zJnkGe7pWxzBygC0DicwounYpHakXQ6ExdU23CMrVxuxzIGIdc9HHcOz/NecDLpVviZ2kZ791zRzn1tE7oFuu/vullPJ6S/vdOE/2wo9igygTzqktAxJfZZ4v2VaMlyVKwpfs8ZNF0BNjP3j+xeMhU0rWVyOJHNVfDABf9DMZMh4N2O41ielv6zf/0pRRmIP1er2lqn+rkYOAonFoqDvXiTdQYNbyBsIoZojVVGLB6NM1x6dunj9uJu0ftXeCbvV5o7iZDw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdcea931-07b7-4290-d083-08debbf4d372
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 13:35:32.8635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ytr4z8+27d/aSCwuSQNHKqpSzCJ6e5AyIrORaSelxFIz4gloie8EpRqhwIGW+KdC6b9eJClZuMQ0JkwV1MgKAxiASR6CldOJ97r+hCbFfZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5774
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEzMyBTYWx0ZWRfXymj9gQhs3Bwe
 UPh/sI/Brk7JFZejWTZS86r4gqjVi7yGLoaq7iQAdLEODyOIo68pWspG8Bw454Gs5+oZLsml+xz
 W4b7pV4A8UjFiNCErWE88BTFGreYP5HhR3AQf99UntRYScufOohQ74P2D7aD8I0ZnVYYu3BlnSb
 05YXcs8xNdDveivavNoG/CTfSQVn+VFtan8PwREKtcvIViV7iKKuixUGagBvxgOnhCgwXQaTfP+
 n/+k2Ptam5/qIQboxN42RnjHeikD7yH1hYwkEvXzb8dAUpxEKndi3ecsR1FTz8KyrgyELWbfPIz
 QPLP+xF0DWgXE8Vx4dYsnyXnOPOrYVQQv5HrsaFRCj0y+VEuio4NULQIEhBkfL7VKchrfPNfI8c
 +/4EV59Jm+o2e2oz3T/oR7ct2mEWsu3GK3byv1nhTNthM0kz91sb7HoR6I6iNkC4vYVGaSnGICA
 3C5Uo8UvPv7i8i3SXUA==
X-Authority-Analysis: v=2.4 cv=M5B97Sws c=1 sm=1 tr=0 ts=6a16f328 cx=c_pps
 a=YvmT30J82QCmV9938MlLOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=0SpPGjiuViyywlX_MzsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Vzzct8PE0yhPrgWCcBqAYA5gytgyNLvd
X-Proofpoint-ORIG-GUID: Vzzct8PE0yhPrgWCcBqAYA5gytgyNLvd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 13:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237663

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

GCC 16 introduced -flink-libatomic which automatically injects
-latomic_asneeded into link commands via LINK_LIBATOMIC_SPEC.
During gcc-runtime do_compile, OE uses a pre-built GCC 16
cross-compiler to build target runtime libraries before libatomic
itself is ready.

Link: https://github.com/gcc-mirror/gcc/commit/e63cf4b130b86dd7dde1bf499d3d40faca10ea2e

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index ef38cff58a..d975153bc2 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -15,6 +15,9 @@ EXTRA_OECONF_PATHS = "\
     --with-build-sysroot=${STAGING_DIR_TARGET} \
 "
 
+TARGET_CC_ARCH += "-fno-link-libatomic"
+SDK_CC_ARCH += "-fno-link-libatomic"
+
 EXTRA_OECONF:append:linuxstdbase = " --enable-clocale=gnu"
 EXTRA_OECONF:append = " --cache-file=${B}/config.cache"
 EXTRA_OECONF:append:libc-newlib = " --with-newlib --with-target-subdir"
-- 
2.49.0



Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE62EFCE30
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 17:44:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24438.1772646251672499626
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 09:44:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nepEZlb2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7523672f62=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624CaY0n2997411
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Mar 2026 09:44:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=hwbC0TIV0vfI5t8zGgyUK0z3dc2FUHMVweK//UYKigQ=; b=
	nepEZlb2v1lr1zWZuY7FhJQnsHhJ0AqzBYbkQNOVT8XUN/fxb4YcmZggXXqP0tQ7
	+nu9fjmMMZLgZzSWgtsbysDCYmL1AYfmsobQyTDIZ6KmAGzYyYvWDeO367g7DxFm
	/4a6OpSWqh1vNe+/EXnk62Yap5gGesNxWC+tvSemz2IZBFVfN23n5QosFupTNTY3
	u3jft3z3WfqqQNeTTjJeJhnjT9tEBSx3An3LoVndhnJdDg09qvSTrjc0RNje/gzc
	jWx2/EgSdkoUEK6SB2nhatfkgqz1PZ/LU2iXR9ydEPMdArBU5IPXxpBtwau9+knz
	YTqCPeBGb/A4hTJYr3Xy9g==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011015.outbound.protection.outlook.com [40.93.194.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cm0rgmxvb-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 09:44:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sm71C0teIRAuop/3Ez2qghbWAIkcmA6sr46B5i9Q/dojzg+lrbxoWCB9ynqkqiGZyzO9ULbiERImJMltn2tDGrEG6nYyLKC/QyhW7eDcO4vBZFjRUEorsOGmwk/wZJWzxsWLxQ0qxlQTSwTSX0j9+Q/OASU8Ee2nBs9xX76ZM1t2zsaBq7fOYicmT4aWFvEm0qZZYP2gVarWJO2K6bHTCPhPLQa9NdOKdweWR5755vH+elHMfSN4jRj8slUSdkFqyAwlrAeTcpD5aDW8jJFMTkI+EwV0nabxr2XAs9EnVs9wxynlRNfgPjEkFBkbGlF8QueDvGPT1vVZOsIlxmL2QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hwbC0TIV0vfI5t8zGgyUK0z3dc2FUHMVweK//UYKigQ=;
 b=S2fP9tvZFHijcyHMP7UMWRr6RzPVDGFyEloe2XidZzwSZ8i9J1vRAbeHsE1IjcFBpzM+KqqDkeNwpQf3i9uEh72LDJG/9KFmi//Wtth5eNiaeLxIJ5+i/DbMH5pLmFEPurjXy4UPb+RflYJW8ZuaAnbyA8inRkpxICaCYHEle21oUWLDg6dWW+KgsSpBusclK5MaEmeSsUK8SDv8njS8JRRnDiAv2KwdYKpLCmZ3COPzWd/AvZWBCfPDOGKE0Chd9O6lR+9EfZ8LXwKGKjBI5j3JY8jTtKgB6W1qA2uOM5R9aSz+TPkIX70U9HbjAxxKgmBsSWuodnnxyDwG0Qrr/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB8100.namprd11.prod.outlook.com (2603:10b6:208:445::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 17:44:09 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 17:44:09 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        paul@pbarker.dev, yoann.congal@smile.fr
Subject: [PATCH v7 04/14] linux-yocto: enable Rust support in kernel configuration
Date: Wed,  4 Mar 2026 09:43:14 -0800
Message-ID: <20260304174324.1186644-5-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
References: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0158.namprd05.prod.outlook.com
 (2603:10b6:a03:339::13) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA1PR11MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f3e888f-cf7a-48ad-36cf-08de7a15a3d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	n4Fi/RiD1+x9llvWIc2LwbIzKSIsmCpdSkFFua/TU8889TOjZWVwBq8fGVeZCRpG2JEBuyRvjAmmcSMkh7ZkpPfz3OdkthdCbaZ/BSgCiHrDlYueY5GsgzJCQmI/+XORGaG2LUd3XMW1CQMX4Z5EAedcvsc/aLs+XvpwJsxRXANIlmsMzsgw+Of2KHsEX+PUSRzJby2rxFzZvDYlM5B1XITcpv78nRwViYX5/HZCsCgJQOwYt73WNZHGT6UYAiHCH2mCohz+vISC97NtfEBWvVhRD8+R2NIQtShjSvqblhnNraT39QmediJhvhbK+/MfnXTDjDdr+fn4wi7DTNP56O8/NcICJm9ge3EzBzDbutdDk0VT51am07fCiNIaLPkZVGCleaY3e0BSKwBz5lyk3VF3A1XOtY5gz7J2GQB0PhLcnUbMMcVtr67CymEb3h2Jgp1cYP4LK4o9Xdm6uei6X2ndK9kFeSyAX6xOhB+mn5Ysc5SQW6kDl4niBi0Zu01MTXKl39k03MRWw1Ot6T+cZa7MYKHTvSBPx0bFw2FgSwepMM10jm6NH3m6jkg53goPTe1EjpLje/HgmR7W+FtD5X2S8V+XtJpiLfZXZj3iHUaOUUFuKI3n4wBX5EIWxbKqYATFtS3Cq0i9qhIAzQn6dvKxuSa+A2juc1XsJ8g8VZ1EAAbBwGDMigKGMgVCLZuWUEP9BjWcXNJJXV6VfyOsUdVbrmDKtVcYMwAdc4WUscMt7t9D76cgRhKwi7FXcNGHtgJ1i2Y6ji5Uz5EQo/EdWu7OR6Tw2D0XZz3fTdG1/A8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?E++CoDiqqdaBzCDoVry8OhtwtaRCnn9I6f8Oa5JWFY2cV78adfW6IHJVi0aa?=
 =?us-ascii?Q?+kBtUln9WP5NcejbggAmwlIOtTQyIjiYUIyCP40+ecZA+UlVzb3M4h+zkX02?=
 =?us-ascii?Q?PVi5Z9lK4H8o3c0Zvn0eOmahDyyiOfxp+5GuBBNVeoeNRTjBDWavHFCMK83e?=
 =?us-ascii?Q?VrkbV1HIXQF4kcOdMf0gSfSMIqdMuhS2t4Kip6MYjl4p9H650EKPNg72UYLY?=
 =?us-ascii?Q?4cF0+LaBTu/KTlqloWfDFzyQU5KUlEuAMFQnh/S6Np4uhyHCtOlIQwOkBz4/?=
 =?us-ascii?Q?RjOda0A64jU5aB3RZNy3vc8M6dWjaXpzjVOaIxGTfNzKaYiGRFcWAMQzGnif?=
 =?us-ascii?Q?Q2yBCT3fC7btgHs50992rtSJ/mUT6X+S5ECFZ2g0J7VkWfCR0fK1ZjoJvd62?=
 =?us-ascii?Q?3TZvjc+sag+W33lFtPlPnF/wAALrzns/c4W2gTlMPqdLxU0F2RToE2lerzdW?=
 =?us-ascii?Q?UC1T/2gAOD+XhV4xakpATZe7QaSjqROBaMggI6/rz0RuCJ/bwVDs/pZLuJBC?=
 =?us-ascii?Q?B8+vyzNKF2jrex9m8Y9TlRo03EJxThOQ6q5WjWHnnhjLfD84l49J/aHKptNP?=
 =?us-ascii?Q?WKNtRQPhJI30lb57PNdj0cu3N9RHuWR+71+Zl++Bzj/rtxHOWyNTwfCoPSib?=
 =?us-ascii?Q?7hqcCHDiV4IViXm5cyvxAsxhJI3yyYVoEl3FE3pfm0i7+QQPVhxBf/V2D9uX?=
 =?us-ascii?Q?5UGyEJvZ7wna0I5GPZB6R4BIuS52IgT6SmfCnsivO8uiaFc5/yAXLiH50/oW?=
 =?us-ascii?Q?EKp1Rrdm7j4ySrCXdBA66Uc33iHfOeQ3DppLcvXLKP8aivzxE2+eLhqwgG51?=
 =?us-ascii?Q?kTyPHrlU6BpGGvQ7KG6rge5+Slua9ufdGQmUXjuiFGmuGkH+YhDGGV+lhpFU?=
 =?us-ascii?Q?wKyow9vu8lWnhtKcpdFsi0Hg/m33B2WMkzgsFcfoVkBX4xAZvtvGzTfVcqVq?=
 =?us-ascii?Q?IKivnI/Lzw14YdnqTNAjT0FPaNlS3xRLO1FD7uuLs2kzPj8JIR3BrQfyLx+U?=
 =?us-ascii?Q?oNaA4b+iMU1csHLeuugE2KLBq+j8CwJ8LPgWP0BVavXL/ZR0EtEBV9VWVtQk?=
 =?us-ascii?Q?KUfHdMD89pw1eoIdoRnAPcPk9sBh/8MtbgOJMN44YqYgtd1J+p9aJqkVDkrd?=
 =?us-ascii?Q?VwOwR4h+pBS78CbugYjsIU62/XHdKDO0iom0Mod1e38BiZOpUd4zFL6GQVQ1?=
 =?us-ascii?Q?2+Rnn3jDv9wgVZ1mdq7Ji5TaFFy1S1qxK+hP9nuzI/1l3PB3om1oPqdn6qH8?=
 =?us-ascii?Q?quOGZhpvtA3LZOj6XdlYipQ1ppXMWB+C/obO4NTnWhaNU8hoiRFQDvUm7nvX?=
 =?us-ascii?Q?ZoFM2JxiLbXtmtweh04x9CIpwxKYS/RyWy2TOcJZY3GIevgUY3jf0rxkGy+s?=
 =?us-ascii?Q?qhinQruIxf5gumrNIO+IAWTcNOg2idCDxSDWEuaj4Kd4P7mFwEuMTGWlVoq4?=
 =?us-ascii?Q?awMqUGqD0qJRVePsZxs2og5oE6hyYRufowVmuhWMLO313eNpU5DpJMh4PZkY?=
 =?us-ascii?Q?MgMA1+x1dGWBcJAZxlrajEwa1/xPBwNdk7mBibjFAxp4s5I5AoPcgMD7E3HY?=
 =?us-ascii?Q?aWa2RudQIg8adWNF0zD7isxS/WCBfPYahnY8XPoWZJcqZg7yt2g7JFvShXJN?=
 =?us-ascii?Q?Q8cxRulS4Q7qn7eDiaiSzsefDv5V7XLrUFidaDNpfPULRQnRTwKv8w7xTFvH?=
 =?us-ascii?Q?cT47RcKcKUNWisHZ7YBCTqsqWkIeg1BXj3vdMSpLf8B3XioIftr8DunI6zDL?=
 =?us-ascii?Q?mEtadaQGNrvER00CXnPNCjdWGQ19E5Q=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f3e888f-cf7a-48ad-36cf-08de7a15a3d2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:44:09.5874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0GCjzY/0YpXCRUoBd8tHuIOWNsH3nIzsY0hTKQ8wKcHFLhfFAYnRVeWi4kLpYou4XfZpfWC4BQQV0OjZmFiRPurzCnjHg4nUUaSyQejlZsw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8100
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: -JrAqyWz8__q2a7nVay6IVN3FzrMrGIB
X-Authority-Analysis: v=2.4 cv=Of+VzxTY c=1 sm=1 tr=0 ts=69a86f6b cx=c_pps
 a=awRqKgK+okXhs1gjjWqUCg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=jmWgeBySreYrfzyKUjkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: -LM9HZno0hwlvYQxXsf1FflBFTUmd7kP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NCBTYWx0ZWRfX1xSG8OCAh+qx
 W8JeQWZvrPoFgGJE6UZ76j7ZYRFJiv/Fso3P+x8q346hW9GFduI0QnAFJ1F7DEwhdLg2D7jR9qy
 0IYk/Ofz/uL/54ExCfGZwEu46t73EXaDBjn60e7+t4PrLRhCGzpjiDF0aolXL92LbIcCDPPXmsG
 JdY/RjnI7U3bEZ0HzlFR3hEdyYtZ38khs2CqUOI2fntuib+EORJFfrWsLIn+aOws/7haYMTWJms
 dsj+coCn0fpGn5HRW9cmLgeyKmsM0w7D3Simh56NgkK2a8+hCFkYM+BW2y+p2zzU+W4XwkwT3e7
 Ea+cZNlCmod5tZBUtP3xTgQgdOyuiK0T3EgIDg6vHAvQ1cOSOhfAG5HrmPaeV2WUbuBb2qtekuU
 OOXBd2W8u+2X2g/Xp+7uP00XzZ5+ozgtfjyTWm7X2M4ueVvCeWoGLcECOUuzLMQjW1kP84Z3Go0
 7qcl6iiD/xuL50BZjvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040144
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 17:44:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232420

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add support for building the Linux kernel with Rust enabled:

- Update `linux-yocto_${PV}.bb` to:
  - Append `features/kernel-rust/kernel-rust.scc` to `KERNEL_FEATURES`.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index cc3831f798..fee97748d9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -77,3 +77,4 @@ KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
 # Check again during next major version upgrade
 KERNEL_FEATURES:remove:riscv32 = "features/debug/debug-kernel.scc"
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
+KERNEL_FEATURES:append = " ${@bb.utils.contains('KERNEL_RUST_SUPPORT', 'True', ' features/kernel-rust/kernel-rust.scc', '', d)}"
-- 
2.49.0



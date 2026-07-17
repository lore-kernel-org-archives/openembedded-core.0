Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3485FC44523
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 21:33:11 +0000 (UTC)
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com [205.220.161.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.96.1784323988398931305
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 14:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@keysight.com header.s=ppfeb2020 header.b=iOYp757U;
 dkim=pass header.i=@keysight.com header.s=selector1 header.b=SXmfDm8c;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: keysight.com, ip: 205.220.161.93, mailfrom: john.ripple@keysight.com)
Received: from pps.filterd (m0187212.ppops.net [127.0.0.1])
	by mx0b-003cac01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HLWl1P2855073
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 14:33:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfeb2020; bh=
	BWWsER/kwfPrEcsGmnNyqFw6OymwiyPT60cmW0uoOMc=; b=iOYp757UGXJZV5M6
	PDd6NGk8V26ybJ9rIle+o6QWnEZo0JAkqU/P+jKyqtHs7HXhm5ytxJ1twEA+emTC
	d16FFQXFOlvJudBTmMY29WE2yIyNdzh6wbIizLNBbM1hdKN0iszpWQ5BMHMd0bRu
	5fcXwK644xahGpVpIDez8OLCBiI+PQ+JhUHCTaL/tz9c5gKzjN0VaHgcvPzCoMi8
	jK1KeHvks5E4ynYWcKWRed0XpvPT+vYTuXiHmMTGUeQm87xcj6rlT9qhkwtobyy0
	2PR2BNzgREE9E9+qXhqzfQo2yUz2Mcd4sclRkph3SnMWJcOPoo1jGI859yc2ByD0
	18Sd0g==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010008.outbound.protection.outlook.com [52.101.46.8])
	by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 4ffgmwac26-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 14:33:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6HFJDWtzj/3IPiuDz+d7XDPbSuUQhAdFcZp/THM+4IVsuVuEVkG1s0YnPdn7dv0yyWgJeMPBeTW0jQ8ELbw8GPUz1Qb9IiYK47osLzR92y708rFhg7XhKv2/dq5ekAHebaYiYU+zpPqyXvpja4FN0MBIVcdQ1cprqMkzrHgz+yNNAo2PH4u2DmBxTNh3Q8SfxZZ8jsm8IHNfh6Ejg8SpZnF0Y1XD/7n9XTnPgtogSK1YKpJj6TXyRUj1PGd+0uW0ArLfy123Ts6Hn7Rm9x23FJ7woeGJypHG+OiY9nKsqiGAWNbH76Dzk8suVXqGVF+8MTbOKeXHTll2fIHMrHJzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWWsER/kwfPrEcsGmnNyqFw6OymwiyPT60cmW0uoOMc=;
 b=juB1WZkHnuP57Wf/pEJySjLIoSO58rEGOuObGoulW8aXC0L9LE9e3vki7xZWiTzgSjpeJTqi2lSRJlj8YX54+/69ir4UdTFaVFdzPLJPZiupUkLsde1WORam+LVFwsCJfhLRx+EAwmMz5XmzHOGc6s9P8py2BRB7xxRPbzOu/WEQAMBktAEzX7uPBzfQtnlTRDXZ2JEZ2l2VShU3qwns45k856T1jmegQ/v1ymCRjxWvt96FME8ffuQaV4vQJJ8A6ZL3FB0k4hLfQKoIsRde3halxRZzWCN1ZmwJGSU5E030MrTGd2V4eEvpWVzcJHFk8is3ttydpZcwUsnkHF7kOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWWsER/kwfPrEcsGmnNyqFw6OymwiyPT60cmW0uoOMc=;
 b=SXmfDm8c+YMlUE4rD1RYKxkgDnWccDLoprzAgn9l+Cd3OqsYMR9az5XRr+uH6rP37+kgZdClkfhUFRHg6tLSxCPmekvvy3FW2Wzjnofg7s8KoXj18Qhtk3jSMA+z5mgQXhjvurNIxpPErAz/0QZeJ4KokoJYWGXtBTeW6QSzPE4=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by PH7PR17MB6034.namprd17.prod.outlook.com (2603:10b6:510:1fe::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 21:33:03 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2%3]) with mapi id 15.21.0223.012; Fri, 17 Jul 2026
 21:33:03 +0000
From: John Ripple <john.ripple@keysight.com>
To: openembedded-core@lists.openembedded.org
Cc: John Ripple <john.ripple@keysight.com>
Subject: [meta][PATCH v3 3/3] go-vendor.bbclass: Run vendor_unlink task under fakeroot
Date: Fri, 17 Jul 2026 15:32:51 -0600
Message-ID: <20260717213253.3454786-4-john.ripple@keysight.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260717213253.3454786-1-john.ripple@keysight.com>
References: <20260717213253.3454786-1-john.ripple@keysight.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY3P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:fb::15) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|PH7PR17MB6034:EE_
X-MS-Office365-Filtering-Correlation-Id: 3144e48a-ac75-4324-8890-08dee44afbb2
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|11063799006|56012099006|10067099003|18002099003|55112099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	b8Nqpn139jiz4DUwhQo6HtaZLfS00Hq7NbbEa/Yb/w1jTZ17K+ukevMwwsdHBTzwLDha4tQ3zUXE12NhoFvtuS59xTEsLpzgaD4OpyZ+h3vNqW+kL6rc+pEi7qvFg9Ppy0y6s2jgDaRiAOuiWz0GtyL/4i3POObTbFh45ANZ/v0K5uWQpeoWuCkUqaeeZqrrKXkF4Cuh8mAtuu2DFsAvVdCf5OayZLRVlrAqaHXwfjPer7TSsz/al4yXUXnzz3xGgmvrseEcPW9MQw5aCP8PL+sDisMJEHJlh8Q9O2olZBkEmrflQpe5y22eBvUjctGZUT3AsU70tmOE8JlyMvJePM+dPXLFai06VCOdAnO2GG8eHLPDAbYYFdaBFbdYb2zabaCMWDoMKVteHTIHYurOL1uzCwffC2PXDSlYdpwrM8R6IKHb4N1TPEAmIY6u6eDUDTmrNnz/iXN92Zgcpj3d7+E+Mpiv3Gp4VwMhX994wybh2TPtB438TLu27s9ueNRPJRcDec3rapPsg/WFNXG0m45IfXdbT0gRmG1Ezq4U9gUzhRLzOL3Ob7y2H7BZ/TmwS4vx+c3cRBIw1Ulbh5XE9KOaVjmhxX0DA6ciWUHOZzCWewJigCdkHbrDQo4kkD/RzwbtaqSiCDUaj3E8kOq+HXmCDbSQhTFHQBrdlmhRQpk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR17MB6130.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(11063799006)(56012099006)(10067099003)(18002099003)(55112099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pTQEgkjy2dBXWxy2U+TYanWXWeARkTNXz2dlCU5+Tr2efC/42gGK0uUdaR9N?=
 =?us-ascii?Q?CH4imcyjsPBtCHjBMrAbswNT2fz1DbnwsB5eeUQIy9zo9gJXYZJyGzAjXgEg?=
 =?us-ascii?Q?OsbD31coz3bOQ9TGh0e3hKm4IWmV/kd153V72oswNjg3nUQnP9SENkBge4Yr?=
 =?us-ascii?Q?C7IZ7xGuewtdFSDuzCTwC+qCi94X0eDOqOllO8KgAHjN57ZINIWUv4eb9KE6?=
 =?us-ascii?Q?zczLjMA3LNHniAek/0OW2FRi4lABVhaI/KwvGNkGSPlZflGo5PCqGoXmL2WX?=
 =?us-ascii?Q?QwLMwRyQ9Bg/vC9cNqdZZMyuv12IwuDfK74h+OW+LSWrUmTG16AS+ItQAP3d?=
 =?us-ascii?Q?CJqOxqCOh4iTXRrVPsdEl+SrGp8TWFQhVTZOci8T/ZsFemwozcZLGWyCpkbm?=
 =?us-ascii?Q?GFcii3IAKSdcVCMrgLRgsVRPltvsy7tC3ym0W8ShsUeiTumzCp4RhBj+34p4?=
 =?us-ascii?Q?TjM9d62SodLNYHALuvfClYJCNJc0qiC8YTu28Jca8KzT7cfNteKTGp3lnLtb?=
 =?us-ascii?Q?TLjApYLE0ClUa/OzOWH76dOdpB0Q70FmHy0WMU+5GYM2KRtX/g3KUMTdp9Cq?=
 =?us-ascii?Q?nP7yQmIXlMHZr9mELyPWXGfHR4EEyzs3u0OKGdrSVL/EK3G5I6Yj/9qLbapK?=
 =?us-ascii?Q?ZhbS4/lVYalt12mebQx3d8XFWDtlm3XASHDa42oZHmn78Mn/sxIr/sIgLra1?=
 =?us-ascii?Q?pms4nW2WfIYFm20HG7bRMJObCFFa4d6S4hr2pkN1AmqEM71IidnrdCeF28Rj?=
 =?us-ascii?Q?LKOuu0SiUE9tN4ker6S3Z1mdTg42Vh4t/jQR+qPi2rHFo67AsH5q8PaAOrIi?=
 =?us-ascii?Q?jcUg5UzuhFqqQyii5RNWy5VJGNH4RmblFknoj6ievFOc1l107081zd2UaKQh?=
 =?us-ascii?Q?z8jxUH++nNR6lYaXeh8pw5GP7exk50kn71VxwWKoot4DRjExqRxPU7TtJ+rO?=
 =?us-ascii?Q?IFugZyKcNUcgNrWUiealDRrJpba7zld6Vle8YnU64ta4HfTaruNtrKkP/lWq?=
 =?us-ascii?Q?flQBgfBTiONrWEiw2O9OPAAmoVdouwU30wotTeGk4y0ZtZCnMwyrtcvp+9NK?=
 =?us-ascii?Q?IkAsmNIfyJmgEpNBWXxYjJCuIxjvAVIbXG4IK7FNcYYm39NnzY+hKkNWCr2h?=
 =?us-ascii?Q?dyWUPYpUroakBH6Aeew4lnIxwJA7eT7jJy4d67dYVRbU7RAs263cZSrcptWI?=
 =?us-ascii?Q?CGYqpQcTJ7yVC3zD2OogqT3hu9ug0T1hwDWLTQMsANdowJJLCguJukqr2fnc?=
 =?us-ascii?Q?zU3gXVjJabCyMsyVUGQ1N2RA0oG7oi8QHXwK69lecARsdnJ62YdKJ9gxm/3z?=
 =?us-ascii?Q?3EWRjpGy3sQYUUUW8TBokKApSob0io3prAifZeTMOorAUUKnynWNAofbBfop?=
 =?us-ascii?Q?gpYNgcOwMs1SfNbDYdyC4c2PktgZtdbtlkz1vnfhPJojBaDDuAegFRjW+cWY?=
 =?us-ascii?Q?/Rfxmfvmaskb8eFl41g9sq3XvigBzK0ZJTKUNxVtWNuzJSEv4vzwARI9RBBY?=
 =?us-ascii?Q?L7+wK203A0t4G3HX3cj1zGHjX393ulm3mrqbxvyvJdtJ4GASepnKkxQ/KBXy?=
 =?us-ascii?Q?v81oG+0ppOmqqwI4RvlT03rx00LICSh+EYtMnpCFybV/yCWwrh5Vz7QCuWE/?=
 =?us-ascii?Q?8pkIYiENujHyxrtDHiA0KQYBkIDhrrv0ugMGTI4rus94GtFF7i4cWxH8GuGh?=
 =?us-ascii?Q?Cwl8pLgsANQpIBi/JZPXGB0cNR6NNp160TzczQmEEYnjJS3WPQyGLZTDSFI3?=
 =?us-ascii?Q?nR/NkQ/Vpg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	Dd3jmj7kUrshgzngAcjseqgISv11kEVPL1ilq/YPVFN9yZCN/q27xjgcT2iNjzV/VSU8yOdbHsVpb3FkSgD8HjbWbfpnZ8sozUbUcSl5MrBBRXugAX4njYJvkRyiBS/tYHDeIZ045NHaiGDunqWHG9rH6Yt2v/ghcUjiAPKhiO5pg7JER4tzndCB+/9pUHBZz82KLwnytsa5B/Ot4oFO/k6tCwJsp0TRiyFkD6yXf8HIqut7vbTy+cD/GC8bU8HKOCFq7tkfsA21MO77Ft6V+8EScDKooSNN4EK+xYJCXZ+gQX+ChJbOhGMiMPxnQv9ZJRr2QIf6k4OhLWF0wY6Lfw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	ynshR3ukL3JKZplW3Nn2p71TOjmUA6yalYzqNkqPF0teX3/86qqcmDLL1OqZC7df6BVrNjqS268jG8BnQMcQqVOMCCL6rMpC/4OVH5Z87hZSepH7nUKNTp72tMhkkedKj/kuBtTu6Ca8vY7/p8YAe8SfTTKDlMAShms5a7ycX7aL/DRxed69du4PC7KFbNP5QnWUCsD/laDIq/0tngXFTEWnp/ybHHuaE5G4mg+22uhvOCUbNdV5hSWL3zh5427kP0UgnVRuQdVodo3+P6YyoqPO2nsXvm4r1CDJ4jS2+DYHtHzayIAgxi5PEFN3JZpDOnJzh1wrT3eKVztzybH3rqKzWaXCQAUOwIB4io74ygrDtW/3yDFWY3hUHCp5LPDRjvOUqF2hud8bIvtp2bMth7iIqUSSOZ/WnSBlan33moR73aINEwrxLNPl6eqFWq84PRDKBg5Nuf7UIB+lFo9i3uGPM6oUmhbg2wMQiAOSCfdUNrvlhjzeOYabDGJGe1TAB0ojB2z5EiBsX4JuFNsT3+Y1iaevHxMwuSjj5dGA6JxRY13JUdPc5ZB3/eQMiHQDlaxbMKsYGQUPCc0Iz2nlliDpFDQXns9XsUkuF5jIQlRx4KbhP25MGFHNmY041Yx2
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3144e48a-ac75-4324-8890-08dee44afbb2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 21:33:03.5805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RRaIO05b1nhbMLJQJw+q6XugyZxOqmWRXzQYNCsm0OVA+2iAWIPLbTg146qROdWOlFTEbbGHyLb8YN4ObCQ0bnPtOPpkT+ZipOxJlicSdic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR17MB6034
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIyMiBTYWx0ZWRfX7xgMyxRrgbXL
 YMvXswpaExPAA9DXg2dg0Lqx9CAsCoOINbGwQk51VnuLF5kgR2RRYp/1jPWJavMbDeOjRMSrj+Z
 OnOG3aVt9hRHzixFrCDjHANfRmXam0LcrkgWeWYDr3w4nF3+QzcAWF9fAJM5Fpk0dxqMGahuZIM
 6QOrBF4NcZqzsc+gmt8Y/VfRjTvX3CSjA7rXzfCxyKNwwyTfXNQJ5VqxxNpICB3gWo48RUkzX4a
 XuSG/EqxOg5O4JH97cKSKr0lh4y7YqgIH115rP/ormE5yEsXnRV84/SICgBSz/PvmKEYv6Hyilh
 oFdPd0qTDnoHr3KdM96ayL6kO8pivASYxnELq37BogmpoJ/ymXaroNiEzlLF9hN/RbSX6eodLn+
 peZvXBsOsbeg+LYEbw8kAPxLWreidx32KT/LSi7AvKxeGcQBG8kt+uiwudFfV40iLdsLSBaedcu
 TaxG8E3GLRjaiyLJbKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIyMiBTYWx0ZWRfXzqpcuC1O/H1f
 d7p6vHn4yWHAAhPxxkPS5ppH8CH0z1dYrmbVavueQasxx9HhshcDPhriIcXC3YF2s4kliaAlFuR
 DxA/x1XJWXDxb4fLeH1lAvsy/hzgp4/2YsFtuEntW9fMX6u2jT35
X-Proofpoint-ORIG-GUID: BCfA0rjwKiWO-RZpMXf0T-HX4adZtK_i
X-Proofpoint-GUID: BCfA0rjwKiWO-RZpMXf0T-HX4adZtK_i
X-Authority-Analysis: v=2.4 cv=JeiMa0KV c=1 sm=1 tr=0 ts=6a5a9f93 cx=c_pps
 a=BRu7lVsKyHj15bVqb/Fc8Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=vu2TTH8h0NUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FLoIbiw2ZNY34kqd41oa:22 a=at2XMroQgvxonBsO-bql:22
 a=F6MVbVVLAAAA:8 a=Yyp9YMqRlRMKTZWmAgcA:9 a=6mxfPxaA-CAxv1z-Kq-J:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11849
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170222
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 21:33:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241225

do_install and do_package both run under fakeroot (pseudo), which keeps
pseudo's ownership/inode database in sync with what is actually on disk
under D. do_vendor_unlink runs between them but was never marked
fakeroot, so its os.unlink() of the vendor symlink happened outside of
pseudo's view: the file disappeared from disk but pseudo's database
still held a stale record for that path/inode.

The next fakeroot task to touch that path (do_package) then finds the
on-disk state and pseudo's database disagreeing, and pseudo aborts with
"path mismatch" / "inode mismatch" errors, failing do_package.

Mark do_vendor_unlink fakeroot, matching do_install and do_package, so
its filesystem operations are tracked by pseudo consistently.

Signed-off-by: John Ripple <john.ripple@keysight.com>
---
 meta/classes/go-vendor.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclass
index 85a3c1b586..5bb4e8e876 100644
--- a/meta/classes/go-vendor.bbclass
+++ b/meta/classes/go-vendor.bbclass
@@ -40,13 +40,14 @@ def go_src_uri(repo, version, path=None, subdir=None, \
 
     return src_uri
 
-python do_vendor_unlink() {
+fakeroot python do_vendor_unlink() {
     go_import = d.getVar('GO_IMPORT')
     linkname = os.path.join(d.getVar('D') + d.getVar('libdir'), 'go', 'src', go_import, 'vendor')
     if os.path.islink(linkname):
         os.unlink(linkname)
 }
 
+do_vendor_unlink[depends] += "virtual/fakeroot-native:do_populate_sysroot"
 addtask vendor_unlink before do_package after do_install
 
 python do_go_vendor() {


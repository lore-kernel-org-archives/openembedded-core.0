Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D26ED41177
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 11:42:53 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33820.1768477363033402283
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 03:42:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=RhU2vnK5;
 spf=pass (domain: cherry.de, ip: 40.107.159.58, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ys8xeNwlQaeIkxMUIvTZFurfRPI9XBaGCaRcbR+fxFZjLYCki3TF+Q9Jrl8WUxA3p1HiSzZs5Ramhvrd9RxiTfm1FroKb2sDBoJZL0Tqofz1BsFs9IRDtyb6v25gEKhC0RJ65U9ppp9TuoM76ACS0VuFDjIE2nlmp8jqu7QcMfww5N0Ek2wmWT0qlwE2J3Jouo1yimxEHU4sDzyx+s6NL1DD3YF1Yaf4LvgteUtwCeBk3r2UVAp1u1wTjTieG8aEoklk2+8U/U1XwugSkjyxpsJJoVuz/PCyEHPnX85hDWQNsqinBHx0H+TLrAYsl2C8NN7T/9wxvqkCOs8pmM5b+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hI0CKQofJmmYdCMxdEk08iRfDW6vx9iPgAbVioz/yMU=;
 b=ELqQM4tbEEVQi3W0GjU3WvZyByr69oU4YJj4a8WIV/PlKY2QaH2TxlyefzwRCgNZz7vJ6DSZ2KGlq/I9HL/W81eRmZPBJltUjGBOSftibwCh9fAx8oXg+jJC8Mvc76QlNWcApZKaZwYacyXYS/lXij+j/WrqSHpv50o02Kr6k6tRhbxlQikDQI1hN0cRa8ZWvoT0ZUQtAAnd64CzRgKGaqHZHIJEriEwDQAW4C8fElSx5VbyTeMUDSdKvbGSNO/N4rQsTpWy53ORK/lifeG+VzUditxOewC9dNoBCYIitrHupD6B3bgqrnkjcnAdsihtQicSc1rtaCZx4mUhDIWKMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hI0CKQofJmmYdCMxdEk08iRfDW6vx9iPgAbVioz/yMU=;
 b=RhU2vnK53k0Y0HiVTXyiXYncpU4bqI8TrOJJzs02nv/SqxWRt8J6GdjrcldsvQ2NPpvHY+cUh4impsm9vjm5l6sXMZPVyhAgEmkYexFRaXgCf7c7ECEiaeT5uyUxsIwk4BVcEH5bhFO0truMThQKSzO2hU8FH6BmR2OAfiRAzY4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA6PR04MB11778.eurprd04.prod.outlook.com (2603:10a6:102:525::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 11:42:38 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 11:42:38 +0000
Message-ID: <990802a1-6bd8-4f8c-b461-cbf21346e516@cherry.de>
Date: Thu, 15 Jan 2026 12:42:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v1 2/2] mesa-gl: fix QA issue in do_package
To: joaomarcos.costa@bootlin.com, openembedded-core@lists.openembedded.org
CC: thomas.petazzoni@bootlin.com, thomas.perrot@bootlin.com,
 raj.khem@gmail.com
References: <20260109123232.1199822-1-joaomarcos.costa@bootlin.com>
 <20260109123232.1199822-3-joaomarcos.costa@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260109123232.1199822-3-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0259.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::18) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA6PR04MB11778:EE_
X-MS-Office365-Filtering-Correlation-Id: 91aca646-c249-49d8-a150-08de542b2f52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?97tia/B9MYpyLaPnQz+BLNutZJvJ1xK3bvKtmUo7+5VQ0Rrivy/88vc5L9a3?=
 =?us-ascii?Q?NEd3UBKJU2N4WHm82hXOKDs2apSQckm7jd59quvfEoJg5vDt0IavAIwbMmoD?=
 =?us-ascii?Q?A0ABRtJloLSrvUwIut9OJsQYxfnyuuwPXodTPv/WLSpuJX0dhqEq6cir68i7?=
 =?us-ascii?Q?lmafR4WKfDa4ulHdhVIJlpahBRgKWYQQP+1qUVte+EKOwoldLVojyOIt+DOr?=
 =?us-ascii?Q?r0c1jSDc6kg8HqpYWDu0dKHcJiuqqjjyY6FHfUQhx9ETNeNUSvkRmHo+nvqn?=
 =?us-ascii?Q?lUH/upQJ+34cgRVnZCGPuO1VWrBXb7KWIEiblMxhUvH3398fKUyYY6d1GIdg?=
 =?us-ascii?Q?08MboXSwOETwaOBnKV+Pagj6yW+h/UuzTtNfMfriwJ/hI0QLIgTm+b4F7T0a?=
 =?us-ascii?Q?9k6c1MbIwO56qGuLIzUkhrWru8Zs9aKedeWKUBu+Cc0lUJdVCt/WgYLs+Tan?=
 =?us-ascii?Q?Ipz7EvQ2dqD1xdQMoXyo9GhjZEFig/fsefaBlRCjjy7MZY1JTquGUD5OdFSE?=
 =?us-ascii?Q?862BLvmUm4zN63+mZr6+3jQM6IhfBpLgxu6zDwrMPYR+6PAQRFVkFZKt/OdJ?=
 =?us-ascii?Q?A0kUrbngXtM0OeneKPejgMEzsZ6Uokf8QqH7l1Z0Qxmam7cJuc9NuxiDr74p?=
 =?us-ascii?Q?F8Ul9KfopD60KsfNaj5yMsWWPItqjfDcRYdbwdmkjFNIr9zohCVEeWYEjsB7?=
 =?us-ascii?Q?5KVSL8Xrhk7W+QsM+rUyMP3wvoRF5AMc571qtnGmQWqJ7OQMSEL3g2QhPERV?=
 =?us-ascii?Q?ME+w3zsHBifWQ1z4qcLLdzekZFc4twR0rMeO/Tdt48MgXUotToGbQ6D8+bi2?=
 =?us-ascii?Q?z0SuyYbVqMhD0V6g7rLIDjaM+HdsuUpLwbvVnlgaxADv+W8AyHaSSlwzJxIq?=
 =?us-ascii?Q?/RFkzJpQMzB4KYCSBhqsXcGW9w9xpjQvwE5YJ1bED8hlsz0GSTsCo4yUBngJ?=
 =?us-ascii?Q?hxI/RmrXCfzB9GZ/kW5PAKFDSAebc/cHALpKEmSzeUqhWdU16BtLRETaSDmc?=
 =?us-ascii?Q?qUpbaJmH3go4+mYxyO4TYRdSe1iJjBomI0uFPzah6oN0Tt7AJC2JhH0vD9EN?=
 =?us-ascii?Q?AJKn3ehF0xCW0TGu+50CydE3C4QoCrNwKkGlETZlXqpoWsYnLEYIVbmtqxb2?=
 =?us-ascii?Q?IjwtKwsHtWGOFAK1pSB+GCkFIgk6hLBYJlbWaIDMjcA/EHyQNBsCDDgWWrCD?=
 =?us-ascii?Q?+c780p1u1BC0cCIxA8VyXuV+yzGODSpY7fNvflcbExaBH7ygnnfEhLwjxwXx?=
 =?us-ascii?Q?iE7TVHi7lFCPuWNDzQx+xwan6SJcC4XalFmQz3ACE45k5aJJrA8oGL+Ch6jw?=
 =?us-ascii?Q?90ZD2gqkJZmtEYBpUrAaMpB4rwW6/fAILIWfkwJ5oII8ZqpufujSGJcoZ6dK?=
 =?us-ascii?Q?nnT6HKqpcurDLDAQHwU/ve5dplYbivfNUfS2KUp42zsPtudL6Zn3d0yqyY+9?=
 =?us-ascii?Q?l/kfVPyumU7+tC0hFZ0HMNrunDkCxQPZ8ZqUX9rXFYY+qC7ewAjLp+wbXK2s?=
 =?us-ascii?Q?fFfBQitlXjDa9YkIT6hM1Nhw+598c7UFhu+5zrCBRpavk8n2fdruF7phaTlt?=
 =?us-ascii?Q?gLu0XsJ+nQ7CGkhC874=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M08aKWUqR2apSprwf4jAzqlEzIzipl6fb7YNHZf/zFCdA233Nk0dYQlip018?=
 =?us-ascii?Q?ZmXL7/sYWWaHlgaeiA4k/tVRRphMZUFRV1+ymJYQNUvmMlMv2bpFP26eiMho?=
 =?us-ascii?Q?MwyaPc4gcub7uLW4guWq50e76j39maQefQkoIN4VSXG6Asbu6HDpK5PQEbaQ?=
 =?us-ascii?Q?+Q1LAl8KvQjMefcoqFH5FYxVMwuE/DO6I8Hd8p2gcefVUJhnFPE6Gh1gOk9n?=
 =?us-ascii?Q?Bn3IDZ18QpPghK8GTYkuPcWkKt5XNuY8Ul8z14FLV6NDrCJ9b956/lfIn3QV?=
 =?us-ascii?Q?ngqjtzYrwL0Gu5ugvqcYU4mrozgIHlQ+7Wwpzu6SOjzN9IRHFcQ1nDCLUXnB?=
 =?us-ascii?Q?P5WM7F+q+p8+qLN8vccqb0D7FWAYiCmWxod2JdUejjiLHPqyJsRYxmuShVT4?=
 =?us-ascii?Q?UT90/FZ+2ge6RXAjLE/rJKLg2QzX+D3HvS3RSaWeJBPzVkOUdOBNLcBGmjWt?=
 =?us-ascii?Q?Ngf78bYZr7J8Ft3/2+C8MRsyXFfqwqRctJEQUMM4r0JIQu8GIjNfjuPsG4Xm?=
 =?us-ascii?Q?kQQmBsU2x/iNSbPqarocdOpt1eLPIxFPbABPb6l/dr4cA+bPU9R4mS+rud1F?=
 =?us-ascii?Q?zbPSEcNDIihyk4lk0pask22AWN5o2Ps0ltqVM1VSFKedZWhVtpgqldlBjNRB?=
 =?us-ascii?Q?/jPFcZdx2YDfe+A1KOUftjA9Jep1kXP2VzYX/l1UnklS0+HQ+96pNudqduCS?=
 =?us-ascii?Q?x5qnUKpOkwUD5qD0mumPnHNwY51To2g/ySTLTAHjQ/AdGCEalY3YzAxwpe5Q?=
 =?us-ascii?Q?qG6kw+IPfJiDBUxadFFn2OBjTjwq2O/S8Qowq3FJ7O9oEEXbi69aBgzONx/y?=
 =?us-ascii?Q?hecRJWJcmBy/U+lrJgKO5p6vzmVgs+i9B86qSZsHuzHRw6fgyBhGt7KgPWSG?=
 =?us-ascii?Q?KMUt/LlNxQ6PHjFnqxpyTSwh77qyC4J0ujYd6OC42buz1j3JP02+BnGE3LwW?=
 =?us-ascii?Q?VnVBjQV+RdPiS+J0OXT77nCvUyavfhk31tHfev1WJm3ofMWoaDpUlESi+Odk?=
 =?us-ascii?Q?7hI3ETu6DBfTGKTvfqvXCBie771FPHQl6hAsbsiq9OrUILq9fWbcBRM30f8n?=
 =?us-ascii?Q?MSvsMzLHrQd7dtC0N58jWSb3gzQRGJfGpQLWwQxRA+L2ZSbwKWnMDBLMwX+4?=
 =?us-ascii?Q?taCIc/UMk9XYKgcG+X3la95bpfYVoLwx+vivXc6+hf2WwWYJZ5qq19ILY+eu?=
 =?us-ascii?Q?xtgSa6aPR+SVJ3sCRFeTZyVcIe4PIilPJCL7BNqs3ZkKIS+EfzmkycZzjJaM?=
 =?us-ascii?Q?O26ehGsl+ktIN2+2AMUVdfJlOjzwbLv97M+finTrEleEcp0WrMqPuu08geny?=
 =?us-ascii?Q?P22KsgdAxZNpMO9udGwCSMdsFSAPCQFvwLlM66IQLuNpC5tjlEZgx7JC9L1V?=
 =?us-ascii?Q?LmLXYC7ImfdnEpoLQFUGSJirmHwOI+JdXagpqRQqn8Yx0mKMBnXzTZI/GhVq?=
 =?us-ascii?Q?+8oz6TW4Z1h7eY8IJyVjNRbhxLKkBXoRWkmh2i0i1Zs6mblyMczAS/JY4A9g?=
 =?us-ascii?Q?0rzFx5kJfX0OnLSWDBXz99DJhBqDRTGtkVrtWQxuX2Bd3eqdKJl5X2QmYk6w?=
 =?us-ascii?Q?yKXClSHL3ItXOXoytMD7C68jdlN9AO7ByUHY6F7MMX6l7YXUON58gZcweMSX?=
 =?us-ascii?Q?XXgS8bLIv/PkQvPplmnrN33nbu0mvdgi8tmDGH5fdzDFWWcxYhHOaSASlI3H?=
 =?us-ascii?Q?FETw+ICiUbnLzhmGUZZJB7C3C6jLGDMtz9L3GvTFfYJb4EbvzOg267ii2pJ/?=
 =?us-ascii?Q?DACuKCemPQ=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 91aca646-c249-49d8-a150-08de542b2f52
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 11:42:38.8314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gt5YVfHBb/avWXJdrU7h6JCspDW3GbqyIdGR61j8XyazfsBCXa1hfGBflh6BF1Jzo6kclPLZcSc8rz1G8mLn6X+z2l3VVX73eDRGtABIj+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11778
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 11:42:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229407

Hi Jo=C3=A3o,

On 1/9/26 1:32 PM, Joao Marcos Costa via lists.openembedded.org wrote:
> Whenever 'vdpau' PACKAGECONFIG is enabled, a 'installed-vs-shipped'
> error is raised. This happens because there is no
> 'mesa-gl-vdpau-drivers' package, even though a FILES:${PN}-vdpau-drivers
> is defined.
>=20
> Fix it by replacing the hardcoded package name in 'mesa-vdpau-drivers' by
> '${PN}'.
>=20

Won't we have the same issue with mesa-tools?

Also, I would recommend splitting this series in two. It's not the same=20
people handling master and stable releases.

Also, why do we only have some packages with the PN prefix? Why not=20
mesa-megadriver and mesa-vulkan-drivers as well?

Cheers,
Quentin


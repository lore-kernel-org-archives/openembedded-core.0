Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95BDECD1284
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 09:48:19 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.130])
 by mx.groups.io with SMTP id smtpd.web11.8510.1712051297382108028
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 02:48:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=Vly3gEKS;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.14.130, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJQaW63Tz7Ei87mKpG3pMZGUPLz7iqCbUBXeKVhLwA/e1jGyww/sE3adRBgbv4PL3D9z6WePI1MLnrtAEb6nQAMPhmgeD+/lCXAZ2HsaiQeNlph5jS2uqXV98kSnn2HF0TWzvj/ctiHbrpIve+4psaOPWM9wNeiTEQmqD04T0BRwFmilhbjSd8XAPvDvqHk6AG2DSHWfSkW7DXrHqMuOYk8fEb+Rebfc4qH3mD9dYOwxdMXaR2e8axSFAeVTUxw6nWnv1jWfsmF7RwSvbcXEkcNnIEkQGqMmGkZQaz4KjeEWaW28aPX2oBHH4JTXy7qlQAFAq0++lrkLGRjmgYxNdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3FdChohCPSf+V3XaK4JKF11lk2JYHmGWxMmK7EHUKU=;
 b=PWU77c8WoUM3o0Mk515wLJ8UItQ2Fb1xuXEb4MMvGuQQqWGaaglnZhKFbeguMo8Q8asTbGLJ8PQrXvdMdA2vZTNDg5irP2U0VB/t8g3C4rkCUGi9BTHaKMuQWm06ZoxHmCEPbhpwf9NMn/Jd28Q4s8wF7X0csjpGM7xsl7TdzOsi4Sc7E5k70EpP7SFjn7rGDGDx5blXbITzZUPBWiR9aJlnueVfSO5TtYhYbNImz+mSPSgGT7ZJ7Y+VQUYVLtKmaDRd0gzuzVW+5fgDFDMiEVggMYJdPxVfpcRgzFH5tVAgzQ9cq56Dxnd58420GJRfi1EdBYCmF1MqsOgVQG9aQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3FdChohCPSf+V3XaK4JKF11lk2JYHmGWxMmK7EHUKU=;
 b=Vly3gEKSW5jXhzv/ZDHjhVDpshHB1I7w2iicgeVfwmvAp47Pj4qtpAFm3gNRbKIgKbXtJi6gtaf5uJ0+xmAwGFZTMRLBFdLM8hJgY15ulT6uOARrqIDXGRTKXlLADwbETetlkoo9vj4vx9ghXtC5TyuZ6e/LYx+MTzZcSkbE57UVwIQpAvu5sK5mMkp6JBs7Xw5BlamZsvxUqAgyAgEZJwfy1zBgMzioXFk9t+wpTeH4BiXlYxchjgwuXOiSj+tiCHS2iMgDhH1qbqVlv187Jz7yUtZ7ORL7IY3Y4/PDc7IAR4czk+BGFlEgb558TnSEtUqm0iUVdwNSbhCV/Fthqw==
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DBBPR04MB7947.eurprd04.prod.outlook.com (2603:10a6:10:1f1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.45; Tue, 2 Apr
 2024 09:48:13 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::3e70:7029:faf2:7779]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::3e70:7029:faf2:7779%3]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 09:48:12 +0000
Message-ID: <cd95a2fb-79a7-4d64-9b25-0527cdb8b1e6@theobroma-systems.com>
Date: Tue, 2 Apr 2024 11:48:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][dunfell][PATCH v2] Backport missing licenses
To: steve@sakoman.com, colin.mcallister@garmin.com
Cc: openembedded-core@lists.openembedded.org
References: <20240401141955.1572862-1-colin.mcallister@garmin.com>
 <CAOSpxdY_+dwn2kMAAE3G=kQQtvBJWh2_TBCp2W=bhz1-HnutHQ@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <CAOSpxdY_+dwn2kMAAE3G=kQQtvBJWh2_TBCp2W=bhz1-HnutHQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::14) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DBBPR04MB7947:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Im32q3A+ygimD43lNq1Toh4jfwpkgmLYRFnJ7hVl5y1OlDO4joZvXf09/GpXjYUkcH8Ac3XSySvtIQnJRXfmZyz9g68wMXvyy9cISYhr4Ll/qvK+hxgxz/Dik9jsU9WeNY9TXWdVWGhoR5A1lSN0AVHFYUIP0SEKnLROQuvcuisRBLIGbOKCkAXSEV0ZZf5gE7dBviF+Y/fuzcYmQSd6BF4pcbwQHf44UchO7QN1HMJJiEu4lFm1S29I5uAdwD9tqa2rqqWao5yeZogeOQxEAU2JbHd8Viv75X14UA64tovZIJjddIX3/PCS/KJ1mw00bojUlIzo4VioLPnVd46PeSBqQhg2R8R9ifsYfKRMC22diUA2JI/XH0O2SQWe0+5JI4GhXB3aGwvtyoFaOBlTJBqrwm0Dy0eJb2rkhi1aJ27sjNIpIl6oCF5XdCon18OfntXC2WdZviTYePWhqNl2VAA+X/omypyAQ1smNc3pAAV7AsRZVsUbdZk0hUJipSiEVp/xjWXjHC7AH2EmjOtrgDf2g4tyJ+kNL8nBgjBNUxcJUStKMvYejTpLcj05xFiziEol1Gpqqg9uEGy51E7rJJ5G0HbaZvy9CB6ayxeg0o1dfU37GiPT1BituPP3FfgDHtsWifxEF4cu8EyzKmOfolZEqdDSv3NSaU6OtJyREDg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RlA4THllSGdBdUUzUTRzL21oQURhTWtwc1ZuVHVGN2ZMWmlPRGFvbHgzRlM3?=
 =?utf-8?B?ajZWazZWR2F5Y3YyS3pPcTdnYWdIR3ljT0I5RFEyZjkxTjNJdWRtWHdrMS9r?=
 =?utf-8?B?Nk5pRE1ERGVRY0R4NVBxQmhmWWIzZXFyYXM2bUZGd0lSMnpMM0JaQVFSMmVk?=
 =?utf-8?B?WHNqZkY2QVQ3cHptZHRCSm5ZMEtQQkkzSW5GTTRZdVJ3SzNsS1A2azU4MlJu?=
 =?utf-8?B?NkpWMzBFR2M1TDFZM3BSNzNpcjVrOUYxY01wT3lBNEgxZ3BuektOR2c2WVd2?=
 =?utf-8?B?ZW5mQ29xNFZNWXhCTXhwMElEZUMzK1lxSmZOT1FsTXY4K3NzeGRpLzhIWld5?=
 =?utf-8?B?RFpLYkVWRVl3WnVoQzZiTHF1NUhRZ0kvcEZVRlBqNldIczQ5STF5NkpWVXBn?=
 =?utf-8?B?SDhBTmw2cEFpVDJTcUZ3YUdCSlU1WnJNWUx0bExrTUxOZnk3S3JOZWdzS1dh?=
 =?utf-8?B?ckRQa3o4bHQydzV0ZDlLS1pLMy9aOWFYS1pMMllHM3k2UDNROGV3cEF4bUFu?=
 =?utf-8?B?eWcrUzZTWjFtVWgxVndKdjlFYVNTVnZiazBieUR5YXozS2Q1b1FkdEhlMWo5?=
 =?utf-8?B?L1dlYjB1VjI3VWV6SmZyNXZhYmlaUGRYSE9SMTJnYWg3R3ZBaTB4c1Y0b0F3?=
 =?utf-8?B?WWtHRjR4SjN5ekNNc0hVWDVkR3d4a1dNRmFNVUNneHZRbVVMdVdtRHFZR1NY?=
 =?utf-8?B?TUNKM0RFeitLVjZxYXdJVGlPeERpcWlsa1dXTEFqQXpPQ2ptY3J2a3NlZlAy?=
 =?utf-8?B?S1hRTUorRytieU9VUEJqVFFlQ3BLMUpMZTVidDkrR1J0ay9lOSt1T2hucWIw?=
 =?utf-8?B?T0ZsUVFMU0hkOER6T1Y2TE1HQnQ4NnZvZFBncmc0d2dIYVFrUjhWWVhuazcy?=
 =?utf-8?B?bDB2QWg0dHNJYjliQ0FhSVdNU25QanFvZkk0YndzSkl4NXBINGhjOHlLOFdJ?=
 =?utf-8?B?bzBUd0JvSkN6eEVkTXNKK3FJbkdOWXJzUGxwZTlhM1IzNWU1bTV0OFlhZE4v?=
 =?utf-8?B?eDdZWldzU3czS0laUVh5MG5TM2V1WmRiajVHMWpxRWhKT2R6NFpvbDR0ZTRO?=
 =?utf-8?B?YzN6M0ZGbWRxdGtpV3FwRzVVZGtnZkRrNWdHZW1jeVFONnhLc1VnQjhjK3Fk?=
 =?utf-8?B?Wmo3RVN6bFFzZXhMek1wWnY0WER1S3dIRnZYVXBvSEdPdHpjYnVOa2E0V3N5?=
 =?utf-8?B?R3ZERWVjcHdxZEd0T0RaUVhlTVhJQmJYQVNDZE5LQ3pnckZITms2YzUvc0tY?=
 =?utf-8?B?VnQxV3lRZDBwKzh3NUo2MzlZaGlOOTVsdU5WeThVazArZEZJcjM3YVVtaGF0?=
 =?utf-8?B?K3NMdTJXZUtadGpCY0dMOTJPenF6NFpDdng1T1dJYWdEVDYybm1ZaW5td1Nq?=
 =?utf-8?B?ZUFWekpoa2k0RXllTlVub2VWQjV6M3JDa0NVL09mWDZVVmd2eU5kblExbjVw?=
 =?utf-8?B?TEZLM1hLQkkrdWl6b1NhMnFBaHVLK0VlTitSdWRqWktJaUNpZVNLaGZkTTZD?=
 =?utf-8?B?ZENzWkNpQjVkTllIdzRnaGxFQjFMTGVrdkg0L0NMZlllVTdIMDh2bmFySFd5?=
 =?utf-8?B?YlZycnU4Q1doS2RtRWlUWjV0ekxmZSt5VVFpeHZVQVNPSnJBUTM1L1gxeXFQ?=
 =?utf-8?B?WkdGOUN3K1ZrUGFWRFYzaExpM3p5Q2FoTkcvaWFZaFRXaVJYMkhBZnpLUytK?=
 =?utf-8?B?MzgyOXVYR2U5ZFB1akc1L0l6MFB0RUYzZXFEeEtwUStjM1hjK2RjT2x1cDdD?=
 =?utf-8?B?RkNTV3pFWWhManZROWxiMTUwWUNUUEE3Q0lQSCs1QlVGRDVOWSt4RFp0cFB3?=
 =?utf-8?B?eVFZL3N1eGhCMnBpUDQxbjgxTHdNZkFVZHU4N2F2YklmMDJ4MWtkN1g0Skdh?=
 =?utf-8?B?dGJXajdacW5iOTBLQWQvOFo3dE8rRGJLMHVpT0dUeUtOUENUcG45NklVR3li?=
 =?utf-8?B?dzl6SitSUmhDVVdsRE5NWXJwTXZWN1VvSGR4QlJ5bllWcnZqZXVxRW1XcUJS?=
 =?utf-8?B?b3RLRlNSMzZoc3k1OEFSemRNUnZRaGlXeENrOWRIN0hHbW14ZVdUSE43cDdT?=
 =?utf-8?B?aThZVDR6WlQwOXJQVDFjb3BNOGpxRENwU2dYOEFxTzNxWllobDJ1UXF3dDY1?=
 =?utf-8?B?L1hLVkYvdGVpTSt3YzdFdnpwMStPeTRIY3hZS05jNS95c1drTjlqUU9BZ0xD?=
 =?utf-8?Q?SCdFBogeeZHoHp8RLDOGzIs=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef421d2-e154-4d84-608a-08dc52fa02fa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 09:48:12.8345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZMc6ydZO85h8Sss01+eSX1DZ6ADgGDdr6YQj9HDBTQbv03X4PLYCeOHb7J0WzA9IgAJrj7O/7QMiJ2CT/0CNtVo+b4IRJNTGtu8Bi8mfQl/OkwUxGxXoX+RVuDV64QO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7947
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 09:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197869

Hi all,

I would recommend to identify the patches to backport from the master 
branch and backport those instead of sending one huge patch, lowering 
the risk of forgetting some changes, forgetting to fix some git 
conflicts, etc...

Also considering that Dunfell is soon (this month) EoL, not sure it's 
worth the contributor's effort? But that's up to Colin to decide :)

Cheers,
Quentin


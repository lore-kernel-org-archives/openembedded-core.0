Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2115CA5FD2
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 14:24:50 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12385.1790864687255354577
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 07:24:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=zY/As9bd;
 spf=pass (domain: est.tech, ip: 52.101.69.1, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P34LkzeAvgDNoUvPgloUilIhYUj4X5dM16gaU7XM+NDCYr+sAdmXpuA3epAgBJimah79a+t4FFV+IkE+66ekt9dKc0rjQuMZVAyelCkATd8Q6OxjeepqbG3+4UOPmym4fV6+8K17OaHt8Bhj06OvnjSE71NyKkYorGvMtIg9CnLEpO0WLIq1kOE1I6upVIFdRARumVYOrCuLcNubkZxhNreWlrlCy6umnSU1vvCNgp/4Y+iCRRf3uTr8gaBvpxAyk388c45Dv57t3in59VG1JFk/Fk/8xCdhkG9nfT11QmT/gbzwaXUva5VvoZnzp7TDuX5r5rfyJjHOk9wmqWaBjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voYU+pjJpL1wTEulc0CALazFoxEM7x1+ehid+K7mL3A=;
 b=GTN9w6kBQnc+7pgo4+CUU3K0QL9Yt6LVFYvkflwzMzGMS7sxqap4ACe/6N/Q3FDSxrACNfXLi3yydBffFWCyc5PIYjF0Aluh3IWsEihe5n9MBiAig16fizO45Hqr5/GeCSwLqBFofzGqlJKApsNNFTLJ0VJHQlgDAobjbarREXUVrgF/feJzokzfhvyUHO3yuNovO3HggeDypt1T6Yp9iTvTkEXN3x6unlGbcu5r0/4++0YVxMARRdyFiSwOTfgOf9f6rgjXjneu1XKMaXh2UHzVG2oy1ebq2QEQ4rvnMqbAAayf7XAheTBA2HQEwjgnv8iopdCovSKF/ur7UjPFiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voYU+pjJpL1wTEulc0CALazFoxEM7x1+ehid+K7mL3A=;
 b=zY/As9bdqaIZEpOkbaquuIU8+MIUed7oSeZ1IQmJ/jrQsVjtPVGDoXqcbWddzxa3a+AYI8dfKNmW9+RxgO+PD2RkvyyyaffRcgvpWrtYtXhkhg12BdT/+LYG2+qVV/qcjsVAxCErOD+3U+h+Kl/ywo8f8ZV94jitBNG70qkf37iEW/o1yBHUK7QIN4Ni2XfOx8cS4c81jcIWmgaXiCFf7kqI8CpJaAZ8PqNudL/uTl4QeLxTM2pLcTXHv1sDIdtbYesDpx0ti9kHvWvtyOAHCeRao/85/9W7Cot6gYJY5XDQ8tuv9+4G+7Jb/tfKEhEVB6pfDdTRzYrr2iL4y6hZ8A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS4P189MB2062.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:512::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 14:24:42 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 14:24:41 +0000
Message-ID: <875b3384-30e7-4574-92f3-3f9756d3cbeb@est.tech>
Date: Thu, 1 Oct 2026 16:24:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] kea: Upgrade 3.2.0 -> 3.2.1
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20261001100444.9447-1-jaipaul.cheernam@est.tech>
 <2eadde72ab7e004277476db8e7867483795ac4cd.camel@linuxfoundation.org>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <2eadde72ab7e004277476db8e7867483795ac4cd.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV3PEPF0001DBD3.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::6a5) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS4P189MB2062:EE_
X-MS-Office365-Filtering-Correlation-Id: a1f7ec60-4579-4daf-379c-08df1fc7bb98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	3CWGlw1+2nMBiXpcsl8n4tzO1fi36gQKOc2hkVnlBqk+1iDayxWhNMZoOxXQvotRp02qCNee321yzqsQ2JLLyYb1+NJjvmP1E9147WL+/oWDK5SSylAJrBWV1ju9o0P2GaUzBE4ZWZGBntsJLZna/30HUnaOIN1eiuxDy/XQk/zabTYk/D3AmtpHFl0pd0VO/wuYL3QWGdUvtFHLrvHQeCh6xxy+FzKq/wLkGrOIIT/ZSsTJZHrfplWjetROGpx/hhDScjngf6Y1V0OSAxmedmf6UylaRd/Qlvq4Wq+BQAMNdNnU+VGwNk1rtgQjFSglOZuydPdPK0WAcjZKC/a3QN2N8K3CdnTC0W/7hgjgtu6TVxYcMvuCHoAfLoi6TmSXdF7hXtSmRiIWfzeQyJBBEMFSpcLq7FI9f46MZNWNt0YD/OoigsNH7nH61CgADWUngbLcrr+wy0aIiOLrys2XuGHOckYK8SZQ+0yQCwEILx9uAMxJF0Z3afu/jfr95sE6GkLgZso7o5AwSpG7+lrcwZTyRVE8eX/6w8H7G994E831S9q+gd509HpTeEY+PjJTblm2mnFsF4DZxcvYyBDjb0CMix/DLuxLKMUvDQJWI0Hq2xeR/BPvr2HcDMeHqcvL9REB3ApCHh6kGpjQxdxfPrWf8+24ZmeFhoxUp66pnAc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1Efbvki4EBLA1kHwqfbvozyvi0fj+5AOUz+IT6NZZxh2cWzTBT5FINQ45mkd?=
 =?us-ascii?Q?Q3J3bWmTLSmJCV+FPLLDaH6Vvvo7qMjEX6TrrMUImK8kERsV1cGRgryawARx?=
 =?us-ascii?Q?2tq4rpGls4f4hbB2rTnReUqrEj0Yd6/oQTIeeZ6wFS/cunF+35m7nptHfMcE?=
 =?us-ascii?Q?C5LQGZxFxGgWPL3hr7s2UF+aeaTo8BpyaEvX5fX9st1cO6zb7bFoOfyyQ+nu?=
 =?us-ascii?Q?ZA2IMwo9a9vBPSUl3gXMdShCfbPV5WEORuo0uXQCRga7ibye0Zt3tXiM07+7?=
 =?us-ascii?Q?7W8CFOyffeplCG6RfjZrT0fV7AAEpXB/Yx7vyr+sz6PWyNWK7K9ZNzd7yuWq?=
 =?us-ascii?Q?xKaCCYtIdzuUag9XuykRHgFmWkuo6LY/CssMD7B3bC0WpU/pZMo2eKNqYqL+?=
 =?us-ascii?Q?CxEdVeyqZjNvPO+/Rkqa4crE6Dd+PUFJhAtAL7td9YSJLqUiDokmnSeYWYHc?=
 =?us-ascii?Q?eMLN8z0CTJRvJbvrasiZxSoje1uTlDhVBxsKg5277EHKQqJFVCtbuBpnu3vN?=
 =?us-ascii?Q?hxWoOT0GuSbCzKfDszfWcuhk8bVosnhQ3HHkUHfJkmAa6iCG+DgsHmYzIbS0?=
 =?us-ascii?Q?8VmeOsKS8OxYdzoMWfExl1+BC8EYkfcVL/asHL9I34a8P1CsABYW9YDQhlsm?=
 =?us-ascii?Q?vrQFxSLeXlONScoRR7F4CEG0nehWUAW9TItAv71I0l+hj40we4E1UfqoklM6?=
 =?us-ascii?Q?0Jxx22pz5fGKJ6MwtktiyAAcNO3xZnqayYzrzATCnAuNERC0gG1thduPR02k?=
 =?us-ascii?Q?x3CWAEcBgunnR+ENR+IteidZ9kVLQsrHV5bnrneHUiZErWulCnqlzvHMuwaR?=
 =?us-ascii?Q?FzO/MBoOO54Vj0c1zV69XQLnsDMjjsb9J80QgUmAD82gFt6wCya4z3UTFtHw?=
 =?us-ascii?Q?EElkzASc8uKvlJkecaVeewJdJuUriLoruPKyn2BUoHPgOgewvQGxTFImnsPI?=
 =?us-ascii?Q?8fEH9UsMxNHC+Xv62bmDDemVn42aDzQLMHaDpX0rnAewGmoWgDHsIywtF9cx?=
 =?us-ascii?Q?iG0dIWlwFEp+2NrpsJ7MAWUjddatsSHHbFoomC65eZzT+1F5OdxEx0UWgYqM?=
 =?us-ascii?Q?4Np9yrLbd4gB2Q7ZsIrVRfJGyQCY2tu+1U31O8qHy89LgFKQWhZTlWg/LtbH?=
 =?us-ascii?Q?28kMDnYqM3VhgwgmpYtayIX6Pb7csrP2685rgyjoR8MQ70jk1KSX5Q4apzdj?=
 =?us-ascii?Q?JB8lCaGCO46/z6IyoSzqACWD3N0Mrg+adqBAnkNRaBW5CQFsiCMT0GZJzEdY?=
 =?us-ascii?Q?Fk63KFPiwZ3E1HB3R+jK+LhaWhQYlxsyHFhr+QNMVNq5FKwNCe+zWE9D1mVw?=
 =?us-ascii?Q?QGGDTVPxEZz4J6tADXkrHKrOtAFg4YKbKhUGvw/xplmPA8vstxL0eOEK6uWQ?=
 =?us-ascii?Q?SMUvU0v6RUgkTd5mYo6KFmuKcnZ+NmhnJAlm0cnRtSWUxz73b30oE3kvDqQ+?=
 =?us-ascii?Q?HAry/AVDoCpHjkP2hu4yXiTuEAlPysqLCTJc8vbqOaU9eaonKPqRm5fFXHH/?=
 =?us-ascii?Q?S42jofSAcE4AFRZhH4LpkNxZOTKzAYvUsUUSEoKYDHNi24W1edymnjnKbBMa?=
 =?us-ascii?Q?K28peDbtw1kA3QoK89F1Z0xPq0XNUs/T5JAkQEg7aKPOCb1inLT+U29lWNsS?=
 =?us-ascii?Q?MEI2jzrdagY/MeIvPrixpLjAusM561Pkm6PnrUJP9CEUhM+vRCgkBLKRwOVL?=
 =?us-ascii?Q?YiVP9Ivh/wbBWam53h+j11Vjq/krYGJcPP2iVL7sl3vXiRJvIRDI/dec3g5Z?=
 =?us-ascii?Q?jag4rVdW3A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f7ec60-4579-4daf-379c-08df1fc7bb98
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 14:24:41.7888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tiJHALIXIOfk3zk/q3DxGtwDzab1WvGiQkUs0PMiagrTGy5vOg3Q6AtBP/gqt4FPIbY4QX5xMmkZTNQjmj6mvP6dkbjKM42c/6kkEyTXdjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 14:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247039


On 2026-10-01 14:51, Richard Purdie wrote:
> One thing I've noticed is your emails keep having a locale encoding of
> "y" instead of utf-8. I suspect this is a prompt when you run git send-
> email and you're answering "y" instead of hitting enter to accept "utf-
> 8".
>
> Could you try and fix that please! =F0=9F=99=82

Yes, I will fix my alias :).

Thanks for letting me know.



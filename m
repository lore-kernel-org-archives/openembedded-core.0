Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE37CA5FED
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 20:04:11 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4233.1791317045205807092
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 13:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=lxBex6Gv;
 spf=pass (domain: est.tech, ip: 40.107.162.49, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4cy4IrhsV6/u8ya6c7hrifZY9UtzmZMUzS4C0G67qKf7ajo1fcBgI272j6XQrbKuET9uGGx0+yS9LOG89K1RztBCJNU1rF8hX0J03T4rEvb5LzlJa91G56lcQkVBTB7HDXmbdB72hQ8iOZ7QqaZZdBu03rHdJQXEcOicdG6wotZhUowAguxc4sg8GPm7E8sL8yqf7nD2LBKE4ZhoSFr9rAf/BaVMG7eWm7AlfTg6xuX8z/hqCz4F/QsScYPF180Lag1D2oniSEL3PaSLFu3nfsdvkYjFBSE0fWHe6DgH/f8R08RlKJmuVVfnGrfoWjgcondQ3xtmgCJVBQUAsjR4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENbwodjVGQEKdIfKR02NcOOGQXvc1VvHPkmceuwrkno=;
 b=rWZ6phhs3zqpWo2gELm+o3uGN880ZwcMx4TuRLfKj1HMywzHdQbfDSD/fiQkU8wtcz+OhOi4iQS7MjVDBGP8m0wL6OeUO/bIIedfhNiyzpYIxXMp8vjAeL1Ea76ti9e6kdAOCJNz8+LGPByqwKK0LNbkNqiEDE5+bX6uLonboOIH8TVZTgfcu/2wZbwjPrbN1F4PD3By32lQ2LXUvDKJu9jK95AL+NJATcBy2qYsZpEHi/AHFkmbWoYiskDWoWdhULcmmjIjZp8FZO59UVxOunVp4ohllPS7HGugc0/38yr+tH7THMGBJ1dn4Pgb1rL1xDf9a6tk9/UQe9r/0ziIbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENbwodjVGQEKdIfKR02NcOOGQXvc1VvHPkmceuwrkno=;
 b=lxBex6Gvt1nF/9s+ccCXBpM0OIA73sexpbblD9zujkpT19cW6wgCjzyxQaCB1QZ9Nc60UH/yCULpfzYR8644yUVwY6qWrob+aEUarobseTuwAikVFZVE9mq15hhG+Wz6Xc7Dq+XcXYGmrmSNhZxLMUb52ubyNCf3iZJ1cOikI/PUjyMHtipH3y/uT1QRNGnBRikeC5vgsKMlVOKCLIarnhN68oal6muL1PrGNw6cMlcC5RV1THo7FZW5YEEYwxJexeVEmJrDBbcKyxdh6kdipojETMue/X041lRGd19clkkzwqGxpAwbUWPfZee9fGQjhXkJO/UJE8+JG1TNhbYhhA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM7P189MB1010.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 20:04:00 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 20:04:00 +0000
Message-ID: <d53cf28c-2688-498e-95c7-41cd9e4788b0@est.tech>
Date: Tue, 6 Oct 2026 22:03:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] perlcross: Upgrade 1.6.4 -> 1.6.5
To: Yoann Congal <yoann.congal@smile.fr>,
 openembedded-core@lists.openembedded.org
References: <20260929062603.67218-1-jaipaul.cheernam@est.tech>
 <20260929062603.67218-2-jaipaul.cheernam@est.tech>
 <DLWSV9S5HI2N.1GZN40XKWDUCT@smile.fr>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <DLWSV9S5HI2N.1GZN40XKWDUCT@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0317.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::16) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM7P189MB1010:EE_
X-MS-Office365-Filtering-Correlation-Id: 864a20a9-66ec-4d24-191a-08df23e4f684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	GOxYr9BA0lmCQ4+/tWUXegvwSSrtQIzhI5CZ8WrpTen8M4etl3I/C6bwEDueeSUP7ntmj010wJ+6DdOrMVKgMxPXelpSZxnJPa3K+mWd6tR2TIzrGZJe3LaZxbQ1gj2m2WZQNbfcSWLtF/NasmdiJV1A7uyaPNxEZ2GBe5K/7G0X6SzO6deDQgnOT6cHre6GNyLQZx2GwNJEGJhRRIxI7mgztN67M1wb6b2tOhfiYyCzDZeb+f/n6FFBnZiH3TEFZNrZY19ErXmLRUSW6ral2Rx0S0R4Bwkkgdercy9o6aoWKf0nnrPL4qHK26wnSP8ycXokhrcxTK2tlVjUuiuHFGLakU/+eK6VdUQdUg40+AcgoW2RihQobXgptcRoOgE4E5jzpa8wFzUbN8ZvbUFGI4mUCLXas9QN+XMdu8/4Unya8S47LcCWSSjXa9wSUyOwQlOLi4M61AAS2BHePiSwWRqllBp7BO8FzVwBMU9UBX6ViX5sLP0nXsYb6Y69Se9yinwAanqe9AADSICKno0GW8tY2i4i0kJA2YbuQpC3IaeRLaWGkZoIX0LzwoZrfFPU3yQdswTx7oHGY1PB7HFMIW58rgbfvwIF/fdhr2eysXg1MAWXEjFj2kO96O7OOxyVg3sbA56Zq3sue+ggTaQKMSotgpoTNE/A4onHm1hghO4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dHZxL3RnbFprOUNlN1M5N2xidzdETWJFazFPSUJiWERqMEpwamJUT011ckdW?=
 =?utf-8?B?bWxwVXhadFRyckhlelp1SHBkSDlvQitwVUFQZmNNTk02L3JydEd6dFRQcjNl?=
 =?utf-8?B?NGp6ZVcwWkkwMU1KdmdzWUNZSHZuLzAwU0tRYmxpUnhvTWdZQVJ1OUcweXdS?=
 =?utf-8?B?d2lCZU9SVXlPVnV4TWUxQzF0cW41M1RUWEZCNGxXeFNOZTk2MjdVZlc4aEI3?=
 =?utf-8?B?R1M4MmhnZmpVR1N3d1NhbmNLa2ZLSFc0ZTVsQVZIUm9Hc0ZpOExtWlhqMVI2?=
 =?utf-8?B?dTNVWXRCckVmRlRJN3pWemJoRWlyY1Eva09iLytibnJmd29aYlRzREZDNEtQ?=
 =?utf-8?B?RUJTcldwSGFQNjN6MEs0MFRsQSt6VjJuZVhjd0JsSnA0djU5NkxrM3pPWXNp?=
 =?utf-8?B?aWw3dExJcnZOSDhGUnFvTWhwdlFlWi9wUFFDNEhKN2tHemZTU1M1WjJNSWEv?=
 =?utf-8?B?akFpTE84Uk1jc1hPMUI5QjFHUE5lRkpTeTRVSGcrTXk0MHZFa1d0dnFtSlp1?=
 =?utf-8?B?bVI3M1pta0xESVNhZ2p4a0h4c01lZmM5bEZGdFJnY0RTcWhmRG1OSmcvWjNk?=
 =?utf-8?B?SWNaV2FUdVpJYnNHMitzS05RMHRaSHJoUUtOZzRyVUtnZmNnYTBCMzl2Zjl4?=
 =?utf-8?B?UzN3MUYwZElRanhIY1EzUHVyZTArMktCNnQyTUVYMm1hdk5ObHB4dHlDWjZX?=
 =?utf-8?B?ZEExVU9pSmRPdjV6dXE4VFJoOUF4bUFnT0REUytZTmdKM3JjNTgyeC8yZ0Q4?=
 =?utf-8?B?bTc4VHJMc2dXTVNROHQvWHUxdXYyc2FGTENTOXcwZGl2MUlOTGZCL2J6cHgx?=
 =?utf-8?B?TTVaZWhqeXdTc0JsVlVXRGFMZFFrY3R4Y1dXR29Zc1FEdUJsZWYyMWtvRy9S?=
 =?utf-8?B?aWZ4aFRvY2srczRoWGgvajA2YThCRUx6MkY1emFnN1ZKdytyTjJnOE9nZktC?=
 =?utf-8?B?UUdSTDF6ZnpZeEdBbWxkeWtWVDRralp3U0VSbjlOQkFhRko4QlowcjkzaEpw?=
 =?utf-8?B?Z3NoTkFSc3VscWp5VXJoVWJZdFZ2V0FZeU9iZktmT3h1ekpybjAvVmF3MWNZ?=
 =?utf-8?B?eW1hcHcxSUptQ2JoM0lUSjZSRkxYQ2FOTXVBaDV0bjdZU1dzaWxKeDhmcDJC?=
 =?utf-8?B?S1JCZDdBTjZiSXpxMGhUWEpQUEo5Rk41Tm1HTWtSNmZxYWs0eUtGb2g1TGNY?=
 =?utf-8?B?K2NhNmw3dHlnckpmOGhIMThITVhXaG54N1dxd09VamZXR3NrUnN3Ti9uT2ho?=
 =?utf-8?B?Y3ZFNDhZV21pQVpCOUYyRFlFMVVWalZjSmVnTi9oSVdlUDJmanMrYVNuZDA0?=
 =?utf-8?B?ZFpiL3NqTWM4bHpzR29hamwwTGFyWWp0dGZJcmFYbGtIY2ZKMjEzWXVQdHdw?=
 =?utf-8?B?b0d1M3NlQlVVb1Y1cThYQjlNNUpPS2w2cHNja0VZZnd0OFZMN2U3Q1JNUFdR?=
 =?utf-8?B?dnA3WDZDc0NRVVBweURNMGlYVHlVZ3hyUi9ocWNkOVBtRmlYQUFrek5QVnpZ?=
 =?utf-8?B?bGtWQXQ3VDN6UVFZbUQwQ05ISVIvNnE3QUZYdzE3djFlZnZKQkZWUm12Zm9l?=
 =?utf-8?B?bXdiV0hkMTRBSytJblhSVEJ5NUVBWTZhUi9ocE9mQy84d05qa1RyVmxrcWVV?=
 =?utf-8?B?R25PbmoyemRWNENkVzdGY04rNUtkcFZPdzFkQzBWdEw4N2hheDZNMlhKTndn?=
 =?utf-8?B?NGc0ZVA0YzJXRVBGRzVadElQUjhZbWlxcWdJa2Y2R0FOYStBcVFSeTRDWHpi?=
 =?utf-8?B?Ym1CRkRUMW1IdGpnSllCNzZZNy9GemVlcVREc0lCUkNtQWIyMWhLZEIreFB3?=
 =?utf-8?B?ZmdGK2E1cDZuYnJCRjRsNzllZWc0UFBSKy9oK3M1VHVKWDllNE03Rm1KNzFs?=
 =?utf-8?B?Y2sreU5jUUl6STJ2TU9wMVlFd3J5TG53T2pqSE1zUHFLeXYwc3YzK3E1VGk0?=
 =?utf-8?B?L0VFRTVKL3lSQkNiZWYvS0ZsVVFYREpkaG93QlpYdU53eVlFaFlZSEJFV1V0?=
 =?utf-8?B?cnd4eCtHNDZDazUrb2MzcStPSVhkNHFTRXYzZ3F3MjNKck9Xa0IzOXB6Q2Vh?=
 =?utf-8?B?ZndsdmlOUTdCL2F2YWFrZnBCM2lpZkttcU9sWkdCREUyZ2t4UmpCV0lXcFkx?=
 =?utf-8?B?Wm8weVQzTEg0TFF1dmFLSjB0QUV6Q28xcGg5eUpRaU94eGVZUVZ0U2VLQUxT?=
 =?utf-8?B?YW9WQW4wa05QYk50bmZLT3dkeTNCSXJxWXk4enh4dCtabG9qRzV1aER4aith?=
 =?utf-8?B?QngwM0JYRU5nM3Q2djZFZ2lVdnhhN3lXc0NYUFNBZnJ4UFJPaEYyMnllWGVl?=
 =?utf-8?B?czU5YUJLN3hVUmZTVnVHMS9VeGFON0pVV1VQbnltNkJJMDl6Qis5TCtBOGt1?=
 =?utf-8?Q?YVD2Ew94cHl7LxCg=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 864a20a9-66ec-4d24-191a-08df23e4f684
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 20:04:00.6725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKaV2Zw6DzFS1sYiM93NnTdmhYAa6l1kp+fp6Xpf+eXHQihksOMievHVfPz4jcpWwFzf3QAxus/8A5Q8B9KUAEni+kBsbE/1FnB26VAqRtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB1010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 20:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247327


On 2026-10-05 11:33, Yoann Congal wrote:
> Hello Jaipaul,
>
> Do you think we should backport this to blacksail?
> Changelogs mention perl 5.44 compatiblity that we do have on blacksail.
>
> Any ideas?
>
> Thanks!

Hi Yoann,

Yes, its a good idea .

We can backport this to blacksail, as this upgrade only contains fixes 
that are local patches in recipe.

Let me know if I need to send a patch for this.

Regards,

Jaipaul




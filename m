Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A774C88E72
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 21:19:43 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.672.1789679982266664418
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 14:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=Qb3yeeIN;
 spf=pass (domain: est.tech, ip: 40.107.130.28, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=opEVW0QacrqPTVwf2y7Vcq98yNLSplyke0Gi7R8eRsuUaqlhxb5eircJkc1rREFSZ/47u5G4LOIbe4/lKH2wcZxzknhW6qBDdlP5MEZBS27DD2VgIaVCQm28rhFw7xnK4UtFtRj6oMhVzedvwqzkal5v6/+sCR4mnu4vDnQ9Dta8X80JloCw5tDrSmy4WGC1F/k1YOSqlXmT7earZ4kf/NBAw51NAQgE+3aeyR/EGkhPKZmzWJ7aV+yV7LmlhsamKEzgSnJBZ9aBf7JZdKAEsB9PWE3Kxr1SlPnLSrU9JAGaxyvNMXSthecsnkXCHx6I4CkHyL8KpMVA0xbJ6OsC7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GJBgj30avXza0rJ1sdIksf0dRheTFVXrIIxIGah5U0=;
 b=JT6BLCx4CRNKMn1vuX4DLEleHzqPM/rMyAOzIHHLzbCvGY6VMIrwjZPWPsPPB6lUyhWFup9yUJX9tSTKgvz7Rv/0CXyYVXDjtHLJH8i30IOQHocNZI8TAsAZ4QHJfkBsD9xEYkfg5zoe2WkkOcNYmvp2v4tm0lFPQvuE0ggQY1KTTcUB4pU+mFnkfLnOEKHYWvl/GQ+F1Y0/6oxGy9xwsKloCmjMug1L6e7WYZg8I8wqqoDB7OUGWu2IelKWwF1h+KwbvtXSXFNcOU3SiMUBWQdaaO6MWHv+xy7dnjQbIBgFZ6bjlUJhCClD4LU7AKGxEThhYidUw8fuqch0gpzd5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GJBgj30avXza0rJ1sdIksf0dRheTFVXrIIxIGah5U0=;
 b=Qb3yeeINpn2RmDRBDBAdMmsC+VVOgjod709d7jMMLr/MpC+eqMO6SEaCfoGnxw9hO8V7e3i8JO69add/YczgNdXLNGy856cH/SSyZDjVlNg3VaVJ6b8MJxOJuTMxhxsxntasoV6uGWbaoF60a+J3s0gQbCgWlVrfhs+cIN7m3R/8Wd5tZyUdvbKG6ucPAn3/7CS39mFwTN9QgG8ZA2k8NhuinZc9ZTyUjGzdkyb8uWDlr4qiZRYdiYq2HFAnwdvzRfB+QuVvc6TS56Nwvpey36u1vT8kBUxG6gTZuZ1i72bdRtVLp/hzVVN6oxeiMv9f/ZsJIFwWfUJhKBPDB74TDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS8P189MB2579.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:63b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 21:19:37 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0428.009; Thu, 17 Sep 2026
 21:19:37 +0000
Message-ID: <0a510635-8d6d-425b-809f-07f87a26d2ef@est.tech>
Date: Thu, 17 Sep 2026 23:19:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] libsecret: upgrade 0.21.7 -> 0.21.8.2
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20260917074956.22252-1-jaipaul.cheernam@est.tech>
 <20260917074956.22252-3-jaipaul.cheernam@est.tech>
 <71c2e47fa714ca48052d175ebc205e59803bf8d1.camel@linuxfoundation.org>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <71c2e47fa714ca48052d175ebc205e59803bf8d1.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU7P190CA0014.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:550::12) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS8P189MB2579:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f25728f-b24d-4ed4-3d8b-08df15016097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	BhkGBwW919rI3knizSbXULlvzTGIC2bN/nnLDzQgmAFm7t5e0QNEcJIWfxowM5km7GX3L/dKkhFunebmDe79hGEdy3DXQ2KTPwrrZM0xIPULPwEk3bldGuCbWnThJArI74fGiBQsty8SSMI24p7oBtRTKAwvtiBSsuopEo1WjExNCUkpbjo+qL9E5GKzGfoO/Lafb9V/MZGSekpn1bAY/8BsHWxBRGizvicexYYxFRApF3VuZvViGNLtJpbdtXkUEC5Qfg1XNNG8wux3ws3qx0Hy0NllXNUAcY7cpbL3HHcp22Mp8QT4tjfn45NpVZm92M5snc0jZLXV5pQ20BBEbxmVultYwmbJFDA0qJu7QDHihOGzBES5CbQXPD4+6YEZGIylepH7iuOX69xlj3QSl3bQXCtTOV/g17rEaV8OR3Wv/Ez9Xs/pY7H/A8YtGqIfCsKNQy1nGO6cf0kMaD0j1ImBeGw5h0zPuFWhwxsKhy86ToYsvMsvJuIHyteaecmdqnUKPmSV/OXCsfNL3u0H500ukRkKlDrjiGiNC1MU464ZUVbvZnXRf9B1ivplA8cv9yAFeUSU+WXtR2lf3jQnctvrwPnVe6FrbOpjpHXRvPc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TUVUeFdiQy9sbFIwK3o0Q2IvaklOOCtVUk1NVTZ4VGxKaStWbkVnWkdpaHNK?=
 =?utf-8?B?TkI4NUtxWEh3YXRsUWZYSWNHRno1K2E2K2ZXY0JPTmZHUlJ0Rkw0dVg5SUxN?=
 =?utf-8?B?bWdKOW9BNXkyTFBING9QQ1FSUFMzZVh1MXBhNmFKQ2E1bldBSElGRGpON3Rw?=
 =?utf-8?B?Z09aNjZnNHRHLzFpeEl6N2ZuWHcydGZoRmxwN3Fpd0w1UmtrQnZPVU1jNG4w?=
 =?utf-8?B?STdCZml3Ty93L25rdmJTa1k0L2ErYS9QMWFJNWJyeXM4NFZadjg4dXZNeXQw?=
 =?utf-8?B?bjFpTnd2RXBSRWhNVEczMXY3UWRsdG5ELzcvL0tHMkc3aGo3WnZMNE5PS1li?=
 =?utf-8?B?NXRkbDBIZVQwVndnNW9McWhSb2xIVDBldkxkUDl5KzRNbXFiWCtaMkw2QU1s?=
 =?utf-8?B?WmkrM0h5OWx6eEtKWmZCTnAxcS83aWJOTHJaRmVCaDVZNjlTbFpibElzVTlp?=
 =?utf-8?B?MXNZUGhhN3cyK0ZSMTQ0K2ZIdFNqbjk0SGNpaVJBVkdzK0lmTTFkUXBlOWJx?=
 =?utf-8?B?STBzS2dzWjgvTTBra2NKeXVJbHp1L0dEaFlVa0tpdlp6SllMRDRDamhZclBM?=
 =?utf-8?B?dUhnOC82WWF6UXpPUnU4TnZ6c00vMWpJcDZXVHo3U3dmU2lVT3Jua1I1eHJQ?=
 =?utf-8?B?eWJYb3lMYXRaWTFMQVQ4Q1doc1NodFU2ZE9meVA4S0MyejR5M0VLWlJQU084?=
 =?utf-8?B?MHRxR3duRzJSMXk4M2M4ZGU0WUp3TC92NitzRjVTZm0xTjd6NG0xZmJsS1p5?=
 =?utf-8?B?MkJ1YjlrY3E1bUJmWWRvenpTVzI0NGJGVXNRZGJVUDlxS1c3Unk5djkrcStZ?=
 =?utf-8?B?dFNmRk9uSjlST0JERVlGanRIVFhOenQ4Q1NIUjlSNS9BZGlteElLbGdybVcz?=
 =?utf-8?B?MWYzOFhBQUtmcGI0SWhpT3Y1Q3ZwYU9JMDRpR3htTGZONGE3UlVZZWhkTVBm?=
 =?utf-8?B?d29xdkI4RXBwTE4zREhvWTJ4SUZsRVd5SWNrMWoxWTY0eTNSMzQrRmk1SVFt?=
 =?utf-8?B?cTFYVjErdmFTR0RvSVdZM05yUEdULytPR0VhalpYZ0ZqWEhsYzBpYjA1dm1h?=
 =?utf-8?B?ZUZNbUk1d1M2ZEZ5aWprOFhDZyt5a1Bxa3VEc056Q0xNQmkrTndqSlA1aGQ2?=
 =?utf-8?B?OXhNby90czA5QXk1bS9QNnI3Q2krUjlWY25ZU2xWT0R6MCtFU1dUSXhuS1hh?=
 =?utf-8?B?OVgxTXplZkVXb0FJMFU1K1BMejdMV2NSMW9YemtoKzB0QVFnd2dRSXM0U1pO?=
 =?utf-8?B?Slgrb3ZIcGd4R2kxYms1Nk9vZ1BVZ3RYWVlZMWhhcVhUZVA3MjBzTFl6YmRy?=
 =?utf-8?B?RGEvd01Gbk9YYnJ1bUhtVjdkQTdGLzJNcnNGckFSaVJkWDk3OXNweDY1NU5K?=
 =?utf-8?B?akM0czlqTXdGbUtaUXdQS0pVSldaZ0xhVlRpY0Y3a1B1eWNxeHoxeUVENXlX?=
 =?utf-8?B?TlRWajE5emhIMFRPbE9UVlZTQ2RJaG51K3NPNkpsUG83eExoSjE1WTFoVDBw?=
 =?utf-8?B?aFpIV0loSkxDVldCR1M2VGk4Ti9GNjkxLzZVd2N3c01NbDFvSW85enJNVzJt?=
 =?utf-8?B?T0lUNEtCKzJ1WHNxdUlkZHFqMmhSNExkcUwwU0xOMmlnL0VwekYzWW1JV2x2?=
 =?utf-8?B?UWhXOHJqT0NwOE5kUUp2SnozTHBlTWlMWEZ2dHlaZlNxRCtzZExxblozRXpN?=
 =?utf-8?B?QXFXY1VEY2cwSEV4eTB3WUVPRFFUOUNBbStnMGhoU0dpMTZ6TGlwWkhwK3FF?=
 =?utf-8?B?ckZjSjJkdThnSDhwRTZWMTRoZ2J1MmZ4QkE3UHlINEFEZm9lN2VYV0RFeUNU?=
 =?utf-8?B?K25kOElON1dLeFdoK1VDZlF5RjhPb25Cc3NXak5qSGEzRFJ2Qkw0R2lZeE9Q?=
 =?utf-8?B?WVZ1K3d6UFlBZGJCQmRqNWM0SmlBZ2NubGdQTVZHcDRkTUlDM1RjTHVVZVNN?=
 =?utf-8?B?V2Rqcm95bzR4SkljdWFGejM3ajUyNWFzSFIyd3FNUXp3T0xjenFYZWtNOXMw?=
 =?utf-8?B?Q3luZ1MrbFljMnZGZjU4VDZ1Nm9DYUl4ZnlUbkhTR2RwODVFLy9QdVZUWTg0?=
 =?utf-8?B?b1Jid3pvWWRlejlMNEtWckNLRmdsTXZnRDNoUkdrcm45eVhpUklUOG92TFJ4?=
 =?utf-8?B?cmt2Vm1HZVdQdERHU1RNd1hiUGNOb09EU2dqZ1ZmNFN5UFFkcDJwZFUzamJz?=
 =?utf-8?B?cGFCT0hocnllTkR6b2hSWDRNanRGZU9sbmlWNVhQYzVucDh4S0dXU3dKbU1M?=
 =?utf-8?B?dlIxMlU3d1ZWUXh1TjlxejFrUHA4U2NmZWNMbGVFWEZ0b2oyRDdyZTVyK0tL?=
 =?utf-8?B?V0tpbVp0dzJWc2hLM1JVamRsNTN4UW9WTDhrWGw2WHppdGRGVmRBZz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f25728f-b24d-4ed4-3d8b-08df15016097
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 21:19:37.0907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZbm0Y8iZw41dfIFthB+XfqQvTgskMd3RpWnutXOkBlzO91edHTp13btDGaS6a4ikfN3aJkzzRiTEiFF7e5aGmKCU0NzSwQiZHnJEVmQRWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2579
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 21:19:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246091


On 2026-09-17 22:07, Richard Purdie wrote:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/3394

Hi Richard,


I forgot to test with musl and upstream fixed same issue in 
https://gitlab.gnome.org/GNOME/libsecret/-/merge_requests/181/ after 
release.

Will send V2 with backport patch soon.

Regards,

Jaipaul

>
> Cheers,
>
> Richard


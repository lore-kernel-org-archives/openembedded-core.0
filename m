Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA9FC021A1
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 12:21:56 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.130])
 by mx.groups.io with SMTP id smtpd.web10.14377.1739362909883033443
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 04:21:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.com header.s=selector2 header.b=eLFfsBpH;
 spf=pass (domain: weidmueller.com, ip: 40.107.21.130, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9Rd/RGfsIyaKBRX9zeBG/DvMhtn9hW3j8LaRUAizCCQmK5Ltfh93k6ZwklEu51wbYfXgWwoCMMU1nF1h39ioL0o86+T2QEUT+UifJRjNdckbdE1hCp+OFf/azgIevooFlPJAscPrJQfL/JmqPackw0fRsAXK5F7gmZGkWKgWNUlmeAkpF1w7N2dSRB1vCZbAIH7qTzsU8Y0YC9Y5Sk7aHR4SyHsiHNzXSikIY7bshYMTokBkLIlzJrOqenVw8myEZTGfkBw/yORQN3wj0jZ7TjC100qbvfzrkC+EXrm3CM550scp+t6IFyo2bEAqO6N5+gTOfdAEdRJkUi+AGsrZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9JYpoZsNlXLPxYMXNOWe2saUWKF57PJAaH0quEvwCos=;
 b=lQchhDBeAWz+v24lwuM9i00Lv3gfQV6XnOn5Qv7WMEzTQbZ4eead7KBQ0oZx22d/+BnJ/Z+7WoK0n+pFV0pXvBdFVkg/F5e8DE5KgT/WfEwtScG3WuzpuVrxI0D8XaKeZfv+jcS1M79csCHXh3jp2YN/JaAsTNe541UeZ6ZuO7T7QX0E1p7I20AMHEzGJHzapT6LFKUXaXK1/H6ylnmQvXa+bkSQZmjeQs0S7yRjCYQHxPvCEfoWColiad20cbBaXcGra7HcqZorsQdgfVEBIWmy5fITbXbGDyvddgjDS3OmPnlD99UjP9FFYPB2b59sVBmwk9BGq9r7Yx8OPOVmmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9JYpoZsNlXLPxYMXNOWe2saUWKF57PJAaH0quEvwCos=;
 b=eLFfsBpHR3z2DmhSQzAcIPYmyHV26VTAbw/X3+8SFA4vKMC0W69hyPLuuGKopRLFl+B9d7+NqhbTIFRLW1uDHH1VwxR4b2LAW9Rpx3sYt31AGrXoqvO4dKRWGzdGH8PvxRAYUmLz4HlUx/SqwnmZAxY9wJCc745K3O7YkEk6AIiNoP+CoCru328IGfeZHy09YxTaGJ+OluZLnBGoqT8qUixO84YXnZ2NbeOvDnCEiZzVQOhlZJwg2AyfAOW6MBil7p9ID5C5wHsa0rnaUCzMJ1Il5recjnpFv9S6jHYMnJrj5PVshzuIXJ68CqdgzX2Atk7zDRFmzGHTUQ2W2TA83g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by GV1PR08MB10522.eurprd08.prod.outlook.com (2603:10a6:150:16b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Wed, 12 Feb
 2025 12:21:45 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 12:21:44 +0000
Content-Type: multipart/alternative;
 boundary="------------EbsZu0IYR4ha3mhCl2RPsDqP"
Message-ID: <c21f19cd-10ca-432e-b1f1-77c4ecabf7a1@weidmueller.com>
Date: Wed, 12 Feb 2025 13:21:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH 15/30] classes: add early fetch, unpack and
 patch support
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20250211150034.18696-16-stefan.herbrechtsmeier-oss@weidmueller.com>
 <a1aed8bd862e921605dfa2762918b18fcba73ced.camel@linuxfoundation.org>
Content-Language: en-US
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <a1aed8bd862e921605dfa2762918b18fcba73ced.camel@linuxfoundation.org>
X-ClientProxiedBy: FR2P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::8) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|GV1PR08MB10522:EE_
X-MS-Office365-Filtering-Correlation-Id: a07fa413-9a36-4b40-1114-08dd4b5fd048
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VzRJN1VRSllUYjlWcG9KOXliMjJmdEdLNXY4MVBVQUVwUC85ZGJhd1BtOVVE?=
 =?utf-8?B?NlJHdWpTd2NCUWFkdTJPUnYrS0o4OVJhSDhJQVg4eHFBYTZRbll2VUdzeFky?=
 =?utf-8?B?d084dTVEa0FKUmhpZFh0akdQbVZpNTd3ZzRnK3N0RCtJSEt3dGR3cGdwNzdj?=
 =?utf-8?B?dFVsM3N3SCt3b1puUHlsZldNV1JuRllCeDBMY0hsaHdMZGowdTFNOGRHL2ZZ?=
 =?utf-8?B?VzJtclcxLzhSR0lEU3pja2ZrVThNbWxqKy9YQkpoVDd2bkFJRFRDL3BlcGlD?=
 =?utf-8?B?VUVBT0xpcVBGT3lISG84OGp4dlJXcXNHMkRDNDR2NG5sdkZROG8wdTBvVVdl?=
 =?utf-8?B?N3FrYU16b21xdkJ0a0lqdEIyYU0wc2FqRWUweTB2VjVUbWhabTcxV0MxMDY4?=
 =?utf-8?B?ZWJSeWJKNUdMSWhyZWNWbXZxc2F3YUJSOW00eTBiOHFIRHBZK0J2VEsyOUZP?=
 =?utf-8?B?RDNLU2FnSnFTaVJ3eGRzK0dPblhQSTdCWnFSdzFDTldoK2NSblRjSUFNTE9a?=
 =?utf-8?B?TTY5MUQwN2w4RGw0UHFIVGZuVnpUZmdNbGZNcFVnWVFFR0VmZWUxQjNQQzJD?=
 =?utf-8?B?bEszVTlWazJoaklsR1VvRXdRUVNlQlJ1a3Y3cUpIZXpYdlpqMGxhNmdtZUt2?=
 =?utf-8?B?MzhnYkJ5MFZSbUh4SUJnM3lJOFZzOTNTL0J1OTAxNzk1b25jTWhDNkd6TExw?=
 =?utf-8?B?T0V4SkNEdS9RVUhjZ3ptZTgxV0FuR0lnMnYzdVNmaWNYZ25FQkVpUEsxMzNC?=
 =?utf-8?B?eWl3R1dSWHU3L1RObENaSGNZTDF0d29nblh6MTBLUzNNazBIWmhEMjRwU2NQ?=
 =?utf-8?B?ZTdkMlZtdjZ0c1FHSmlqN002Q3NoWXptdXBtSXFadU5LN2FvYW40dnFTcjUw?=
 =?utf-8?B?R1FlU2d5T3JpWU03anFvRHZNNmNwVmQrRE93YTE4aFpNelB6U2dwLzJNVm9J?=
 =?utf-8?B?TVlqL3p4dm5kTVhucndyWlAzZmZ4cnpweHBFZmFNRnZzSkg4UmFUMjBPTmpC?=
 =?utf-8?B?a0NRNFh3K1dVRzJUd0JWVHNBUnhvRGV2RWJ6c2dSTzFFTzI1ckd3TElDOUNP?=
 =?utf-8?B?Q2ZwemVwNTM3SEVUUCs5VUJjSVhVY08yaS91S21vOGlTa0dDTEdITlNCdFB1?=
 =?utf-8?B?SVI3VkZMeW45L0MrMUhNdjF5MmNIaldQNFMwM3dNWWt5VnFaMTlBTmY5a2I0?=
 =?utf-8?B?SWRYbTFsdE9LZVJYQ0hoZUhDN1F3MitvT2JURXltVXpHM0w1WU5qM29UZEFF?=
 =?utf-8?B?Y3dUZTBPTkZYdFI1ZjhiTTlWWkVBUDRlWHU3UXJrbHBBdTFWLzB1NWpLenNG?=
 =?utf-8?B?SGhPOWRQZ0dnaUZiWmoweE9iNlA5aU5tcFE4UlV1bDRuSTVDMUFSL0drNjFL?=
 =?utf-8?B?d1FBRWk0NytreDZPR0UvVW85VTBYdm9WUHBqRmZPQWZ2VlVvbWx1THFEdGx3?=
 =?utf-8?B?TVExRm4wUHJYem1sTE4xeUk0ZlhjZ05mUndoRGpvTHVrVFJaRWRlZ3I5ZDFm?=
 =?utf-8?B?OXU1U0RzT25pMHM3SFFMZVJ3NTRZTnVXWUUrSFhud3J4d2dDajIrYXMwRjRI?=
 =?utf-8?B?ZmFBRUlEWjFXVmRrT3J5U3FGUmYzaUpWRkdEVS9uZUdEc1VUbWoyZXJrNlBM?=
 =?utf-8?B?U1l3TWs0cW9KY3YxenBuaUY2Y29kdU40RkJkbnZjYmZFVWJoYmczbUxLUExS?=
 =?utf-8?B?SEo0cC9xRFcrR1RQSkhFS01OSUVLYmFBR0M3SzVzdTM2VEdVTmdoSkVUV1U1?=
 =?utf-8?B?dnkzRmZ6MWZQSjZwTU92N0F6K2ZLWGhkeW5Pand0MU1xdU1iTDQ3ang0bUQ0?=
 =?utf-8?B?bEFqazhvQXpkUkY2RFZ1REFUaklLRGk5ZXFqRzlTWXo3bnlQTUZmUng0VFpx?=
 =?utf-8?Q?pvfCowexVeVuV?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(8096899003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VW44MVRCQUsxZ3V5NmdoVEF5VWlsZEFmajQ1ZVNXb01jWFBlbkNaN2sxTjJ2?=
 =?utf-8?B?RitLNlBkZ1VCSmRoK2QwempjM01rUTVPRCt1TmtXT1RPbVdqYktxLzcxVGk5?=
 =?utf-8?B?N3c4bkxZdTFlazBSNkdBMzB4QnVzZ0tNNlNJTEtFWVBGSGlwMzAybmJhNEth?=
 =?utf-8?B?VTRNTDZ2Z0ZialQxMEVuWStnS3ZGbFdCdi9ud2xXN1RIYnJlU1pPWC9ndStw?=
 =?utf-8?B?THE3TXpDTjNIM0VBUlI4aVA5ckplSk5OTnhic1lqanUvZ2szeVRYc3hha0Zx?=
 =?utf-8?B?cUVzVXRWVTJpMnAzYzlBbnM1TktVNjVCd2o4WmFaOFIwSGZiUERyK0FYVStj?=
 =?utf-8?B?U0lRM2NPejU3Z1BzcCt4YnJBV2xzZTlnekF0MDhIUU5GOGtqZUtOTWxyckJQ?=
 =?utf-8?B?ZjFUVFFBdFF3b3ZKZ3lxend5VUQxanNPMytIcjhTQXRkTGZoZng0K1BwWk1s?=
 =?utf-8?B?ODBhL2ZocktYU1oybVg1blhiVmhWWTZOY2hHUndBWGY5TncrSXB6Q1l5S0dY?=
 =?utf-8?B?eEcyaFNZZXJKUE5pa3g0aS9RNU9XZmVhbHdvVDB1YXJwekN6Z3lYTE5nbk1k?=
 =?utf-8?B?WVFORmc4QW5zeTc5RHVza0lpK2xOcVd3OFNIUTR5R29QTHZBa3dGRk9KSXg5?=
 =?utf-8?B?WmVHTVVJbVpQTXd3ZFl5ajNyWHJDd2xyRXVYNmFzaDNHdUdtRVAyU0lmcm1Z?=
 =?utf-8?B?N1NIRjZ5OFpMcE1EU25ycmpnSjhwM00vL0VFUTU5OWFDQ3l4UGhWcDg1SFRC?=
 =?utf-8?B?VXhiS2t4enhlU29yV3h0eVdwcEhVYjNrWmx6SUxCRUx4cTJLNGlQRDlkNHNx?=
 =?utf-8?B?NGMxN3J0SXJQbUkyeDNzUllqKzhLMGZBNmEzTXdkM0M1ZmsrcGtvY2NGYjRj?=
 =?utf-8?B?c2Q4ZkVoZGZobmVaam83RHpNaEhzeHJNd0dGM1V2Sks3aXJFLzJWNjVrK0RS?=
 =?utf-8?B?anNmRFF4eFFUOXVFQU96OUtFZWZYSWErRm5WMzIxSzhLdDJvbEdHaldqSzRq?=
 =?utf-8?B?eG1vakdUcys0c3lzZXNoQVZ0S0tnWkcwd3haQWczanhudWVVazI4SWdESWxy?=
 =?utf-8?B?T0MyV2VuS2U2TXg5bi9XOHkzQWxuL1NUQncrSG56czBFalBKaTRyVERCMXdB?=
 =?utf-8?B?Z2dxNzN4MlhlQjg5REgyUHpoUGI1dDQzTVovU3diV0gvMFBIcFJHSy9sM2Zi?=
 =?utf-8?B?RzYxa2RKSHB4OFIrczNLZEs1cERrNDRZWVdPc2tNTVFxOVFESCs0eXFZaXI1?=
 =?utf-8?B?Y3pzTXhUSFVEemxJeTVEUTE1ZzlYeXhWaDhqSHJaeXJIaysyZU1OaVp1RElh?=
 =?utf-8?B?YlBhMGYyaThBUHAraWdhUGE2TVdvMUdBSXZqZDZjYlpNUDFhcGZiMkNLdXdi?=
 =?utf-8?B?dGFXUm9vQ29zaGZJczF5Ym9DcXlLTGwzRDZERHpwdDZoam9FdGV2UXZFcE1W?=
 =?utf-8?B?eXJIV1hrb1VmWXZvUUhpQzdaRHFpLyttSlBWeVZMZjRFODBKUUNibkd3RDFJ?=
 =?utf-8?B?TzdwOVl3RGNIQ3Z2RWpjcktEUEluRklKa3dlSFpwMEI2WUI0RU9tRUlES2dj?=
 =?utf-8?B?QVlXTWNqdXN4ZVlvN29Ud0k3MG1FQm12eTNkNlEzdEZTeTJzRThOTWFVSGhU?=
 =?utf-8?B?eWNVV0NzRk1wNENNTlVobURjYTcwdnpMOHRaR1AvekhuK3FUNjRCM21rYk1U?=
 =?utf-8?B?U1N2OXBINlF0bFArZjcwUmYrN0t4UlVBclNSRFlCdndnMS9OOUFPcG5xSU9z?=
 =?utf-8?B?cy9NR2RQM1ljZk5hRmRmY1RXaG1NUVo4MitFVHAwMnF6cVI4Y1poK1R3Y1py?=
 =?utf-8?B?L2hhY1lSZWhxLzFBa1RmUGJudFhNaUhNUGxsMS9iUTVHVnBtQ2V0NEhqQkM4?=
 =?utf-8?B?WlRoOEluZnQ2NDRPTFFtTUFJdFBoeUVzUlJrUTVlbDl3aVliM3BjV0VJeUVC?=
 =?utf-8?B?M2V4Ty9FMEd0ZXEzOUp5d0NoQ1FDL2ZiNGRDeGc3dFk2UExZT3AzQUtDTUVn?=
 =?utf-8?B?RkFiakphVVVZTm44N21oQVRqWE1xRjZvbHgySlpiU05lRUltaW82bTFBYitj?=
 =?utf-8?B?cmJDeVhLd0ZBM1BvaGRERUNiR2pFTjhkRG16SWwwdEVPOFE0MlZFbmp0QU5M?=
 =?utf-8?B?YldlUk5ITlFrMzgrdVUyTm9hRXlkVUc4cnVuSUhSMElMU0RZUFFMcFcrS3c1?=
 =?utf-8?B?eGc9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a07fa413-9a36-4b40-1114-08dd4b5fd048
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 12:21:44.6676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j97xe30TlU3xc4THF0TOc4xrKkDIFw7zFz/tWZR30t+kkBp1PRpSCUZIHeYIxEnzOy0HzcMr6rSVi5wvarmzfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10522
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 12:21:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211228

--------------EbsZu0IYR4ha3mhCl2RPsDqP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 11.02.2025 um 23:27 schrieb Richard Purdie:
> On Tue, 2025-02-11 at 16:00 +0100, Stefan Herbrechtsmeier via lists.openembedded.org wrote:
>> From: Stefan Herbrechtsmeier<stefan.herbrechtsmeier@weidmueller.com>
>>
>> Add support for early fetch, unpack and patches task which run before
>> normal patch task. This feature is useful to fetch additional
>> dependencies based on a patched source before the normal unpack and
>> patch tasks. The patch are marked as early via an early=1 parameter. An
>> example use case is a patch for a package manager lock file (Cargo.lock,
>> go.sum, package-lock.json).
>>
>> Signed-off-by: Stefan Herbrechtsmeier<stefan.herbrechtsmeier@weidmueller.com>
>> ---
>>
>>   meta/classes-global/patch.bbclass | 17 +++++----
>>   meta/classes-recipe/early.bbclass | 61 +++++++++++++++++++++++++++++++
>>   meta/lib/oe/patch.py              | 10 +++--
>>   3 files changed, 77 insertions(+), 11 deletions(-)
>>   create mode 100644 meta/classes-recipe/early.bbclass
> This level of complexity is going to cause massive headaches in future.
> Having two fetch, two unpack and two patch tasks will ultimately just
> cause a lot of confusion and make things like the SPDX code and
> archiver code more complex too.

The tasks don't really increase the complexity. The fetch, unpack and 
patch tasks work like before. The archiver and spdx classes are updated. 
The main difference is that they use a function and not the SRC_URI 
variable direct. The early tasks are only used by the vendor classes. 
The old tasks handle all sources including the dynamic sources. The 
early tasks works like the normal task but with a filtered source list. 
Alternative the steps could be included into the resolve task.

> Rather than patching a cargo lock file, I'd probably prefer the correct
> version be added in a later SRC_URI entry and used to overwrite the
> earlier one at unpack time.

Is this really practical? In many cases you have to update the 
dependencies of the dependency or other meta packages (.mod). It is much 
easier to update the dependency via the package manager and create a 
patch for the lock file. Take a look at patch 26.

> I appreciate the challenge there is then that fetcher isn't going to
> know what it is fetching at fetch time though as it would potentially
> be fetching with the unpatched lock file.

In worst case you have to patch the lock file so that the package 
manager can create the vendor folder.

> This is partly why we end up with the .inc files the way we do, then it
> is explicit.  I'm not sure the fetcher can know deterministically what
> it is fetching in advance without the .inc data though, which is one of
> the concerns that have been expressed previously.
The .inc file is generated from the lock file and the lock file contains 
all required information inclusive check sums.

I'm unsure if the old process of updating a SRC_URI in a .inc file is 
useful for package manager dependencies. The upstream project use 
patches to update the dependency. The .inc file is auto generated and 
any manual change need to be documented otherwise it is unclear how to 
deal with the change during the next update. The changes in the .inc 
file generate a lot of noise and complicate the review of manual updates.

Do we really need the possibility to change a SRC_URI outside of the 
lock file if we integrate the package manager into devtool and allows 
the user to manipulate the lock file via common tools and commands?

--------------EbsZu0IYR4ha3mhCl2RPsDqP
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Am 11.02.2025 um 23:27 schrieb Richard
      Purdie:<br>
    </div>
    <blockquote type="cite" cite="mid:a1aed8bd862e921605dfa2762918b18fcba73ced.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">On Tue, 2025-02-11 at 16:00 +0100, Stefan Herbrechtsmeier via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Stefan Herbrechtsmeier <a class="moz-txt-link-rfc2396E" href="mailto:stefan.herbrechtsmeier@weidmueller.com">&lt;stefan.herbrechtsmeier@weidmueller.com&gt;</a>

Add support for early fetch, unpack and patches task which run before
normal patch task. This feature is useful to fetch additional
dependencies based on a patched source before the normal unpack and
patch tasks. The patch are marked as early via an early=1 parameter. An
example use case is a patch for a package manager lock file (Cargo.lock,
go.sum, package-lock.json).

Signed-off-by: Stefan Herbrechtsmeier <a class="moz-txt-link-rfc2396E" href="mailto:stefan.herbrechtsmeier@weidmueller.com">&lt;stefan.herbrechtsmeier@weidmueller.com&gt;</a>
---

&nbsp;meta/classes-global/patch.bbclass | 17 +++++----
&nbsp;meta/classes-recipe/early.bbclass | 61 +++++++++++++++++++++++++++++++
&nbsp;meta/lib/oe/patch.py&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 10 +++--
&nbsp;3 files changed, 77 insertions(+), 11 deletions(-)
&nbsp;create mode 100644 meta/classes-recipe/early.bbclass
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This level of complexity is going to cause massive headaches in future.
Having two fetch, two unpack and two patch tasks will ultimately just
cause a lot of confusion and make things like the SPDX code and
archiver code more complex too.
</pre>
    </blockquote>
    <p>The tasks don't really increase the complexity. The fetch, unpack
      and patch tasks work like before. The archiver and spdx classes
      are updated. The main difference is that they use a function and
      not the SRC_URI variable direct. The early tasks are only used by
      the vendor classes. The old tasks handle all sources including the
      dynamic sources. The early tasks works like the normal task but
      with a filtered source list. Alternative the steps could be
      included into the resolve task.<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:a1aed8bd862e921605dfa2762918b18fcba73ced.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">Rather than patching a cargo lock file, I'd probably prefer the correct
version be added in a later SRC_URI entry and used to overwrite the
earlier one at unpack time.
</pre>
    </blockquote>
    <p>Is this really practical? In many cases you have to update the
      dependencies of the dependency or other meta packages (.mod). It
      is much easier to update the dependency via the package manager
      and create a patch for the lock file. Take a look at patch 26.<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:a1aed8bd862e921605dfa2762918b18fcba73ced.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">I appreciate the challenge there is then that fetcher isn't going to
know what it is fetching at fetch time though as it would potentially
be fetching with the unpatched lock file.
</pre>
    </blockquote>
    <p>In worst case you have to patch the lock file so that the package
      manager can create the vendor folder.<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:a1aed8bd862e921605dfa2762918b18fcba73ced.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">This is partly why we end up with the .inc files the way we do, then it
is explicit.  I'm not sure the fetcher can know deterministically what
it is fetching in advance without the .inc data though, which is one of
the concerns that have been expressed previously.
</pre>
    </blockquote>
    The .inc file is generated from the lock file and the lock file
    contains all required information inclusive check sums.<br>
    <br>
    I'm unsure if the old process of updating a SRC_URI in a .inc file
    is useful for package manager dependencies. The upstream project use
    patches to update the dependency. The .inc file is auto generated
    and any manual change need to be documented otherwise it is unclear
    how to deal with the change during the next update. The changes in
    the .inc file generate a lot of noise and complicate the review of
    manual updates.<br>
    <p>Do we really need the possibility to change a SRC_URI outside of
      the lock file if we integrate the package manager into devtool and
      allows the user to manipulate the lock file via common tools and
      commands?<br>
      <br>
    </p>
    <span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------EbsZu0IYR4ha3mhCl2RPsDqP--


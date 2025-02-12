Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56830C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 16:23:48 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.97])
 by mx.groups.io with SMTP id smtpd.web11.20192.1739377425385838304
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 08:23:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.com header.s=selector2 header.b=K2igV06Q;
 spf=pass (domain: weidmueller.com, ip: 52.101.66.97, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MeVPib2ASEoE1UpI+7ITB1E2aQS9R8iNGBMxjFTFPuOEYr7CkYXEqaqxAUV5G4c8N9hPQV15E/FLG7Li5ifZcCwbsH1x4T28KB9wInE89j4Mq9kkRmk3jhTNedba3RFQgXpg9C/WBFMOfECZMg2NLHMJh1iQDnxe3BB2A4+1mvHoEa49NZA3auYHfUXGtNQHNKZPK2a2oVow6GbU7YOKUCSGv2gpnc+ZTzEmzqIHhjaAqIkK8sk+1JvwqPI2SriqkSgJ8FoZDvuR8IOMTzajX13HKbKYJHi3gBC0uTEKko7PTNF0Vc9W1zgkLDb6Vi32yyASZa/MGJlqFyy+cGEtfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5MT0fL05iQhYQ//Jm0gZv7oSd/hFlOz7IUxNJ9/7Z/Y=;
 b=EgZbJLoz+f2yMgKtV089UIa9Y41zXvlkaOeQ752OKdcpPlCMcHTqbUpSamVBztTkjtI2peXIETGDVqULntnYg5n2TAGh5sw3c8nSJaDYD6PoeI0CW72Pq/343JqcrAsN110KDxNeLerd0/rBQZCWkiS/+Y6jeDw1BwNpjNouZA25flnXr/rHcZ2HSUOKuSbP71imU+oOGoIkig36jwHKl6mOCKAFee/w0Ju0++9GRjB02vMvHAL8rnhAlBA/8E8h2Oaz0R1UK4nhzt/uavWWEQZgS1n3DXcPQWdz14RULnQ2XSmfRFGqqdjLMqWisP+RuzDv9Ya0u6a56ngii9ykvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MT0fL05iQhYQ//Jm0gZv7oSd/hFlOz7IUxNJ9/7Z/Y=;
 b=K2igV06QsJ8p/OQbdckLZ7MEARtjwpBZBuvDOkxLLcJX3K6a1lgdwiWPv8xWuzwr+C/W6x29piFiEUqsdTNYXMhRXiLCpzDLQnmZkUxwalXCbS8GpHzRf4ONEGbUW1DNSeIvYy+Fv2Loi+TQK9Uhv3CrZqIdOc0hnu59Gi4k+giyV9pRh35ItoIFNgYArp9dnHFjD6G/rCyCZBpc14CuA/I6HF/04kZZNAJtyve1GRsaLjzSQdfPw40QHt0wuYDf6EZeeOCfvMcEXVkwnHcv42REpt0y81QGhuqItraGj53ZMio9KNk4ZAu45Eog8zL+ViEvGx1NV0UbUUawpJbMXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by DB8PR08MB5387.eurprd08.prod.outlook.com (2603:10a6:10:115::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Wed, 12 Feb
 2025 16:23:41 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 16:23:41 +0000
Content-Type: multipart/alternative;
 boundary="------------honjObaM0qW0RsEyeWZQlklu"
Message-ID: <80325495-5147-4992-a2f2-0f2056397ae1@weidmueller.com>
Date: Wed, 12 Feb 2025 17:23:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH 15/30] classes: add early fetch, unpack and
 patch support
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20250211150034.18696-16-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CANNYZj_NRnwCXUm3zA4QX9pTdF_d9xOi=x8CVW=1XCtSSWo4ug@mail.gmail.com>
Content-Language: en-US
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <CANNYZj_NRnwCXUm3zA4QX9pTdF_d9xOi=x8CVW=1XCtSSWo4ug@mail.gmail.com>
X-ClientProxiedBy: FR3P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::22) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|DB8PR08MB5387:EE_
X-MS-Office365-Filtering-Correlation-Id: 92a27753-6db1-49b4-2c1f-08dd4b819c9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QkEyWVh4MjA5WlZ2WnlTaGFidEk1QnhVdzA3Q1JvTngvWGVEczhkcTZ2ZVk5?=
 =?utf-8?B?cWFkaDRZVkJSS3NUWm40Nkh4L1FEeVBjYWJRYVdaRkZQaDlUWmlxN1M0cTNx?=
 =?utf-8?B?TnkvQXZocFhsT0h6QU9jWFN6QTlzeFltUkJZbENsNnBEKzUyM1RDaUlvcHdU?=
 =?utf-8?B?VExGMVdSdG9qbGNSdVZkajlreUM0cmZuVDBLYVg3V2FiKy93NHpmeFp0T0tI?=
 =?utf-8?B?VmFBUVNEN0FQOERrSTJveUhZSmdzb3ZBTFE3QUhHNFNYZndtVWdYR2FmZ0l4?=
 =?utf-8?B?WlUrRmFNSWpnM1VpcmZrMW1HZlhEekxoT2VLQlJudUZINk0rSGZPRDNHeHUz?=
 =?utf-8?B?eHVoTVFDazBqUnhlZldCcU91MnJIdEwvM3lLRDB0VE9tcG40RGl0VmZ3ckNE?=
 =?utf-8?B?NUNHaVFETVplblRkeTZmbDdBYndkVDR2OVpZRkRBRjUySVgvT2xMdkpjUGVP?=
 =?utf-8?B?Rkp1NzNScDJlWU5rQUtqOFB1N09wMmpGWUsxUlZCZmVmQ1dCUUxmcTB2QzUy?=
 =?utf-8?B?MXVScDV6V0J5VWpXcnI4OUNpK0Q1NU9EOXhZdWJ5ckFiY21JVXE3Y0xnaHZ6?=
 =?utf-8?B?TkZUYUxZWnE2VmRTbVJubmNFOGt1aytVdG55dzBycDQ1OXhoVDAybVpVUmVk?=
 =?utf-8?B?YlM1dTdpeHRZaWZxM2JXNUdrT0orY0VBR08valJ1MHpzakF0MDZWSUpkejFn?=
 =?utf-8?B?UlVOcERqMU9LWDdKREh0ODdEeE9FYjlEMERUWjZkVkRIcEdIeUVoamFrNjVx?=
 =?utf-8?B?RUMrQ0ZCak04VWlGNDgvakFGcnQ2dTVVNThkdnR5UVlxYnpkWGNubVFVZHp4?=
 =?utf-8?B?K0dINmpia25BMnA2M3Nrdm5INU5PQTQ1azdhaU0rU1lNc29uYTBuZ3dtQkpS?=
 =?utf-8?B?YzAyVUtHOUpsZU92bTU5T1BCVWZaemRMS3d3aG1pWTBHRmVOTkx5M24vL0p4?=
 =?utf-8?B?bXV6b1A2cVlqRFBnVVhNUDB5MEdkK2MvZklIR0R2bWIvb3FNcExxeFhqL0Fs?=
 =?utf-8?B?aWJ5UW96eVUyN0lJR3FFOVFLNk9jWjN5K1pnNDU4MDNoOUdNT1RjNVIreFFl?=
 =?utf-8?B?dVpWM0JHak82UGEzbjgxVlNqR0NLMjA0eHBNZkNvaUxacVlPb1piRXd6RVlG?=
 =?utf-8?B?em1JUEFUK05vRFd3empZbWVEUG1EQkMyaVJsMlllNzliQmgwL1RQTjdHV0pJ?=
 =?utf-8?B?N2VpZnNqbHRmbzBTOTJLVFFkRzMrdVYxZExHK3Awd1VWalBRMTVKVmVnbnVz?=
 =?utf-8?B?eGNpVndLYkNpaUlhbm03YzhzZzdDbEtKUzQ1UUVNQ3dRQ0tIWDdyZFB0LytL?=
 =?utf-8?B?dTltYnJkZzQ3VEYxME4vTXhGQnJRNmNreUdYQnpWZGZ5QklWVFlzd25VQkdu?=
 =?utf-8?B?OWxXU1FSeFkvc3RnSVFkZHBXdTFJNkxDcFIzTnRRdkg4SmlqRW5PemFjQjJV?=
 =?utf-8?B?cHRvK2Y0bXJEOERuVUhOcG8yclhSZm52UU4ycWZ3TCt3SkpEZE1CNUxZVFM2?=
 =?utf-8?B?Qy9mY3dXSXBCS1pjUi82bVRXcHFLaUxJYlF5c3pVbEZGMXFnWjhpTE9RcG5j?=
 =?utf-8?B?NDFXRGk2Wnl0WDArOE91RFliUnFOcXQ4Q2RKVks1czBFM29JUFQzc2UyRDBS?=
 =?utf-8?B?N2IvWFlpZTR1dGZabS9jN0pOeWgvTDFuczdvcnpUeEZwdG5Ya2tBdElHODVw?=
 =?utf-8?B?ZnNobnFPWlBNRHVZYkUwazRGV3RkNUFRK1FweG5rRElFbDBaYzMvSVpSaHpO?=
 =?utf-8?B?c3B1KzZ1bThzR0ljb2ZMYXVyM2RlNU1xSEh4YXZHMFJib2JwRHN5T0ZyWDl5?=
 =?utf-8?B?Y1J5ZURrMktFUjdTMU5RRFlEbmhsQ3J2OGg5aWlkT1FBNGVuTDNSeFRsTHRv?=
 =?utf-8?Q?PPVJWaM8AozPR?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZVk2SUNveVlHaFRTWndkOTJMQUMyem1XRWlVMUx3VXEzdXRjWWxCSTFoUVFt?=
 =?utf-8?B?MzY3VTNWcDkweXRtRmRMZzFqU085OHFnejJuTUhERlVpVjN1QmVzMXJtS05p?=
 =?utf-8?B?dzFtVHRlZHo1OUErV2RJMTNIZ0dsQWdReUY2OGxDQUlmTHZuM09FSWw2Z1pQ?=
 =?utf-8?B?KzNwZHR0WEFRTHhYdEVreC8vYjJ4dmFRU0lQWW9lTEV1bDdNalc3eGZkRTVm?=
 =?utf-8?B?UWxXVWh2a2lwUEdCcllMaUYwYjAzV2FSRVYwbVhHdzJDeE41NWwvQ0VsU3Av?=
 =?utf-8?B?c3JUNDBCa3R2Q3dYajNwWXBWTjdycmJNaDJjUnVWTlBydUhTTUlTWTRKNUQy?=
 =?utf-8?B?VzY3OUZEeExVY0VDQ0hXcVpSREFHdFNmaGV4Y1RRUG1LRjh2MkhBZ2QzY2lD?=
 =?utf-8?B?OW8rRGhiMGVxNHcvZWNWRHVyN1p2Z2p1MUZNaUphbzlxOTFFdnY2dVpHTlRz?=
 =?utf-8?B?T09rT2M0M2c1MXFEVFFsc3Nzc0RFaTRpM2FxS1BhQlprZG02eEFkbUs3T2J5?=
 =?utf-8?B?K1YrZ2lWTEd0LzRldE44clFOSlQ5dGpRNW5GNjRiZFlPZGVidjZXeDRCNW5E?=
 =?utf-8?B?eVZTQWtGSWY1VE1pYlhLdi8zVWhXNWlUVEE4YmxjQU5sTU1VYTRHYzRScUNw?=
 =?utf-8?B?YlFrWnVxeHpnSFNKWXZaNnpDeVlvTTdQR0VxZEZJeWY0RjhyRng1a3c4dndK?=
 =?utf-8?B?N2R3V1hiQy9NcU1mM1FiQXBaSFlkWXhSRnpsNFVOcUpiT3J5SU9JSmtvOE1M?=
 =?utf-8?B?Q1NqNVEySVlVci9td1dsampQeE1ZQTVYdFBrRWdFSzAvWENOeFpnMCs3R1Jr?=
 =?utf-8?B?RWJ4N1kxc3pVb0xmaXpDeE5BdWhoNk54Sm5TclRmWE5SVjh4eUswWGc3Z2tz?=
 =?utf-8?B?TitCdWdLVEJibW0wbjJ0cWZiWkZnRTl3VGZIWVZJSEpEbmUxN1RqTEFjeVZ2?=
 =?utf-8?B?QXlQMmJMcGNTUU5OYjluT2FyUnVBTjM4ZnpZdVFyV0FGZkIrelY0VjU5Vlcx?=
 =?utf-8?B?empiZHhUTEV4bmpiazNnejA2bVNiYmt0RWdjZEk3WTNrQ1dlZjA1R2hTMHlP?=
 =?utf-8?B?bWIyRjkvSXgvUWJNWTd5OXMzYm04MDdyTWFKRXNTeDQ0dlhmTzRNa2xtckkx?=
 =?utf-8?B?VXJFejIxTFdlTUhXeTFsWEtGWnJ0Y2pDSHFRajZwMzdzSkIvQW5tbEFobkdP?=
 =?utf-8?B?YVpSNW1IdGZESmRrVVRnd25qR2wzVXg3cHV4cGdnallscjJKZ3p3VmVBTnQ5?=
 =?utf-8?B?RWVEMEhPeHgzUVpzaDdKUkEzc29wZ1pZY2NpM0JacEdqaVhyamViSis1Mllx?=
 =?utf-8?B?YnVUeXJwSlBuVE10NHIzMHVQL09MYmljTjZtZis2QzlPNlZtN1FlaTkxSTV1?=
 =?utf-8?B?aU43aGxFMXRNUzFzTGprMStYZDRBbXE0QU53MWFLWGJ5dGxwNzZXMHdYd2Ur?=
 =?utf-8?B?Z05jNmxPajlnRzJTZExGWGRTY2JEWU9Gd3RnZFM3eFYwcVVsQVlHaVhKUEc0?=
 =?utf-8?B?NWI2MnhOYk5pOHdYdnlYcDhIZ0k4TnV2cFZKR0VWVFVFWCtKZUo2K3Z5TjBh?=
 =?utf-8?B?MEFYTUV5dURrS1hjZlNQNEFYNDhueVhaNm9VODJYaDVKVjYrcld2UGhiSkZI?=
 =?utf-8?B?OVkvcG9yeUZPVUFualpVUk5keW5RemNUTFNkTktRMFp3ZEY0aVF1ZXNUWU9t?=
 =?utf-8?B?SUdFNFljTHB1c1ZsUGxSUkc4RmNCK05xOWc3QlFoTCtJUEg0RW02UmpNZ1dt?=
 =?utf-8?B?THZsVWxlNDNWSk5YcFg4eWRydXQ2a3Axdi9mRmRUYUVSRmxkazRDN0FqUkYr?=
 =?utf-8?B?aUpoY0dvSXh0Qk9yektXTnVZWjVhYzFlWCtrdWdXbWtpYVpwcDZ2cllzZ3FU?=
 =?utf-8?B?NTErbC9mZ1REandpZ3NtRWJSNmI3V1k5MjFRazMwY1dDV1IzQjJPVGR4ZW90?=
 =?utf-8?B?SmF6OXRmVDdPN2cwdktHWnRORC9xUFE2TFZrSWJEU0NuRm5nbk9qay9VRU9t?=
 =?utf-8?B?ei9vL1dtVFlSL0JJREd5cVVHYnR6Y2NWQjdMQ3BpTUpxNDdMY081ZkdlbnE2?=
 =?utf-8?B?UHNNdE5COUluUG1NUDZmbytmS1BHWjFoMUJPV1g1cnhFYnpjZDI1elc0eHor?=
 =?utf-8?B?ZVR3Tkh3N2lORGNUNnNiRVJVRXBESkNSUktLR3pURWNWQjg4MW1SaGZZZWov?=
 =?utf-8?B?L3c9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a27753-6db1-49b4-2c1f-08dd4b819c9a
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 16:23:40.8792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otSHNJAzmqXelQcala5ccwUhUCMN4GQu3mN+7DK2FqMN1hddElpuXWqr3fBF1hGFJBxsqcpFugXWSn3ZO5LEyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5387
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 16:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211260

--------------honjObaM0qW0RsEyeWZQlklu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 12.02.2025 um 12:08 schrieb Alexander Kanavin:
> On Tue, 11 Feb 2025 at 16:01, Stefan Herbrechtsmeier via
> lists.openembedded.org
> <stefan.herbrechtsmeier-oss=weidmueller.com@lists.openembedded.org>
> wrote:
>> Add support for early fetch, unpack and patches task which run before
>> normal patch task. This feature is useful to fetch additional
>> dependencies based on a patched source before the normal unpack and
>> patch tasks. The patch are marked as early via an early=1 parameter. An
>> example use case is a patch for a package manager lock file (Cargo.lock,
>> go.sum, package-lock.json).
> Why there is a need for additional tasks running before regular tasks?
> Can't we do regular fetch/unpack/patch for the root item, then run
> fetch_vendor_dependencies, unpack_vendor_dependencies,
> patch_vendor_dependencies?

I use early task approach to keep the old behavior. Other classes like 
the archive class depends on the unpack task and expect that everything 
is unpacked after the task. Additional the user use the fetch command to 
fetch the dependencies. Therefore I add additional task before the 
common task to keep the known behavior.

> I see that others expressed dislike for any additional tasks in
> principle, but I don't think that can be avoided? You can't know what
> else needs to be fetched until the root item is unpacked and
> inspected. I'm ok with that if the additional tasks are clearly named,
> and implementations are short, sweet and obvious.

It should be possible to move the early tasks code into a prefuncs of 
fetch to avoid additional tasks.

--------------honjObaM0qW0RsEyeWZQlklu
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Am 12.02.2025 um 12:08 schrieb
      Alexander Kanavin:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj_NRnwCXUm3zA4QX9pTdF_d9xOi=x8CVW=1XCtSSWo4ug@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">On Tue, 11 Feb 2025 at 16:01, Stefan Herbrechtsmeier via
lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:stefan.herbrechtsmeier-oss=weidmueller.com@lists.openembedded.org">&lt;stefan.herbrechtsmeier-oss=weidmueller.com@lists.openembedded.org&gt;</a>
wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Add support for early fetch, unpack and patches task which run before
normal patch task. This feature is useful to fetch additional
dependencies based on a patched source before the normal unpack and
patch tasks. The patch are marked as early via an early=1 parameter. An
example use case is a patch for a package manager lock file (Cargo.lock,
go.sum, package-lock.json).
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why there is a need for additional tasks running before regular tasks?
Can't we do regular fetch/unpack/patch for the root item, then run
fetch_vendor_dependencies, unpack_vendor_dependencies,
patch_vendor_dependencies?
</pre>
    </blockquote>
    <p>I use early task approach to keep the old behavior. Other classes
      like the archive class depends on the unpack task and expect that
      everything is unpacked after the task. Additional the user use the
      fetch command to fetch the dependencies. Therefore I add
      additional task before the common task to keep the known behavior.<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj_NRnwCXUm3zA4QX9pTdF_d9xOi=x8CVW=1XCtSSWo4ug@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">I see that others expressed dislike for any additional tasks in
principle, but I don't think that can be avoided? You can't know what
else needs to be fetched until the root item is unpacked and
inspected. I'm ok with that if the additional tasks are clearly named,
and implementations are short, sweet and obvious.</pre>
    </blockquote>
    <p>It should be possible to move the early tasks code into a
      prefuncs of fetch to avoid additional tasks.<br>
      <br>
    </p>
    <p><span style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------honjObaM0qW0RsEyeWZQlklu--


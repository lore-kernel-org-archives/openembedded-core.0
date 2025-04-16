Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4CF3C369BA
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 16:16:45 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.78])
 by mx.groups.io with SMTP id smtpd.web10.23769.1744820200439553300
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 09:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=FP80KiNW;
 spf=pass (domain: oss.nxp.com, ip: 40.107.249.78, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yHotVDBt0cLcDUwMvLwyG5zj+m3v+9wg0qYf6U+nFf8Xzisl82LPSkWh5sRjWqRfQSsbBqbQOZXw714rHTc7WA215emVnAEp5pX9bLufjwytNBAff0+Nkn14OXkYh2hOO5EFrfen1/XnH/l2K5cTNZAHuFfXBUt2J1XEkMjDA8wnXVfYMD4KYvsMMHpn7h+ed630u/GGB11rdWYU+P66g1i80Xzntv5oc6Vuq1mVm/RHncrLHS6vH23r3jcgxiF62nRhQVB3EWMowHUIndVUfJQMi35A6FPIxbFhVVAypPPTdERR/22SCh3mllUbRtgs8+ck7uIJYn3zzSxM9f/TzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/DYqGdSVPsg5/Bx77Figctcl7kjHisuw6/sk1nZ+K8=;
 b=TNvn1d76s/w6kPZFccL+XXGO+NW2L8P2MHo79L8E6oAIa5y6Rk5Eo+PIUonLG9iR71oV1rCeslxQBcudvsrCcDBZlpcZwNqQ8pEK0+s6rHs13i/S9hsWWm6WafbDSksMxiikcPI48nDXRC+ZZqDvFUmmYnaAJu0KXPKOExnNLc3c69560ADFo7paqk10gves6swmDgEZO1ccQ/VcMSDggPzWwrA2OK4+ANsDV9n3MaEE37mGewz1wt9j19A2+KtQlL14vGbQQAvdl2FzF1xsHma27qhf9MN9jLpOpNfnPdav7cfY3MIVUqmjV8Z1F2g9+JPR4ovJY0Sm0a5q/QjT1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/DYqGdSVPsg5/Bx77Figctcl7kjHisuw6/sk1nZ+K8=;
 b=FP80KiNWq5kh1JOc1as9HjwbTZ17aOpP4pZtsyPRZBlykusp8x5NilfaW6u/JwsK9/a48tfjxl0Oe/yWSXdB1U2lNvxheTmHj2YNOa+T4OKOIaGmTxNmJXfTLjnUJ7UkBCK3mlUa+3ZrcopXDLs7dQ+VQ8yE84aSrE2Wdk+7E2JY/Vidlc1ez2aq81kTZsUCmbAx1LsW/i//AUddnUQOxjIysEp3Pc6cvgP0Y6E8mWetuzQX7wwEAKmkZA4P/HXv0F69Si4EOF8RyG8MUsgZwqFK511ZfkXmDobkQhYS84iLwLW0+Amu8xktBsY3I0bCa+j1o/dIrUwc2p5zUy24kQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DB9PR04MB10010.eurprd04.prod.outlook.com (2603:10a6:10:4ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Wed, 16 Apr
 2025 16:16:36 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 16:16:36 +0000
Message-ID: <8dc80f96-3040-4cca-b534-dbfd7b801a26@oss.nxp.com>
Date: Wed, 16 Apr 2025 11:16:03 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v6 6/6] oeqa/sdk/meson: Skip test when SDK arch
 != build machine arch
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
References: <20250411172803.3706607-1-tom.hochstein@oss.nxp.com>
 <20250411172803.3706607-6-tom.hochstein@oss.nxp.com>
 <d375570faca49f301b13213dabd508547a0664c4.camel@linuxfoundation.org>
Content-Language: en-US
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
In-Reply-To: <d375570faca49f301b13213dabd508547a0664c4.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::13) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DB9PR04MB10010:EE_
X-MS-Office365-Filtering-Correlation-Id: a40d40ec-b90d-4524-5031-08dd7d020f6c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NlJnaHlENVBNdjRlaTJWcW9lYkdxVHkyZVVoUFpLY3hvekllQ0NZNFNXNnNQ?=
 =?utf-8?B?blRkWnRGWkNUeFJJNUUwUDRWa2lTY3JlTjVDSENFRG1wckd4RjI5UXVvVjd2?=
 =?utf-8?B?MmdWOXIvNU1NMmhuQXQ4elBuMmdMN3cwS09LMVVqZmRzVWwxRlVicVBwVEJC?=
 =?utf-8?B?MUlXSEY3N2VRTzQrQnVCb1lQR3JQb1FCUUEyY1VMLzlpeGhPNlJEdk9sUjIy?=
 =?utf-8?B?dTJ0d1B0Qkc2UmNua2lKRHhNNCtjZlQ3Z0Rpd0VMalVQa0ZoZ1pESUw1S2ZI?=
 =?utf-8?B?Zy82U2NaUWZMNG4zYlFmbjRQYlpadFU5ZE9uK3lOOFZKMlpEb0dEdnY0aWNn?=
 =?utf-8?B?elR2dk02WTNZQWlLcnBjbzljMXhTMG1mRUlWT0c2RDZXOUE1ODMrdE5yRVNP?=
 =?utf-8?B?bWdlVVd4WUdtb3lRUVBtWjh0dkxCOXo0eEZLNE5qMmlkOTRGZXgwalYzOE9D?=
 =?utf-8?B?eWlkMHhUQ1BVMTAwMnc1SWxFLzFMbEZ0aURiMEtxOW5ISmdpN04zOFRnOUhV?=
 =?utf-8?B?TXZLVk9UN09sVDJrNXFFdXZTcTV0cy9UQlBoYy9pczQ0ZThZd3JadVdTbUVz?=
 =?utf-8?B?UUFaeWF2WlpYME5EVHR6dC8zczJMeWJEY0ZZUUhFM2VZbjExdUxDSVFVWmJJ?=
 =?utf-8?B?TzZGUGQ4RmprblE2eDY2SDBURER2MUdKOEZpZGdZd0s1bVltWGJiWXhSbnkx?=
 =?utf-8?B?RHRQdVF2YVByamdMeGFLbkhhbVhMbU5LTGJEUUt1U203Y2ZSZXN6TWZVZ1ZU?=
 =?utf-8?B?U2tINk5SbzdNaGhPNjg5eHNFQkIzTkJpclFnT0ZtaEVZRXBIMlRKdXNvakto?=
 =?utf-8?B?b2toNFZCMVN5TCtpekRDaE9zOFZ6WTZ5c2daaityVnQxQ1JiQ2xidHhEWFNi?=
 =?utf-8?B?NXJWZEk5RjlaZ0h2WTl2c3pEeUJOT1NITDZBSFJpL3VGaWhhbHhxa0pZZFJG?=
 =?utf-8?B?NTArNzI1UnBpam9RN21Zdi9HRFlMblNoaUNuM3ZhN0FaaFlmRUQrWjVQM3I3?=
 =?utf-8?B?bXN0dllTSWphVVljRTgrUWJteW0xcjRJbmpJTWxPZ3VSV0FPUlREaXl6bmZX?=
 =?utf-8?B?SUJuc3RqM0NMQjU3SENMY0FkQTZDbG5TQjlwL3lTQ0tCdDlLZkVaNG01WUU3?=
 =?utf-8?B?Yk4zRFB1bUdWcDdpSHl3YVFFU2JSL1pXdDdLUDRwdGpLbWNlMWlVelo3QWdr?=
 =?utf-8?B?d3pPQWVTOEhiekl2Yk94MkxKMzYxMzFQeWphajlsUjJzMzVmOVZEVGFNV0xw?=
 =?utf-8?B?TngwV2dvVDJtRVVCWVplVkh3MTBhSW5WL3hrWS9lWklhbVBjYmdmaUUzVFky?=
 =?utf-8?B?bGplc0syMGdnczY3b0VnS1MxMGJ0dEd5RzI3WHhEbVB4bjlMTGpXaHB1aGRK?=
 =?utf-8?B?Mnh4K25hU0JuWHA2ZTZHSTYzc1N3MUxZU2duU2g3YXlncnRndGJac1lPQUU3?=
 =?utf-8?B?T2t0dlEzMFd4aXhuLzAwL0NCVzRRQVlQQkQwaG5ObWROcCtYT1hiMWUzTzRU?=
 =?utf-8?B?MEJya2UwVmtteTV6Q0hLSnBTcHRzV3NWdENISTFXUmFEMnRzT2p6ei92ZFda?=
 =?utf-8?B?cmU5T1RYdURsNDNkM2ZEUFZrcU5OamZrNktjSlVlWkszUXVYYWx2TTcydFRE?=
 =?utf-8?B?enFZSkVOdHZYMTJKZ2h4N3JwUkJpczJTdWsyektEMUZyZWxodnZ0Z3FOY3lC?=
 =?utf-8?B?aEMwaVRzTGFhZzJJY0M4ZWNZcytkTEJ2aEVSRFBMZ0x0cU5RcGZlaXhBd1R2?=
 =?utf-8?B?VXd3Z2drdTZxZGdKbHRlMUVPT0cvWlV5YkhFZFAvZzdzUWhLcFhUWmNyMXBw?=
 =?utf-8?Q?GfDjRq6bbJKIlUoYLVZJmfw0IGNAfinNMZk9U=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MXFuNGpqcXZRUVdXREJGdW9qZWp0aE9LS3dwNE5BWVV6K0pkRE5qUyszN2Vr?=
 =?utf-8?B?eS85YThIRTFMTmNDNFQ4R0h6SnZqbGk4cmxnWjBNUXkrS2Ywb3NJS3ltKys3?=
 =?utf-8?B?N0NYV2RWQUtZR1Y3OUsyNzRDejdHeHdJUmhsZkt1Mk9DbCtuU3BDR3Fjamp3?=
 =?utf-8?B?SFd3cWJMZCtVRmNhM1FCejliZ0g5a1NqclU4dmYrTU45MXFaR21pUllobUJQ?=
 =?utf-8?B?R0IvOXZmTjE0V3hFM0IvUk45S3FmQWNvY2lwUy9aQlRnajJCck9DSU5qdUtF?=
 =?utf-8?B?VndTOCs2RzNBZHpwc0dDN1hUaFM4VERWSEF1UGtmZnNkNlZIQU11MTVyS0Va?=
 =?utf-8?B?bUdVR01SQkZPUlVkUElrSERObldFVEhyaXhuYklTaTNaMWtybU03djc2djR4?=
 =?utf-8?B?Uk95MXc2c2J3blRubWlVZ3V4UzJxRVFuWUNPRGowcGdYbDcvOE11OXNpSHF2?=
 =?utf-8?B?M0JCd0JWQmhHdkZJZTI5Zk5MdUQ0bGdiRXNEdzltbUZJSGR6UGZxUzJ2bTM3?=
 =?utf-8?B?enFDL08za0ZwRnVmZ0tIRHZ0eThTL0Nkc1hKSFE5aGFTY1g0UElheGZHUzYz?=
 =?utf-8?B?bkdQaDBNVFFVNEsrdlA1Y2VuOUo0L25SNHlUY1VERkp6S1g5aVo5bWFsa1V3?=
 =?utf-8?B?RDc4aVc0T3FUTUQ2eHVjVE1PeGRHMzlsMkZTN3laMUZNOHM2blREUEV2WGhB?=
 =?utf-8?B?dndhUmpEVmZmbkNpeUV3VGoyem95SXJDaGtPQVAxc25aMmpxMjdQRkx4SVY5?=
 =?utf-8?B?am1rRlM3T1NSMi8xNDVkWlhhL1QwaTkyNjdvUTdvY0V6Tk5GYWFzYy9XYmxV?=
 =?utf-8?B?WmNPZkdUZUpsZ245aER3ZWYxT2lJb1dURW9NWnZleWtWeFVsZW9KWTRYbFhC?=
 =?utf-8?B?UVF5SWNxblBDd2xpK01VWVAyNU1UcE9qQlI2ZEtzdDkxT2JlSWkvZUJNTU0v?=
 =?utf-8?B?QzIzd1BtRVB0OGQwc3VId1FGRWJnc3dBL3ZUQzExdS83K3krRE91WFVHRFpS?=
 =?utf-8?B?OHlpMDZseEdicDVkeWtWR1dpdmtSM0dZQTRmRTAzTkMrbHQrSStqSExrUDZz?=
 =?utf-8?B?ci84MENFbC8wdDV3YXN5dERMRUhkZjYrZmNNZjRZaUxzSnhjV0kzbEpNcGNB?=
 =?utf-8?B?aTBuUWdSUFNFRUgzeG9KVlV3TytoY3pVbzFvL09Td2FYMHp3dGwyWTZkaUJr?=
 =?utf-8?B?YnRGZW1xQkJQSDNmQ0g0eWRZU01RNTdQTnhFMWxGMEpFT1BoMDd6RGVicG9G?=
 =?utf-8?B?N0s3UnY5MkRLbnY1OUNnRlJJOWFoTGxRRFlKVFdRVUZ5NE9wakluenl1Qi9a?=
 =?utf-8?B?bzNUdGh2eTJiSWJsUW5yU1NMb2IvOUhVb0ZlUUFKQjRHYmZHNytpM0hWbEVQ?=
 =?utf-8?B?Y2U0c3h2c2V5WEJYaCtKMFZqM2QxSm4yQ1U3MEtxTzRCa0RuVmFOMjhuY0lw?=
 =?utf-8?B?RnVRS2hSZkZaNHlCQmNCdjZLaUVEdXVYYWpKaTNYcWFKdlZ1U3FUWHptQjNi?=
 =?utf-8?B?SGhROEtPakI1OHJZRkJRYjd0dkx1ZWJkWWtxT0Z6WVJJbHhCZ1UwWEQrWkJz?=
 =?utf-8?B?azFUa2l5L091UW1LbHRMTk0xY2VCdFA1bFRyZGxqK0xZc0VGblk0TDBsT1I5?=
 =?utf-8?B?dkFOdXhyck0vYlR6dDRrZDFWV3k5ekV3TFRENytEaEFLcnJtNS81Z3FqWW1F?=
 =?utf-8?B?T3Y3SjZnOGVJSkVPa1l3U3YraUk0NTV4SEtUUlR6d1pXd0NGTitCc2gvRDQx?=
 =?utf-8?B?dzBFSkh5YXRmckdYcUFrNllxSTJMVUVJOXM3dmx6MFFyQkhlc0psYkc2VFlI?=
 =?utf-8?B?Y2xyLzRrMFpJTlBtNE90Wm5STTVNQ3M3MkI5WHZCWm12cGo0TkcyZ0xhaktP?=
 =?utf-8?B?UFFVY2tYS3M5RnJHRTA1T0R1cVlkZ2lxcmZHOVZuWUN4OXRxanhWN0tKK2pJ?=
 =?utf-8?B?Y2t6ckp0N3Z6NlZoR3NBWEZVOGFyRExhZU1vQlRSZUxMNlY4SmFBOXpib2pp?=
 =?utf-8?B?TXJIc2NFdGYrNGdJNlFzWFMxaXJFSkVXL2dxUzM5RUUwa0xVYVVGZDRhRDlv?=
 =?utf-8?B?SVZjekhxdERVMS94WWVHLy9oS0krbEdZU0liWTluM01GNzN6OTVLVmNEWEJt?=
 =?utf-8?B?K3RWZHFTa0hoc0Rzb2FEbG9nMTBqM0hudU0rOVgxUzBKbWc5TkJlTmQyVHoz?=
 =?utf-8?B?S1E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a40d40ec-b90d-4524-5031-08dd7d020f6c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 16:16:36.3121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xEbzFuOq/coIHCQjKM45lSYr6Dh6Zh1s2h+cIHtrOhbmFzYywxlIvw0WlF/+Xu2PhNSRHDj6kZmo9uTbh7cxbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 16:16:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215000

On 4/15/2025 5:48 AM, Richard Purdie wrote:
> [You don't often get email from richard.purdie@linuxfoundation.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On Fri, 2025-04-11 at 12:28 -0500, Tom Hochstein via lists.openembedded.org wrote:
>> The SDK Meson test fails when the SDK is not for the build machine:
>> ```
>> Traceback (most recent call last):
>>     File "/srv/pokybuild/yocto-worker/qemux86/build/meta/lib/oeqa/sdk/cases/meson.py", line 47, in test_epoxy
>>       self.assertNotEqual(data["build"]["c"]["exelist"], data["host"]["c"]["exelist"])
>>                           ~~~~~~~~~~~~~^^^^^
>> KeyError: 'c'
>> ```
>>
>> Skip the test in this case.
>>
>> Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
>> ---
>>   meta/lib/oeqa/sdk/cases/meson.py | 5 +++++
>>   1 file changed, 5 insertions(+)
> 
> I think this may not be quite right as I saw:
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/1370
> 
> in my build with this series applied.
> 
> Cheers,
> 
> Richard


Thanks, Richard. I'm able to reproduce this. It's specific to 
meta-ide-support.

The setup looks fine:

$ meson setup --warnlevel 1 -Degl=no -Dglx=no -Dx11=false build
meson-wrapper: Running meson with setup options: " 
--cross-file=.../poky/build/tmp/sysroots/x86_64/usr/share/meson/arm-poky-linux-gnueabi-meson.cross 
--native-file=.../poky/build/tmp/sysroots/x86_64/usr/share/meson/meson.native 
"
The Meson build system
Version: 1.7.2
...

The KeyError appears because the build machine data is empty:

$ meson introspect -i --compilers build
{
     "host": {
         "c": {
             "id": "gcc",
             "exelist": [
                 "arm-poky-linux-gnueabi-gcc",
                 "-mthumb",
                 "-mfpu=neon",
                 "-mfloat-abi=hard",
                 "-mcpu=cortex-a15",
                 "-fstack-protector-strong",
                 "-O2",
                 "-D_FORTIFY_SOURCE=2",
                 "-Wformat",
                 "-Wformat-security",
                 "-Werror=format-security",
                 "-D_TIME_BITS=64",
                 "-D_FILE_OFFSET_BITS=64",
                 "--sysroot=.../poky/build/tmp/sysroots/qemuarm"
             ],
             "linker_exelist": [
                 "arm-poky-linux-gnueabi-gcc",
                 "-mthumb",
                 "-mfpu=neon",
                 "-mfloat-abi=hard",
                 "-mcpu=cortex-a15",
                 "-fstack-protector-strong",
                 "-O2",
                 "-D_FORTIFY_SOURCE=2",
                 "-Wformat",
                 "-Wformat-security",
                 "-Werror=format-security",
                 "-D_TIME_BITS=64",
                 "-D_FILE_OFFSET_BITS=64",
                 "--sysroot=.../poky/build/tmp/sysroots/qemuarm"
             ],
             "file_suffixes": [
                 "c"
             ],
             "default_suffix": "c",
             "version": "14.2.0",
             "full_version": "arm-poky-linux-gnueabi-gcc (GCC) 14.2.0",
             "linker_id": "ld.bfd"
         }
     },
     "build": {}
}

I don't understand why. The meson.native file looks the same as for the 
standalone SDK case, and the meson machine data seems fine.

$ meson introspect -i --machines build/
{
     "host": {
         "system": "linux",
         "cpu_family": "arm",
         "cpu": "arm",
         "endian": "little",
         "kernel": null,
         "subsystem": null,
         "is_64_bit": false,
         "exe_suffix": "",
         "object_suffix": "o"
     },
     "build": {
         "system": "linux",
         "cpu_family": "x86_64",
         "cpu": "x86_64",
         "endian": "little",
         "kernel": "linux",
         "subsystem": "linux",
         "is_64_bit": true,
         "exe_suffix": "",
         "object_suffix": "o"
     },
     "target": {
         "system": "linux",
         "cpu_family": "arm",
         "cpu": "arm",
         "endian": "little",
         "kernel": null,
         "subsystem": null,
         "is_64_bit": false,
         "exe_suffix": "",
         "object_suffix": "o"
     }
}

I'm stuck.

Tom



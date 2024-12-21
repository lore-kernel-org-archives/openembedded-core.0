Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F84E7718B
	for <webhook@archiver.kernel.org>; Sat, 21 Dec 2024 21:45:22 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.80])
 by mx.groups.io with SMTP id smtpd.web10.14861.1734817514010063706
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Dec 2024 13:45:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=u1jBXmPd;
 spf=pass (domain: oss.nxp.com, ip: 40.107.241.80, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYQyhFYT/0FvPYQApVFtSWJ87xrYJ9TPwjmMX5gO71bz3Oe1mcGXMaSoKHfdoA6HUpZnXQKqoxQ6cfX8UnzoBt7UtnsAo0airaL9ZzG21SmoeioitzC6iqbUOy6qSA7Xj8xVA8JdebYWxw6Jo3xl/XW4m2OknkdN6WJUHm1gU0vPoimaZavrSCCnjrSsg96UJATRVDO+FRgdoKL20EQl2MDfGj/QtINAruXJJWocllpWSpWOBUYTqCYFOcABmV8cZj0Mg9WEtyfDiKXgoYlwRYdvDT0kY+xMjm/igA1aQKMow8cjyBjq1DJCyUwid9gxAs2JPR97NA0i74cy8DQWlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNxNDCJKOmMb1sdGyga7saB6JMOS8iRdHaWbLQz/eAc=;
 b=H9ZacXP7rhNNpT1dFYiKAEJT6pkZHMcyrJ2yLGfl1es3j/y2j/qI2ZPfUvvKknlO80lkjgGXu75I3cOfIlxr878eYrXYK9h1fzwyds2mmp5TgHyBXoqXW8w1gkQDvpEeYlJ5QIsNGIYa9LhhsuT17qVtbppiiauzLCoDKi8gn+q85+TwMrlFFBfMvQrB7PLhLYplAbal+7FmKNZRFc4OgbI1dQ3jS9ZqOPDj6a8vMIR8exAWMK/ZTZyglmrneP/YidHoZ8KrNu3CPmq6g4xAR9KTuW2AB95IO2wRho1mRLzclLXQoqaqUMMGUwYhmjCWAraisiRN6EhCYcrxbtl8Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNxNDCJKOmMb1sdGyga7saB6JMOS8iRdHaWbLQz/eAc=;
 b=u1jBXmPdio1y4qccuLo5Xqiu74FmcZrUDLzxuCH80p1lZRd+7SL4Qq+bA9fmG0i78ugdZUZ1pN6Ws3tKREbi8oWPCRPUwKmNa9qWXiyeaKCl4EofQfxt32YNlXCMVPSDBIhBOVl1ZBHmRZqJlWbp1+k5IbTuURWfu/i6WIqwrcL/cF+hffXvn4L+VwPf9ARveRPQKgVQyJvlkNoY8mWWhdagUQLnnYRA7es9LrgNHtE56OVTZNU/oPjuM1rSukk1JlIr8tRO6dKz78vVZN8kqHHfRsgnjHrMIkxuGsCLgIyIXoXpY+Ft7qZ0P5lMC7SBJabJAGiFUPb6zwTQT41HGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PA2PR04MB10424.eurprd04.prod.outlook.com (2603:10a6:102:419::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.18; Sat, 21 Dec
 2024 21:45:05 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8272.013; Sat, 21 Dec 2024
 21:45:05 +0000
Message-ID: <5cd9d111-17f4-4e12-9c3c-91cfbd1454cc@oss.nxp.com>
Date: Sat, 21 Dec 2024 15:44:58 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 4/4] weston: Add xcb-util-cursor dependency
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20241219222120.1188742-1-tom.hochstein@oss.nxp.com>
 <20241219222120.1188742-4-tom.hochstein@oss.nxp.com>
 <CANNYZj-9Jdf6eeW=SdVPnSd8vVq3m+bhO=m9SZF5KKggcfKGvA@mail.gmail.com>
 <f1df3290-445e-4525-a3e5-7d156c5a45a5@oss.nxp.com>
 <CANNYZj_V5sxoaN=FpvpaFxfKSRNrrarR1Mcv9nuxKAADtbYXGQ@mail.gmail.com>
 <28220675-1c81-4e19-a935-0b001150ab9a@oss.nxp.com>
 <CAMKF1soxnjO=PaP92265dSfX7G9zjoeRu2hfrHV0c_8Mg19cfQ@mail.gmail.com>
Content-Language: en-US
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
In-Reply-To: <CAMKF1soxnjO=PaP92265dSfX7G9zjoeRu2hfrHV0c_8Mg19cfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:40::15) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PA2PR04MB10424:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b3f7be7-59c2-49b2-76fb-08dd2208bb41
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?d0dFVVVXd3ozMjNBd2hCOWVFOTZpTmkyTkg3TDhWVGVZdTArQUVjbWt2UjE1?=
 =?utf-8?B?SzgvSkkxdWdGOGc3ZURZZzZlTkc0V3VtU2tOZkJucG1PK0tpNm03MHdLQXZp?=
 =?utf-8?B?eXk3OHB1VFR0cDlQL1hLaDF3UHZkeEVpNkZuTHFKR1Bjd25uQzdCS3hzeEVG?=
 =?utf-8?B?V3VVYTVRZjdYd1c1Rjh4RTB6QlVNSWoya2RZMTlHMUxxRjJYVC9PWlBHUWhs?=
 =?utf-8?B?cFVNaEoyOC90N3lSVGlKa09QUmVSekJ0V002NXNRdi9kSVRzTHUwblFaQlhR?=
 =?utf-8?B?VFB2eVNtS29tRmhlb3RtcWJrdzB3aS9uV2xLVUwxY2hmRkZCejl4eXFveE1p?=
 =?utf-8?B?YWlnNmE2emM1N080QTV5Qm1tbFZyNTdzc2VzVndHNWljVjlSUFFNamdSQ3J4?=
 =?utf-8?B?dVVLcTdjTHF0ZDdRalFPL2V0YWRxVHBWaWFWdDNKNEJQRi8rOGlTQVlCcXZN?=
 =?utf-8?B?a2lIbk45WTFNTWxoWGdYb3FseGxwS1ZGb2dIcnE5K1pYOHhYRW9VRjg2MVRq?=
 =?utf-8?B?NXdZSm5OVTh0MXB4SnlDWHB5MmZzZlk4dUhVbXF1WDhhSW1ybkNNNTlrSVhH?=
 =?utf-8?B?eFQyR3R0ZjNyNkZYRXdHdDVKUlR5Z1J1b3NxbjFoeFFVTmJsa2VDNDJoQ1VP?=
 =?utf-8?B?WVViWWFVcHJ2am96cTZtU28rc3ZQTmhORVdjYXJ6eEdGNzluZlN3L1IvTUhj?=
 =?utf-8?B?M0ZNN0dxV0tud0prVFNqelFqdXJqZkVVdXl4LzlLYnQybDdXay9PNkZXaUNw?=
 =?utf-8?B?eHpibUpPbUhBd0tCWlh2bEROMnQ1MTNnRUhUMU9zbG9EaklaMS8zRkRqdXYz?=
 =?utf-8?B?bEtHeUpUOUV5SHE0YmsxVVFFU2JJZU95UXdMTjVHTGJhSVQyL25iVm1XTlVM?=
 =?utf-8?B?Wi9xT3JXckg1N1VrZFJDdEFHdUMyTHQ0ME9BTXBmanMzR0dkNnM4aXoydFRI?=
 =?utf-8?B?bkJlMzluZ3lUQURyR3g5M2wvQjViMU4yT2QvUWtwV2NBUlN1OVF2bE1wblcr?=
 =?utf-8?B?YU96TmdlVFZGdUl5Q3dTREQ2YXprS3E0bDFic0lCNDRDb0ZraHhiZjhpVDdQ?=
 =?utf-8?B?cTRqVk9sNG1MT1hrK3dHVkNBbTRvZVpWZnYzNmgrTUxaakxZTSs2MHA1QmpS?=
 =?utf-8?B?YUFQbTQyeFp3TkdvQUFyN01TU295RFdIcnJkTDRNRWVabS9ZOXRWMFBlcWV1?=
 =?utf-8?B?TEp2ZXlFYldjRnhKeEZXTzhLNHV0emNxa0xwZkR2MXFsU1phamNrYndFUTla?=
 =?utf-8?B?bkNmNXduc3k5MGFzVndTREU2ZWxzRk1yRzMrb1ljWGkwUXpvMDNCcCtGS3p0?=
 =?utf-8?B?OVZmbEg2aWdhbzdvaHdBRWM1TmN2Wkx3UTFibXB0bnhHWFc5eEtmTFV3TmNu?=
 =?utf-8?B?WnRTb1pobmxoenZrbjJ6VWR6bTd6WnU4M3Y2SkNKelhTZlBMTEFJK3RNK0dq?=
 =?utf-8?B?QXlQTEF5NGMzZGtueG1zWjkxZGZyU1ZMcDFrcE5oN0hLUHNrZmM3QmFjZTZ5?=
 =?utf-8?B?RDVGSS8wSW5DK0V1em5lWXhlYkw0ZzlGMGNnK3NOcDZqSXgraDl4UmhWZVNm?=
 =?utf-8?B?RTFaRDR5anA1emJBM055Y2VXVFdxR1ZqTmZ3TmwxMjZWOFN2bm95VUVCUW1R?=
 =?utf-8?B?Z2FmNk52Q3V4VmhmZTBtVmNQdnRzUFNVRWdaQ3FyTjYyV0hIbkN5WlA5c3JJ?=
 =?utf-8?B?MUtqTW5JLzEzL2FSSWJKYWZSaTF6Yzh4SjJQNFRkRDg5SVQ1OGk3SjU4bDJo?=
 =?utf-8?B?RGdreHMyQkMxTXNvRXRaUG1HKzIwR3U4QWtOMjgyMGxnK1kwY0xxYVVFNjRm?=
 =?utf-8?B?dWZkVDFwRjVRaXVBeVZnaVBpUzNLYjZ6cDNSYjQyRmhoVytCWFE2RUsxRjlt?=
 =?utf-8?Q?20vY9967kB8lc?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R2VnNGlhU1NZNlgzeTB5MHZwS3BTc1FYZ3FHN1pTN1h3aEtBNmJmOVFiSzZt?=
 =?utf-8?B?d01HakVIOWNWelZ5Nkg4ckJoR3FkQmF5cFUvSS9WTGl0bUFUSXhxdlQ0V1Q2?=
 =?utf-8?B?UExxZCtwb0VGcUVkUXlyOTNISGtCMXpCaHpoQ0JxNEUxSmpDTElWYUJFTE5p?=
 =?utf-8?B?cjNNZmlmcHEyajdpbHRXYVhjRE02UUdCeVd3VGJGdnROZE1SOEpJOHF3VUMw?=
 =?utf-8?B?c1lndjdPYVZXbzB3NFJhNlRSdmpxa2c3SGR6SVpLY0Zsak8rQjhkY3RiK3VO?=
 =?utf-8?B?clhsMzJ5MHorUTFTdmsyc0hlZU9KTHRHUXJJbmxWTW45dkxDaEpwYlpYS1Zw?=
 =?utf-8?B?TTZnV0ZQd0NoZ3crdHRpNy9GQjcyN3NtcWxLS2JJYWtBTzRSN3ZEeGFjU2pU?=
 =?utf-8?B?OURGdXl2eCtYRmIzQlBVa2VyZXBpVHZmNnc3VWZZS2l0amtJVE9MZVhBdUgr?=
 =?utf-8?B?bUJCbFlnVHZrbFNoY2NzWUJGYU1zTHMwMEJZRUFXcmM4MlNhdFZzS3k5N3Fi?=
 =?utf-8?B?anhaL01WWVFUenJ5UWE0elBDbHBDdzhIaTVvWVJBaW1WcmNScmRHMlAxTUlo?=
 =?utf-8?B?SlZ0NzNKeWdLZ05LOEt3VWthSW9HbG5YYkFYT0ptMW5ZYnFndnRQQ2plVmUy?=
 =?utf-8?B?emNtS2RtL1I0aGV3WnlObmVCQzNuSHRqSEo3YkNSaDREakZoTUVza21UMXNU?=
 =?utf-8?B?QWJhS25Wc0J6QWRjekQyMkd2blUxN0YwRDUvTVo4elYvaGFmVVhac3BjZkNF?=
 =?utf-8?B?RnFpczl4Y2xSbkplUzBDNHNyKzlFWmRnTWVSR3NtYXJUK2xmeExHREhObzRT?=
 =?utf-8?B?RGdnZXJSNUdnWEc4UzlWS3I4aVhIeERrWXNuZTcydGIwbmdIZUh6em9Yc3dB?=
 =?utf-8?B?YjRmUTFYODNLeFJHL2o4VzE4Mk9iajRrTGxObWdnRzRXVEYvREZjT1c3anNo?=
 =?utf-8?B?Wnh1bFVlWTFuQ1QyVWMyMWNaekpZOFBZNy9Pc2liMnRrRDdMQ0VKNDdGYjFy?=
 =?utf-8?B?bENhazRWTlN3RC9PYURWeHBGWWQwd2N2NVRGb3BQVUlmYmNuSDZkRjVJeXJD?=
 =?utf-8?B?eUN3czFKaFRBYVNzdHFRK2xNc2FiM0Q4U1Z3Z1YwU2RQY0ptZzJmT0xiMjVs?=
 =?utf-8?B?aXZNSmR1UTJaS1Vrc2c1Z2hDZy9va2tIUHZWNUwrVytCTHlZVEplV0U5WWp0?=
 =?utf-8?B?UHZhcjk1RzhIcld0NTR1cXdLeUw5RjFSSlFPMEYxOUliaE9YRzZzSUs0aExY?=
 =?utf-8?B?M3d1MWZZZnlnYndHVkVLaTR5ZzdGTFgxVmlqSUp2TE9lWktTbStobEZ4ZFlI?=
 =?utf-8?B?ODQ2SVZFWXFPcGJ3cFJZOGZOUml5bHg4SFNWeUxPRm02UjBEbmlIb2R4QjBI?=
 =?utf-8?B?cmx6YTlwU0NmTzdrNzVJTkg2NGgyTXVseG9UdWVyS0lRb1BacDM2cFhwSVY0?=
 =?utf-8?B?QlZrM2xGSnJ1ZXQrNllmdnhSWFB1ekU1QTk3RUVWeS9ZWUZ5N2ZFbk1SQ3pM?=
 =?utf-8?B?VjdLdGVDQ0JXUktTVGtXVDVoeFB3bndFaXc0SGhuMlRYS1lNN2xFaHZkYlBs?=
 =?utf-8?B?UFJMTERFVVgraHZyaktnWS85N29aL1dac1FSZWRzT1YrM2FPRlNjeGFYS1Rr?=
 =?utf-8?B?YklKV1QyUTArMVJId2dyRTBucHpFK1pFUS9tVkpZdkR2b0UwVEJQSVBNSnRG?=
 =?utf-8?B?alhVQWJ0VlBPTE11d2gwZEFUbXQ4aFBzL2pCRkhDcUh0NDNpRTR3dWh0Znd3?=
 =?utf-8?B?RjJzcUl3Nno0K0I2YWZIZDNhUk1qTG9ib1d6aGVidGwrQXgzVGlvZjJMaXIw?=
 =?utf-8?B?alZ0V0xzSnN0ZXRlb2M2bmJQWnkvNGNWaWRUZzhlWWppZlZCcWw2NVVSQWly?=
 =?utf-8?B?d2MxUTlLbGxRM0FEVW41dlFWcEFVOTEwZ3grU25BQU1HWXlYc1VjZGM1VTI1?=
 =?utf-8?B?cTREK21zcGtpN1FKZEd5RWRKRG4yUHNoMDN5aEdQYTh1Nit6VFJodEhBb1My?=
 =?utf-8?B?ZUVIQU92eEhMR1MxNFdyRDR5dk1nSlhFSjhWUzJNTWZzU2RIdHprbE4rK0Vo?=
 =?utf-8?B?cm9WVzllbHAwT0Rwc2RxK3Nhb05KMXg0N2JEV3BFYlJCTFhpbDRJSVV2SUJW?=
 =?utf-8?B?WWxUeHBSOHlqODVYT01mc0JkZHZ6aTZLNTlDWFQ1dDNaUkttMFFhZHZjQW1N?=
 =?utf-8?B?Y1E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b3f7be7-59c2-49b2-76fb-08dd2208bb41
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2024 21:45:05.6236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vTS4wr5VJ9hsiUiF24ek341G5uohrbqXWgj5ZUu6TRcQowjHSRSCIRvIii9kjph7t4uPR8rbFmxDFv4PlNtHtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10424
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Dec 2024 21:45:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208992

On 12/21/2024 2:10 PM, Khem Raj wrote:
> 
> Tests sometimes do require additional packages and at times
> development headers and libs
> on target for different reasons and these dependencies may not be
> needed for normal
> functioning of the package. I would suggest to add them into image as
> rdeps (if they are needed)
> conditional upon ptests being enabled.
> 

I don't see that weston references ptests. Is your comment a mistake,
or do I misunderstand?

Tom



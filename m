Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36FF4E7718B
	for <webhook@archiver.kernel.org>; Sat, 21 Dec 2024 19:59:52 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.85])
 by mx.groups.io with SMTP id smtpd.web10.13268.1734811190668084286
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Dec 2024 11:59:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=n5iSwJ4j;
 spf=pass (domain: oss.nxp.com, ip: 40.107.20.85, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GF0LBZJ/QQZkiEpNHd0qLDNpLDMuNkh+8UY+yfvUSEdAtn7nOBO+fIpMbUgD6aDWziyt9nnbiCD6p1JS0S9nQvqt+d0H/k48LUZLi8g+azAviiZ5MNao1fzDGDa6EfIQIc+qX4RW3TJkxSF8wdCycPypHakb7Qsg7tJqqrHXE+Ll4E+T6xhil0z/nnmIgekJkqnH756i+QJ3sP3aETPNKYIeoDeVsdInIn8RjWa36n06VVqzg255l4FIHZmLKDLjjBlG59oVlu+ulbjwDe0HJAIj1fioNxNBxOkkN7Xuupy1wgjjZ4edoQcSxSjao/p8iI/q5iC9rp1sO4kQrKPygQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFqqahY7qFTgltzRD1CxzUVbhTPiVTwMznhFkGVRbQc=;
 b=wPffgFomlWcyaMjSmPYH8RHKXIhwdEBnO33QSBHQk1GGZ+iPqpmnLjC5Cgmb5TjrA8kFmc+gzdygR/on9ufc6RxqudVBtnjnDP0waZXULe0CS2Psj45qlG0PTK7H8rc2wCtGyOqLCI8l4qIjBSS6tSBu2iupRRv+9N/ExXKpeaJLnRjg3qsiqRC1QXLKNsNd7e/bco4W0r5DKVH3EYBC+GV/jZn+oSHBLcZiiPIOoarBe76oHblA8QEzxdrceF9tMrDdZH3Vhr44x2icObj50CjRK2oPl6H6q9fhwWwBBsBv1ixGMjtM5CruTTFhuPsZukEi9wHw73ZacdxODf/jBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFqqahY7qFTgltzRD1CxzUVbhTPiVTwMznhFkGVRbQc=;
 b=n5iSwJ4j0puFEsDxP2za5XEG+nopNAx2XTK/Jq5L0PY5WVahp+iFLi469tAD71BOcOWdmiQlT7Wjv8aS99zDFrZl9axWoAnoSyuAuvQB9p22YcYU1hPMzPp1rCjfyDftl4YtjvkW1GwscKft/r8Ko/vl5qO/bDhMtKqiAvc9aaHdJwiub64myMhVfTTT0qtKuV6LJdvnQZynhtK6HOSyNXTQXyrvSOVNuEKd2zK/mF84AfFHyPuqbnxycfBaGBClx/cfC3y3pBek+Pq+fWcyT3gSmR0e2sE1rgANRap0Y6nKx7dTJ58A13ZYKFI1CUdxDQoSC0Gu6fC0p0YH+C9d3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Sat, 21 Dec
 2024 19:59:35 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8272.013; Sat, 21 Dec 2024
 19:59:35 +0000
Message-ID: <28220675-1c81-4e19-a935-0b001150ab9a@oss.nxp.com>
Date: Sat, 21 Dec 2024 13:59:28 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 4/4] weston: Add xcb-util-cursor dependency
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20241219222120.1188742-1-tom.hochstein@oss.nxp.com>
 <20241219222120.1188742-4-tom.hochstein@oss.nxp.com>
 <CANNYZj-9Jdf6eeW=SdVPnSd8vVq3m+bhO=m9SZF5KKggcfKGvA@mail.gmail.com>
 <f1df3290-445e-4525-a3e5-7d156c5a45a5@oss.nxp.com>
 <CANNYZj_V5sxoaN=FpvpaFxfKSRNrrarR1Mcv9nuxKAADtbYXGQ@mail.gmail.com>
Content-Language: en-US
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
In-Reply-To: <CANNYZj_V5sxoaN=FpvpaFxfKSRNrrarR1Mcv9nuxKAADtbYXGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::18) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DU0PR04MB9251:EE_
X-MS-Office365-Filtering-Correlation-Id: 53c029a4-f7c8-4c7c-13ee-08dd21f9fdee
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?akZhKytoZ2dpaC9YK1pOelJVYWJvbHR1WlNqUkRhVWJyYWxwcWhiU2ZNVWF1?=
 =?utf-8?B?L25uTTMzSEQyazBnTW9aNmpIY2VUcXJnenFCN29CRjIxZXpEbFZyYlNieXdJ?=
 =?utf-8?B?UkVTZk9RRGxadEdGUDBrc0JzN05GcmwrMldJcmJDM3pIYUhMdkxQRGxIa0ww?=
 =?utf-8?B?VUdTallDSTY0aVBnbnJSQmpNcWNJUDdzaHpqeWJEeXMvTzlwWlhrV1drTW1i?=
 =?utf-8?B?YzlSL3dqL2VKSmJOSlBEaXk4QnhFc25ycFBheW9pak1MQWFOYnNVL3Rrb1Vt?=
 =?utf-8?B?VjQyczRCWkQwNkpTTk52R21Pc0RVWk02cTA0ZDdHR3F4NVdlKzJRVHM1R3lY?=
 =?utf-8?B?d0VPd2xIWDFiUnJiaUorNjIzYUZ0TjRHZFFJZG9XRllHc3o1d1RXcUUybm1Q?=
 =?utf-8?B?MVM5UEQ3ai9DU3FwOG5jem9tbEl2ZUc1OHZSQkN1QURXRzAwUDZVRGJPYUF1?=
 =?utf-8?B?bFc2UjdVSmpJRGVEZEhJaFFtUm5QcHAzdnN2L1VFc3JURFgxcFNUdnNGN3Vs?=
 =?utf-8?B?UW52dXBVOHMrRXZvSnZzN0xjWmxsb3lPNDZKZHJ5bzY1dTR5NmkycGoxRFlD?=
 =?utf-8?B?bm5FajZ1ajhQSzNQUzd1bXNzT0E0WHpjcDB0MWN6d3BKQkpCUzlSdTZSdVVN?=
 =?utf-8?B?eFBMOTNjVEtLSXljc0h6Q1MxdWI5TFh0S1hvaW5aQ28rNzNKcTY3YzJWZU5o?=
 =?utf-8?B?akNBN3dlNWszRnRqRk1JSWJ3N3B1cCs0UUdBNkUzRWtYUjdxUkNQKzUrUU9U?=
 =?utf-8?B?SnYyQjN6b1dUSVhqOGlid0NYT2tNc0J3VzBaeUovZlY0VnZDUFdWMGFmN25n?=
 =?utf-8?B?bUQ1QUs1Z0RLU0kwV01XQjFNb2EwWmhyYlFzajV1NFhEemhIWGorZUlSc0dB?=
 =?utf-8?B?bVNCTTBkZCtnRjYyOXJSTzhHQkhvb1JwQ29FZFZQbGJRcjVDdytxUXQ4NmZP?=
 =?utf-8?B?RFU4NXozTXJGNTRvenJtNjg3R2RUc0FuZnVTRE5XWkc1ZlNjMGNjbkhQQkNz?=
 =?utf-8?B?b095dEpWNm5pL2t0NEVDaTBESGtydnY2NFpITWRuNnEwSmNCZnl1dmVyalBJ?=
 =?utf-8?B?bjdsUEQ0RE1iTkltNmMyeU42UktjNzRWeERyUXcwd0FZYklRVVR5bFh2SldF?=
 =?utf-8?B?NzcrNnpUM1NGNy9JTVhwNjdPd1dERGdSdHhrenV4d3BGdGZMT1lQZS9UUCtr?=
 =?utf-8?B?djhWbVRMcHZzb0hoUzRyQnpaSytVY1Y2UlFEMGdJTmtuZUFvclh6YksyWkE4?=
 =?utf-8?B?amFaNkVHcTY5aWZta3AweFdTOHI3WFNOSW9MVSt4TDl1TlhGRngreEVqaVNl?=
 =?utf-8?B?ZmJCbzlta3JWSVU1RjRGaWdJd3BuVE91MkVPRDRsSThJMHNEbUlsTXFwaksr?=
 =?utf-8?B?aEVlaFVRR2NzNkZOTTFkc0N2OThQVUxLd2U0SitrWUNYN21scGNUVDJWdU1N?=
 =?utf-8?B?YS9HVDY2a3JGdlhGclZUZkgwK1dZUmtWSDc0ZnpDS1JWYzlXdGp0U2tDdXda?=
 =?utf-8?B?dU9La25RMkREMEI0YndRc0xkMnVtbjhza0E5WXd0LzNZT3loM3FlZzcvYVEw?=
 =?utf-8?B?YldzUXBhMXd4dCt3K1Vvelh2YmdBNXkya3k4WWVDQzlpRVg4OXQ1OUsxdnVP?=
 =?utf-8?B?YVhsT1ZTbWN2TnhZYWVDQVhhUlgvNU11RlViQ0w0NjJEVENwa2hDVm1oWkFp?=
 =?utf-8?B?M3RkRitybE4yLzQvWmovTkRnby9DZENvc2ZXN0lzT2x6Y3hLZE52NFNDZUgw?=
 =?utf-8?B?QVBJZ3NNN3hSMU1hU0FYa201UFM1UDdzMHArRzVzRDBydUJRREZ3UlYyQXM2?=
 =?utf-8?B?MExlZVpub0EySDJBZEhjeHFLZjJaT2ZpdnVMczBQeW1YWnFVWUdRcWszazJy?=
 =?utf-8?Q?vag5mOVYpcEq8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QXZKSU8zTGNvQ2tYdU82SzNWcjMveTNQU2N0THVOczlmOWc2RW11QWJTcVd5?=
 =?utf-8?B?SEpqaC9BR3lOTFZ1L1NUSVB2T2lOaDZIbHAvVFNPYWNhd0sxUU1rOVBaVGlD?=
 =?utf-8?B?dlVjSFNCaUlIYXoxUWJLemlEZjIyK21DeEYvVHBSQVBTRWNndUJYelpMTVhz?=
 =?utf-8?B?WVhKZllFTHh6LzFkYzR4SWJIczBmNXA2MnhhMDBwc2JVUTlMUjdoOGUwSU92?=
 =?utf-8?B?NUpSWGlFcEdmREFkbEJkZmMrcGZJQ0k1a1VwVTlZcGwwZlVFZjJJNUpWSVov?=
 =?utf-8?B?RDFxMzZ6TnNQcktOSDF6SXAzN1pMUzdMUGFEMElYdkhJbzVTZHh3NmdLdEgr?=
 =?utf-8?B?QnA4SDZJdkpNcFdteXEyMy9Wd2dnME9veHAwUzlveWpLS2FtNWwyVkJIMDJz?=
 =?utf-8?B?a3h6VU1zM1NBTmtqenRScGpCUFB1eUk3YXVVNW1lQnMrdE5BVjNxdm9xcDNw?=
 =?utf-8?B?ZWRzVDJRd05lbndQcHYrRVE4UGpsVGNsUE44Rm9aelFyT3hRLzEwK1Z3WG5y?=
 =?utf-8?B?N1Y4d2NKYlgwcjgyYTdkZENCSVAvSE1EMkIwZkpKU3FEWlBVTmJNYXZ3VFBa?=
 =?utf-8?B?RWNuYklBWlVscUhOMnRVLzBwNWdjdUxHcE10Vm93K1AyWUtkUXFNUloxN3NI?=
 =?utf-8?B?RXBmbGhQY3Bscm1KTWlObHJqbTJ0UXhaK29CVW9RL1dnZ3RhdFFTc3RqYjZv?=
 =?utf-8?B?VnpMRTBMV296bWRlQkkwY2x5aFIxWmZiUUViUVlVa3BRcG5FM1hldVI0YUUx?=
 =?utf-8?B?eDNRSFU4cDNNV0JsZWh1N3k0NWR4ZTFyV0FvNlY0c0dqNXp3VkhZaTlOYUNG?=
 =?utf-8?B?a2kyYndKWnBML0p6bTVwMENNbEM2OWc3SWh2cFpMTjRaUlN5dVoyMkpmKzc2?=
 =?utf-8?B?dHN3ME9hVUdEQlZ1Mkc0bnlnMlpjZ2NrUlBucW1MVWYzaWUra3h4SGhXVzgr?=
 =?utf-8?B?MGxXSGM5QUNwTU9vdnVSMDc4dGJMRWhxc3FWOVFEZE1tdWxldnFOOVZBT0po?=
 =?utf-8?B?NlM2cmpUMFBqNWw3RGs3RUlvSExueWxRNWZyMWhYOCtxdk9SUE0rYVIzOEFi?=
 =?utf-8?B?ZmlaZ1doeVpxZ1NRemdlM0MvcythUVMyMEt0SHJPbEFiNHV3Q0FRZ3RtcTZq?=
 =?utf-8?B?bmI5S2FZRkZoY2ZzMjNUcXBWMmVZSUoxN0NDeGlIVis4cnZzSUhDeVFnTTFo?=
 =?utf-8?B?M2l0Rzh4OVNMbmNwZXFPSFY2K0xJVkdzR3lCbEptemZTaHRuWnB2K1VIMyts?=
 =?utf-8?B?b05PMURCVzcxWC90UDkwZVVIeWJpWG9tS1dRbjhFWm5IdzFFSXZKY3FkVmFQ?=
 =?utf-8?B?U1ZjQ3BkcDg0b1ljeEQ1NkhGVmhrUG1SbUYvRldqczVBd1EwMU1TOU5Mdjgv?=
 =?utf-8?B?TU13UjAwajE0TG50V0NVQmxaa1AxbmhzNjlUZXNQVFJXVjFjRjZ0Y1hLa1hx?=
 =?utf-8?B?RzZlV2RaM00rQi94akxyVTZ4QnBhMTIyTlExQVlIRG1FTjg4SmF1VU14cmxm?=
 =?utf-8?B?dGJ1WkxEWnhhN2gxaXhFRHlRMjlBK1ZoYm9ZY0RSVThBams0andKUTJhNGFq?=
 =?utf-8?B?V3labTlPeFhta1VuVEMxdzRQRHpqamlhK2pZMVRKVzRxVjdOVEVCazU3LzJE?=
 =?utf-8?B?YnpMdzY3OVNFaHU2WGlSaE1mcE92azFHSlRJanMxZzdNWEZJcTZQdFRNajRM?=
 =?utf-8?B?ak5Zc0pNeEFMb3NrZjdpT2NRbkhoNEs0TmtwNjU1K1pzcHNKbDliL2ZZVmxM?=
 =?utf-8?B?R1h2Si9iNzN1SkNjRlI2ZmFmT3ZRNW5TV1ZpL1pxL1VUV0s1WXR5QWJtUGNi?=
 =?utf-8?B?REZEc0xsTGJ5Wi8vZnRHQXAwbURVeUJkSVRUN1ZFNWR1aWt6VmIrQUpPY3lI?=
 =?utf-8?B?U1AyRDhVVUh4MER3QjlMNXc4b3lUTE1PaHdRUXREaXRTWlRESGVSSmxkYldS?=
 =?utf-8?B?aXlVSS9BMlV6ZDBvMXJwMUlKaithV1FCNG8rZGVGRFpCZFNWVW5hbERwdlRw?=
 =?utf-8?B?SmI2dXFiUXRDallubzZVenhjalQ1cDVlYXlDb2d4U3d0R0dkY2NYSHdpMkYz?=
 =?utf-8?B?KzJvUTFQbEswL1Y4UlFFZVdHWXhmNU5hM0hQV05hcnROcmx3L01iUjlxTXBM?=
 =?utf-8?B?WFBYTTZBOU44dDRqSTVJRDd2N2hEZTVKaEY5U3djMjc3YWlBbDB3c2NtNkpB?=
 =?utf-8?B?dmc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c029a4-f7c8-4c7c-13ee-08dd21f9fdee
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2024 19:59:35.1204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3J2OzrLoEDsbOt6bp6ncUYknqBRCDCbXYSAVhObsLTFtJhEdNAvjGRHrpHaCbCTW9ELDIqfPA+uhVmgVUtBF2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9251
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Dec 2024 19:59:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208990

On 12/20/2024 3:42 AM, Alexander Kanavin wrote:
> On Fri, 20 Dec 2024 at 00:13, Tom Hochstein <tom.hochstein@oss.nxp.com> wrote:
>> Good question, I actually made a guess that xcb-util-cursor is missing
>> from the rootfs because nothing actually links to it, so Yocto doesn't
>> automatically add it to the runtime. Adding it explicitly to the runtime
>> forces it into the SDK as well and fixes the above error.
> 
> This can't be the correct fix. RDEPENDS is intended only for things
> necessary at runtime that aren't discovered automatically (like for
> example shared library dependencies are). SDK content is determined
> via DEPENDS, particularly, by taking everything in it, and adding -dev
> to it. You need to see why that doesn't work in this case.
> 
> Alex

Unfortunately, this is beyond my ability to fix. I can see that xcb-
util-cursor is in the DEPENDS of weston, but xcb-util-cursor-dev does
not make it into the core-image-weston SDK. I've done some grepping of
the build folder with and without this patch and can find no clue.

Note that xcb-util-cursor doesn't make it into core-image-weston image
either. Perhaps adding this to RDEPENDS is necessary anyway? This is the
error message reported:

tests/meson.build:357:2: ERROR: Problem encountered: xcb and xcb-cursor 
required for running xwayland tests

Tom


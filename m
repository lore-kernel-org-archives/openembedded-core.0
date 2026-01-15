Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92EFAD44C6E
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 15:54:44 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39213.1768492478841111900
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 07:54:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=FkYptiPj;
 spf=pass (domain: cherry.de, ip: 52.101.66.8, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZpvxNlwrBAoPIYVWYefBsK23ULx2jwnEjn8m1BOf6ZjYLf39GwEoQiLQMBM8LZu0JFgGsQ9bPbloBsm95IZx97f13g14MbFAWAWvp2cXz/cCiwOsFGpujZ0+Tj/hV2LNQQNMJaLtB57LV9uzRNSWyHHh81jWgHCbaa9GrGWXmEd++2k7R8c28vB2YQbIlLDV+iqokdku7ueg11z0iURl6bu5Z11nBoWewE5ZKzSCw1R9qBlLZ4pbsLQiPkYlDcIG6JVn+CNZ2ihA15eE+g9WOcErssSOSN3wDirIELxffZTw/PZISX14v6s5e5+zr11JqbMT3fp9+t+T3398dnfQ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXB7j5d8zVcOpujFMKCw+0fhhhTsWOI8rs49BhnGrpw=;
 b=R8/x51BPjtwehXgdz0U5hJbbxuZN9pJHWTBn4HzS4rGQ1f5W8/InD/rTzJAVgOWSgW0zDZx9HINU6Q2Vpf9j9xydICpc3+q5RxfWL89mNogx1etVQjxW3Qwz7ORKsD+87J8ZmfPcZir6SUxRVEeGU6t2+pM90ACgw58M9avGRQ3nH6t7PB6BRmvyG7LFqp2BywtNELhE+94wje5V1L4U16XE38EJxN3NhvMNQZChw5nlJHP3o4HmLmsxyolHt1fXIMr8Mswuu5EECvN9GsC4W8FUzdE7bN9c8cK7my2qsYI2i7suum2rtMGNMgTeWC7qU1WrVxYNMQfSQT92gvsfNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXB7j5d8zVcOpujFMKCw+0fhhhTsWOI8rs49BhnGrpw=;
 b=FkYptiPjEAexCQ8LDRl8TbAsbgQISSeAsSlN/inJCBWpKRKve9zDs80K4HdiSvxQjYgl7XKhNfosHS2Kj/QW3rz2XY8xHpJdIyEGxt29U9Xsulld+PA1PQKtYWry+GiyxMTd+bf5FM3UV9IRklJ7B/PZUCemE9tCMvh5jvTqPcw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA1PR04MB10367.eurprd04.prod.outlook.com (2603:10a6:102:441::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 15:54:34 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 15:54:34 +0000
Message-ID: <5705db27-bb7a-4ca6-997e-eda10ad04fa5@cherry.de>
Date: Thu, 15 Jan 2026 16:54:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] packaging error for linux-libc-headers: "Files
 installed but not shipped ..."
To: rpjday@crashcourse.ca,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <f7ecaee8-192f-1abe-08fd-f2b1ff95e7b7@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <f7ecaee8-192f-1abe-08fd-f2b1ff95e7b7@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0226.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::47) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA1PR04MB10367:EE_
X-MS-Office365-Filtering-Correlation-Id: de683f67-eea4-4e1b-cfa1-08de544e60e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RVpKTXQ1STQwMlVrREFEMjVUeWw0WWhpUTQ2M0p0ci9hb2Mvb2JwSVBzY24r?=
 =?utf-8?B?WUNINUlTQ3kzellraWNRNU5MMkY1YlN4cktJNWhDYUFXWGc5aGFVN2JlcU04?=
 =?utf-8?B?bHZuc2ZIZmthQm5ad2RXYjRTTG5Db01wQmJ4dmFnVTVPYUZEWGgzZm0rYm80?=
 =?utf-8?B?d2pEbEhiUmhwYXhuUmhGazBMVkFEbFFqdzNBaEVVc3J5T2I1QmJ3SkkwK3F0?=
 =?utf-8?B?MUlCQXNralg5ck15YjZXUlFSSDlISHljL3BybUVvb3VpOEZIUVBXTzBib2oz?=
 =?utf-8?B?SVBsMzUyUmhIWm5aUktXVG1la1JpSkFvNjdUVEFFaTdKdDRIMDlFMllrRWpv?=
 =?utf-8?B?ZWo3Mlp6bkJUdXlud0N1T3lISkFjUUV4bmJWWFRPbjc1alJpenRobzB0UDY3?=
 =?utf-8?B?cE1UT205ZUQwMzdCeFlGZHMvZnhRTGpBOGlpK3lTNWQvdTQ4eHBYMUd4TVhP?=
 =?utf-8?B?bFlMNmg0NGlGNlZveS81eTIzSlVKZm52MWliNGVkSWVRMFM3N3Bmbjk5MElS?=
 =?utf-8?B?YXdFTmxyZ0k5TGlQNEpFOTV5TkdHY01saHFsMVBSVnBaQklBdnpNWWtCV3VU?=
 =?utf-8?B?UVNLUktJbE0zakxTUHV4L0NHMmxNNjEvbGk5M2hGcGQ0ZVpqeVVDZ05EQUtq?=
 =?utf-8?B?NHZLaFdzakRRbEwrSlFhUThpbEl2YnJ5ejE5dGVWZFNBTEZETVBZb2Ewc09r?=
 =?utf-8?B?Rm13UkhEcko4Ly84Uyt5aElZN2xOS1JaZERPWTdMR0NTWFV5dzlRNmZYdTFH?=
 =?utf-8?B?Ym5hS0lmU1dScUFVUTkwS0tJdWNIQjFHa3AvTU1NbWU3TUs2TVRPNFQrNGRE?=
 =?utf-8?B?SlY4ZXJHbmM4Y0ttS3B6V00vOTNLZWdYL3V1SXJzZDNDRlUvREdoVnFwNmI0?=
 =?utf-8?B?NnVtZUhhRHFMMnBOU3huZUJ4RXAyc3VSaS90aWtHYlcrYXNHNWN6YWFTZzcv?=
 =?utf-8?B?czJ2ZlNySGVwcVkwNThEakF3YWJJSCtpRXhkbDBTU3ZUSHhZc3RiSkozVUph?=
 =?utf-8?B?ZkpmWjQxVXAycGhjSk5mRzRuYlo3ZGk0bkVocVFWZm16M1gvTmpEQnF0M0Fj?=
 =?utf-8?B?WmJyNWhUTHFLK3RNbE5tYTh0Yk1GQmp0cVZLc0NRVkRPbnM1WjQ1WEUwYjJT?=
 =?utf-8?B?KzF2YU51bFduSWcwMWdkZmNrb0RZdWJLd2VZVzROWlZscEZ6Y21VcmE2N29n?=
 =?utf-8?B?enR4QzMvQU1RMnBXbVJlcGZ0K09FRG9tbWlEZVcxSFVCU1Vzd283ZmI0RjhT?=
 =?utf-8?B?S2g1NGlPeDBpQkRnaWpESzJvSWR6VEh5VmtoNGpObTZkYWVPRzBXbXYwNmJu?=
 =?utf-8?B?c1JpWXUwa0lORkgvRS9KRFVPc012QnVMbnVsZTJtWEwyTlZLODE2UG1UNGdy?=
 =?utf-8?B?M3dQdGRnR3pNVENScGxXQXIwN0NvQTIzNXpEaVFWVGdTZW0yNW54eVFkSUYv?=
 =?utf-8?B?YnkxUFJ1M1drOVVvZmg5WXVtc3pUcmdvU3UvV3JwbndRSENrZ0xVTDBHZjJI?=
 =?utf-8?B?OVZlV2I0TjNrVXV3T0VaVW8ybjVmcmZZWW51NDB2NDAwZ0tvOE1yczFlMWVq?=
 =?utf-8?B?c0dYcUMzaU5QNFh1b0tKZEo5S241TFpwdjVNaVVpa2FJWU9ZeU5UR213eEJP?=
 =?utf-8?B?dTlIRFFuMVUwaXBFZVQvRnhLSGFPMzBEY3R1TVZqWktwNnFZbjBDam12aW1z?=
 =?utf-8?B?eG9oQnlYN0JnZnBNTld1UDlTV2dqQlpEK3pvQkU1cG1vVWplOVdBTWdCSUZN?=
 =?utf-8?B?ekJYMW5FY3BhclRyWHpQT1UvK2R2ZjcyZTFkN21oN2UreFB4NnlkRTczSlFK?=
 =?utf-8?B?Qk02eC9uYTRSd2ZBcU9iWGZzcUZRK1RFSFB1SUphR0MrVUNyQlJtWi9sMSt0?=
 =?utf-8?B?a25haEUzd042WngxN3BXbFZrNU55RzZvZStNbGluWXFHM08zVnlvUEFnYjh2?=
 =?utf-8?B?N1dScUp2OXFBNFRud2RtNXVGSGdqVm91MlRteXZWYUtESVJ1U1ZzVEtob2V0?=
 =?utf-8?B?NnJFaVhrWHNrM3VZK1NVc2hDSFA2cnBTUmdrRjRwLy9hLzQvWElGY0ZrVWdF?=
 =?utf-8?B?N0paelgwRXhrR3JCQnh1RUhYYmlmMWl2ejhvOWRIajFVNk1DNGs0b1JlQU5K?=
 =?utf-8?Q?O3Lc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aHRtMHlQR1FzNU9tY0xKaThXazlpdFZtUGxlSFdIdFE2WHBNN3QzRU12TnpS?=
 =?utf-8?B?ellnbmZuaE5ZNGZhVWlIWW02QzVPejJRS2hZSFdTWjdLejJXSkpsdzVDeFh6?=
 =?utf-8?B?NHNLR3IzUmJWMERsbHA4TnNqaWZyWS9hRG5RWVR0OW9KQnFveWE2a0FMcGZv?=
 =?utf-8?B?bENuc3orMForNzNEMUt4YjZBM3pvOXdxZlpYQjhwMThONTdwSDFyQnh6bEkz?=
 =?utf-8?B?QXYySU9FMGhqbWs2Uk1ZWmJpa0hrYU83UUJUUlkyeXRRWlJRbEZpQTVZdGFt?=
 =?utf-8?B?eThOZVBFaDBNa3R3MThCQ0d1cW5Za2VXQ0VvdVZlaXVXTGNPK2tBRHFHd1Jn?=
 =?utf-8?B?SkdmNEFERjlMemMzdTlBT3NWcHB2NEF1ajhGVkNTdDRHUlRiYWZNczFJdmJp?=
 =?utf-8?B?N21HbTJPVFdkeE14ZVUxR3R3Nnc5dnNpTEh1WVl2R1NsZzF3SW4reHJiaG1m?=
 =?utf-8?B?V1lYVVBMdUtGeU5nVm5oSUZlcDJiTHNnMitrL3RSelBFNktUOTNKU1dOTzI3?=
 =?utf-8?B?RjZ1ZFVidVhqMk1lcjBnZy9UL0pib1p2WGdRQzYzUDBkQjd3dXdXQWRhZnJM?=
 =?utf-8?B?MSttUGZySmhzelcwYVFjd2VHY1kvam41SCtqMitRbDU4cTNWQmZXeFNUcWdv?=
 =?utf-8?B?RDBNbkdhc01jZFFSblFDd2gxdjYwaFVvbHZVRUVYSVZOY3dJb0tTZzlCN2dS?=
 =?utf-8?B?VWZLWHVTVHdoSjJwVEV1T01va2N5cDY4dTk0cnZpVUlBTS9sMXIra2h1S05S?=
 =?utf-8?B?RmhGTnl1U0Q1VzVqcVRPZ21CMTRWMzlKVEJlaGhHK0hCcFdibzJrZjhuMGp2?=
 =?utf-8?B?MHBNVUV3ZmhqRkNOcTJsUzZmT1ZiaHFQN2NxRlFOVnNhcy9BQWxKZERTaG1X?=
 =?utf-8?B?enlIdFZHTFdZZGNpSjBFTGxBb1lUSHRBbGZidXkvNktSQzI3eEJDYUdZUFdq?=
 =?utf-8?B?OExsb0JITVFPWDNsclNtdDhhV1dqbTRKYzR4cVY1anBxbDhkWlBiaDdIUVRl?=
 =?utf-8?B?TzAySmdjZlZ0WEZhVkdFWEVUMWJvZTJkeGZyVlNLeWJKa1dKejB1U3VZMlN1?=
 =?utf-8?B?RGVPemVMN3pWQy9HWUQ3WWh2R09CNGVLamEyNVRIVlhESjk5Q2Zsc0d3THJS?=
 =?utf-8?B?TFhHZHY5MDdSVDhFZ3VLQ25HdUVIUE8xQ1RmYmUrd2hNa2NQYjROTG51SkN5?=
 =?utf-8?B?UDF2Mk1pZy8wMGJGVzlJMDJEWFFmT3V5MTVkUUVKaVZuSllGQ3J2S2hJcDRF?=
 =?utf-8?B?dTV1RitCSmJTeWo1T1E2MVpVN0ViZG9OWVlzOGVTTERBN3VOUmtqN0FCNENB?=
 =?utf-8?B?bXdsZlNhUk5XRTZiNG9ZMkhwcCtMTC82RkpDcU5lVlZVbE1CVFBrK3FCcWk4?=
 =?utf-8?B?dTV6MXJtTGFwQkZCdTJmR0EwbU9tTDdlNXFuN2QzZ1BsdXFvdlp5YmNBUUZR?=
 =?utf-8?B?YmFVYmw3V3ZUektna3pYdE5OVFZxRm90R1ZYQVRXdUhtYm9UV0RVMWJPdlpL?=
 =?utf-8?B?andnU1NqMUI4VUVlNE9mMUp6RkF5SFFLYkE4Z3JJZmhEdEJWT01rNHYyL2hY?=
 =?utf-8?B?dU8rYWVYUkt2U3JtVHcveGN2NW1SZlVRUEN2V3l1Tzk5Q2tzZ0VmQ1owV2Vl?=
 =?utf-8?B?SnFsUllkL01ETDF2akp4a1BmcCtPTkhiUGVpKzlIbHVudkIraDgxZUQxMEl4?=
 =?utf-8?B?Qmh1MGpiTFVFcmpzWlc2MFBXVitaNFVBMTVWUXFMVUtnVHBGUHh1VVhSb09w?=
 =?utf-8?B?REJ5UFhMcDBYSXZ3ZnNQK1cxSG10Ulk3VlZSSkxEQ05EZ0o3WlVwMHBjS0xm?=
 =?utf-8?B?VHJ1Smxpc3BoZUgzcWdoWWxSZUpQYm1wQVlkMjFOaVI2L0FOZE1HRHNIaGNv?=
 =?utf-8?B?UHdQWkpCTlNUSzdjMGpGY1dXclRhc01qV3hHT3BUanB2ODFWaEdJdTlYSFEv?=
 =?utf-8?B?akV2cnhNeE5jcnNkbWNkMmtDZmNhUVFVMVFVOWVzQkZxS0hHMzBHZW8xeHc2?=
 =?utf-8?B?RG9tU3FtZ01qNGdhYUdudzJBcW5WQzVmNDNxK3QwaWZPd3FkNkhwM3VBOFdh?=
 =?utf-8?B?R3FydWlCQnlJV3F0VjN5SVZBKy9qYjJKL3hQejZ3ejFxUVpSY0Nqa0RwMkhZ?=
 =?utf-8?B?bWpsdGgrTjR2MHVqOFZzQStKY3gxdUoyaDlSd055N2dEWU5VTTFaQXV3ZWc4?=
 =?utf-8?B?MjYwVmFoTWdha1lMKzFZanlXdXlaUXpBdTZVZW1JOGNBeHRVemNDYkgwanlB?=
 =?utf-8?B?QmMyUmQ0UHk1R09IZDRHZU5ZSTNOMDlqcWpISlVCVWdkMXVVVDZ0aWNFQU5M?=
 =?utf-8?B?WTU5am9QbTFacHpseUdNRytrWlBsTDUwRVhNWDNSNTR6MndEV2FqQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: de683f67-eea4-4e1b-cfa1-08de544e60e8
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 15:54:34.4435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5VAT5h5tImxSRp1IrLYrVgTnb3tZlojwld+z/3Ia3lM1ylYdEeqQM2tO+rMSiZEY6OM60lIJ11064kqdf9m2S3fG4MLr18+um6PfCbGZ19M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10367
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 15:54:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229422

Hi Robert,

On 1/15/26 4:30 PM, Robert P. J. Day via lists.openembedded.org wrote:
> 
>    (hoping that someone might have an idea of what weirdness might be
> happening here, or might have seen this before.)
> 
>    i've jumped into an existing YP build and am trying to untangle it,
> so here's the layout. all "walnascar" releases for:
> 
>    * STMicroelectronics (STM) layer meta-st-stm32mp for MACHINE defn
>    * Poky
>    * meta-openembedded for some basic networking stuff
> 
> rather than try to build for the final image, i do as i always do and
> back off and try to build a simple core-image-minimal (or even
> simpler) and work up from there.
> 
>    given that the STM layer defines a linux-stm32mp recipe file and
> that's the preferred provider for "virtual/kernel", i started simple:
> 
>    $ bitbake linux-stm32mp
> 
> ... snip ...
> 
> WARNING: linux-libc-headers-6.12-r0 do_package: linux-libc-headers-lic
> package already existed in linux-libc-headers.
> ERROR: linux-libc-headers-6.12-r0 do_package: QA Issue:
> linux-libc-headers: Files/directories were installed but not shipped
> in any package:
>    /usr/share
>    /usr/share/licenses
>    /usr/share/licenses/linux-libc-headers
>    /usr/share/licenses/linux-libc-headers/COPYING
>    /usr/share/licenses/linux-libc-headers/generic_GPL-2.0-only
> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within
> do_install.
> linux-libc-headers: 5 installed and not shipped files.
> [installed-vs-shipped]
> ERROR: linux-libc-headers-6.12-r0 do_package: Fatal QA errors were
> found, failing task.
> ERROR: Logfile of failure stored in:
> /home/rpjday/BOARDS/nexus/walnascar/core_plus_nexus/build/tmp/work/cortexa7t2hf-neon-vfpv4-ostl-linux-gnueabi/linux-libc-headers/6.12/temp/log.do_package.1893820
> ERROR: Task
> (/home/rpjday/layers/oe/walnascar/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_package)
> failed with exit code '1'
> 
> 
>    OK, i find that puzzling, that a well-established recipe like
> linux-libc-headers could have such a blatant packaging flaw. i went
> looking in the STM layer and in the local layers for anything that
> might have modified that recipe with a bbappend file or something, but
> found nothing. and then i ran across this little nugget.
> 
>    the STM layer insists that it is compatible with walnascar, so
> that's the branch i checked out. but when i looked closer, their
> kernel recipe file is linux-stm32mp_6.6.bb. that is, 6.6, not 6.12
> that one would find in the OE layer for the walnascar branch. so it
> seems that the build is trying to build a 6.6 kernel based on the STM
> layer, but is trying to build 6.12 of linux-libc-headers based on the
> poky layer.
> 
>    if i go to the STM layer and check out the scarthgap branch, sure
> enough, it has the same linux-stm32mp_6.6.bb, so it seems STM bumped
> their layer compatibility from scarthgap to walnascar but never
> updated their kernel recipe. is that a possible explanation as to what
> is going on here?
> 

You can have kernel headers newer than the kernel recipes you're 
building. The kernel *should* report whether it actually supports 
something when requested by userspace (e.g. ioctl, syscalls). The kernel 
headers are supposed to be stable API/ABI as far as I remember, so newer 
headers only mean you can use newer features (if your kernel supports it).

We also have multiple linux-yocto recipes which are older than the 
linux-libc-headers, that's not an issue. If you look at meta-cherry-es, 
you'll see you're building a 6.1 kernel for Jaguar and Tiger while 
linux-libc-headers is 6.6.

The only limitation is the minimum kernel supported by glibc. This is 
handled by the OLDEST_KERNEL variable (which is 5.15 right now).

As for the issue, I **think** it's been reported a few times but the 
vague recollection I have of it was that it goes away after cleaning and 
that the fix wasn't straightforward?

Cheers,
Quentin


Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9839C36011
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 15:21:57 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.54])
 by mx.groups.io with SMTP id smtpd.web10.13963.1743175312894001788
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 08:21:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=PqeOOqwg;
 spf=pass (domain: cherry.de, ip: 40.107.241.54, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyPyS99m1163mWsPZN3Z6Z0AkYh6OXDSCu2eJIjR9tZLzfal3plKfMAwXecRPXHELBrKkNy2VG1c29/MqJ/e40Mor2Rk802CNqd7Ke7HUrjaUmjkcXfJlDkcJAzJ0KLQENuXi12zJ3oQaxYcVZviU/UYRWZ7uvOvD4ossN9RzEmhjfy6DYKs0D4QMqQxwEyY9Wi8WHo0wGMfIVX0SFF4MHFvDlhroVWm7IXEcD4Qedmywbk0EIcXpSILBFR42Zls/bOPerp19bMqcEu5DdYDR80Lk6NSrdAMEoNfCBSayyGXfvnOIRmMfMvHZvttomciLs/v19O7iHp6ZSL3kxiSCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5B1HkOUKRiVd5QPAGg6R3s7v4nAlBbNbLc5B7VOPs8=;
 b=pi13kE+T26eIfnnCC9t5KO17F7V1A7iiTh3EDPw9gmtUHQnDWvqZRQWSf4aeOKJY7eGaHIjS45kgVpzS7sdQp7TTTY71EP7I4vWzIa3GiWgxcEhqvmZO78TzSzWWAAL5xdyN15hDF5VUasoaZB82Y/xdvy4Jn3CW6pnacEvbcHgG1ZyndpGfNbgAhslHJeVclm+3jp8sQg4+v75WRE3Ir/Wiee1cD13kzM0pgeqEnw00nFLQOgexQU8ZR9g1iJefCHx3gxoTxmtfOfFVsiaTWiVBILYTEKtdy4l+/WeXydvoNZq6QMaUmT+fND+VxEy12Ttw7qSEvFUpc0E842zBFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5B1HkOUKRiVd5QPAGg6R3s7v4nAlBbNbLc5B7VOPs8=;
 b=PqeOOqwg69z8pHhTzj/VEMGhLNtqU6JL7o2v1UvY078j6fNFFQzCviJSr74E+roGN7KRwoWMxe4a6feGa/IFh6b7HgSh7KS59R3lbxWseXK5HjEY/A6sw5649kwC5JwaSETp+L3iwghr1935m9y5K1uWdChGfrFlMyDAYIr6wwc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB10151.eurprd04.prod.outlook.com (2603:10a6:150:1b7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 15:21:47 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 15:21:47 +0000
Message-ID: <48681606-42d2-407b-8718-d5d359175793@cherry.de>
Date: Fri, 28 Mar 2025 16:21:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH 1/3] version-check.conf: add mechanism for
 checking version mismatch
To: Qi.Chen@windriver.com, Richard Purdie
 <richard.purdie@linuxfoundation.org>, alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
References: <cover.1743052694.git.Qi.Chen@windriver.com>
 <2ade23315e080afec9b58e7dbb615b5e6d3262aa.1743052694.git.Qi.Chen@windriver.com>
 <CANNYZj-hqZOEcwtvnCdSY-FrVBfR8bZxS3OgjUmWLLQ__+307A@mail.gmail.com>
 <c688ddacdb12fbf3b5ff45b27e6a63f7e8892ccd.camel@linuxfoundation.org>
 <c03292ee-b7c3-4452-a812-4e796eb5010a@windriver.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <c03292ee-b7c3-4452-a812-4e796eb5010a@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB10151:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ab5a66b-1d86-4d6d-5b86-08dd6e0c4121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aG9MQzUwK2F5Q3EwZStybEdFaENqVEZtZ3U0U2lFNFJ4eStpRHcrZDh6WmF0?=
 =?utf-8?B?N0dSaHJLL21GdkZLdHd4SWxXWG1La2pmbjJsd0h0citDc0ltNWRrQU9pV1RY?=
 =?utf-8?B?WkI3cXVZSWhwVEpwYm9mNldpRnBJTG1QQ21xcFhzc2JYUXhHcTgzUnBFMjlr?=
 =?utf-8?B?TCtpRFkxYTlUR0puTWVpZnozRmJOcnNqVjd6M3ZYMVZCbDN5aUtpSWFJRUJ2?=
 =?utf-8?B?bk9yZGlhQktHYWZGZ3pSeFpkVHAyRGUraDZKYmF1R2NPZ0lVOS81SjJxM3FY?=
 =?utf-8?B?ZWdtODVZR2FjalhEV0ZLY3hPOUJDN0ZsT0hBVmZBZHZTUXFBWXpzTEFWR092?=
 =?utf-8?B?VHhuTUV3UkdqMklkYTV0WGhjeGQyd3JweW56R1lsclRNaUZzNklhdUNiR1BK?=
 =?utf-8?B?N3g0M3pyQkZIaERNcHd1QnFqY1BCZFh4bG9tUzNaVVRIa3hFVmU2N3duTzlp?=
 =?utf-8?B?M0k4WHA1MzNaS0cvOC9JNkFBK3E1N0pLeW1pNW5mZTkwK1B2SWZrOTNTd3dl?=
 =?utf-8?B?YVFXMmNvdnJDbVh3RTgrUDl5UWRuRVgvWXEyMXZ3bFVVSmZ3cXFqMlFXa0Zr?=
 =?utf-8?B?R1hHR2Q4c3RnWXM1bS9jYWhzZWw0SGxUWURqWWhubThkdXMrU1krMGVWUEVH?=
 =?utf-8?B?TlUzSkpzTmJRZFRIMXYvNmluU3I5bG9TYXFGVmVLYXZFclpNTFRHZk9wM3Zh?=
 =?utf-8?B?UWY4T1NWdVliTzlxZ0s2L29Icjl0K05PcUs2T3dEbXloUm81YUZBb05wSlZ5?=
 =?utf-8?B?eFA4b1ZGVDkyL2FlWE1Ndit5KzFPQVVvOFhndjdOMkJ2ekJVUUh3ODEwSmFu?=
 =?utf-8?B?RkVDY1JNUGRvZ01TdTdRRHJYaFhRN2hHQ0pURzhLcU9WZGtmZmpybkVGNmY2?=
 =?utf-8?B?K0NDUlY1NVVMMnJQNzhRK05DK25ycUJac3Z4OVVLMmhCTGlucWNCSFptd3Jo?=
 =?utf-8?B?cUtpaFNPQlZrMW55c2JOVjJpdFc3ZExmSi9CM3daZjhZcjM4WnE3VGI1ZjNE?=
 =?utf-8?B?dlBJVkVuNnZjeXBieWRsSitTS29VS1dRekx1a1c0a1dXKzB5SW4wYzlSUUoz?=
 =?utf-8?B?bmVnZkhJUFJhNW5xb0NpRjNpRTRZRXFCNkxUWTNac0paN0Y0c1FJRDRuNmEx?=
 =?utf-8?B?dlJUS09tRThLWXYrZFI0aXlvaldqVXcreEZmSHVYaVU3QzJSMnNwVVVxc1dp?=
 =?utf-8?B?YStIUDJtMWJ1TEhkVm85L1N3K0h3MWYxVzVnSzU2VVJuSER0algvUW9KQmdk?=
 =?utf-8?B?OURUMHBRcno1UEFtM3JtenhjaEp1M25YRDVZcmhyL3dCUjVIVFpMNUxDMkM5?=
 =?utf-8?B?WnViN2UyZDJoTEovMXFidHRGMDhVaUZXWTYzL2d2Lys0TXJZUHdkU0paT2Vs?=
 =?utf-8?B?K3ZRd09PQzRkbWdlNi82YkVSRmRKeE41VGw2TVJMSmVrbm9JZ0IycHlWMDln?=
 =?utf-8?B?L3lPaVBocG5HdnZhbUI5NG5TWVh2eEVydTBLTFNURjdCeDZVWFZNektwYXg1?=
 =?utf-8?B?Wm9BczRCTmtDUlN4bnVVRDhjNEhPUXpCelVzem1lMGRZQjRnKzhTUURUdHlJ?=
 =?utf-8?B?TlJWUUsyejJPb0xwaStmNEdJREo2b3Y5dVljQzFrUXRGUDJiajNOV0EwclJl?=
 =?utf-8?B?a3pXZzg2N01Wa3F4TTk1U2pub0o4TVByVFViVXpKRzk0NmFmZTBYQmMrVkYw?=
 =?utf-8?B?WFhFbHBLL2l2eUNIb1gzR0FhSXFFSzBrcDFhY0l6RlY3WlZRNlZjWnNxa2tt?=
 =?utf-8?B?NlVEYnNvUU5URlBpTUo0SXFHNER1MFNZb2ZRekJUNnJrZDR1bzVuMXdEeWdC?=
 =?utf-8?B?UkppSjZRalFNMHVXMjJ3djdTTFhGYTBEb0tTYng1bUU2cndKbWw5ZTEyV2FY?=
 =?utf-8?Q?8KdYek0IOFVP8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aVZaR2E4V3poc3BzVlRyaTJoOHY0bUdqZ3pmWUIxajM3dXVLZFB5TFAzak1Z?=
 =?utf-8?B?T3pTSmxRcWo4c3BPVWIveHJrd080bzFYMFBINklNOUtScDYxMHVqbHBreG85?=
 =?utf-8?B?TlVCdm5oQVFVQ2sva09uY0ZKdkJORlM0SWx0cWcxNGhaYWh2VmszNWJwdmp1?=
 =?utf-8?B?SU9aS0lTNDFrUG04Zk5FNURZbEMrZmRXak05SmlxQmNGbUhIUm1JNlR0MUtQ?=
 =?utf-8?B?T2p5KzFBUE1WRHAweHFEZUx0eXkyakluQ2F2MkFtaSszYU1TT1E4V3ViekF5?=
 =?utf-8?B?bjY4NDY5NDh4K1NSbldyTWJ0NlBZOXpFZ0tFOTV6ZHBuRTlhM1ZKUFdzRjBh?=
 =?utf-8?B?RGlBR3BMRThUUTFnN0cyN2xJZ25sT3Bnb2tCVy9LcUNxSXg4SHdEbVk0R3Uy?=
 =?utf-8?B?OWhTWmtnT3N2MkQ2eXNnUDJjN2NLaG9vOWc5eVpHY1pxMWZjbXB3RmhHVno0?=
 =?utf-8?B?eEVFaGQ5SEJhVzFveGs4Y0Q1MjM2N0NGOXBOOGpvQTQ2VFhRTXE1N1VpT0w5?=
 =?utf-8?B?c0RxSXMxYVZxNktOeVJwRDM2ZzZyZEZEb2w5ekQ4SVN4TXh1Wi9CYWdPMnBw?=
 =?utf-8?B?WkNBeThvWkdXM0Q0MGREbDlvV0FBZXlUU2ZCbko0ZlZYTStUNmxVbmpEcGUy?=
 =?utf-8?B?OVl6TjFEa1ZybEFZTzIyMmpJcURrRnNGUXNTMVU2TVRrekg2Rnl6WU9wZVg5?=
 =?utf-8?B?T0NTUXRmRWF0L2NwVXdVTjlud1FOeVJHTHVsUjdlcy9lQ1YyM01ST0FTUGto?=
 =?utf-8?B?ZHZjSmxFbGhuejROS3B3UjE4TmVrZnY1Z3pzOUt2Y0lTSXF0QmVNa2dtMXlM?=
 =?utf-8?B?SWZtUm9wY3c0WTUra3VlTkNYUDVZMXlCVkp3RFN3Tms0djRsWHNXWUFiN1g1?=
 =?utf-8?B?cFNBem84Y3hOVHEzYjk3eEZVakJCTkI5bmRuVkFtait0YUYzUmtFc3NndmlK?=
 =?utf-8?B?YXc2VWtKT0w3aUdMeHFISnRFTzdSVXUrTnZXSEwwM0lHczl2R1pGT2laRngv?=
 =?utf-8?B?Z29oNUI1TGEySFMvRUQ5dys3ZkhrcGsvcjM5Y3RZa2VZckJScXlXVGZIaGZw?=
 =?utf-8?B?amk3cFgzeXo2bWtOUmY2NFBvUTJCQ0pUbHFlUUUzR2pNekpGYkxJSHBCZ1pL?=
 =?utf-8?B?OW9oem1WVTEyak5UWTc4akpPN3dES2RYRVBhRnFIOE5BNFhpNHdrOFVtNkll?=
 =?utf-8?B?TDdPWS8wc0Y5ZTNoN3o4QzNEZ2RrTjJJL1JrMVNxYTVNYUd5MU5FY2RoZlda?=
 =?utf-8?B?VDNWK3o4U1hBNG1Wd1lZdmdxQWxBVGxhSXRaNlIyS1pOMTlaTElsajgrOGhj?=
 =?utf-8?B?Z0dxdlJpS21DRlBOUXdQOG4xUGZLQmVFYUtjamtoWEx4dzFldkFsM05MU3Bj?=
 =?utf-8?B?WHRrdzhsdlUyOU5VOExoUUI2T3JYV2YzTWRONlFwRlZUNUE1QVB6cFhlbTZW?=
 =?utf-8?B?SDd5ZHhYamhjdVhOMmVaVU1vTXZLbGdjNVEzeTFHcGpwSlE0YnI3RTEyS3lL?=
 =?utf-8?B?clYwTkVWUS9lemtZRTU0UU9XdlRrcVRJd0lTK0JwZ3gxdVBDYWpzR2pUbXdH?=
 =?utf-8?B?cVlvVnMzeVF0THhMMVE5MEFxSnBMUkZuaTQ5SklvR2VCaitlcXMyWE1uNUlY?=
 =?utf-8?B?aFp2TEtlRXBGR3VMeW9kd204KzcrWUt6Qi9BU0IxY2cweXFnVEt1Z3J4OEZU?=
 =?utf-8?B?RWdnN1FkMi9Nb2VSV0NTWEk1RUphdnJxTkdlbVNiWUNFZ3I2SG5RMFoxSkpD?=
 =?utf-8?B?TkFGVjAvN0VZSmc5Z3M5UE1vdHNSeTFaRFNoYjJ6UGdoNGhyN2xmK2Q2SHVT?=
 =?utf-8?B?UHlrYVJWYzBHRG84VjU3ZHREZXg5S3U3Qk9NWEpxWkVRNzl4bzhuQXRJQUM5?=
 =?utf-8?B?SXppaHdoNDdQL0xEaTd5VWRkbWUrcklPRDV4dFU0ZTRsazV3WnNrUDlOZ2xO?=
 =?utf-8?B?bUVxODBmTS80emNucjBRbzFmZmd0QmRJL013MFhYR2FNT3BWQ1NoLzF1NSty?=
 =?utf-8?B?YnZiZ3ljc0N2K1pjMnhiWGZVR0NlTmZ3YjEwRVZtUEFZc1VaV213ZUtSd1BB?=
 =?utf-8?B?ZCtNY1F1Q2s3bDBVRDlRY1RZdVdDVGQ2dHpLK1BaS2Q3a2p5dmJEWHI0S0ow?=
 =?utf-8?B?c2RzQTFGcUdLSlBQN05MLzg1RHIzUWtPYTgvUEFCWVlsSzYrWVRCdCtCSER2?=
 =?utf-8?B?R3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab5a66b-1d86-4d6d-5b86-08dd6e0c4121
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 15:21:46.9565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3vmMteFvnPp/LPXbAyB4V7Ggww8WN1b0yJVIG2+HED4gJMKW8idpnLWQK/nUjGtqkbH6lFXzNklvMIwTMr8cXNy729lYLyq8hCi/c9BMB88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10151
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 15:21:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213852

Hi Chen,

On 3/28/25 3:42 AM, Chen Qi via lists.openembedded.org wrote:
> On 3/27/25 19:25, Richard Purdie wrote:
>> On Thu, 2025-03-27 at 12:22 +0100, Alexander Kanavin via
>> lists.openembedded.org wrote:
>>> On Thu, 27 Mar 2025 at 07:22, Chen Qi via lists.openembedded.org
>>> <Qi.Chen=windriver.com@lists.openembedded.org> wrote:
>>>> The basic idea is to use qemu to run executables at build time,
>>>> extract
>>>> possible versions, and check if there's a mismatch found.
>>> Should this check be in its own layer for now? If it's in core, there
>>> should be evidence that it's broadly useful and used (and no one's
>>> asked for it before as far as I'm aware), and it should be tested for
>>> correct behaviour and against regressions. I don't feel it meets
>>> these
>>> criteria at the moment.
>>>
>>> Git fetcher has recently gained the ability to match up source
>>> revisions with tags specified in recipes, and will error out if
>>> SRCREV
>>> is set wrongly. We just need to update recipes to specify tags (with
>>> ${PV} in them somewhere, so they remain valid on version updates). So
>>> sending in those updates would be most welcome.
>> The new SRCREV vs tag code was my first thought when seeing this patch
>> too.
>>
>> It is a nice idea to check the version information and having something
>> somewhere to do it is nice but I'm not sure maintaining this in OE-Core
>> is the right thing to do for it...
>>
>> Cheers,
>>
>> Richard
> 
> Got it. I'll maintain it in its own layer.
> 
> Patch 2/3 and patch 3/3 are fixes. Please consider merging them. I'll 
> send out V2 according to Ross's advice.
> 
> I personally think this version check feature is useful for layer 
> maintainers because it will detect a few problems I mentioned in the 
> cover letter. So if people want this feature in the future and the 
> decision is changed at that time, I can send out a new RFC with oeqa 
> test cases added.
> 

If the CVE reporting tool is using PV, having a PV different from the 
actual version we're building is an issue. So running this tool 
regularly would be nice to make sure we're building what we say we are 
building?

Maybe we would want to run this on the autobuilder every now and then to 
catch issues before releases for examples? If that was the case, in 
which layer would we want to store this?

Cheers,
Quentin


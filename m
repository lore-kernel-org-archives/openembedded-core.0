Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6560C27C52
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 15:05:01 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.113])
 by mx.groups.io with SMTP id smtpd.web10.24049.1717513497767816107
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 08:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ADQk8/qj;
 spf=pass (domain: cherry.de, ip: 40.107.7.113, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FidrQgwkGGIC5Oo0t5uv1gUl/w4L8F89b8WMusLQD4aB9chXLh7tnTCy8Nl18tbfTokfB2Wm+rLcA2Bys653wg4PpKEGrT1pEPUAvY0LiRN/6R205lWj3FyVzHv7IQ6AN3N+DbHX219dlw7/oj8r3awWtWQ3AMqyyc+ZQTnj1dMC+JL6LWa0hlST2brAKGEKJURJsGq7WOF0G/YFGpNqqHbD8KMb42p3BsnvEqFJyXzvIx+MTPR8p6Bjv3hAzTtBV8NbBjngVFSMfRRPeM0pb/lp5tesskOX+EGuyyeSGJLeQkKtZvhJUEiyGdnqpRf9Wz+jTJoRnvFHBieeQ1/FYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7UbpCMPL7VRhNWw7vMmaI74nNVWVbzM3GBJFkWSUSs=;
 b=HGMbtpmym5P+DkZqwy7XSaEvy1B3AFfsahhvDzIAi8COKOlBYeUQLHuPE4644uZXmrk/b5kiQWJOG/nheAimc8HCDX7ig6JOi5zdheeUGZJd2pIskdnAY8LhyVRqT7nfMVi4+j6hypfryLM0WGIHVJw1TagSXRkliRX4N68okIrcbZthXs6rAQBjbGPXpxhp4GRfwrYtfxXAyx+N1zjsF+2Ak6I5o8XxNai46a8aCXoDextC4tv3yfKyPto/iDeN0zaxbcXQWtmxhpZqwFwN4WIvyDq/JAMCt+1iwhjKLnVvnFi6NQCJ6deE/20y/lo1IqO9DZMKaOyy15QOP+ieQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7UbpCMPL7VRhNWw7vMmaI74nNVWVbzM3GBJFkWSUSs=;
 b=ADQk8/qjHnEnEAa/CM66P5Yu1S2Rx7Ph8/gFcc4rQ6WFfX9sG5LpnrrZHeXUGoutTo4Y9EcF/Xlzace1o7zfgctox6q9ZU+wFmcMGmPO+Iz/NAEej682qrAvLIm1AMUJVZQ2IURVF/OxU0xCG/S/u+BpmrIT506Fm+a+lW9/aos=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com (2603:10a6:102:c4::9)
 by PAXPR04MB8444.eurprd04.prod.outlook.com (2603:10a6:102:1db::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Tue, 4 Jun
 2024 15:04:50 +0000
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af]) by PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 15:04:50 +0000
Message-ID: <ace0be62-d968-468c-aa99-27b8ae87ad7a@cherry.de>
Date: Tue, 4 Jun 2024 17:04:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 3/3] mesa: add new package for Mali CSFFW
 Valhall firmware
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Quentin Schulz <foss+yocto@0leil.net>,
 openembedded-core@lists.openembedded.org
References: <20240531-panthor-v1-0-1a76fd752c1b@cherry.de>
 <20240531-panthor-v1-3-1a76fd752c1b@cherry.de>
 <7f0cbf29-f885-4f39-8b83-4e89b709d6f0@cherry.de>
 <7dc1935cc2d7a0af58ebe65b6afaf4ef7d5eb426.camel@linuxfoundation.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <7dc1935cc2d7a0af58ebe65b6afaf4ef7d5eb426.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0042.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::14) To PA4PR04MB7982.eurprd04.prod.outlook.com
 (2603:10a6:102:c4::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7982:EE_|PAXPR04MB8444:EE_
X-MS-Office365-Filtering-Correlation-Id: a1b96af3-a7a1-4bf4-0a48-08dc84a7ae5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dmhITjR4R3o4NkZLbUJHcXVYWlI4RzBXWDFPSnYxdElSRXpVdkV2bHJ5TlhG?=
 =?utf-8?B?WXhrQ1VNR2JncGYrL3dWR2NXSmg5RnFLNWJDTW9Xb0JZeEpESXRscEtHMHBk?=
 =?utf-8?B?WEpWb1Q1dUo2eWJUbU5ieDlPQlVSNXZ0d05Jb0xuL1VSd2x5VzBaRERKbTgw?=
 =?utf-8?B?SVZ3TnUxYVZKWlhhbzlpc3Vxb3FZVTZRVFNtQjBxWTJlZkovcnlEY0lHbTFY?=
 =?utf-8?B?UzMraFNIZ2t2WmN4emtxVnN5eTc5SlEwMkxTN0hUb1AyMFgzZ3hmdFphcnl4?=
 =?utf-8?B?NklQV05HWkROOVBsSmlzRjdTV2RqWlZET2pRNTVudTJoUjlCS1l4bmV4V1JM?=
 =?utf-8?B?L2VJQ3VqdXdWOXNzb2NKMTcrbmY3d1g0akxLNlgxUmVqZ2dvelErOGFDQzlu?=
 =?utf-8?B?bXVPaVVnNTM2VFUzRC9pUkRLd1ByQ2lEUlIrR0JCcExROWhqZlVRSjdCRDZq?=
 =?utf-8?B?aUJhQ002T1ZwSUhxa0w0TVU5VGNpdi9EZ0krdlY1clRoaWYwT2VNQ3BqbXFV?=
 =?utf-8?B?M09nUHBsam9BeXdiU0sxNzlrZnVCTXFINHpEY29udVJSeDNuTGVISkFvNHh0?=
 =?utf-8?B?UDI3aW1SS3RxYkNySnI5VzhDUlA3Nkh0dm9YQTRKaVhHMDNCK0d2cGs4em9P?=
 =?utf-8?B?SWF2UVJQLzg5emdUWFBYaHllSUVIWWRhMXpUN042UG1JcGJ2R2krMFB3elZU?=
 =?utf-8?B?K3Rld28rVmNGQlpScThXWVpQYTlYaGU5L1J1YnVZN0VLaFJBRUN5V2lndld6?=
 =?utf-8?B?VUY4bEVQdVlhMFpFVEdxR1ZqRUF0N25QeGNlL3U4bmttQkpTSlZhcTVPOFVs?=
 =?utf-8?B?OWhGQS85YzVVV3RocTkvU1JCaldUYUpsamd6NGVJbGVCSHJFSXZCWGNVN1dz?=
 =?utf-8?B?TFBiT3ZmdERWNEdDVkNJeEt5cmMweDVoZjBkcFdTUzhpZjNoSCt0Snh4ekVj?=
 =?utf-8?B?cFB4S0kyK01LQkxNTUcyckpBcW1yTGFmcFlSaEQ3RUhpemt1QnovOEk5VTFK?=
 =?utf-8?B?dXVITEtRTkN5UkVBTUZiT1hzbVlRa2Eyd0dFQmVSRXZ4bXZOWExacmxIVDBk?=
 =?utf-8?B?RCtlYURuUHh3eFR6ckRCemxqVEZLZWZDUzV1dFF6UFF4bnRlc3FSMndYUS9I?=
 =?utf-8?B?Q0xORnVudDFJNnVpTGcvTUJFTnVmU3ozSW1jOGkyWHUxRlFwQnRhUjdTTDdY?=
 =?utf-8?B?bkpTQUMzT3dTcFNBcHB0QWY3NFU0U2RXT0ExSWV4MDloN1BzajJUQkF1bjNJ?=
 =?utf-8?B?a2cxSGdqOUQ4N3RyQWlxak5KM29uUTlEdlBaN0tQb29LZlhlZ1RLM05YZ2sr?=
 =?utf-8?B?ekdHT0ZFUk1MUVoxZFQ4TjhURlovRTExbTNqYlZFZk1Dd2dPNVAwTVAwcVI0?=
 =?utf-8?B?bVpqeEthZWpEd2Y3MU1ENEJ1ZWVwWWhoU0ZUblo5QjRCS0ZkVGdaUDg4VzE1?=
 =?utf-8?B?Y0JicVFCZk5xdTlDTU80YjJDVEt3WC85QVkxeHVERlBQekhRb3VKQ1UvQU4z?=
 =?utf-8?B?cSs1M1cwSTA1NmROd2hrUW1DK0JSbHJMVWhJcTR2MjFGM1NKNkJjemxidGlv?=
 =?utf-8?B?RjRBVEpXbVJnUFJZWDhqTkpaeWVUSEpCN2lXZkxTM1BhSGI5RkwxTnJOdXRL?=
 =?utf-8?Q?QrBrxjoUYM2sdNntXzXHTt/UOJD5Ptme0DO2G3kT+Uew=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7982.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eWpKRGZUZmFjOVFtNElrczgyMDV5UHduMkRhOUZiOEwyMGw0RzRMd1NWT3VM?=
 =?utf-8?B?UzFBdUJudUNMQk9HSjRxbnJ6RE93OTJtNzVVSFRPcFZpbXZyWkxMT2g5ZmYw?=
 =?utf-8?B?V29Rc3ZNdG1iZzFvbmlnbTg4bnVWeHpIQlZZOGkvRXVRRGJkTjQzdi9XbnpK?=
 =?utf-8?B?RlV2V3FBRHM0WFBTN21VMkwvZk1LTDNULysxR2piTHJIU21yVmk2N3k3ZGVm?=
 =?utf-8?B?N1djWXZJN1NYR0xmVmgrM0RWZ2c4UkxIRGpjTjljL0Z6TTZ3UUxiY094OUk2?=
 =?utf-8?B?N29EbkJFYUkzQVk4MG9qRFBxT1FHV25WL3NJUVBEcW9Kai9KblZMeUgrdFVT?=
 =?utf-8?B?akY3ajVDZXBWUllzdVZlNTFxOW84MXhUcDZXM3dJaSsrS0x6b1l5aW9BVmdp?=
 =?utf-8?B?UnQ3bkM4OEtVYU1PaE9YWWRROHRHenBBSzhDTVlUNmptdUMvTEVoVHNmU1JX?=
 =?utf-8?B?ZlRxMHB0SVFpNjZZOUNkeTRsVktQR21jSzRTMHZ5TE9nSkJ0Wi9vWjM4eVBS?=
 =?utf-8?B?OEpWd1kvN3ZuVXhpQWdBZEc3T0swNUNkV1AzUWNTREJoTXliclUwd0I4elgr?=
 =?utf-8?B?Z21hb3liUWFYWXRUK2J1dzdBaWVsdHQ2OGJVN3kyZVpPLzJKVExNSTFwNVU2?=
 =?utf-8?B?SWFFRTdoOGViWS9VdUVUaHl4Z203WnpkaUtqaFQ3NGhpeDVLcWlxZXgrMHBn?=
 =?utf-8?B?eWJjek5SRXFqODBJV29xWVRhMWkzbVB1TXd5U0hIaGNTbzhsL2tTTmFYdk1x?=
 =?utf-8?B?MHZ4V1diVC9RUS9hdVBlN2hrQVR5d2tUWVNFcUtxL3ZWNkptT3NFSWw0UlBV?=
 =?utf-8?B?UmFJV3pRUUZHV2NkYUFzTThBYVZHSEllV2RQN2xhbGlRSDF3OHdaaGpMYWNl?=
 =?utf-8?B?SndSL0NYRG5ESXlmTWpRQ29zMnczRzNCSjBVNlhVSWEzMjNqRUdlRlY1TGZs?=
 =?utf-8?B?VmFzQTNkNXJGYnJ4Q2k1RDMxRm1ESnBad050dW52cE5HMFpoaERBY1lPbkVs?=
 =?utf-8?B?NG5RQlRoSjZrNzZyV0hoRi9QQUJhOGpoVXNZelZwRnZjOGRrcmRmNEsvN0VQ?=
 =?utf-8?B?Z3VuUjNmV1A2YzVCOTRRVTZrZm5CYTFKc0trdGUwSXJoaHJQV2F5eGNtbm1B?=
 =?utf-8?B?RGQyN2NWMjlqemVybHgwVk9wU3F6Mzk0RkYvUlZwbWhnamw3UzRTQTNVeUNX?=
 =?utf-8?B?L0o4QXEycEdmVU1VeXY4K2lmY1VUNTRLRDFJZ0xpdCtocUJmaG1pTlI1bDkx?=
 =?utf-8?B?MmRjdkRGSEVqbHdlZlhkMlFVM3F0RENvT3dlZzdJcE5sQ09PSE9LK3lCb0ZP?=
 =?utf-8?B?bndEWmd4K1pwM1B4Z2xYMENmS0h6Uko3d2pBa1FUZFRvdk1TOW1zZ1NTaFFP?=
 =?utf-8?B?RUhVQXBkUzhVeWoxaGk1M0hTVTc0VVlRN2JLUFVxRVpBZnZpQjFuT0dsZllR?=
 =?utf-8?B?SFh0ais4VTJSUStsRlcrT0lyNXVzcVlXYXlZSDdHT0h1OWhNMVhJZVQrRXo3?=
 =?utf-8?B?ekFTRjl6N01aSmRtVWd4R0pZdVBmejN0OGM2Q2NrdW56a2dTcUZETTFHVXdw?=
 =?utf-8?B?cWxuOXBkMEI0SDlKa0J3aytGMWtCZjJMM0RESXF4ZHN0VDFVM296UlNJbVNH?=
 =?utf-8?B?L3NvWitCZjdhcHJZMitiMUVzU0M2UHFpSkJ5VUxVOTRKMHQ1YldjVm9IWGxK?=
 =?utf-8?B?T2ozeXV1SWRDbHgydGswY2hBeThoZjdwQ056QTE3TUgvbW1kUXMvR1hSQ1ZM?=
 =?utf-8?B?dFQ1WHNOK2JrWmFjanY0VlpIQytwVzlLOWIyLzVzV2VxbVRkQXR3OVR1c0p0?=
 =?utf-8?B?R255VER5VHFma0sxa0FLVlRERjhmb0ZhZGF2SnljNURxdGdMVmRNaUMzTCtX?=
 =?utf-8?B?RDhzelpoMHVaN3R3eFFIMEJSTGJKM2E5WjluNi8yQnhYMlY2ZkdZRTFsaDhY?=
 =?utf-8?B?UzFPUTcxWEw1dCthcmRRZUZnVXlldjN2eDdjaU5Tc2lJRTJzSkJlTUE4OHJw?=
 =?utf-8?B?ZFJNMTBjMmxlTmhvdGRkMTVQR290eEdZYUhTM1RMSUZWNmZZQUF3Y1BScGJL?=
 =?utf-8?B?c3hqTklkN01STCtnaGNnc0plWEt1M05pdXd5d3JzUWFkYkJIeXZxRUFBTDZ1?=
 =?utf-8?B?M21vektVbU42NXBwZDdRMDdjQUpVc2pQMkZHNnNwZ2QrMGcrV0FZazYwMzVK?=
 =?utf-8?B?SWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b96af3-a7a1-4bf4-0a48-08dc84a7ae5b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7982.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 15:04:50.0762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0/ZoD9laUsm5LMcyhpnnDKkkW8C90bNWL5fFOYMOJW78pvDtY2RyBUwXZBhwPq1/DyxwBHn9z0Wu6BzEeVVfhfpjK52fKUHLajcBRTM/qo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8444
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 15:05:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200341

Hi Richard,

On 6/4/24 4:59 PM, Richard Purdie wrote:
> On Tue, 2024-06-04 at 16:23 +0200, Quentin Schulz via
> lists.openembedded.org wrote:
>> Hi all,
>>
>> The title is misleading, this isn't for mesa but for linux-firmware.
>>
>> I know this has been reverted in master-next
> 
> has it? :/
> 
> I don't see that...
> 

Well, I should have said "removed" and not from master-next but from 
abelloni/master-next in poky-contrib. It used to be there (got a mail in 
the ML from the SWAT team complaining about broken mesa build recently).

I'm trying to figure out the changes needed for this mesa update (the 
patch 2 in this series), but this getting quite difficult as I have no 
experience with mesa nor meson and the changes aren't trivial to me 
reading the git log of all meson files in the repo.

What I can say already is that it seems the iris Gallium driver now 
requires libclc as well, which means mesa-native as built on x86 hosts 
will require that, which means bringing in meta-clang... I'll continue 
to investigate a bit more to at least get something to compile (if I can 
manage to) on my x86 build machine, both mesa and mesa-native in its 
default PACKAGECONFIG config from current master, and then hopefully 
send an RFC and we can discuss there. The whole migration from clc to 
rusticl for some drivers is also confusing me, so will probably need 
some help there, especially since we have this commit already in the 
last (few?) release(s): 
https://git.openembedded.org/openembedded-core/tree/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch

Cheers,
Quentin


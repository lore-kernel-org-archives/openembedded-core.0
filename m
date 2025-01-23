Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E40F2C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 09:37:59 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.89])
 by mx.groups.io with SMTP id smtpd.web10.7138.1737625066962282374
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 01:37:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=XSfAFMNb;
 spf=pass (domain: cherry.de, ip: 40.107.104.89, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rl7sBGjlnQST0D+xtLI1nFwZzYpXyAA40PAzPyenqU7fbJ720A/UTpM91m/9mwX0NMbgeox/UmcHgVhbeUxuOf1qf5rPG8UdNa8TErBYeeuY6TVP9CcedpACk6ZI6xP8yy8YijHHby18Cyz6Gb8v0B8a8PjRuFhAqVxmjmTNo8PnQq2N33kq8hVDqXWYwJ4gGzv/huqdkQ35O4/mBlF6oogV8xMKW/TZkuqKnrAwMX/Qc9gK97FnKFD4wLCSO02kMw9kWda4szlfSdGonRHLnAKsdt0kHNeNfxZjGWMyqBf6kxg7E6hzCrMmWcyxhXxjWFW/+9UR1ig++ai2AdaZ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weKMWYA0eFM/AYTETkbT1Jf0WRpjfaSmYXcR2WYAlmA=;
 b=cPEoSL52xo7vgQFmCxS3EbAc5qw6p8MHi7TShRDF7nYodmtQJA2M9VPpwBUSox99b64Ox8iOGP2jNi+fpwODcXrTrx4GTAjg/glY2uqgfWgHNEZwbfxU0YmuyfHB6TcjZ6IqaLs3t1pSCjngoeGEbsFaUXOr4kbAaVTKlbP5GTvX9xKByZNXV5RGuRQU0oAfu+vDxdQddFzKTbCBYFhzj4OKx9vPybCWJjxyvUGE3GneBc0RrOgT6WxF2SdxQApBHc/3jiWBZIILDtTr6krlyzlnhKgIJ+MFk7wnZUc8EMI0qSCAAHnyghp4aP+UElxwXXNgotxvIxiURH1LcCf2zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weKMWYA0eFM/AYTETkbT1Jf0WRpjfaSmYXcR2WYAlmA=;
 b=XSfAFMNbMX7fi9ApRc30KKwBxqJ39kgbCvwIJI0OLXsTSThkxAJdKL1SR2TsUD1lS9uzBarKAk1fL9itZidmfcT4FmSt5K1jgbOdG1N1MkeDQiDXayrILOWbkbLJy+avjuoxLINxptpa1WkQJnD14ZaE3jtCSViy5LO64kAHYaI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by AS8PR04MB7941.eurprd04.prod.outlook.com (2603:10a6:20b:2a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Thu, 23 Jan
 2025 09:37:44 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%5]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 09:37:43 +0000
Message-ID: <2d068367-5ee1-4db7-8cf7-ffb21543a33b@cherry.de>
Date: Thu, 23 Jan 2025 10:37:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] lib/oe/package: Add debug_frame support
To: othacehe@gnu.org
Cc: openembedded-core@lists.openembedded.org
References: <20250108073921.15856-1-othacehe@gnu.org>
 <c80fe68f-2045-47c0-a2e8-076f23afcb3c@cherry.de> <87zfjiobx9.fsf@gnu.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <87zfjiobx9.fsf@gnu.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::14) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|AS8PR04MB7941:EE_
X-MS-Office365-Filtering-Correlation-Id: cc54f7c5-7964-413d-9783-08dd3b919635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dTE5MXppbitKTFkyTE9HblNtdjlYZ3lqQjJmWGdpMzFFRFhTM25FQ2NDYlBu?=
 =?utf-8?B?eEU2TzE0T0tIcTRQOWFhMkhhbUdJTnJDOXNpN0pSV0xoYjZ4TDBPaStMUncw?=
 =?utf-8?B?cmxjZkszN2xkQm55RWMzNzdLejZqLzYwZ2IwS2RpWStYakhPS2tnYmNOc1VV?=
 =?utf-8?B?T2JpRXAybEpiRnFneWpPSkFKZmhtLzZVdjNkbHEyWVZ5dmtVOVJmR0Qxc0NC?=
 =?utf-8?B?U3RhQmt2LzRDaWJhYlpiM2l3dXRkR2oraEduc0NuSW1XaFNTdTg4N1VZcW5D?=
 =?utf-8?B?cVJRVkpUR05sRzVvVkxTaDlXUTNFTmZ4NWxkeE1uQWUvSGJCd1Z0ZWMxS1FO?=
 =?utf-8?B?SnE0YkZLMDh0dC8rV3pqeUNvNWdsVnFUS2QwV3o3NHhodFZ3NTFEWGRsMjN3?=
 =?utf-8?B?V2NQSHRrRWpPejUyRjEwU2FZUGkrNHF3WWNhajk3OXM0L2pWbWdCczg0OXpm?=
 =?utf-8?B?R0h5dUxVQURva3NPSHBtaEc1dXVFYWQ4UVBMR2M4em9jZHhmR20zc3NkVmtC?=
 =?utf-8?B?anlPNnRCYWZ0MHZRTVJGdC9ManBSVVVjYzk4RnNQMFpFYnZsTVRGZEdNenJK?=
 =?utf-8?B?OFI0ZUNhNDZDbTlLZ0xMa2FiU2ZXREJRSGRSQndGV1RERlk4TzZ4TWV4ZGVZ?=
 =?utf-8?B?WmlZcHhrelRFN2J2YTFUbDhwNmMweWZrUlE3bnpPV0Y3L3RZVHpxaFZYNUp3?=
 =?utf-8?B?Zy9SQml5a01WQ0NibUtWYk1hNzhvNVJhbUlwUHVDc1JFNzBIRlh0UVplZUtF?=
 =?utf-8?B?ZWhHZVkzT0ZJOStKSU5xcmJ2cGRRcGQ0MytsTGhvczVxdUNpVHAxRWs4SkRN?=
 =?utf-8?B?UzM5MkFLTjIrUmkzaEZPdWFEK2MwV1J4ZUMvNHBVZGM2di8rRCtzUTBLbHJ6?=
 =?utf-8?B?cyt1aFFtSFI3L3d5bDdzTUNyenJOWjc1R2pCVUIvaWFLdUFXQ29mOW1pZHdN?=
 =?utf-8?B?RjV2eDVTRlNwZ0dQUXRtOHlYRHd4c3VsOURDaVZJM2VsREtSM0hhaVpZelIz?=
 =?utf-8?B?RlJUYkQvby9FRm93R2gxalJDUk5vam80Vk9Fb0RIMFU0QjdBV2ovRFJuTzhI?=
 =?utf-8?B?MU54VGhOUUc4TUlyaUdYTUgxcVEvUmNjSFFNNzhrQVJZSkgxVWNFa3lJaEFI?=
 =?utf-8?B?Qkx1S01mZ1FjanRrWkZnTW94dkNUcmlicVFWOGdNQ3czem5hcTVLbDNtOXhJ?=
 =?utf-8?B?RDFzMWhQN2k3dGErQ0Jxa0NJOWFIbXcvbVZ2WHo5cXZMOHpZZ1hESWdBSU9r?=
 =?utf-8?B?YU5kMTI2d0tPNUtySi9wUlExYXg2UVg0bWFZTmdTS3pKSzBWSVhMa2pzMTBH?=
 =?utf-8?B?ZE55OUR2V3Z3aGw2Y0ZSdnJTTm9sQ2Z0OFBzakk1eElFREQvb0d2ckRxOWUr?=
 =?utf-8?B?eVY4SmtVS1RuWnRLNnd5OVNNaGt6QkM3NXRkNnM4OG55OFNzNW9FTng1OW13?=
 =?utf-8?B?WFd3UDBQTnJCT0FzcEZUUDZQVmZWRU9sL0FRWXIyaU1qaWZqZTZKUUhjRW9s?=
 =?utf-8?B?OUFJc3VGcndxUjU0UEJOcFhZbTUyK21Wa1ZzVlBLYmxXWCt2Z1duL1FIbkpj?=
 =?utf-8?B?VktWMGs2UmVmMzJMSHFwby9xM2k5Qi85TGw5Ykxqb2llWGJmQ1hVejNmclFL?=
 =?utf-8?B?cEVhQ0JpaDBxQ2lnSHJlMFk0L205UDhzUUVkR29JaWxabzI4NXNKRTJsdWlr?=
 =?utf-8?B?Q2Z2UWIwbDBqTThjL2lMZkRoT1lic1hMcGVNckRTMnlmL2p0cWZzZG0vVUF3?=
 =?utf-8?B?ZnVqODQ1aHE5a3BsakVQY1haNDhmNVc4VUIyN3FwTStsUnpnZTViR3JHNGxv?=
 =?utf-8?B?cklxMkk1VG1WRWhmMzVuUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WTJobUsyT0UyZUpxUVl5bEJXZEdLaVNvOU1MeXFCdTVLcDBlVCtUOU5YdGh4?=
 =?utf-8?B?cTdydCtmbTBiZDQ0VU4zUWZTSDBJdDV2cFZMQjdNdWpLSUsrV3owQ3JQVEF4?=
 =?utf-8?B?N2Rjd0M5bnQ5VDRTU1BUSUd1Q0J3Tk93U1cxMmNGLzdKK2xjdmVlU00wZ3B4?=
 =?utf-8?B?OTI3VUNjMHpKNnhDV1k3R0FjdVpveHMyNlR3NHJ2WU1lTDFMZ2lPK1o5SCtn?=
 =?utf-8?B?NXUwcHh0VkZiWEdncnk1c2RFS1RER0NKVktGcTRhUERacnljRmwwdmFpN0dk?=
 =?utf-8?B?S2FaZ2ZJSm5SWC9PMXlhRDJra1pPZ25Yc3dsWU1QTTZrajFrYWdzck0wWWNT?=
 =?utf-8?B?S09FN2JKLzduTHZrczdTbVE3bXdKUTdRdHNndnZiZ1VSZ3BPakVOZ2drU0sy?=
 =?utf-8?B?MUtoOWxMVnloV1hwY3g5OGVwNXNYb1BURkNhdThLczZvN21jZ3NoR0J4YUxv?=
 =?utf-8?B?eGxFYjN4VXVPQTMzL05IVnFuMCtUQkpZOStGd1pmaDBmZGpLUG1hNWFGdkhn?=
 =?utf-8?B?R21NYUlRbU1Vb1RuSDlOSTJYK0xhYWc0LzF5MFhIbXZHRm9wUlYyUFRDVTdv?=
 =?utf-8?B?MUpRMDZXblVzdEpsWUo5endadTNPbzZDL0tZYW41WHNWNE1sOUdwdTRrdU9z?=
 =?utf-8?B?NFdINXU2SElBWUxkeTVDU1N6WENpZGRaT0RlbTBlM29tWlpPSnBrVnBIcURw?=
 =?utf-8?B?WmFVMmI2VDJBcjlOeEV6Lzg3QnI5ODVHczJweXRYNEc1U09xL1JaMEFsVS83?=
 =?utf-8?B?dkg1N0MyQko3VS9zaTEzSnRRalRQTzgxR3BHMjdSSXQrT2MzMTlURU9zYkFk?=
 =?utf-8?B?UjRTZ3FsWXU2aUJwdnlnWWx5Snl1MHpIZm5zcTlBVDJadnUrVUhjZUNmNkZ3?=
 =?utf-8?B?bE9kNisvZkhyeHhsQ3VuU3RMK2kvclpmdUp4U2IwcUhYZkhhMXd4MCtZVFpr?=
 =?utf-8?B?a2pxUGVmUDYraWFSc1FJQXJ2SmYzVXlJZWhISUc2RUdBeS9xbXhXbzhZQm90?=
 =?utf-8?B?OUpBWW9GWktYOWEydHVvbURTZG9ZMWFZSEZVUmlWeUljNWx3L3ZkV1ZkRDFl?=
 =?utf-8?B?aHI1NUpsWXAyTXhTU1BKNlNPOE9vRFhFdjFkZm1SVnpGa3FhTjF3TEVBWW11?=
 =?utf-8?B?Q2FKQksway9wV2RBZDltZjBUNStNeGtROEFuakY3NmJKMFFsZzd0VUN3NDM2?=
 =?utf-8?B?eEV4OFZXOVphc1c3VWpmeE1pL2J0eTNNRzJCejluRjdZNGIwbmsvbEJ2R0FJ?=
 =?utf-8?B?a3A0QXFjZW5MbUtBVDJQQmZPSGNOK3R0TjE4V1ZKa2s1UjV4c0dzd0J5YVZO?=
 =?utf-8?B?WUxIc2FPU3N6U2JlbXlzczBJK2pXVUlMYkczSWNkckJ5cmh6UTdsZmg5MVB1?=
 =?utf-8?B?MkFBTnc5REh6d2lQM1F1SWNtbUR4ZWJvV0VCeEZlNmkySTJqS1RiMm5uYVFZ?=
 =?utf-8?B?QllKRWo5UjFxa09DRXEyZEYzS2FuTVIyUGttekxVRUVMT0IvWnZxcnZDQ3U5?=
 =?utf-8?B?Y0JSS25mU1hPT0JyR0k3R2NPdlo1dG1TMzBoT2FubUVoNm8rcWEwbEVFUWlE?=
 =?utf-8?B?RGxTRzExNkJLS1YvdXZaZVJibjlGRENBdWxoQ3hnaHpzdUxnN05qOENucWVS?=
 =?utf-8?B?UlVZV3YvYlJneW5VMXF5RFViSENVMnlYcnFlRStPb1FyRy9ZRkV2Yyt0QmNO?=
 =?utf-8?B?WWZMTXNKQ1hFeUk3SThyb0hWNzRQMzRvZ1VUOTJEZlA5RWErNTBiTE13S2pt?=
 =?utf-8?B?c2dlYWVOelVrWU1tQ3RrN3NMd01MejlQM2MxRmdEa0RvamhZT2JKeEJxMHFz?=
 =?utf-8?B?U3N3cGdHOTJ0Ni9LalZjemlTQmR3Y2ZKcEtYWmlLQkw1anVZQ2dDcTlYTVBC?=
 =?utf-8?B?a0lERVBqbDNrQUFobnpzYjk1Tm5hT0lMTVRFSDNHY1RaSVV1QkROeE9OOURi?=
 =?utf-8?B?dWNEU2kwUndVZ3JibkE3YnpEZEN3UFNoM0VSeXFpTXkwdXoxTitNdWlWZDc4?=
 =?utf-8?B?NlJJUmprM2ZlTHdzVEc3R01oYkwzeStEZlRtR0FxdDJ2aHhRM2g0ZjFRVVFr?=
 =?utf-8?B?SzdMQitMYnpaQ1ZUbVp0WUtiR25ET05uQm5CdjFMKzJPMUtUenBhZXVXOXla?=
 =?utf-8?B?MVl1MlVOVEtJQ2lvVTVmcG5odVN3YnhoUDFrOTF3TW9DbEpkcDVGK2h0c1Ur?=
 =?utf-8?B?U2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cc54f7c5-7964-413d-9783-08dd3b919635
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 09:37:43.7579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5crHMXERsPwTnuSXkZLtbIzt9uIAWfyIkkyk40wvXryHt+0URk7ZlvSDXda8USTxDcQHokAMp/sN4Zi7TpF12Y4x8757MEHDJKENuFp3XLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7941
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 09:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210188

Hi,

On 1/22/25 9:01 PM, Mathieu Othacehe via lists.openembedded.org wrote:
> [You don't often get email from othacehe=gnu.org@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Hello Quentin,
> 
> Thanks for having a look!
> 
>> Would be nice to document this variable in the yocto-docs
>> (https://git.yoctoproject.org/yocto-docs/). Would you mind sending us a patch
>> once this lands (or if there's a v2, maybe alongside or at the same time?)?
>> That would be for the variable glossary at the very least. Thanks!
> 
> Sure, I will send a documentation patch right after that one is merged.
> 
>> thought: would there be a use-case for keeping other sections?
>>
>> Therefore, instead of having multiple PACKAGE_KEEP_xxx variables, should we
>> have PACKAGE_KEEP_SECTION = ".debug_frame"?
> 
> I guess you are right, and being able to keep some specific sections
> besides .debug_frame can prove to be helpful in the future. I will
> rework a bit this commit in that direction.
> 
> I think it would still be interesting to have a PACKAGE_KEEP_DEBUG_FRAME
> variable around because that is more convenient for the user than
> PACKAGE_KEEP_SECTION = ".debug_frame".
> 
> However, we can maybe keep both, by doing something like:
> 
> if bb.utils.to_boolean(d.getVar("PACKAGE_KEEP_DEBUG_FRAME"))
>          d.appendVar("PACKAGE_KEEP_SECTION", ".debug_frame")
> 
> Would that be OK?
> 

Not sure we need multiple ways to trigger a specific behavior. But maybe 
it makes sense, not sure what other reviewers or maintainers would 
suggest :)

Cheers,
Quentin


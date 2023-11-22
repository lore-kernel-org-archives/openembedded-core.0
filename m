Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DFB4C61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:57:59 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.41])
 by mx.groups.io with SMTP id smtpd.web10.18771.1700657872585674751
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 04:57:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=bXUqwjT7;
 spf=pass (domain: weidmueller.com, ip: 40.107.21.41, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kzVKg9RU/tjMw8KWRi1Nc4nLSgXsDMopGBXevCb6lzKm1i6Qi2OBv25oHG7Hf0jDnw2Mci4ZroQzBdcbGqIJ+9Fkrat2UughP3mo7Z45zWcO3qlho3niWnjxwsxdOPzhRVgd+2sV3FX92l+bq5gSoQABEfh9+0ISrZb38VTvPmZjQdhGoGnGGAxBFl+/3xcI+zt4DLe07tv84tQoKwi+fs3oQ50NC7RzRVNJYfX1FAaUMcRGc07YIj6aRQuVI3eiKPz5j2ZIe5Wnu0z/ruo9cNKDsmTfj7tR9rYURRGCNKPNXKFB/9jbN0c9wtxGsoNDerUtjScPD/JjME/zf01/Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDdYIt5nQ9jUz7IOr67DEN65qO0fBzWuXJSnE1Rc/BE=;
 b=ZckqsNnsaAFV2afgqqUNVSNY5fUBKsm/G7ndY/Wb0NzkpiNVxqkLP7qC8foPJzuqpYJkGMFRgM3b9JvS/7WsNGgH7ieL9SUpYnAYcYY39nnXz29AforGJCcYtQ1giGwwvIo9yWKzLLAtz+uscdxKHtFMXM/H23PC7LHacD3F8Nh5VU5a+m7V2yrpgeUmVy2k8X3JEkKkENq0GIE9Bla/Dzb5czkYMXgXjqi6b+NnH5WJiMkH8wgcw/0LccfNfLn7W10yk++4kHXVWVMTALRy8+XWNUnvuGja31UoEpsk53IsWEOhfxYtjQfybQFs8bOHVikMw/AoL6MNcxJOHObwbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDdYIt5nQ9jUz7IOr67DEN65qO0fBzWuXJSnE1Rc/BE=;
 b=bXUqwjT7h6hXswxzSN2H/Y1Qy2NnA45BiqAsYqZ+rtLvrDXIF0bwWTHXKfOR0KmsdBK+uREfvpuRCwnPL0yMtiNblV4eYlxgGDchjAjrMvub40B5Vo+B0s/azXlUloF6dWTU3xPlpAdgLtACTeE7U5Q7BoY5w+yOkLDg6F/p0Ec=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by AS8PR08MB6693.eurprd08.prod.outlook.com (2603:10a6:20b:39c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Wed, 22 Nov
 2023 12:57:48 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 12:57:48 +0000
Message-ID: <dc639aa7-e626-4fb1-917e-d99359e83821@weidmueller.com>
Date: Wed, 22 Nov 2023 13:57:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [meta-oe][PATCH v2 0/1] wic: extend empty plugin with
 options to write zeros to partiton
To: openembedded-core@lists.openembedded.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <1799EC3C59C13713.9514@lists.openembedded.org>
From: Lukas Funke <lukas.funke-oss@weidmueller.com>
In-Reply-To: <1799EC3C59C13713.9514@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::16) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|AS8PR08MB6693:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b8f9864-0482-41ff-6f55-08dbeb5aa118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dnWNLB6Px/YJOvbuOv4oFxC6Xfbb2ewrDZBr+nAPVo/EZzTVaX62yCbr7JssunFyEl8hmH+1/dv/AZSS3JYXeEZBJOABKuJd/mDixmjSZSmMnJDUKurKhMqwKJLzJFtPY9cXXVTOvw0RfOBGs6suBGcEIH5AGsuBzIvsg26DdIzjdQVelC3T0L4YJJVOnO/72BM67MUPSm2pp4dVfKzHB8e2tEu4Xlx/0/7navkoAl9TqJxc4EGaKBToxlnMuXnlEe84L/aAjgZYAbwUXTmBCqRndxsgLcmWy3W8w0ZhcuqzGfhsPanW0boKOcGOP4HePNrmen1rKTr2TwdBHlS2wdBCIEb8hl0FAbExjC14YWWxBsSahPeLi0vFj7LZAPtkw1jrZX8sl6gAjo40rOj7Ov4VBzZJW+XvsK2yRB+Qg+nl3Tkls8pVzFDjFIVHj3aTsKfvpbf2i7tN1NpD9m7SrchxsFxEQd3mtZJ0RJZ142MI7S9kVN866uJkjLtZWzmoiTK+iaPzp9ioIom065STeOzOu8Eabq0sr5Uht5mI7+RApsa1VpRYIk92+FpgHIvTsj2E1mfPqEvf2pf3GQ49C6BiLNLAqnpJ5ncb/Tii1N/CYH0sSi4KaEXWzGAeH50iHI2gucRxrfjnuMPqEat8UA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(376002)(396003)(39860400002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(53546011)(6506007)(31686004)(2616005)(66899024)(26005)(6512007)(316002)(6486002)(966005)(478600001)(83380400001)(66556008)(6916009)(66946007)(66476007)(8676002)(5660300002)(38100700002)(86362001)(8936002)(2906002)(41300700001)(36756003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bExVbUUzNEVqRmV5dWJSMWN4L3JZSmhQU2hVbWJyQStIOFBZM2RGaVhwZXQ0?=
 =?utf-8?B?L1FybElYYVo0UWhkMVJtdVFNMTJ3K3RXQkRxLzlMRmF1OSs4Nk45VHo3YXV5?=
 =?utf-8?B?UXA3dnltbmJ5UEJOYVR1YTNWUStRVUFTRUZ6cEpheEhTVUV5V3MrY2Q2bk5P?=
 =?utf-8?B?STA0dS9PODNld0Z5NzEybU4yYlBXcklNRWV0SEdtRkJ6cTRBem1vOVlRL2Zw?=
 =?utf-8?B?cjFSOHBuL0pMVTA2anN4SHRxQk5saDd6eENhQURlWmFUSklBbE5GZUNrK3ov?=
 =?utf-8?B?bXdnMFFUU2YrQkY1WllkWm1TeGx6QXBvajltb3JQYXFxT3ZXZVFuOG83RFlN?=
 =?utf-8?B?MGVlalJTZkFMTzI0dXZIZWVDeUZhVmUyVnZWSVFwSUNxeERwaVJBbk03ZDF1?=
 =?utf-8?B?QWsyVDZ2OWJDOGtGVUhSVWxHQjBPMFdlUkhXS0dsTFF1NldWMWVWeDU0Vk9H?=
 =?utf-8?B?UHoxdnRJQjBHbU5XQmEwekNXMW4wbk5QdzlxeTdJbGtIVUNpVkVlRzdGbnBh?=
 =?utf-8?B?ZmFaWkk4clZTeUpnc3BGTEFUVTVmbDNYZnlwTDczSHVuSzE1ZzlUNHZHbTNt?=
 =?utf-8?B?cFluUGxHS3ZacFVINU5JaC9QZ2hLNkYxemc5bVYxWVRSNmMycS9lODY5OW82?=
 =?utf-8?B?emoxM05NRlhZV0N4QnlUdFQ1YmoxSHRzY0QxM0RFTGR0OE8ySGowbzE5ZndJ?=
 =?utf-8?B?VTJEdVhQbnN2NTNieHFGSkNRS250L2tUTi9LS1gwazh1R0RWbVpmMEk4bW5Z?=
 =?utf-8?B?eHhNalJ1a2JsanZ2MlAvZFE4ZFoxZDFPN2NmQ0hRMnJBUW0rUU1ISENpM0d1?=
 =?utf-8?B?dVYrR2NucHRCVW1NQ05Vd1FuRWhvNFlvdHpRcFJnWituZWJIWFNMREd4VG9s?=
 =?utf-8?B?ejZkbVg0elhlU2x0QzB5dWJMRVYyY3VKYXBHNHAzRmhjeEQ0Ynp6ZmtZWkxu?=
 =?utf-8?B?aU5oN1kyc1o1azZLTzF0UE1SdEIwMVVndnhGZnZnWldnRUU3WTd4OTVLNXE0?=
 =?utf-8?B?ZzFFRllBQ1g5SDdXU2xCWVBibVNPNGNUdDFvTGUyQTJ4d0xRWUpKbjg5LzF3?=
 =?utf-8?B?QmplcEcybDA4azBtTWVCTUpCeWF3UFdlQjc1enJjU1B6Rko2S0ZXd25zaDBj?=
 =?utf-8?B?dGdBOHVOTXkwcW1XZzBpWGtoYmI3Wks5SVJUbzZCSFd6a1VqcDZnT2drNnVO?=
 =?utf-8?B?RU9OWGRydHEzY1VFSlYvSXIwREJMelNxblZOdFdTcURwWXpVYlBlaEhLZ3Zn?=
 =?utf-8?B?Vng0aWlzeG5xcjZMaW5BeEJVY3UyanhRcE9yNktFT0l0dW04VWZWZ21LU2NO?=
 =?utf-8?B?dlA3NWp3bi9ub1p6aE1hVmE4THFvRnlDYjlCYVhIVVNZbzRmSm5uVmhTZDd2?=
 =?utf-8?B?LzFtSm8vQTVEekdyeDB6c05oMlZ4VVlISDYwKzhqQ1RJMlJrWlFIZUM5YkVX?=
 =?utf-8?B?aTNsQ0dLdlkyT2VQdnFuL213cEZXTzFIVTVMdTVSZWttZW5McklnRG5vZ2x6?=
 =?utf-8?B?MWcxRG8yYlorekVSdHl3bU9vTzdGL080SWdISks3VWl2T3NkMkJSbFRYa3pk?=
 =?utf-8?B?d0hFYVRhb05nNXlpQ3RIOC9XaVFNd01Icmw4RGF1RkNpRlNmYWZ0NWdmdlN6?=
 =?utf-8?B?V2w4TWxoek9yMWZON2gwRTluZUFVdEhGUmkwS3k3S0hrTmZESk0xVmEvb3c5?=
 =?utf-8?B?TTQrMXc2c1FTTjc2TWVWNjlRZk9ETTdYQ3NUbzVkS3lXVUhhc0IxY0trSXoz?=
 =?utf-8?B?eXRraytNdGs3VkJZajdVdi9iTk1FTEpoRWpoQ0tqVVF5R0dFdFNYYS82eDFX?=
 =?utf-8?B?eCtHSXpFRHBMVlJKSzJ1MHM5U2c5VEVyR2hndnlCM2hMaEhiV1hrRFY2OWVI?=
 =?utf-8?B?Z3hRTjJPWGVUZGdvWDM2NGQzem1CbysrbkhlRzZvaWhjT011T0FXWVJUOVUr?=
 =?utf-8?B?V1N6enc3a1MreGp4N2Z4VldMOWpVNWNTY21jOTZMdGJoMlRiNWFtZTB4VXMv?=
 =?utf-8?B?T1gzYUh0YWU2bk1LT0ZJa05MWmRFckxxTU85L3l4T1U2eGIyUFJQaE9xbW5T?=
 =?utf-8?B?MVdrNk5QUEdyS2NEdE5mRjRVNTk1aldtQzhyVVdKb0pNZDA1R3VvMmRidDQz?=
 =?utf-8?B?SGpjVklwK1lPa21aMFJ1NCtjRHhIeW9VZUVDMXQyU3ZCNVkwRTkvTEg3dHcy?=
 =?utf-8?B?cFE9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b8f9864-0482-41ff-6f55-08dbeb5aa118
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 12:57:48.6265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sPbIzEp9Z7+s+3fAVoVR3keF3bVrnmNx3zY121MoS4x/VGDlOADhHN85fbEgMtzPn0ggApXQAoG6ibo/Vky6rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6693
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 12:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191100

Hi,

On 22.11.2023 11:47, Lukas Funke via lists.openembedded.org wrote:
> From: Lukas Funke <lukas.funke@weidmueller.com>
> 
> Adds features to explicitly write zeros to the start of the
> partition. This is useful to overwrite old content like
> filesystem signatures which may be re-recognized otherwise.
> 
> The new features can be enabled with
> '--soucreparams="[fill|size=<N>[S|s|K|k|M|G]][,][bs=<N>[S|s|K|k|M|G]]"'
> Conflicting or missing options throw errors.
> 
> The features are:
> - fill
>    Fill the entire partition with zeros. Requires '--fixed-size' option
>    to be set.
> - size=<N>[S|s|K|k|M|G]
>    Set the first N bytes of the partition to zero. Default unit is 'K'.
> - bs=<N>[S|s|K|k|M|G]
>    Write at most N bytes at a time during source file creation.
>    Defaults to '1M'. Default unit is 'K'.
> 
> Changed in v2:
>   - Added SoB
> ---
> 
> Malte Schmidt (1):
>    wic: extend empty plugin with options to write zeros to partiton
> 
>   scripts/lib/wic/plugins/source/empty.py | 57 ++++++++++++++++++++++++-
>   1 file changed, 56 insertions(+), 1 deletion(-)
> 

I've seen that there is a misstake and the patch was sended with the 
'meta-oe' prefix in the subject. This was not intendet and it belongs to 
the core layer only. I hope that you don't mind, otherwise I'll send a 
v3 version.

> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191057): https://lists.openembedded.org/g/openembedded-core/message/191057
> Mute This Topic: https://lists.openembedded.org/mt/102746528/7344993
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [lukas.funke-oss@weidmueller.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



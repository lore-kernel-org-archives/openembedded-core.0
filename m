Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B17AC00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 09:12:14 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.43])
 by mx.groups.io with SMTP id smtpd.web08.3654.1660122726815752659
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 02:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=onkKuAI4;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.14.43,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLbN5SG7W/ysg18J0XjgyajSanARRDlD46yKrasAGWrGcN1TrAPMjSf13dsALxyoKXcTaKqIHsUJ438Y9vZSRKQxWStPzErVvH7OppikAqFs5pIOyWWQg1v1IYWPn0wk9UShwcY0NxSk6fUlkV42Rfk6574c4YWftdHXFHoQh2b3etyYf/xggxoLw4j9FYcepkAbr0O9EbzENDgc6vIr+MYFu2VQ3v4SEQaYrB4kOX5D9ZbVXDJbv8YmUCknFfP0WIiXubL+Fq7BemtV4of0Y0XX0wBcUQMSSlGr065iGFXoVgP2xBxHqbcMDgKuf3DfXBWQ1OhklRSVUZHCPuvTNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8genDYahAa9doAFUjuAiHMZJ1KVxRaWgBlzKFdCAIo=;
 b=ABRbSa5YVtpFsQUfEo4+DzxB6WAx8yxIwgUFVWV2Ek15Ga0O7F8xue6gTHjAWPqYAHWg2MrMz6Xijvrim3O8dNaBtW0IScZMncongCXcPoVJJpmQJjsyTieb3hhwd7PIcCbN5kGM3HIbSslVwm+rkLVI/SxjqF+rRQVmSgAGrJ/SVsttH85lC1mDtQsKVVgozQwglltqaecqZUZFSJmtmmwba8dvObZidEFrL0r3JWtKXZUKTcE6PQXPqaonEl+TEvRBYWBV4dzDDzPaRMwSUtTNfmhdTQlR9R6NGyb9LmtDNPVrXbJjHm+O7tueXwPZ/HaMLBX764oEfIKsoRGhXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8genDYahAa9doAFUjuAiHMZJ1KVxRaWgBlzKFdCAIo=;
 b=onkKuAI4DGKlF4N2u2jn6QaImEJc94UpMjPKsmMexp+fFdPTZ69DiZj3PIPf2dzG2LXHGY3A92ObWR/lrdroe5mSrwywRsT/7dVZU/B1iDoy0A157ODGTTUKDNiPi4aWW9+XZgiuTlX7zhQwHFph77Ob5Q8Ec93l+/jh/sb2wV4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by VE1PR04MB7262.eurprd04.prod.outlook.com (2603:10a6:800:1ab::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 10 Aug
 2022 09:12:01 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::81a8:1bbf:5e16:9b4e]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::81a8:1bbf:5e16:9b4e%4]) with mapi id 15.20.5525.010; Wed, 10 Aug 2022
 09:12:01 +0000
Message-ID: <2e01839f-b3da-ded1-a968-550b46b3d82c@theobroma-systems.com>
Date: Wed, 10 Aug 2022 11:11:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [OE-core] [PATCH] wic: add 'none' fstype for custom image
Content-Language: en-US
To: JeongBong Seo <lifeofthanks@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, JeongBong Seo <jb.seo@lge.com>
References: <YvNi59exCGgnhioM@mail.local>
 <ED44FD47-635D-4937-BAA3-AE9C4F277969@gmail.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <ED44FD47-635D-4937-BAA3-AE9C4F277969@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::9) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3609b216-9926-49d3-c859-08da7ab06272
X-MS-TrafficTypeDiagnostic: VE1PR04MB7262:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	K/p4pc3iAO4gKQgAXqVeHxWzwd7P9EpVI9TJLplH3mZGuyML8IF6zUo/33eVtJc6iy9TsLc4TVCDDOQbfxzMJbpdTSDxSh7jvb1DYW+3VtgWJWg52dadcMeVBT5WB7rcJDfJdreBzlwircCUoprX2qFi12ofFfwKHFWeU8MJ5SJL74OaIsNbi9xlqmN2a17iaua2g19OpJoDo9JUn9WxkE5q0nqvcu/nIPFSbQED97SDLT4WzA3q4b0YFdeCcFmLM/dzL3K0qu/1OjSsNbvu9FjOz24RpSouP9jVlubKfvjv4ZbS44uJjWsQaNiUlzuihT5QISefMG7625NslJuvLHihx9G+tNH1ZehhS8q+wFt0fOZXQIjSMoEW18zTq8GyAwgzb6GkcH/vZolMkgjD+ftTXKKN5yZIZGpEc0rxmfpQaOfVJqH04Ou6LQW8ef50dOkxMNExxdAASJWi5FLbRG4OhsuKAtquE1E/SRVvIs4sjOduhvEy8fMH6LryHlha0tKNDz5q4qQRZYps5dhPER1sV/FiptnTdsi42E4UcPSo5UW8rTRM58VK0FdYRhTRVgbdj3mYMyEnX82L+OwAYkqflBCS92ysiZnFnQuwHtGwSknlZ4+7B3rsZLPhfms7UFWbNXsiqOVLYSkGj636bx0LKgB4c6dcn6qFWYmRCfOHn2AgRdNz/WCW6pExGPRbmqcJo80y07UGeZW1ObMl6SPb57gURV/0uwelJQioQeA3Knw07g3sHi28YePuPmK0xrtYIo4WQ6WSHHfRpkTBj3TFkcBhFtrklShwIDasajAKNvMFmsloXGe5nx9MleiIocM0TtAcxN6PQcHArtUv7g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(346002)(39850400004)(376002)(396003)(136003)(8936002)(5660300002)(2906002)(44832011)(86362001)(31696002)(36756003)(38100700002)(2616005)(41300700001)(53546011)(6666004)(6512007)(6506007)(83380400001)(26005)(316002)(4326008)(8676002)(186003)(66556008)(66946007)(66476007)(6486002)(478600001)(110136005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WjY2M0p1c2tQaUQrRGpvYTNwVTFYblNFSko0TVhlQXNIUVlQakN4T0xVQjFH?=
 =?utf-8?B?dWMrQ21OTUhDUnlwcVM1ZFMreUFPSHJVNGFFbUZ5bGlqNk0zQ2hHckNNV1p3?=
 =?utf-8?B?dnhJTzRhRmhIaWFiTEF3RG93eXU2NG1rNTJ4NG5hZlh1amxHOWtqZ2t5QUk0?=
 =?utf-8?B?U2NJWFhjY1NrektyMXBtWnM5WHNNVWRibXhCbWVONmlLV0dnK0hLUi93cFE0?=
 =?utf-8?B?K3VLVmxZdVBVdlJZMzY2V2VFL1ZGaXpjU2thL1IybkduNGdPQm1MVUdCOXhF?=
 =?utf-8?B?eDVOY1VMVS9tQVVDREtmVndmK3l1LzZjcWt5c1B4OHB4TS96WXR6S1JLejFw?=
 =?utf-8?B?K1orN0JObkprYytGZWFOMGgxa1VwaEpualVvS0FNdVRNSVZMazNva3doZHpx?=
 =?utf-8?B?SkZBQVBPRFhZMnh0YTNvOG1uSmpxczFHeURpVHpCM1JUTlJyT1ptZnNMekho?=
 =?utf-8?B?dkVSZThyS2F2Vlg1VUtjMGtOOUtNZDcyeDE1RWs1Y2Z6TFAxSzZMK1JFQm9B?=
 =?utf-8?B?bVhOY2tqWUE2amJqQXpBNmZib1RzaEVPN1hwTEVzNjhLbzVSSlB5L0s0RWd0?=
 =?utf-8?B?QjR6UzJTaTJ4L3JhTW9pUDJ5ZWswc3ZiemNVakpkeGpRUG5aOThOeVkxZkRL?=
 =?utf-8?B?OGdaOWJka3kvYXh2RFZ1MDRFZkhxcVZ2V3REdTdFQ2Q3Mjk1WFViaVlWTzFC?=
 =?utf-8?B?NHEvTHVoMTNXMDBPY3oybnR6M2sxbG4rZ0xjUmFOcGFwSWNEUXFFSk45cXNx?=
 =?utf-8?B?eXRITHd5OEZPeEdvZGxxZEFTMk02czQvNmtCYy9iVWxxdmRQODlmcU5yOWdY?=
 =?utf-8?B?Q1Fvb212WGl6T3ROQm53NXpjUmVicm50YjR2dW1veXdaTUkvY2d5OWJGM2M2?=
 =?utf-8?B?MTZMOU5HYlBRaXNrYWVGRDloV3VjTEtrdEVNczlBSmsxK2lVYUxiMXJvRTRN?=
 =?utf-8?B?cDNBMlBWMERiWU82TW4zbk5qT2RzTWg0eXFLK01rdmlzMVJGSTljTEZTWjZC?=
 =?utf-8?B?QlE2WWtFeUhzcnpBNzNpekNOMlZ3QmZKZzBZVlRaTXR2WkZHZXVjVXBkazdx?=
 =?utf-8?B?b3VLc3VkNnlyaStZcUJMbEpMTDRoSC9WTWxjU3Z2RnRiakVjcCt0OEhJclQ5?=
 =?utf-8?B?MFdmRktBNS9wT3Z5Y3RpQVNZV0JXeXc4Tmh5R1pNS0dzSXFKMEFkbmIzZFdJ?=
 =?utf-8?B?N0M1M2RZdE9VV2FPZjBZVk1rdGN2eVcvVFVQL08ydTZjZzdEZ01maEhMdTFM?=
 =?utf-8?B?Vm5OOU53ay9McWc2RGdRbWdWNW9CNVh6QmlLVFcvMHo2ZzhGaU95OWlpNnMx?=
 =?utf-8?B?Y2tEVDloSE5NVEF1ZU5YbDhEdWpjZUhPRDgwOGJNTmVTZ29UOEFqUUlveHhC?=
 =?utf-8?B?dVBXLy9ZZUtzNlhtVGRSM0lnL0NwTjQybllzejh2RGVjMGU3cGUwTVlIdEdR?=
 =?utf-8?B?enRhR2Y3QS93L2xrMnJ0b3JDTVJRa0dxb0U2TXFmTWFEREpjOWZZS1FWc1or?=
 =?utf-8?B?empvWlVIR2k2cFBDV25MM0VCK01SL3hEU1FtcmZDcHpmWFBJcnhyK0JSWVRX?=
 =?utf-8?B?Qmw0S3ozTFVKNmFQWW1zejNpYjB4ZXNaRW1OTG8ycFFtRll1TVAzNzNDbzdl?=
 =?utf-8?B?T2QvNExWK3Y3bmhRNTVEVGluVlk2T2FRSGxyR2JhUGVSTW12RkRacmFMTGQy?=
 =?utf-8?B?MSt5VzVMR3lWVW5wa0cyVE42ZmtxdGg1dytKSVlRdE02WTEzemlkb0hUVzhF?=
 =?utf-8?B?KzNNaWxxVWRIUFBMdjdpUzV5L2laS3FBeFdIdmlDMll0VFlwaithTTkzUkhi?=
 =?utf-8?B?QnFQQ2xaU2w0bWk4UXByNmMxdTdEOFdSaVBSVkVkZHJQRDlWL0lTNnUxd3Js?=
 =?utf-8?B?NndTSXpWTGNPV2ljSVlkT0xEbEhydVdTc0FoNzcrRGdUaUYwazd2NkJTTjE3?=
 =?utf-8?B?a3NsU2ducmJFR0NhVHhHLzlRSUU4SHI2NmgzRGFCUUZmaVhsS0ZkTnRuOWFG?=
 =?utf-8?B?NUt6Y1hBNC9BU3N0cjdjdlV5YVowNlZ3dmYvTDNpTStYRkhZSDdBdGVWY2Jr?=
 =?utf-8?B?K25idiszZVlIU0dUVjVrWEllaUdXZmdqLytXWFA1aHhLVTZjSW4rekZ1OVc0?=
 =?utf-8?B?MS8ydUtlR054Y3pkeEwvdlJOK2JYeVdGK1ROeEZKYmZWKzVuK1RLa2pvR1dX?=
 =?utf-8?Q?fHxCmUeAuPnD30BPEDU0wa0=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3609b216-9926-49d3-c859-08da7ab06272
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 09:12:01.2274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fj/7/D4rKWin6YPqIe8vhvMbAP6QC3P79U+OVg4ijvz/KM8Y1mJkFJ8bVzvPspfyLgLk6KDRPlaS4uSFpuTh6H2w1P5lDmbG9cTbvSRIIk7GNFRzRNWbvHAdO/8t2ScA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7262
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 09:12:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169189

Hi JB,

On 8/10/22 10:59, JeongBong Seo wrote:
> Thanks!
> I resent it after the master rebase.
> 

If there was a need to rebase (i.e. a git conflict when applying the 
patch on top of latest master), you need to say it's a new version in 
the patchset, this is usually done by passing -v 2 to git format-patch. 
If there was no need for it, a ping on the original mail or a patch with 
the [RESEND] tag would have worked too.

> How can I request to merge this patch to the dunfell branch?
> 

Once **merged** in our master branch, you can request the patch to be 
backported to older still-maintained branches (i.e. dunfell and 
kirkstone) by sending a patch with [dunfell] tag before the [PATCH] tag. 
Your patch needs to fit our backporting criteria (bug or security fix 
usually). This is appreciated by maintainers though not always 
necessary: they usually follow what's going into master and sometimes 
backport interesting patches without requests. Better send a patch if 
you really want/need a patch to be backported though, it helps them :).

Cheers,
Quentin


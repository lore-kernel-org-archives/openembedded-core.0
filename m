Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD719C433F5
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 13:01:30 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.50])
 by mx.groups.io with SMTP id smtpd.web09.28655.1652706080903906209
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 06:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=KjU5nleX;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.2.50,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgGAIJWRwigjSs+gPb/t0azBltmi7kLAgSXJ6v84TY/TmyiEn0df2ixR+YgTWH2+Q6oPTSYYz/ml6QZ5CNE0pxCcmImBIKWaL1ApT7/zkKTNrrFiEJEyJvDCbzdgnbyq7YE8cRGuSc0bjJk/aDOCmhI0fPWywTv4gamNz/2k+ulh5FRbquxrwiM8JPiEF+Uoa8k1TNEJEe6bxs8vuR5rMrzUJwR2OLCPsr44vTF02TY0wBj8EBLWzWOdivJmqcGxgV5uIxPwHheXUvPkb22xSUyoc5Hq3v93PLD6EsBtw6OUYPVOZnOTa+xsLKZZH9oADxV0745ZKRhEE8caTFlqjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QeRAEUW9ETaB8IDlzljfMXQ1i9wqJD8Y3/iy3M+dt9U=;
 b=gM1KqA6uUYCGzPuPCZmO9EwMkPKMVfWuFLA9FerAiyU9zyxETXTONSWvZBJJ8O+Eb/KYQqKd9YuRMJDNPD+jvhpURme3xOtr7ZYalTcKyiNdgZXQjr+hxx7LV7vKmHtAza6ulN35wsdkvqethtsyPDcAqijgwRfGaW9Q+e2+qCICagwK6HIYx/cdEKRIVrWh6QCabA4IWVtuFqT4XRDYey6Z2tT4xZbMs5H1MWn4JtJgNxY2LFctV07jGTTz/bm0g4psjqM0xPmrR5a0CHLgR12PifRCmiyf3ZzycKPsMTvVqhngBtqsJ1yC+ABuoRh7GQdidTxyBLj71gTsgl4hKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QeRAEUW9ETaB8IDlzljfMXQ1i9wqJD8Y3/iy3M+dt9U=;
 b=KjU5nleXDdTxOWfqgq374jSRRzdLBczBiMfWhuQkW8pxo6Auk9F5rso8yHpEJY7zdNI84IYvVPG18367J7Dn/Zv/5zEzJ+EyAsANNQBkxFQQgkljUjGMFrD/eDt1ACv3vqPp6NhJjRfhBbH/0+lkSmLhFtuX6WJt6YZqICMG/jY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DB7PR04MB5162.eurprd04.prod.outlook.com (2603:10a6:10:1d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Mon, 16 May
 2022 13:01:16 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e443:c646:c299:5512]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e443:c646:c299:5512%7]) with mapi id 15.20.5227.023; Mon, 16 May 2022
 13:01:16 +0000
Message-ID: <e6c6fc91-5e14-3084-40e0-ac4e8be76c1b@theobroma-systems.com>
Date: Mon, 16 May 2022 15:01:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [OE-core] [PATCH] selftest/imagefeatures/overlayfs: Always append
 to DISTRO_FEATURES
Content-Language: en-US
To: Jacob Kroon <jacob.kroon@gmail.com>, richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
References: <20220516112849.448882-1-richard.purdie@linuxfoundation.org>
 <7763f240-35b1-27d8-f2ec-8860dbea0e48@gmail.com>
 <63b10a5b05a1a029e50725341b1cb5cf4838ac53.camel@linuxfoundation.org>
 <660498bc-9239-4f1f-097d-29b562ba76a3@gmail.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <660498bc-9239-4f1f-097d-29b562ba76a3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0045.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::11) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d6e1950-e853-48cd-61d2-08da373c29c4
X-MS-TrafficTypeDiagnostic: DB7PR04MB5162:EE_
X-Microsoft-Antispam-PRVS: 
	<DB7PR04MB516235595E5028680245CF32C2CF9@DB7PR04MB5162.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Gu1YDn4ZqaU5Zos51nkakJbd4C5riggkNlZtocsGE6VGfu5HM7QJk8AzHkf1GR9A1pp4mU1LJL/LyCAuLRLOx7r2Syi+m+ggUbOVh/lQIMJRyv+oow8xBW7N/l6+5r2vMUaezb+7oh4FVsWUritzvHrdgv3O6eGr3Ot6yo53wbIi5HYdWhCVNmpOYPJPHrWCke1BaEmf4W7rPQxtJd+XQBNK/dP+23y2Ubykft35Tq/c4HcoUzEdvCJmIfxbuQ83WhLn5xO5sXSzcakxZrZh5Eyb95cHSf0UvKM/v8Fw4S9i4zjZcX8JVX2lXaplvNWHqOxCgvZd+yJM80ecd5HKV9wieMYG+sMgEAIMS2WjzONzx+JMr/bTWDXbcA7lqYKdNQYl37s72xBXWR9M4Bz5lADcFUuR+m2pHb4d6fmA+gkBCCOF/6Nsmd5rpyMrgyGlngcYu2YP5tCZjALhXveKFJvUbOb2MXlDtEa1xAczzE3RaA6BfTWwvyISELVMHsPP3DMR0UN2Pk1R7qV0yEZKy1NAaxS0VvbI2PwXqcculifkz+ezj8sBGfj2sH5GabC9EAUpeqncbffpqe4Xd/IDpy71pRWkp9088o3PuoOr/vPkfy7pC5duVH+RsJyChwQpUg0ICZp2Sow9OaV+ngv784BEOlrmqdBerm0fDDebDPt029a3MEmc1poj0Zi4oblGYYQCy5QgyRnMZkBnnYkV1pWu4FHaGdqbfUYl+DkPCZQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(44832011)(86362001)(2616005)(6486002)(2906002)(31696002)(6506007)(6512007)(186003)(38100700002)(508600001)(66476007)(26005)(36756003)(66556008)(66946007)(8676002)(316002)(31686004)(53546011)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RWZjbVJIbHE1THFkRFp3d3dEbjdUNnA1SWVWRXR0d3U4TEYvc2ZXRkozY0c5?=
 =?utf-8?B?RGhqS0tUZ2N0SjREaWpyT0U2YmFXSmx3dnRIS2NVOVR0cmZMOHYyWUNiU1BD?=
 =?utf-8?B?MHZrYjRaSXFUejdFVzIxMy85dmJ3bzV2Mys4OVNhVWM0dVk3NEJ3K29IRXYw?=
 =?utf-8?B?a2poYzJuNXAxajRkUENOTUMzTVFySU93RS9raExEaFhpSEh5SVdtNWV1T01X?=
 =?utf-8?B?U0hhUnc5V2x6N0lBVTJVVkVQc0x5WFNMaWRUV3RrbVJ4U3paMzk3Y2JXUHF6?=
 =?utf-8?B?ZFVpY3d5K1M4ZVhZM2tTN1VwcHdNemIzTUR5czFmcncva2JwVStVVnB2eGRU?=
 =?utf-8?B?WWN6RmlEWE03UkpKTHcxbFZEMGJYSGV2cWh3L3ZINW1WZFN0dFV1Nk5mOFJx?=
 =?utf-8?B?ZlJabDFLQ0ZKQU43Vmg4SytyZ3UrTFFoVHZLeVpTcTRSRTdtNTZGSzNZa1Ay?=
 =?utf-8?B?bU02Q20yb01GdzAwclp5akt3UWRYeTMxeDFHVjJhTzBITHhSMUNZT3VsQXZn?=
 =?utf-8?B?K2MzT1RiM2NFOGVSQjg2dW5BRGpyK2VxSys5MWV0S2ZNTDAvekpRc0M0dUtS?=
 =?utf-8?B?MTNSdXBWQTh2NTY1TTBvdVlQMGQxemlkK2ZBeGtnNEk4ZGlIK0JjY1JmTHlp?=
 =?utf-8?B?VkpKd0tCcCtxMURFQmJjZFB0V0FJdlNjU1RKOFhCOEp5c2NQMTVsM2p2TW8x?=
 =?utf-8?B?K1UzTVJOMzRIdG9tMXgwZUg1L2ZROG41dmtkcWxybFZ2eDBScGkvZ1lxVm8x?=
 =?utf-8?B?SXdNM3QrSjdVSkRQa0hPM3VGM2tvZmpjSkVtMXhGcWkrNzY3dEpvSlZSWU5n?=
 =?utf-8?B?eU52Q1FuWC9sVlgzMmdtbjZ3VjYzS0dGMjhZM05JOHRieXNyNll3ajAzcmVj?=
 =?utf-8?B?TE9mUm9ZeUF4TGJoZ1dDS0oxcmtPbXc1UWJkQlhhM1BDQmJGbHBMekRvQm1E?=
 =?utf-8?B?QWczU09od09aYjZjQmFpeUxJd3Bod0tZMmc3UlJCdXpseW1vY1R4YmNqWkJy?=
 =?utf-8?B?RUtEUmg0ZGV5L0NZZW83UGIyVk5lSk01Y0dqdlBUNlNIbko5eVpqZkU2S1pV?=
 =?utf-8?B?U205cjNzYS95blMwelY0VHU4OXhKY2VmLzV5MVVEbEsrNUN3Q2ErQmQyV05S?=
 =?utf-8?B?N3dXZlh5S2d1SmFDMzU0R2lpaGdRWVUxem1PL3Y0TjhVaTh0VkUrdlJ1a3lM?=
 =?utf-8?B?WlBWdEJrVmhyWlZGSS9MeENXYjhWR1UrTEQ3WmhwLzYvQzBDeC9ObGVuRThR?=
 =?utf-8?B?Y2Nxc1QvZ29leUJvdXNDV3ZDNW9KMFI3cWt1dVlGcCtIcGIyelFRNU9vbjFo?=
 =?utf-8?B?SmNEeGVXTmttMmp1T09LYzkyVGRPRmREa2tIU1ZCNVBncjNzVEFRdEd6eXdL?=
 =?utf-8?B?VUVpMWVlV2lJQVRWRnhQa215UEN4dWxKdTl5UzU5ZXNqZVZXYU1NWTNZRUZz?=
 =?utf-8?B?a0lVRm91T2ZXRzVsYkczMldPUFpZNlZzbk4zVFFnVmZ0UzBnczJxeGp0ZXV6?=
 =?utf-8?B?ajFKRmR2MlBoZEx1K3IzVUZyMDJNZTdCZzZFeUFlVzBZeG1qQW5oMk5LV3Na?=
 =?utf-8?B?TndZWWlFZXhqbWdnUk1OQmxTZmFHYlVaKzgrWjJGa1M2RmlaZCtEZkZaVzUw?=
 =?utf-8?B?NE9vYVBhVGQrcFVjNWZRVFA2czJmRGp3SHF4TVN0ZWZXOEpoSnJibWwzWFJN?=
 =?utf-8?B?amNoTzJEYzlkczBYK0VFb3V6UWhESjVTQnJVQkhTeWtNcGZkWGt5MWtiUnhC?=
 =?utf-8?B?UTNNNVRDbUdwUDZxbURBMUlFQXBBTGk0WWZBK2hjaVQ2ZXNnMWg4TVJmZVl0?=
 =?utf-8?B?elphamhIdSt5aVpUWTZUUjJEVEFNVUt0bDZKNnh5aFpOd2pyc2hOdDBnMUU0?=
 =?utf-8?B?RlVxUmY5cnJFdFY2MnhuZU5VRkRYVXZXdm9NOU5uV2ZhbXRXU3NmU3VSVVdU?=
 =?utf-8?B?WUhvUkNZWEJuSDc1d1YrU0F5ZU04VTFacEdFampPUDdlamtLNG9DUnlzazJj?=
 =?utf-8?B?TDBQNVVyRk56M2VaTFBueTB0UCswS21VWENjUHpuLy9CcTV1WlRadkVWTlZa?=
 =?utf-8?B?bk4zcjJYOEx6MXZNQWhiTkRrcHcwaks4Zmp4UzhVcm1ITGlxMnBtUG9OalBl?=
 =?utf-8?B?dmVOYyt4dk42SHllV3BlMEl1Ui9xbXFpZDFpWHkwenZRUUVGc2x1bDRXNWlx?=
 =?utf-8?B?MTZOU2UyTEZLQXNucGRNa2k1VWNHWnRsNjBMRDJkOTkrNXdhdi9reUdqbUpi?=
 =?utf-8?B?MWt3SnNQK1RucnRscWFHdmx6bjFuTnBtUkJiOXpyNml1WkluVkg4Z1JvTGZR?=
 =?utf-8?B?WUtickV3K3dlZzlUNHF5b2dYRGlTZWFQTWErNXJNRWg1emtHcmxva3ZxNFV5?=
 =?utf-8?Q?dQFSPPkrPIl/RabAaqK901qf01pdo/TYU3hop?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4d6e1950-e853-48cd-61d2-08da373c29c4
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 13:01:16.6667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7nZWA8FKryNcenBtazxgkzKFfrzlq824rbpF4I88/ViDkvgquSN4hG9ugxUMyCx77coSs+PB4ciyPJ6/pZAsePnqBNu75gQ15n78tLKkOiKsWnTKxh4LxernOvzQuBw+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5162
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 13:01:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165681

Hi Jacob,

On 5/16/22 14:52, Jacob Kroon wrote:
> On 5/16/22 14:38, richard.purdie@linuxfoundation.org wrote:
>> On Mon, 2022-05-16 at 13:43 +0200, Jacob Kroon wrote:
>>> Hi Richard,
>>>
>>> On 5/16/22 13:28, Richard Purdie wrote:
>>>> Using += unintentionally removes all over entries from 
>>>> DISTRO_FEATURES and
>>>
>>> "over", you mean "other" ? If so, how is that possible ?
>>
>> I mean other, I'll fix the typo. It happens due to:
>>
>> meta-poky/conf/distro/poky.conf:DISTRO_FEATURES ?= 
>> "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FEATURES}"
>>
>> which interacts badly with "+=" :(
>>
>> I'm not happy about the situation with variable interactions but still
>> not entirely sure the best way to proceed.
>>
> 
> That is surprising to me. I tried this snippet in a Makefile:
> 
> foo ?= bar1
> 
> 
> 
> foo += bar2
> 

Same for Bitbake.

However:
foo += bar2

foo ?= bar1

will return " bar2", while make returns "bar2" (note the missing leading 
space).

The issue is where the ?= is located. If it is in a recipe, 
configuration files need to use :append otherwise they will override ?= 
(as configuration files are parsed before recipes).

Cheers,
Quentin


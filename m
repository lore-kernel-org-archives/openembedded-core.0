Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F50FC433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 10:19:23 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.78])
 by mx.groups.io with SMTP id smtpd.web09.7813.1646907559865953565
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 02:19:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=hlKvw3Y5;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.6.78,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HqRMJzeVclLj6ygFyqcExFykmFElHzltFulDMv3Yb20l/fd4VaESV8Vzi3ked49ERcw8lk/wRiQu5JROwRKIKEBTwfINc1sUj90gVVoSFysoV/O83i8qH1OvR1q01PK7cyneYp1/eB9j2cRseiEK4++Ml1QEp11qZiZ3TJc/cOF3FS7Hn7jQurI8bmPNkRturNadHhF1/PiXENx+g8GQptu7YRjHoCrIozarB7ZiLKFCcdKTmKuRXyg2FZvJFhhjufu6WEnH1wQt+SxZrM6HRrGSTQ7VSGAISp7mCBApwhtk/MFCJ3IAbQP7y/Q+uuuLjjD9vTDQAeWPzZ9fsXZVRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Au+LpBNmKfHlDt2Czs7HrdgVNlTVn6ch7HNUDMyrFQ=;
 b=CJYsBbces6W+B3wDnkTZ7JitZqamGQ4eC1pUAww62HGE+s6PrH+E8O49s1XSbYSsAImb7+ktiiL0DCYUOyqoEfQIPfNMqR5Zyd5BbVZYizh4r3j0s/OIo0UQWupTQlmlMjIkV7bh6+BGQVvLxeA1ySaRqlozSUdpeN/ZkCNKPqfqWBGqo+UzLPbfRUYOYkuHGJZ0nPe6OB+QNwfq5CU8xhv0g4y/KEXljUXI5PW6I9KdCD4falQAxjt0SPl6tP/mSbb0ki/5/szIxLvtfgcoiFNO3Qb+XRjlhZmd2Jr30/e0d7+q/WR1sZo0QSZ5wGB7KahRL3ZQcxUgQtvwyz/ixw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Au+LpBNmKfHlDt2Czs7HrdgVNlTVn6ch7HNUDMyrFQ=;
 b=hlKvw3Y5szUDaJNoYlN1ecg8CwKZ7jad5xcIu6wFrr6JZnm9sigkjoxb40B6XKbqpBWd3PYyw6cxFqWTCQM6BvwwAxHlO+plmzheccU+HCEUxlgJeGuJCwImMLgmaUV1QThNKxKRIVFK8HLrdosJtktex+E97DvCYEUZKFT+ZDw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DU2PR04MB9114.eurprd04.prod.outlook.com (2603:10a6:10:2f5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 10:19:16 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3%9]) with mapi id 15.20.5038.027; Thu, 10 Mar 2022
 10:19:16 +0000
Message-ID: <150ebfd5-4ba8-0736-06f2-ea2886268fac@theobroma-systems.com>
Date: Thu, 10 Mar 2022 11:19:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH] local.conf.sample: fix reference to extended
 configuration sample
Content-Language: en-US
To: michael.opdenacker@bootlin.com, openembedded-core@lists.openembedded.org
References: <20220309094442.606175-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220309094442.606175-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0036.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::49) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bab4c06c-3717-4d41-a673-08da027f6e3b
X-MS-TrafficTypeDiagnostic: DU2PR04MB9114:EE_
X-Microsoft-Antispam-PRVS: 
	<DU2PR04MB91147560F0472F557967E1F3C20B9@DU2PR04MB9114.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UQFvWOOQMbneS/Wh6TNeBTXF0H+y2Qv5U3cJtARJJ5TdlebHlIIiWD/ebOjvUjMuXItYZ4QU0BUx6tQLNl7uUnLgtE7IVFmeFLDezpNKN2orw+1dfKGAtXjbW8wQwDjbpqiQQ1BCcU5PnlMPDaCYshAvaq4P2cmMrLT87jA4pZAQeqppNvnEFgR8WxgC7n/2gK0u+ep48g0JhXJxM0dmcA4hyHLfeIufmAPrNPnLQa60D8Dm/8q7B/GsPhWUOh/Pluq8nX0KcYu2NCT95FGVgcRS/3uXnSQw253zzqweq0Bp9o8EKfZl5VFRMcWWcLlT3udgETlzmi+4vMjTsIZHb75fUFBjjCOkWRuaoLk5SXN51v3WMxWmyU1aZv5joaqEMDDs3B3wRjmWfgl5IuZO8VAc60VcD0iYripSIMCP87N0kR+4aCyxCjZwVHGwkxjOY0k6d2E0FDRGHJsA9ym1Ww+z19VvlpgHZP8PTrVazJZI4WV+vnoGjaQXEI+6HCPoDGCaktL83//+LnqJS73lZ1evB2/f/ywuD7kYLu/9M75out7IpzM0CZL6Vw23Xdq4LQd6y8lghp+uoaeeQQ3oexotpwwCGyC5CRe6NMouxOUNR4n3LObq8PGeMZLkV/GKtiSoUK/ANjEOORZLY5M/arAWsQaieFSI/t6jZ534lKOR1HjtFWzFxDeTq7uZkdELKXOFUGhvFB4kOthyvN17AfINGqOsnEEqP318ObW83lk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(31696002)(8676002)(508600001)(558084003)(66946007)(6486002)(6506007)(6512007)(53546011)(316002)(44832011)(66556008)(66476007)(31686004)(8936002)(38100700002)(5660300002)(2906002)(36756003)(2616005)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dUtVQUY0dkJSK1MxSTBaL3pUKzIxVm5hRXJqV1k5VFBWL0VpdnZoSnVUOWhk?=
 =?utf-8?B?MTVnMTNSVHl4UEFNSVBsVDZJVG9CTzhyeHpLR2VjYUJVS3VXa0RRWWNybE5s?=
 =?utf-8?B?bUtUZ1BrTzBOVnhoL0dhbi9lbjhsemRBSnZiTE1RN0c4YUhDYU9xeGFyQnFO?=
 =?utf-8?B?a2l0L3ZWY3VGUWw2bTFrL0U5V0RYZmpEYmhiTDFNcUxBSHhpOGdaYVJ5MHpY?=
 =?utf-8?B?dWZWTXhnejYxdEFsSExMdmdnMUxLUFl0ZVVyMVNkMmJpb1crQXdEcmx1TkxT?=
 =?utf-8?B?QVMyc1ErWU9ZOGwvQ1BLb1BQL01wRlVCbnFjdFhhMjJVNVZUaE42R0U2S25a?=
 =?utf-8?B?U0cvUlgrbWhuV3NFZWtYbVp6OW9Id21YVzF6YkRVUHFobTJDSUNnRzYzdXRt?=
 =?utf-8?B?VlovbU05TU9FTlM2MytuWDEzdi9YRGRyVG9nMVFoOEtCTFlNL0YwYmZNRjdy?=
 =?utf-8?B?YUxyL1oxaXhvSFZtWTd2MzhoOEx3VFEwaUxlbS9wT0FtRUNVTzJ0VE5KaU5x?=
 =?utf-8?B?aWdLcE5CVWZXeTBMaTBSbnpUOW9ydEdqcWJSQnJyZ1doWHJsNkFsbFVMV0x4?=
 =?utf-8?B?djI1WnVWd05LNkc2ODZpd0RtTnJnVzQ1MGdSeCtRWi9reDIxVkkzWU0rcGtG?=
 =?utf-8?B?bzBrNVVJdkJmQVlHWDRldjE5a2Z5YlRGSWhEZ1kzYndPRW9Nekk3QWlWbDY3?=
 =?utf-8?B?SWVVU1RlSXZpS0VWcFRSazEveUtlUXlDUnVCa3F1NFZZN3dzQ0xHQVhQTVdR?=
 =?utf-8?B?aEh1dVl4VkduWGtWMGl4d2NGL0NQdDZOMWcyajJUbFpVTXdGd2V3VVJQbk96?=
 =?utf-8?B?SlNnaXlseU9MK0lKazdHelNEMmdlUHEzdlExbml1QkFkWmtNT2ZiTTdxWXhj?=
 =?utf-8?B?Wml5TnV3TThNMlRydFc3UWtMQTV1Z1pxUFZmU1RpNlIwQTVwVXNoaXdEN29H?=
 =?utf-8?B?aXVCVTZnMW1RQ3hWUWhhYjkvdm9yVFUvd1VCWHo4c3R3dEg5a0RqUzl1Qm9i?=
 =?utf-8?B?VEZHRG9DYzMyU0dnYnppcTU1WjRZWDVXcEhBcTlXKy9tbkNqazZVTVF2SWY4?=
 =?utf-8?B?cXJBdzZwb01ONjFDaFBwdURqaHpJR3orbFo4K0hoa29sK0RtKzlPc1FJTTUw?=
 =?utf-8?B?VWpxbmRvcDNGUnd6THZCUDlWbDFpYTlNY2VrdkVNM2Mvc1VYQ0lVSGpsVnZ5?=
 =?utf-8?B?RXRvVTlOR0syWndrdlNGamxDNzc0RUZQNG5kRXkrQ21FOG40ejlyMnNzL1RH?=
 =?utf-8?B?Z21RSVBpeXVFUjBrUXZqN1BnODVTMHdvZ0hCM1NFd0E3Mll1dTNyK253YVBh?=
 =?utf-8?B?QU9YREpZMDlnby9xU1hsZ25ZWFRIVnovQXFaeWh0a042MWFsUHdFeCtTeXhB?=
 =?utf-8?B?bzdRZGt6S01mR21sVThxUHIvRHFzUFI2K2RSRUsxNkNkZmJKY0grN0dCdGtS?=
 =?utf-8?B?RmFVazNqakJvQ2wwb1dyMXdnVnpXOWhuWXlsdXBnMWI5TVZlWTZ2bms1ZEhL?=
 =?utf-8?B?MXo4ajliUzBRN0diVEtPQ2NaVllXYXBUTTZPMjdqcEg2MnFCMlh4VGhtRHQr?=
 =?utf-8?B?azRVRXdJV2xZcXFWZXR1bTdkVWhRRmZsUXErRzVkR050cmJlVHFLdUsvQUVL?=
 =?utf-8?B?ZDJyMHZld3ZidUczQng5TUl0KzB6a2NYR1FRTGtwb3dCV1VhbHlaSE96WURu?=
 =?utf-8?B?cUtsZE4wVnlSOEhLR0FXQW1GU0NzNWQzMWg2NnZvc1dWL2NJMGFHSENmMnJt?=
 =?utf-8?B?eklPQ2Z3d293Qm5JUHNHK3BTcS8yeFJLN3dPQk9vYTdvbHJ5SDZQL0wyWHlN?=
 =?utf-8?B?UnlRL3lYL0NsWnZwUkVOVzdvSThaQzBlZE0ySjVybzVGSC9WYmptYzZLYnBH?=
 =?utf-8?B?STBQelo4OVBNSGNqTHF6cmhVV0x1NVl0Wkwvc09aN1NhbU1IMFV5aWtkVTkx?=
 =?utf-8?B?cm9EUHVnYktCaFd6L1hPU1JOMUE5ZGtZMHZIMVVIOUdxZVVzbzlJMWMwYWVO?=
 =?utf-8?B?amZEdXdLK21ka0sxTlZNNFhYQmU2elE4MWtyKzYzL2kwZUV5enFlaUFVWTFD?=
 =?utf-8?B?SHcxSEFudUFlYkloOE4wd2wzWmZQS0dYblVYSndsZGpPK3BkNnR1N0ZkeVJF?=
 =?utf-8?B?cWtwTEE5Qko1TDU5d25wVTRhNXBKWDcxL0lFd1l5VkdWTjA5N25EOVFnKzBu?=
 =?utf-8?B?VFJDQk0rN0xlcU1QcDdpc1pHWElWenpHYU9FVktud2dVM2NnL05FRXlTTDVK?=
 =?utf-8?B?My9Jc3EwcDVlK2xzMSszeWV5dS9Ka1dTeG5kUXoxZ1JtNnA2S3JQUndQdngx?=
 =?utf-8?B?bTNlOWpjT0ZvQk9sUjkzSE9COTVPc0ZHYzVRWnhYemd0d3EvelhyUT09?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bab4c06c-3717-4d41-a673-08da027f6e3b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 10:19:16.1570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 O1+YxCGLt/rAenWTu/h/etYzJxsCH4vfuaN6MN0t2v0fJgk1tnyBDdxce307byqx4vVc4fejVBJ1znOW98K03LZO1i3fMW7ibtdVNeZsAZi6GaVrOdxyroh05skPsTnq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9114
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 10:19:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163009

Hi Michael,

On 3/9/22 10:44, Michael Opdenacker via lists.openembedded.org wrote:
> The file name is local.conf.sample.extended, not local.conf.extended
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Thanks!
Quentin


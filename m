Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 622F7C433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 09:39:31 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.53])
 by mx.groups.io with SMTP id smtpd.web11.17359.1667468360464495371
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 02:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=SAzukK6J;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.249.53, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTvG6xWGE9QfznPQYCUwjU4du1KV4qWzU6s/rz2Qh71XHecEO6PjW16emzbMOA2H5LA/5iS07DDWWKxjq+yNbTqpPz0nGt9EhtDuO8C4uKRONX92zGmyXJWtea0kHnZuUKlhdU3qQE48X1Z+6DOHYKMkP0tDjjtsfgA/jWOzV0XkL8emguURGzPWJSIys2gYMPtshDk1QjKFpKId9d8dtu1Xpq6ZjB+o6PG+TnQmJsPMCySQYOoVrO0993ai5YBuIatBZAwqtILrVWChPJ2TIPyD5AoU0Piuosd9+CO9LAEv76zRCvYT9TbOnu0bjb02nuBlPhqvgICoToAPY5yTqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxWF2ra0eYDwIChcbEB3a0XGPfaXcg5OdQFQnqDck6M=;
 b=axiW8cV8/Ge/XmI7G3yEao8QgQMbcMeaSYpNTPPJ2dXLe006kzNCBnCF1QbPqLcR8Ic7gwODZ/3aJpFv9+lGzpF+ucmug30A1TZStPOhp5TgKs8QgEHPVdIvOGSnOrz726gbs0Rv1OJGpZCynsUlzNMTLDkzZpM9Nce6ozbb7zeD8f03k8pK5lecp1Z/7Mu9QfRtSs87l5CFdDKrebvmHXnBjbMozewsuiywvaW5WY0Q6kiZRkMTl1Xf1E3ba5AQMkov32olc38Bwa3IA+PvDqcvVpXDhaqrOL/L6f2lQZ00lursGSZ8Gkl/IIDHduKXIBgMoyKUfglAQ5onBKVWyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SxWF2ra0eYDwIChcbEB3a0XGPfaXcg5OdQFQnqDck6M=;
 b=SAzukK6Js2CXPtsg9YO6ZHRrQF4QAeJZcTMGCbx3OTYzLi6kdffMJSvUJsZ8EWibDPqxDnm+9z1XNqBBricY1LFFcuxC4FtY/Cvsh+x916H+toBmOVCQQRmA9XQX/3NJcpyQKbnZaDpyzMOJS9snUIGUwgUVM0Ruebfx9/Bz72coDOOrnxTHxCywPJFy6nf1b2+roWUeOjhxf27Q5iBHKwgJ34ZfB6f+vc496UQdSf4xTLvSeXDFzXAOfv+Pcu/Mic82cf7a6b/iAMBMG8YLYfixsti92fNePPCHr6qhWVc/whwamQKEtZCUYdd7C6FKvb8+PkT34fsnIu3VsVl7Kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DBBPR04MB7913.eurprd04.prod.outlook.com (2603:10a6:10:1ee::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 09:39:17 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 09:39:17 +0000
Message-ID: <ac210bf3-ebcb-7dcf-1d41-f3e35aa3b532@theobroma-systems.com>
Date: Thu, 3 Nov 2022 10:39:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [OE-core] [PATCHv2] python3-manifest.json: Fix re in core
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-core@lists.openembedded.org
References: <20221102190935.1700103-1-leon.anavi@konsulko.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221102190935.1700103-1-leon.anavi@konsulko.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::15) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DBBPR04MB7913:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c5f52f6-46c9-46ba-ace6-08dabd7f469b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QK8ph2t/mUlkt2oRW6Uw+uJsW7OZBUzRP/Y8IEcqvzxC70RBPVu0UdToCFPm33hy0KecUQobVTuh5ck0W5DZiUUFOgS5t5dU7RTb73BM+OdL9RGwG4Ef4It5qtMQ6DzVsLfMQCfWQZvYCLQfjmACOIVtXW6xNcC7Yoph8ylo8XJRr/JWht4FCy7PFUIUecONvNZb8qSNW3F6HloViTCNpwY3FprUqtlaV/Dcxp53OlSQmM+MZAeIf0tR8auowmOCnXmWEFfwkmz17G93ZKzv61BqXrtbHd5o+hPRVkUnZl7IdCnTwA+7TieVQxcxhCoLkSC6NQ8+/8OY7gasq0WQTO36gKz0UQrgdDnWnfbgx3My+loihzIXwU2VQ/hOXFVWgDV24ltcYKLe1GPFw1UIbH9WVDUfm9Ac368HBtdJ9ioXnb4wK2vsJZSyWLjWTbupKlDJ/LABpP1eOwcxUYiTsAQJnEhGba9EV1Ilq0YpfuXboM8wHsnw4aTiuhC0705qljV+jf4BziZdmJNJQIm9zatttyW7hw+JDKyvIk6cr/5/ZNwlbdY1EuNrEpBvYHbcfkhH3dCM6BC3qhYGBnRWXYIF57X6DBOzrHVuwnO8hnZEDzUgo2ywLJUSLdb5Ayb9ZWk9fXWbaK4g6XyAzPxG+xk3qgCih5YPs00hl/wgHFHKjQf9NWG94tjREhui3ZY+7zDA9WA1qQGnRchBnivw194jfE0L6dThMBEiI3t2dKLwCIMRZE4UTu8ywvlbMGvLg6igNeV1DlDllSZ09Y5fANb9R0pH71uGahVQ1TNhFOE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(39850400004)(136003)(396003)(346002)(451199015)(31686004)(6506007)(53546011)(26005)(31696002)(6512007)(8936002)(86362001)(2616005)(186003)(8676002)(5660300002)(6486002)(4744005)(44832011)(66476007)(66946007)(478600001)(66556008)(83380400001)(36756003)(38100700002)(316002)(2906002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RVpaRlhUTkRRcmY3VWxOYzVtczd5N29rVW54UjJKMy9SNFdmUTlJWFRndjZ5?=
 =?utf-8?B?cXRnNStqbzl3M0FFK0hsVWtYL1UvZGNobzNZK3dubzBKT3FNNFk2Wm81SCtE?=
 =?utf-8?B?M0l1cWYrVlg4OXJsVllMT0x1a2RLUGw2RGhLUGxXRC9xM1JwSStrMW5JV21l?=
 =?utf-8?B?THVTMHVjQ29ack1qRUF6R21kNzFWQWM1ck1oVTkxaFFheVpMQmFlRWdpL0Rs?=
 =?utf-8?B?L0wxV0tLVjIrMHc3VVIwY3UxU1pqQlQ0OWtzZ0JIRzJWTWFMSGlWVEdTaTRv?=
 =?utf-8?B?a1JBaTBuSCtkSjd0MGJzUTAxb3pHMWpsUWRlMitsSjBvb3M3SGppdE5kVmpY?=
 =?utf-8?B?VFh2SjhZUWFUaXlFMGkvUVRpT2dYVzBTNVRWc1BrbzdweUg4aWNscGRJNnB2?=
 =?utf-8?B?Y2pjbXVnU0cvNTdrb1ZDcHNlSkdIcGNxdjRWdnhwUHpIZ01KV2plWjg3WVg0?=
 =?utf-8?B?R2NteU9ZeTRBWm9VcWpQRlI1ZmdGeHAyL2l4TU93aEVqV0dWVEI4RlppZEJl?=
 =?utf-8?B?R0ZCZUJPa1VxQ0VxL2pFSk4rYlhEZ0R4Rk9rUVJNQTdPeFJsZ0JBZDhRWmhI?=
 =?utf-8?B?cHFDdWQrN213YWlwTWxySjJZMmwvalBZZTNWOHdVb0k0bkxxOW9MdVJ0UFhh?=
 =?utf-8?B?Z3RqTVZMWEc3V0syU2FvdUFQYjdKRFpySExEc1ZRUnRlMmozbGt5VGtKK1ZO?=
 =?utf-8?B?ems3NXhFQ0lScFFkMFhRWERjTWVwZFhyWjBNZ0x3K012azlsVmJNWEZvaVNZ?=
 =?utf-8?B?MEN5OEEwa3A5aUM1T09ZMTZybFRQSmp6UXJ5dGdxTjMrNk81eW9VMDJEVE5R?=
 =?utf-8?B?WGt2TUt4Y284NDg0TnM2YldhYWhpbXVxWTFSdUdON1RuNUQrQTV0Z0hLTzV1?=
 =?utf-8?B?UVE5RFl3eDJPUUZTRmUrODlzWGYzTHhoU2VDazhwaDNscXRPMTZ5d2p4WGl0?=
 =?utf-8?B?dHZVc3FhMXJoK2M2ZW1kRmgrTCtsek80WmU0RjZkUnRHZndrcmpnaUtaRmpV?=
 =?utf-8?B?bXQwQ29UejRDMDB4WGIzSVlxMjhuazFwUlhBbkk1Nmc3QUpwVG1Qa09QYWE4?=
 =?utf-8?B?VVpEL2ROc0gyaHRNMzBoN3JqYjFQNUk5ZDIrZEVJRXQwZERCbkpKSUlLWXpo?=
 =?utf-8?B?OEQrUG4yWTNOU3duTTVRc3NMb1ZGVFVkSG9oVXlNUzBKcCtzNDFZaElBcGp0?=
 =?utf-8?B?T3hLSkFNQkJ0NjRRSk1EMzZ4OERTVkRiYzJ3T0tiQ2QwZFJocngxeXVDY1lh?=
 =?utf-8?B?WitWbEFTYVFCNWxsMUhiNWpKVVNENzBuUkxRbE51OGJYNDZtN0YycVVIWUVr?=
 =?utf-8?B?a05zWW4xTFpjUWpEaUlUbFJkc1hlazc5aEVLMzZ6ZCtQaEVrcTh0eVFEamRY?=
 =?utf-8?B?WCtzcWJETVpLTTRZOWlhcyt3bmRGcHF4NFVEbHVWR3ovT0g3d0VjYWRDMFZm?=
 =?utf-8?B?QUIxTEpKNDRQc3RhNXJSUmM4cVN0RC9nWTlKa3NkemVhUTNBcmN6Si91YUVJ?=
 =?utf-8?B?Vkt1MldWLzlaK2JIL2dBMDBYL24wemJ0UHV5YkxNeWI1SVRsVU1GMVppejk5?=
 =?utf-8?B?bHJha24reTNDSWptRkpsQnc2TXNpd0JrQmZXMUMvc3N4VDFoWS8vNktCOEQ0?=
 =?utf-8?B?NkxkTThYRHdJbVFpbFArWGpCT1QzeEtmS0RWOXFkWkFVTTVPRGg2U1VjMm8x?=
 =?utf-8?B?L2ptM2NWM0RJbVQrc1E2c0VwallIcU16NXpDakRyMTNiVlhicHdGTEdoS00y?=
 =?utf-8?B?TytpWTh3SDhsd3ZCUzR3SWRqZFY3Nk45Yjk0Y2E0a2wvWUFYcXlmUHp6RWxI?=
 =?utf-8?B?cHB2WHdSRHpicm5wc0FZVkVhTVVBbEtWOWNuWmVlelJPc3I4OGJTcld4YXB3?=
 =?utf-8?B?VGtoY3F6dVk0dXJQTkxPemtXN3RFaFFwUjNnSGIwWUtuem0zditYZ2E3SWZy?=
 =?utf-8?B?Y28rZEtOdXdiNTZyTkFpYWFoNjNxS0Yra0I4aVRLWVhqYVVHcEk0VkVRQjFP?=
 =?utf-8?B?Y3E5bnAyTFd1ZUlHcHZCeGJYcUptdUdEb0V1d2xxblQwUkc4eHhoOUlFRmd1?=
 =?utf-8?B?YUcyTEJPNDkraEVQQUQ2ZnhZTXVXVE9weXFXSDBWK1lReE1HUFNaTlErbmlp?=
 =?utf-8?B?ajBLSEhsUGVYRmk4RGpCL05uRFBqbUxXak5vc2pseUFaMjF0dG1ia3prN3VX?=
 =?utf-8?Q?u14Kb6erUOn5AR4R+4dpXr4=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c5f52f6-46c9-46ba-ace6-08dabd7f469b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 09:39:17.1324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: haASB6bvxkB0HHykta1SKM9Uo+f2Ct8atvrqFU0Kwzxo2j75W92oT/DWpCP91sEMz1WnrKhKDh6ipU9sQN2DFofBMBBP/+9CQN4rZj4sjQ6sAhKmuFRpVKGpUMzgDLtD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7913
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 09:39:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172619

Hi Leon,

On 11/2/22 20:09, Leon Anavi wrote:
> Following the update from 3.10.6 to 3.11.0, the source code of
> module re for regular expression operations has been moved to
> Lib/re/. File python3-manifest.json has been modified according
> to the new path.
> 

I guess the changes are more than just about re module in v2? In that 
case the commit title and log should be changed to mention what the 
commit is now doing?

Cheers,
Quentin


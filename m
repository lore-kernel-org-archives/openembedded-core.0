Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B9AC00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 12:10:02 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.49])
 by mx.groups.io with SMTP id smtpd.web08.10084.1661342998626804007
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 05:10:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=X2OI8Mev;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.104.49,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DtNkLJdLjMHG01lBZJemOcEvRXo9RWuRrhUlgTQLQsLXmOC6aOaekZ/JXBhGPq8zEa9k7XJNHZhgDYUXI1vlqtGg6SirgCMNV4QYl0qawZJ01RuPL+YRFAyVo4a7LimEFgyziTpD0aCxL9UBlk+7YDOmlmkvzj324agOIJHkw/qSm6Eh4G1zdPqLmwsQYNX9xK6ojUm0wnVLu4bUB+YMAikSLZQZ8W7r29moyL4XZTkyeZ+TqWGcv9jfI2txxeseEteTKfhYXeDzDQb4JA3EZXICSrdsUXpakMX2yUD8pdLfqypbaBRqvfZq0H7ZXBxR3W89mhmzq9c3ZucwIltx6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfw8S+7YXgVtcYkCGaaaZyS/vn9OXllaBALDUxgI8rM=;
 b=Q6fuOLz0usER1tuSD4H/SBJr6fkxZORDzjUMc6mdknGRWFXjnFmTIzm973EGK/xBjhK8Ok0cKEkx5sal2Tb3lMj9/xd71xlTTbdYQndEvifnOMS7AHk+/vbU743LoKbYEUzdqOYz+N2ji1LhIrT+/KUEhyIgQKG08C2iCNcpgbGAecckJ9c0oHP/FeF0Jy1ipy8fFxxOZtFb4YYWd8UYx7QTNdQu9BmZcnlTc9FvnoI17UgyG2biJBklOmJJZHMlnqJ67toWCaVTYJ+UCrfhSIpR6wkFZyhAQ/GiidQG/li7poovsJkSWCS18GmKWO6TMhAPZKBUo/bVdtyELPG3MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfw8S+7YXgVtcYkCGaaaZyS/vn9OXllaBALDUxgI8rM=;
 b=X2OI8Mevh273kmcxOtJ51LPVNIrT4Bx50iSgxnPA0SduKCDdDSaiFX1yEFhym9uIs01C1zganKn8ZPDFwRYnGfVaXqD+advMdcyaqZ2ePvluzAs/0VHqW8eBkIOaHM4jbATv+/TkW/Ga5FPPZ57A1K+S7Q9DJ80Pa/mw1fh3JQ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by VI1PR04MB6318.eurprd04.prod.outlook.com (2603:10a6:803:f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Wed, 24 Aug
 2022 12:09:54 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::81a8:1bbf:5e16:9b4e]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::81a8:1bbf:5e16:9b4e%4]) with mapi id 15.20.5546.022; Wed, 24 Aug 2022
 12:09:54 +0000
Message-ID: <6bf395b5-864f-4d2d-8fe9-fb05cbe3940e@theobroma-systems.com>
Date: Wed, 24 Aug 2022 14:09:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [oe-core][PATCH] connman: add PACKAGECONFIG to support iwd
Content-Language: en-US
To: luca.ceresoli@bootlin.com, Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
References: <20220823163809.17214-1-f_l_k@t-online.de>
 <20220824105440.1cdf49a7@booty> <UI34HR.PZNATSOSGVWO2@t-online.de>
 <20220824115108.6eee852c@booty>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220824115108.6eee852c@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::23) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbbe5ec6-be71-48bf-68c3-08da85c98dd6
X-MS-TrafficTypeDiagnostic: VI1PR04MB6318:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KpdEAv7QZW32L5gskfPbQMqwmlvhNkz6W1PJ2upsp7QVNDZFTnjcjJmjObBFqw2djYSOkEH7ibw0I3qCqIhRDWj3gl2hMJMiTiXr7C7+kjUlz945fSZoCAoX6uDFcNu8piarIV4dC9BP/K1COesNcegLnwHIYk7WUvhoBj47LJs33PkfxmYTqZ4QFoxAHO1Fv4CyOdUOLyyjkzscnh3CnGlgn0ke52fYzuFJDi26JgmiwWBQMYPluygMzBxfcPKkNkbJLH2QnjPgjvSmOw0kZNdwWbkFJX1PtulRQdQYx8jhNr8emQv65OyfEHtHginDn+Oyd+Fk663ySYXY4vT5T5amZ8YzlbNzT2UJPErrYpJpZUPr+VR9PmffTmbHt+fgu4ViPaN7vI2V9PizIArdlGe0/GUGVcrlKWYvct8pg3Qtajgkw2hlzPDB+AyeZtt6PtXrPjkgfhuZ1U3S2pNMH7TzcAdl1Wjp3oGO5eu+8YAXdABNh6cpMWs52ajLctXdVJg5jh8Y1j2uPnUbchdzzGUO7BlI8CTQfAaEZsyg65vDNdfystjHLHiXomI5+trsn6jcYNb+dx8O+xhznrjc8bU+1aFOV7C+Yuf+7yxgn6w9+48XYpUGcMJRrgsLK9XcjwNtZRqGFjQF3T1T1vKQQYO+sCMJpM5H2FN1JnA3lLQHDxhUXIHS+QSoPYobCak6jDq+jSTrJ41dQ2v6zgQ3OUNtRQxzczaLL3wOXoPXB9DcCNQCOfig1j4t+/WwXED/u9ZxQYrl3Oo8FoJoRpvon6Mh7lKObDB1guoreBUGEiI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39840400004)(346002)(396003)(376002)(136003)(316002)(38100700002)(31686004)(2906002)(66946007)(4326008)(66476007)(66556008)(8676002)(86362001)(36756003)(31696002)(83380400001)(186003)(2616005)(53546011)(6506007)(478600001)(26005)(41300700001)(6512007)(6486002)(6916009)(44832011)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TVZjTXhkRDhaQlpkYXRjdmw3RlRoZEJmQVFnVVdLVkZPVXZMdlZOQzVNU2Rj?=
 =?utf-8?B?RnorWlp3KzVjaStaNkRZMVBlVzh3VTVuQXVmMllRODBITkZKMDZ0NmRleUFY?=
 =?utf-8?B?VDY0OEdXVlZoZGhGT3F4SEh2akxyUDlNL2dubUNaTml5S1hOeWxBNTVNWlNM?=
 =?utf-8?B?RG9aMEU4TkROeHQvTm4rckRyQjNnQlJKUFlHaElHRVFqS2hKSU1BVjh6a1VF?=
 =?utf-8?B?Z1NEZnJFMm4wYnMrK2hQSUZsdFBlUlVXdlhtTnBDNTV4Z2VNUEpVNWhXYTFC?=
 =?utf-8?B?dFRMTUxLeEFmN0Z1ZnZDcnFtRkdMQkMvaGNxTnZlbFQwcmF6UlZLejgyakdQ?=
 =?utf-8?B?VkpRdFJKNlZIZlhUQ3VWRHNuZTRZR0UrdGEyQndWZTkxZEU4eFhmeXlvRi9B?=
 =?utf-8?B?dlVxVElRam5sNDVHNkxWRjV4bGs3NFhoZ25XQWRrTjlqdVRJT09vTEVHcEI5?=
 =?utf-8?B?bEJhaDVURVFwMEw4VTdTa2JOZnQ5ZWYweFd6S0lQbU9RQzRQK3p6UUN0NGgw?=
 =?utf-8?B?d2EzbXRUZytPOXhhYU1VTElTUEhFNllmM2x1N3lWRE16R1l6enYxdWxZYVV1?=
 =?utf-8?B?cjROUmYvMko1RE53Wk5FeFhZZXVSTjNKc3BqVHNDVFo4Si9wcEdOK2ZabkZO?=
 =?utf-8?B?VFAzejlZRHpFeW9XTzNQeS9KUDVZSUQzVnROU3gyYmJ1WjlFUkFFa2YvN1Zt?=
 =?utf-8?B?MVNYYk5ucmVWUEhnK1VneEVoaGNnd1BaQzVrTzBZS3pORUt5NjZaaHFBN2JI?=
 =?utf-8?B?cXVjMGVnSVVFUmtGaDNBblpWSGlKUkx2cnAwRnV0cGFiUUUxZFZXRlJqRCtM?=
 =?utf-8?B?RWovb3Z1UW1iOWNob2x3TCt2NjVSYXIyU3JjMDQ2OHdpZXJBdnVQaWRnWXJt?=
 =?utf-8?B?NFZ1TW5aOXJwU24zeEJRNFhuK0NoY3daTXQrYXBqMjJ3VkdXNkcyK2tIMGVY?=
 =?utf-8?B?MGFBUDBOOHhiU0tJSFpLSkY4b3ZlanJHSytKYzJKQ29idklPYzVHMjU2a2Vn?=
 =?utf-8?B?UHJGWFVZRlFHRmZ6TlAxMWI5Mmg3V0JCZ2M0Y0FrU2JIN3ZQWlBDOVcyWENO?=
 =?utf-8?B?SFJmcVpZOHdRVkJvTTk5TjlPREpIZnRJN1UvN2h3N0crUWhKcFlGOVp0RGJD?=
 =?utf-8?B?VXgwMm0xdWs4UElIOWhLKzVLVVVtTTNWRUJ0OHNuYTQrblZlVy9tUzAxdDF4?=
 =?utf-8?B?UmpUeGhXd1M5Um1CSVpkWVcyZFZJS0VXYnV1TndUNEk0SEFMSVBNRHF6cjV0?=
 =?utf-8?B?NHJjdU1zNllTcm9DM0NlcllnTkJaSG5VbCtEVnpKa1YreDhWb3JaK2dTclpS?=
 =?utf-8?B?d3RDMjcrb1FyOWJINEN2Wjd4NFRqaERnWlIvNHBzZHE0dWdnNnNRVWlsSFhT?=
 =?utf-8?B?elZZODFGMEpyeGVmOW9RUnhvRmYrR2hIbUNpelJZU2pNS3lnVGR3NFJpV1kv?=
 =?utf-8?B?Y1AySW1jMUlKL2tlS1AyTWYyZk5qZmJVZ29XQmIrWGdBSUNxdVFseGY4Y1lR?=
 =?utf-8?B?akZrWWswVEs3TTZwL2J3SzVhUzdaaW9lVTlENEdFT09HQzBPVGw3dFhqOE8x?=
 =?utf-8?B?ZmFQdnRSNG5YajVYdTlBQXFvWkhDZmVkV1ZLVng2YklNZFRjTlV4Q1prZmY1?=
 =?utf-8?B?SEt3M0t1RGd6amE1ZFZpaGdxclNoSk1nQ2xVeXhWaGlTcjJlVWpTOEdONUpQ?=
 =?utf-8?B?dkZSdEtGem4wYU4rWWtJL25hR3NJMEFhNGYwZDNxUUJMcG1ObXhsOW1xUlYw?=
 =?utf-8?B?Q1drU1BUTnZ2TXFVUWZlZHA5S24yZDIzQmZ3R21idDQ5NzByR3gwd284QmpX?=
 =?utf-8?B?MnlMVStPcjR5TWF3REMzdXErYXhPOTFjOFRpaVpMc0lRcmVoM3Y1Ly9rTXZ3?=
 =?utf-8?B?dlNCOHJieWFZM3VIZEN3L1VPWTkrS2d2Q0EwUXNiL3NhamdzT3dnbUY3eVFX?=
 =?utf-8?B?UHFLaHg5S1kxdC9WUVJhSmFad1ZyTmh4WGRRZWF3RTdtbzVQMDloQ0I4OW1l?=
 =?utf-8?B?em9OOGQ1V3NXRTBYT0NSNVp2WWJwakxiZFp1WkJQdStGdjFlSG1QdlFNbWRv?=
 =?utf-8?B?bXRrbHhPVFdEL0dhV0dKaGZacEVXWHF5QUZrY3Q1VERldTIyOU13anNjZzJH?=
 =?utf-8?B?UHcyUzk3RXpJcmE5SHNkaDRTRWk1Z3ljdFBtOHYvVFFMN0pDRUZmZkZIbDlF?=
 =?utf-8?Q?6ufvu2z0XUjKxVOTHhbCieU=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dbbe5ec6-be71-48bf-68c3-08da85c98dd6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 12:09:54.2155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ae0WaOo8hGQwMks3GSRrjsw/V7shrytP8Q+cIs2lqEVTnAy48L72JY8BbRj7tGY8naCjg9v7i3xh0wZrNmrrdIF6jvSG4J8ivz5UQQK4F/zXrQiBcxhlJ548GxfYGQiH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6318
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 12:10:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169809

Hi all,

On 8/24/22 11:51, Luca Ceresoli via lists.openembedded.org wrote:
> Hello Markus,
> 
> On Wed, 24 Aug 2022 10:56:54 +0200
> "Markus Volk" <f_l_k@t-online.de> wrote:
> 
>> Hello Luca,
>>
>> Am Mi, 24. Aug 2022 um 10:54:40 +0200 schrieb Luca Ceresoli
>> <luca.ceresoli@bootlin.com>:
>>> I would think iwd should be an rdepends, not an rrecommends. Any reson
>>> for that? Or is it just an unintended extra ','?
>>
>> Only reason for this was the fact, that iwd is not in oe-core so it
>> felt wrong somehow to set it RDEPEND
> 
> I see, that's fine, but I wonder whether this should be clarified in a
> comment. I'll be taking the patch for testing as is anyway.
> 

IIRC the policy is to have a default configuration working. It is fine 
to have PACKAGECONFIG options with dependencies on recipes/packages not 
in the same layer.

Here, if someone builds with NO_RECOMMENDATIONS to have a minimal setup 
but have iwd as WIRELESS_DAEMON, connman won't work because the package 
won't be added to the image, it'll be a bit harder to debug than a build 
failing because iwd recipe could not be found (especially since I also 
didn't notice the additional comma).

Cheers,
Quentin


Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA16C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 09:43:46 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.78])
 by mx.groups.io with SMTP id smtpd.web08.8262.1647510217336928024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 02:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=WuvfACJs;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.78,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EU+eMy3pOhCUG5+jfLpmycQzFoeppc6apKI+thgPMCW0Vc5cEuTGSo+VfDySgEWH5gF1038rBpNzY7oTg1vY0s38l3lRwtl4/wt2Vs/oErT2TkMM5Zs8b9831nR3zB1vFgYtOR+iqR1siJYO2W5hdCQk1dtv3ySaOrINihRIg+JKs58nyCkZvK0dLJXampKht521qvwS9xfCHQPN916EUNUtgXGNXVGTGcP8CqHizL2ihoFG2G6k/2bbAYoZMRZOD2EOXDOq7KSFWMGDIgeA31K7VQi4aTiWrVszU1rjXT4Aia2EWrNFQtV8ClxzznGKIgpcVOVQt4swiALWz+AyaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4Y+vd8x9Xz79JUygv8N8a/kaB6wYKUvhStEpVWVIxo=;
 b=UaFZ2A/TXlXNhZB2exC/REWe2FTzdnYayjwGl5sZPAKcEIUnn/ikYQ48RD7hyahqJTXPkVEAqM3k98sVca34b7a/0yiNk5ppdha+r7xSVJZuz52Sijtv4gUo/o4lgi28vQZK2vbsxoye2L2wye98+LNIiQ48LrC+NocyN1bF6R8tYpcoygPaP5iQmUcFZR8JFooQx9Q1C61ajyCVVGBbXwSYkjrtrijq+Xn75yWHn1abeMqqStNoQCSopW1OJ6A9IOQPlUqgUzBkTH+fY/W8xx9xlYy9XCB3PTpUR7EpJoBbnMy2gNgs9+DWRApq0zxizEcZCGY6bIafEkbocRV/9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4Y+vd8x9Xz79JUygv8N8a/kaB6wYKUvhStEpVWVIxo=;
 b=WuvfACJsRzLFzWV6MffajzlEwTZt7jc1hntEXDKC4F1B61cnKAODh8khotoi7bEdP+pxhL1kzgDX9pcwUaVbuld74T2/MIApPpKp1suqYCmUdtpmdVrdE6U2y53efl4mpKL1CxQk4Fa7A2AHAFJ7mMZzENaCpxmLPqRopkemy8k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by PA4PR04MB7645.eurprd04.prod.outlook.com (2603:10a6:102:eb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 17 Mar
 2022 09:43:33 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391%6]) with mapi id 15.20.5081.016; Thu, 17 Mar 2022
 09:43:33 +0000
Message-ID: <047880ea-a2dc-7778-3101-a3c887715513@theobroma-systems.com>
Date: Thu, 17 Mar 2022 10:43:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [OE-core] Patches sent to mailing lists: "From" attribute
 modified
Content-Language: en-US
To: michael.opdenacker@bootlin.com,
 OE-core <openembedded-core@lists.openembedded.org>
References: <16DCF6055FEB6DC7.29979@lists.openembedded.org>
 <d54721ab-03a8-9c80-0445-17c7d76d6570@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <d54721ab-03a8-9c80-0445-17c7d76d6570@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0075.eurprd04.prod.outlook.com
 (2603:10a6:802:2::46) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ccc5c13b-da46-4d25-c1e3-08da07fa99e7
X-MS-TrafficTypeDiagnostic: PA4PR04MB7645:EE_
X-Microsoft-Antispam-PRVS: 
	<PA4PR04MB764521B4CE3DD27C5ADDB7F9C2129@PA4PR04MB7645.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Yh/i1QhvQ9hBWM9N6Uoso56A0fcO4sBC1TOYJjDr5jNan5XyP6MsTGxpOuMdo13rOg2tDZSO5ua7JzqdBKq3sNvs44iGLvXJKFwYSBRplFsUh/GqlqZYkLEcC/kWXPjKV6Z+vjh+QI7DZG+6a508PXTzyzBL5PVYcoW75Ex+9e8qwk75z6Fw9GrLyD6CkrENuO1IkrFdYkmj4q1L55d7zrDYGDDYvcP+ZuZXWtz7RtLQ4iyXmzYJg/n5IwwEmBpsyTHHYUpWTE8rUKjRCaWff7cG8cmOuCPwNmyysuv0td8Lt8L9T9llOMjancltrbymkw7TVG4M0e4hEU1ipTjSMKq7yWids4gUZ1nUPG5LY2qg5bY244uP27HusV7DGKS3UEp8XVbLAryi3Vf97wdYViptUq6Pa7+hLTcBPpS2GanPjN9SOzW4qvT63oSe1uETgP5qzsI2xYSVwslO6VSfLbv9ajaGWgAtmTJHZu84TqNAvwmh0Sf00dHr2K1bGD8XDbdT0Yekv+j0wIaeXZNyXdoojOVjq5yrDsXarpKzwbnlwPK9i/RvLRJdu5/byGhy1DnIWlxhti4NvXLHa07nCX5bYJv8xi1vHLEbm26TnyCc/GCjHSlJPwy7oVMfQzv2yxANLRazOPm4czjjG4Q0EUKR/wSaYXAQHGqXunzpedZhGNmXyNpRRJV813vgLQ7ZM1akhfpNjW4dFgu1lvpQg7L+/tW7Kxho8oUqreG0xVd/aUHGgrWZP00YbFSRQaEdg5S26aToXp3e2RhqcIr+7U3g2IMcIHUBSUyz+5QA9o3CXujkGCDS7oNAMjgo3PFbIoGcW2bgZltMzcNYpShY59u/8GB9zHGPaYVYRxdkkKs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(2906002)(316002)(186003)(2616005)(6916009)(38100700002)(31696002)(86362001)(31686004)(5660300002)(6486002)(966005)(36756003)(8936002)(66556008)(66476007)(66946007)(8676002)(508600001)(53546011)(6506007)(6512007)(44832011)(130980200001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZXcxZlIwNWpyZmR6Sy9ma0J6dlRhRmpiOXNBTlBTZ0JycXJPeWFrbk4vNTJZ?=
 =?utf-8?B?R2hLckNaQlIxVy9XYTdSdEd3UXJoSjh2aFRpVGFzQzBMTDU5N254aUJoUHFJ?=
 =?utf-8?B?M1MxcWV0VzNKU0dpVDMyYVh1bGQwdG9nV2gremx6VTRPQ01mak1TRVJJanlj?=
 =?utf-8?B?WndvRDZxZm85clJ1Qlo3Y3RPN3ZrZWNaMVRXcFZkLzNpQURGU2MyRFk0YVhu?=
 =?utf-8?B?aWJXSUhrTUhIK3hZeklxTWx1S2NPVnlFdXI4Ui8wSVdOejd3ZkgxS2FtSHZw?=
 =?utf-8?B?R3QzeUtVTlpycVc3L3JnY0xTS3NNM2ZXSEV0MVNwenc4S0RlT1lSZy93Nlh2?=
 =?utf-8?B?VDk2RjUzMTlwbXYyZ3V4MXQvaEo2SzZxcVdrbmhrTWRxNTBUM2xLVjArMUhO?=
 =?utf-8?B?VkVPendkbzM4UFFrRmdkQURoNXU0V2EydTZkRWlTN2lBOXVkNTlwVTFHam9p?=
 =?utf-8?B?aDNvRy9PNk1oZllUaUVxSS81ZTFNZVplZnhaSUQ3Z3JFM29SV2p6TFRuRnZt?=
 =?utf-8?B?QW43TlBCbVZwN0RvTjRPSHh4V29haWY1ZzRjZlExckgrTkc3VjFNMi9aM09D?=
 =?utf-8?B?dVpHVVlQbkNEbTljMkVTeUVwZTJ0NWRBVmJMalBhby82bEdTcGpEU3RvRlV6?=
 =?utf-8?B?NlhZWnU4a2FEeTNGMDJNZ1NqdnNYQXk3SmsyOVhUa29HL1MzM3Vld1MrTjBl?=
 =?utf-8?B?bUNNdGY3T3R5bzl1blc2OHJmZkpWWlQ1UkFkMkhOTmhpbzRCekVFZTZVT0lo?=
 =?utf-8?B?d2FwLzVQMDFQL0lhZXQ5R1RkVEtsV2pkNGg3N25pMndXWDJFc1YxV0hGYVN4?=
 =?utf-8?B?Mlp4WkczSjNTMVNGSmpTdEo4bHBPemFvZm9zd0dOYzhMOTdWdFp4TmZQS01k?=
 =?utf-8?B?VVQrM0RwdGtoQWdQaVVKWjJWeTdmemlsQ0ZON2M1ajFjemJteFRDZWQ1VFlt?=
 =?utf-8?B?MGNXRjloSWZHVE0vcjVmLzBNT0xEWWIzU243eDVaZ1NGVmw2UHVqUmt2NzRQ?=
 =?utf-8?B?RTRzeWNwcTMrVFkvZm5nS2NVaWJ5L2MvNks0eFg1MDNvUHVVRlFiUjg1RFhF?=
 =?utf-8?B?eTRLQ0hndHBpZUpsa1FsYnE2YkJxQTJ4TFZRVnA1bllDQ0dORktySDVVbWN3?=
 =?utf-8?B?SFV6c0htcDJibVU0OXI0dEhKblJiS3hkVUhicU51aDhxOTlTWnA3bndGc2lR?=
 =?utf-8?B?OG1GOWFHUUVWd0RiSlhwNEVNeHdPOVp4d0FiaGJtWjZOQ1g3eDNCRmdJb1hn?=
 =?utf-8?B?ak5PYnFLWkNrM2NZblBPbmtYK2xzTlU2N0MxL3h4NlljMDVReUp4UmJLQ0J2?=
 =?utf-8?B?YkRIbitJY0U0c1RMQVZRZkJBSUs4SlFqbnZKb3BKOWJiVjlTMHo0TkIweEVw?=
 =?utf-8?B?UFd0NlhuMXZ5U1pZdW1EUzZPakI0aGl5NmkxTTVtTjhWS3hsTURuRmtQWXgx?=
 =?utf-8?B?YzVBMlBUVHQvUjQwZGwxaS94d0dJQXI3ajliVDAwRkRjQTZaSEhGQ3NoQW1V?=
 =?utf-8?B?YS9BQTNjWlJGUktBR2FCVEZCeFltRUNxYWFuSGhRUXlkZytJNW92T3ZIWUNt?=
 =?utf-8?B?cTloTFBlWmNybUdPd3M5amV6TjUrTHhqVG5GSnlXMDE3SUtnNzJPdkhXNHEz?=
 =?utf-8?B?ZWpWVFg1YnVRVW5mTEcrRjJ0U3labDJqSWlocklncVlOYUdnZk1Ca0JsL1VN?=
 =?utf-8?B?UVU3NHQ2VDNGdXBGQ3Iyem5Eb0craGNiTTEveDU4TkdKbnhCS0lTS01BemdF?=
 =?utf-8?B?RWJuZGpveWVjc2x3WnpKZTJrZUlJVFZiMlJwVTBHZFp3NFVuRkV4U1hrRVRQ?=
 =?utf-8?B?YkI0ejlJNS9GUWJPeHZXMDlZR29LNGZZNFAxM0duYS9QVWtlUWp0R2RsWkhZ?=
 =?utf-8?B?ZGE1R1dyZXFibUR3a0g5TUJvVC9XdEFkUW12OWtGUW9oMTd3SzZzMVBJdjJm?=
 =?utf-8?B?am0zMHVjYUY0NXNRTUY4dVVDTlRRU3FvdjVVamU0NE1WQnFOQnFxWU41TGlj?=
 =?utf-8?B?d2xVTnJYa01RSDJGZWg0TVhpd3hjbzJTVW9odHJYemgrUnNsb2V0bXVLMlY4?=
 =?utf-8?B?SkUvSGY1UytDckhIZkdGSlg2UEtiOG1SVGJuZz09?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ccc5c13b-da46-4d25-c1e3-08da07fa99e7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 09:43:33.2760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RT/JGkdWFevoOUAQ++tDf5RIClD/Phcg72lHEerFHpGMiqe/wvKW1+ueClLMCUZyiRq23l9o2ZO2K4zoP4C6HPWHxSRi3diC7SB/SHBnESP9pb6z2GS5cWn08jLy97su
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7645
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 09:43:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163379

Hi Michael,

On 3/17/22 10:35, Michael Opdenacker via lists.openembedded.org wrote:
> 
> On 3/16/22 21:21, Michael Opdenacker via lists.openembedded.org wrote:
>> Greetings,
>>
>> My patches sent to the mailing lists are causing trouble for Richard.
>>
>> The reason is the "From" field is modified by the mailing list server. It's
>> From: "Michael Opdenacker via lists.yoctoproject.org"
>> <michael.opdenacker=bootlin.com@lists.yoctoproject.org>
>> instead of
>>  From : Michael Opdenacker <michael.opdenacker@bootlin.com"
>> in my original patch.
>>
>> And then when you try to apply the patch with "git am", you get a
>> modified committer name. This makes it harder for Richard to apply
>> patches, otherwise you get commits such as:
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__git.yoctoproject.org_poky_log_-3Fqt-3Dauthor-26q-3Dvia&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=AI6b75ihH3xBTnGsJf1p6Fk4ycTpByxqngp1ZhojT9rZ1xuLEsKCg2huL2l9DoRV&s=BWM5kPiChvtcTWQASNpxXSwDK1hcT3MEW1rhDPfcNtM&e=
>>
>> If I understood correctly, the problem happens because we had to enable
>> DMARC on our domain (bootlin.com), because of a storm of spam messages
>> claiming to come from our domain. Otherwise our legitimate e-mails were
>> getting blocked by Google Mail.
>>
>> Richard recalls that someone once found a workaround for this issue. Did
>> any of you ever face this?
> 
> 
> The problem seems to originate from the behavior of "git am"... As its
> manual says (https://urldefense.proofpoint.com/v2/url?u=https-3A__git-2Dscm.com_docs_git-2Dam&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=AI6b75ihH3xBTnGsJf1p6Fk4ycTpByxqngp1ZhojT9rZ1xuLEsKCg2huL2l9DoRV&s=hTmUlxaJ49ljTkpvEGIJbGeKpfayoSbuOdB_mOttSnU&e= ):
> 
> "The commit author name is taken from the "From: " line of the message"
> 
> ... and there seems to be no way to override this behavior.
> 

Maybe there's something you can do to configure git send-email to add your

From: Michael Opdenacker <michael.opdenacker@bootlin.com"

at the top of the mail. See my patches on the ML to see what I mean 
exactly but that should make it nicer to maintainers because this From 
will be used and not the one from the mailbox's from field.

FWIW, I did nothing in the configuration of git to have this, it's just 
that it probably detects that the sendemail.from config is different 
from the commit author mail address and adds it.

Cheers,
Quentin


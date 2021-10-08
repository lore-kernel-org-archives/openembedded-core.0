Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D37D8C433EF
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 06:41:48 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.41])
 by mx.groups.io with SMTP id smtpd.web09.5655.1633675305533704109
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 23:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=OZJJnMAF;
 spf=pass (domain: weidmueller.com, ip: 40.107.13.41,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7ZA3GeyBhVHwDL7t+OxC6w4SgM/I/KkIdk96Nwqak44Fe9En2sficED6ZgjftnpYxxTx40IaMhRpJSGNfv4Hd9W0y1tRNQZ2nyb6gsQgeeqfaS/jvNa/RSnFk6SDs/lfF71E9l6eKsYAWbDecGW29a3EB23OHcjnahAnm/bUcmKuIHBo523HBKKX4KNjDxBvweoNNJJT2c3RAO9lU5mrvnR2OpJSST9xat4guUvq3OCyiISf/b+JnacxTnGtpkNcbR8Iy587UDlvpCnIWO/tu74IqRJspP1ZE5fzwG6whlAZFYJ/GlVWcThHiCuBEqeLczayMinHenGIZ7tINNsuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hM8+N/MQWf3nOWvOSGHK3HJX5VwleepHx+VqJcMKgH0=;
 b=YI/9NkcDsZbv0FFYTNpQvrck90AXclf3w+IJy8QKLTvP0VzL4VTFip6hzUXkSqHNuC4BtSt8MH4OTXOmqdgBS9UsXHyB5KT4GuXfBBgf9ib5rgh3T7gZagKxQhrSsA1knENMH3IU7IbSKhWwLVWB70AoxlCGo9iNi5q6D+2Eyb4ofjvlvaLCjUCpPtEcmayu4s4wNJ1a6Y76Jh9OcdIj+3PfYVQna3VaEZh/IJD41dutQ+piZBnHqD4oP/2G38u206JF/6ocVm+9XfMarcO1rRVzpKdw3H8JKmPMSNCglSM8Icf9EU4CS+Ou3ZqbJG0biYgTnPZwQCuIICGBpr10lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hM8+N/MQWf3nOWvOSGHK3HJX5VwleepHx+VqJcMKgH0=;
 b=OZJJnMAFMelOheEqqqdwHtzJ6aIw1GCiycg2VCMyUvsG73+S3cL0pIJwOXLid3CoUehYyJ0tkDI9OL7xMPfyqWCJrmP1TJSgAvv6nfQlcgiyEr0rdvmgyDsmXaxg8/haLLe+SdGJe7XBfSOUJMBBx2uxWaqtkNrjQnq301EcJzA=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6862.eurprd08.prod.outlook.com (2603:10a6:102:136::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Fri, 8 Oct
 2021 06:41:42 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 06:41:42 +0000
Subject: Re: [OE-core] Improve npm support to run build scripts
To: Tim Orling <ticotimo@gmail.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Konrad Weihmann <kweihmann@outlook.com>,
 OE-core <openembedded-core@lists.openembedded.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <37b61ef2-5ea9-7e90-75fe-50cc662d9124@weidmueller.com>
 <6318d76222b819d3a165d405fc48dbcbadf29085.camel@linuxfoundation.org>
 <50d4d79f-a7cd-fd0a-0c6d-597b6dc4ca6a@weidmueller.com>
 <CANNYZj8Fns4xWre3_ajv-5QADpCi0f+WS2wRXCKXezOgj5fhzg@mail.gmail.com>
 <0bddcbc4-cf11-39da-5797-131fc59d7f6f@weidmueller.com>
 <CANNYZj_Xudaobe6W2TTnugjovq3KcHWBYsvZ8kS0kYZaWwkLCw@mail.gmail.com>
 <AM9PR09MB464243B2852B92E67D825612A8AF9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <71df6b93-bdcc-b09f-48c7-3ec822ef3228@weidmueller.com>
 <AM9PR09MB4642A8B32B686649507B9406A8B09@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CANNYZj9eeW4+uJ=-fB1pDZq4Qa0EbgwRCCXXiEjrzuGL-jcq3w@mail.gmail.com>
 <CANx9H-DK-OP=GiRkzhb6EEmdJF64p9jS8caYAiAuwLw+tmgNng@mail.gmail.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Message-ID: <d02d9069-d313-ddc4-51f7-fe62806dbbab@weidmueller.com>
Date: Fri, 8 Oct 2021 08:41:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <CANx9H-DK-OP=GiRkzhb6EEmdJF64p9jS8caYAiAuwLw+tmgNng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0053.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::30) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from [192.168.178.36] (94.134.181.155) by
 AM6P192CA0053.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::30) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Fri, 8 Oct 2021 06:41:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de61da6d-bc94-4f33-5990-08d98a26b03d
X-MS-TrafficTypeDiagnostic: PAXPR08MB6862:
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB686233E6ED8EBCD5628D3DF4D7B29@PAXPR08MB6862.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	g8dhj8zUSOKOZGJSXylzucm9PGT+ENeZdwREyrJfzrWrvQSuaHI/ZAf0dSonXfebGYa3WDcMKRzkaGnWKcCu3P/UZtU4xTufyH8r6dAD+M4OKT+EjRL2FRofrNg52B2Bm75xfBufr0Fku8J30iN946aan1c2+d/+qW/FWk8j9VsL6fM3u/QCYBNmRXiwyY7b7OIE8cBv4uZRaoHkOAAn5KfykxVdyfdAoiaYZoGq47/zjCposBbtOiUO8uhUbJgjAGmTyDTTg+erBq07x8oI1mt74xVmqaNqLnmXXSunp+HS9HD8/rCm3gFbl6sq6aJORam2eft/3Hc8KJCf/pCcBcCLz29RaSWo6opRPew0nBkXdSZrxgCi2QZCuFVofjDSKQAeMTVtv4RuNrEvv8/h/+mZtq8ggdZrATFIGN2pmwSxJd7meix0jzR9NpNaRj2Nw+4xhLmlPTK0t9SvpCrj/iLaUXwq99XzyA0jJNgvndcNmNuSh58RHhZUh6Y5diUjQaiu2tuJhHGPjv3koB8dkYWK0oC/LlgjiqQoLdTG6st8lap4+8eCXt8eC1hxE3p0GC8skk9jDBuhv95SzeI/i/l5P53jiL0BBZPHuXVrDOzomapAGjyMf4CYmiMgbxMJg3oUPvrNXYLFq31wun4Ommykpli85j22A1E/iV6Wv++vAGxVspDLka1iRnggeozBJAPp6f97RWYy6NDM7VrDVXBgty49GdmlxZLaDum5pkX1RodWKNNZt0HnpuayQQfSc9eOCkZW8gHc2gwGglP7wA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(38100700002)(26005)(316002)(52116002)(5660300002)(83380400001)(8676002)(2616005)(4744005)(8936002)(54906003)(956004)(2906002)(6486002)(186003)(86362001)(508600001)(36756003)(110136005)(31696002)(66946007)(4326008)(66556008)(66476007)(16576012)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MFFCSEszVnZoYVBBL3RzN25Xd2xwRmxIc200WEdaalViTU5BcG1IZkZ1UmpI?=
 =?utf-8?B?Y09LcFFUSzV0WGcwUC9Kc2hxam5mQ3ZwZXBmTE9jT1M1b015R0FLOXdPVUlk?=
 =?utf-8?B?cFNraEg0Mi9EM2pTZnlrL3dnbHlsNzJ3U09naFdFWDdUZVl5eUtZY0doM3lR?=
 =?utf-8?B?eFBJdmF1emI5ZFFuSWpBWFBEWitDYWxxeHRtUFB0aG55ZTRRb29BaEIyNkZG?=
 =?utf-8?B?TVdpQlA0Y3pMNk1jMjZoU1FWT080MHo0S0t6eWJ4Y1NoRlR5bEdjbXEvWHBZ?=
 =?utf-8?B?UHpacFdxNTA4MHByT0tjc1JjY1ZtN2NkTTc0NkFCR01FSjVhb0RUUFFodmNu?=
 =?utf-8?B?TkFjZ3g1SWNyT0wrWHN2TmFBbUtTSlhiOURXWDNmbmdTSFU1bUluZ2dabmNi?=
 =?utf-8?B?UzRpR3BMWTVkTU5KZzBOWnBwRXU1Z1Rrd01Wbld6MUZwUTEvVTJ4L1BURC9V?=
 =?utf-8?B?MEhFc0hSbStCcktsWTdZRkwvOEVRK0hocTdnMHFXS3dsRHdlVGowdnBOWExR?=
 =?utf-8?B?R1I0MlA3RGZBcXhha2lSVUNzWm51TWY5bGZKd1NrM2xHdzVBSytxS1VOaXdp?=
 =?utf-8?B?MGo0THJPQmN1enMrcTIzTVdSanBqZ3RQMUc2cU00aUVWZjR4QXk0a3VzUFpW?=
 =?utf-8?B?Q0tlbWJnTUNTRnFMVENUajUzWlQvVTloUG1XVFgwMk5IbVRaQldiT3pDSVNj?=
 =?utf-8?B?T3RrRW5zMDdhTmlpUmxjZittVXBWQnM3emdCeUplMHJFdThsYlliVk0ydTV1?=
 =?utf-8?B?QzhSNnN1YWNYYTRhVVFQSTFIZlRTSndJL1JXeHUwdjhac3lrTE55MGpRaks2?=
 =?utf-8?B?Z0lXejZmY09lU2Jta2ZjcWJWTmpRSHJmR0Fwb2w0U2hmMjc4UHBZOVo4dWZj?=
 =?utf-8?B?VlBaKzJhOHFyMmh3MmxxQ1VuNzNDK2JNZkgrSkVVTGdwNEVwcGNJeFh3TW9L?=
 =?utf-8?B?aDl2THdpZm9hWDZMdE5CYXFab1ZmVE0ybGRyWGJBV0lRL1FQWjNPeHl2ZmR3?=
 =?utf-8?B?VEpmTmtaWUxQSUE5cjZlZTZndVhGQWs3Rm1sRnVsWXI1MFgvZWlvUlpvN1hL?=
 =?utf-8?B?S3VYMmtVSlZIR0d0c1JZeTRrcUxDaGJ5SEk1ZnhlM3FtcHlCdmFaODNJY0tx?=
 =?utf-8?B?YXZwZk9zNnJhTWRDUVJOdFpOR2xjS2tsWGlBZVNhbVhFbzNvbEdNUkF2V21M?=
 =?utf-8?B?NGZSSDN6UkxIWHFJT0RPVGkzMEhvN2VJQ2FkdGllVmxDZGVWVEMwQkUrRXlG?=
 =?utf-8?B?bGFocUFGTUNSeFJ4WVVtYWw1QU5KVGorS0tibnFWanRuandnTmViYW1TMjRa?=
 =?utf-8?B?bC9OMnZBUGQrbEE5UzB1U3pOWE1QWi9EWUVVWG1zZ0pxcGh4c0xJUUErSy91?=
 =?utf-8?B?eVIwc2pweEZhNFFFUnVRTjJpU1pibWt3UzBJbm0wblBINDlqbkpOYWdoSFdj?=
 =?utf-8?B?NCtTOWU5aWFNSzJtcWNuMDFqTVFoRjl3cmpadVQ5MlBDb21jQ21hdVlTT29P?=
 =?utf-8?B?Sm8zbUtyYXl6UFBVeU9TTTRUWlRWSUJMNmprajlOb1hUcERBTU50NVFmUDVK?=
 =?utf-8?B?S0YvQnBXNkRqMUlyRzBDL0ZBV082bFh5dnl6aXg1K2MwWk04Q0ZrcERITzVH?=
 =?utf-8?B?UVU5cTVUbm1sRUNhcThScGRDSHZRSlR5NWZJMU5ZT2RHK041SDg2V1BPT3p2?=
 =?utf-8?B?VjlrQ0xZQTBybjVnWEVvZ0ZTcXhpUXJVZWpISS9ocEsyeEhMRC84QnA5SCt5?=
 =?utf-8?Q?nHAWdc0uVw2KT7gT1Zgy8Ef75TIvOWikOPZXksy?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 de61da6d-bc94-4f33-5990-08d98a26b03d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 06:41:42.0752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5wmdq6uvuNU6NNlHel4SGkxUZL3komOm2fYqi4ImP0bJ+rkNuCkdW2WW/GTcK9FSjORxHJcrgcR9mjvUsjHWYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6862
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 06:41:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156744

Hi Tim,

Am 08.10.2021 um 07:27 schrieb Tim Orling:
> We have discussed the severe impact on parsing time with 100k recipes. I 
> personally worked on a node.js project with that many dependencies (but 
> not an OE/Yocto deployment). Parsing time is already a pain point for 
> 1000s of recipes.

How do you track the version updates, check the CVE status and track the 
licenses?

How do you update a package inside the dependency tree?

Regards
   Stefan


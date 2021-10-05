Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA6BC433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Oct 2021 17:44:34 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.74])
 by mx.groups.io with SMTP id smtpd.web11.41.1633455871683756083
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 10:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=PLUmM7Xw;
 spf=pass (domain: weidmueller.com, ip: 40.107.21.74,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/mdTABZyeoGMaH23VvYOFhvVkfC2FFPZc982wtwStT6dSapoBuK1HtP+PGLe6Jb6jYog0jvGIkMTFuN2gSijLTMSde3hbIHOmjNL3NLSjn1pY8DBtAzVdcdqDxJoxGm2ID36lCKDIxDeSM7RK09NDexphPzdHdAmWWnQjMCObNDkWJxKrD1EbIGC0ab2pBC2uXdEzHT4xHmFSrPSl2zmEdbU6OWdK38hmYB68++Ml2TXjIoThV6cBj6/YXN8Xl+UzPWMqG9bSefnaqQwb00+haO5FnXI/F1tepwedws3KMH7HPRYRDTpl9s6frAT7TJJm++1zs4pl1d/QC1qiZi2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1t2Qffk/dKGPtTnDfsV/Kn7JAuZd2NOtruaoyYWwZo=;
 b=k786aiHvyDx4LTjiW7HoJNwff5hCBTs+Lu6oQmoxbuAf+rk/O1o2MwAbTOCmlDrt8GyOM7c6yoCjbfyBQm+SRttMpn5nQ10vP3qmMKISUnIyqYeHJBmMcKb+X0PsvXPAYqwuIlvQWV4QofGc5gaQ4nVeHnXW0Omg2qk8HgsXMGyLDGhhGThb7WfGkSXcKZloprtzctK/YP1iEPw/o+vJCatPr7rqY+CbXzn/ZC5Mv4RC8oJrm2ovxIgOBkzoOPxnHx4h3PQOpmGyPFxffTwcTfCKs7gAv8fz1Q5d7Znr4vl1HSD2cFdXL7AiamB4VPHCPvflFDskpX7qbl0tcOE1/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1t2Qffk/dKGPtTnDfsV/Kn7JAuZd2NOtruaoyYWwZo=;
 b=PLUmM7XwUtsJAUHU3nxboezEsNmxaNd85phwUXyz3R0DX1jWuNbd0PbfYmTsKPfed/yO6rxhjanX0jCjJE7cfbQlX1UFTRzOr+OIDSP1vJqD12mVtW3LYTplXrGzLS6hWWGOmXVAeOSFKdN/njkC0VpkdQjPh+t0x6K/ycQa5cc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PA4PR08MB6192.eurprd08.prod.outlook.com (2603:10a6:102:ea::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Tue, 5 Oct
 2021 17:44:28 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%4]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 17:44:28 +0000
Subject: Re: [OE-core] Improve npm support to run build scripts
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <37b61ef2-5ea9-7e90-75fe-50cc662d9124@weidmueller.com>
 <6318d76222b819d3a165d405fc48dbcbadf29085.camel@linuxfoundation.org>
 <50d4d79f-a7cd-fd0a-0c6d-597b6dc4ca6a@weidmueller.com>
 <CANNYZj8Fns4xWre3_ajv-5QADpCi0f+WS2wRXCKXezOgj5fhzg@mail.gmail.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Message-ID: <0bddcbc4-cf11-39da-5797-131fc59d7f6f@weidmueller.com>
Date: Tue, 5 Oct 2021 19:44:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <CANNYZj8Fns4xWre3_ajv-5QADpCi0f+WS2wRXCKXezOgj5fhzg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0083.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::28) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from [192.168.178.36] (94.134.181.240) by
 AS8PR04CA0083.eurprd04.prod.outlook.com (2603:10a6:20b:313::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Tue, 5 Oct 2021 17:44:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10bc2e0f-7a17-4805-8800-08d98827c767
X-MS-TrafficTypeDiagnostic: PA4PR08MB6192:
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB61928703F217FE3DDFA4E837D7AF9@PA4PR08MB6192.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	h4Rxku/uSQjqAAAVx0xXd2Rn8nT77XsZ9rBlCuGsUaFF29eFsVlT/c1Jwp5oJ6af2zYurqZ3/w6z8b8B7BFFsXlaFO0UMNMFV/GOYpzsnANkR9cPcK46pjtaelSZ7vSZLCoTK3XSKJi2z4WFntlqp6PuwkIjNX2oT0uy+UxCE6nzLkEjiSORlsQqwGA3q1sT8VTup2Kr/NAhJjLRXVkNyqEt4X+IFCiHxXqNiTHP6KQdRORbSV4WuQ1gWKMo2zT/5LUbOQV/oRMy1reLShHqRaSFTZX8Fl09T1YlHR4cyBFBZkD96eKBbrpTwwma2rqrT5ESXDRl7AdtcLcIXvFPjn93pw68wLSvWY1O/2dCIGZxLz5SgsoqaERVquTj/bIEE6pcBjJTx2PcbWIg677JoRp09Hnbt93+7GRLgCxjV6mNTXTeEvk6gx0II6Vs72kITTpxpVqZ5VAoTwO9VpbtIvw7SKSUsDmlxrpuaFGFkY7/eK3rkG7zqRb5cUbLTYya2qlhrZoPxupeo7/Gn3o7K1tQJg/FgK1ThvA/MC8u8630kl6VfPT0g9UCF17KC6J9JKneBjySCgWPPc5BvPn8moD9srVRdjhJ+B0SIEKx/m9I69hjZJtNCknSIzrm7I4ya8OxeUX8x3bwBVRNR3cRYIQnhauP4G3LSmbX1hLtaos2JAroo8Xqe+WtvE575f1pID2gtFOcRbyUHZBcywSaWN9mM7kzd/0GURMZ7qvCpZadswSBv8PwK+8iPDCjrKuf5KY4n/RkC3xC77+sQ7p9Nw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(6486002)(5660300002)(8676002)(4326008)(31696002)(26005)(6916009)(36756003)(54906003)(52116002)(38350700002)(2616005)(66556008)(508600001)(956004)(66946007)(316002)(66476007)(31686004)(38100700002)(8936002)(2906002)(86362001)(83380400001)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aExCVVNKYmpzWnlQUTBSMlFnSDFSVnJEMmNiMUc4VmNNWmlvdnA3YnJnSTFP?=
 =?utf-8?B?Q2NGcWUzQVYrOWNVb0tQRHBObGNvTlZSZ2c2L0dXWGd6SnB4eWJHZ2x6ZUxj?=
 =?utf-8?B?TlhzOFhmNUxOM2VaaysySDg4ek9jWDZoSnR0WlcwQy95WEJWNFBaenhUdXY5?=
 =?utf-8?B?NHk1RGpSUENhRUh2MC9KekdIYUdlYWNwamlnNEExcDZqa2RtZXpja0hIUC9T?=
 =?utf-8?B?d0R5bEdjYXlCd0dQdHJOay9BclVqUXh4Y1VSdGNJL1E1OGFoNUZWRlF5ME4w?=
 =?utf-8?B?VnJiVVZnMjB5RFhmU29xenlQU0JMMFdnbCtXdHJSNnNKcjIxSWtuNkJPNVlr?=
 =?utf-8?B?NWlxMnc3MDZraWxQZnMyWWJ3T1RBNWt1NkNvNlNFQjRXdHZETk4vaGQ4QmNC?=
 =?utf-8?B?RDBOS052UEE2eGcwRWw4NUVYazl4RE5jQ1YyaS9Xd0ZtOXZhQW41UG9kUjhQ?=
 =?utf-8?B?K2FIZitkYkI2MWN6TlZSVDF1SWZIZWlNd0RCRVIvVGdhM1dTb2hKTWNTN2cz?=
 =?utf-8?B?ZjUxL0E5TXhNNEo2Wlp0Zms0Q1ZvdnRWY2JSR3VKYkQ3U3d6YStZVllwQmc1?=
 =?utf-8?B?R1VmdHZSTVdYckVrbEFnZFY5S21kUWRxQ2RwUVNtRlp1eXZvZjlwR3RTcHlS?=
 =?utf-8?B?UCtiekxablQ0VlI0bEwvZE92bG9NbXVLR0VJeVlWTW5oaFlNSURTN3NrdTBH?=
 =?utf-8?B?eVdDNVMzUTBKSkNjLzl6YjRsSXkyTFhJWjZyVGpQWE9JRTBpRFl1aUV0ZWll?=
 =?utf-8?B?LzlqQkpXL0RXQzBaZXlOMnR6TmVEK3ZGMEZZUXpzQ1FVNmRmT1dCTXNoelRo?=
 =?utf-8?B?Kzh1RWM3emlTd1NNTnBLbzdSYmpOYkhRRzRuVnh5QmdaNFg4Sm9TdkZlRWdV?=
 =?utf-8?B?enRSSVBYd0ZON3d0Ny9PT2RVSFVRZjFDbGlYQVAzdXVtaHpxN2dHUnZicktT?=
 =?utf-8?B?WVBRdmRsdmlRa0JId2s4eFBrTmwwTDJzQTRIcDFuUURDVWxDc0dqdHMzVDZh?=
 =?utf-8?B?cDN0dGdBWnNCZExVYnFTN3ZUUDcrYkxBSTYweVZURFB2cHhmWVExSmJ2SHNL?=
 =?utf-8?B?NDhadzUxQWVIdnF4dGVKMDlJeUVGd0RkdEU1d0tSajcrVGhLaEhmR09YMVAr?=
 =?utf-8?B?ZGw3Z00waGpTYTBLa1BZRFU3b0xhdS93MlI1MDBvRG9sVDNJcmwvTXVJYzh6?=
 =?utf-8?B?UVVsMi9Od2VaQngwR3Q4L2UyMXliV2ZVSHdEYkxLb3lWbWRINVNPblRPTFRt?=
 =?utf-8?B?SFF5VTU4Skd6UFg3ekoxNnZtR2diNkVZd3pHWUVxblk4QVBZa1dqNE1CdDhG?=
 =?utf-8?B?U3Y5a09OUlZKMGlQK2lnT0dTTmFHTGRodDhwaUdIcHFNQThSUld4UlJCUStC?=
 =?utf-8?B?aU9LbnNiazQrS2lYR1dLZ1hSUTh1S3hoOHVZTWNvNXpPMHJsSVR0V2hvY09y?=
 =?utf-8?B?djJzWE1HbE15U3VCWEc4YlNtOEJLVFhuaG1qYjlHVSsvRUlocEZlelZ5MWt2?=
 =?utf-8?B?dGJ3RENMSEs1NkpSWUNoUlNjdHdXVkFwVnJhVUQxZHNoSGFCWkpyWG5qeFhO?=
 =?utf-8?B?SjRzQ0krelBHOU9WU281akI0VU5mNm9ydGZiTUtWSDVxcUxkQmNsSWZyZ2pV?=
 =?utf-8?B?cXNYckFLVEo5WEJnMVlSWlR6TUtaVy9TR2JMVjJqVTRCeDdobFJIcTVwaURJ?=
 =?utf-8?B?NUpaM0laL1dFdUhITmZoUUQ5aFJWNDRwNGk3SEZYcWY3d2FBMlhnaUpoTDZF?=
 =?utf-8?Q?BeAsRoW8UkcKJuz8aHwbMmQpjNvkzGVl7SAz0ve?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 10bc2e0f-7a17-4805-8800-08d98827c767
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 17:44:28.1304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5frlkp5tycd2AEJTETUltvckGvTCcDyxwGz04fBrirG/VP7W3BOwNf1V5qmDOBJm2LezG4CNELI1TvgiG3kNUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Oct 2021 17:44:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156653

Hi Alex,

Am 05.10.2021 um 15:10 schrieb Alexander Kanavin:
> I think the supposed workflow with the new npm.class was to use 'devtool 
> create' which would run some npm magic to to create a single recipe that 
> has all of the npm-fetched dependencies inside SRC_URI.

There is no magic inside npm. It parse json recipes, calculate a 
dependency tree, download archives, checks the archives, unpack the 
archives and run some commands from the json recipes.

The 'devtool add' create a recipe with over 1000 dependencies. A lot of 
the dependencies have an unknown license. I have improve createtool to 
detect more licenses and fallback to the readme if no license file exist.

The npm class doesn't support run of build scripts. The build of an 
application (ex. angular) need native binaries inside its npm dependencies.

The existing solution have the same problems like embedded dependencies 
in other recipes (ex. multiple version of the same project, unneeded 
dependencies, unforeseeable downloads, pre-builds, on the fly binary 
builds, ...)

You have to fix a bug in different versions of the same project at 
different positions in the dependency tree inside multiple recipes.

The main different between a normal (ex C++) and npm project is that npm 
use many small packages as dependency.

> Have you tried that?

Sure. Otherwise I haven't spot the limitations and work on improvements.

> A layer with thousands of recipes seems totally intractable.

What is your concern? The high number of dependencies or to handle it 
via OE?

We have the high number of dependencies in any case and need to handle 
the proxy/CVE/license problem. Could we reuse OE or should we use 
different software for the same problems?

Regards
   Stefan


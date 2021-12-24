Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F07DFC433F5
	for <webhook@archiver.kernel.org>; Fri, 24 Dec 2021 10:36:31 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.52])
 by mx.groups.io with SMTP id smtpd.web08.44003.1640342190371292128
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Dec 2021 02:36:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=HO+ias1V;
 spf=pass (domain: outlook.com, ip: 40.92.90.52,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYsjxUt63zPudpJ96e5CDg5ydGYY1ck6nu/o+gKThVMidjmqp+H9D0Vnr0crJf3Tizg1Ss7gf/56WiWc28cB3CSwg9R88KZzpiLnU9y/Dsh1qowzGMrjCtO9cPb71fXBh+F4iZAihryQROEx6Iu63+qsmao69VZLR+hXwDxVL7Ro6CMbkHCDJNgJqGIdeWyjxjpQMtEUSzLIVADPHgDeEdjnhg6uAiZZrb4szqBhJRxC3MXDaMX409VQI7LQiyEgwWsB2ex9GigWNQYBTN8APlGtoyVuEs+8bKBcoMAfDhxV+/ZfK3YBWy2RGCGXSrhDTvDlwtk2v6Jw6cdMuf1drA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5GQSljL13svLUEd4gpljRoNmA5wTCM6fWmjKdX4w1k=;
 b=K9q/IiR9dDWRg0M2YvDGP9wZ/RSEt76R9CjLDzcvv4NPw1T2ZeF8V2iMpiqXJ8SmJVVjY3ipiRpCeTD2ApUnKkmoo2psMjHRN7b9FN4Lbn7MdJ89nf4rRlfG2IA7wHwZS62SCUZiGQdq2AHMOGPBTANPtBc7mFQrtLVfPcVUyiC4UtFhnANfP8lDE5GoDYpYCQXCJJsRpMnvzNuqFtbZk/O1NadoTO8h6cxpSAm8yySSovP8igFh5mKiK+WQHwy2I2ithXlR2JCTcnHpw2SYZckS+UoAhHz2auAvJyNJm5cC1aRC5Yhe8lGaEXA4tT5XUIhVc9ejFrrFk1rUJh7Z8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5GQSljL13svLUEd4gpljRoNmA5wTCM6fWmjKdX4w1k=;
 b=HO+ias1VBvd5NkePKOegQxlPmvFoskSgCZhyrqjlkqxYKeugTgCljyk3cAjDeTVT6vzilC5S8mLKWzQgt2iaHIqXFnSyljIQJVaf6u7ckTfrZ1DNSLBPwebonOnEG7T+7EG0iRwgPz+1B0eO2MFzas7uGt9WHwTJp68iCLj7ZiZVyOUEDKgSUQ6M9QW+3I4qXEKuB2Zjbr/bYGXsUmEsJWQG8jknt0M5gF1i45BI5Bn+1wrgpn6u0acNVo5ji++6zHMhUgz43S07BiPSSO7GYRQ6kGWcfp3e+V1qu8HgO4PVngkrNuuxmijRxeXkGU5GSH7ypXT7Z3cb8cRvXEU8Og==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM9PR09MB5043.eurprd09.prod.outlook.com (2603:10a6:20b:305::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Fri, 24 Dec
 2021 10:36:27 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d18:d92d:2403:1b2e]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d18:d92d:2403:1b2e%6]) with mapi id 15.20.4823.021; Fri, 24 Dec 2021
 10:36:27 +0000
Subject: Re: [OE-core] [PATCH] base/patch: Disable network for
 unpack/patch/configure/compile/install
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
 <CAMKF1sotV_QuheVfSyCBndQiKr_suBEnzDuWfExf=LgfT0yRww@mail.gmail.com>
 <3cf5e25c0e49befed250ec01f58a6ed086e4b65c.camel@linuxfoundation.org>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB46425B8EEB7D75744A976E6EA87F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Fri, 24 Dec 2021 11:36:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <3cf5e25c0e49befed250ec01f58a6ed086e4b65c.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [6QfGJFEspnHnany9TJayclKqWj5l2AIszuHSctqXOUZIv+Y/nOadAHDtrTgD5ruS]
X-ClientProxiedBy: FRYP281CA0016.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::26)
 To AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <bc0d97d1-07c3-11ea-2634-7a375a669e42@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1dd35de-0593-44b5-1fa0-08d9c6c93d9d
X-MS-TrafficTypeDiagnostic: AM9PR09MB5043:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1opFJtpSltYGKNmN0OF0I9zV9RUiYY9nmZdVH/vEch3aO+OIZGD9zkjaoc+zwsG5wCDSOj9TAMMYaToiMDa4hdev4UBYC+g560XE5dbWVXM527R7eBBMOduht0zTVjhuu8mQ2l2jYov+FBN5KK+ZOtBmskScSwfXNo1ksH9GT2aFc+iylFm6uDTnWGNaL/2eJG9wQrHiLj/Fh8ILR59vJdQxVQeAQk1JuE6BAlLxFPbnWyw6KeOd2IiOad4nmnKgevlKCdo1ZjUyy/mORuqft35mypj0j5eNC4xmnxUyXYt9D9gzzrHfZyfMGLibPfeg1E4lKU2uD0gOk0kfMJXl3/eAdUnSotsU5VPzf48lyWbjcp2JaKrPB69wbA+ktABlY0T/VmVK2Wi4o/PN2IuyCX33jbvc7jheRXWitDFKZqybjVfgjGeMJmfiSbiUB87h0CFBOj1d8d2L9RdWH1ZQtI6TMB048z02i/vvhsbmYQa1LnDTfNVgrvh9sBRaPG2G3tsQjvZK/E3eWZnHnlO0/NEu3+Oh7jtarDkPI4usiXqmKek45xk8hP2zOpKxwKT93wKh7yDJ67HUJT8WZynuWVx+Py3ZmJDrNcDgMAqUgsjOcszgKwWHUFwA4wAer++HzLVoUl0ag5TCXDP4ZVDgsg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MmowYXQzTi83OWpRTE9NcnpGOVZJWS9hTXVHY3Z0TXN6dlpYRDFoZUwzKzhD?=
 =?utf-8?B?c0NnaGQ2TFRIMy9nb1NobXR4eTdmT0Y2OFovOEdRREJ1OWdFVU5zZVRxaDM5?=
 =?utf-8?B?YW1CVUcvY0pDWGlwT016ejBtREdLYS9SZElzRzMrQXF4V3BiZ2VMUGdYVExJ?=
 =?utf-8?B?N0w5WlJEQlZOOVB1azRFa3diOXZ0aXAyeWc2WUYzTGUwaHgyWGhKYjl5ZUdk?=
 =?utf-8?B?amJ6TjhsRkxCWW96VDlmVzVRaHRkbEsxWXJzK1ArRmd5YmhnYUNHRXllazZv?=
 =?utf-8?B?OUxFZHhad2QxZ1c3aUt4cWNraFVVbWNWRTl4T3ZOY0pROXVhQ3ZZdVU0cS9r?=
 =?utf-8?B?c1NtNmhpYk84ZlIvU0ZCdzBicHNoSVFtcFUrUEJVcFhRb1RNc3lkYUZmZG54?=
 =?utf-8?B?VUdQaGNFdHY5clNSdEU5YytMTkpDMVZQWDNDTTBPcTZkblNibGhCM0tyNGZq?=
 =?utf-8?B?cFpNVERtTjhpQWR3MG5HVG1KdHZsSFVRSmYrR2dJOUdtdlI4dldUdUJqMUZZ?=
 =?utf-8?B?eWIyQUlZTjJGUGhjUU5WVUc3UGp1aEcreXBZYlBvMGs4d1U0YU1PaHZWWU5n?=
 =?utf-8?B?MU5KNkpGdks1VlhzZkZka1hSRDR4R1pUOXRqeVRHbkthaDQvWXRpejRVQXBp?=
 =?utf-8?B?RHFPS3V6dzlYWGhwMU5qc1VxdFNFcFRlOWRPbk5zbjFLRWVEbDJTYyt3bU5s?=
 =?utf-8?B?ZmszZWZCR2p0RUFGZTR2aDR2UVVuTFd2SmJnMkF1MjZpR29CMFRMVk50NDZY?=
 =?utf-8?B?bXVudkdhR2h5Y3Bhc0tMcEwwQXBYZUJNdWw3T0RySW1heWhxQ0t4ckxkcG85?=
 =?utf-8?B?ejcvTzd0RXFVbGl2QmcvMkRYTUp1c3pZTkZJTENVa0RtQ2QzOW5VTXRZUERH?=
 =?utf-8?B?cDlyc05wTjNCbFlKQkFhZUZkSmwwY0ZndGFEa2tVVi9RZStNbUs1aW5DeUZH?=
 =?utf-8?B?Z0F5KzhuRGQ5Rm4zV0NiSFB3MityMEY0RXliVGZHbDl5MU93NTJwMERhcnMz?=
 =?utf-8?B?ZmZYZGs2NkRESnV6OU1VUjhTRVRYUWdtdHk1VzE5bnpxaGNJQ2VQSU9IRE5L?=
 =?utf-8?B?TE82dlYxQ1hBVDBVRUU5NUNIalB0aUxDRFZJczNmSm1qejZOWUpka3RVM1lB?=
 =?utf-8?B?aGhZL1lXdmllR0VOc3FOMElRSDZSL0JkODAwUG5Ycnp3NmxBeHhreFEyQmZp?=
 =?utf-8?B?V2JBSkZ3RDA0Z3kxZUdkSHdnQ3hFQ0crcWZjcVZhTTRXUHNleUNySXJSaFhC?=
 =?utf-8?B?OW5NTzVYcDRkMWdvaXVGYVlxbVRLMFJmemhrdjFkVlQ5NCtqQ2k0NzNkNkNZ?=
 =?utf-8?B?M0ludy9PekUvZVVMaXY3bmcxazBCODl3SVpmVEN4S3AzWXJLTXgrS1ZiaEI5?=
 =?utf-8?B?ZlN3ZHIxVGIzR0E9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c1dd35de-0593-44b5-1fa0-08d9c6c93d9d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 10:36:27.6099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR09MB5043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Dec 2021 10:36:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159999

I had a look at the failures and most of them are fairly easy to fix - 
all but the go recipes like influxdb.

I'm not sure how to deal with that, so there aren't that many options here.

Either
- inject all the needed with a fixed revision, but that would prevent 
devtool from catching updates to them properly
- create recipes for all of them and pray that there won't be a circular 
dependency in any of them
- allow go to work with network (the least favorable option IMO)

in the case of influxdb for instance we are talking about

github.com/peterh/liner
golang.org/x/crypto
github.com/influxdata/influxql
github.com/influxdata/flux
github.com/BurntSushi/toml
github.com/influxdata/usage-client
golang.org/x/text
go.uber.org/zap
github.com/klauspost/pgzip
github.com/prometheus/client_golang
github.com/jsternberg/zap-logfmt
github.com/mattn/go-isatty
collectd.org
github.com/bmizerany/pat
github.com/dgrijalva/jwt-go/v4
github.com/gogo/protobuf
github.com/golang/snappy
github.com/tinylib/msgp
github.com/opentracing/opentracing-go
golang.org/x/sync
github.com/apache/arrow/go/arrow
github.com/pkg/errors
google.golang.org/grpc
github.com/kraj/xxhash
github.com/influxdata/roaring
github.com/xlab/treeprint
golang.org/x/time
golang.org/x/sys
github.com/jwilder/encoding
github.com/dgryski/go-bitstream

where especially the golang.org/x modules are known to have circular 
dependencies like x/a relies on x/b, while x/b requires x/c and x/c 
needs x/a for building.

Not sure how to tackle this - any thoughts?

On 24.12.21 09:30, Richard Purdie wrote:
> On Thu, 2021-12-23 at 22:00 -0800, Khem Raj wrote:
>> is this list of failures due to this patch ?
>> https://errors.yoctoproject.org/Errors/Build/137579/
> 
> Looks likely, yes. Recipes shouldn't be attempting downloads in do_compile :(
> 
> Cheers,
> 
> Richard
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159996): https://lists.openembedded.org/g/openembedded-core/message/159996
> Mute This Topic: https://lists.openembedded.org/mt/87909311/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


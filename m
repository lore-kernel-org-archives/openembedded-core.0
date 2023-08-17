Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 252CCC2FC14
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 12:22:39 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.84])
 by mx.groups.io with SMTP id smtpd.web11.185661.1692274949650869980
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 05:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@welotec.com header.s=selector1 header.b=NKI+LNa8;
 spf=pass (domain: welotec.com, ip: 40.107.105.84, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qi3doQWLEZEHqHOcmrtCihZmiv1fp4XX54r7qyVb7lGcuqMPhVGXRwsdJFUOnGtEyXTLGQOQ1ABROZg6ndsGux0uANaxfmaYtWrUyYYdMO+lwp8orGbh7naOndaAOjgmmOwSbTPpVx8qd+D5wmN1HqWIieVnrfxmEGZOETzz6tIhOcwzC5nya6nW9llZIDeWnQyH6BueKFyfIqrI7J5/vLQ7p5DE9TrKS1kVQA1LctqQ4LLxuVzB+bVyLsZh43z1v/sG51rMeEnbNxhmjzPq4ig/9NG8y+oEIozH3jDwfLl8bHCQ9+EBKHQy8Op3XqkYvlT7dA6Xpij3F2rm87zsfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8TtPl+UNTr4NUL28wGP3Pn4xB8oCJ6MQxBXxSItH+k=;
 b=YjQjoyMcSZb/qZ1N+8ARmIXU6EQZ/zWrMxsk4p/tZ11JD3gI6Aqu7ZI1RrVMnmhbDNdH+yt7AaOyPhwF80X90+LhYaKcCXEl1K2YXIwHqkaPqkhTG5jLL02c7x8qIeqOx8ZhIsBF1FN8DFWCa/n+Cc/EFi3tRTnZ+BlLqjJBOrvQdWYcHfY+QmxVeDAIt5QdBnhihXmASGiizlqcrJDz9yzlZDFVLXJBT+8AsWR3kiG1r6eQNOhLa4I1tC32GXO5eM3YMqrhYnGMcFojEbX9hr8sXB4wgChecGtpRi4FOaa4DwZcQ/1QB8yl7CAYOADe+hP3a6hOWroPVhS6AdTcUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8TtPl+UNTr4NUL28wGP3Pn4xB8oCJ6MQxBXxSItH+k=;
 b=NKI+LNa8Mr7Bk10Ms3fR6X4j9vdVgfS29jTWtp/UVRMbOTnuwgGN7Nf8+uMzBbweHvkc7Uugqg1+lJ1lTyPZSFn0BATM7LWs1lUyyPO7exZQkGXdFFpYCyjdfHolAe6LhthZLdHfy3GYAtbEzsTmhpOFjUQHXmPcuP0ifFwA0UQod5LHFWpxmI3FjQxUPQY08v6uNRHXz7m1KnkHsBPZgqZOaRaEMvoDiiTB+i5dovSM0VZ4kC8Bf7H2B9BrwinXlnY9lQbeXFGSsUZjkIE6tnpfqfqmzkwkQ6cQtNQYMnCEXpm0M/eHaV2Mt9XXIYygXeRNedFBHmZCOL3cyuqTAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DB9PR04MB8493.eurprd04.prod.outlook.com (2603:10a6:10:2c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Thu, 17 Aug
 2023 12:22:25 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06%4]) with mapi id 15.20.6678.025; Thu, 17 Aug 2023
 12:22:25 +0000
Content-Type: multipart/alternative;
 boundary="------------Nr9T2932Cp4UYi0QcvEuBCLI"
Message-ID: <4b0c88a1-b8ae-1ac9-ea44-e632fd62b39e@welotec.com>
Date: Thu, 17 Aug 2023 14:22:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-Core][PATCH v12 4/7] sstate.bbclass: add support for ACLs and
 xattr
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230804084315.55768-1-p.lobacz@welotec.com>
 <20230804084315.55768-4-p.lobacz@welotec.com>
 <CANPvuRnTX==Rx-CkttgCii_NpNgjRinA2m5+zd1j9Hh-L3cL8A@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Piotr_=c5=81obacz?= <p.lobacz@welotec.com>
In-Reply-To: <CANPvuRnTX==Rx-CkttgCii_NpNgjRinA2m5+zd1j9Hh-L3cL8A@mail.gmail.com>
X-ClientProxiedBy: FR0P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::12) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|DB9PR04MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: fb5d798d-df89-4c61-bdc0-08db9f1c9d14
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7xov3qgXQf4zh0lnZolW8paut1K2tZ3aVBvgCH6bpBQldroIgb6LLY1OlAutZuVxiq3vBm/UMvAz9c2cNbvvO/8LNdecmzbOLnqzRVhcQEsfY8bdrzrwOcq0/blsdrXffsDIcVhLsdEH1kd84rdyTDGaQC2VfHKNUmwhwMcbJ75fgnAoGU4XEcknYUn30Ji2TSZOFBofaNEQIk+lQo+IQVmCZlNwUqObaqWsmh+UKv30ZjV3yGz6FRITz+8dWXKCEsWP+7A2Ho39UEd5s/aMEwvWomL5OkrLnoM49jRkZOVnXwoeEoGu4oTJISbzHn/NF89pJOu1HOj5QYOKxlVHHn7FL3cVhx4BULxZLLqK0rijjLWre1WzyPWWsJ7TP2/tiRoYPMzY0bPmfdG4UvIbZagaW89FlHBKTeQ154yqSP88MdTxQGn5VXmAax+ki0qpqpAFj//INt+yxGweVTEF5YeizmmeXxv442v9o1FzhJjDNIXUdiEL28oGNYBrlQ7kA/t6qrGGL+CQKPUg6VU3ojwFKBJvhV/DjZIaNHHaREPyZ3AAi0gurZGM9UGftKnUMbrrzgf7Nta//DunWalPWM+vsVA4KgY7MnUuLdVfMv9B13tccfHhs/rtDhzc+PlP5NKKCtjdcu/v5j1oFS+j6Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(366004)(396003)(346002)(136003)(376002)(1800799009)(451199024)(186009)(316002)(66946007)(66476007)(66556008)(6916009)(31686004)(966005)(5660300002)(41300700001)(166002)(66574015)(38100700002)(4326008)(8936002)(8676002)(66899024)(26005)(2906002)(31696002)(83380400001)(478600001)(45080400002)(86362001)(6512007)(6486002)(6506007)(36756003)(6666004)(33964004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?STBHYTlSMjNGeUhUY3Y2Mm5VZ3dRVHd5K3UrWC9ZeTFoa1RmSHFVb25aNHpP?=
 =?utf-8?B?S3dLcGszdHhUSGRZbGpUVDBTQ3JhOFUrL1hlQUxuMUNtU0JqT3NFMFZnbVlj?=
 =?utf-8?B?TW9ybXJkcEdrUGQ2aVFBd1pKTVdHdXNqcklCSVErM1lJNnZPb3g5RmZuazFh?=
 =?utf-8?B?ajJ4bU8xdVBtekNhQjdCNXI1UTZINE1HaUxkWENIVUU0QjhTNzBHNDBnWktH?=
 =?utf-8?B?d1RaelNUangrVXRMQWFwTXo2cWF1ZGsrQzNaRFhjZktDMHZhNVhkMWZYOFpM?=
 =?utf-8?B?MjRDYnNTTThhQmhEMERQa3dLRG96UXBUZlVYbUQ3bUpYT0svSVlwZ1dHOEQr?=
 =?utf-8?B?SWQrRWcxMDIzNUJXZW5IMWE3d3ZhS3p6YlhvbHkxbmpYSDdOYmNPOTlLT29J?=
 =?utf-8?B?QnZORGl0TXdYc01wUXQ4V0FKZk9tZGxqK1RCNkZJUkxOZVFuSDZrMHp3MFB2?=
 =?utf-8?B?NTkrUnV2aHdqOFlzUW95UUlySUlkSythZmwwN0IydFB0ZWdlMnhaVjN3SFNT?=
 =?utf-8?B?MXRPMTRtRnh2R2JUTFlka0ZISVpRdjJlcHhZVzA0Y2J3eml0RHhkK3lzTlAr?=
 =?utf-8?B?WHc3V2lUbFRGSDk2YkRkdEhaeUsrVjVOa0Q3eVFVTHR6cnhmekhlUklyUDkw?=
 =?utf-8?B?dXNkU3VaUTRHeFQwSy9yMCtDcGh1K0NNVEpRQkhkbTZWVlZML2g0ZFpwZE9x?=
 =?utf-8?B?NW1Ma2g0UjdCZjhJbC95M1lsR20zNDhHQ2ppdFppY3JUdUdqWFg2bXlqUDYr?=
 =?utf-8?B?YXFTTWZMMDhnUUNNU29EQzFFREJENWJPcmhqMlErejhyUDZtKzBETzBUTDNN?=
 =?utf-8?B?S3B5dXVDcUZiQ0xnWUJSVjF4UkZhVVprS1ArSXhqTnZ5SnJDYVdpbnpEakJV?=
 =?utf-8?B?cFA4bC9Malk1SVRvOE1zSGdURHQ5c1VyM3hQc3FPRHJDek5WQUhWcG8zMjB3?=
 =?utf-8?B?a3Qwd1R2MjVIZ1VQeGVKbkpnUlhKSXlnejhlNEdHbTNDaThGZndmWENCcDRY?=
 =?utf-8?B?b3daV2dydElUdDNDRHJvWWd5MjB6T3JBRmFramJsc21pRThlVCtaSzRHVHhT?=
 =?utf-8?B?TkdEbmtHSWp0SFpXSXY2TEorcWVYQ20zZ1hOMHV2NGN1OVJKdzI4d2phVmha?=
 =?utf-8?B?TUNKRVRsZnYySjc4WlRLSTFwK3VteEFpWUgxMUNoT2gwUzB2V1gwMzFIVGs2?=
 =?utf-8?B?dmIyRDZGdFFHV3REcGd0SzRWUUcvUGhtb0l5R1ZYbTd2ZDJLSGEzcU9RNTdp?=
 =?utf-8?B?SzRTRC85dXduNWVkc0llK2xHdmZuU2syOHhGU0wrOHhWeEtuS0VtekVKdXFG?=
 =?utf-8?B?d2NxL0dUaGI4dnFQL0E4cUYySGc2UTROZDJkRWk1ZkwrSmI0eDMwcnRvb2VO?=
 =?utf-8?B?ZWlydjQreFowLzVvMXF6aERhT3VxTnJqZzVCaUJkQ2Z2V1lPbXcra1hFN2xS?=
 =?utf-8?B?aEZTdHBxbEYxN0FOWVh5Z1JuaXY1anhRUm9XemlpaS9hZWtGUGlWcHZ6TFhH?=
 =?utf-8?B?T3RnWTBBeWdxTEhycFVvSFJHQUptdzUrWlNvYkZtR2NvZ2FnQ3lwUElqb0Rn?=
 =?utf-8?B?QjI1cXJVd0g4RzdXSHRaRGh6OWdrZTVGTmpkbXo5eEMrL1pkdVl6SHE3RFlT?=
 =?utf-8?B?ZE1vSXQwUXJVNHVBeTAzUXcwSVh1RW1CU2NCTWNMZVdHaDRFeStRZFUzQ0R2?=
 =?utf-8?B?WVdqVkZaeVpMU3dEU0t1V1RJQ2hzbVRDaW9KZ1NiRTlYM2JLemxEZ3UyS1pJ?=
 =?utf-8?B?djJmNHNyeXRoVzN3cE4rVWVxVHZJaDMvUlM5TFlTbUxsUVR4dlMrdStrS25U?=
 =?utf-8?B?VE5EVllxSFZRQmdaQlVaTXcvTXRkeXhPaFdBNDVOOUw1K25IOGdobThFMXBO?=
 =?utf-8?B?VzlaZThra3hZallqODRpUmErUm9nb2hKQkNFWlhtS3k1R3M3T1hKVWFHSHF4?=
 =?utf-8?B?QWdxNlU1MUM3NytpdEpUV3BsaUdhQ3gzRlFVQkozL2Rqb1lwVUF5WG14VW5k?=
 =?utf-8?B?U2J3V1cwSm1jTTJYZHpua0Roc2JXZ3loWGRRQmtlcktpQ2ZCTVVBVTRTNEVW?=
 =?utf-8?B?Ri9ZMWxNRVVtMjBPMG4vU0RVTHRkclpMdmhCeUt0aEdrZzNPdkRCMGNwbUFD?=
 =?utf-8?Q?F/yvZz3asP2wjScY6kpwNzeVc?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb5d798d-df89-4c61-bdc0-08db9f1c9d14
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 12:22:25.0295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9iujbAeqH3suCW2E4xgRlQOz+C09GOtypjeQzjbgmxQlCcIpIjOUFcqlAOaI89dBmtf4ChWFtZXy0GUe3OxzKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8493
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 12:22:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186306

--------------Nr9T2932Cp4UYi0QcvEuBCLI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Sorry for my late response I haven't noticed your email before...

W dniu 4.08.2023 o 11:50, Jose Quaresma pisze:
>
>
> Piotr Łobacz <p.lobacz@welotec.com> escreveu no dia sexta, 4/08/2023 
> à(s) 09:45:
>
>     Extend `tar` command, with additional parameters, depending
>     on choosen package class and target distro features, in order
>     to support ACLs and xattr.
>
>     Additionaly set archive posix format, in order to preserve
>     milliseconds in timestamps for reproducibility tests.
>
>
> Looks like this adicionality set archive posix format to preserve the 
> timestamps
> is a bug fix that should be backported to previous version.
> Can you split this patch in two to make it possible?
No, this posix format is not only for timestamps, it is also for usage 
of --acls and --xattrs.
 From the beginning my intention was to use --acls and --xattrs and it 
occurred during implementation,
that gnu format is not supporting them, after that the bug with 
timestamps came up during the tests with reproducibility...

BR
Piotr
>
> Jose
>
>
>     Currently only `package_ipk` supports fully ACLs and xattr.
>
>     Signed-off-by: Piotr Łobacz <p.lobacz@welotec.com>
>     ---
>      meta/classes-global/sstate.bbclass | 4 ++--
>      1 file changed, 2 insertions(+), 2 deletions(-)
>
>     diff --git a/meta/classes-global/sstate.bbclass
>     b/meta/classes-global/sstate.bbclass
>     index 95373fd60a..ac890fc98e 100644
>     --- a/meta/classes-global/sstate.bbclass
>     +++ b/meta/classes-global/sstate.bbclass
>     @@ -848,7 +848,7 @@ sstate_create_package () {
>             mkdir --mode=0775 -p `dirname ${SSTATE_PKG}`
>             TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
>
>     -       OPT="-cS"
>     +       OPT="--format=posix
>     ${@bb.utils.contains('DISTRO_FEATURES', 'acl', '--acls', '', d)}
>     ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '--xattrs', '',
>     d)} --numeric-owner -cS"
>             ZSTD="zstd -${SSTATE_ZSTD_CLEVEL} -T${ZSTD_THREADS}"
>             # Use pzstd if available
>             if [ -x "$(command -v pzstd)" ]; then
>     @@ -914,7 +914,7 @@ sstate_unpack_package () {
>                     ZSTD="pzstd -p ${ZSTD_THREADS}"
>             fi
>
>     -       tar -I "$ZSTD" -xvpf ${SSTATE_PKG}
>     +       tar -I "$ZSTD" --format=posix
>     ${@bb.utils.contains('DISTRO_FEATURES', 'acl', '--acls', '', d)}
>     ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '--xattrs', '',
>     d)} -xvpf ${SSTATE_PKG}
>             # update .siginfo atime on local/NFS mirror if it is a
>     symbolic link
>             [ ! -h ${SSTATE_PKG}.siginfo ] || [ ! -e
>     ${SSTATE_PKG}.siginfo ] || touch -a ${SSTATE_PKG}.siginfo
>     2>/dev/null || true
>             # update each symbolic link instead of any referenced file
>     -- 
>     2.34.1
>
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#185514):
>     https://lists.openembedded.org/g/openembedded-core/message/185514
>     <https://lists.openembedded.org/g/openembedded-core/message/185514>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/100542722/5052612
>     <https://lists.openembedded.org/mt/100542722/5052612>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://lists.openembedded.org/g/openembedded-core/unsub>
>     [quaresma.jose@gmail.com]
>     -=-=-=-=-=-=-=-=-=-=-=-
>
>
>
> -- 
> Best regards,
>
> José Quaresma
--------------Nr9T2932Cp4UYi0QcvEuBCLI
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Sorry for my late response I haven't noticed your email before...</p>
    <div class="moz-cite-prefix">W dniu 4.08.2023 o&nbsp;11:50, Jose Quaresma
      pisze:<br>
    </div>
    <blockquote type="cite" cite="mid:CANPvuRnTX==Rx-CkttgCii_NpNgjRinA2m5+zd1j9Hh-L3cL8A@mail.gmail.com">
      
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">Piotr Łobacz &lt;<a href="mailto:p.lobacz@welotec.com" moz-do-not-send="true" class="moz-txt-link-freetext">p.lobacz@welotec.com</a>&gt;
            escreveu no dia sexta, 4/08/2023 à(s) 09:45:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">Extend `tar` command,
            with additional parameters, depending<br>
            on choosen package class and target distro features, in
            order<br>
            to support ACLs and xattr.<br>
            <br>
            Additionaly set archive posix format, in order to preserve<br>
            milliseconds in timestamps for reproducibility tests.<br>
          </blockquote>
          <div><br>
          </div>
          <div>Looks like this adicionality set archive posix format to
            preserve the timestamps<br>
            is a bug fix that should&nbsp;be backported to previous&nbsp;version.<br>
            Can you split this patch in two to make it possible?</div>
        </div>
      </div>
    </blockquote>
    No, this posix format is not only for timestamps, it is also for
    usage of --acls and --xattrs.<br>
    From the beginning my intention was to use --acls and --xattrs and
    it occurred during implementation,<br>
    that gnu format is not supporting them, after that the bug with
    timestamps came up during the tests with reproducibility...<br>
    <br>
    BR<br>
    Piotr<br>
    <blockquote type="cite" cite="mid:CANPvuRnTX==Rx-CkttgCii_NpNgjRinA2m5+zd1j9Hh-L3cL8A@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
            Jose<br>
            &nbsp;</div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <br>
            Currently only `package_ipk` supports fully ACLs and xattr.<br>
            <br>
            Signed-off-by: Piotr Łobacz &lt;<a href="mailto:p.lobacz@welotec.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">p.lobacz@welotec.com</a>&gt;<br>
            ---<br>
            &nbsp;meta/classes-global/sstate.bbclass | 4 ++--<br>
            &nbsp;1 file changed, 2 insertions(+), 2 deletions(-)<br>
            <br>
            diff --git a/meta/classes-global/sstate.bbclass
            b/meta/classes-global/sstate.bbclass<br>
            index 95373fd60a..ac890fc98e 100644<br>
            --- a/meta/classes-global/sstate.bbclass<br>
            +++ b/meta/classes-global/sstate.bbclass<br>
            @@ -848,7 +848,7 @@ sstate_create_package () {<br>
            &nbsp; &nbsp; &nbsp; &nbsp; mkdir --mode=0775 -p `dirname ${SSTATE_PKG}`<br>
            &nbsp; &nbsp; &nbsp; &nbsp; TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`<br>
            <br>
            -&nbsp; &nbsp; &nbsp; &nbsp;OPT=&quot;-cS&quot;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;OPT=&quot;--format=posix
            ${@bb.utils.contains('DISTRO_FEATURES', 'acl', '--acls', '',
            d)} ${@bb.utils.contains('DISTRO_FEATURES', 'xattr',
            '--xattrs', '', d)} --numeric-owner -cS&quot;<br>
            &nbsp; &nbsp; &nbsp; &nbsp; ZSTD=&quot;zstd -${SSTATE_ZSTD_CLEVEL} -T${ZSTD_THREADS}&quot;<br>
            &nbsp; &nbsp; &nbsp; &nbsp; # Use pzstd if available<br>
            &nbsp; &nbsp; &nbsp; &nbsp; if [ -x &quot;$(command -v pzstd)&quot; ]; then<br>
            @@ -914,7 +914,7 @@ sstate_unpack_package () {<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ZSTD=&quot;pzstd -p ${ZSTD_THREADS}&quot;<br>
            &nbsp; &nbsp; &nbsp; &nbsp; fi<br>
            <br>
            -&nbsp; &nbsp; &nbsp; &nbsp;tar -I &quot;$ZSTD&quot; -xvpf ${SSTATE_PKG}<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;tar -I &quot;$ZSTD&quot; --format=posix
            ${@bb.utils.contains('DISTRO_FEATURES', 'acl', '--acls', '',
            d)} ${@bb.utils.contains('DISTRO_FEATURES', 'xattr',
            '--xattrs', '', d)} -xvpf ${SSTATE_PKG}<br>
            &nbsp; &nbsp; &nbsp; &nbsp; # update .siginfo atime on local/NFS mirror if it is
            a symbolic link<br>
            &nbsp; &nbsp; &nbsp; &nbsp; [ ! -h ${SSTATE_PKG}.siginfo ] || [ ! -e
            ${SSTATE_PKG}.siginfo ] || touch -a ${SSTATE_PKG}.siginfo
            2&gt;/dev/null || true<br>
            &nbsp; &nbsp; &nbsp; &nbsp; # update each symbolic link instead of any
            referenced file<br>
            -- <br>
            2.34.1<br>
            <br>
            <br>
            -=-=-=-=-=-=-=-=-=-=-=-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#185514): <a href="https://lists.openembedded.org/g/openembedded-core/message/185514" originalsrc="https://lists.openembedded.org/g/openembedded-core/message/185514" shash="L1cuTAE8LwLtwweA6AEBER3KssC0onHEROUfIRUe3BlzgWZRdECqGJTzd0QS4+El1xC4/MjyIzudu9lzjjMjYbboNhrsmkn3UxuCopVJRQ/ZeA++bsAMegaYd7bzFdYCnHCwDfOMWJauIlobr/Vwp/SahRkrJqZs351olHemqOA=" rel="noreferrer" target="_blank" moz-do-not-send="true">https://lists.openembedded.org/g/openembedded-core/message/185514</a><br>
            Mute This Topic: <a href="https://lists.openembedded.org/mt/100542722/5052612" originalsrc="https://lists.openembedded.org/mt/100542722/5052612" shash="ReEghAxXpdvrXyAbQET/oBeI9knE+3AigH9M+i40pKFA6XyTX3/CguNsDWHyzRgn8Tyfz1pUXwLegO2bAOPcI4ZbL8TI/ek7gyifIJFfmiwoCVrzr/Le+tfEWW5q82P2nxRCbNoQz9/k4WtutC68po6dAEOxcBw0ohbu4xnYMO0=" rel="noreferrer" target="_blank" moz-do-not-send="true">https://lists.openembedded.org/mt/100542722/5052612</a><br>
            Group Owner: <a href="mailto:openembedded-core%2Bowner@lists.openembedded.org" target="_blank" moz-do-not-send="true">openembedded-core+owner@lists.openembedded.org</a><br>
            Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub" originalsrc="https://lists.openembedded.org/g/openembedded-core/unsub" shash="wvSzlMf8WznSozoxMLE/zzhiaiOjMkl/F9ivxwp2rsmV9j8E8yJbL0QH9FaRg13ERNRiI9WUxnYsrwJqtWkH1Elm16Uz0xz/y4JYAIXMSRNhJ1xGW6NRiGY4KHP1GtYu6V2dvy11HWP8xLPgP3Lwa2FaTRfG1CS1Kp3mFtlagws=" rel="noreferrer" target="_blank" moz-do-not-send="true">https://lists.openembedded.org/g/openembedded-core/unsub</a>
            [<a href="mailto:quaresma.jose@gmail.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">quaresma.jose@gmail.com</a>]<br>
            -=-=-=-=-=-=-=-=-=-=-=-<br>
            <br>
          </blockquote>
        </div>
        <br clear="all">
        <div><br>
        </div>
        <span class="gmail_signature_prefix">-- </span><br>
        <div dir="ltr" class="gmail_signature">
          <div dir="ltr">Best regards,
            <div><br>
              José Quaresma</div>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------Nr9T2932Cp4UYi0QcvEuBCLI--


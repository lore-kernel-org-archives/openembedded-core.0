Return-Path: <jhofstee@victronenergy.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE85CC38A2D
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.108])
 by mx.groups.io with SMTP id smtpd.web10.21735.1649625711319346771
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 14:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@victronenergy.com
 header.s=selector2 header.b=lr9cTkT8;
 spf=pass (domain: victronenergy.com, ip: 40.107.21.108,
 mailfrom: jhofstee@victronenergy.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xk4zM3KfJ/GTve8GneoxL5WmLOnballMNmEqz0RJbcXqjyKNqFlGDcgcElfGVh4PokYBFcFP+95wu8bWrI6ZGy+UUvwqnZLt48I0wwY8BZ/fXwVbL8oHakAiBAGg7KTgbHmKv0TbTdwd0TB+hhxLHcd5ZyWMG+G7WKObBo86/pwRN+lX5Mu0AzFzwa4tEbPRTBoEwI6L4zATOc7bdZs3/g356vGrObAoejipDfGrHh7/hrTWlvJ8yV+u5AgROxrAsCREEjEs8vhq+AYJd15rUKYpiEONa7L5GtZ7/fQQbgDiASfcw5CEmt/TnAkERkdtvp/NrQNSF1dkirtfww55og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4pANIfwhuiAVFvqqHmbOTxjA3wk5NfVh3Ok57Vw63A=;
 b=bXYNIDxsQiAuMz8SjxbI+sXP3PFtESSGVklaHLKFEH60sUmeBU9vkdHl0ANCUOeUb9vR0qeZFA15x88kThpYH4tqLFGz1ZfQbzpxFJTFTqas9b4G5vdz2wIVRhyL/nvtgBEukUm9R9CWuh7OeyIZjRKL2h2PnxDQ0/w9n0qaNr0u/G/hC/ERAa+keZXaSSm3lw6mKVry12pEr8Fq/XPHsN6GXYYGN85MZgAIQ2tQ268idFAgCvGHkVbJ/kj77LKntB46VUdtpmk2NMUqDxG0ui3qsKB2n3eP1aiDUGCk7J6G8MCOqyxB6uZuXt9HnMrN5urH1jJHoyw1Ee3JKe1Pdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=victronenergy.com; dmarc=pass action=none
 header.from=victronenergy.com; dkim=pass header.d=victronenergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=victronenergy.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4pANIfwhuiAVFvqqHmbOTxjA3wk5NfVh3Ok57Vw63A=;
 b=lr9cTkT8wCkwOfbEsNWWsjZEM/pbim2t2VxgK68GePTlNbd1lHvp2RKmsIdbIca7gqbbqXTQsDA0I0tQPdCSSuaRFJ8E98yYElu7e/XY9CZ7nDk9tR8VUS2WcCXCyunOvvXG+6N1V/S7Sp9hZwU5PEC0wDxr/oi+n7+hN8h+MWU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=victronenergy.com;
Received: from AM5PR0701MB2979.eurprd07.prod.outlook.com
 (2603:10a6:203:48::13) by AS4PR07MB8412.eurprd07.prod.outlook.com
 (2603:10a6:20b:4e3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Sun, 10 Apr
 2022 21:21:47 +0000
Received: from AM5PR0701MB2979.eurprd07.prod.outlook.com
 ([fe80::3da3:88:4224:24af]) by AM5PR0701MB2979.eurprd07.prod.outlook.com
 ([fe80::3da3:88:4224:24af%3]) with mapi id 15.20.5164.016; Sun, 10 Apr 2022
 21:21:46 +0000
Message-ID: <1366e638-3716-76cd-c7bf-7e6bef49eb06@victronenergy.com>
Date: Sun, 10 Apr 2022 23:21:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
CC: ross@burtonini.com, openembedded-core@lists.openembedded.org
References: <20220329130741.2430737-1-ross.burton@arm.com>
 <f4e17d13-71cc-b25b-9a56-207ca89c76cd@victronenergy.com>
 <CAOSpxda2R7S=qJ73nHVr-rA78=6KPG0Y_0ysCQczgYjZAZ=gFA@mail.gmail.com>
From: Jeroen Hofstee <jhofstee@victronenergy.com>
In-Reply-To: 
 <CAOSpxda2R7S=qJ73nHVr-rA78=6KPG0Y_0ysCQczgYjZAZ=gFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM9P250CA0002.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::7) To AM5PR0701MB2979.eurprd07.prod.outlook.com
 (2603:10a6:203:48::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbabb48c-a153-4181-6ad3-08da1b381e0d
X-MS-TrafficTypeDiagnostic: AS4PR07MB8412:EE_
X-Microsoft-Antispam-PRVS: 
	<AS4PR07MB841277397C0EA8E8C6E20A71C0EB9@AS4PR07MB8412.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nh7ffm/OZJOenNkeLFJOfe1I2bvCe8/MTpS6jitM1qh7G4pvcBAtYUKHZGRF2oZfbD369IOrKIcQEzOyECvguOgose/VBWmvECDcIB8eFnZ2Ynqppi9H7d5VN1Ip74xPD7mQuyyZ6ljgctSlnjnGUxHohOfb5gCHCL4ExqVJNUkHmMJfQpfJaacL7ZeBM5j70Kg+VwHfWqfEbO9640TbhUeZ4eZHwlXVu7QPRDVwkifDx4r6LRc1BMb3Kgh7hFvGlwg3HL2Q0UFbSfowmyL4YKQb2uUqqcnEinxhw0mq3fG3fpUNrZh8BGpz7PlenFzD1qFbzLjQYGlZJdSrxMLKqKZotYaJfpUX99HXpe3Ja/fPGuXDnV4cct42MhkG8HAalGP6IdKSz9P1Ba/ALw+NgQV/ldlTHfDFDb+kaEEwK6AKskx6aKTXi7V4FuoNMuwQ/giArjCYoq3oABBb44KoDWVZZuInpNZHFRuugYWyVu0H460ShzqE2OBcX8Z288/oEfEn1Bt85PGbw2C8ur371WmtKsg1XZv7wCCmvY7hBDwBn72zuxWvHIo08SQBxn/Uu8kKIoeVvkHJehRJInO+jcwZwPEo87Uy6mq8U56l81z433DTUfKhgNH16skSzzWbnQsrhbdZeWb4H3SsWQZZpYhlijQ6pyOU7pHfdexCgRmlT1YwtBPkYcGVlRJGnbnmlowdwIsO+J+yKKiYKlBfkTdofWoQNppDrWmtRki7T2sk1PbJ+OKmlxk9ns2pJW58MUfhWjJTe3U1dI2SfU0QGG+szrhflZ4KiAdZwOaOsOHKnSUkGyFVejtqfp9oFBda9T7FPBmClyFBO7Fd0HJlXYYJ6c0KE6us//8+t+raV2fWNbNLqjG0/6UldXzxVbCaxSXDWdCaNxG3pvg5EuJTsw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0701MB2979.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(2616005)(6506007)(53546011)(5660300002)(83380400001)(186003)(38100700002)(8936002)(86362001)(31696002)(2906002)(508600001)(966005)(6486002)(4326008)(6916009)(66556008)(31686004)(8676002)(36756003)(316002)(66946007)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rViRow19z6MIbRdDdxz3XyRnTs6CQD5z0AjpdV7/mE6M4j4cflyR+Un1Z6Po?=
 =?us-ascii?Q?WQiGyrNNwE64n0xwGD/XcMek6aSW18oBjcljh7Wy+4BVD8TFzdL679JoFOvI?=
 =?us-ascii?Q?azhpE3OKuSlUushvEwkMi39Y01Mc0FtWZumoMGFn90tkahdPQQ8rq6o6KLzq?=
 =?us-ascii?Q?h10W4rCQ635trjX5wtWqvJ0WJUdg2JEOBNAu3JdTF0SKn/scwBJuQU58Eqbj?=
 =?us-ascii?Q?C9AEaG6wO+Owj0UXkziqj0ew1x0QNATBd1vefNMzblh5+b1l6jGu9JVZlQ6d?=
 =?us-ascii?Q?4gLQZzPFGU6XYESymhgzo7LwJhGqJTKyzKoNeIEpusybxAVnQimEjgro6YOX?=
 =?us-ascii?Q?ROCGtkxjwIxtW4WebzmNiDx3fEhCFLIDTQa5QJr9OqBtrAjftHd47OsMGkLx?=
 =?us-ascii?Q?589dbGGQBrqDloWK3Z1ZoJmgpL98vqwMDql8H74QqmJXn9Kyz9zuyQGSR4aU?=
 =?us-ascii?Q?hIT6VKjJAEE3FAsoOcE7iw+mdzo4P5sw3SaswOqKdRopaQ7faNdmmdKGdXdQ?=
 =?us-ascii?Q?5xMoQwm6lgAjFa85PPROSswpzh7Bh0GqHmRI0glVsuFEyBs+uSb9kiK9HZrm?=
 =?us-ascii?Q?SpEN0H4CrJSemYx7TpPUQh159KMZlQOHVYAJPgSBanaiylcfox4l9JkB2Sr4?=
 =?us-ascii?Q?OB5ifaDU+RwlG/PAPDyAvoXc+quB1BWEMc82xvTEgd4QI8SWVJiW2v4h+BXm?=
 =?us-ascii?Q?SSXda+nv8HZ1W0ezFr8rurjnM4XQ1XWsLj+HdZzsw0WkSizNoMsPCBgss46g?=
 =?us-ascii?Q?duk1Uds4VWV2Bgxf23fRzfRdQigYt62zDDfK6XC6n3rTTBOLP8837cj4Fj4e?=
 =?us-ascii?Q?fiYnvwhNQCLh7yVii1m9m3mIlR/zxbaRv4h1e2f2E8UXdj1GR7r/zIbIgxEb?=
 =?us-ascii?Q?w1oPZP7tUxKse7LDq1vXjsqhOr+EujpKrs+cDo00fHE2AZoVE3jDFkxeN1X8?=
 =?us-ascii?Q?AVfBnwswnWtIRpSsnzE96ZwYUpMyvfNAdS/HnjMQykz6M4mkXY2tR+IBaW7b?=
 =?us-ascii?Q?BppxG1Jfq+m33ham9zxv0WSHsxbHISLnZOY2oog320b8UyQQpvaerITtc9MV?=
 =?us-ascii?Q?o3o3T8TcTwYV4a05r9ntqsi9T6TRimTaxkT7Qc/cxcSCrDGrF9qJnZUANVZW?=
 =?us-ascii?Q?THJqS1TANgs5aJ/vDDO5OMNCRlovRRSEdzjtD9rqttpjKDWOt6weIRjCNUwz?=
 =?us-ascii?Q?lTd5p5LeiXR4zFhEhHf5jyQNV8mTH20Qka4p2e2QsOUJs6sVeSrv796QB/KJ?=
 =?us-ascii?Q?xr8Tby6FqI73fywngGvz7Yoh/q9uA7rQ7ZpNlYh10gfWt5Pg2vAUxaIspCwb?=
 =?us-ascii?Q?f8XbEynuh56FLeVoHVOVRoJpM8GIkx28NJmP7L6ly3SNgJR/8ldKHGEJdOkj?=
 =?us-ascii?Q?+uiHqjSCaH2Pd4DxIVCWW9jE0BjNap/lLCSUfPSriu2B0SSkP+B9xKu3733j?=
 =?us-ascii?Q?7kzh+pWEaH/b8HLYKUoirYVDUrfT0x3Jyi2h04/sMPSo5/14T95jgzQnrmbZ?=
 =?us-ascii?Q?jAoOHmfRSyZ8QXb5tbtD0wQXJFEhKwkeRkmf4L/OPLJ/wGUQZ9H6TZBHvouP?=
 =?us-ascii?Q?qJlDCQPHwEMDmRc0FrI9lk2HtIwewmycODQ1leZVc9cWgnBgiUoyZl4HxM8b?=
 =?us-ascii?Q?PRdp4IHdnUPnBjMIoMB5Zqz2fUb8gKLOoAfi95B+NuTddczG93oa4BzYuu6n?=
 =?us-ascii?Q?t3kW8Zrn4iUs1pSoD4MQ0mIMiYvF4jajpRmGpu2U/Sc/l5B86251gW1Bkjsu?=
 =?us-ascii?Q?VoanaSCHtlEBCm5mZtMPWszBBPLP2hyxBHs5/aOgmsAay/lPoFufIfJ+Viu7?=
X-MS-Exchange-AntiSpam-MessageData-1: bxDYzKCmxMQffc2AXcdnUCgliZYlWhEu/Uc=
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cbabb48c-a153-4181-6ad3-08da1b381e0d
X-MS-Exchange-CrossTenant-AuthSource: 
 AM5PR0701MB2979.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2022 21:21:46.4066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SDZ4DVuv6+5+5wGvAxWDny4fYjEgeWDqhSOCymojiZVO3umB6cz09lJNW0dsS4k+W0aRHuU6kB9fWDhjvPDzY8HZUan8RX3+rvxZxz30moE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR07MB8412
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164207

Hello Steve,

On 4/9/22 20:14, Steve Sakoman wrote:
> On Tue, Apr 5, 2022 at 9:05 AM Jeroen Hofstee via
> lists.openembedded.org
> <jhofstee=3Dvictronenergy.com@lists.openembedded.org> wrote:
>> Hello Ross,
>>
>> On 3/29/22 15:07, Ross Burton via lists.openembedded.org wrote:
>>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>>> ---
>>>    .../zlib/zlib/CVE-2018-25032.patch            | 347 ++++++++++++++++=
++
>>>    meta/recipes-core/zlib/zlib_1.2.11.bb         |   1 +
>>>    2 files changed, 348 insertions(+)
>>>    create mode 100644 meta/recipes-core/zlib/zlib/CVE-2018-25032.patch
>>>
>>> diff --git a/meta/recipes-core/zlib/zlib/CVE-2018-25032.patch b/meta/re=
cipes-core/zlib/zlib/CVE-2018-25032.patch
>>> new file mode 100644
>>> index 00000000000..5cb61836419
>>> --- /dev/null
>>> +++ b/meta/recipes-core/zlib/zlib/CVE-2018-25032.patch
>>> @@ -0,0 +1,347 @@
>>> +CVE: CVE-2018-25032
>>> +Upstream-Status: Backport
>>> +Signed-off-by: Ross Burton <ross.burton@arm.com>
>>> +
>>>
>> It seems there _might_ be another patch needed.
>>
>> https://github.com/madler/zlib/issues/605
>> https://github.com/madler/zlib/commit/4346a16853e19b45787ce933666026903f=
b8f3f8.patch
> I did a dunfell autobuilder run with the second patch added, but
> unfortunately still get the same failures.
>
> So until we fix those I can't take this CVE patch :-(
>
>

Sorry if it wasn't clear, I mentioned it because another patch might be=20
needed to
properly fix the CVE. I can't jugde that, simply because I am not=20
familiar with the
code in question. It won't magically solve the builder failure...

I tried to reproduce that failure, but I get:

Task do_testimage does not exist for target core-image-sato-sdk=20
(/home/jeroen/software/venus/sources/openembedded-core/meta/recipes-sato/im=
ages/core-image-sato-sdk.bb:do_testimage).=20
Close matches: 0:00:01
 =C2=A0 do_image

With kind regards,

Jeroen




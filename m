Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A36C433F5
	for <webhook@archiver.kernel.org>; Tue,  5 Oct 2021 19:29:24 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.22])
 by mx.groups.io with SMTP id smtpd.web11.1576.1633462162309366034
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 12:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=SOUSfuPl;
 spf=pass (domain: outlook.com, ip: 40.92.89.22,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNt3F0YpKb8gm4aitHRJN3/YYDOhbS/DFHh8p+KwhHdC9K2Odd4plh4toBYCpC6WTU8EBXEqWLYLd9PlHD1pYpPgaCXjzpm02sSIfXrKYoOdIowhRdNGuecH/r6oEQLkXj4DTqKQCgGYJteHx7n863/Ce6hqjYqNmX75eY6LrLQvY5NarSx1Qjvs1V/fSe79JT06dnZuZJG6DrydDCsGfZYIWACKblJFR97sSFD67NrAiGvLAIbKk9YVcW7kB7J0iAxOrGFtfvGVDBAjUE0hjxBXvS+GeJE2+jV7qVqkEe5a8Qw+3c0wzpmUfGFHbK+GY0ZrANUxNjZ3oiYQR8hvSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6qYuoVOFoVBpsS4+SKRIjB8WmQ+a1xgUuJuHPy9lgg=;
 b=ac2cbxiY2dyy60CAY5nuaVhGIpW3n/Nh0a1/xy3fDDyXY9RXK1nmQ7u8Yo8V8P/q14L0+fnFvbnGvonZPAABCycJD4D77HS8Qi8KxK3wqsfmwbaxElAd9xssQsDU0BlzvLEwXPtLMdoX4D/fpiPfkAgbSWsf4HgNxYb4JHJ+KOH7kgBmmiSXZHZca7lWJkT0msPZdXBsUysOohS19zypULJruKa/UqqG1bJnM/EUFrNQCtaLZW+Yj00YTrFRSNmZqsL+rs5iVfiHqVOsyYC+1v+ra2f5rdLyT0rgnic+GheLIliy8/qNojTtkKOpUDWdjD02zdFOHpLLdb17Dw2Aaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6qYuoVOFoVBpsS4+SKRIjB8WmQ+a1xgUuJuHPy9lgg=;
 b=SOUSfuPlgHy3aBGhawMIJN7Qa5khUztJQI+dYWruOG8H2sRbE4yGWi19iaiO8XYLxh+W5p1ogY0VusWp5RYlxBH44gssYvkXhXcyQofTIy6uZuk41KxVbTjDt+ojZXf25085U6ZvNSL0LCBscr3NZdnQxeBQE7wMcgIk8HBw0WFaLnQZ8fbZUsF6uxrgFHCdAO7UnqWB2SiEhMxr/MBUrVcPQkeD/sl5Af+gM+1o4WB8lffv0bukvp88AFwMcT75zsp0/nVrxdfrQoTPrkhQYPyrNF8GozJSiYZk3MiJ4WC1kes2Adlq4AnB5c9iSHQnPPY+tEzz1Y5jjM05acdSeA==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM4PR0902MB1684.eurprd09.prod.outlook.com (2603:10a6:200:9a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Tue, 5 Oct
 2021 19:29:19 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%4]) with mapi id 15.20.4587.018; Tue, 5 Oct 2021
 19:29:19 +0000
Subject: Re: [OE-core] Improve npm support to run build scripts
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <37b61ef2-5ea9-7e90-75fe-50cc662d9124@weidmueller.com>
 <6318d76222b819d3a165d405fc48dbcbadf29085.camel@linuxfoundation.org>
 <50d4d79f-a7cd-fd0a-0c6d-597b6dc4ca6a@weidmueller.com>
 <CANNYZj8Fns4xWre3_ajv-5QADpCi0f+WS2wRXCKXezOgj5fhzg@mail.gmail.com>
 <0bddcbc4-cf11-39da-5797-131fc59d7f6f@weidmueller.com>
 <CANNYZj_Xudaobe6W2TTnugjovq3KcHWBYsvZ8kS0kYZaWwkLCw@mail.gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB464243B2852B92E67D825612A8AF9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Tue, 5 Oct 2021 21:29:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: 
 <CANNYZj_Xudaobe6W2TTnugjovq3KcHWBYsvZ8kS0kYZaWwkLCw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [RpEsYUIBh3TsftpN9/S8ONqoJNWXP34skOfl4jseeRkryBaZIs/I2WC1heTASA13]
X-ClientProxiedBy: AM6PR08CA0034.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::22) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <54289e2b-52c0-5a18-3758-c1e05582834e@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:400:313f:44c7:2540:b644]
 (2a02:3103:205c:400:313f:44c7:2540:b644) by
 AM6PR08CA0034.eurprd08.prod.outlook.com (2603:10a6:20b:c0::22) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Tue, 5 Oct 2021 19:29:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3d40a9e-637f-4c5e-3f27-08d988366cf3
X-MS-TrafficTypeDiagnostic: AM4PR0902MB1684:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r17A3GEp0g8ZjGUAzXuVmv/0QyCCrnbyahdGeLWSGn1LUXkr/kUQWizre9EQKtQ9KG2voRyUbFMx6BigRTp30XJeScsAP147sQfIdes1s/yxNZZ2lv5j86RJ5WAOG2A2PyVqd4LR4Q0W49GtLEaeLtU8q4bXO/2BZ0OpWPar1NwmIeBLzBFIISzH/wRZRZ/ozOTXmlKcd3oj4ckkVESA29KGVAlUIcZ4pLBZijKFH02C6NyMeGTm5hW+aM+C4KC5SfjZJXAd+8zxY/432z2crDVCfSOzBuNzRf250PgyK737oL+miQbGvg1NFH5lkbf29e5hqITloWHHnkSJ6XY9LcU/DdXQO8EJBOr4jd/XLHwK5/oqdAdAnVr8/eNcFCi4w+s3Vwfn33bOxAgi3BDUXII/t7RCbKw2sZSd1Kn8eisXTFg3W11GGkmXIONArKfydHZkaJ+DekaH6/2hbn1SlPBYcDZ3nuY1Q5fMqIHLYl4Mlc3RpHpellV9IDAZ0s8/YeQamyunuXIQCHTviUOXCA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	jbjqbt0O/GusqJ4zyVbvBUZHyH/xiShxVReIFSleayyZEGi6utwWCV6fPPW8/0yJvx8O8fUsYkQJPX9t31JNtZ2ym2/UHQoSz0N7tfBWzXi544hzc1dSnFVEDEGoV74jgDdscV3lMrDCFZmNf6hYHRf2yZmzfnJJxFqpGFXe/rkGtZ9nAHfqkJr2ZAyIyPuogwWAgs/6a0Fbx/Lezna4eg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c3d40a9e-637f-4c5e-3f27-08d988366cf3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 19:29:19.7711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0902MB1684
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Oct 2021 19:29:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156657



On 05.10.21 21:17, Alexander Kanavin wrote:
> On Tue, 5 Oct 2021 at 19:44, Stefan Herbrechtsmeier 
> <stefan.herbrechtsmeier-oss@weidmueller.com 
> <mailto:stefan.herbrechtsmeier-oss@weidmueller.com>> wrote:
> 
> 
>      > A layer with thousands of recipes seems totally intractable.
> 
>     What is your concern? The high number of dependencies or to handle it
>     via OE?
> 
> 
> Generating recipes with a tool means the tool will be custom and 
> non-standard, and chances of anyone outside of your company
> understanding, using and contributing to it are rather small. There's 
> also the problem of needing multiple versions of the same thing for 
> different
> consumer items, which oe doesn't easily support. The link Robert 
> provided already exposes some of the pain points with that approach.
> 
> I tend to think the best way forward (or least painful at least) is to 
> gradually improve what there already is, which is the npm class
> and devtool, and send patches to various upstream njs projects when 
> they're using outdated dependencies or otherwise need changing.
> 
> Alex

Just to chime in :-), I like to question this approach of having 
multiple versions of the same in an image.
As already outlined npm is horrible in many ways, but using the lockfile 
approach multiplies that even more.
But I tend to agree that using the currently available oe-core code 
would be suited best for a broader audience - in your own layer you 
simply can do whatever you like.

While personally I think in the long run, every npm dependency has to be 
provided as a recipe of its own (even I know the costs of that pretty 
well)... esp when CVE checking and basic packaging hygiene should be 
enforced.

Nevertheless for oe-core I wouldn't want to change a lot right now, as 
there is simply a valid set of consumers missing that could enable us to 
do some proper testing. But yeah fixes/improvements for devtool are very 
welcome (also the available docu might need a touch)

> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156656): https://lists.openembedded.org/g/openembedded-core/message/156656
> Mute This Topic: https://lists.openembedded.org/mt/86089523/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


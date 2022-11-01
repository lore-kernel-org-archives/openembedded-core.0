Return-Path: <sean.anderson@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16609C433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 17:54:32 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.51])
 by mx.groups.io with SMTP id smtpd.web08.9743.1667325265078819300
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 10:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seco.com header.s=selector1 header.b=ITRISIoS;
 spf=pass (domain: seco.com, ip: 40.107.104.51, mailfrom: sean.anderson@seco.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SjPtnID3Wp5VfwLKA2MCQEH47xSGysb3zbA7/jjACPFGj6r5COeq+P9FKEbxj9d9xpWGCPOZaejf03Ke8HRafoZYNgFlxgPqhTOpzG5wmToRSwb1FpOxQJtpYrCJQN5Do7Qj79SC3DoHJbvbFK59T82uQbXIawj8Nn1r0G1uZDrlqA7z47G/3RntIsFE2S3ZX55UMPYyNwBVamozIwJhGNR+9XQeBB4bkvoIkoMKRxbmzahAU6NGuyQGrn3gPRZ/fcouu4Q+xBa7W6q1721k9Dp125VlaLf3W3+89tAQ8B5Vc6AAufTQ3S7NO4se/AMFC4/nfo2NCguZOUVTNBSlDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aj13novM4riB47bCBY2R2PipNytZiLpRWv+2WfKMgHI=;
 b=SofcJrf+vqiB8mAaraTaPHGw7lUlBFF7tqxw6Y2UiWI/wlkyKJiFHl9na3E5WbK5WpbDov0Tn+/FS26U61b2UA80vBCknNcS6DMa1Gf2sLqpNRywxJG3UzA/3wEoJMFfFjzRCiUG+HuKVWHJSxH2PQBXlJ0WVByJOlCfJjplYLekcAZ4RUfRik01bxM1WOdzEId6jZ1s5RBm8YdJnmSElh/h3xrRhpyLhZAEUqpEQWITqjXzpzEnb4SGCb4WQmeQ46ODr4sH85PLgXZgEFeoxSJx8/zkOLxsfzIdrVomXVKGPrMZfHspfEJNE8DV/wIUXN9ULf7P6fF2CQneBZ9n5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aj13novM4riB47bCBY2R2PipNytZiLpRWv+2WfKMgHI=;
 b=ITRISIoSawOv2Q66rHHvg7yN5Opl0RtWeS1KrHWbRq4F60iSl6P7XVmJiJYXj5eS1vLtBa4pPLuCHCHy4IKmY8+ZJZZN3cmFrCzIOpFWE1zS6yU6x76LCmDZWkt8uv9+aceaLBGtC7D4uZyyBbtnQoK8z2GOji66hbiAHH56n+YDdfWcGCpg4Vb+1gZ4TgOp19KZyHDNwhWRC7Dd+lEJfgxgYyi+Z57d00aCm/NEWf6Hc/Lv0inVhCYHCNNuyHnurQQi+6pDewpYPYVEp1J62MbJg8SWFdLxkE0dl16rjo/guLgG6OAWMvh95fBU50FXnE/x958hkN6CLN4mLBROtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from VI1PR03MB4973.eurprd03.prod.outlook.com (2603:10a6:803:c5::12)
 by DBAPR03MB6677.eurprd03.prod.outlook.com (2603:10a6:10:197::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Tue, 1 Nov
 2022 17:54:22 +0000
Received: from VI1PR03MB4973.eurprd03.prod.outlook.com
 ([fe80::3d5c:1e59:4df8:975d]) by VI1PR03MB4973.eurprd03.prod.outlook.com
 ([fe80::3d5c:1e59:4df8:975d%6]) with mapi id 15.20.5769.019; Tue, 1 Nov 2022
 17:54:22 +0000
Message-ID: <c4d27774-ec17-e171-6470-1730441b5b02@seco.com>
Date: Tue, 1 Nov 2022 13:54:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 6/6] u-boot: Rework signing to remove interdependencies
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 openembedded-core@lists.openembedded.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20221021233726.1751124-1-sean.anderson@seco.com>
 <20221021233726.1751124-7-sean.anderson@seco.com>
 <f8039bfc391404e83464c6894ce3ebf5496f1da1.camel@linuxfoundation.org>
 <dbd14d02-ad22-1036-d659-f71eb09a0e83@seco.com>
 <514b492351ff6be577b80881adbc6b508fc04071.camel@linuxfoundation.org>
 <b0708cba-a038-7031-58b0-c08ef0fe6625@seco.com>
 <1c053ef1a0c03728cb09f5259a1d52adc631460c.camel@linuxfoundation.org>
 <cf9846db-f142-e8bd-3fbc-51a430b5684d@seco.com>
 <3720dadc9a760c068eed340cd7877c92b6ffd482.camel@linuxfoundation.org>
 <3b106bb0-ecdb-efb1-1a54-7ad6ae345852@seco.com>
 <42bd04f74f012c2bf921c486087a6659c9534756.camel@linuxfoundation.org>
 <3eccb82e-73ac-1e79-8a99-0d6b3cc7839d@seco.com>
 <ea92c4e3fda1e06defc28532e8f0b1c7205e09c1.camel@linuxfoundation.org>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <ea92c4e3fda1e06defc28532e8f0b1c7205e09c1.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0135.namprd03.prod.outlook.com
 (2603:10b6:208:32e::20) To VI1PR03MB4973.eurprd03.prod.outlook.com
 (2603:10a6:803:c5::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR03MB4973:EE_|DBAPR03MB6677:EE_
X-MS-Office365-Filtering-Correlation-Id: 65ecadb1-b1c8-4b3c-efe2-08dabc321b51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	N5ilyveAGrJ83LJd4ig0Zeh1bdovRludn6D1svCY+X7crfSrW+v7JYdCRrktqdLl3LdZrvuc3g8zJN54OYQ6/Z5vJCWX+7xnpEyFKjGZNrjMNmsFzuzNKgRRbYO7bud1f/zBRauqEDf3t+EQKGjGiOUulEBf7BR8Ebt4FQ6BG6voNpdmahY9OCMBw4/rcZsyA8N9m1f8z/Ob1MKnKYm27/4170v+4kR2+AywD+S8B8E3arAGjwY9JsO0ZjummBDqRS5T1lUTvJTHCMT35RAOxjpUtK2HYhVoG/dHMqUH5PQLWKIReh9H599uNpUbACH1c+gzQtxqwHg1V63wVpet61HUwoumdkhqv1z5tZK0GL/diXpXDiW2JKVI2HigH52/F5B1tRUTJ7JwEHJvEf7At3fvqV2TtkX+Q6CFvNwNi7ZSLTSBz39iHxQfkmfGBXMLVS//hd8Ufc26tJnokdCLbUV4L/dTQIAq3pp4l3bW4TPLGf4QCqv5uEmnqzPkyIJGAEtL1IKjBRZOOpE8x115mapbywuQR3f1wwbdgAJswZBaKQ30d+gNkWx0KR1nKabS69cyMaa8dSKFkzU4Yj2KkpnP/+jmjwDSq3TLbasS8VTQeDubPQUpl4mGQtMo8sCa1R81+/vL+CJdbVRmt+6TI/oYpqUItXzM7BORRlXoDuaC5G7BZc/tS4zJrCnC4bQyfURHNGwZc93A3vgdra2AzNzD81lSav69l0O8dvpLTbpDVbJyXlSeSErDyVY0oRbKwq/8wN8KA0r3gucxFSvH8RDTsPfw5TBRrqMwTNq/uVcm3sT76REzZHjk8tK+ZvS3RvcX6BLFsWalI8YEddoBvvbHLFXsmi/rUahkyUyR7os=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4973.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(346002)(366004)(39830400003)(376002)(451199015)(186003)(36756003)(44832011)(8936002)(26005)(5660300002)(38100700002)(86362001)(38350700002)(41300700001)(6512007)(83380400001)(4001150100001)(2906002)(31696002)(2616005)(66946007)(478600001)(316002)(6916009)(31686004)(53546011)(54906003)(66556008)(6666004)(52116002)(4326008)(966005)(66476007)(6506007)(8676002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VkxNTVpiZU10RVhXdlpCQm94d0ZIaHc2QmxKQmZXQnBsVjI3NWFadnI5bk5M?=
 =?utf-8?B?bjQ2K0x4bGN0ZmNHc0NTLzF4ZEg4dTRITTZqWGdPRi9uSzdCMWFPQW9sRzhF?=
 =?utf-8?B?QStqekxmSUY0ODJOdEVHRVE4S25kV3dTRjJqSmZ4dXVmOTVqQzRnQTJvUEFk?=
 =?utf-8?B?cjdEQWY3L1Y4YWxzQ0ZGeFJ6VFRqR3doZUpYK3c4K0RhODZLb1V6S2RpZytC?=
 =?utf-8?B?UVUrZ05EZnEzUzVIMUJ3U3dEcTh3MWZFNzREbnFMWEVFNWhIRnZhZlA3bExo?=
 =?utf-8?B?SFpFS1QvOHpWRzhPeThlOHRZaWw1dkwrWFIzRzE1YnRFSG93QWxjKzFONUp2?=
 =?utf-8?B?YXQ3enk1MGIwODZ1RGd4Zytkd1l2MEZSN2xsVGVwTWJDTUxTOXhLL2NlZHpx?=
 =?utf-8?B?UlorOWhFVEh5NlM5RmNLKzljZzVkOEVwSDFab1hVT3NpMmlvYis0ZTVjSXZl?=
 =?utf-8?B?QkY5SnB3MFRIM3UwQzNnWllJQ2QrUE4zaUF5M3ZnVStDdXhTNlFRS2xuQUly?=
 =?utf-8?B?ZldSV2o0czdMSEpXMWtGOVcxOVE5QUowWVJDK0FnYmRZd2FoTVMzVkdUM2lQ?=
 =?utf-8?B?K282Tko2Ynl1UzhRUlJnK2c5VytSZEdFMHJHNTkvN0RVNUV6bkMvb3dlQjVP?=
 =?utf-8?B?ejVSVi9IbDR3aUJSNXJuSzk4c2Q2TjdjU0NTbWc5QkVHR0tDRXBNY2JoSXZo?=
 =?utf-8?B?OGRseWZHUG5XWWwrUy9Yd1htV0dpU01rL2JhUzdScW9FK2JOMStmZnE2cmpt?=
 =?utf-8?B?UFgwL216MkdZN2xleHBjQWQzMHZaUjZtYldvRHU1S0Q5MFFHWngyZ1djUnph?=
 =?utf-8?B?RGVySWRUeU9DS0FnTG1ZRDlwKzVvdVIrM08vWEQxVEVOOU1aVkpqOVZRci91?=
 =?utf-8?B?R2dqTGVtUEVkVjh1cmI0NVRQMUZITDdMYlJlTExrL1p0NHBISGorYkwzWTdJ?=
 =?utf-8?B?L0h6MjduMHR5UStjald5T3U0VGhURTUzRzRLKzRkNnJLdldHeXZ6a2NvaUI1?=
 =?utf-8?B?WXRDdDgrdldmUldQTWhqQmRJWW8rYzgwSWorcEM5cURPNFRpTUo1NUZSUHZr?=
 =?utf-8?B?UmpsN1FNczY4aVg5WFMrY3JUbDVCc2dzY1plbjltSjVmUWVsU0REQXl0TmdE?=
 =?utf-8?B?SFY2dktENlEzaFFlR1hXQWFWSUh3WVlTcmNvQWpzdVFTemdpTWRMdkFZL0Y1?=
 =?utf-8?B?MHhHS2tmdllpWnFpUXhBazUvZ2d1czVJL0dVNWdqVFh5NXJoSUJ4TXBZZFNw?=
 =?utf-8?B?ZkVabEljdlFQSkR0VS82QWkvUDJXN0h3RXJyUTNKbDV5MUtVaXhhemNsRkNy?=
 =?utf-8?B?VWhac3Z3d0Q5Vm5XWVhMK25EMUpabm43d2xHVjhZb0I3Z0dZdk9lWndON1A0?=
 =?utf-8?B?S2syZFJCc2FkNFZKMkZkMmY1Vk05ZTVJTGxudE5pdnVJWGZyZFJhR2hvK0dN?=
 =?utf-8?B?ald2eHdRQ1gwbWljcnhOQXdFNnAyVERwalh0K1dDQ1F3VXN4a2JsS3RRWTJO?=
 =?utf-8?B?cDhUQ3dxdS9FQ1JicGhuQ2RxTHFxcmdqSHdWOFpOWm1pdlhPOVNPWmd1RTU4?=
 =?utf-8?B?Qzk3dHRQeGVKY1VMUGZxZUtJcTd1aVJOOHM4c2RoWGVyTXZIZmxPUmpsalQv?=
 =?utf-8?B?bXYvUmp6ZHpNbFBiZ3YxWks4V3A3dDRCZHowMkJ1ZGVIdFNoeFhrd25rZTZk?=
 =?utf-8?B?QmQ4Q3VPdURKdVlHclNhMGFISmZaZ1J5TVg1SkRJazFRcVRza0dBOWo5Uyt4?=
 =?utf-8?B?QVdmUkM3enRyMjRoZkRUaU9wYmxYc0ZyTmwxZEhzbHpJZDhUVnZGZlVpRlVO?=
 =?utf-8?B?ejBXbzhWWE1QaHBZc0dkVytvMW40bFRsbEx2dXhEWGxaMEE1KzRWYmZwMkI4?=
 =?utf-8?B?VCtHRUFaK2F2cE9pVXozZUtXR21RL1hjQlJXSko1UmxYWlp4SVdEWkI0TG80?=
 =?utf-8?B?UkMyRHNMVlVBTHltbGdOM1Q4Z3lBTCtob2lKbGtLQW5QNGx2bjhQOEdDRVhj?=
 =?utf-8?B?OG1UQlBnbDRhSS9Nbm1DZTJWKzdNamt5dlhkckhVR2trUGovY1BUNkdaL21R?=
 =?utf-8?B?V3p5K0xOVVZoU3J4WFV2SHMyV1lrcnlvRkhBdWMwK2JoMjRlWjRGZEpCb045?=
 =?utf-8?B?T0hleVQwb2dHTmJ4a1g5bHlHMjJKOXZnaWdPSUI4bENLSTd2MDFQcXNKeEZL?=
 =?utf-8?B?aUE9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ecadb1-b1c8-4b3c-efe2-08dabc321b51
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4973.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 17:54:22.1275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZvYPF+VkpBbQUA4IcHUI00donu6nIPEPRDW1OS+LpskHR928y8RSGl/FusTfdAD73lCXLGVtD2ZXwgifX6QiHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6677
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 17:54:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172377

On 11/1/22 13:44, Richard Purdie wrote:
> On Tue, 2022-11-01 at 13:40 -0400, Sean Anderson wrote:
>> On 11/1/22 13:29, Richard Purdie wrote:
>> > On Tue, 2022-11-01 at 12:14 -0400, Sean Anderson wrote:
>> > > On 10/28/22 11:37, Richard Purdie wrote:
>> > > > On Fri, 2022-10-28 at 11:29 -0400, Sean Anderson wrote:
>> > > > > On 10/28/22 11:09, Richard Purdie wrote:
>> > > > > > On Wed, 2022-10-26 at 13:21 -0400, Sean Anderson wrote:
>> > > > > > > As noted in the cover letter, I ran
>> > > > > > > 
>> > > > > > > oe-selftest -r fitimage.FitImageTests
>> > > > > > 
>> > > > > > Ok, good. That at least means you were only running one class of tests.
>> > > > > > I was worried you were running all of them!
>> > > > > > 
>> > > > > > > I also tried using -j$(nproc), but I saw no increase in parallelism
>> > > > > > > outside of the usual for bitbake. This was especially noticable for
>> > > > > > > do_rootfs, which is single-threaded.
>> > > > > > 
>> > > > > > Sadly the parallelism works on a per test class basis so it wouldn't
>> > > > > > help in this case. There are only small marginal gains from running
>> > > > > > tests in individual build directories so we don't do that.
>> > > > > 
>> > > > > I estimate it could have saved me 2-3 minutes every build, since it could
>> > > > > have parallelized the root filesystem stuff.
>> > > > 
>> > > > On an initial run, it could have also ended up building a lot of pieces
>> > > > in parallel needlessly so it is all a bit of a compromise. It might be
>> > > > worth looking into whether we can make that an option, off by default.
>> > > > 
>> > > > > > > This is ommitted above, but I *had* to use -j1 in order to avoid
>> > > > > > > manually wiping out my existing build directory each time (and instead
>> > > > > > > ending up with dozens of pid-named directories). This is documented
>> > > > > > > nowhere, and I found it in some old IRC logs.
>> > > > > > 
>> > > > > > Parallelism using differently named build directories is an
>> > > > > > implementation detail, not something which the -j option implies.I
>> > > > > > guess you were also using --keep-builddir
>> > > > > 
>> > > > > Failing builds don't remove the test directory so you can inspect the build
>> > > > > output. As you might imagine, I had a lot of failing builds.
>> > > > 
>> > > > I'm very familiar with that myself, yes.
>> > > > 
>> > > > We did once used to reuse the build directory, that challenge is we
>> > > > have no idea what the user has done in there prior to the test so it
>> > > > potentially makes the test results potentially incorrect.
>> > > > 
>> > > > > > > > We haven't really had anyone try and optimise the tests either, I'm
>> > > > > > > > sure there will be things in there which can help. Please don't let the
>> > > > > > > > speed put you off trying to improve things and extend our coverage!
>> > > > > > > 
>> > > > > > > The poor speed of these self tests (and of everything related to the
>> > > > > > > yocto project in general) makes this project frustrating to contribute
>> > > > > > > to. It took me around 2 days to go from my prototype to this series,
>> > > > > > > most of which was spent waiting for tests to compile and losing whatever
>> > > > > > > train of thought I had. I probably went through perhaps 20 revisions. If
>> > > > > > > I was working on e.g. U-Boot, I could have made 20 revisions in 2 hours,
>> > > > > > > as it takes around 15 seconds to recompile it and run the full unit test
>> > > > > > > suite.
>> > > > > > > 
>> > > > > > > On the topic of these specific tests, part of the problem is that
>> > > > > > > do_rootfs is a bottleneck which takes around 45-60s on my system. Every
>> > > > > > > test which modifies something in the rootfs incurs this overhead.
>> > > > > > 
>> > > > > > For better or worse we've 'a few' more moving pieces than U-Boot.
>> > > > > > 
>> > > > > > Building a root filesystem from packages is a non-trivial task, taking
>> > > > > > under a minute is in some ways pretty good already. The only other
>> > > > > > thing we could do is incremental rootfs construction where it would
>> > > > > > add/remove changed packages. I'd worry that the result may not always
>> > > > > > be equal to a build from scratch and it might cause weird and
>> > > > > > interesting reproducibility problems (particularly when you consider
>> > > > > > things like postinsts).
>> > > > > > 
>> > > > > > I would love to improve our development "iteration" time but I'm
>> > > > > > struggling to see where we could get the speed gains from :(. Open to
>> > > > > > other ideas...
>> > > > > 
>> > > > > We don't have to build a full root filesystem. All of these tests just want
>> > > > > e.g. an initramfs. An empty (or one file) filesystem would work just as well.
>> > > > > If you still want to boot, you can make a busybox filesystem.
>> > > > 
>> > > > Could we update the test just to use an initramfs then?
>> > > > 
>> > > > I'm definitely a fan of keeping the tests as simple as we can whilst
>> > > > still testing what we need to test.
>> > > 
>> > > I can look into this, but I'd prefer to do it as a follow-up to this series.
>> > > 
>> > > I'll probably send a v2 later this week a fleshed-out commit message for patch
>> > > 5/6 (and with it possibly all those variables moved to a separate bbclass to
>> > > make it easier for other classes to create signed FITs).
>> > 
>> > The series did already merge so anything would be incremental
>> > improvements at this point!
>> 
>> Huh...
>> 
>> I really wish you guys sent thank-you messages when you merged something. Makes
>> it a lot easier to keep track of which series still need work.
> 
> That would result in a lot of messages on the mailing list and ends up
> being a lot of work for the maintainers as well.

If you use a tool like b4 [1] it can automatically generate a summary thank-you message.
As an example, [2]. This keeps the number of messages down and is not terribly
burdensome for maintainers (since it fits into the usual patch workflow),

You can set up something like pwbot [3], which integrates with patchwork
and your repository. It produces messages like [4] automatically when it
notices they have been merged into the repositiry, and marks them as
"Accepted" in patchwork. This is even lower effort for your maintainers.

--Sean

[1] https://git.kernel.org/pub/scm/utils/b4/b4.git
[2] https://lore.kernel.org/u-boot/164866411209.441601.3349958857188274518.b4-ty@gmail.com/
[3] https://korg.docs.kernel.org/patchwork/pwbot.html
[4] https://lore.kernel.org/netdev/166702502193.25217.18098583636278445187.git-patchwork-notify@kernel.org/

> Looking at the repository is accurate and you can see exactly what
> merged and when...

I don't pull from upstream very often. Usually I only do it when
upgrading releases, or when preparing a series. It's easy to miss when
your patches get applied. However, since review is via email, I make
sure to check that regularly so I don't miss anything.

--Sean


Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DCCBC433EF
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 11:43:00 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.86])
 by mx.groups.io with SMTP id smtpd.web09.6222.1648640577218563971
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 04:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=ML1a6j9w;
 spf=pass (domain: weidmueller.com, ip: 40.107.0.86,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+4uMlO6CGgqUm8Rx1pJocLtIA12vvmJcf+Pqx6fqlPyaCbLsbszYB8Gnyp2Vtny6fvsIfEvhHiuF4i5nEWmJymcYOaIrpywYFcyEFtJJRaOyIU8koVTnyLKLnr8iTI82dfnJ7rNvN8z41Ruv6M9oBzYRM/VdGm7ciTv+19ANsdS9d3bR/P4JbIc8LQwWfL0htJMuvbWliDS+dHDAvRYskAFxGrU2cSRJcWcbhRrRQsJff79cEJSVdn/bCJVJ3RwtEiEP9H5WDTvvvjK1ZEkdKv6OijpTWjTvko1ViocL+rVoX5+VcbbnmZ/o+sC4OjiArS0Br3sTHOZzYApyUIFJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVHILdJGL1V/BoF6xuUqdUYeCEfuGPRuFOqfVBaQHrY=;
 b=Jl0QnN7xBnHme5hn3+uRr+hneGSPIUz7lLLuYwMs5IchJ2B33MPrTsdBc1OOg/nBJe4GJzEit9J+DWuCxY3CIubHQns/4tQlciWyiMfBNIZ/dso3VxTd7k7646Y5daTH/eYP3l5jHHnrbDladIGk4rh2gsTL0I3kc3MQdON+FiMo9fhxbHb0h4zrkGgoj+gSzDirLSpAa8wOcRB+EpwjI1Pbznv02ig7m8ClEb3Gp306jFvWz7Yl36b45KOiYExj0kiLYMY3lBrTAlKqA0V5VjLKKhqol+W8U2VHrTX2VWMb5+2hLytBqcVDWLcw+cfx6TnKCZo3Q1ovpHwzorTyaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVHILdJGL1V/BoF6xuUqdUYeCEfuGPRuFOqfVBaQHrY=;
 b=ML1a6j9wmXEoQrOZZPAG8pnj4VNNFKzGMsNEifrlX9hJyqvQ/GOFrKuDbcffRipUlqXvC3BA8FeuRR4abJsD3jXxvKUgrErrZrwtABsbMq8VyVBcs4tYrn91IW3mgobfols12wvdn3MUuN1ZwSpG7R8znlY6JSwvu/RNDV5tOp0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by VI1PR08MB5358.eurprd08.prod.outlook.com (2603:10a6:803:13c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Wed, 30 Mar
 2022 11:42:52 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::21c3:3ec0:a144:68ba]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::21c3:3ec0:a144:68ba%9]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 11:42:52 +0000
Message-ID: <192b477d-bac4-0c02-2345-74d2c3dbde28@weidmueller.com>
Date: Wed, 30 Mar 2022 13:42:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] [RFC PATCH] bitbake.conf: Add base package version
 (BPV) variable
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: 
 <20220330081614.12772-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CANNYZj_AH8pTcynXzUurmoY15y4yLo8o1V2GjAQEAHkwV-7L9w@mail.gmail.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <CANNYZj_AH8pTcynXzUurmoY15y4yLo8o1V2GjAQEAHkwV-7L9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0012.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::12) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a7c3211-5700-4fea-e489-08da12426c96
X-MS-TrafficTypeDiagnostic: VI1PR08MB5358:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB53588D83F5D2ED329CFA8362D71F9@VI1PR08MB5358.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EGTiDVPwJBnYrZbvi2BnBW8FsO4Q1lxs02+Jms5imavXQVGZzQ29ESwqGtGR+H8smW6OlnAmij4lzP7tmB949JvMmPfB+whkyq8BOt5TS5aKCAh9VQLk329RGJy6nGBNdaOEbkUHlT0rzYQhlO1m0H79V0Q3RY3JYEAVihzTDADeRW/lmBxDSN0KMjcVW5evHFvo8pIoJxHyWIvmqI2v7GOMcEwnH+25N6GopVlhp7n2q92mPYzvD2TUuNmGfC2dSxTuDYPfINQ+gn6aGIZlZhjqobjAYNIwVOOi8WYFlCveHHHrdgt3FdW+tDKo7+3IogGuxA2lKsySgMeRu5fZllZYTLUO6cr+hid9jMzH3SzlRc3P7Vo0GWySmNU9pY7jjPOVQSk3z3mftc8AQGp5ytS99u7aItJ9sjQmCPQR8Dwnal5BSfSq98pHd/+GWR/oLWTsQyGF0RzAgwskVkOQ8mqay5lsOj7x+1L/r/uIKhRh/yOcDdjbLmH/49jp4iSRS5MzJQREf3MjLbmT0RGVongNzJ3qVOx3IYgxA4bapY1uWE0WunCVx7T0+yxAdI6jmqLZk4+qFEyEWgBI3EVpVAVoFCPPSNpADQQnFeSgWiiZAuTITGizOSPrIPovhRUP+N+8+DX3QUA77Ka9VIs+acKB1M7Sjc+TPKRNyJ/oYU1gCrowwBTU6s4/zzK6m5d/VJTnf//PRiQzqPCnKUpnGCQq8MphpGRWblyTnVevoccuXqxfxhUR/Kzv/oumD/8YboMaVLMIF9QCNGBwmcCzsPJlz8jhZMhcguAjZBOJTS5p9xO6FK5UorPo9nWshewy08km2caCsW0/yzFlgJMOhg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(83380400001)(26005)(5660300002)(186003)(6506007)(2616005)(52116002)(8936002)(6512007)(31686004)(107886003)(36756003)(31696002)(86362001)(2906002)(316002)(966005)(6916009)(66476007)(54906003)(8676002)(4326008)(66946007)(38350700002)(38100700002)(66556008)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eXBIWHMrZkFYM2xoSitvVUtBWWg4ZVR0NmlKSENkQThncUxjS3VLaFZYajJa?=
 =?utf-8?B?YkUwWkMvVGZzUWtTeFFaV0NSU09PUCtQbGwxM1RVUWg2Z3V0Tk5zRkVxVmZO?=
 =?utf-8?B?QkJXKzYraHFJYmthOVRLRU0rOGlUeVNZanV3UlQ1S2lnTFBFVlFKZEtpTm1m?=
 =?utf-8?B?WER4QVBaa214a3VTcDVTeVpIUFA3ZW0xWkp5VHpHamFSRGNWY0U4bDJoNllJ?=
 =?utf-8?B?RTFMV0J4QzlycEJOS2hXQUJMN0p0bENJdktnRUIvRE9UbFQvRDAydS9FS2p5?=
 =?utf-8?B?eDhLSG5ITzJ2SWJEeG9LTkJXdk1Jd1NCU2ludksrRzY0VE5DREZhSHNialpz?=
 =?utf-8?B?OXVKQXFGa3FScVNoWitnNTZwSmx0SE1NcVRjSmVmeXNhZHdJNFd6YVJ5cWNS?=
 =?utf-8?B?YlpsMkg5d0ROem04dU5hTEdMMzF3NU5GRjNuaFJjeDdJenVSd2lvVEswUHV5?=
 =?utf-8?B?ZmhnR2RFais0S0FLZFZQUEo2NmxiZFhTakUveGR0K056aFZBSWNzbTFUVGJN?=
 =?utf-8?B?SXREWUd0U2RENlBycXZHV2tRSnNMUS9BRlBQN2ZtZ3U2S2VldkthZ0xzRmUw?=
 =?utf-8?B?bnVLejhXUGZMelZhWDdqa21BZ1l3aTExbjdGYjJNOVpaVFExWUhpNlQ4S1oz?=
 =?utf-8?B?djhUMld5VjJpbHQvVzN2UnRzenpBMERFV0tvME51Q0VMZHF5M1VnYmV2Q1c3?=
 =?utf-8?B?Y0ZpWmJjSko2ZjQ0SHY4VUxtVjNFZnE2R0NvODA4MGJqMGdxUmtXZUdNa1Nm?=
 =?utf-8?B?L2dqUWtkUnhITm1TNlY2bFBaMXhuQjVDWFhKZUtoazBXbEE0MEoxc0dkUHd2?=
 =?utf-8?B?V1hoblgyYlZFWUZxMVc2YXRKaVlvZHZSbE1WeTB2UG5lQVFaSVJvQ1dGaldQ?=
 =?utf-8?B?cjNpVUFacVNjSFViUTVXYzNobUYyRlJCUURCS0QxQkVhbG9SWmhhaTdhZVFx?=
 =?utf-8?B?M2lhWkdZbU9QUlRCREVwaHVyRk41STg3OGJBSlo3SEYydEx2QUdsNjhNQW9R?=
 =?utf-8?B?R0VPWFFINHhtdlI2a0pERGl1N0lMY1JLQjFCS3JKSU1lUlRFRnF1UXI4NzNk?=
 =?utf-8?B?enl1OHdubjFOcHVmVWJtWEg5SFZBUmkyOFZ1YSt3QUtDMGhPSWJrL28xUHg4?=
 =?utf-8?B?TU5zajNPWUpXMnNaNzF4akkvN3B0a0Z1MVNUZENmdHZ3bkdnQ2taVFRoaUQy?=
 =?utf-8?B?ZmkvMnVSc21JK0ZNdEozWkMxWlRNbkoxeGlGNU9vMlBPbU0vQlN5Rmtxdkdq?=
 =?utf-8?B?T1JtVzZyd0tJbklCdTFsQlo0TnpyYS92V2locFMySkdlcmVLd2RtRVUvS2E4?=
 =?utf-8?B?K0hDeS9sT0tacyswdGlzSGdCQ0lNZW1JTmEyU0x1K0JzaTBjaXREOVVwd2w5?=
 =?utf-8?B?VjNFcDA4aVdHMmhyM3NtdWFscG9QWWRPU2t4bmVnUEZZVkpwZ01JMlZVdCsw?=
 =?utf-8?B?MDRzRmpOcnhlWXh2Z1RxRXNSb2MyWUxxa1hreDJUOEZWUWMzamRVY2Jxb3h4?=
 =?utf-8?B?MFdqUTk1S29jaEF3OVRxM2NXR2RQamtpV2J0UlBtODErdVBKWFk2QXdGNnRN?=
 =?utf-8?B?N1RuVlBaekxUQXZEMklkYlFONVpKMGprSGNIYnRCcSt0a3FzNEkzS1BwYWxt?=
 =?utf-8?B?aFAzdFZtZEFvSXhQZGM3a1V1amUweHhlcnNXMjU2VDcrZnpqcDh3WTdmOGpi?=
 =?utf-8?B?U1l2QnRJYkFoQ1dDMEJJRkhUUFM4dklOS3dkNTUyOGFqQXFMRXptSy9LM2RH?=
 =?utf-8?B?OC94Q2lhaFUxTXhUNHRrd2pWM0xRRjBoRFh5OGd0QnVDdFpjQ25WTmNjd1oy?=
 =?utf-8?B?aDUwS1ppd2liZlR0TXBoUU1wQlhDR0wrU0Z4TjNvb25FQUkwYncyakMrZTMy?=
 =?utf-8?B?c1hwbG5QUzB3RWVIM29tQ1ZscmpLYzR6UnpKM2ZLcytLTGdEdkdVM2ZOcVlB?=
 =?utf-8?B?dTRnN2hXUll6OHpLOTJObkpVcFZTMEVxZm9pd25YTU9GWDY4VGUvZk5jblpz?=
 =?utf-8?B?TE1qSlR0TzhGS2lzN1QzYXBiaGZ5OEZSRWp4Rnp0ZnNrZVhqK09SMlEvY2Jl?=
 =?utf-8?B?eVBaeUt1NjNaWDdNVUxMQklsclpIUm9PYk5VZ2ZHajRTSXpQS1hieWJHTEpj?=
 =?utf-8?B?YUNMQm9WbU1rQWZXNjdORTJmM0U3VHgxUFhSVlFHaEFZZXhwa0RCR1dKR0Zv?=
 =?utf-8?B?VG5YQkUyWExuOHBrTXhBSDBLK25KQ2RIalNvNko0Smh3VFI2L3Y4THRLK3ZP?=
 =?utf-8?B?bjdqTVdFK3Q2Ujl6dXZ3blJwVExxc2hyNWs0dld6SHBzMXdCUkgyWklubG1V?=
 =?utf-8?B?c2I3UjJjdjZ1OFNDYkZ4WDd3YjZoNDVJYS9GMXA2NWM2R0lkRi95dFhMaHp5?=
 =?utf-8?Q?v6M64j4QxMdLnbAA=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9a7c3211-5700-4fea-e489-08da12426c96
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 11:42:52.6891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XeBvj9w0Tuq5FMHlH1PHtzPB0ir2n64h0cZETeUjucbe/syaJ/x6dS/6/RvKPOv3AtFbiej5BfWP8FUGpvgz5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5358
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 11:43:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163782

Hi Alex,

Am 30.03.2022 um 10:41 schrieb Alexander Kanavin:
> Mangling PV is more flexibly done with a lambda function in the
> recipe, where you can trim and tweak PV to your heart's desire, e.g.
> gnomebase.bbclass:
> 
> def gnome_verdir(v):
>      return ".".join(v.split(".")[:-1])
> 
> SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive"

What is the intention of your comment? Do you recommend a function per 
recipe and thereby code duplication?

Or is your objection that the base package version isn't always the file 
name version and the variable name is wrong?

The advantage of the BPV is that you can change the PV outside of the 
recipe file:

PV:pn-<package_name> = "${BPV}+git${SRCPV}"

The `PV .= "+git${SRCPV}"` assume that the PV is the base package 
version but couldn't ensure it.

Regards
   Stefan

> On Wed, 30 Mar 2022 at 10:16, Stefan Herbrechtsmeier
> <stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
>>
>> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>
>> Add a base package version (BPV) variable and use it as default for the
>> package version (PV) variable. The BPV variable contains the base
>> package version of the recipe read from the recipe filename.
>>
>> The base package version variable supports an expansion of the version
>> from the recipe filename without the need of an immediate variable
>> expansion:
>>      PV = "${BPV}+git${SRCPV}"
>>
>> It allows the inclusion of include files inside a recipe file with the
>> same version in the recipe and include filename even if the package
>> version is different to the base package version in the filename:
>>      require linux-yocto-${BPV}.inc
>>
>> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>
>> ---
>>
>>   meta/conf/bitbake.conf | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 7705415a4f..d56cf811ba 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -232,7 +232,8 @@ ASSUME_PROVIDED = "\
>>   ##################################################################
>>
>>   PN = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[0] or 'defaultpkgname'}"
>> -PV = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[1] or '1.0'}"
>> +BPV = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[1] or '1.0'}"
>> +PV = "${BPV}"
>>   PR = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[2] or 'r0'}"
>>   PE = ""
>>   PF = "${PN}-${EXTENDPE}${PV}-${PR}"
>> --
>> 2.30.2
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#163774): https://lists.openembedded.org/g/openembedded-core/message/163774
>> Mute This Topic: https://lists.openembedded.org/mt/90127138/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


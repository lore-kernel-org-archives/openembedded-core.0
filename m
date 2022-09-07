Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF9C6C38145
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 09:28:13 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.61])
 by mx.groups.io with SMTP id smtpd.web08.5732.1662542890742768273
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 02:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=KaXlWPkM;
 spf=pass (domain: vaisala.com, ip: 40.107.22.61,
 mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bzl1Va4zSKKjR3MPDcQQbZNHzdt9Fuz2gpG6tDMbHFb/zhYxkIYm07NJ0b9vFh0aUDJPB6bdBU12oN6yqjMDxzllJFNBxrjGad0eqn73v8sqL/whI2G+JSVNBIqAWVlxlKx+tYGDQEM1C9KIPyaC8o3CMo889wMqiyocGWiNjVyBxLuZs1nXwBb10/o+4JPckrtXLI405pHd1NlekLsGmkejBqFHrMv1ylYktHeeX+Ij7FMIZ0JSamFfXt8OoYloi1S7pYaprHYwRo4KAkNPpLzZUMRfguYkZsRuT8RQCgf7ClZMedQzSD9L1/splkO+X/TZBTNTbl6Eq8IxrWz7Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAtz1xC9ng3vaP8AsnxxhVIJcYz8Sd00VrkArdWl/t4=;
 b=mz5v1YvTh2/pMsADjdhJrQ0Joq5SaST+3E+HqwovZqhhIfryg3v2QU4viAhuRO2GI/YecCsLQKVqNwhdWUKB8Zd1y5Fr4zM+F8Un3uNGS1dlpSfaRmj6IkZ58l0ZFU6uzM70sIHa9DGNGVsEAP0EhwdPVi/N2AoraQI6uobC8EIOo50Z78O0G0IgOw5yqhe3v/XI+UxHq3aMx3RHkC+VYwrjyp18iuXFMzCIGfTslBlm53t13EyoYYlpTWjJRJj/ZuSPGDlqDqUZOtgkBcMQH8HBAjdN5FVHB+NPn6fYbjd2XfjGBh29g0OIxL+dCw2EbQek6mGgZgS8jAIvceLMqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAtz1xC9ng3vaP8AsnxxhVIJcYz8Sd00VrkArdWl/t4=;
 b=KaXlWPkM05yz99LO3o63Fa4s/ApxtderqnQgXrFBanYEIgbYnZ5romAcyGLJoW3bJq6cd6aakhF0TFskar28v3RTkCZBRwGtc/4ZEcMlarHtptBfTp98gOuXCecbbPATUIp2m62yOaOYnLrk/qjnBhqN3wP8W0UNXNE+HmJb1oaNnlHa+UAfWhYLZY7HRm7rOhALrvHge7iu0ZutQM8+prZzQ2f/3fFYhttHfIYpOxFqvDCMBjbdW5rR6t62yCmmNUCrbdwWHaHlxK+48W/H/uk9SHPKMuGHjCx89onFkshbqzRdSYmhWcvS0H+JT3XW+qiraBCxR4SKhw4Qn0GTQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com (2603:10a6:102:2b3::22)
 by AM8PR06MB7698.eurprd06.prod.outlook.com (2603:10a6:20b:356::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Wed, 7 Sep
 2022 09:28:07 +0000
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::4d86:9fbd:8bb1:3030]) by PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::4d86:9fbd:8bb1:3030%3]) with mapi id 15.20.5588.010; Wed, 7 Sep 2022
 09:28:07 +0000
Message-ID: <9de9c193-56b7-da1e-f4f9-d43a111de0f1@vaisala.com>
Date: Wed, 7 Sep 2022 12:28:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [OE-core] [PATCH] systemd: Add 'default-dns-fallback'
 PACKAGECONFIG option
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20220907071155.2807336-1-niko.mauno@vaisala.com>
 <CANNYZj-8LsBC3B0ubeGXfKY4bVS8==-x=SQc60DhXY3N13u-Tw@mail.gmail.com>
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: 
 <CANNYZj-8LsBC3B0ubeGXfKY4bVS8==-x=SQc60DhXY3N13u-Tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0088.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::19) To PAXPR06MB8579.eurprd06.prod.outlook.com
 (2603:10a6:102:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0cea13b4-20d5-4ac6-882a-08da90b345f1
X-MS-TrafficTypeDiagnostic: AM8PR06MB7698:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mYpg4gOFZgu7TQO57j6ESW4who89+3A3EiXBH4mqIUTZE3JZc+C87Y41KGkDX2SAMFvdmCG/x+NsUkA5QmyBlD4tlRWYHt90+9jV+QbGb5qcOs1JT8DXcFPMj1FzsT5MwyqyFCKfScXeIcnlfNspzRZYiW5r3f/pqhBw3FjwIjODqnkQCclJykFWw9MZrI7NRuquiGPJcJZVIzaaHNCS+uVyx0fgRmZZeXsT+DtJiSlw2W69OW65Adt70iDquM/pDOnN/aerf9leqwsf9bXPR+DVlV/RGVZm8gLRX8Xx/JqkZnaoPkMcgKQlBZr7EQAqL2iy6AqVajLeemUe3asse0Q0N+X5/pTFks171yMdMB84nXLSeF695PKV5l8qfYxoPd/9kdApbOyTrU851cG25aVfDJzZjHdDgGN47Zg5f+aG9CduygASwhNjm3k/Wt0UJk7Jts5kEYAV9Ft6yOGUG1hqAbG7jcqlUqkS8mtqb8qz2McyE5DRpWpctTXshL6FV0z41hk6K8eEwIP6XA8MejGI37ZLVzI5xdr8639umvDi2Gl1jIBCCNkmTIp5HNon+N4rE93LqL8MnjXrJES/bYLF+x8N7qvytqsF14HvNOoIGl4lAPIFFAdWiCoBBX8crrRXsse9lPnjAmVEK1uSX7g2yu3NijJMGUc4y4jVJqBRUHtcx3myoip5W8XKpJ4OJH86EiwMr7yQzjgJSupCptMwCx5q0Z0vLHtlEhKcKxMUMWZMMMrQReOBiesOuxVkj949eH+tHSeQX7B5YFhtXX89oTQ1IvTD/+kUK+W7c/qwLtgm1wGTo7lvt2KJhI625GH+YuGIizmsjobAERQWbNUKBSMR3Y5C3bTaDtAkNHI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB8579.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(38100700002)(8676002)(66476007)(66946007)(316002)(66556008)(4326008)(6916009)(2906002)(44832011)(5660300002)(26005)(6512007)(83380400001)(186003)(966005)(6486002)(2616005)(8936002)(478600001)(41300700001)(6506007)(86362001)(31686004)(36756003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OHVTTWNsbTlJbWhDVFFpQnJEMlgydkZ0eUtrbDRkQmQ1QXNaODJHV0NQN2tD?=
 =?utf-8?B?OW1Ud2FZN1JNbkxzbVErRzBBOHo3ejcrdkNVVlNpd2daUUxod1R5amNKOXJ1?=
 =?utf-8?B?MGFRQW1WTFZ1dEdTODFJVEI0THVoUkhwaHBscnB3YzRvU0gyWHNmNzdZWFRp?=
 =?utf-8?B?SFFjYUxBN2RKODZnVHJGSno2R3hNOXhIcU9yWDhZYkVsdUJ3SXR3TUJjbmRC?=
 =?utf-8?B?b25KempLY2t3ZW13SGpRRUtQaWlVTEhDRitTeHc4KzBpRVJ3WDRCeldJMlo3?=
 =?utf-8?B?NTJhZnhYeDQvN1FXN3llb0Mxd3RRMm1uMVIyL1BBaFZ5ZGRsMGxScitHYkZH?=
 =?utf-8?B?S05KVHlNOFM3OVJ1OUdraUZCajlwRjNVL1FabjdqUnc0MUhRd0UyUTV5ZS90?=
 =?utf-8?B?eFgvNFhDc01tRUlGbk9JRG54YXNWS1JDR25aTTIzSFhCVGxIMDZVV0VxbU15?=
 =?utf-8?B?QnM4Z1VZZFVWdndvNUFvS0N3cVFzbGVYR3l3VXd4SmxLeDRqOFFJd1ljZTV2?=
 =?utf-8?B?TFlPOHlvcGExSTBDWXNaRnRWUjRzMkpLRmhOYU5FK3dOUTJmVDNTWENqeFJm?=
 =?utf-8?B?cGw4azlOL3c2Zm9weU9sYU91TzR2ODIwZDFXSnRtaUZOR092Z3cycEVkTzZu?=
 =?utf-8?B?Y082UUdKaXY4cTVvRE9XVTRqbDVLOHhYNmVJL0I3M1RIak1sY0xrTmlnMThI?=
 =?utf-8?B?TGJRd2J0OFVEb2t0N1RhbFh5ejl4a3h2UEd5UHJJUmJSQ0lGT2kvODlWSGM1?=
 =?utf-8?B?Y3Y3RUZWNUQ2YTh2KzBXN1FYK0NtazlvMzhZMG1vUlJiNGFSRHlQU3k2bnRJ?=
 =?utf-8?B?TDF3SHBvT08reVNpeWU1QXR5Zkd2c3ptSXN5RzhnTFNhclVFTzJscm1TZSsx?=
 =?utf-8?B?cnRPT0hZME95M2dEV1h0Tk5sYUt4ZXNPb1Fjb292YXBraE4vMDZEVDlNQnVK?=
 =?utf-8?B?bHd1aTVHdUFlZkUzZDJVVWp4di9zRUhIamp5aVA2RTRSbjhoR29JMEU3S1pa?=
 =?utf-8?B?ZUNpSE1zNlFwRGEreVJQM2NCTnliQ3BBUEs5QndzanNaSEpqREJmaEFNOHlS?=
 =?utf-8?B?NEZaSzE4YVNjcmtIU0ZrTmpUV0ZYak1zV2lxNFBZaEdSNnhVdjNPeXJuYUFl?=
 =?utf-8?B?eVZFYXBSZzFhbTFDdTNhSEFuemhOTXh5bzgzY0lGeGt6Z0dETTAyZDYwZ0Vo?=
 =?utf-8?B?Y2ViZ3ZrakNraTlTdmppU2xuNFZndHE4eEozY2NCNnVYNlN0SXFHUktIYm5o?=
 =?utf-8?B?dnNCNGtUQkNoTFpsZzg4NVNWSktRZ0xjTkdXZG1kRE1RMnRyQXFxNk1MNlpw?=
 =?utf-8?B?UWpWUk96YldEa1ZWYVpST0tVbElSR2ZlckM3WHFDeVI1aFhaaitpRWtUK3F1?=
 =?utf-8?B?T0xoWmNNY3Exdk1oWmVoSEo5dmFaZXY3QVBKWnpvVVhmc1A2cjhDL1I4cFNM?=
 =?utf-8?B?U2dVQ2dLKzgrREJGRG9oOWFyZWpxdWVuaEpxZE90V1VlL2lDdi8yZlV2SU5j?=
 =?utf-8?B?a2ErNVBPUVB6SE9PSTQ0ZjlBaXEydmpYbm9pWnNZeUFrdGord3RzOFhhbkRj?=
 =?utf-8?B?V2RDcDhWdzN6eE0rNm5DYXl3NUFtNXRVUkVTdy9xeVJVSGxROGdiNWJsbjdN?=
 =?utf-8?B?Q1NWNk9lRDVwNzVINkgzeFg4a2RLMGI5MExmTjd1YzMwUUdrRS9IeXB1QkRq?=
 =?utf-8?B?azVPYmN0ZlRuNEZ3aHgvMW1GQm5yb20zY1h0Vit2R3l3cVZBUFBUUmV3UlIv?=
 =?utf-8?B?UTJ3Q3RBazdMZ1dlZGQ5TGZ5aG9hK0RQMDZ2SzlpbjFYTCs0ZlNjcEw1VXpO?=
 =?utf-8?B?eTJ4UjdEOUpkdHlET003eDNBc2w0ZCtmVlpDMS83ekEzZkprbjFBR3crSXMw?=
 =?utf-8?B?Tjc0czNldERWb2UyOGZTMnM5UDRPdTc5ZHM4cTcxYzVEeWNXZE4wMFpibGVE?=
 =?utf-8?B?b1JURHVZclpSWHVrNHR4WkUvTWc1Z3krRVp3TjFacC90SlBvbHVjKzVmMWxD?=
 =?utf-8?B?WWFOVllHZU9JVG5SZjhxUXdyeGQ1eFdTV1FDOVdTQlI2eExUVmZyNklvWTQ0?=
 =?utf-8?B?YSt0bGJuWitlTkdJSmhOOUczaVk4RTFpY0JLZFg2SWRHQ1dYQlhzYVRzNGwr?=
 =?utf-8?B?V0JGcXRhNFBWWENMVXVVK1MzYkxGSkRrc2xDTTBPU0JBTGpGRXRMcDM5MWFJ?=
 =?utf-8?B?YWc9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0cea13b4-20d5-4ac6-882a-08da90b345f1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8579.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 09:28:07.4911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 URhQCMlNpEObvBtRm1qO98x+3+lKUita6DDF8t8YiFEveQxLHpRN2nwviS3L+TNQwDNDXdGueBp8ftJgO2RyNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7698
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 09:28:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170381

Thanks, felt ambiguous first about using negation.
Fixed in v3: 
https://patchwork.yoctoproject.org/project/oe-core/patch/20220907092333.3248421-1-niko.mauno@vaisala.com/

-Niko

On 7.9.2022 10.26, Alexander Kanavin wrote:
> I would rather invert this, and define 'no-dns-fallback', off by default.
> 
> Alex
> 
> On Wed, 7 Sept 2022 at 09:12, niko.mauno@vaisala.com via
> lists.openembedded.org <niko.mauno=vaisala.com@lists.openembedded.org>
> wrote:
>>
>> systemd defines a default set of fallback DNS servers in
>> https://github.com/systemd/systemd/blob/v251/meson_options.txt#L328-L330
>>
>> By adding a PACKAGECONFIG knob providing a convenient way to opt out,
>> and then removing that value from systemd's PACKAGECONFIG, the output
>> from runtime 'resolvectl status' command no longer contains the
>> following line:
>>
>>    Fallback DNS Servers: 1.1.1.1#cloudflare-dns.com 8.8.8.8#dns.google 1.0.0.1#cloudflare-dns.com 8.8.4.4#dns.google 2606:4700:4700::1111#cloudflare-dns.com 2001:4860:4860::8888#dns.google 2606:4700:4700::1001#cloudflare-dns.com 2001:4860:4860::8844#dns.google
>>
>> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
>> ---
>>   meta/recipes-core/systemd/systemd_251.4.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_251.4.bb b/meta/recipes-core/systemd/systemd_251.4.bb
>> index 8497e24af9..0f30b7dbb3 100644
>> --- a/meta/recipes-core/systemd/systemd_251.4.bb
>> +++ b/meta/recipes-core/systemd/systemd_251.4.bb
>> @@ -64,6 +64,7 @@ PACKAGECONFIG ??= " \
>>       ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', 'link-udev-shared', d)} \
>>       backlight \
>>       binfmt \
>> +    default-dns-fallback \
>>       gshadow \
>>       hibernate \
>>       hostnamed \
>> @@ -129,6 +130,7 @@ PACKAGECONFIG[coredump] = "-Dcoredump=true,-Dcoredump=false"
>>   PACKAGECONFIG[cryptsetup] = "-Dlibcryptsetup=true,-Dlibcryptsetup=false,cryptsetup,,cryptsetup"
>>   PACKAGECONFIG[tpm2] = "-Dtpm2=true,-Dtpm2=false,tpm2-tss,tpm2-tss libtss2 libtss2-tcti-device"
>>   PACKAGECONFIG[dbus] = "-Ddbus=true,-Ddbus=false,dbus"
>> +PACKAGECONFIG[default-dns-fallback] = ",-Ddns-servers="
>>   PACKAGECONFIG[efi] = "-Defi=true,-Defi=false"
>>   PACKAGECONFIG[gnu-efi] = "-Dgnu-efi=true -Defi-libdir=${STAGING_LIBDIR} -Defi-includedir=${STAGING_INCDIR}/efi,-Dgnu-efi=false,gnu-efi"
>>   PACKAGECONFIG[elfutils] = "-Delfutils=true,-Delfutils=false,elfutils"
>> --
>> 2.35.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#170370): https://lists.openembedded.org/g/openembedded-core/message/170370
>> Mute This Topic: https://lists.openembedded.org/mt/93520181/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


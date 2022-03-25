Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DEBEC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 10:55:10 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.86])
 by mx.groups.io with SMTP id smtpd.web12.3737.1648205706632199487
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 03:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=eScY46Sj;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.86,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTAJ9snYJaAyDRR0yAlAFzM/O2TCceOZRsd1hgvHMiyYyOIP6PBGMHggfhWBxSB8E6i7w/HJHTOv2ekfQwVqwA0wZCR6gQSDtmBFnFxuxdZBjqEHZrExzuSH5VjdceMtAhUs/527FCEkj0Jr/iL0omonbmLIeCFGEUMU/1P8NJlENm1Y7jpIlr1UXwNF/8RASWFJ1FXvqi2K04tyvgOd4N/lshP/4LrBSNmt96IpnRl2K+07GdN4o1i+NAgN5IMXKe1q5dw3vM6eEqynyadBFul9MsfJ9i5qEubJlW2tdUQ5+YsnCEgOH6Eikt+M77CRxis/XsJOj0LT9HKUePHy2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0E8x5fe/6mASfWCRhZ2KgZfUIaEXA24BgFgxedcsZM=;
 b=SQIQhdyNPqE+3f6yPMRh7Ca1m6NBMjdMOc+8t4y7+3UA9Q4JZtvD2bhpcHTbOeZqKV8VUfy8HGv3KyrdFp4gvBh28m4ConLNYZT64w0EuFkTMM/+89yOJ03e3pbYVHyTYsxdBSXU5S4PQFAjOrrE2Wa8ZeolNYcDzBiaXTtraz5AMBMmT6twPSM1CXTWexBo6UUnb8PKXX3mzmCsvA7fBbBYJqo3ScuuxnjuRrYNSSeFgkEQtwLy4E90T5MjJsOLGvz3WfsQLeTIjbDxbwRq7opOAKM2fzQbX/Yfy/UCio7F3AzwiyJNsLjkQvP/zWjxMImlVgRNgtIXpHrbXKXR4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0E8x5fe/6mASfWCRhZ2KgZfUIaEXA24BgFgxedcsZM=;
 b=eScY46SjMGDhIdOmwvVdW+clZIYGl/sAWk54KfeTdy49ZsiB/6rXPJl2pBUeCaXklBSUFN1rKirlHMP8FLFtygz5am78uMwIsAP/GXoOOJZhQpcoDImuJ089cibocVoLK5aldQh960kX80FeIwl9bpqLwgWyqRd/8Wj1iiMJqDQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by DB6PR0801MB2053.eurprd08.prod.outlook.com (2603:10a6:4:76::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Fri, 25 Mar
 2022 10:55:03 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::21c3:3ec0:a144:68ba]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::21c3:3ec0:a144:68ba%7]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 10:55:02 +0000
Message-ID: <dc83c9e8-cac5-ac7c-089c-a8afa51cac17@weidmueller.com>
Date: Fri, 25 Mar 2022 11:54:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] [PATCH] zstd: add libzstd package to minimize runtime
 dependencies
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20220325101831.1451-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CANNYZj9htpDkynv-8hcJPA_MU18TtH83bbu_e15rG37z_+RfnQ@mail.gmail.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <CANNYZj9htpDkynv-8hcJPA_MU18TtH83bbu_e15rG37z_+RfnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0352.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::15) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa36cb05-1ee4-4b80-eeb5-08da0e4de9eb
X-MS-TrafficTypeDiagnostic: DB6PR0801MB2053:EE_
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB20536F72D0E8491330F8E8FBD71A9@DB6PR0801MB2053.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3yUzyc9OFD4Emew9zmeZj/tenD7noXdfngUfSFSP/+8GraGNr4UicI/BsDcSWvjiAgfEYBDxmBebfe9eWlZCDZbbtimxhkS8Ca4hLb19opTt33JgNsI/DTd8Tjz3sglrbvGwjvxSJlet+lkL5AO19SU8bIbDKCfd3+zM6rO4oTPVvmVTLNQEvUrb36dEzUWCUXzTam9sxMkQGUFn0HjDuD5RGC9ggDFD5MidK0R1QNoQHq8lOJUUH5lGioRoE2dkVez/mOspO+04/mWWsx/w0FP+PpRiLGZ8J/Ly6Qbv7Ba76BGoN/mhaNGqKdyZ/cSem/3gYD/JHnak0IEDNV9G9e5WIbMZB86OfUf91uouDL13QkXijHtLZP/kAUeOKk88283jtMd3JZ7kkUHdp5bzh9L34Fcz4y8Wa+k/R7XIlvG+9LoaM2hAOaBBTvSDibEaNX1iIlTM+SAt/Gwt+ZcTZ9VcxC1D8jFEXBwqtBEcaAfghMW4Wcxk/2Ae9vjRQjeiomtGDfGFY+xz2o+9Y8QliAe8paMtbLBgnzBCNmjnKmRbiYOZGfhyYHp29Mc7ZvmKVpcrgfEYfacUbD5X2d8tt46Uwvn83kMhKyepH76+8thBXb4arhGfl0BsgXE2+q1296U/ZYlO//3JgtRHLP6XPdYcfjJ3DRbI19mdTkurnBdce8tRso7nuZkzNXRR47P2bxfwkm4wf+W8a3ZuFxr7UnEsEdlKoMgntwrC8TFOMazJ2c70TPxu5OYYw8vQDKQNwp0+5oZIuihb9GL4xENQyvabSETPRH7YeFL1gKXDxkRUiWBxuI0j/wzFl0gSUL9dYcp5n9y2u4rXpzSLrSWjVViHlagDyK949AK0fsSvoMY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(38350700002)(6666004)(2616005)(38100700002)(107886003)(508600001)(4326008)(6486002)(66556008)(186003)(26005)(6916009)(54906003)(966005)(8936002)(52116002)(66946007)(8676002)(83380400001)(6506007)(316002)(2906002)(5660300002)(86362001)(6512007)(36756003)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Qk9nMmFGc0J4NWNzeEhkZ0NIYzBoVDEwVHFXS1lRY0JkMkhNdmFPeUh4RW1r?=
 =?utf-8?B?b2NLdnY3V1M1NzRnZTdwK290RkZTemd0VlBoaFdlYlFQY25RakpCdmRDU2Vo?=
 =?utf-8?B?TEVUOGhPbk85N3hWSW1DZUFCUG5aZGdMUWxycDFZSURnMTZ0djVQTTBuMU1i?=
 =?utf-8?B?K3RGRVpmU3lLd3ZScVluMStZa0FxZVVsajRBVU1jK3A4elp2N1RwT1pmM3BV?=
 =?utf-8?B?cWN5MEppOTIyaGFKczJWWEtJSVdORkt3UFgyUlhrMytLUjJsai9zZzMzcW9M?=
 =?utf-8?B?R2JkVFpqM05uVjZsMVkvRCtGeDIvK3hNUHdQbmtTQnlFc2F3OVh1N1dQajZO?=
 =?utf-8?B?Q011Nm5Qb09OazNnaWFoK1J3WjZ3djFhOHV2RmxzL2FzV2JCdWFwalpzUTZC?=
 =?utf-8?B?alphdmdnSHBPV0ZodHIwZ1lxdXdlSnQxalJsZzh6TkY5NkFoNi9Ka04wN05V?=
 =?utf-8?B?RWhQOWtFcWRld1ZERk55azhqUzBEei82NXZIcjdDNEMxUVo2YnJkOWlQWTBz?=
 =?utf-8?B?M0srRzRTRkRSekl1VU9lTDdQa24zRGdvQWJ0Ukd4cjNJU0pHS3ovd2NCSkFn?=
 =?utf-8?B?RDRYTG5zMEVBRHJGSGZGb2Vsdi9SZVZEZWVBNmR3RCtZMGRRM0hCUmMvVzY2?=
 =?utf-8?B?VEJqNzZjZkVLcU54NFpzNjZVakdVcFBTbkFKWTR4Y0hFNUV0eWExZUxpVnYy?=
 =?utf-8?B?NFVqcXdHTnhZYys4aExKcFQzOXlPY1prN0lZcUZnN0FkS0ZsU2xaQjFMa3dk?=
 =?utf-8?B?NHlIZjhPcnIyRDIydnJnUnJ5aEFtVG4ySklJKzNNQm9QdVY1aU4wM0o0aFgx?=
 =?utf-8?B?bjJhbmxFaktqbDJjSHFrVUgwQXFhaE1YNEo3ZXYrRXBEM0FKeEF2OEt0dURr?=
 =?utf-8?B?MjZKS05EVXYraVFwU2p5c3A3ckg4OXBUKzNXUExUVlNIYjM1RzQrWFZROStT?=
 =?utf-8?B?SkgrVGg2bTl1TllUVmJzK1Fackk1UGprNElhUHRGempiUS9kMXVMWVRGMnVW?=
 =?utf-8?B?emZXc1AwTWl2L1ZBekZsbGdlcUthTnFXQW1wU2pPcFRGbmczM2dhemRldHFO?=
 =?utf-8?B?OEtlWTMrZGwyd1dlNlJ3eG1namh0cWcrS0U0Y2xXVS9CRHdOallDL1ZKS09B?=
 =?utf-8?B?bHhhbWtBbERwTXV0cURZdEIvSEF0KysxaHFUMWdJdzhqbGJNRjBiRXU3aDlF?=
 =?utf-8?B?YlNRVmNWQ2NDUUVPV3d2RVBFRHBnVjh4Y21tTmZ6aU1Cekl2b21GZGxqeUUv?=
 =?utf-8?B?QjFhWUdRbXAwT05lM3EwUnVUQm4rb1lCdVM5R1Q5L08zTFEvdnMySUpvVkVj?=
 =?utf-8?B?bHpvZkJrb01PWmhIVXV4MjdDRUlsRS9VMDZsSXh2SDVhQlZidFY2QlhHbi9q?=
 =?utf-8?B?ZXpNa3k0VDNNZDU2bkF3WHBzS0s3M1RpMWFxcW1veEJidGF2VFFXaUVHQXho?=
 =?utf-8?B?a2ZxbnQ0Q2QycDIxQnBIUkxUelZIWWN5K0ZiQ0lBZEpGUytzNkZ2dC9OQkgz?=
 =?utf-8?B?dzRmT1I3UmtFd3o0U2V6ZUwyNjZWbFlnU0QvSGMycUFDb0V0YkxIaE9CNEJQ?=
 =?utf-8?B?c3NRY2ZwZGwyVWoreGNZbUp4a0l0VnplN0VZT25mdEJvRXVTOWdDYmpJbGJM?=
 =?utf-8?B?OFpKWlNVaTlYZVJsVTBaVStmcjE3d2NucUVEaVVKTUxJbXlvYm9CMDJ3RGc4?=
 =?utf-8?B?ajVuNHA2eVo5c0pEZm84aVpBYWh2MXA0NmNkZWpkVytyQ3R5K2JqMzNDWWVZ?=
 =?utf-8?B?TFVIYm5VRkRBalgxaVdCb29INVpBbWRoNWdkL0JoSWx3U2JiczRoT3luMjJp?=
 =?utf-8?B?Q0pRWG9SM2IyUVQ4WXRMY2NRd3BROXJUSXZnK0F0MDZheVZTbDZsakpDbThm?=
 =?utf-8?B?eDFMdUYxaGxDN20xY3F2TVZMTE1rcEl1czg3S09WaFZpc3BZbWRpY1JaNnlH?=
 =?utf-8?B?S3RnZ1FkT1VrdTM0UEVzL1g5YTNRcUFTUmcyWUJOK2g2UUhvY2l4OS8vZGhT?=
 =?utf-8?B?by9LZW1oLzNnPT0=?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 aa36cb05-1ee4-4b80-eeb5-08da0e4de9eb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 10:55:02.8539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 YmVhCmoxhIefTZJw79at5Gokl3uIbKo8BICrHvnvJkkvCLQwn3SE62uw7I0ZaXDaFrVMA97WiPnmdUynQC5qzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 10:55:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163634

Am 25.03.2022 um 11:48 schrieb Alexander Kanavin:
> The standard way to do this is to inherit lib_package.

Do you propose to move the binaries to a new zstd-bin package and break 
backward compatibility?

Regards
   Stefan

> On Fri, 25 Mar 2022 at 11:19, Stefan Herbrechtsmeier
> <stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
>>
>> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>
>> Add a libzstd package to remove libstdc++ runtime dependency from
>> library users and reduce the size of the library package and its
>> dependencies.
>>
>> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>
>> ---
>>
>>   meta/recipes-extended/zstd/zstd_1.5.2.bb | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/recipes-extended/zstd/zstd_1.5.2.bb b/meta/recipes-extended/zstd/zstd_1.5.2.bb
>> index 0ddff469b8..3887f31ecf 100644
>> --- a/meta/recipes-extended/zstd/zstd_1.5.2.bb
>> +++ b/meta/recipes-extended/zstd/zstd_1.5.2.bb
>> @@ -36,4 +36,8 @@ do_install () {
>>       oe_runmake install 'DESTDIR=${D}' PREFIX=${prefix} -C contrib/pzstd
>>   }
>>
>> +PACKAGE_BEFORE_PN = "libzstd"
>> +
>> +FILES:libzstd = "${libdir}/libzstd${SOLIBS}"
>> +
>>   BBCLASSEXTEND = "native nativesdk"
>> --
>> 2.30.2
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#163632): https://lists.openembedded.org/g/openembedded-core/message/163632
>> Mute This Topic: https://lists.openembedded.org/mt/90019254/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


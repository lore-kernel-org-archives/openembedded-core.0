Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.76])
 by mx.groups.io with SMTP id smtpd.web11.30885.1615169452696107338
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Mar 2021 18:10:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Tvr20oPr;
 spf=pass (domain: windriver.com, ip: 40.107.237.76, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m3EqxdlaexQD9RwWWJOMpJdWSy2tlAxUSjLQ3mdD4WuLpHy8ThkIP4DALS5mobUywvL6w/u2V3/7d7Jy9HGOztU1wKtRFTQPV4LcJm5KgvxftaW5L0lSopMAt8OKylI4SJhzYFo7PZJlWVyRACpB65rvaDA+ULV142oklED4pLSHCvcfp/v5RDZhCzbVzJ9tw1OFLrrH45mF5x/RdBfmPnbUmeKPdyW6l1kqpyPz83PuUF4qh8uB9hVT6Y+yQ28ZWgYGwWYUoDBYpC5xisAmTwBkhIuoxefs13hCfjMdfquJ7cqLhh+UMjUGjw/fJSeze3yjeolJ/M0Ix1Q0OrqCIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLHbaRi7HTZyJjRseHhBTJPDXMCf7AKpgU233sMPEXk=;
 b=BUrwSr/hj0pFJ/o0lENI2yDJZvTCcrUB4esiQWJq7tv6UxbzTcf08Fa9tdOmpjiVVPo9MplftQkxXyN5Nd9pzFZ7Ya+xpJ59IqKRsRlDDdFHkhIoHqI4TXT49NAJsPT3s9MvWWD91hx1a8w+tWjX8H0d4Eb67unplT4dlB4DAa52FWlEhYU1zMmPo6qlc7Nfvffcmb7eqdHeZ0JaDVP4uSJlIQmqTs92o5ckxV9AvhhnyZzLerNduhYEfrtnRykQ/I/9pkGv/vUrlWmjY8fyKa5rIVZHt7qVc42OD46QpqmOEZqeaqY6LTa8igxQZ0+xdqogQNgXpJoOA5JB4EYfRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLHbaRi7HTZyJjRseHhBTJPDXMCf7AKpgU233sMPEXk=;
 b=Tvr20oPrwSuDZYPSLk5hyDjX5upH+BGmX/3DSaNBE34Jku4MtZLywC6d3t56TZarJ+jocWTo8m4tMQdTBvZa+5QHGTpNVAeABxkdZRtzmuRfOPFIbqFo8cJwJMVWY+ESUgrJFUPTB5+9Pmmmc+HGNaDYi3psAK+QzzfCPyde06I=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR1101MB2238.namprd11.prod.outlook.com (2603:10b6:301:55::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Mon, 8 Mar
 2021 02:10:49 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64%7]) with mapi id 15.20.3912.027; Mon, 8 Mar 2021
 02:10:49 +0000
Subject: Re: [OE-core] [PATCH v2] bitbake.conf: use ${RECIPE_SYSROOT} for PSEUDO_IGNORE_PATHS
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <4e34eedd6cd84c361e5a316325c508499a7d75a6.camel@linuxfoundation.org>
 <20210120070527.32242-1-mingli.yu@windriver.com>
 <f7309d1d8d3fd2f0c4595ddda3e5abb9c4cb4650.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <6dfa3f34-27ef-fa2f-5751-33d210e9a2c5@windriver.com>
Date: Mon, 8 Mar 2021 10:09:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <f7309d1d8d3fd2f0c4595ddda3e5abb9c4cb4650.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:203:d0::20) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.139] (60.247.85.82) by HKAPR04CA0010.apcprd04.prod.outlook.com (2603:1096:203:d0::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 02:10:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f29e98c4-633c-4195-4ce8-08d8e1d76498
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2238:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB2238847E0E72BE3129A9C49BF1939@MWHPR1101MB2238.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YMZCeZV+2EiIWj4BVJyYjFGe+rY/S2aTY4wEnNl912Zfdl/2k8q80kL/hufGVGIctZ3U4BcamokFdGbYeK1WRJD5q02EfowTu9i2v7Kj98b250V4dN4qvEqj/n1jLUIcg/uomA3w+pIdNDWyh3TldPG2E/omtVWrCVxTFdK2EvAsdOoLoeRyNTZGACCjJHLZRTdOW6f3pV/c/jfgKXski8piysEJ+1DRQHYAL323RuNSQP2jb5LvWD/E8QjGFA+AB7YGDkRm4+n7hqy/k6DbaytjQDooLeXfYdOkBLYASERj/I7/dH6iJIL/tHqlohx1L4Lce3NnkpwT414EzKb4kTKmsQvZVXMBEjKl5WjesX3UiD/Zb4YufnYIqFXpVOTFbcvW3Ix/nVSFwCoqRs4ga5KSYCGSbe6f4vmpGeJ84eixTk+kUA2I6TCcP1HGMxSFaPYxNlr2BNaQwUUjUO2X1zQbaUiPjHKgGvAGacOYx8Rr4ydb2g8gOxfwuzr+C7v8oIDhnCx06XsBQZIZJx1zj9BvGnosL3DWxqKgu7rXJY+iOwuUVMJBss4aMSbFyp7WP41svSXew6kw+dtkzpVhKWUv3ZuYgeughrtxuiXYTqwLz5TSr14QJG5pd295QVdqlhvYwh5APMsQK1XtPyGb5LTcUh4IcwZq7pdbHuBBxFGgPEOHam4CPoHhduX9A7ZRyD1XgRa2GCpyCmL4kBaflLSVTkScS6oJ0qJajUdtj3I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(39840400004)(346002)(376002)(2616005)(956004)(66476007)(6486002)(86362001)(186003)(66556008)(31696002)(53546011)(66946007)(52116002)(31686004)(83380400001)(6706004)(6666004)(966005)(8676002)(5660300002)(26005)(478600001)(36756003)(16526019)(16576012)(2906002)(8936002)(316002)(78286007)(228453006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?QnIrSmpZNFB4TFhZMW9OZzZoVTlkZkVCMlM2aFVWYjE3cnRKbWdpRXJ4Mndm?=
 =?utf-8?B?UUFJc0xwSVVKcWpwK1BMNFNxMHhXTTJHdXYwSVB3YlVKTEdYNWFMRkhwVE9a?=
 =?utf-8?B?T2ZuVG1wLytOZ0VSMU5QNE1PYzgyYnVKQThPZ3VOak92MDJ0YitYdWdkRnZN?=
 =?utf-8?B?eEc0enlkSDJPLzl5MkpoS1BZTDg0ZjJVbU90dlJpTzlja2Fna2pTKzZGVm0r?=
 =?utf-8?B?SXd3cFNWMEY0dHoxZEE2VDVqWWZGN0ZZYThFbFRlT3psMng5RFFnUVhuMjRy?=
 =?utf-8?B?bFlSYlpkdDdJT3l1TnhSYlFJTWdaeGl3S1lJMlhVejAzWG1mWTVzT3Mrb2tj?=
 =?utf-8?B?Vmx0N0U4TEg2WXJQY29GN2F0eXRLMlhHTEUxU3V1ZERGQTZ6SnV1cUpnTWFs?=
 =?utf-8?B?dVRMTXRiSUVqdEp0alF1OVViN1NpUnVvRCtjRkpoSkhKOGQzNWJuR0xEc2Y1?=
 =?utf-8?B?WlJvV0JEMHJkVFpPYkpoVlpuVGhiZ2Y5VXBKNTlNRUUvMll5dXBiOGpuS1h6?=
 =?utf-8?B?S0tRcHo2aEVra0JjV0E0RmVwdlVWZStUbDlZdEpxV1ZxQ2dDb1R2OWtFY25E?=
 =?utf-8?B?Mzg5K2I4WWRpeld6ZUNGejNOaDcrMFJleDYvVjhCQ1QxaDI1dnlad1VQSDc5?=
 =?utf-8?B?WU9idzBnMjZ0VUNCOE9FUFVNSWg3eWVEY1d3V0hlaVNpTThUMTJ2WHYyS2FI?=
 =?utf-8?B?RC9qMWJZd05TUzhIOU9ueEtDcVd5blBaN1ViUTlhd2p3Q0hEVHVrSFpnb1FF?=
 =?utf-8?B?YTIvZTlSZnFOZW5YaDdGajNYeEJ3bHNFMWlxdU9SdnRmcUZFb2VYT2ZRNnph?=
 =?utf-8?B?d3oxMEZlRGNRLytVREhCR28yS0NSQXF0VnlTSkUyY2U1SWVoQ2R1Q1ZFcjlI?=
 =?utf-8?B?ckJXemhiWWc0V091TFNVbW5xcUNESDloSXF3TTlHekU1eE5xUnd2ZUFxS2pz?=
 =?utf-8?B?MStvNFYzdExqaWI2RjNqemJsLzdZeW9SR05jRmtGazlPb0xOYUMvYVJEOEJF?=
 =?utf-8?B?djdoUGRaY2hrWFpwV2FFMlM1QUZXNjhrVUc2Mkp1TTBuVXJmRDVNNmJqZVdm?=
 =?utf-8?B?M3ZTOFQ3djdaUGt1NU01YVFWbkZTMDZpaWpvZUREdllDcnFxRllkQmlzaXJM?=
 =?utf-8?B?bm9pSHhTS2FHclFTRlJxQVExZ29kYWlLVnlROFpVc0dlV3M1dlNXdVJMZ3Rz?=
 =?utf-8?B?TStYa0wzdWFWeHdRaHVwNkh0NSs5MDhUMzJleTBSZm8va2tIYWxhRm9wQXlh?=
 =?utf-8?B?K1Nhc01PN21hckIxaGtXTFBlVUtrS3NoWi9OdUd2L1JKZTdpRWVQaTlldk9U?=
 =?utf-8?B?a3NTa1Vzczd4UlJGb3YzN2tYSGZ4WkpoWkV1cjBZdWZEQ0FPSEZPdVRPdVZJ?=
 =?utf-8?B?bDg4YXhkTTBOTmlaMnBucE9TdjBwTU1XSWE4S2hBOWpjSUhoQlR4SDhNMVJz?=
 =?utf-8?B?VHBUN2c2RWExTE9IS2lEbjVBMXdzbzRTMHZvdnZxcEViVmpOdFNxMFluZjZh?=
 =?utf-8?B?cWlNRnRxNGh4Tnk4a1NrVW5pT0Y5Sk5KUlkzMlczMkovQzJsZG50OUs1RVZa?=
 =?utf-8?B?Yk1WcHlMRjVrS09pQ0puRFB6SUQ4eThjcEMzVjFWWkkzNVA2U3NRNmRQRlln?=
 =?utf-8?B?ZC9TeXBWbk5iVElrbGZaN1Bid3QvVzBUZHN3QmZvb2o1RjVVcmZscXl0Ujhn?=
 =?utf-8?B?WVUvOEJjYTZ3UUM2ak4rQThlMnpWRWdxRkhZeHNZY0cwQW5ERUhiSzFlMElq?=
 =?utf-8?Q?oXT04OVVGmLAjvC0ifpGb3KbVt+LkVK+O0lVVQ7?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f29e98c4-633c-4195-4ce8-08d8e1d76498
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 02:10:49.8440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EuFhcENNFgbNu00hCjU3WSi7qUuDSR2kUjB3SzL8+h0D0GtBdV3XeZjKQPwS7g7WOq056M10Jgnmyk60+Sv/lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2238
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 1/31/21 7:36 PM, Richard Purdie wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> On Wed, 2021-01-20 at 15:05 +0800, Yu, Mingli wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> When multilib enabled, there comes below error for packages which
>> inherit useradd bbclass randomly when build eSDK.
>>   $ bitbake image-name -c populate_sdk_ext
>>   Exception: subprocess.CalledProcessError: Command '/prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/lib32-recipe-sysroot/usr/bin/postinst-useradd-lib32-avahi' returned non-zero exit status 1.
>>   Subprocess output:
>>   /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot-native/usr/sbin/useradd
>>   Running useradd commands...
>>   NOTE: lib32-avahi: Performing useradd with [--root /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot --system --home /run/avahi-daemon                               --no-create-home --shell /bin/false                               --user-group avahi]
>>   useradd: Warning: missing or non-executable shell '/bin/false'
>>   abort()ing pseudo client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.
>>   Check logfile: /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/pseudo//pseudo.log
>>   ERROR: lib32-avahi: useradd command did not succeed.
>>   ERROR: Logfile of failure stored in: /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/temp/log.do_sdk_depends.20567
>>
>>   $ cat  /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/pseudo//pseudo.log
>>   [snip]
>>   path mismatch [1 link]: ino 26553244 db '/prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot/etc/group'
>> req '/prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot/etc/group.33605'.
>>   [snip]
>>
>>   Check the PSEUDO_IGNORE_PATHS in [1], the recipe-sysroot part is
>>   /prj/tmp-glibc/work/corei7-32-wrsmllib32-linux/lib32-avahi/0.8-r0/recipe-sysroot.
>>
>>   Use ${RECIPE_SYSROOT} for PSEUDO_IGNORE_PATHS to guarantee the
>>   recipe-syroot part to be /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot
>>   to fix the above issue.
>>
>>   [1] /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/lib32-recipe-sysroot/usr/bin/postinst-useradd-lib32-avahi
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   meta/conf/bitbake.conf | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Could you retest this with the latest pseudo upgrade in master please?

Hi Richard,

I indeed test against with the latest pseudo and the issue still exists 
and can 100% be reproducible in our env and this patch can resolve our 
issue.

> 
> I'm not convinced this is the correct fix, I suspect there is something
> else going on here. We don't see this on the autobuilder and it would
> be good to understand why.

It's strange that the issue doesn't occur in autobuilder and I'm still 
debugging the reason.

Thanks,

> 
> Cheers,
> 
> Richard
> 

Return-Path: <mark.hatle@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3529FC7EE2A
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 14:15:41 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (NAM02-BN1-obe.outbound.protection.outlook.com [40.107.212.41])
 by mx.groups.io with SMTP id smtpd.web10.32496.1685628933136161668
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 07:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=b6LeiNip;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.212.41, mailfrom: mark.hatle@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cR+VuZTVE6+sPt/1yOkqUH6J3DBQhThNYNdhqO8pY/yymXM2uA5YjshZtG+e/zYdVdMZ9oHb52slQ1Vxx5PrrKldUYBfYOKMp3bHu2GAJ+UWAsM34pvErs6prcOhDc85FNStRxBQLzneIeA4qiwGiecnIAviWQxjxJDbmp9GXi2JkTmb/zKY+PahAR1tmBibPqAB/XEstkQnFm9eWp/Lfy6mXpLnJBT+ls65m03zHZ9Ev/lH0DCicN2D7NjQ/IfhYRRqgVX01VUDE75FT0MJxLV5izqcDrxcNTgDCUvsqUqJld1WdXLTp98t1GieHC30wy3TYGEEtH4MEvsL1xJHTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydAgcEOEwfl9fyxK+Icpz8JB19Bb82FjkInazngOZDU=;
 b=EB4m3PQgWRTJOdJJygStFPTgXxXKQCYLgnNxXeyTiwF0ZER+lccWjVIrMrx720bWkwxYI/0SUi0RaJDnfB54njiSIn1FoUEKJV0f4nSxZmtsLsEGzKrvCh1pTUr+HJW7NXs5EynBNjR0b1dSBRguO0o+aqNMuXCSxuxGCEXNAIjLU4P7yfXQwLniBI2ZrX0qVfCxtK0Fc7d3lXna1TawEcMArz5cNSGwNqrIY55fm5lJtvrCEKfesVbxVVssEevllf0GyL8qGVYX1LmNerG8sH9TyBKbcQdv8MYaU1eL/49vvq7pwJ1P+htV0lQaxS6jUsgFxs4dr1NUxO8Nd17aKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydAgcEOEwfl9fyxK+Icpz8JB19Bb82FjkInazngOZDU=;
 b=b6LeiNipojuhuu/DLKn2kIexmuBL/VhJ4Ot/DJ2P+c5y7MFBYN8l/rQUt/uIfWY7lRQ1ayPNxSMUwZbXaHvblsrmHa6JBrtLnjUbnCeHpth6TaxsQJELz4onaQopfy2JwtlZMTTcoK4jRZ6hluQmxzE/ueUO4ZZghgOEVWBkdKs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB7018.namprd12.prod.outlook.com (2603:10b6:510:1b8::14)
 by DM4PR12MB7502.namprd12.prod.outlook.com (2603:10b6:8:112::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Thu, 1 Jun
 2023 14:15:29 +0000
Received: from PH7PR12MB7018.namprd12.prod.outlook.com
 ([fe80::472c:4f29:4645:b7df]) by PH7PR12MB7018.namprd12.prod.outlook.com
 ([fe80::472c:4f29:4645:b7df%7]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 14:15:29 +0000
Message-ID: <8b3a433d-78c8-088c-fdcb-ab98f37ffd49@amd.com>
Date: Thu, 1 Jun 2023 09:15:25 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [OE-core] [PATCH][pseudo] Move __*xstat* and __xmknod functions
 to new subport 'old__x'
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, zhangjialing@loongson.cn,
 seebs@seebs.net
References: <20230531030126.5837-1-mark.hatle@amd.com>
 <20230601104342472d20fd@mail.local>
From: Mark Hatle <mark.hatle@amd.com>
In-Reply-To: <20230601104342472d20fd@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:a03:505::7) To PH7PR12MB7018.namprd12.prod.outlook.com
 (2603:10b6:510:1b8::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB7018:EE_|DM4PR12MB7502:EE_
X-MS-Office365-Filtering-Correlation-Id: 55466c25-21c1-46c5-bf16-08db62aaa6d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eXEpfMqLtUDKyaXOcq1fRQjo61X8JeIc+KtoXuoF7e6jSHfxpDywKR8mpchj2sVU2V2nPjCuDfaiR8XvtGrDi9vvthuHiWysoIKZ5TB/8UhCvRb7PYQASrKwxI5ir//VkZvZcdPJeiCmYWVywm/hayjj/7zNHipWzbaHVBE64M54je9MaUKxfyHXhwuf1XDWR4UGPUSTibltQ3LODoSFubNyrcb1vhE3lShjeDW4nQ5Tpi6VaFM0umzQBU6Oourfon+jqq0Y0MGbwNMMipfi61kbsKVqx5XftW5zJnvmZISCzKF2ehSnuF8i0h/zggvBkFT3Dzzp+xklt9FZtXFgj/g0K8dLMQGpDHMyaNvzGb7xGMGfRi025wwWwsufz+iGzd9/BLsCfS8pKPtBTOPDaiz/9vBnxZrwXxx2piNhvz44yrhXjNNnkrhx8G1Iib2XPFtD4f+TgPvTPiIZxiDAwwV4BmRWYSplKtaEUqj2Kj+YJAWAv7WY/pJnKaLx/ESrhjZO4xbQm0nzTZOx06ZjqKVQrbAx20YBFMuSGZlu/hjPpO+4ivkZdUGeoxAxG3ENUKEXwyVSrM45M405KYxzxuws0/Ealjr/gfYYQXkzP5n+SYc+KdkLIV9NPbH5CicOvzae8eN+R7Jshb7HEE8FsxtR9FXWdfEMcVvd9jFBSY4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB7018.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199021)(6506007)(966005)(478600001)(6666004)(6486002)(36756003)(186003)(53546011)(83380400001)(86362001)(2616005)(38100700002)(31696002)(26005)(6512007)(316002)(41300700001)(4326008)(8936002)(6916009)(31686004)(66946007)(66556008)(66476007)(44832011)(5660300002)(8676002)(30864003)(2906002)(66899021)(101420200003)(43740500002)(45980500001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dzRkVlN0YW8vZFROZzBMU2V2QnJXYU5FWFBjM0JpQ0hHN0FmcUZjMU9hc2k0?=
 =?utf-8?B?N1ZueW40Z2I4N2FlR0YxM2l6T0xDR3ZnK2xUNVNiTkpueXQ4MDE3OFN0a3oy?=
 =?utf-8?B?VEtUOVRZZXZTZE1jZ2lGaVF6eUNmV3JIcTBQZ1FLOWxJNnFuM1R5TjcyWGR6?=
 =?utf-8?B?RC9Jd1QxbTl1bzdvdXJwbUo4bEFpK1lUWGE4NzdZbGJsdDRNcjNyT0NqUzVo?=
 =?utf-8?B?RzVKQ0QwUFI1Q3kremJrWTdZNzlES2lhOXBkdjlTVDhnRmRNS28zSi9PblpU?=
 =?utf-8?B?MGtRdi9FK1psWTE3R2xLamkrMjhFd29uOGJCNmJoYjJpWjRaYzJqRG1VU2tE?=
 =?utf-8?B?TjRmV01KZThaYXNscFhBL3djWmZLTTE2OFR6eFF1WjNQMEdWRW1PTERvNU0r?=
 =?utf-8?B?eU1XSHBKc2Vaei9Ua3NsM1JJSGR5YmdmV2xzTHQ1SEdtNG44eG9ZdVY4V1BO?=
 =?utf-8?B?MXhiWk5JdkhBTzJBWVpiNXZ0L1doTlFVT2F3YkNLWHNZTnFwejJXaXk3VS9B?=
 =?utf-8?B?VGMzblRSTFM1T1NnNGdDUEdEbll3RFAyVVBpWWpnMXVTWHNaQXZ2aHRYaHVa?=
 =?utf-8?B?dzdIMEtJTnpwcGR0c1FPcEdUUjFySDVwYUQycE1oUzFBQnZIWHFNa0UydFlF?=
 =?utf-8?B?dXdBWGlJN0dwMWlNVkxtWU8xalJmbGQ1a2NqRGs1V3A2ZjZjakhMN0hkLzAx?=
 =?utf-8?B?SWg1TnM2eVhtR2hmSHhjK1Z1aHprRXdiYlQrMnQ3ZjZqRUxRM0w2YVdTMkdm?=
 =?utf-8?B?K1ZVT052WTFLWjhNTkNsZFVoZEIzbmZickNvQzVWM0VyYTlpN0dtN1pHSmpI?=
 =?utf-8?B?aGFwbkdCK3F5cSttYm4yVXluankrdUdDYnpTaXJHSzZ2L1Q0Tk9lUGFNQndz?=
 =?utf-8?B?a1A4VENWTUJZOVJTV1VURUpUTytBU1BGMU5CeUlmeFFVZ2NOck9BZ1FFa0FZ?=
 =?utf-8?B?b1lDdUFHcGpMZVNLaHpZWUtUbUF3ZzNtL3RlQm94NXNBTW1HRXV0eDQrOFJq?=
 =?utf-8?B?Tnl5QUdHN2pBUzJUOVhxZEN2aG1UVm9DYXRGLzdZcVpXTE96M3JqNTdWM0Ez?=
 =?utf-8?B?VUEreE9RRTN0c0VHbGxDcDNQd3BINFBSSWNCOGd2M2RUdTBFNUl1bjlHZnhj?=
 =?utf-8?B?YkRaeVMxK09FcVJzYysyZVgrUXZRMEU5K3BDYlA0emdpenJuQ21qcW9oamEw?=
 =?utf-8?B?eVJNUFhMNE1WN3RYTnV6aWxQZDBFOWZFUndJTGxZSFgxMXlNdXk4K012RFZa?=
 =?utf-8?B?QXdGRHpTbXJxNUVobHFyUHlpdzlTWWVPc29PbTdzM014cjg5MDBlQXhVN0J5?=
 =?utf-8?B?MkZ0TXVwUktCNEZXS0w2M2hybU1sTWh2ZDQ4aENicWlrQVVrUlhDckl1MTls?=
 =?utf-8?B?bFFvVml1NDZJYnlVSFhnTHEvY1JNcG9RNG1FMzlxbmFOWHhSaSt4YjhSTjFv?=
 =?utf-8?B?czFMR0xteU85VUhhT1lJT3UvU25LSjZERWhBWDlCb1lndUF2OXhOU2dvWjg3?=
 =?utf-8?B?bWtJNnkvZ0V5TVYwNGpycGplUHkxVDVSd2p0WHA2ajJ4ZjBkNjFLOUxWRm5J?=
 =?utf-8?B?RzVyajBUT1dvWFV6MFRkY1h1WlJaZ2JWcHRDOEZIT0VhOVdma0hXclVQOS9k?=
 =?utf-8?B?T3c1dVJDN2FUNlVVU0l6SnhnWGx3Y2tCS3BVL2xmUnNjYlYwM3R0bGJPaWxJ?=
 =?utf-8?B?a1laU0UrTUNWTFFFSUFsTzVoN08yYlFrYTh5OGNDbHBhRzJ3bk5zV2E1Uk5a?=
 =?utf-8?B?eU9XTWpmUzhCVFZISHRnRUxVK0R2RmhYOGQrNFM2TXk3MnVvME5ic1JMVGtl?=
 =?utf-8?B?aEl3bFRFbmFERWpqWlo5OUJCVTcwMXpudzQxZWR3TndkZ1hmMkdBaHVscFVV?=
 =?utf-8?B?QmtQTHVORG8wYXpSMVcxRzB3YVQ0MURLMnkvVXp1bWtuRDdOMUFsc0VzMzl3?=
 =?utf-8?B?ZDVwZVhySXQySFY3OGcxRVlqbWZXM2d3UFVBS0Rmb1Yzamg2SnU4Ri9NZDhK?=
 =?utf-8?B?bTF3WEtRQm84WTN1M2Z1dmYxZnlOaG13SlIvNXc2QVF6dXAvVnlGZTU2NUx3?=
 =?utf-8?B?WGg5YkxYcVNaNzZ0d3lOcTNkOUVSQVdzYmRFeVNTZWpQbTlxMzZ6WnUxRGhU?=
 =?utf-8?Q?vkNy116vWIP5bjP49P5B3fDkU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55466c25-21c1-46c5-bf16-08db62aaa6d3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7018.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 14:15:28.9170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ue373+RP6ymIztPmu71q1umqnsKubWjrFh6LP/AWszhwL7nUBWq/8mhlUFXQzgTD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7502
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 14:15:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182112

Did you or someone else manually add this patch for testing?  I wasn't aware that it had gone in for any sort of testing eyt.

I'd like to see the integration used so I can understand how the test was performed.

--Mark

On 6/1/23 5:43 AM, Alexandre Belloni wrote:
> Hello Mark,
> 
> This causes failures on opensuse154 and debian11 workers. I've tried to
> get pseudo.log for the failures but they are not present on debian11 and
> are not interesting for opensuse154.
> 
> debian11 failures look like that:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/7184/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/7184/steps/13/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/7152/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/7152/steps/13/logs/stdio
> 
> opensuse:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/2819/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/7597/steps/13/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/7211/steps/13/logs/stdio
> 
> stream8 is similar:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2939/steps/13/logs/stdio
> 
> 
> I also suspect this causes:
> 
> ERROR: cmdline-shebang-wrapper-test-1.0-r0 do_install: Wrapper permissions for /home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-1782300/tmp/work/core2-64-poky-linux/cmdline-shebang-wrapper-test/1.0-r0/image/usr/bin/test.real not preserved. Found 600 but expected 400
> ERROR: cmdline-shebang-wrapper-test-1.0-r0 do_install: ExecutionError('/home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-1782300/tmp/work/core2-64-poky-linux/cmdline-shebang-wrapper-test/1.0-r0/temp/run.do_install.322689', 1, None, None)
> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-1782300/tmp/work/core2-64-poky-linux/cmdline-shebang-wrapper-test/1.0-r0/temp/log.do_install.322689
> NOTE: recipe cmdline-shebang-wrapper-test-1.0-r0: task do_install: Failed
> ERROR: Task (/home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-1782300/meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-test.bb:do_install) failed with exit code '1'
> 
> 
> 
> On 30/05/2023 20:01:26-0700, Mark Hatle via lists.openembedded.org wrote:
>> Changes to eliminate __*.c function usage were based on the patch:
>>
>>     From: JiaLing Zhang <zhangjialing@loongson.cn>
>>     Subject: [OE-core] [PATCH v4] Fixes pseudo build in loongarch64
>>
>>     Fixes [YOCTO #15110]
>>
>>     Some functions used in the project have been removed from glibc. After the removal of these functions,
>>     the architecture in glibc will not include the removed functions.
>>     This patch resolves the usage and compilation issues on the loongarch64 architecture
>>
>>     Signed-off-by: JiaLing Zhang <zhangjialing@loongson.cn>
>>
>> This code is NOT loongarch64 specific, but implements support for newer
>> glibc where the __*x*stat and __xmknod* functions are no longer present
>> in headers as of roughly glibc 2.33.
>>
>> The functions, on x86, x86_64 and aarch64 may still be present for
>> compatibility but new software should no longer be using it.  Pseudo
>> can likely change it's default behavior unless support for really old
>> hosts is still desired.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
>> ---
>>   ports/linux/guts/fopen64.c                   |  4 +-
>>   ports/linux/guts/freopen64.c                 |  4 +-
>>   ports/linux/guts/fstat.c                     |  8 ++-
>>   ports/linux/guts/fstat64.c                   | 14 +++-
>>   ports/linux/guts/fstatat.c                   |  9 ++-
>>   ports/linux/guts/fstatat64.c                 | 42 +++++++++++-
>>   ports/linux/guts/lstat.c                     |  2 +-
>>   ports/linux/guts/lstat64.c                   |  2 +-
>>   ports/linux/guts/mknod.c                     |  2 +-
>>   ports/linux/guts/mknodat.c                   | 71 +++++++++++++++++++-
>>   ports/linux/guts/mkostemp64.c                |  2 +-
>>   ports/linux/guts/openat.c                    | 18 ++---
>>   ports/linux/guts/stat.c                      |  2 +-
>>   ports/linux/guts/stat64.c                    |  2 +-
>>   ports/linux/old__x/README                    | 28 ++++++++
>>   ports/linux/{ => old__x}/guts/__fxstat.c     |  0
>>   ports/linux/{ => old__x}/guts/__fxstat64.c   |  0
>>   ports/linux/{ => old__x}/guts/__fxstatat.c   |  0
>>   ports/linux/{ => old__x}/guts/__fxstatat64.c |  0
>>   ports/linux/{ => old__x}/guts/__lxstat.c     |  0
>>   ports/linux/{ => old__x}/guts/__lxstat64.c   |  0
>>   ports/linux/{ => old__x}/guts/__xmknod.c     |  0
>>   ports/linux/{ => old__x}/guts/__xmknodat.c   |  0
>>   ports/linux/{ => old__x}/guts/__xstat.c      |  0
>>   ports/linux/{ => old__x}/guts/__xstat64.c    |  0
>>   ports/linux/old__x/guts/fstat.c              | 15 +++++
>>   ports/linux/old__x/guts/fstat64.c            | 15 +++++
>>   ports/linux/old__x/guts/fstatat.c            | 15 +++++
>>   ports/linux/old__x/guts/fstatat64.c          | 15 +++++
>>   ports/linux/old__x/guts/lstat.c              | 15 +++++
>>   ports/linux/old__x/guts/lstat64.c            | 15 +++++
>>   ports/linux/old__x/guts/mknod.c              | 15 +++++
>>   ports/linux/old__x/guts/mknodat.c            | 15 +++++
>>   ports/linux/old__x/guts/mkostemp64.c         | 53 +++++++++++++++
>>   ports/linux/old__x/portdefs.h                | 40 +++++++++++
>>   ports/linux/old__x/pseudo_wrappers.c         | 48 +++++++++++++
>>   ports/linux/old__x/wrapfuncs.in              | 18 +++++
>>   ports/linux/portdefs.h                       | 19 ------
>>   ports/linux/pseudo_wrappers.c                | 43 ------------
>>   ports/linux/subports                         | 15 +++++
>>   ports/linux/wrapfuncs.in                     | 26 +++----
>>   pseudo_client.h                              | 38 +++++++++--
>>   42 files changed, 520 insertions(+), 110 deletions(-)
>>   create mode 100644 ports/linux/old__x/README
>>   rename ports/linux/{ => old__x}/guts/__fxstat.c (100%)
>>   rename ports/linux/{ => old__x}/guts/__fxstat64.c (100%)
>>   rename ports/linux/{ => old__x}/guts/__fxstatat.c (100%)
>>   rename ports/linux/{ => old__x}/guts/__fxstatat64.c (100%)
>>   rename ports/linux/{ => old__x}/guts/__lxstat.c (100%)
>>   rename ports/linux/{ => old__x}/guts/__lxstat64.c (100%)
>>   rename ports/linux/{ => old__x}/guts/__xmknod.c (100%)
>>   rename ports/linux/{ => old__x}/guts/__xmknodat.c (100%)
>>   rename ports/linux/{ => old__x}/guts/__xstat.c (100%)
>>   rename ports/linux/{ => old__x}/guts/__xstat64.c (100%)
>>   create mode 100644 ports/linux/old__x/guts/fstat.c
>>   create mode 100644 ports/linux/old__x/guts/fstat64.c
>>   create mode 100644 ports/linux/old__x/guts/fstatat.c
>>   create mode 100644 ports/linux/old__x/guts/fstatat64.c
>>   create mode 100644 ports/linux/old__x/guts/lstat.c
>>   create mode 100644 ports/linux/old__x/guts/lstat64.c
>>   create mode 100644 ports/linux/old__x/guts/mknod.c
>>   create mode 100644 ports/linux/old__x/guts/mknodat.c
>>   create mode 100644 ports/linux/old__x/guts/mkostemp64.c
>>   create mode 100644 ports/linux/old__x/portdefs.h
>>   create mode 100644 ports/linux/old__x/pseudo_wrappers.c
>>   create mode 100644 ports/linux/old__x/wrapfuncs.in
>>
>> diff --git a/ports/linux/guts/fopen64.c b/ports/linux/guts/fopen64.c
>> index e76da69..33ccd3a 100644
>> --- a/ports/linux/guts/fopen64.c
>> +++ b/ports/linux/guts/fopen64.c
>> @@ -11,7 +11,7 @@
>>    	struct stat64 buf;
>>   	int save_errno;
>>   
>> -	int existed = (real___xstat64(_STAT_VER, path, &buf) != -1);
>> +	int existed = (base_stat64(path, &buf) != -1);
>>   
>>   	rc = real_fopen64(path, mode);
>>   	save_errno = errno;
>> @@ -20,7 +20,7 @@
>>   		int fd = fileno(rc);
>>   
>>   		pseudo_debug(PDBGF_FILE, "fopen64 '%s': fd %d <FILE %p>\n", path, fd, (void *) rc);
>> -		if (real___fxstat64(_STAT_VER, fd, &buf) != -1) {
>> +		if (base_fstat64(fd, &buf) != -1) {
>>   			if (!existed) {
>>   				real_fchmod(fd, PSEUDO_FS_MODE(0666 & ~pseudo_umask, 0));
>>   				pseudo_client_op(OP_CREAT, 0, -1, -1, path, &buf);
>> diff --git a/ports/linux/guts/freopen64.c b/ports/linux/guts/freopen64.c
>> index 5fc9073..9bcc06a 100644
>> --- a/ports/linux/guts/freopen64.c
>> +++ b/ports/linux/guts/freopen64.c
>> @@ -10,7 +10,7 @@
>>    */
>>    	struct stat64 buf;
>>   	int save_errno;
>> -	int existed = (real___xstat64(_STAT_VER, path, &buf) != -1);
>> +	int existed = (base_stat64(path, &buf) != -1);
>>   
>>   	rc = real_freopen64(path, mode, stream);
>>   	save_errno = errno;
>> @@ -19,7 +19,7 @@
>>   		int fd = fileno(rc);
>>   
>>   		pseudo_debug(PDBGF_FILE, "freopen64 '%s': fd %d\n", path, fd);
>> -		if (real___fxstat64(_STAT_VER, fd, &buf) != -1) {
>> +		if (base_fstat64(fd, &buf) != -1) {
>>   			if (!existed) {
>>   				real_fchmod(fd, PSEUDO_FS_MODE(0666 & ~pseudo_umask, 0));
>>   				pseudo_client_op(OP_CREAT, 0, -1, -1, path, &buf);
>> diff --git a/ports/linux/guts/fstat.c b/ports/linux/guts/fstat.c
>> index b089b15..80933e2 100644
>> --- a/ports/linux/guts/fstat.c
>> +++ b/ports/linux/guts/fstat.c
>> @@ -8,7 +8,13 @@
>>    *	int rc = -1;
>>    */
>>   
>> -	rc = wrap___fxstat(_STAT_VER, fd, buf);
>> +	struct stat64 buf64;
>> +	/* populate buffer with complete data */
>> +	real_fstat(fd, buf);
>> +	/* obtain fake data */
>> +	rc = wrap_fstat64(fd, &buf64);
>> +	/* overwrite */
>> +	pseudo_stat32_from64(buf, &buf64);
>>   
>>   /*	return rc;
>>    * }
>> diff --git a/ports/linux/guts/fstat64.c b/ports/linux/guts/fstat64.c
>> index 6dd97da..22d46a9 100644
>> --- a/ports/linux/guts/fstat64.c
>> +++ b/ports/linux/guts/fstat64.c
>> @@ -8,8 +8,20 @@
>>    *	int rc = -1;
>>    */
>>   
>> -	rc = wrap___fxstat64(_STAT_VER, fd, buf);
>> +	pseudo_msg_t *msg;
>> +	int save_errno;
>>   
>> +	rc = real_fstat64(fd, buf);
>> +	save_errno = errno;
>> +	if (rc == -1) {
>> +		return rc;
>> +	}
>> +	msg = pseudo_client_op(OP_FSTAT, 0, fd, -1, 0, buf);
>> +	if (msg && msg->result == RESULT_SUCCEED) {
>> +		pseudo_stat_msg(buf, msg);
>> +	}
>> +
>> +	errno = save_errno;
>>   /*	return rc;
>>    * }
>>    */
>> diff --git a/ports/linux/guts/fstatat.c b/ports/linux/guts/fstatat.c
>> index 3267641..7b9652d 100644
>> --- a/ports/linux/guts/fstatat.c
>> +++ b/ports/linux/guts/fstatat.c
>> @@ -1,4 +1,5 @@
>>   /*
>> + * Copyright (c) 2008-2010 Wind River Systems; see
>>    * Copyright (c) 2021 Linux Foundation; see
>>    * guts/COPYRIGHT for information.
>>    *
>> @@ -8,7 +9,13 @@
>>    *	int rc = -1;
>>    */
>>   
>> -	rc = wrap___fxstatat(_STAT_VER, dirfd, path, buf, flags);
>> +	struct stat64 buf64;
>> +	/* populate buffer with complete data */
>> +	real_fstatat(dirfd, path, buf, flags);
>> +	/* obtain fake data */
>> +	rc = wrap_fstatat64(dirfd, path, &buf64, flags);
>> +	/* overwrite */
>> +	pseudo_stat32_from64(buf, &buf64);
>>   
>>   /*	return rc;
>>    * }
>> diff --git a/ports/linux/guts/fstatat64.c b/ports/linux/guts/fstatat64.c
>> index c981e14..13c1143 100644
>> --- a/ports/linux/guts/fstatat64.c
>> +++ b/ports/linux/guts/fstatat64.c
>> @@ -1,4 +1,5 @@
>>   /*
>> + * Copyright (c) 2008-2010 Wind River Systems;
>>    * Copyright (c) 2021 Linux Foundation; see
>>    * guts/COPYRIGHT for information.
>>    *
>> @@ -8,7 +9,46 @@
>>    *	int rc = -1;
>>    */
>>   
>> -	rc = wrap___fxstatat64(_STAT_VER, dirfd, path, buf, flags);
>> +	pseudo_msg_t *msg;
>> +	int save_errno;
>> +
>> +#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
>> +	if (dirfd != AT_FDCWD) {
>> +		errno = ENOSYS;
>> +		return -1;
>> +	}
>> +#endif
>> +	if (flags & AT_SYMLINK_NOFOLLOW) {
>> +#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
>> +		rc = real_lstat64(path, buf);
>> +#else
>> +		rc = real_fstatat64(dirfd, path, buf, flags);
>> +#endif
>> +		if (rc == -1) {
>> +			return rc;
>> +		}
>> +	} else {
>> +#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
>> +		rc = real_stat64(path, buf);
>> +#else
>> +		rc = real_fstatat64(dirfd, path, buf, flags);
>> +#endif
>> +		if (rc == -1) {
>> +			return rc;
>> +		}
>> +	}
>> +	save_errno = errno;
>> +
>> +	/* query database
>> +	 * note that symlink canonicalizing is now automatic, so we
>> +	 * don't need to check for a symlink on this end
>> +	 */
>> +	msg = pseudo_client_op(OP_STAT, 0, -1, dirfd, path, buf);
>> +	if (msg && msg->result == RESULT_SUCCEED) {
>> +		pseudo_stat_msg(buf, msg);
>> +	}
>> +
>> +	errno = save_errno;
>>   
>>   /*	return rc;
>>    * }
>> diff --git a/ports/linux/guts/lstat.c b/ports/linux/guts/lstat.c
>> index d2c4d50..0bc9362 100644
>> --- a/ports/linux/guts/lstat.c
>> +++ b/ports/linux/guts/lstat.c
>> @@ -8,7 +8,7 @@
>>    *	int rc = -1;
>>    */
>>   
>> -	rc = wrap___fxstatat(_STAT_VER, AT_FDCWD, path, buf, AT_SYMLINK_NOFOLLOW);
>> +	rc = wrap_fstatat(AT_FDCWD, path, buf, AT_SYMLINK_NOFOLLOW);
>>   
>>   /*	return rc;
>>    * }
>> diff --git a/ports/linux/guts/lstat64.c b/ports/linux/guts/lstat64.c
>> index 43d0ce1..9e0ff19 100644
>> --- a/ports/linux/guts/lstat64.c
>> +++ b/ports/linux/guts/lstat64.c
>> @@ -8,7 +8,7 @@
>>    *	int rc = -1;
>>    */
>>   
>> -	rc = wrap___fxstatat64(_STAT_VER, AT_FDCWD, path, buf, AT_SYMLINK_NOFOLLOW);
>> +	rc = wrap_fstatat64(AT_FDCWD, path, buf, AT_SYMLINK_NOFOLLOW);
>>   
>>   /*	return rc;
>>    * }
>> diff --git a/ports/linux/guts/mknod.c b/ports/linux/guts/mknod.c
>> index 61fd320..66787c0 100644
>> --- a/ports/linux/guts/mknod.c
>> +++ b/ports/linux/guts/mknod.c
>> @@ -8,7 +8,7 @@
>>    *	int rc = -1;
>>    */
>>   
>> -	rc = wrap___xmknod(_MKNOD_VER, path, mode, &dev);
>> +	rc = wrap_mknodat(AT_FDCWD, path, mode, dev);
>>   
>>   /*	return rc;
>>    * }
>> diff --git a/ports/linux/guts/mknodat.c b/ports/linux/guts/mknodat.c
>> index a7e4293..c51a82d 100644
>> --- a/ports/linux/guts/mknodat.c
>> +++ b/ports/linux/guts/mknodat.c
>> @@ -1,4 +1,5 @@
>>   /*
>> + * Copyright (c) 2008-2010 Wind River Systems; see
>>    * Copyright (c) 2016 Wind River Systems; see
>>    * guts/COPYRIGHT for information.
>>    *
>> @@ -8,7 +9,75 @@
>>    *	int rc = -1;
>>    */
>>   
>> -	rc = wrap___xmknodat(_MKNOD_VER, dirfd, path, mode, &dev);
>> +	pseudo_msg_t *msg;
>> +	struct stat64 buf;
>> +
>> +	/* mask out mode bits appropriately */
>> +	mode = mode & ~pseudo_umask;
>> +        /* if you don't specify a type, assume regular file */
>> +        if (!(mode & S_IFMT)) {
>> +                mode |= S_IFREG;
>> +        }
>> +        pseudo_debug(PDBGF_FILE, "mknodat creating '%s', mode 0%o\n",
>> +                path ? path : "<no name>", (int) mode);
>> +
>> +#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
>> +	if (dirfd != AT_FDCWD) {
>> +		errno = ENOSYS;
>> +		return -1;
>> +	}
>> +	rc = real_stat64(path, &buf);
>> +#else
>> +	rc = real_fstatat64(dirfd, path, &buf, AT_SYMLINK_NOFOLLOW);
>> +#endif
>> +	if (rc != -1) {
>> +		/* if we can stat the file, you can't mknod it */
>> +		errno = EEXIST;
>> +		return -1;
>> +	}
>> +	if (!dev) {
>> +		errno = EINVAL;
>> +		return -1;
>> +	}
>> +#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
>> +	rc = real_open(path, O_CREAT | O_WRONLY | O_EXCL,
>> +		PSEUDO_FS_MODE(mode, 0));
>> +#else
>> +	rc = real_openat(dirfd, path, O_CREAT | O_WRONLY | O_EXCL,
>> +		PSEUDO_FS_MODE(mode, 0));
>> +#endif
>> +	if (rc == -1) {
>> +		return -1;
>> +	}
>> +	real_fchmod(rc, PSEUDO_FS_MODE(mode, 0));
>> +	real_fstat64(rc, &buf);
>> +	/* mknod does not really open the file.  We don't have
>> +	 * to use wrap_close because we've never exposed this file
>> +	 * descriptor to the client code.
>> +	 */
>> +	real_close(rc);
>> +
>> +	/* mask in the mode type bits again */
>> +	buf.st_mode = (PSEUDO_DB_MODE(buf.st_mode, mode) & 07777) |
>> +			(mode & ~07777);
>> +	buf.st_rdev = dev;
>> +	msg = pseudo_client_op(OP_MKNOD, 0, -1, dirfd, path, &buf);
>> +	if (msg && msg->result != RESULT_SUCCEED) {
>> +		errno = EPERM;
>> +		rc = -1;
>> +	} else {
>> +		/* just pretend we worked */
>> +		rc = 0;
>> +	}
>> +	if (rc == -1) {
>> +		int save_errno = errno;
>> +#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
>> +		real_unlink(path);
>> +#else
>> +		real_unlinkat(dirfd, path, AT_SYMLINK_NOFOLLOW);
>> +#endif
>> +		errno = save_errno;
>> +	}
>>   
>>   /*	return rc;
>>    * }
>> diff --git a/ports/linux/guts/mkostemp64.c b/ports/linux/guts/mkostemp64.c
>> index 502211b..694070b 100644
>> --- a/ports/linux/guts/mkostemp64.c
>> +++ b/ports/linux/guts/mkostemp64.c
>> @@ -35,7 +35,7 @@
>>   	if (rc != -1) {
>>   		save_errno = errno;
>>   
>> -		if (real___fxstat64(_STAT_VER, rc, &buf) != -1) {
>> +		if (base_fstat64(rc, &buf) != -1) {
>>   			real_fchmod(rc, PSEUDO_FS_MODE(0600, 0));
>>   			pseudo_client_op(OP_CREAT, 0, -1, -1, tmp_template, &buf);
>>   			pseudo_client_op(OP_OPEN, PSA_READ | PSA_WRITE, rc, -1, tmp_template, &buf);
>> diff --git a/ports/linux/guts/openat.c b/ports/linux/guts/openat.c
>> index 656ac2b..d027154 100644
>> --- a/ports/linux/guts/openat.c
>> +++ b/ports/linux/guts/openat.c
>> @@ -56,12 +56,12 @@
>>   		save_errno = errno;
>>   #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
>>   		if (flags & O_NOFOLLOW) {
>> -			rc = real___lxstat64(_STAT_VER, path, &buf);
>> +			rc = base_lstat64(path, &buf);
>>   		} else {
>> -			rc = real___xstat64(_STAT_VER, path, &buf);
>> +			rc = base_stat64(path, &buf);
>>   		}
>>   #else
>> -		rc = real___fxstatat64(_STAT_VER, dirfd, path, &buf, (flags & O_NOFOLLOW) ? AT_SYMLINK_NOFOLLOW : 0);
>> +		rc = base_fstatat64(dirfd, path, &buf, (flags & O_NOFOLLOW) ? AT_SYMLINK_NOFOLLOW : 0);
>>   #endif
>>   		existed = (rc != -1);
>>   		if (!existed)
>> @@ -77,12 +77,12 @@
>>   		save_errno = errno;
>>   #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
>>   		if (flags & O_NOFOLLOW) {
>> -			rc = real___lxstat64(_STAT_VER, path, &buf);
>> +			rc = base_lstat64(path, &buf);
>>   		} else {
>> -			rc = real___xstat64(_STAT_VER, path, &buf);
>> +			rc = base_stat64(path, &buf);
>>   		}
>>   #else
>> -		rc = real___fxstatat64(_STAT_VER, dirfd, path, &buf, (flags & O_NOFOLLOW) ? AT_SYMLINK_NOFOLLOW : 0);
>> +		rc = base_fstatat64(dirfd, path, &buf, (flags & O_NOFOLLOW) ? AT_SYMLINK_NOFOLLOW : 0);
>>   #endif
>>   		if (rc != -1 && S_ISFIFO(buf.st_mode)) {
>>   			overly_magic_nonblocking = 1;
>> @@ -135,12 +135,12 @@
>>   #endif
>>   #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
>>   		if (flags & O_NOFOLLOW) {
>> -			stat_rc = real___lxstat64(_STAT_VER, path, &buf);
>> +			stat_rc = base_lstat64(path, &buf);
>>   		} else {
>> -			stat_rc = real___xstat64(_STAT_VER, path, &buf);
>> +			stat_rc = base_xstat64(path, &buf);
>>   		}
>>   #else
>> -		stat_rc = real___fxstatat64(_STAT_VER, dirfd, path, &buf, (flags & O_NOFOLLOW) ? AT_SYMLINK_NOFOLLOW : 0);
>> +		stat_rc = base_fstatat64(dirfd, path, &buf, (flags & O_NOFOLLOW) ? AT_SYMLINK_NOFOLLOW : 0);
>>   #endif
>>   
>>   		pseudo_debug(PDBGF_FILE, "openat(path %s), flags %o, stat rc %d, stat mode %o\n",
>> diff --git a/ports/linux/guts/stat.c b/ports/linux/guts/stat.c
>> index f8c73f7..ccd00db 100644
>> --- a/ports/linux/guts/stat.c
>> +++ b/ports/linux/guts/stat.c
>> @@ -8,7 +8,7 @@
>>    *	int rc = -1;
>>    */
>>   
>> -	rc = wrap___fxstatat(_STAT_VER, AT_FDCWD, path, buf, 0);
>> +	rc = wrap_fstatat(AT_FDCWD, path, buf, 0);
>>   
>>   /*	return rc;
>>    * }
>> diff --git a/ports/linux/guts/stat64.c b/ports/linux/guts/stat64.c
>> index d8b3f36..391a73f 100644
>> --- a/ports/linux/guts/stat64.c
>> +++ b/ports/linux/guts/stat64.c
>> @@ -8,7 +8,7 @@
>>    *	int rc = -1;
>>    */
>>   
>> -	rc = wrap___fxstatat64(_STAT_VER, AT_FDCWD, path, buf, 0);
>> +	rc = wrap_fstatat64(AT_FDCWD, path, buf, 0);
>>   
>>   /*	return rc;
>>    * }
>> diff --git a/ports/linux/old__x/README b/ports/linux/old__x/README
>> new file mode 100644
>> index 0000000..c94413f
>> --- /dev/null
>> +++ b/ports/linux/old__x/README
>> @@ -0,0 +1,28 @@
>> +Older glibcs contain stat functions such as:
>> +
>> +__fxstat
>> +__fxstatat
>> +__lxstat
>> +__xstat
>> +
>> +__fxstat64
>> +__fxstatat64
>> +__lxstat64
>> +__xstat64
>> +
>> +The format of these functions use the _STAT_VER defintion.  New glibc no
>> +longer define or utilize these functions, so neither can we.
>> +
>> +We only use this subport when the functions are present, this is checked
>> +by with the existence of _STAT_VER.
>> +
>> +Older glibcs also contain mknod functions such as:
>> +
>> +__xmknod
>> +__xmknodat
>> +
>> +The format of these functions use the _MKNOD_VER defintion.  New glibc no
>> +longer define or utilize these functions, so neither can we.
>> +
>> +We only use this subport when the functions are present, this is checked
>> +by with the existence of _MKNOD_VER.
>> diff --git a/ports/linux/guts/__fxstat.c b/ports/linux/old__x/guts/__fxstat.c
>> similarity index 100%
>> rename from ports/linux/guts/__fxstat.c
>> rename to ports/linux/old__x/guts/__fxstat.c
>> diff --git a/ports/linux/guts/__fxstat64.c b/ports/linux/old__x/guts/__fxstat64.c
>> similarity index 100%
>> rename from ports/linux/guts/__fxstat64.c
>> rename to ports/linux/old__x/guts/__fxstat64.c
>> diff --git a/ports/linux/guts/__fxstatat.c b/ports/linux/old__x/guts/__fxstatat.c
>> similarity index 100%
>> rename from ports/linux/guts/__fxstatat.c
>> rename to ports/linux/old__x/guts/__fxstatat.c
>> diff --git a/ports/linux/guts/__fxstatat64.c b/ports/linux/old__x/guts/__fxstatat64.c
>> similarity index 100%
>> rename from ports/linux/guts/__fxstatat64.c
>> rename to ports/linux/old__x/guts/__fxstatat64.c
>> diff --git a/ports/linux/guts/__lxstat.c b/ports/linux/old__x/guts/__lxstat.c
>> similarity index 100%
>> rename from ports/linux/guts/__lxstat.c
>> rename to ports/linux/old__x/guts/__lxstat.c
>> diff --git a/ports/linux/guts/__lxstat64.c b/ports/linux/old__x/guts/__lxstat64.c
>> similarity index 100%
>> rename from ports/linux/guts/__lxstat64.c
>> rename to ports/linux/old__x/guts/__lxstat64.c
>> diff --git a/ports/linux/guts/__xmknod.c b/ports/linux/old__x/guts/__xmknod.c
>> similarity index 100%
>> rename from ports/linux/guts/__xmknod.c
>> rename to ports/linux/old__x/guts/__xmknod.c
>> diff --git a/ports/linux/guts/__xmknodat.c b/ports/linux/old__x/guts/__xmknodat.c
>> similarity index 100%
>> rename from ports/linux/guts/__xmknodat.c
>> rename to ports/linux/old__x/guts/__xmknodat.c
>> diff --git a/ports/linux/guts/__xstat.c b/ports/linux/old__x/guts/__xstat.c
>> similarity index 100%
>> rename from ports/linux/guts/__xstat.c
>> rename to ports/linux/old__x/guts/__xstat.c
>> diff --git a/ports/linux/guts/__xstat64.c b/ports/linux/old__x/guts/__xstat64.c
>> similarity index 100%
>> rename from ports/linux/guts/__xstat64.c
>> rename to ports/linux/old__x/guts/__xstat64.c
>> diff --git a/ports/linux/old__x/guts/fstat.c b/ports/linux/old__x/guts/fstat.c
>> new file mode 100644
>> index 0000000..b089b15
>> --- /dev/null
>> +++ b/ports/linux/old__x/guts/fstat.c
>> @@ -0,0 +1,15 @@
>> +/*
>> + * Copyright (c) 2011 Wind River Systems; see
>> + * guts/COPYRIGHT for information.
>> + *
>> + * SPDX-License-Identifier: LGPL-2.1-only
>> + *
>> + * int fstat(int fd, struct stat *buf)
>> + *	int rc = -1;
>> + */
>> +
>> +	rc = wrap___fxstat(_STAT_VER, fd, buf);
>> +
>> +/*	return rc;
>> + * }
>> + */
>> diff --git a/ports/linux/old__x/guts/fstat64.c b/ports/linux/old__x/guts/fstat64.c
>> new file mode 100644
>> index 0000000..6dd97da
>> --- /dev/null
>> +++ b/ports/linux/old__x/guts/fstat64.c
>> @@ -0,0 +1,15 @@
>> +/*
>> + * Copyright (c) 2012 Wind River Systems; see
>> + * guts/COPYRIGHT for information.
>> + *
>> + * SPDX-License-Identifier: LGPL-2.1-only
>> + *
>> + * int fstat64(int fd, struct stat *buf)
>> + *	int rc = -1;
>> + */
>> +
>> +	rc = wrap___fxstat64(_STAT_VER, fd, buf);
>> +
>> +/*	return rc;
>> + * }
>> + */
>> diff --git a/ports/linux/old__x/guts/fstatat.c b/ports/linux/old__x/guts/fstatat.c
>> new file mode 100644
>> index 0000000..3267641
>> --- /dev/null
>> +++ b/ports/linux/old__x/guts/fstatat.c
>> @@ -0,0 +1,15 @@
>> +/*
>> + * Copyright (c) 2021 Linux Foundation; see
>> + * guts/COPYRIGHT for information.
>> + *
>> + * SPDX-License-Identifier: LGPL-2.1-only
>> + *
>> + * int fstatat(int dirfd, const char *path, struct stat *buf, int flags)
>> + *	int rc = -1;
>> + */
>> +
>> +	rc = wrap___fxstatat(_STAT_VER, dirfd, path, buf, flags);
>> +
>> +/*	return rc;
>> + * }
>> + */
>> diff --git a/ports/linux/old__x/guts/fstatat64.c b/ports/linux/old__x/guts/fstatat64.c
>> new file mode 100644
>> index 0000000..c981e14
>> --- /dev/null
>> +++ b/ports/linux/old__x/guts/fstatat64.c
>> @@ -0,0 +1,15 @@
>> +/*
>> + * Copyright (c) 2021 Linux Foundation; see
>> + * guts/COPYRIGHT for information.
>> + *
>> + * SPDX-License-Identifier: LGPL-2.1-only
>> + *
>> + * int fstatat64(int dirfd, const char *path, struct stat64 *buf, int flags)
>> + *	int rc = -1;
>> + */
>> +
>> +	rc = wrap___fxstatat64(_STAT_VER, dirfd, path, buf, flags);
>> +
>> +/*	return rc;
>> + * }
>> + */
>> diff --git a/ports/linux/old__x/guts/lstat.c b/ports/linux/old__x/guts/lstat.c
>> new file mode 100644
>> index 0000000..d2c4d50
>> --- /dev/null
>> +++ b/ports/linux/old__x/guts/lstat.c
>> @@ -0,0 +1,15 @@
>> +/*
>> + * Copyright (c) 2011 Wind River Systems; see
>> + * guts/COPYRIGHT for information.
>> + *
>> + * SPDX-License-Identifier: LGPL-2.1-only
>> + *
>> + * int lstat(const char *path, struct stat *buf)
>> + *	int rc = -1;
>> + */
>> +
>> +	rc = wrap___fxstatat(_STAT_VER, AT_FDCWD, path, buf, AT_SYMLINK_NOFOLLOW);
>> +
>> +/*	return rc;
>> + * }
>> + */
>> diff --git a/ports/linux/old__x/guts/lstat64.c b/ports/linux/old__x/guts/lstat64.c
>> new file mode 100644
>> index 0000000..43d0ce1
>> --- /dev/null
>> +++ b/ports/linux/old__x/guts/lstat64.c
>> @@ -0,0 +1,15 @@
>> +/*
>> + * Copyright (c) 2012 Wind River Systems; see
>> + * guts/COPYRIGHT for information.
>> + *
>> + * SPDX-License-Identifier: LGPL-2.1-only
>> + *
>> + * int lstat64(const char *path, struct stat *buf)
>> + *	int rc = -1;
>> + */
>> +
>> +	rc = wrap___fxstatat64(_STAT_VER, AT_FDCWD, path, buf, AT_SYMLINK_NOFOLLOW);
>> +
>> +/*	return rc;
>> + * }
>> + */
>> diff --git a/ports/linux/old__x/guts/mknod.c b/ports/linux/old__x/guts/mknod.c
>> new file mode 100644
>> index 0000000..61fd320
>> --- /dev/null
>> +++ b/ports/linux/old__x/guts/mknod.c
>> @@ -0,0 +1,15 @@
>> +/*
>> + * Copyright (c) 2016 Wind River Systems; see
>> + * guts/COPYRIGHT for information.
>> + *
>> + * SPDX-License-Identifier: LGPL-2.1-only
>> + *
>> + * int mknod(const char *path, mode_t mode, dev_t dev)
>> + *	int rc = -1;
>> + */
>> +
>> +	rc = wrap___xmknod(_MKNOD_VER, path, mode, &dev);
>> +
>> +/*	return rc;
>> + * }
>> + */
>> diff --git a/ports/linux/old__x/guts/mknodat.c b/ports/linux/old__x/guts/mknodat.c
>> new file mode 100644
>> index 0000000..a7e4293
>> --- /dev/null
>> +++ b/ports/linux/old__x/guts/mknodat.c
>> @@ -0,0 +1,15 @@
>> +/*
>> + * Copyright (c) 2016 Wind River Systems; see
>> + * guts/COPYRIGHT for information.
>> + *
>> + * SPDX-License-Identifier: LGPL-2.1-only
>> + *
>> + * int mknodat(int dirfd, const char *path, mode_t mode, dev_t dev)
>> + *	int rc = -1;
>> + */
>> +
>> +	rc = wrap___xmknodat(_MKNOD_VER, dirfd, path, mode, &dev);
>> +
>> +/*	return rc;
>> + * }
>> + */
>> diff --git a/ports/linux/old__x/guts/mkostemp64.c b/ports/linux/old__x/guts/mkostemp64.c
>> new file mode 100644
>> index 0000000..502211b
>> --- /dev/null
>> +++ b/ports/linux/old__x/guts/mkostemp64.c
>> @@ -0,0 +1,53 @@
>> +/*
>> + * Copyright (c) 2010 Wind River Systems; see
>> + * guts/COPYRIGHT for information.
>> + *
>> + * SPDX-License-Identifier: LGPL-2.1-only
>> + *
>> + * static int
>> + * wrap_mkstemp64(char *template, int oflags) {
>> + *	int rc = -1;
>> + */
>> +	struct stat64 buf;
>> + 	int save_errno;
>> +	size_t len;
>> +	char *tmp_template;
>> +
>> +	if (!template) {
>> +		errno = EFAULT;
>> +		return 0;
>> +	}
>> +
>> +	len = strlen(template);
>> +	tmp_template = PSEUDO_ROOT_PATH(AT_FDCWD, template, AT_SYMLINK_NOFOLLOW);
>> +
>> +	if (!tmp_template) {
>> +		errno = ENOENT;
>> +		return -1;
>> +	}
>> +
>> +	/* mkstemp64 wrapper uses this code and mkostemp64 not present in some glibc versions */
>> +	if (oflags == 0)
>> +		rc = real_mkstemp64(tmp_template);
>> +	else
>> +		rc = real_mkostemp64(tmp_template, oflags);
>> +
>> +	if (rc != -1) {
>> +		save_errno = errno;
>> +
>> +		if (real___fxstat64(_STAT_VER, rc, &buf) != -1) {
>> +			real_fchmod(rc, PSEUDO_FS_MODE(0600, 0));
>> +			pseudo_client_op(OP_CREAT, 0, -1, -1, tmp_template, &buf);
>> +			pseudo_client_op(OP_OPEN, PSA_READ | PSA_WRITE, rc, -1, tmp_template, &buf);
>> +		} else {
>> +			pseudo_debug(PDBGF_CONSISTENCY, "mkstemp (fd %d) succeeded, but fstat failed (%s).\n",
>> +				rc, strerror(errno));
>> +			pseudo_client_op(OP_OPEN, PSA_READ | PSA_WRITE, rc, -1, tmp_template, 0);
>> +		}
>> +		errno = save_errno;
>> +	}
>> +	/* mkstemp only changes the XXXXXX at the end. */
>> +	memcpy(template + len - 6, tmp_template + strlen(tmp_template) - 6, 6);
>> +/*	return rc;
>> + * }
>> + */
>> diff --git a/ports/linux/old__x/portdefs.h b/ports/linux/old__x/portdefs.h
>> new file mode 100644
>> index 0000000..f2bdc22
>> --- /dev/null
>> +++ b/ports/linux/old__x/portdefs.h
>> @@ -0,0 +1,40 @@
>> +/*
>> + * SPDX-License-Identifier: LGPL-2.1-only
>> + *
>> + */
>> +
>> +/* If the subport was enabled, and these are not defined provide a default */
>> +#ifndef _STAT_VER
>> +#if defined (__aarch64__)
>> +#define _STAT_VER 0
>> +#elif defined (__x86_64__)
>> +#define _STAT_VER 1
>> +#else
>> +#define _STAT_VER 3
>> +#endif
>> +#endif
>> +
>> +#if PSEUDO_STATBUF_64
>> +#define base_fstat(fd, buf) real___fxstat64(_STAT_VER, fd, buf)
>> +#define base_stat(path, buf) real___xstat64(_STAT_VER, path, buf)
>> +#define base_fstatat(dirfd, path, buf, flags) real___fxstatat64(_STAT_VER, dirfd, path, buf, flags)
>> +#else
>> +#define base_fstat(fd, buf) real___fxstat(_STAT_VER, fd, buf)
>> +#define base_stat(path, buf) real___xstat(_STAT_VER, path, buf)
>> +#define base_fstatat(dirfd, path, buf, flags) real___fxstatat(_STAT_VER, dirfd, path, buf, flags)
>> +#endif
>> +
>> +#define base_fstat64(path, buf) real___fxstat64(_STAT_VER, path, buf)
>> +#define base_stat64(path, buf) real___xstat64(_STAT_VER, path, buf)
>> +#define base_fstatat64(dirfd, path, buf, flags) real___fxstatat64(_STAT_VER, dirfd, path, buf, flags)
>> +
>> +/* If the subport was enabled, and these are not defined provide a default */
>> +#ifndef _MKNOD_VER
>> +#if defined (__aarch64__)
>> +#define _MKNOD_VER 0
>> +#elif defined (__x86_64__)
>> +#define _MKNOD_VER 0
>> +#else
>> +#define _MKNOD_VER 1
>> +#endif
>> +#endif
>> diff --git a/ports/linux/old__x/pseudo_wrappers.c b/ports/linux/old__x/pseudo_wrappers.c
>> new file mode 100644
>> index 0000000..455bc09
>> --- /dev/null
>> +++ b/ports/linux/old__x/pseudo_wrappers.c
>> @@ -0,0 +1,48 @@
>> +/*
>> + * SPDX-License-Identifier: LGPL-2.1-only
>> + *
>> + */
>> +/* the unix port wants to know that real_stat() and
>> + * friends exist.  So they do. And because the Linux
>> + * port really uses stat64 for those...
>> + */
>> +int
>> +pseudo_stat(const char *path, struct stat *buf) {
>> +	return real___xstat(_STAT_VER, path, buf);
>> +}
>> +
>> +int
>> +pseudo_lstat(const char *path, struct stat *buf) {
>> +	return real___lxstat(_STAT_VER, path, buf);
>> +}
>> +
>> +int
>> +pseudo_fstat(int fd, struct stat *buf) {
>> +	return real___fxstat(_STAT_VER, fd, buf);
>> +}
>> +
>> +int
>> +pseudo_stat64(const char *path, struct stat64 *buf) {
>> +	return real___xstat64(_STAT_VER, path, buf);
>> +}
>> +
>> +int
>> +pseudo_lstat64(const char *path, struct stat64 *buf) {
>> +	return real___lxstat64(_STAT_VER, path, buf);
>> +}
>> +
>> +int
>> +pseudo_fstat64(int fd, struct stat64 *buf) {
>> +	return real___fxstat64(_STAT_VER, fd, buf);
>> +}
>> +
>> +/* similar thing happens with mknod */
>> +int
>> +pseudo_mknod(const char *path, mode_t mode, dev_t dev) {
>> +	return real___xmknod(_MKNOD_VER, path, mode, &dev);
>> +}
>> +
>> +int
>> +pseudo_mknodat(int dirfd, const char *path, mode_t mode, dev_t dev) {
>> +	return real___xmknodat(_MKNOD_VER, dirfd, path, mode, &dev);
>> +}
>> diff --git a/ports/linux/old__x/wrapfuncs.in b/ports/linux/old__x/wrapfuncs.in
>> new file mode 100644
>> index 0000000..de24e63
>> --- /dev/null
>> +++ b/ports/linux/old__x/wrapfuncs.in
>> @@ -0,0 +1,18 @@
>> +int __xstat(int ver, const char *path, struct stat *buf);
>> +int __lxstat(int ver, const char *path, struct stat *buf); /* flags=AT_SYMLINK_NOFOLLOW */
>> +int __fxstat(int ver, int fd, struct stat *buf);
>> +int __fxstatat(int ver, int dirfd, const char *path, struct stat *buf, int flags);
>> +int __xstat64(int ver, const char *path, struct stat64 *buf);
>> +int __lxstat64(int ver, const char *path, struct stat64 *buf); /* flags=AT_SYMLINK_NOFOLLOW */
>> +int __fxstat64(int ver, int fd, struct stat64 *buf);
>> +int __fxstatat64(int ver, int dirfd, const char *path, struct stat64 *buf, int flags);
>> +
>> +int stat(const char *path, struct stat *buf); /* real_func=pseudo_stat */
>> +int lstat(const char *path, struct stat *buf); /* real_func=pseudo_lstat, flags=AT_SYMLINK_NOFOLLOW */
>> +int lstat64(const char *path, struct stat64 *buf); /* real_func=pseudo_lstat64, flags=AT_SYMLINK_NOFOLLOW */
>> +int fstat64(int fd, struct stat64 *buf); /* real_func=pseudo_fstat64 */
>> +
>> +int __xmknod(int ver, const char *path, mode_t mode, dev_t *dev); /* flags=AT_SYMLINK_NOFOLLOW */
>> +int __xmknodat(int ver, int dirfd, const char *path, mode_t mode, dev_t *dev); /* flags=AT_SYMLINK_NOFOLLOW */
>> +int mknod(const char *path, mode_t mode, dev_t dev); /* real_func=pseudo_mknod */
>> +int mknodat(int dirfd, const char *path, mode_t mode, dev_t dev); /* real_func=pseudo_mknodat */
>> diff --git a/ports/linux/portdefs.h b/ports/linux/portdefs.h
>> index 9545550..a92e969 100644
>> --- a/ports/linux/portdefs.h
>> +++ b/ports/linux/portdefs.h
>> @@ -34,22 +34,3 @@ GLIBC_COMPAT_SYMBOL(memcpy,2.0);
>>   #include <sys/syscall.h>
>>   #include <sys/prctl.h>
>>   #include <linux/seccomp.h>
>> -
>> -#ifndef _STAT_VER
>> -#if defined (__aarch64__)
>> -#define _STAT_VER 0
>> -#elif defined (__x86_64__)
>> -#define _STAT_VER 1
>> -#else
>> -#define _STAT_VER 3
>> -#endif
>> -#endif
>> -#ifndef _MKNOD_VER
>> -#if defined (__aarch64__)
>> -#define _MKNOD_VER 0
>> -#elif defined (__x86_64__)
>> -#define _MKNOD_VER 0
>> -#else
>> -#define _MKNOD_VER 1
>> -#endif
>> -#endif
>> diff --git a/ports/linux/pseudo_wrappers.c b/ports/linux/pseudo_wrappers.c
>> index 7659897..7a4f549 100644
>> --- a/ports/linux/pseudo_wrappers.c
>> +++ b/ports/linux/pseudo_wrappers.c
>> @@ -2,50 +2,7 @@
>>    * SPDX-License-Identifier: LGPL-2.1-only
>>    *
>>    */
>> -/* the unix port wants to know that real_stat() and
>> - * friends exist.  So they do. And because the Linux
>> - * port really uses stat64 for those...
>> - */
>> -int
>> -pseudo_stat(const char *path, struct stat *buf) {
>> -	return real___xstat(_STAT_VER, path, buf);
>> -}
>> -
>> -int
>> -pseudo_lstat(const char *path, struct stat *buf) {
>> -	return real___lxstat(_STAT_VER, path, buf);
>> -}
>> -
>> -int
>> -pseudo_fstat(int fd, struct stat *buf) {
>> -	return real___fxstat(_STAT_VER, fd, buf);
>> -}
>> -
>> -int
>> -pseudo_stat64(const char *path, struct stat64 *buf) {
>> -	return real___xstat64(_STAT_VER, path, buf);
>> -}
>> -
>> -int
>> -pseudo_lstat64(const char *path, struct stat64 *buf) {
>> -	return real___lxstat64(_STAT_VER, path, buf);
>> -}
>> -
>> -int
>> -pseudo_fstat64(int fd, struct stat64 *buf) {
>> -	return real___fxstat64(_STAT_VER, fd, buf);
>> -}
>> -
>>   /* similar thing happens with mknod */
>> -int
>> -pseudo_mknod(const char *path, mode_t mode, dev_t dev) {
>> -	return real___xmknod(_MKNOD_VER, path, mode, &dev);
>> -}
>> -
>> -int
>> -pseudo_mknodat(int dirfd, const char *path, mode_t mode, dev_t dev) {
>> -	return real___xmknodat(_MKNOD_VER, dirfd, path, mode, &dev);
>> -}
>>   
>>   int pseudo_capset(cap_user_header_t hdrp, const cap_user_data_t datap) {
>>   	(void)hdrp;
>> diff --git a/ports/linux/subports b/ports/linux/subports
>> index 099ea59..53f6696 100755
>> --- a/ports/linux/subports
>> +++ b/ports/linux/subports
>> @@ -70,3 +70,18 @@ else
>>   fi
>>   rm -f dummy.c dummy.o
>>   
>> +# Check if _STAT_VER is defined.  This is an indication that the old internal __*xstat* functions are available
>> +# Check if _MKNOD_VER is defined.  This is an indication that the old internal __xmknod* functions are available
>> +cat > dummy.c <<EOF
>> +#include <sys/stat.h>
>> +#ifndef _STAT_VER
>> +#error _STAT_VER not defined
>> +#endif
>> +#ifndef _MKNOD_VER
>> +#error _MKNOD_VER not defined
>> +#endif
>> +EOF
>> +if ${CC} -c -o dummy.o dummy.c >/dev/null 2>&1; then
>> +        echo "linux/old__x"
>> +fi
>> +rm -f dummy.c dummy.o
>> diff --git a/ports/linux/wrapfuncs.in b/ports/linux/wrapfuncs.in
>> index 97b16c2..5187fd8 100644
>> --- a/ports/linux/wrapfuncs.in
>> +++ b/ports/linux/wrapfuncs.in
>> @@ -1,17 +1,11 @@
>>   int open(const char *path, int flags, ...{mode_t mode}); /* flags=flags&O_NOFOLLOW, noignore_path=1 */
>>   char *get_current_dir_name(void);
>> -int __xstat(int ver, const char *path, struct stat *buf);
>> -int __lxstat(int ver, const char *path, struct stat *buf); /* flags=AT_SYMLINK_NOFOLLOW */
>> -int __fxstat(int ver, int fd, struct stat *buf);
>>   int lchmod(const char *path, mode_t mode); /* flags=AT_SYMLINK_NOFOLLOW */
>>   int lchown(const char *path, uid_t owner, gid_t group); /* flags=AT_SYMLINK_NOFOLLOW */
>> -int __fxstatat(int ver, int dirfd, const char *path, struct stat *buf, int flags);
>>   int openat(int dirfd, const char *path, int flags, ...{mode_t mode}); /* flags=flags&O_NOFOLLOW, noignore_path=1 */
>>   int __openat_2(int dirfd, const char *path, int flags); /* flags=flags&O_NOFOLLOW, noignore_path=1 */
>> -int mknod(const char *path, mode_t mode, dev_t dev); /* real_func=pseudo_mknod */
>> -int mknodat(int dirfd, const char *path, mode_t mode, dev_t dev); /* real_func=pseudo_mknodat */
>> -int __xmknod(int ver, const char *path, mode_t mode, dev_t *dev); /* flags=AT_SYMLINK_NOFOLLOW */
>> -int __xmknodat(int ver, int dirfd, const char *path, mode_t mode, dev_t *dev); /* flags=AT_SYMLINK_NOFOLLOW */
>> +int mknod(const char *path, mode_t mode, dev_t dev);
>> +int mknodat(int dirfd, const char *path, mode_t mode, dev_t dev);
>>   int fcntl(int fd, int cmd, ...{struct flock *lock});  /* noignore_path=1 */
>>   int fcntl64(int fd, int cmd, ...{struct flock *lock});  /* noignore_path=1 */
>>   # just so we know the inums of symlinks
>> @@ -21,18 +15,14 @@ int open64(const char *path, int flags, ...{mode_t mode}); /* flags=flags&O_NOFO
>>   int openat64(int dirfd, const char *path, int flags, ...{mode_t mode}); /* flags=flags&O_NOFOLLOW, noignore_path=1 */
>>   int __openat64_2(int dirfd, const char *path, int flags); /* flags=flags&O_NOFOLLOW, noignore_path=1 */
>>   int creat64(const char *path, mode_t mode);
>> -int stat(const char *path, struct stat *buf); /* real_func=pseudo_stat */
>> -int lstat(const char *path, struct stat *buf); /* real_func=pseudo_lstat, flags=AT_SYMLINK_NOFOLLOW */
>> -int fstat(int fd, struct stat *buf); /* real_func=pseudo_fstat */
>> +int stat(const char *path, struct stat *buf);
>> +int lstat(const char *path, struct stat *buf); /* flags=AT_SYMLINK_NOFOLLOW */
>> +int fstat(int fd, struct stat *buf);
>>   int fstatat(int dirfd, const char *path, struct stat *buf, int flags);
>> -int stat64(const char *path, struct stat64 *buf); /* real_func=pseudo_stat64 */
>> -int lstat64(const char *path, struct stat64 *buf); /* real_func=pseudo_lstat64, flags=AT_SYMLINK_NOFOLLOW */
>> -int fstat64(int fd, struct stat64 *buf); /* real_func=pseudo_fstat64 */
>> +int stat64(const char *path, struct stat64 *buf);
>> +int lstat64(const char *path, struct stat64 *buf); /* flags=AT_SYMLINK_NOFOLLOW */
>> +int fstat64(int fd, struct stat64 *buf);
>>   int fstatat64(int dirfd, const char *path, struct stat64 *buf, int flags);
>> -int __xstat64(int ver, const char *path, struct stat64 *buf);
>> -int __lxstat64(int ver, const char *path, struct stat64 *buf); /* flags=AT_SYMLINK_NOFOLLOW */
>> -int __fxstat64(int ver, int fd, struct stat64 *buf);
>> -int __fxstatat64(int ver, int dirfd, const char *path, struct stat64 *buf, int flags);
>>   FILE *fopen64(const char *path, const char *mode); /* noignore_path=1 */
>>   int nftw64(const char *path, int (*fn)(const char *, const struct stat64 *, int, struct FTW *), int nopenfd, int flag); /* noignore_path=1 */
>>   FILE *freopen64(const char *path, const char *mode, FILE *stream);  /* noignore_path=1 */
>> diff --git a/pseudo_client.h b/pseudo_client.h
>> index d7944ce..8d05e4f 100644
>> --- a/pseudo_client.h
>> +++ b/pseudo_client.h
>> @@ -12,15 +12,41 @@ extern int pseudo_client_ignore_fd(int fd);
>>   extern void pseudo_client_linked_paths(const char *oldpath, const char *newpath);
>>   #if PSEUDO_STATBUF_64
>>   #define base_lstat real_lstat64
>> -#define base_fstat real_fstat64
>> -#define base_stat real_stat64
>> -#define base_fstatat(dirfd, path, buf, flags) real___fxstatat64(_STAT_VER, dirfd, path, buf, flags)
>> +#ifndef base_fstat
>> + #define base_fstat real_fstat64
>> +#endif
>> +#ifndef base_stat
>> + #define base_stat real_stat64
>> +#endif
>> +#ifndef base_fstatat
>> + #define base_fstatat real_fstatat64
>> +#endif
>>   #else
>>   #define base_lstat real_lstat
>> -#define base_fstat real_fstat
>> -#define base_stat real_stat
>> -#define base_fstatat(dirfd, path, buf, flags) real___fxstatat(_STAT_VER, dirfd, path, buf, flags)
>> +#ifndef base_fstat
>> + #define base_fstat real_fstat
>> +#endif
>> +#ifndef base_stat
>> + #define base_stat real_stat
>> +#endif
>> +#ifndef base_fstatat
>> + #define base_fstatat real_fstatat
>> +#endif
>>   #endif
>> +
>> +#ifndef base_lstat64
>> + #define base_lstat64 real_lstat64
>> +#endif
>> +#ifndef base_fstat64
>> + #define base_fstat64 real_fstat64
>> +#endif
>> +#ifndef base_stat64
>> + #define base_stat64 real_stat64
>> +#endif
>> +#ifndef base_fstatat64
>> + #define base_fstatat64 real_fstatat64
>> +#endif
>> +
>>   extern void pseudo_antimagic(void);
>>   extern void pseudo_magic(void);
>>   extern void pseudo_client_touchuid(void);
>> -- 
>> 2.17.1
>>
> 
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#181983): https://lists.openembedded.org/g/openembedded-core/message/181983
>> Mute This Topic: https://lists.openembedded.org/mt/99234918/3617179
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 
> 


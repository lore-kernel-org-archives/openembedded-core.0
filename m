Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5115CA5FC5
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 15:07:14 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15829.1790780830286633988
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 08:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ne3ZS/0w;
 spf=pass (domain: est.tech, ip: 52.101.65.15, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z7jT533YR9COL20XNXvOn/JABTaz+DdDjjMrO5LzAVbhtr//qOfQZ1r89xC923NhubiTkcqDaT02Ux9XWFYSmd6lE2STnf0oSKGH4gstNZDza615W7wlV5g88mucrQ/126unkXl4whwPXveDm9rnWX0s5UgQl6bx77c1c+dOiglpLjDcY6Dla0IE+erQHEi7XyatqsAzOxNGVLAxk0Sda5VgX1iMGGLP1gfp4bRQhP6WVEpsTl7IgK63kY2ta4KIORMpRhK1IcmB3WA3tjWXG7qJDQQe+lYoAtI/W3vGXZL83xOxte7eFUuUjyKUF3zwP4hv4VzzO7FQOI9rosTEhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WE2ZHjly6NyJ06B2fNj/I4FB7lo/EGVk8MAePQ+CWKw=;
 b=GjWPglMdr+YN61esl+7LWJch5J0KeKl78CpMpo2KYpMb0BjGQuvuAn612p+vnARDBn1EFsMYIF6G2b6hKLwm9LETxRnek0ZtM9IZOAm2a+q5z6g2n6HztqdCfh+LCstkB/Zas8HHhLb8Zotb6KWUcr/8Q/SdkrPIjYL8QtCh0S3rgIpTgshLy7KDr6I5MB8wam84tuMHTMGJPi34GTN1yEJZkTw2MwdDJhdudVIZfB8kc81ikR4F7poSkOt028dQBcwmWkJZ3EbRQsg95LX4zcMxxc/qU79vZ7eM8I3W9xVOALGIzx1q5Ly1ArlbC7/LnCH19zV9Nrv85O4iFMO8Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WE2ZHjly6NyJ06B2fNj/I4FB7lo/EGVk8MAePQ+CWKw=;
 b=ne3ZS/0wLSUUYsk1YarTaUtDiIWzvhcp2TTOB0KAQlsMm7eoqLWnJF+zdvmv2OyRwz9NW2swAfVIfG6ns+a0fkGe7yvMoTeWVQvlD1hzxlNqdjNKCmjDYCyuGt0knOeRGi0RkAbZs7LKsJquepZaMH4cRvWBFNGnqYvdKotIbekxxm+E/J0ErTVjVRhnodPY9U5tXhcaErbHS8ouLjpKVi4Qp9Eq7HGfoi6JT0wg4EVaLlpE66ycHopJe1XbPnGjALGztCuzTTg4eUwNZQftguoVrq/in1QVq1cSkC4+xQGkGSPeXCxffGruPBsGOg/71SNe8ZqLGSkjPx/j/3lXzw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV2P189MB3102.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 15:07:01 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 15:07:01 +0000
Message-ID: <b98fe85a-e180-4e8c-b07e-e50d0d888bc4@est.tech>
Date: Wed, 30 Sep 2026 17:07:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] systemd: Upgrade 261.3 -> 262
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20260928113956.42485-2-jaipaul.cheernam@est.tech>
 <20260929065933.71437-1-jaipaul.cheernam@est.tech>
 <DLSFA2EWD42U.1UHXEHKQC0TMP@bootlin.com>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <DLSFA2EWD42U.1UHXEHKQC0TMP@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0205.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::30) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV2P189MB3102:EE_
X-MS-Office365-Filtering-Correlation-Id: 96e39114-e247-4e69-f4a0-08df1f047b01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|3023799007|6133799003|10067099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	tY8IhVB/kt7wn0jSQj9B914CY2YFajVmX3WpemieGXw55UZLnMkK822Z6sdxDMfcm9YZhAiJIkRIU9vn6062Li+1J0GR47TP8k+SSm/m7wbEmLmHrbXCMk3dNfPSmIrIOAe3+3t1pEVGsUhqLCQw9/6l6qS0Xq4Y+SlxGgo2RIdnPo4aqABgt6DUIjEWx2GIoaZ7MjR8sy70tJVW+c/es0nswFsqtYTeuzn3hH7KqlBckMu5FMCIEpswS5UMOlPRTo8IVM5khv5DnrCBDYUeVd3dQAnNyquaJZJjjNPukqYJtv8InCMHNhSaMaHOge/D4rcMA3//rGlMD7CSU64lRClQO4lzRVvqo1kZ5+oxMwF4XYtlxVkkT4kHrtaVZnY/XFA/hnm8VyjIYMyikxo3A3zDhltaX/CtGm2HLokplIj+RwCMkoIVE8HX8siUujXYy0fFmMKMdcqqzdebjDCqKkrsBl0H8bl2Bzl4ojnb60fHLGQzE1kRktf4yiDKBw4QMRuj0cGNi2P+48CnE+qYQyQQJAaPTAmobqYVyMbVsFhBPF+23/Pk6pQHRsLusLyiSIu6f+ZjVfzLfbVWTptHMiGBXanSjtqVyySDZPxuhEM50hWStY2iowGnzlAWG5jh
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(3023799007)(6133799003)(10067099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qh9C25OUk8HZ/T89dyLJ4twkBzpnWisQQ8VVKKlJLBWZIPsArnjhDkuv3dKK?=
 =?us-ascii?Q?Lk2PcvtVXL83gAvD/OOtHId66X58fzV9dKcd5pIetjyERBz1cMn9wuI6MUAI?=
 =?us-ascii?Q?HxloxklLYL1vl08F5I4gByUk7gLIs0f/r1gDF6GgVwt6wJYHiE8bm9AQIrJG?=
 =?us-ascii?Q?CpMP3sdmuSN6YjBTjaClDD2Ayd29DP1oj6J4XwGsUplfxQVpT6UZFSw+LZjP?=
 =?us-ascii?Q?1XvMTbWZClrk+K/oDChxwDCWM/6lNt01/P+qDvieYmuR7orAw0JRDy8eYx1Y?=
 =?us-ascii?Q?s3TMYvo2kNhmyK0pz4yuTJjkaq4uzsrE5DvFJ1HGNoQI+6sr8OLWyrOmibuL?=
 =?us-ascii?Q?F1xAnv2WYaXO2vBK2RtOqDHr8FFuVCUJbMNiPiZKtiNVL7TtvOT2fQgwckAL?=
 =?us-ascii?Q?6HLJzzFj2j2wfzNOFIoWExedZRN2MaHud9TFXBhQV9DGZGW43KUrLIubzAea?=
 =?us-ascii?Q?DMjIkgWvmXMY0xivyJrDmYPOpJgJzh5DuabAU1TjmOa5Nzo+i+zdGuC/URYk?=
 =?us-ascii?Q?i1omBLcRVBgJphyof8xCbhfgk2W76QQF+x355UctnsUG4WLVc5z8vEMptoHG?=
 =?us-ascii?Q?+xjHkdo6HGowylc+wChRu4sHz5tXukqSUDOKnyv6nXthrHfEav0/0eWX4m23?=
 =?us-ascii?Q?K9+9mJKhmU/IFAw0eEIRDCjGIZRAfS1w0QkxOAa8zI9XylAg/ukNBKwdDnyR?=
 =?us-ascii?Q?gTcQovbHB1qK1g2V3wsFuIRxVYDz8RTl69D1h+Mfjqkput2jvw5vGGZcdLvm?=
 =?us-ascii?Q?gvR9bPzfQK8Q+DnxfXFtVfje/w3vOm9H5Xzr6eRNUW+/kQ9bm25DwFpCzyeB?=
 =?us-ascii?Q?ewDj9vXQrFE0hTRNsLT+dQbZgPS1VMcEqprixp2FR32wY+aXyF3Mm7OKSx7a?=
 =?us-ascii?Q?v8nRsegxJkZzB+Fe9K+UFMsqIAnm294j2amy31Bqf+dnT1LDEsr55VaFEjRM?=
 =?us-ascii?Q?ifxU+1O8Arzsafsdy7WyCbvjH5G+T78UtWOqICABKHMY9lY70SXfF0MVNxWx?=
 =?us-ascii?Q?IxdR1rgWiFP9Of599Y9iN2Z8EvKuLQSuvhQ750FOpU3X5A8NqgYcBvwXjXzA?=
 =?us-ascii?Q?KDXafikroholGrZeO2EHuwgUC1KYwhfvRDHN+r75vtJ/8VHNRGhjrjs3ZwTA?=
 =?us-ascii?Q?ncZTGgVOEOFi9HUawMayf9XOnpYPZ3+Bi2z6fGxFXNlZUGVmCY1R7yhgcQGs?=
 =?us-ascii?Q?VSHk652qnJmaBMnKmBgpyyCbFlQ393xnxen6NbYPI8gkgtCULgauk3n2w035?=
 =?us-ascii?Q?abd1Kyw9x4NY8c0TXOby7F6cq1hTz5zLYREqVEUD7aYiwsZh9FgJ7t9p1vX8?=
 =?us-ascii?Q?djSbmKs4rDZIBzSVe+eitU5l8x03of9Cvl5MHlhFnewnKbPJ8lZHJmqg5RIo?=
 =?us-ascii?Q?Q8IXu50b3ZNjUQFTBZjIxILdkZ2ZD8kABaHcz432b9CaFclW4bftpydIq91r?=
 =?us-ascii?Q?fivGX9EnWulATnnt/S2QvTKH4uESHW7yivk+IOM8zKzsj3iXyLFOPwuuBFN6?=
 =?us-ascii?Q?fae1d9kzsgX7TMLZNJWl37q9eYr/f2aY45fZyVOESjwKOvkIZSEGz89O89Qr?=
 =?us-ascii?Q?qwWLnl11s+1a3Y6V+UrS9XlfbalVIjzk6MEJ1o8Wz/4ooFC7ckz2/tiGFfBq?=
 =?us-ascii?Q?PZan/lZVa7DPs7LcztrHNF48eOjflhErP2fhJcF5mHfZ3jkTSk5DZlWD1KW3?=
 =?us-ascii?Q?R4UJlUwT9JfywM8LzV3ishX8D14syvQ0+6WbeVE8HrRhzHKuxiZe91oX8daa?=
 =?us-ascii?Q?JS6oIP8djw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e39114-e247-4e69-f4a0-08df1f047b01
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 15:07:01.5632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fDQNgJIZ1pYKlLbzlDE9CgjGZ/p+iSIwCulHZVMPPym3YQLukot6yXBdeyeYrjWhpUSUoEXR9zmegZjTS+YJsRhNGdt0roRTWMuzLQqJxHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB3102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 15:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246976


On 2026-09-30 08:04, Mathieu Dubois-Briand wrote:
> Thanks for the new version. It looks better, except for a test fail:
>
> Traceback (most recent call last):
>    File "/srv/pokybuild/yocto-worker/qemux86-64-alt/build/layers/openembe=
dded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>      return func(*args, **kwargs)
>             ^^^^^^^^^^^^^^^^^^^^^
>    File "/srv/pokybuild/yocto-worker/qemux86-64-alt/build/layers/openembe=
dded-core/meta/lib/oeqa/runtime/cases/systemd.py", line 100, in test_system=
d_failed
>      output +=3D self.systemctl('status --full --failed')
>                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>    File "/srv/pokybuild/yocto-worker/qemux86-64-alt/build/layers/openembe=
dded-core/meta/lib/oeqa/runtime/cases/systemd.py", line 26, in systemctl
>      self.assertEqual(status, expected, message)
> AssertionError: 3 !=3D 0 : SYSTEMD_BUS_TIMEOUT=3D240s systemctl status --=
full --failed
> x systemd-coredumpd.service - Listen Kernel Core Dump Socket
>       Loaded: loaded (/usr/lib/systemd/system/systemd-coredumpd.service; =
enabled; preset: enabled)
>       Active: failed (Result: start-limit-hit) since Tue 2026-09-29 15:04=
:12 UTC; 6s ago
>   Invocation: 14d841285f64478290e42885757aee13
>         Docs: man:systemd-coredump(8)
>      Process: 841 ExecCondition=3D/usr/lib/systemd/systemd-coredump --che=
ck-requirements (code=3Dexited, status=3D1/FAILURE)
>     FD Store: 0 (limit: 512)
>     Mem peak: 2.1M
>          CPU: 43ms
>
> ...
> RESULTS - systemd.SystemdBasicTests.test_systemd_failed: FAILED (1.69s)
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/95/builds/4667

Hi Mathieu,

failure from the 262 upgrade related to kernel version.

I built both, systemd as init, and checked directly:

 =C2=A0 6.18.52:
 =C2=A0 =C2=A0 # systemd-coredump --check-requirements; echo $?
 =C2=A0 =C2=A0 ioctl(PIDFD_GET_INFO) does not support PIDFD_INFO_COREDUMP a=
nd/or=20
PIDFD_INFO_COREDUMP_SIGNAL.
 =C2=A0 =C2=A0 1
 =C2=A0 =C2=A0 -> coredumpd goes to failed (start-limit-hit), test_systemd_=
failed=20
fails

 =C2=A0 7.2.6:
 =C2=A0 =C2=A0 # systemd-coredump --check-requirements; echo $?
 =C2=A0 =C2=A0 0
 =C2=A0 =C2=A0 -> coredumpd is active (running), test passes

But PIDFD_INFO_COREDUMP_SIGNAL is available from kernel version 6.19.

But below NEWS doesn't say anything about version requirements.


NEWS (https://github.com/systemd/systemd/blob/v262-stable/NEWS#L370)=C2=A0s=
ays

 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * systemd-coredump now supports the kernel cor=
edump socket protocol
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 available since Linux 6.17. On supporte=
d kernels,
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 systemd-coredumpd.service listens on=20
/run/systemd/coredumpd/kernel,
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and systemd-coredump-register.service r=
egisters the socket=20
through
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel.core_pattern. Older kernels cont=
inue to use the=20
per-coredump
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 systemd-coredump@.service path. Changes=
 to coredump.conf require
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reloading systemd-coredumpd.service, an=
d deployments that set a
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 custom kernel.core_pattern should stop =
and disable that service.

But looks like older kernel logic is not working as expected.

One solution is use=C2=A0ConditionKernelVersion and skip that test on=20
versions less than 6.19


https://www.freedesktop.org/software/systemd/man/latest/systemd.unit.html#C=
onditionKernelVersion=3D


Regards,

Jaipaul



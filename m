Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 028AFC3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 18:27:33 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.128])
 by mx.groups.io with SMTP id smtpd.web11.176.1724092044084502811
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 11:27:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Bb+YXXx2;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.104.128, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6Kma2ay7h5lNw+t1M5m4At4cHzIGM6OFikh9TOz/DTpVxT6WykRzvap3LQING5doXW06c1NVGK5YIPXe4L2L3F9QWSPQx0lBHbcN/Z35YjluwtyV/HHhM26eooD3eIhH+AIzA4YBfCuE8vilhHmeZxOjl20z8vJQf+sH8fMtG6finl9jE9BiHD6xwlME7KPX6HxmtA/baEy0d2xqAMuL6i6BMEoZTLVZHQFCDOJ5K/iVcSRQJEWrUXdLkmAxDcbeecV2tFeKJfNt7TV0WDvtACPsG0/VwILdjIrAU5QFb1uXW0ZBIwwiag4rqAhTyMvGpBRbflsTElsHTLsBniz2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSgTqctBaOVsfTNINdf0+2DVkcINV69mm8kTax2thdU=;
 b=DYGfAUHi6QhGKNVtAwMtgdOg8QqYdNR4mskM1RAvJ8QcG/9bT8eMpmNZtsVQ61tk03QCzj8VRHOdsBW3KvqcS6Xw4/SBz9Oxr9FPxbe/Hms5ft0fPSrLrnFndNRixU3Zqzw9RCkRviBpcEO5QFC0nIJn++tIwBp99oaTQSsLYLo/SikWIrV1glzpodLWxLyUWIPN7o7iDTgIQgZmuNWzowLwPWl95FScdt3fmQaL5B7WFdTHrDtz6cLYh7I6gWXC3I7pDdcxxsKDyN/+HYK4LlDSeqSQ/zvCxLOenWAdxHgrgMuOIbKkKgBRZcnGNfWdJxhINvMIz1f3uPpglBdpOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSgTqctBaOVsfTNINdf0+2DVkcINV69mm8kTax2thdU=;
 b=Bb+YXXx2fEr+61iBXiA9SyTHdUuKDQh49XE7kZlrHBeXRM+z2Y911PUGx+Kt/OVejEDLqLXlTHAWF0b9KUu4CCY+K8a5YS9ds5XoXMrDeYLnVQWjCKNdiEwyQx+QiXJ/6abt5ZZw7jgdT28GQ4gup7mi6HtPbJXKBFGJbUP1P76wUmc3pqCPFrlYJoOKxQjYYDc+ayZDyEZtPPaO4KlVV2jn1qP9HiHAVDyoznxiwpbpyXuMxQpp8yeuqOAkIKu1bZ/ar/J6bRGK1b2sDduMAr42vwCTt2N4uFfe+MIoC5V7Q2Rpe8AKGKCQovDx0i0dnTVbpVy6jBeW7ykA+XV9sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GVXPR06MB9440.eurprd06.prod.outlook.com (2603:10a6:150:1ba::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 18:27:21 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 18:27:21 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v5] util-linux: Add PACKAGECONFIG option to mitigate rootfs remount error
Date: Mon, 19 Aug 2024 18:26:49 +0000
Message-ID: <20240819182649.128659-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0040.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::14) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GVXPR06MB9440:EE_
X-MS-Office365-Filtering-Correlation-Id: 58d725a6-a3d5-4575-f108-08dcc07c904e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oiQaQFPHC9o+L9DJmaG60MwiHpcPrDs7Jj3LksyMT+CK7GLrc5Ka+vcBItAI?=
 =?us-ascii?Q?2b00K7Tm6mjb2QW03iCu9DVqBlfSUIPAhkta/dJod0ro2MLDAZ+QgY24TjjU?=
 =?us-ascii?Q?zgFbTEPlEgqzoHhy4AsMo2j7oDov8xLbM5ns0cK25dQAk64kn++jPi/kb97n?=
 =?us-ascii?Q?6jqHZ8Oep7EDT54Tz03bSr3wEM0quAkzknneaNeL8lhLLnlkncEpJkuScJvv?=
 =?us-ascii?Q?DM0WO6zNg2SY9Om90kRF6/a4JfMteOR3cdB/tBgz7f11T3VCk6vj5LjIbkvE?=
 =?us-ascii?Q?xfVCtKyplYpSGbe5rNM4wrmTAQ1aW9jK4iTEni4w8TNPSzxGljCdAPULuvwd?=
 =?us-ascii?Q?BXLiEU9L86fAZPGf4eaj1QtU3HizcKfKiSr9Pyb7UMQvgyWnbpA4wUkqGBDd?=
 =?us-ascii?Q?PknQNZR7E20ffOok9pQqgvQIwLCNmkfND6qSTDn2ziw5TgkPSoZduyKYnFlb?=
 =?us-ascii?Q?mj1fHSmm0QFf177YyPmW6NehG+w3CeOmZ2FaBeObs2JXq8WR4XnxnvPECoDv?=
 =?us-ascii?Q?CvO9zT8Ff+tjiR55ho9rX+AoFAKbnwJxhvGPMWwuxDsYFT1x/iDN2TgRwZbY?=
 =?us-ascii?Q?vJ+kEPLFRWemghlu/ATsyZt91/GXXD0ZY5mjfDpwjVdKIzi2+bj9qxvnRZ5r?=
 =?us-ascii?Q?JYTe5dvhYSJOKmSKunng2W83JheH55mgX7tnbhpXG9Oh7Gp5m2ccIgYuWru/?=
 =?us-ascii?Q?oIyHXgxNwKcal972YmwQJWnPx8e0xZR5IUAVneAmLKFxDfJicUkPUU8npELL?=
 =?us-ascii?Q?ViWH7vsIAiKfDtFARkiDxDKwAAykNOoYwQBbJ4fRhknH3fL5twkNA0wZL9CR?=
 =?us-ascii?Q?3Oe2/TFhcxpwW72L3rZ/zcdPpnzzQJ1MygGnnnW5fGQiZJN3M+4MHLacNJeE?=
 =?us-ascii?Q?O2MnI2XjfbRH0DGpZ0EjWDWPD1ls7u+gysaQc5DR0pofjDS3yc+5nO1AE8jT?=
 =?us-ascii?Q?A5sjaC5Uzt1yytbAGZxem+tDCLxbS0VxRyPYVakbFlvVOZqr9TJNoRMLdAIc?=
 =?us-ascii?Q?L+u4sEOVLq328UxWI9k7Hv73IVweh0d1FxS+GpZZ5mBHp5w+nHapeuTZo6Oj?=
 =?us-ascii?Q?SUUh3H6EdsvpptxVEl6UmHEhTBteRrPSNP96hZY8bDii3b2+xVkWw3mWmslX?=
 =?us-ascii?Q?VUywNINzsw2G0q8IejKrybVnshxsEZ6KgG6C1uqr5lO9BzONzVkqGqUO43x2?=
 =?us-ascii?Q?vf7x5g9lDN793wNsAuSQCX7IS2O64bnKqTAS9Zejy5znz9vpMa//UqrXtBwu?=
 =?us-ascii?Q?z7w2COZr/Eq3//kfp3CwvFnK8S4gO9skVTJ6updDleEtshPlTue07Gs12yuD?=
 =?us-ascii?Q?fJot6l1Hac6Uppqx0//CX0plJc21QirBYtR0Tjm0lY0sQVqmrmNbqbw6rJBz?=
 =?us-ascii?Q?fpyxM9A=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PBPl93tMp27vO1/VQqVnJBRSQLTxq03eSc0Znt54e7X3XDjZFf70AV0f+RDw?=
 =?us-ascii?Q?RcmDRqNFqDyDk8KtGuZsuhJFs/fiwoe/SvMEbfwf6WpTUwqfnermrtIucuYz?=
 =?us-ascii?Q?JVCog2GRF0ptbWmXt2Bzu0vcjF360V17cZHUekbTk6sOyjLQWz0tITYRKe+h?=
 =?us-ascii?Q?uYg2Pr5HvaeDWmm/ryOJMHPJDh+c0AzU/vRw0w7ad1fnM54u47yW6M6I68Qc?=
 =?us-ascii?Q?RP9Dm4l7F7uN3nGsMa/meY3zA5WOSQYPWTFGxGPAhzkGhzPmvsTbP7p7e13S?=
 =?us-ascii?Q?qD7GjXspk5BHhU/SSJQvfr1GBs/GN5O6Q1S3iWVpIdVklIiwb0+U8LE+raIx?=
 =?us-ascii?Q?eAmWrCEtzJ3kRz17bLmj/UVLlQQKtXRHJFA2bnutf0PqG7bO0x2r2UqRjHU+?=
 =?us-ascii?Q?MEKO1w/9lwerzEFNmftAG5JI3/k+zysKkgbOUrSMutJo7vAIgvtI9X21DiPf?=
 =?us-ascii?Q?eG2sdUrowym1LjHHJqw6zduEx5WrEFkvosHaxeo6AyzXMS0LGk+C36RUSbwI?=
 =?us-ascii?Q?KztQ4h/63+kEFfvyy/oHB1/w7nrS7UjWbwGJG+YbiAe7SnamPR3+3w7+vlbZ?=
 =?us-ascii?Q?rt66dmlFB3qlwJGz7Jomx6rq1lt1GPkq0A1nm+Zjrna+6jPtejFkKhg2HuBe?=
 =?us-ascii?Q?aYaEdZ/OgHl6kNaWxpwuVlNAx1VaQBdWPBtTE8ghxUCjvOQbiHNSeaXGfR9c?=
 =?us-ascii?Q?03VIMtITmdUjmJXA7lD+h7SFI/X2VKuIWID1oL0K/8rao1lacCqisJ3QkdcE?=
 =?us-ascii?Q?d45dMOvbvyktjkIgTQw4hcu/m78pv04LY5fsRDLgtbldz3UWCsuFizM5Sayv?=
 =?us-ascii?Q?31yj5T+PdgbsPQ5/rJK1a7qE+Tu9HRzoOomW9UaE4S8nVd6FREL3SKs1sgmY?=
 =?us-ascii?Q?gCBX3jKayhxr4x3xkFsY/xw8vQlzGMrzsGXd3oEe0dWmbmjcjfgoCLNATokL?=
 =?us-ascii?Q?DM/+FXdXNA0f+9QupPjfnC0Iqgi8TK3jkF1/PmSZQuabc+yxZbsvs+WWyABk?=
 =?us-ascii?Q?+/8AobuZ/sR8jgPGFjDOZEELCG1tSwZ1h2seOa1Ga5Bf4MmnQqob6HHH0AwC?=
 =?us-ascii?Q?wf73ZWCupxpZR+uOer2QwZtJQHBWqI0t7ASLhFWWbgPf3KPIeICvb60mW473?=
 =?us-ascii?Q?QB2THRK3mva7prjFGJZp9wsuFaPgdBB9J/2nQCVBz4upbsqVLmr9LMF+dd1e?=
 =?us-ascii?Q?fsdrp2fvTAp6XWUTyb2kj2ajfZHgtzUxy+xaFsDGvEHHES6gr5o80ujeiU5O?=
 =?us-ascii?Q?yCY5wGOBi/bVfkPuW/aajRslQV3S+i0mFQ7iGtwPDnuR5O0il5L8xq3KpI5P?=
 =?us-ascii?Q?ZSHuylgltMQrPfJhbMFXjNiLMOlbw8KrSjceReOjssnuoOsfUrEQO6S6dt9z?=
 =?us-ascii?Q?yJAtshGHZBRPYxG/HGpzGcwZyUEybkeyxFYeyDsBITzJkaJ2de3ReKT7gp9Q?=
 =?us-ascii?Q?3h1Uy5QYSpLHux6OnGMNLzcmW/TtZmZ0eefdbuIpG6056FHnHGusAvg2TGrz?=
 =?us-ascii?Q?V90PRzroTOTehqjXSeNkQhwZsYlDo5yl5JlaYVvrh5w0Nb2oVJ0KPLL44JsF?=
 =?us-ascii?Q?R2HcDnNUlLgEzf1iVQYH4ekgpcnDxDaqwWKcT+n4Ip2BlhHYR/wRP/unA87m?=
 =?us-ascii?Q?GQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d725a6-a3d5-4575-f108-08dcc07c904e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 18:27:21.0124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RIMERk9HNXcQiOXB0K8EoMNgVn6wyZ01P55sxoLkKqZwMCkAqlKWr7cPuHvs7SPDP5vZZ4BG0ibXRkuHJLPTzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9440
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 18:27:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203518

The 2.39 version of util-linux took new file descriptors based mount
kernel API into use. In relation to this change, the upstream release
notes in
https://github.com/util-linux/util-linux/blob/v2.39/Documentation/releases/=
v2.39-ReleaseNotes#L14-L21
mention that

  This change is very aggressive to libmount code, but hopefully, it does n=
ot introduce regressions in traditional mount(8) behavior.

After observing following failure when booting a board using a bit
older 6.1 series kernel together with initramfs rootfs based boot flow

  [FAILED] Failed to start Remount Root and Kernel File Systems.
  See 'systemctl status systemd-remount-fs.service' for details.

closer inspection revealed:

  demoboard ~ # systemctl status -l systemd-remount-fs.service
  x systemd-remount-fs.service - Remount Root and Kernel File Systems
       Loaded: loaded (/usr/lib/systemd/system/systemd-remount-fs.service; =
enabled-runtime; preset: disabled)
       Active: failed (Result: exit-code) since Wed 2024-08-14 14:53:48 UTC=
; 1min 22s ago
         Docs: man:systemd-remount-fs.service(8)
               https://www.freedesktop.org/wiki/Software/systemd/APIFileSys=
tems
      Process: 76 ExecStart=3D/usr/lib/systemd/systemd-remount-fs (code=3De=
xited, status=3D1/FAILURE)
     Main PID: 76 (code=3Dexited, status=3D1/FAILURE)

  Aug 14 14:53:48 demoboard systemd-remount-fs[76]: /usr/bin/mount for / ex=
ited with exit status 32.
  Aug 14 14:53:48 demoboard systemd-remount-fs[81]: mount: /: mount point n=
ot mounted or bad option.
  Aug 14 14:53:48 demoboard systemd-remount-fs[81]:        dmesg(1) may hav=
e more information after failed mount system call.
  Aug 14 14:53:48 demoboard systemd[1]: systemd-remount-fs.service: Main pr=
ocess exited, code=3Dexited, status=3D1/FAILURE
  Aug 14 14:53:48 demoboard systemd[1]: systemd-remount-fs.service: Failed =
with result 'exit-code'.
  Aug 14 14:53:48 demoboard systemd[1]: Failed to start Remount Root and Ke=
rnel File Systems.

also consequentially, 'systemctl status' reported:

  State: degraded

When issuing 'strace -ff mount -o remount /' the failure occurred at

  mount_setattr(3, "", AT_EMPTY_PATH, {attr_set=3DMOUNT_ATTR_RDONLY|MOUNT_A=
TTR_NOATIME|MOUNT_ATTR_NODIRATIME, attr_clr=3DMOUNT_ATTR_NOSUID|MOUNT_ATTR_=
NODEV|MOUNT_ATTR_NOEXEC|MOUNT_ATTR_NOATIME|MOUNT_ATTR_STRICTATIME|MOUNT_ATT=
R_NOSYMFOLLOW|0x40, propagation=3D0 /* MS_??? */, userns_fd=3D0}, 32) =3D -=
1 EINVAL (Invalid argument)

After further investigation, The issue was pinpointed to lack of Linux
kernel commit
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=
=3D95de4ad173ca0e61034f3145d66917970961c210
("fs: relax mount_setattr() permission checks") in the kernel version
that was being used. Above mitigation was discussed in email related to
then-rejected CVE-2024-26821:
https://lore.kernel.org/linux-cve-announce/2024051606-imaging-entrench-b327=
@gregkh/T/

After testing with qemuarm64 machine different linux-yocto versions,
it was observed that the issue impacts following versions of currently
supported LTS kernels:
 - 6.6.17 (fixed since 6.6.18 i.e. mount_setattr() returns 0)
 - 6.1.78 (fixed since 6.1.79 i.e. mount_setattr() returns 0)
 - 5.15.164 which is currently the newest of 5.15.y series (i.e. no
   known working version)

Taking the above findings into consideration, add a new PACKAGECONFIG
option removing which enables users to opt-out from using the feature
which can cause issues with a bit older kernels.

Versions 5.10.223, 5.4.279 and 4.10.317 were also tested but the issue
was not reproduced with those versions - using strace showed that the
mount_setattr call associated with the new mount API problem was not
issued with these LTS kernel versions, which seemed to be confirmed
also by following libmount debug message in these cases:

  415: libmount:     HOOK: [0x7fa115e818]: failed to init new API

Note: In addition to the aforementioned, this change was
tested also briefly using the current latest kernel versions 6.1.104,
6.6.45 and 6.10.3 that using the old mount API with newest kernels
did not introduce any observable regression to the boot flow.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../util-linux/util-linux_2.40.1.bb             | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.40.1.bb b/meta/recip=
es-core/util-linux/util-linux_2.40.1.bb
index a1aab94055..ef2384fe52 100644
--- a/meta/recipes-core/util-linux/util-linux_2.40.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
@@ -89,8 +89,14 @@ EXTRA_OECONF:append =3D " --disable-hwclock-gplv3"
 # this helps to keep same expectations when using the SDK or
 # build host versions during development
 #
-PACKAGECONFIG ?=3D "pcre2"
-PACKAGECONFIG:class-target ?=3D "${@bb.utils.contains('DISTRO_FEATURES', '=
pam', 'chfn-chsh pam lastlog2', '', d)}"
+PACKAGECONFIG ?=3D "\
+    libmount-mountfd-support \
+    pcre2 \
+"
+PACKAGECONFIG:class-target ?=3D "\
+    libmount-mountfd-support \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'chfn-chsh pam lastlog2=
', '', d)} \
+"
 # inherit manpages requires this to be present, however util-linux does no=
t have
 # configuration options, and installs manpages always
 PACKAGECONFIG[manpages] =3D ""
@@ -107,6 +113,13 @@ PACKAGECONFIG[cryptsetup] =3D "--with-cryptsetup,--wit=
hout-cryptsetup,cryptsetup"
 PACKAGECONFIG[chfn-chsh] =3D "--enable-chfn-chsh,--disable-chfn-chsh,"
 PACKAGECONFIG[selinux] =3D "--with-selinux,--without-selinux,libselinux"
 PACKAGECONFIG[lastlog2] =3D "--enable-liblastlog2,--disable-liblastlog2,sq=
lite3"
+# Using the new file descriptors based mount kernel API can cause rootfs r=
emount failure with some older kernels.
+# Of currently supported LTS kernels, the old mount API should be used wit=
h:
+# - versions prior to 6.6.18 in the 6.6.y series.
+# - versions prior to 6.1.79 in the 6.1.y series.
+# - versions till at least 5.15.164 in the 5.15.y series.
+# - with 5.10.y, 5.4.y and 4.19.y series kernels, libmount seemed to use t=
he old API regardless of this option.
+PACKAGECONFIG[libmount-mountfd-support] =3D "--enable-libmount-mountfd-sup=
port,--disable-libmount-mountfd-support"
=20
 EXTRA_OEMAKE =3D "ARCH=3D${TARGET_ARCH} CPU=3D CPUOPT=3D 'OPT=3D${CFLAGS}'=
"
=20
--=20
2.39.2



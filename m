Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D21C52D7C
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 11:49:42 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.106])
 by mx.groups.io with SMTP id smtpd.web10.14238.1724413771616226040
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Aug 2024 04:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=BpY5UyJ5;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.106, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=POlu7U+0Wkv99e8IsieCFWIjK8oOqP/s2i7tvFR9tdTD/a1X2Pcr5Ls4okVKPnBhnpSKrK9QS3gRmV6YWlj/9zYmh32Ur1RJCQVpIawydHRk8wr0KZ/qRKgbvxjnPALivxGYkiveNGyF1NHV52IcmWdXKfPm2EY1DBMRQaVzTHOOo8des0EswHmmTRXsfN8vgVGBf0zuRtYcTzwA53tbkRGvaa+bUiTp0TaNrpe7NRUe55lqYQ1gcqL1mo5TE3lN3XqiOf1XmEMudjDHne3FnR1k6nKvSBCDNiO4fONlqa7GH2rAHm+DmCO0ZtL+3Q1RSFu+bm3f48NbwWyDxVKi7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJObL/ciqQZCpfiA3p/+NL954INYV1pzLj494YNzI6U=;
 b=n47PdT6+F/Gr932x4s6qoXjKNTPDaEoLHOkNB/H4ljesAmd8EkMd3Ejmg52zNUfmKAqZo6wFu0ZItOIfy76x3HMtaVfuQj8cR+SjrQPSE4xfhEw1wXFnqv08VFZGmboEqF6rYYtdTzhNGrI2WaCjZBtHkNDDTxJSpnMLKMMYf50lWGGeyQru4MlgqdB9q73RrJ3kJAx/mA5krgYEIRrNJNFhyGcRtTZ2BePHnaKXNyXivc57lspkZ9B476yi7uOeQuT8FtkUawhnXXLj7dHWx+mdTqOWIUqe7RUoOb7NEj8w5DpOwyA36RAH53Gsqui5ErPqhDURt/oIg3WnavqCGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJObL/ciqQZCpfiA3p/+NL954INYV1pzLj494YNzI6U=;
 b=BpY5UyJ5jyB7ETs2qz00yac1ACNzqk96xrPX9XQs/VIvDXwzmNp1XxAlM9d857g6AsGa0ogTE6JHewxkA+FuB848+whOYdONPrdRqJRxwI8XMnHXS9z15sgSy9lcmmJwCWouAsdxVteYo0b6ebK8G1vMpUE47fD/9OSfIkfrXm4t5rgQc9Eq7kkIYVLM5WgePReljA2Y171F8iTqcnT98mnrwdQBxCnll5xa3Mp6Ax4ZyXbNpxgcOn9lW6PW2u3OnZAY9xVVsCU68Okc9yzfdip40GKVI8Y/VmSTHnT7B0275QjXFYgU6ljJRUSk2PVUJI0YE9+9sUiKJ0nZmhkAWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB7567.eurprd06.prod.outlook.com (2603:10a6:102:dd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 11:49:27 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 11:49:27 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] util-linux: Add PACKAGECONFIG option to mitigate rootfs remount error
Date: Fri, 23 Aug 2024 11:49:07 +0000
Message-ID: <20240823114907.2882459-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0000366E.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::38e) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PAXPR06MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b5db838-6194-4eae-de36-08dcc369a474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ca7LuUAv5ODN3s7vOlkYFdpi8aA7F8ml1jQmsA4k9I9RTo8m2S/VkqP4OUwR?=
 =?us-ascii?Q?AODFehdo9RVS803KMuGW4JCcLVkz06EDH6JGvSvscT//r/zkVuqKAyDw0Anz?=
 =?us-ascii?Q?BpGBZAa9ycNW92VKWDhdiC+VNpElw1lx5OtklLakgqsm+t4AgHQtspr5HBzx?=
 =?us-ascii?Q?BiExytH1LRYXEc1OQwEooXZ/Yg4qDZr7RtHjiZfLQ3sn0u0J+W1rL2b4/U4J?=
 =?us-ascii?Q?V7pQmRaEVz2D/2kXMJ01bbE1Ung9OXPrrv8fxr7T+DBt31ISNrLHzKHEwFEz?=
 =?us-ascii?Q?Ge1L73yuJ/bB+Yyas2UyEsYKAgERgjOtIsoOEo+JOyPNOqr+M92FL/pxAvYZ?=
 =?us-ascii?Q?prt8dZIjaK2l0XV9y/Nz1SGKIEF5TJYe0NwFkLTGUvGiHixPvityXR2+AEO5?=
 =?us-ascii?Q?+PWvKpnBbQC2nH4v1NZ12Eo2aw0yCvQ62wmpy0BbwDDPyaJzoyf0cLQmhb2r?=
 =?us-ascii?Q?YC0WrPHL8unjtYx7bTWgFZ0h2Ui1EiANfuUOwaL7vCe05xQc3qF0ev7GXaXJ?=
 =?us-ascii?Q?8T5jaWsvQgDVCdvbIorX9/RND6ZLR3tIyGm1JqhvwsuXL7vUQfnqsaEC4qjh?=
 =?us-ascii?Q?vHsqAippUvrAhovCzYlyqjtkr3eCjvcnD35h57C9zLGA/vDjahGeJpFAptya?=
 =?us-ascii?Q?9mlXDcTG5vlwFyJqzPx1iwliKQy5Or1XoMGfnLZqg2RIWamNhsWH0nPqWe8q?=
 =?us-ascii?Q?mGidEQq4K0QpoHLpdiOl8Qbr4p3zVEUymOdb+CTMfIAOMqMSgibm4WLi5OU0?=
 =?us-ascii?Q?vlOWeT6aD1MAPTi9MC1uSXRZus88MiI3OFuBJ4XBkbxG/Bj4aL/shvA5OEan?=
 =?us-ascii?Q?PsIwsQSggkorVsAv4dAy53QtrLKd1Mj5cNjnIxs/sIM+QwXnMoUAbC8aRoMc?=
 =?us-ascii?Q?pAQ8VHtRskzbqiyva6RWVbivlHFUB20fuNBCOsv6wjQTKqtMaCespn2mAVyq?=
 =?us-ascii?Q?lrgSni/wutz/jgaP2c8f2603iwYObwVnDRPbQsmrJzRhMaZSbtZRY4LelOuQ?=
 =?us-ascii?Q?DHgfqWL+rTDWUl3J42LvvJAb2UZ3BRYtxnDK0hI8lkwLsbeHS/1w+m5BFQ4j?=
 =?us-ascii?Q?kI21IAgvMRrh5KI91ntI916jAsJDufZcS/m45IFtezVwlhdCNGrApE1Y4hZ4?=
 =?us-ascii?Q?UwzFYuV6QNQgoVWOLIoeZrJsE3LafgxF2lXHM8X50roWHOfwG2Udfia0a3H6?=
 =?us-ascii?Q?79b1GlOLdt1P6DMpyVpf7PZco6gFHCUxlsnzbF8r8mtnosG0zJ+JU+YOM4Ef?=
 =?us-ascii?Q?cjXRhdQUIY6nmv+OOH7dwkENwRTJ+hpV8PKtLv+EMbBd4/263WcAlP87/D4R?=
 =?us-ascii?Q?UuhyQ6ntrHL2Z/JTfUeci5XiCZZuG23lNzhMO32a2wRhjUmX42NF+fHSndXR?=
 =?us-ascii?Q?ihGG0S0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FoQJcRwdrPyERTwWbN1YfCU9h9v68BVYDHhEE/IgQ5wkBmpKiw8pu7iQzzPQ?=
 =?us-ascii?Q?vocJlK5cEQIA+4PGSZGF8kSR7gcONDLMrw+firBh1ZMhHpmWfDmkJboXkkah?=
 =?us-ascii?Q?qYVgEWIaKcDTy26YglFO7d6ZT89llpw5ERNT314jxMtiSSrgHS3sUq56AsQH?=
 =?us-ascii?Q?aSEVV167G/K3SX3fZTcqtVYZMVVqH/ui0tUDOKmEOAuFDC32D0H3VEPPqh7O?=
 =?us-ascii?Q?6fUFe1l8ZSi7vh84gA2ZXetxVvJfgTBYPU/yxqNnaj6p2N2RN3xeeoyzAn7b?=
 =?us-ascii?Q?fuORx8S571La0dApuVaoGM9ZFPkUHeJUZCP86pd4s143pzkfHn5y+EEuQSPK?=
 =?us-ascii?Q?43lysBGRt+vXynCPDQ7QwCqgT07xcvoH5GBGQEVsnD3aXI/Wui+XDU7Vzpze?=
 =?us-ascii?Q?Wj86yDGySqOeqcjpnX+qSmLyJtEZF6jfOTqshtKDw+saQFIUNZCGPaypGwlk?=
 =?us-ascii?Q?qJ/ya5kAr/5qFhta1emtrPU6jRr7O7SnzxNtTe2JrB55csXDyxZun4Xh72gs?=
 =?us-ascii?Q?rN17EPDUUKzG5uUppfPDVkwA8hSgZO74wbh3rmTTuQnkveDxZ6Ef1w27NE//?=
 =?us-ascii?Q?v+GuLMHdY98cNMbjYuN6r/D4t82F/f/j5HZ0M6g2z254Ry53oH+LDSvugvfk?=
 =?us-ascii?Q?nccRxsXgbYceDHRP1YPO6Hbif5iskS1XK3C7Gq3ES3XZX1JYGI/r5o1/kJF6?=
 =?us-ascii?Q?HUOXcrdWBjIS/Kr/b3gybAsiUpBzS4waQY+QebiKf+T0GUohoQBpIhsQZvVM?=
 =?us-ascii?Q?TqP+zHZUNa9qhXFvZni+y2eFA4odo28Luze5SMGZtuX0PSb9k27xuIJSXWNK?=
 =?us-ascii?Q?KzD/g34B0wK0ciED1F4hlymgO5xb6E0hZz4u5AkfGy3KV5A9rvADziMhaaEC?=
 =?us-ascii?Q?y5lpyLoipyxINCLnKGOsV5IWZmpPBsjujVBfrSmnJLfj4xHZIhT1iP0Crlk9?=
 =?us-ascii?Q?FWKLBFeJSwYshBhdOWFiRm7fkIjL7Zk9zXQ7/MyYLm4uBx+gm/HgnzxqJLid?=
 =?us-ascii?Q?/Od8/TmUWvSolfmjbnPHERsr8s3WmVTB6yzQBkmBAg8WeBplsn2HgTA2ZQoH?=
 =?us-ascii?Q?+fTmfCh34lLtKDmwN5pCKb6I1KDOT0ZOayKXrlbyTaSX9YMc99B89+1jF4E/?=
 =?us-ascii?Q?TaDmoH2vmTHb8aFxJSkKgbadsKIvBi0XUAWA9qDgl/TJyT/ZDlOBx78CQIqX?=
 =?us-ascii?Q?Vt3BhEXVXxp41PAnQwF+olL1A2JPoHtfdLUSr2BOrO96TMlc7fWRb5GxycZw?=
 =?us-ascii?Q?Apyh3F3b3odv+pvXDes1ialuac0G2P7WSYqDjcj+tanbHrSfefcuCtDQ8bwn?=
 =?us-ascii?Q?UvwVr8AGYyyAexw7VyzLZtejGYvBHje+QU9bGTNea17da1S/PEflhf3kJuhI?=
 =?us-ascii?Q?bJcnipwsgK0mbfs3rvRAAXcpslPlJ8pshItMFiQBbh38WVoMghomVrzbljrP?=
 =?us-ascii?Q?KKOGGt1CsGDuTv/ksE9USKN3FFA0/OqQt1c2dV9+sMHMsdXvKKVkC3oFhnaQ?=
 =?us-ascii?Q?QC28eRBkPPU4fnb9viFEc1amzr60qyinZNqQsXAF8QXyzw5osgixwdUkCJms?=
 =?us-ascii?Q?Xdi5Op2oFpABOmceLT7bmIU/3Yqnquo734WLeADd+FfSGbGhtq2PS+NSek0Q?=
 =?us-ascii?Q?SQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b5db838-6194-4eae-de36-08dcc369a474
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 11:49:27.8868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPLy4+DNAWDHS/q+O8sjJw/jh7QL/9VkZAlvMFNla1EylIwsSF9v6rf7ADdM1NfTVJ9lGKL/ubvhnp1Ngxzodw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7567
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 11:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203683

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
which can cause issues with a bit older kernels. The option is enabled
only for class-target here, since it otherwise causes following error
during util-linux-native's do_configure task on Debian 11 build host
(mountfd_api requirement fails):

   | configure: error: libmount_mountfd_support selected, but required moun=
t FDs based API not available

Versions 5.10.223, 5.4.279 and 4.10.317 were also tested with qemuarm64
but the issue was not reproduced with those versions - using strace
showed that the mount_setattr call associated with the new mount API
problem was not issued with these LTS kernel versions, which seemed to
be confirmed also by following libmount debug message in these cases:

  415: libmount:     HOOK: [0x7fa115e818]: failed to init new API

Note: In addition to the aforementioned, this change was tested also
briefly using the current latest kernel versions 6.1.104, 6.6.45 and
6.10.3 that using the old mount API with newest kernels did not
introduce any observable regression to the boot flow.

(From OE-Core rev: dc086d9a8613143607af3583c72ed892e20b4d66)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/util-linux/util-linux_2.39.3.bb | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.39.3.bb b/meta/recip=
es-core/util-linux/util-linux_2.39.3.bb
index 83b3f4e05b..79ddf2d115 100644
--- a/meta/recipes-core/util-linux/util-linux_2.39.3.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.39.3.bb
@@ -90,7 +90,10 @@ EXTRA_OECONF:append =3D " --disable-hwclock-gplv3"
 # build host versions during development
 #
 PACKAGECONFIG ?=3D "pcre2"
-PACKAGECONFIG:class-target ?=3D "${@bb.utils.contains('DISTRO_FEATURES', '=
pam', 'chfn-chsh pam', '', d)}"
+PACKAGECONFIG:class-target ?=3D "\
+    libmount-mountfd-support \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'chfn-chsh pam', '', d)=
} \
+"
 # inherit manpages requires this to be present, however util-linux does no=
t have
 # configuration options, and installs manpages always
 PACKAGECONFIG[manpages] =3D ""
@@ -106,6 +109,13 @@ PACKAGECONFIG[pcre2] =3D ",,libpcre2"
 PACKAGECONFIG[cryptsetup] =3D "--with-cryptsetup,--without-cryptsetup,cryp=
tsetup"
 PACKAGECONFIG[chfn-chsh] =3D "--enable-chfn-chsh,--disable-chfn-chsh,"
 PACKAGECONFIG[selinux] =3D "--with-selinux,--without-selinux,libselinux"
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



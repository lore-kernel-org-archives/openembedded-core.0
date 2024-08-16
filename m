Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E132C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 14:04:45 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.110])
 by mx.groups.io with SMTP id smtpd.web11.148708.1723817080077301927
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Aug 2024 07:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=aL3uqBk8;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.247.110, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzkiFPMAWvDa2vDZ4AFfRjEMofp+FU8lY1vI5hdS/+CdxjyHY0nd1tYvZvz6K7ZmPXHniQCh08I+iyl0//TIsiKdidKBn3fYFfbgbQ3F0Wamahh/xPeex5ZOJyjGMBLyyeJcG2q3gggFpWpSd8AvSnfk0V4VvwN6CU3SyGXRmaIyfKP+Rt/zAr+RV7vPonZSBfusjXMzUPAtmnpKnbLPOmMmW8qn96IcdsrwxTYRIn29uktGCCmh2RSkzKUfmhhj5wsUQia3N04D/QzV71bKY5q1DBN99WaPN5G++IHyca4SmWkyL0GXQFz7Zmq1LUhbg7me4C2f9qf2hOW5DiJ8DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9zNkd6SFFfVdgG0HWL9+tKGQ7fbKmiSp5TRMp7pxUc=;
 b=UEPBlPaCGlTQsPn2PQXTxdNuDTTv8Z3J0xaspOvAjBMqsW8YrRuonPaJx1q6/e+2rTSnBtUV4FXf8CboWlPY/zeYRqiQc14nw0moUOnwBGCiW6Ln6ku8NRBju7J9K3NsB4FU48IubriyTPhUtgP0JAYTO9e0pPyEiUyiC3DTS77hhWqDnIhv4ghXQk9Ppkgt30XCAwn68RGpUWq5UT2b7cWhNeNUILXgGxQwDJL2K2/tuflIR389M993Mi84XRWvhsMTDXTOyLwcxe6n4r4QnipDIuLF/5zb89Ea+gDjD3d5z1XoSEw8Wh7M0AHPsKV/3h4KVw6yPq13T8gSqpg5dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9zNkd6SFFfVdgG0HWL9+tKGQ7fbKmiSp5TRMp7pxUc=;
 b=aL3uqBk890y0zwg9aYsnuYFb4Z9ffZY6Uvlfyadysa4N5WJbcS4Xz4ERXp4PzCjRzloGYsGFayxUEsaZPq3arg1yqQuRktIy9NLMZo8mdbZb3C9ZdRdcIpsz+4hBbPCt0t9CVd9OZw4eir7fHxjlP8e/FCCd35mYj04AhAAIK2312ar2tTrUbAK/xDKx2JnSvINyL4B9bW22wnSsXB12mUn2l2Iz7YqdrNHvgVBdGcJ0fvJ98/XouIZTzrd9UHl23U7Nq7Z24ur1qrUdrTxtKfL4+yTnv8Vz5Sa376yHj0lZEVnmRbt5B0EIPffzkJnmqPBb3S091EZSOOayvlF56Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GV1PR06MB9344.eurprd06.prod.outlook.com (2603:10a6:150:1ae::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 14:04:36 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 14:04:36 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH] util-linux: Add 'no-libmount-mountfd' PACKAGECONFIG option
Date: Fri, 16 Aug 2024 14:04:22 +0000
Message-ID: <20240816140422.1665537-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0034.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::10) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GV1PR06MB9344:EE_
X-MS-Office365-Filtering-Correlation-Id: 94fcb351-f81b-4d41-e562-08dcbdfc5ce3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gIYqzrTPNKUi4y7jzzOdsTDG6FdmJo6b2WiLITMMYnqN0XRIPEqtoEb7DTnd?=
 =?us-ascii?Q?1pp11wo6ryP5PiSTp2bCnC8Iu/bRRQfpxUmuX3RxvXs/rod2oVxteBHEwNZJ?=
 =?us-ascii?Q?6J1Ev70HzYMYPXKfPoHJd+s8EY0hJejjryV7vGbK/4Rbzm1M+UerPqhSrmAW?=
 =?us-ascii?Q?I9AtfpFyevThnAht1pgX+1zdOhpdcSgo+9/azI3IB+pxd5NHaKPL/5/4MSKJ?=
 =?us-ascii?Q?DUyyoosPQkcSs7Gnd9h0UCdqTDdXMp/ZeAL8rwQDcOwkC4GNmU+O9RjkvdJZ?=
 =?us-ascii?Q?CyIIRhi3zdjKUDQ7uPWjyoXAt7nap10KnAW570fNdR3SLfejmAoJY77HI5z3?=
 =?us-ascii?Q?8VwRJ1pLComHgtGBIgq03vXWtA2rMg9fAn88sJYlFQNMBUtbxqdP77+mhZUu?=
 =?us-ascii?Q?/fJ8u9s54Ysz2C87WP7b5TQQ3Jcfo8qGFxAtzAbylVk2eddTQ9nc5CJLhiR7?=
 =?us-ascii?Q?ZFjqTFcjAdVnw/ksoX2s6tS2DlS6TK9yKazFmaxXKtJ0ll01OBXKt1QC6UyP?=
 =?us-ascii?Q?7tjK3qcKNYeXftpR3SJlvONnRSjZcLdjq7HxgSMxHPkceQ284BU4yI2N6IuZ?=
 =?us-ascii?Q?xIkTtf+IRKxwmE9FpOhGJ8sTesoj1Pe59FFW79W1HfeYTBbs28kBftlzve8i?=
 =?us-ascii?Q?6QvjKqAYl7g/po1IKiG12Puza29TgDd2p4IZ8++aAXZQAeKx9+/COnt1Nxpw?=
 =?us-ascii?Q?ut3Tzc7nAL0PpeaA83aSbmRDWKPRyJKNG6F8OVMFQY0/RMCCdYplY3/MRXqC?=
 =?us-ascii?Q?5IN3aFNpkg2+iSkBjTKiXRRYPbX67neGzvCVCUZxvRAcU1H7hYeWl2E7oIUX?=
 =?us-ascii?Q?1QGdY7py3ERqdVitwWI5HtFaORa5Anx/5ZOuoWK00GOWdcpM5dsQYJ0pwZhe?=
 =?us-ascii?Q?eTVcMjj/bfUgjxBkxKwyXqYmgv2dComTwyKQWWF+1qR6tfOZxIP1CDpqdtPZ?=
 =?us-ascii?Q?VoJertUKexG2yY92wSb/mHJiUVmF+RYQ2y7FHwiDmkDhKqVlZBg/cqPq1odd?=
 =?us-ascii?Q?Y7uNckz8ysVpDVDoGnd+t8wCftZEDXKoXiogRqxvpsstDzDwEXIk2+dfm0io?=
 =?us-ascii?Q?xbxCh+VQB2LQsxjNLJ1ir2wKp73BmWNS+7ptX7e4Wic6sMoSsXEbmZ5ZiDmJ?=
 =?us-ascii?Q?B6wS9m9W39Fl4VRmz73dt7ZtKKBqOQIEShPc0d8UbnMvy9BL6uZik3YIO1pl?=
 =?us-ascii?Q?yR310bqdUmJ5tT403rn7ujQb7DGqOOcjDT3Fqee5ARtFs+JmTnog1dSAwSSr?=
 =?us-ascii?Q?h1oViGXWqmQexv1cYYmPa9iseZBVmP3SqYsjdWu4xx28GTu8C4jUXAvMqihi?=
 =?us-ascii?Q?ki4KD73nfGZ6tzQnyV1uDuLxaCnlMX58uvv9vqYzJn1I+APXlrRjHWaY0Bw7?=
 =?us-ascii?Q?Jl48c74=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Wj4+XFGVdMPgOhDIkphMHWoDyIGRg/pBHSf+Hg0lERqAyv1FxfHrrIWSPudi?=
 =?us-ascii?Q?5gjpmP4ey3GiMusCxQ254TvKJ1U0TZLcGbnsi41eo32m8pyopqhpGLEsOzAQ?=
 =?us-ascii?Q?p8vYcyL4TcsWPEiJYOeI/hA8YrwDbh00HReXknZzh60RZ/KA0Gr1oJpj5llZ?=
 =?us-ascii?Q?zE44Y9ouI8ddCBQcQHHTj+D+Q/g2GfAuNeqwz629fMbAng7lq5t/MZJxehLK?=
 =?us-ascii?Q?iJODdD9Demt83qkUYmnge0CLWftPsNj2elXE/THAkFfGBi0VDAQe74IsVdmH?=
 =?us-ascii?Q?bweUbw/SwsAAOICzg/ZYtJP5FfylDemNYNPOiwldqvYvwBdqLB9NkgyE7Lk7?=
 =?us-ascii?Q?Xlv6J+S/s3yrFiakwgzTnaGQNkhHFYqY6yLfMreucW+REJL1fyzOQMhacVv/?=
 =?us-ascii?Q?ZYzUB+6fuNVz/iLAk1Wp2KuRpGx/huIWOOuEzijpY48OggdaruPs/XVWq/fG?=
 =?us-ascii?Q?6z0hj6qLtitf5VsBsDF0lthRhAjveuWMD6VhNcKzWy71/HbhdUVyMoSFl/rw?=
 =?us-ascii?Q?mfQg/nId4dyxSrgMz4ocXqI5F6W6ngw3dRkMkK7AR9ZpbMmSYaxaFeHGl/xH?=
 =?us-ascii?Q?9S4PAAiR2h/RpBza1Uyybsmy9amcbrcehesbXf//StpXkPhLjHGQBGpTchSz?=
 =?us-ascii?Q?uyYTqbW21fLmsPstOW2hHzmEHTya1rSOpedd3F3pryqfsd0JyRPJ45ffMq9n?=
 =?us-ascii?Q?v45Am9GPkPx6lMbeoEoryXqf2xBUSA7Or+d5tYnpVebBBSzW2N08LivZ47yi?=
 =?us-ascii?Q?8M4vm9jU8ephTqIghQpQWRPAzM0QK3cLgXQRfQtE21opN9F1rz6+Zbzs0UsH?=
 =?us-ascii?Q?wv0cVENeGa7UVpeBPduvWAX3jbcZ2d8+rXHAZgFTlKpI/w5t9VtSg40jW4jW?=
 =?us-ascii?Q?fewMidpoCDG+oqjBybMq+lzw+2ye1/+i0fVjVmHvT3uHDOF+KQviBNuI6zt8?=
 =?us-ascii?Q?UPhYnH+y8i6K8REEX4sMDzYpD/P5ryU4xMBWj/DNJ+0Ws8XCIEMFUP3MBpy8?=
 =?us-ascii?Q?PURk5hMdG2fTpndrUlqEWPq6KcnD6wxPOIfbGskvBv0xswsR88B3QNgtBBS6?=
 =?us-ascii?Q?IukGfP0BcKdhOtIxOpJqUaMbhuXZ2rpO5Xl5PssrZ5t9dg/NwHBTZw4D/5Mu?=
 =?us-ascii?Q?WR17kFDbvvLtC8Fz5KV5l2XQfVh/FcAvVfy2pbI/3PkwFgmwt8jJFHomTMgW?=
 =?us-ascii?Q?Tn1IQjCZc6etbeKjJzKee9sMnOzJJ0vb61C/BcI3B9+iDBztALaKa1FmDBlM?=
 =?us-ascii?Q?HDX1psH9rJ2BYN9bqaZ4/e423w+art+GGAU4rcrApb6j6PBFV7SPI5JV+cWr?=
 =?us-ascii?Q?/XGBxh4KzTSZEodjcYKfTz9LrcZgppBAQYm4AEEVXAqk/iwMErEgcP0wT0S4?=
 =?us-ascii?Q?KZYMqctF2A1krZR4CtxIXb7eHlK/dpkLQvF66tBfY6MaYlHQ3qL7MFK28sT/?=
 =?us-ascii?Q?1H5/mBgLiDqtMMBzFKyxa8X2GyXiumTD1uydPGta11oFmRtzA+4tnmDCJEQi?=
 =?us-ascii?Q?ESRRit0JzHZjU8LqQt9IJGk6TpeQg8xjRls4tSqc/UNIfbDIs2BXjA0h7fAS?=
 =?us-ascii?Q?R21H1Ajuy95fuqODT02xUMV6tI9lyQOEQTmhP66PLtiN/c7U4vBAfxcuqY7Q?=
 =?us-ascii?Q?VQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94fcb351-f81b-4d41-e562-08dcbdfc5ce3
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 14:04:36.8718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ML0ut5IFHvMZXvPTdDLLceE5NNnxK8ha2qPyfwSkv82ivKnrYP/3wHWRf9zMpvmoqQIg+beEG31sEEfo+YPbYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR06MB9344
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 14:04:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203466

The 2.39 version of util-linux took new file descriptors based mount
kernel API into use. In relation to this change, the upstream release
notes in
https://github.com/util-linux/util-linux/blob/v2.39/Documentation/releases/=
v2.39-ReleaseNotes#L14-L21
mention that

  This change is very aggressive to libmount code, but hopefully, it does n=
ot introduce regressions in traditional mount(8) behavior.

While testing with a board using a 6.1 version kernel, an initramfs
rootfs based boot flow contains the error

  [FAILED] Failed to start Remount Root and Kernel File Systems.
  See 'systemctl status systemd-remount-fs.service' for details.

on closer inspection:

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

When issuing 'strace -ff mount -o remount /' the failure occurs at

  mount_setattr(3, "", AT_EMPTY_PATH, {attr_set=3DMOUNT_ATTR_RDONLY|MOUNT_A=
TTR_NOATIME|MOUNT_ATTR_NODIRATIME, attr_clr=3DMOUNT_ATTR_NOSUID|MOUNT_ATTR_=
NODEV|MOUNT_ATTR_NOEXEC|MOUNT_ATTR_NOATIME|MOUNT_ATTR_STRICTATIME|MOUNT_ATT=
R_NOSYMFOLLOW|0x40, propagation=3D0 /* MS_??? */, userns_fd=3D0}, 32) =3D -=
1 EINVAL (Invalid argument)

however the failure didn't occur when using qemuarm64 with 6.6 version
kernel to boot a corresponding initramfs image, in that case the exact
same call under strace returned 0.

Taking the above findings into consideration, add a new PACKAGECONFIG
option which allows to conveniently opt-out from prematurely using a
feature which can cause issues with a bit older kernels.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-core/util-linux/util-linux_2.40.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/util-linux/util-linux_2.40.1.bb b/meta/recip=
es-core/util-linux/util-linux_2.40.1.bb
index a1aab94055..3ecc55f61e 100644
--- a/meta/recipes-core/util-linux/util-linux_2.40.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
@@ -107,6 +107,7 @@ PACKAGECONFIG[cryptsetup] =3D "--with-cryptsetup,--with=
out-cryptsetup,cryptsetup"
 PACKAGECONFIG[chfn-chsh] =3D "--enable-chfn-chsh,--disable-chfn-chsh,"
 PACKAGECONFIG[selinux] =3D "--with-selinux,--without-selinux,libselinux"
 PACKAGECONFIG[lastlog2] =3D "--enable-liblastlog2,--disable-liblastlog2,sq=
lite3"
+PACKAGECONFIG[no-libmount-mountfd] =3D "--disable-libmount-mountfd-support=
"
=20
 EXTRA_OEMAKE =3D "ARCH=3D${TARGET_ARCH} CPU=3D CPUOPT=3D 'OPT=3D${CFLAGS}'=
"
=20
--=20
2.39.2



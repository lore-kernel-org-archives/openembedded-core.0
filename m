Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C88CC3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 10:11:16 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.122])
 by mx.groups.io with SMTP id smtpd.web11.207395.1724062268363661406
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 03:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=M5V2rOOu;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.247.122, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUDk0/uAkuBC9AuJU2feWkUitOa5EhCZJBT0lOeW8/m7KVMjsEVWYEMG0tgQC0pjW33ZMPtPJiW6hb27lU81ZkXp92sMi+pMZopf/ier37E2j0lhwQGiUmmxWoVgTwyVZ42CohKrkByGasEt+jBb0HviTrs3IZ/LfokYDdDcEQZFTlbb6xZGsq8hcZBTaQhiIascLILOc+iM0yZrVJe7gR2urBlP9UpZM9atqa4gyV8G/hjvt7rkZgNgm/MScP/qx4wMbliU2xVPQWAqpAXgQuBFBhPexjY6ao30B2vSTmeYW+44sILKlRzWkZ+EApghyXKTfsoPiYrDkDC562ARKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxZUSR3xAsc8TkwztVCVtm6eZXsQaQa/T5Bxuzq56to=;
 b=P/EfNB8GMLx0e6o+MEOX0OQYXu0ObhNfRCO+8yoXbwzDtlEjSWzeWwg8OyZS5jZO6T4ks1bMKZft2zbBL0eoAI4YnccOvpt2yv3XNeeFya6s5mLBr3dgNMgaZlgHtiYs4lxENHzWJTdCJxB63Df4TfqIznhNTIEgXUyGgHILBZOEzNcmqVbVyxQj+I319ay0ImxZ1Lft0i8VDtvoJr9BXVuvkmfbQZmnKVUjdFeXR/U3MMNtrlZ52Ii2fGrp/NZRN8PpUjE/eFt1uOyB9apMHU36OgDbnMCcLykddD9KTt20UPzfoWXg5xYjY0RyqWJv561mK1JvxzwqK2co1VcO+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxZUSR3xAsc8TkwztVCVtm6eZXsQaQa/T5Bxuzq56to=;
 b=M5V2rOOubJnCPRRid9BN+g0uzNb6Y28zUHMmYpxhvOTs8RX5ZWjChcYYnqWywdShijPWTjUp3HHs73cPzBnd2WdqfZq6QeSW6RhViaY+e34Njlfg+rGNeoPm8dC2g/g5VSp550XO/NHLcS0hspA9Nkrgf4tM5W2G1fX/BtRc0OptWvK8qZUjpvFa7W+SFUaem/9toIO59H+7yzSl1SCEsh3p8AwSb+flTqaoE5MISbq9d8aRbht46VNRLa39ulxyI4zpXrtdT8aYlru7f0clPJBLZLCk6a+S7lx6x59a6HW9ZcPusAdqbUAMOa8Ln82EogdBevv+kCtK02o6CHt60w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VI2PR06MB9311.eurprd06.prod.outlook.com (2603:10a6:800:223::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 10:11:03 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 10:11:03 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v4] util-linux: Add PACKAGECONFIG option to mitigate rootfs remount error
Date: Mon, 19 Aug 2024 10:10:25 +0000
Message-ID: <20240819101025.2254095-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0039.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:9::8)
 To AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VI2PR06MB9311:EE_
X-MS-Office365-Filtering-Correlation-Id: 14f434a1-4489-40c6-8cad-08dcc0373ba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xDbHMA6vRoUgf+lbpf1yF6fwjS4F/cAmYoTr9o8uiIAElEjjGenshXVlZzBP?=
 =?us-ascii?Q?5qHq1BW7+QQlbr4br9epz0UafBhqb8gXvUnF4G9AIYD+9QmOFifSIGS1KS+U?=
 =?us-ascii?Q?2NNvWsKYR0us/GrCT34AjaSP0BtcMrxWm6onRaluhb7C8NFkObk36JhiO5EI?=
 =?us-ascii?Q?hAmGNn4mUSv2Eai+kFp5S09fClWO3s3TB1sRnXraUJA2XW1HHYhA5pzxa1Rc?=
 =?us-ascii?Q?E55xfFEma8TNbuJ1uABVskWFZWtuV4kXs2M0AUBuOKBr/Ix76teS/xzdyx+D?=
 =?us-ascii?Q?zEP3lVrVvhKV1p+hYD44PBM7D9XhPB7GD8TmCQOTPmfjfFN4+ABK1+d8FyNH?=
 =?us-ascii?Q?DK84q+dvC4+0Xpd3qKsm+pWkAEpHAo6KgQDPAdiCy+Na8pWW4b+zmhiGEyKZ?=
 =?us-ascii?Q?ZvD/e57anvl0g8HkRTHyrBbsINpu2ib+EE6gD4ttYX/8vOS2DFqHPXJwWU02?=
 =?us-ascii?Q?a1zlQv1NOlJDFfzDXc/qcd5JUj14+iN9sFcrru78d1/qekdIdzKBLZ/GgEbx?=
 =?us-ascii?Q?CLVZH6TqjRNVxVZPDCEqM3XXtkBhr+waYbPZMxy+oC0xfgX2vXMG8b8hBFRB?=
 =?us-ascii?Q?eB+kmMTlE7QYb6uhiIPhFWj7GRHYqkgDrsO32EAXlPqsIg+B4BGahCnKp2/U?=
 =?us-ascii?Q?3rHqTOXdw7l7QvMye6KN8r5mdnV5SSJOoVwaPCmFm9ObyjdyrJbhVHR8XycM?=
 =?us-ascii?Q?9+yUJXXLyB6rA5+Ma+XIMGpWXa2C+xOcnfvACLmdfuHOdIDG4I6e8RnfG0e7?=
 =?us-ascii?Q?3UAENxZ6Mr9AftFbVsg7lr1g6HC5g0sOFDOID0CKurxLS+H7htBuICSenfME?=
 =?us-ascii?Q?f87Yj120h6UA7svBtjsEVSPn+d3GQ9AtaBkGk39fjSltHEi20dXgvPkkgezF?=
 =?us-ascii?Q?w0Kpb3W2xxOdLtZFsYIi/gUf4cu+sFPnnSp9C5Jis8llxKsQBs/JpCoaP60w?=
 =?us-ascii?Q?OTkWApFVMMyvxZ23aEexl0wnePsFWx4U3L2ss77VoD3Frp8InQl7O5MlxN1y?=
 =?us-ascii?Q?7okjD6fmCykNJAIwPZDPQmHG0rNPbYs24AYhX3MpFw6MB2jGukcQ8bGxaKls?=
 =?us-ascii?Q?1vOq/zBlQKFJDId7Xw/HvNNicnJLShX5ukFVFixYcdex/IF4c6tmJgBaXXRE?=
 =?us-ascii?Q?3RRhEEFP1p9wv7E0Ot5Y/ErljqgylGbMsHe0LdzX0KyB5TR1T4owwC3A4ovi?=
 =?us-ascii?Q?pQij2hcN41f0aouhbFHHQpYwLBjLfLGk1+xqdGTkW1mr4ttyCZhPb2eu5/VL?=
 =?us-ascii?Q?Ha3C8roqGkIDPGe1fLEXSnnVBi44+fSDZHFcaOMmY0MoiSRVnHSVL3SCsCTF?=
 =?us-ascii?Q?Ywiset6/3+uFDqJ14HamWCwWR96fOi6UNeBbPYaOGoE3eGu/45/tjOIMIf0u?=
 =?us-ascii?Q?lBe/qrE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZlZvuV+OVLuGDVLP8LJYe9JsC/J9qPlvabFVhAhfSSF5nCiE3nfYklmNwsRt?=
 =?us-ascii?Q?hdllHmBdiZR69TUAQwObMcLITmHa8GBNwKg3zgzcr2bKNwkpkmK1v7e7w6ix?=
 =?us-ascii?Q?hwO1//A71owo1E83esvYbSKbr4nNP8QiCI2RPEkmQY8wju4hiiZjXRxjXCMF?=
 =?us-ascii?Q?13kQ3fOiesTZHnNrs4cE/39kuMim7TIOxfIGHYO46mTf5/qX4b1myw+XFUaJ?=
 =?us-ascii?Q?Bospo40Nk7IhEm2rIo9hhVimKhEZUrCR0eKTGKIPRkoyjjtNizBIFl+M4iX3?=
 =?us-ascii?Q?8b3DrJ6THHBuuFlK8iuA4HIXQ8bmLY5UoYPONRR8uqcma7VaeYcs6E6r3E2L?=
 =?us-ascii?Q?ALcWcmUtdBOuPvir5OTxIoa7xkWbHzXgldAt8qtQxY4sqmR30V+1m2BsxMdr?=
 =?us-ascii?Q?hMmC+1APKYbEZFIoSIoYoiSVRFgbX3H0hs0NeougWCz51rrCrwCOatDoPAoq?=
 =?us-ascii?Q?vArpxnIP5q7urSJhD5yCPosTPR9LWw5rUPjISZce5i6x5+2NsH+f/DlmYoU1?=
 =?us-ascii?Q?JEcEv4psfOBRiA1eS3ZY1YrwbRWh7Vp9w6bflBri1MeXJuM6+AvAtqvl3WsG?=
 =?us-ascii?Q?Ds2JUj20bX2FIECpYx1FF/w8h5oPR/HEAddtveuIMQoZFnbol9t7k913NajC?=
 =?us-ascii?Q?ZmtMzV4REOvaKW4Rloo/9H8xHd6LOsJ5s29d8ACDhUcry87iuszAb0Mprd7E?=
 =?us-ascii?Q?B93NF6DfgmJ4hsbT+MLDUs1hi8qW3llqpKyp9UWEwlj+7iPplpDpS8JpDQcP?=
 =?us-ascii?Q?jcg06sB70GrE5Kmh4H6lF+tORiHRaJ5lRSVQciJbU1MiCPIXHlnQSGgVnBPc?=
 =?us-ascii?Q?dURF9DWQ+y9P82EaY5KhoyFCisoqMT6v2EaTL83isvJPDCWpah3qfV/L3OeJ?=
 =?us-ascii?Q?6KRoDtgJnXMjAmfjljvtBPobCRRIw3lC4KJt/0VLozDQqfhA631xfUpyK4qa?=
 =?us-ascii?Q?DZ937wBlAQ1XD6w9/g8yplWsqwU6XN78HOGGKvkmEWz9thw/PG3LLsNqq7g5?=
 =?us-ascii?Q?TgWLp0ZjLZzoj6DINQhogioWH1pC+Oa32LymjMmS63m64lDS1extuIDIsiOj?=
 =?us-ascii?Q?9X+/1SEyU7wR4Dl3VqmxHWKHGdo1dk0BhgJSCdFq9hVaTb32pRfM9faUJ4hw?=
 =?us-ascii?Q?k4NrZeGCuIKr6jyulfD+R8RyekbBzciNFrVU8EzBRNxm2uv9jCnHZxOl1/lJ?=
 =?us-ascii?Q?IrQ2+7YIOHRvXMA/Q2YhYxBMJfuhawSt20g4Ik3LoIGpXYzCgJckiA4+2R2F?=
 =?us-ascii?Q?dcMgKqyv/RQWO4P/BmsrsOCeZMtCpsTzvMH7ONAnf1mZwRMl0B7gMJowJSbS?=
 =?us-ascii?Q?ud7BWZ7mdVcQW7Qnb0/TECZ9sRZpvp8lQRHnTlPnQV+O2UjbkUt1tqnSemps?=
 =?us-ascii?Q?6vceMQpfjMY/vd9wMsyushDTb3J/aEoXjcgLjThlScxVYRL2r96AjUslR6Mg?=
 =?us-ascii?Q?qlXTXbm2DQYFT0vWo9MsDGjwSFllxYCJclTBAF7ut+z39GQNOk8WQ2b7G59m?=
 =?us-ascii?Q?FdnCoZAJUfaKGLQIc56M2gHJi0//qDl4ZHEqo+funJFxY7QThbz2rVYYlE1p?=
 =?us-ascii?Q?ilxZx5RX4wWcgE747Q/JWOc+8rTYq9zw1vAGvSn7wKCbkf/HV08IFWHbnYrm?=
 =?us-ascii?Q?QQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f434a1-4489-40c6-8cad-08dcc0373ba0
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 10:11:03.6623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7eleaYIZ1UqwpYs+wVucye8f4nDz8ZLxg8Z2xETebIS9Fe4et/4ssGChiaRRh3vTceibJ2N5wyUYdqE9twOZwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR06MB9311
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 10:11:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203499

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
option which allows to conveniently opt-out from prematurely using a
feature which can cause issues with a bit older kernels.

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
 meta/recipes-core/util-linux/util-linux_2.40.1.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux_2.40.1.bb b/meta/recip=
es-core/util-linux/util-linux_2.40.1.bb
index a1aab94055..0b36df8e1b 100644
--- a/meta/recipes-core/util-linux/util-linux_2.40.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
@@ -107,6 +107,13 @@ PACKAGECONFIG[cryptsetup] =3D "--with-cryptsetup,--wit=
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
+PACKAGECONFIG[no-new-mount-api] =3D "--disable-libmount-mountfd-support,--=
enable-libmount-mountfd-support"
=20
 EXTRA_OEMAKE =3D "ARCH=3D${TARGET_ARCH} CPU=3D CPUOPT=3D 'OPT=3D${CFLAGS}'=
"
=20
--=20
2.39.2



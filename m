Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34ACEC5320E
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 09:28:06 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.110])
 by mx.groups.io with SMTP id smtpd.web11.206716.1724059676345457667
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 02:27:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=AQPJ44VJ;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.110, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClNvADOof7wAg6XPLY1iVjdMa2t9eR7vU86KXDHN3Tw5yx9Dw+QdrlB3wAjfbSQBvnTm36bQU/V4w5Lf6K1fRmGwOPyi2ei5TeMi8IoX21C9a58iDWsN/wUX3ME9xOUUxPhmGV0Lq/utFrYkUfR49pZV0SIm8Du5/U37ICn/8ghGnWtxQXeOzd0KPhBQ8TuEpQOAm1DWzjbfB75QeRQ7cx5LmiwWs/qqalERvfPjIDITw0z60r4G0Xo1jFZVoQllGgTUT+s0G5rSqkjiBGRMw4V/ZlF5V7AJjVQ/3IEr7/TJQrAkpXCculrMN16HbS2Ds2L86u/Gvz/BMztXwsZznA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTpMb1C1aniOIOcnaoiTpwSQb/x+QTWBpkGmdbICLzY=;
 b=NmJ+lm8tTy+5CC+CqI8TEf1Vz1eAY1huS0SFx5R8PzadKb/J75KzanDfvhdcVLBoENcCVOSvdllqAX+zJMCXYT7PHuNZnfa/zcGsC2qyJbAUhquokF6a/Idw8Ma9MDPRLGmqufehtLq8A5VobbrXHFHTEeiOsbAXSPoY5NgG+i9aok+dzkpoJS7FQk3HcPvnoMLLos1Km38WCzYbo25xaiSA8PVX9NFcZW+jESzpFbVcjkJW3ry6ObsqSlQHVvffAyJuyI2deHwIOg2XzDmVmot0PPmgdkuCzvCx5BOwU9kzrJjrXe+0SaTs2MZkxw/+6EAM+iNi8oQVKBSI/asJeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTpMb1C1aniOIOcnaoiTpwSQb/x+QTWBpkGmdbICLzY=;
 b=AQPJ44VJUkMfzJQg2MvbP2LvTphhcq2kthfT9pQNHrLzljVZYVBjK+vPAxlBCgMv2gt0we62JJIv2sOU204PilfsReFKWl9nkbr2qAyYFVnK7xV97SjEbECoS/d8uc1Lq4nZJCr+KxZLxt8djr9yyev4DSnUhSZ0GUi4x+W2VbRj9nq6JFFDh/xX8cjaWL8TfVEq6tgofllnw/234sOBLWNq+RtHeXHS2EfSNaM0yi5pEw1rpAU4aTbdF88aTGA8R0z8Ok7NCcHn74I1IrxA0tcxj+gYj6to774oXzFHgrGZQQBSufnaN+GRpLW8UeeHzPqnr0gjA1bgEWYXradMyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB7728.eurprd06.prod.outlook.com (2603:10a6:102:150::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Mon, 19 Aug
 2024 09:27:52 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 09:27:52 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v3] util-linux: Add PACKAGECONFIG option to mitigate rootfs remount error
Date: Mon, 19 Aug 2024 09:27:39 +0000
Message-ID: <20240819092739.2063887-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0116.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::15) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PAXPR06MB7728:EE_
X-MS-Office365-Filtering-Correlation-Id: e2c5ed32-c024-4914-a927-08dcc0313324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2i3RyLx4eGeN8h46MNxqHufGOZVSBvacJ9bUPPdfir8ndWLWmyqRRM2lQk6F?=
 =?us-ascii?Q?I276F5ymIVFKVGiEM1qKJR7D5sYZkz/18R+tWj0f3PgvgD0zRpTke9R0SKfL?=
 =?us-ascii?Q?QMziQ0tQgj4DT3+sZQxdhZAk7Vx9gGnn9UZU/YgZlJlIVkEnoId8yMm9dYkE?=
 =?us-ascii?Q?rskUEXDS+LiuFCC6dPjBghDKHsjeJHbK17kb4iCnE4MhvpK495Es70tEni04?=
 =?us-ascii?Q?krzEeYKiGdA1MqvlQjcdMYYcRElrL2mZYO9FWb0LYEd4JF9wIU3XUGbLq38l?=
 =?us-ascii?Q?d16JgEH7sfZKKEjyXciGU6BT+Y1rJqxEp8v3Rv4nEVhxjGJA6hSWenwq2VN1?=
 =?us-ascii?Q?YJjKBzS+N+8mCMsTlk87vEA+MztW+6ZjgOiE3zTugVqBzK5J7/38yFOjpj30?=
 =?us-ascii?Q?S9FlgidMbq6p9gYnx5ti2oaIgLhHbNat8nHul/Gd+rpY2iZMlAFLJ7uub9Jc?=
 =?us-ascii?Q?JnvoA/94g8T7A0AJ791nTQTAXz49ZEuECIsZpmE66vmbHa9kJyNd+4J3GddE?=
 =?us-ascii?Q?Bxg3BVd7Dsw3G+c8i6mrkU1UQDE0WFV98kUrBWtPN5qUs1KebTNU5rnHXUnv?=
 =?us-ascii?Q?Y7NRNWMPVqIRmu/3far7pV7UM6V+rHtGISkrtHR96dCdtjkdi3VJxToy4T+Z?=
 =?us-ascii?Q?0aMJLa98IM077yib2CCSAz2X2aaduSBWRzQhfX1ucC19UatwpQs43yCPt2Lr?=
 =?us-ascii?Q?zmBJYX9f/GUnEgWzcPwa8mp2/7rVmI6EFlCyhafwIW+3wplpdX7eU0e7hU73?=
 =?us-ascii?Q?rYY4cjhWkYo0jFBRNou75ZTPtPovAe04prTL/v3O3fZWcvxhza63KO+8iXCh?=
 =?us-ascii?Q?tGrd7zp4SNfq+JW6I5CW06V4HMXE4qJMOxuv+KebuPfZx3JyKx7QbxDy51KG?=
 =?us-ascii?Q?iOSwAtxIEVUgocdPM6KBSsAOxanp7cMoZHE8PAXVX2jcQJotqc6CW2K8QHWl?=
 =?us-ascii?Q?Si8xr80TpjxYuDfIwzATTcJz/1pQb8EeXUFPdDRhp9c/3mKlNVnhI8sQEsEt?=
 =?us-ascii?Q?8VijFVkuDmQP6Ppi6W1KssBMn3+MhRp7MGsjMXEX0WKE+Umv162nyJZtFzzQ?=
 =?us-ascii?Q?PKbATROMyxdzWxIu8+VIb3jQ5X1fMNQaH4Wq3epVFxmq2fBcyJgT0jus4+39?=
 =?us-ascii?Q?sXoXUpYEPzzRssfgUJGlr9WTIhuKCYkEseu7emY86/d+u6GExevd12p+SJ60?=
 =?us-ascii?Q?FyG4trv1BcqFD2gzJNeA8N8IUnUgDVZwl9eZ9Orcty4R0D+fCbgNtJM2uN9x?=
 =?us-ascii?Q?QgnHIr3ZU9HgEWTr4yO2XAvP0x5qS6DAPsUUim88X2UWESCEW2+3IjfqSGHp?=
 =?us-ascii?Q?tknjSiiCWt3hPcDzSjRPoC6PKMyplKrO2P4xfwSik+/nGGOcF6e1SaWpSnfC?=
 =?us-ascii?Q?UFrgrpo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UlgVRz+FOLxLlGoMuL9vpQTHbQG6Ght+UVpCK8WsPaiLQkyLmHAVwjK1XnpU?=
 =?us-ascii?Q?xFIOL30hBchqKvbWDyNcimw/bavGQYz0XLRCJ22VQME3+a1OiOycfunEQl70?=
 =?us-ascii?Q?QHumLic9am+d0u7pgxT/s+4zvolKL/zCrFlnbehkmBeE8bsiDvLAgsf+9fh2?=
 =?us-ascii?Q?G+zeUKWVAMa3sYcRzeKbyPeVnmTmYPeAdJukFXbWNT+ahQXxIr0bPfwo9rby?=
 =?us-ascii?Q?fIcgxQwsPRnIDg2nTCkQXVZZxzQy7u5AOwaivK9FB9pxCzFJh37B2Fn8NGhW?=
 =?us-ascii?Q?e5h0I4R0tH2Nm0rrKg+xZHGicOhSNK9mT54oFB3nWx+Z3v2yLfHa0sjONhlQ?=
 =?us-ascii?Q?0ZEoBcAJSAe1zSx2wXRBRASBY3+ebEtVIj6X/5ZPsHQAd3R1ggZii4gbQ3YA?=
 =?us-ascii?Q?pofDZGOSiWYsfpufh9g+aS0sI+vLlK5prD2x/B8K4EDUVMhQSO2Hn3Q9CWoe?=
 =?us-ascii?Q?OjjV95qFzZ9cGPWI4s879BqHzFE/MFKCC9bBtPhee/HdDX9E71+xfOsP45zJ?=
 =?us-ascii?Q?99NydGuFVYNl3HXE9wYd1u+lFp542wh021J/pZNmP0z1nYMV7LTjzLH1GkxR?=
 =?us-ascii?Q?rmrMK+E4e4kNjfn6X+sYN17hb7lsTSHGEVuZdn2QaxzOBiSasgJOZ4cHMThc?=
 =?us-ascii?Q?qF/6x+VspEIk6uOKokX8tMEqSewanSwPXbNQq24yr6sRMbEcTGO2Dy5O1+E+?=
 =?us-ascii?Q?uNBjigLeal6PU3WuD5fXfoilI9GX2BKvAkCK24Wr0FLeV6K6BmVbHNd/mcOD?=
 =?us-ascii?Q?fAemANrSHQ1q6Ev2zOm7HOWbNhrHQsfxKXO6Snedajol8S3FGSIhZ0unChUD?=
 =?us-ascii?Q?+DI2PfHevPWp0rcYKjBHrYU6j7K1WZ7R7sS12YLelGawBIoUyEERAoCaV0zc?=
 =?us-ascii?Q?Hl09sRnTnMiEqdtUr9XybgTM4bS+rexF0nepTkPL9KrRVNcNLVKW+ZAPSHP0?=
 =?us-ascii?Q?mE6aVW+DZ3TQXNwFDfeEB4SBzSG0UsHPB8C7a2lxRcU/FVZ+yDYuLOZfSPL1?=
 =?us-ascii?Q?o5Hf51MQaoGX4cYn7NjLFenKnUZO/VE/8eWycs87VPGes2FDesOPsFXj0zpa?=
 =?us-ascii?Q?Ai0CxQIWUpvPWvg4HKERcCyIwp0AAtGZ+ZYDCHYNh3wiS1yZbm0LLBCRbWrz?=
 =?us-ascii?Q?SmkbJSPkf8/8ZPB+Su/eelX3wIIgYtvMUTIWm/PCuiLYmUfuT5zp9l+bmaGa?=
 =?us-ascii?Q?SlTs8pY2dmpk4Wl8fjGObw9J/j6eR2uxujInUBGMWaq27V/XuOJPs92lZde+?=
 =?us-ascii?Q?p60cUtnqd3aSNn3ecEE+g4pNwC2rI5FBr8mq2uBn/iNOFrBjNf8V83NCP2/7?=
 =?us-ascii?Q?FxliU5NpnATQ4ne1Tk0jqY2hpE3+KQ/A/qjdW25DOTywOTkM6MDubyAU/6U8?=
 =?us-ascii?Q?IRwmZU/BllTzelcl0sZulS5MRroPhRwRZSOFFo4Nk/0exdDNk1UJN9m1qytE?=
 =?us-ascii?Q?CyN+InQthXBp5o9FiXuWd2LhXKr0orMtOQR8YD0/5/FDMMyvgzbbxYvna7dG?=
 =?us-ascii?Q?kEgFLpjOd1S2SKg4kvZ6XyhcX3MrYYk1kyEpctptPSFsMKJFJY6MXW4eLMBi?=
 =?us-ascii?Q?2USDxnEnuovAj9kuk/G0UTK2rLMwSSn3opc2SLxd7ZpYK6qG1qJRROEVKpKw?=
 =?us-ascii?Q?7A=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c5ed32-c024-4914-a927-08dcc0313324
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 09:27:52.4578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7x7LKrINOOvgjkwoJGF3feHtKS9agfftua+tR54p1+3CU5qERla+BoFDOf1tpmlU+xJFZuBHCalqEIjzUkc1zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7728
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 09:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203494

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
index a1aab94055..e87657cc70 100644
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
+# Of currently supported LTS kernels, it seems safe to enable this option =
with:
+# - version 6.6.18 and newer in the 6.6.y series.
+# - version 6.1.79 and newer in the 6.1.y series.
+# - with the 5.15.y series, versions till at least 5.15.164 can not use it=
.
+# - with 5.10.y, 5.4.y and 4.19.y series kernels libmount seemed to use th=
e old API regardless of this option.
+PACKAGECONFIG[no-new-mount-api] =3D "--disable-libmount-mountfd-support,--=
enable-libmount-mountfd-support"
=20
 EXTRA_OEMAKE =3D "ARCH=3D${TARGET_ARCH} CPU=3D CPUOPT=3D 'OPT=3D${CFLAGS}'=
"
=20
--=20
2.39.2



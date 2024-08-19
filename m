Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6E3C52D7C
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 08:23:15 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.105])
 by mx.groups.io with SMTP id smtpd.web10.205847.1724055772824952877
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 01:22:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=zEIvwb+z;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.103.105, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uz4oNHWroV29AI/Hi/zM8ww4xTu54nGJmjRfgpfwGUxf6kpUGsKpg0nMDdw+JYGvJN+Qvxirlr3p6ntKgLJeydaBmCyb/KV22R+MBGtpB7qquVgfh9msGbG4gNnw4xSiyIFYHdMDLtc+MRQxZVpOJGY6PYTUPqVPgGrdFlU5xpU3+GdDXw85vCjVOFbGgHggGZdU3ejQGYh/hp0w2RANIaFCxhF3G0ZT0zpKWfRdwfllAvOh+avHNgW85BU0EOP6E4qbfPka2tz+74+es0Y6Ni/SafyTFq+VwEwEFFn3BJJ/kKVmZiByDxnR3GwNCt+qTzcHyCJG+Ildkk3PcssVZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ui4Drf53R7IigDF/7ioI4IAefLsDZAuIWEHHQbXHNf8=;
 b=RnM9F4DWpFmtwqj1iRawKSJs5qE28BOLKM1FFXPYu8oArq2o2ljjfHUbSheZm1EbZ+O+kkWBFJmXmDp0CFRhtvu0FPbiGLP7IYyfwHqPa/KE++9hQ3tHlHclJRO//X69nF01XGCA+eAcQ3WxQCWIHQsqrzUJ+4XgVaLkffWQD6pbJkoSKSv/klE8pubfoy7x/u4QKupOWaq6NiERsS6nzdr6qDbFYUdESQ/fefvioGsVEOO1gW8u/AFbrr9nlqOpNsoyXt4z0B50oL8WGrZ4YUXJy2wciPcEn4qPxlm6SXGDJ1lVC09NFR4NY2BaA7iosd3JFbWmCbnEpgVjm/RVvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ui4Drf53R7IigDF/7ioI4IAefLsDZAuIWEHHQbXHNf8=;
 b=zEIvwb+z/fg6WYNZG8TIpDpX9bGHDnTjL67ufr+5MJ24l+jW3LCRzcFtb5LLxUDr29yuMd3uVhHZINdTNWQIEt+lfWOPPJwD1XH0yA4ytH8Q0JqB3Ncc79mDC9N/viOTCNtDQVAbpUkhja9kdqnjXDhReF7p+YhgZ2enSejkcwsxvi4fxBLtlaCStHCw7U5kGOAH2OwGYPeIcmX64hHKDa/cMO9t0HZEb6t9ME/Y0Prpe9sEZE0FkSS2URxP0T6UMfbNMUUe+dCEhipKSnOW8AR2qnyMzhBpHQrND6uYTJVvtLcUJwbPDk4ecokTjcyKN2Z3GtRcnL1g4Sg6i6OuLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AM9PR06MB7249.eurprd06.prod.outlook.com (2603:10a6:20b:2d0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 08:22:48 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 08:22:48 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v2] util-linux: Add PACKAGECONFIG option to mitigate rootfs remount error
Date: Mon, 19 Aug 2024 08:22:15 +0000
Message-ID: <20240819082215.1322013-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0000366A.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::386) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AM9PR06MB7249:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f564a41-1e4f-4dfc-9d39-08dcc0281c6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xznDB2R/YwC/y0LinrIN6V18gSV12ggI4osEeu78mZsbclw14taYZ/K5db37?=
 =?us-ascii?Q?nOIxsPA6SzyETVTksZKVR2TnVqrT/QF2ZTPa7AlfsWdK2FvAPGDVGQnEAOoP?=
 =?us-ascii?Q?jDpze5W5qQTWh0+mNF1R5dclbekw8XEGDzVG0vUEVHcaJicqHbG8T8F4TZLV?=
 =?us-ascii?Q?3v7waa0SjqgylJuzcp4V4UjnjYDH/fFFjycYksp93WbmaGqdiXBzp2Jc8gUq?=
 =?us-ascii?Q?bxrDYvE70YW+F5GmfkW+Ti8Qbsh44E/Eejfwy/gxUaY/0TqTAIDWSS4zdnp7?=
 =?us-ascii?Q?0l7vgEr0NFLxIU+pVcdH7p7faSsWer0esygTdI5zXDhTvXreJawiSJ9vqf9S?=
 =?us-ascii?Q?6BNqx93QkSnc8HtJ4OGrrw/0qM71Tna8+HoVrrE0OXHlqfKlVXLdoc0OG5ii?=
 =?us-ascii?Q?8S15Y4ajRjytJMDBRwXJ9jVLhLwSsD7ws2zp7JjZGX4sReFbyDFA59pPfJPE?=
 =?us-ascii?Q?VgrYzgZw8V7+XruyXJ/9/q2EMVCkZdK0NBL3j9OdO85o0tjIMwpOc0Q1RKs+?=
 =?us-ascii?Q?qsGpjdqU5ODIk060+nlZ1Dn+DR8UQJ1zeIqYFaX5+d7cNtgruu5fMPvpva7f?=
 =?us-ascii?Q?y4tiRR1l46x9sY/5daAD+4Y2gwyoiHyrj7OHyKFw8BTMuePaUwv7I4xjKodj?=
 =?us-ascii?Q?j4P+ZL9TrH2xByK29llubWEAnEV2+fGsn41pylq7kFxIVz4vrUm5oMgOUx7F?=
 =?us-ascii?Q?OzrIQ9OsOZtj5tbw8Zhm+zlhKoDRmX+oseCWEV7a+nfekpaPhCPWikFsjRJO?=
 =?us-ascii?Q?C0Asiv7bWvB5qGDV1lFitEchcZ2YS+rKb1GMt4DlyZ2CxKSZcAZJLZolHY31?=
 =?us-ascii?Q?bhxbtJgXlntvsDiyzpLjwcoexi9iV2//UYsyU033JRHIVaMDYC7p0WznX4Rs?=
 =?us-ascii?Q?8c4jTnykUW4CUgQceLk0ZM2aAUOb2ZTResBbPRIx2h4C9oAaTUc7TLR/y8yw?=
 =?us-ascii?Q?dBMtcsSl1JCAtQxfmXuqifdPlQAC2F4FSwlmRzPBhUyE6LMd10t7u/egcoNv?=
 =?us-ascii?Q?hAXiQFc/dl4Efl02aUM04+sR2ro0MN7yL4JHiIFkUeY88Khj9azRF4FHuxa8?=
 =?us-ascii?Q?yaoe3NqcFepQ1t99FlhlZt/FfhPU6/qqaKky8I4EUjSicwM/KVeQqhPFZHMJ?=
 =?us-ascii?Q?KPLHsdk9na3cYU7FCAwN4upX9d4EmsXOgvUkoRe0T4NN2CqqxYMtPPDo8As1?=
 =?us-ascii?Q?YlroSFj0GqM67sC0yjGZ9Pe8qalngieVzEZqeHf9ZE9fIJZaj/2k+CsCJWkE?=
 =?us-ascii?Q?+MIr+4r/TeKzT/Wzlei1PGu4VoAf0DNBgM3uagCKJzdYQDLWfbEy/e39dk6u?=
 =?us-ascii?Q?hpb40qKvOYiewkYjUd8XkW71H/lIeAucx/sZ0FmQQXJoCL/Uo0w9leb+0ajp?=
 =?us-ascii?Q?5v3EHnI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+wGZbTS7Zc5zi1Ob/mifV4Bk3a4+nqod0ox3XKnrYvu4LcE21hRN2wXEzZsX?=
 =?us-ascii?Q?LWcgjwgo0IZwxH93/Uan8xyAIxC4ONkylhiO2ryeA/s9f53trggRFPuEULon?=
 =?us-ascii?Q?F2NCDOJSGgCdSUBjVoSntAPDqjqVjboXSnstYITPwmJZVIEuQYwLRDkOCjHy?=
 =?us-ascii?Q?pDDOJhaPKY1NRTCPYG0eftTvLzFRM/mrM+95CeY8GqNtkUlbGr5s615Sk+wV?=
 =?us-ascii?Q?/MVz53M3IG52mEcm7Kkc6tnWodCLAHkMOgqBdHVYu/wc0o3p0FBYQsYOq7JV?=
 =?us-ascii?Q?qpYkpWFkKMIWIih033d3IPCHcpoUyyvUqrRWKNK3hml+hUjPPEteNyOUBFkz?=
 =?us-ascii?Q?fyuSZj0+YdkKkjEqPQ5tj1K7jYVULmpiEkQ4axQ++z8IzGlX0PpwvrWocw1q?=
 =?us-ascii?Q?2u9Y+sS6yyTim6Ctk/Vk72Ld5Fg/Je/TNH3iteRM9ffCpacOu4hs+I66gMsc?=
 =?us-ascii?Q?/wPpchB7RZa1DYKOdrN4kjQZdnUgWj+osayt/A08sY7Pibn9NI1GX1EG3/Xu?=
 =?us-ascii?Q?h6/WuCT4AciOi64NBguJ5xux8EFkRCffSEj9ZD9/cJdDk0dWR6T/dgLsWffh?=
 =?us-ascii?Q?Dkwcp7h0dj4YUHh2oTVHBByg9oyQal5fzKbySkmC4QHpyLSmzDJUxO7i9rSx?=
 =?us-ascii?Q?cks49EAuqg3MxWfchBS48Mehqhj+DUmIrcdzng+iY516pz4L8jQK6UHt0urp?=
 =?us-ascii?Q?JWc3hRZgytqpgWJ9V5fib/iSnRWOe6Fl1osvAE56n7QhK0rIn6bbC3cfbwlm?=
 =?us-ascii?Q?RGb6mxl8ruNGL59W1nBBBkMnRUq2ZRoPGT+m6qaM2VtB19K2+ihZI18ovWPM?=
 =?us-ascii?Q?bxlWJI3xw83OCDMuYRupAIiWYFK4W6Rfm0YC5dMjgUb6JqC19oGcVdzyaYR1?=
 =?us-ascii?Q?4Y/VAyN8rRLUvfN+vIkNM5a/bWJWKTG4df2Ukeid4wUh22SeEqRCv/nyrwsi?=
 =?us-ascii?Q?h1Lh6HrVJMFbJQgErSl3vjs+KoQJ0P6erZNuW2CKJXIFSgS58aBE7EeZOYg/?=
 =?us-ascii?Q?IwCNbovJrcBvmOOXE9wQzKhNs8YhPupEqLH41gZGK5izG91iVVtn2DOkSBwB?=
 =?us-ascii?Q?ZEBOvjszVs8hJSBcCKCKHw3vesUkPDx/vnWk7fV1Jn/ZQ9fdfVpPF6VS5qzc?=
 =?us-ascii?Q?l03/LDdIzNF/75xCIXIzwtmjDNrowdFa8aLpCfbkCsyh/XaUsGbAye3d5KJY?=
 =?us-ascii?Q?b/YU9WXXraAKKrAUGl3d5bEyCcjZ4Ts40NNNRF2ac81Agaex1MP5RQCeNt7I?=
 =?us-ascii?Q?g4eVWyW/sokDaEa4C4VDWx7k7dQZzSaMznay9hGODW/O+DaRpsx8glkDkS2H?=
 =?us-ascii?Q?Ehmv0sOflwqD7L7WCaRQJqbfiTorft7Z9bXO4Gd1A0KWKJhsSS2kJ5s4hq6U?=
 =?us-ascii?Q?4EYA70ClUlJ4OeBrpxkARMb3OH0soptg0PmcfT8RGCFo7ReAqpEecdeZDgto?=
 =?us-ascii?Q?TN9Cg7nCI2LXQv/OifH3mFZe1/iUandg0HYEG/1OgMhOqXmjCVNuGjpivtpd?=
 =?us-ascii?Q?FhQJqWVYpzKZDj2Iah75UHnQb4Wdmr6g/kZIWO0HJNuhdR20sjNVeOTS2vKq?=
 =?us-ascii?Q?5oSajC6qDBayp4vifWqW4aAEcuxcCm1xabk6/yoV8QBOirWcFsdVyaxYR7ii?=
 =?us-ascii?Q?VA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f564a41-1e4f-4dfc-9d39-08dcc0281c6e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 08:22:48.8788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OuatH1gSaRkhX5KxodZdTb37lj10vq25t4mkSTyZo1LapSBKcpH9vFJpUsxGUpCqcH43WNoTtl6t207JRhzMkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB7249
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 08:23:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203486

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
option which by default opts users out from using the feature which
can cause issues with some older kernels.

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
index a1aab94055..2d89eb6745 100644
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
+PACKAGECONFIG[new-mount-api] =3D "--enable-libmount-mountfd-support,--disa=
ble-libmount-mountfd-support"
=20
 EXTRA_OEMAKE =3D "ARCH=3D${TARGET_ARCH} CPU=3D CPUOPT=3D 'OPT=3D${CFLAGS}'=
"
=20
--=20
2.39.2



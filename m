Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79AAC52D6F
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 14:08:34 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.99])
 by mx.groups.io with SMTP id smtpd.web11.20682.1724249311019800618
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 07:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=gWu34NFk;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.105.99, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mxEw5uelQm9zLruuNmZ5/tQfJbRG0nvzMsCT0/OL6vJcHkV0T3Y1UI2bPrwvamglyTrTqJZJbgOaSTIFRFU+YAhehXm+aLPAfTnOZPKY96jwTUnQKe61BQb5SJPDCjGqMU2FjV13JfhaikK6zS08drxy7xA2lu0kEvr5L/btEUJc0pB/tSqMD8MqETDEf/JlXlPiXLqlcUn8obKlZpzm48IygVumArpG7L2AZUEvNs7eik5CH/ya/QHbZZaN1j1+GP5v2mtZ+1V215r7HDAaakECFFGjXhCqzU5ffNfdabHQ4CiAZ7sJbD5o3xpE3yIlsvsdWS0RkH2X6JMUkHe2Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HVdXF/AMcfwpeYHcV0oTUDU5Ut2zzJGvpjn8UCdG+sI=;
 b=B/x7Ym7eSRcNrn8FDPCztgDeREz6nw6rCPEofg6aK/iugHEGxaiWFPRkcNcUOeGnk6WVG2oDuoOyF21vvpZJY34cHhktoMyK2oU3mAmhFjOg967a4dwcOawtRd7u4rei0uDF3awdA+QqOchDceYctpkyMLaBorKo1aBGN9RpQxSFXgT0InqlEqWufAj6GpjNGtnxVBTWHtjs3fK0GTFgsxG+VbxXMTlvU2cwJYQkIcOM5fT/cr8i6+1qa62A/Wq6qlJQrVUJWjJT1tUxu4OAivxMK5kE/zeJM+B71N82iOmBKkHLBePnFwFFiK5JyRH7eDPewUYZwX9uhcDeClmasA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HVdXF/AMcfwpeYHcV0oTUDU5Ut2zzJGvpjn8UCdG+sI=;
 b=gWu34NFkVUJET0xTjZz3sNbo9yiQX7cZFJrMHI5+oTumkSGGopKBBAcPotRbGKoj4Gt5vT+mW0KXlaFvTiaU8YOnJJ1zVx+vqq6yssqiZ0YdkixGIpIK+xVPKwA8xFzcFLfIbjzZDhQETr+aihxUVYH2GBkYSgKgFHgEqtBdnmnmcdz6J8SvgT+iUnxyrFMbJyQG28JY06fShIki4iOy5Ev6rrpbBV4voq2WFlWJ+pBNLE/wtbh9wZRF+iK4umaNJcVPLSPidcTsMrUcHBgJnjWLGZW101BBg3X6Hsr1DGDEs2dbRcJFgleoAPqfEdHELKL+Xbq5FNwfln12OMy/MA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VI0PR06MB9673.eurprd06.prod.outlook.com (2603:10a6:800:215::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 14:08:26 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 14:08:26 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v6] util-linux: Add PACKAGECONFIG option to mitigate rootfs remount error
Date: Wed, 21 Aug 2024 14:07:46 +0000
Message-ID: <20240821140746.122156-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF0000FA8A.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:4:0:21) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VI0PR06MB9673:EE_
X-MS-Office365-Filtering-Correlation-Id: 852ade53-c2ee-4364-f3e5-08dcc1eaba04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?V8kkLn4UASgJ94toLVk1Xr/7sZT68+RHXW/Q9qF8APEdA2tIDyKeC2KxW9JW?=
 =?us-ascii?Q?s/1srwaYAZcHCB/h65KGF6kfLKs+KCPqLNulKR+1OTeh4Dy5HKFteoGQHtRr?=
 =?us-ascii?Q?xOkWiiaCPo6ZsIttaGG+leaS5gyGI4MepQDDMC/DwpAmCG30/KJ1JyO7zIR1?=
 =?us-ascii?Q?cWYT4WafANHjgifX9F8xaLO8tBLESFA3mUojfcCXjTJsjOQ95m2JYnxevkj1?=
 =?us-ascii?Q?KHGesZgWTSYuEhozGdJmBgnqoD7I6+XB3Ounr8hGVpPZlTaOiv8ZpgpMrE7G?=
 =?us-ascii?Q?ftCxr0TJzoFeDaUJYgJq4PVjL8M8Glum82xtRcnt7ioM1Zc3dGvd0iw+yJA5?=
 =?us-ascii?Q?JWR68Mt0fDTOX9GYSs0FXDSLplKbcychSdj8JL7KaA6GT8pK5cbt/e5A82Z7?=
 =?us-ascii?Q?xR5drA6yrRLBjNh5dyCH5ZSPVkRRQCnyIbB/4SRCgOwkDYe7cRQLoniF+ott?=
 =?us-ascii?Q?0I4LCfbORLg1h3qM69cPgJ8XLieaHHC50yoUiTvpnLPiIrcoOTCbfFzrGiQk?=
 =?us-ascii?Q?omoIfps+Wx0gMQNQPkzcTs+yqWuRZJdxu5VjRJrq5ZaTzsNIwhFcXhVcgtax?=
 =?us-ascii?Q?XNry0EAxAwRL9NNr0avaCDpKeO9ZCtWN5TdL8lAYlWfc0xSvMeMOueRI4mP7?=
 =?us-ascii?Q?jmYjjAvYsAmHBu4YOxCCyLpS3bXZM3KR13BqGHzeFHM7m/Qi19D3G9PBnfqb?=
 =?us-ascii?Q?Wd523fjwtuj8ReqpRmB3YyiODtUP5McU8jkyco3ZuByE+zL8zY3EvD5ATmzf?=
 =?us-ascii?Q?bGahOYPYXto0ckdFFowpJXt7pPYOK7EALCfP2oOgCLZQaAL/7oxwxtt8q73k?=
 =?us-ascii?Q?+C6WXDEv1gjDqE1/WkWq7Eo2v46apjSt9EURxt7vzyzcLAD98v4thQvc8Dyj?=
 =?us-ascii?Q?0Rh5ShfMT6F9v9cuv2tuMnzptQCWueqtTh/fRVSIuy94hlZ6257WEETMKvJk?=
 =?us-ascii?Q?8LLfbDCkHV9kcPmIX5VN2ZB+bOSDvtNzn6Bl3O/GVQViIrjHASOX2TElzo6T?=
 =?us-ascii?Q?1i40onLA0D44lkTslYITE3aR918qRHWYNmJ07NdvW11OZWPE0zIFx9ia4r0L?=
 =?us-ascii?Q?KEFuPr+3zIGuOLqAlq9FnV1NkvCxxq1cU1psO/vkySvrenAR0zeWARYWAdoo?=
 =?us-ascii?Q?QfytbPFxbB/wdCV4QP0UiRzenKnbHDP06hHnyTCYzsxFF7lvdHiEa1tgnvpL?=
 =?us-ascii?Q?sRCkt1UkCCM4ditOuy8cxi3CPJW2kAkghLOMxv7NDUQpFMoGS6nJX8FgLTB5?=
 =?us-ascii?Q?t2ayjz/hhhzau2vCQprVgf/I42fokqKF2+LEn1nOVUc42DfV4yI+ywRmFlkL?=
 =?us-ascii?Q?fem6SrIF4rt8NxbBUSKyPo+GjyhAPkG93wMMEwdCctNUqtIn8A5YKbU1saCv?=
 =?us-ascii?Q?a4x5+G4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?t6D570/IMTqSwB+D1PhM1cZLD7JQ5IogpJoqMyl3x4058b3tiE71nnG3qF/1?=
 =?us-ascii?Q?FLf+5/YWrcNqC4J+DVTZyaWjntfkWB2YSnPWPOi8d6bomvPFX5QUAAL1CDtX?=
 =?us-ascii?Q?+pSw0n54GMioQ9sgied0sGhxPZXF836RroNMEuxjnw1Lc61t/ThWnO81Fsi2?=
 =?us-ascii?Q?0EZGxAlpB6fhOcosxokkXqqKG8R+WGAB/5mg0maLuf6K5B4GqF878E9CFZcS?=
 =?us-ascii?Q?wirTRpZa3tqz8+tIuhS4CohZhtAK3EKhrxFe0y4SlhCbzbCs41go/4DQfPRM?=
 =?us-ascii?Q?SFYUf/dhYLF2EJkG6cItoG8dN9+2Do86iGFUIFzPYZIXo8ygv8nIITyDfoM3?=
 =?us-ascii?Q?xP9tiFRiagFzDN29hNaspWfgQOLnEi3ww3Vmlf7UbTKPHlBT1DSiuqmk7/Nx?=
 =?us-ascii?Q?encHVtmqClgl4ifhdPOExehkeDvMVP00CMNNQC9V8a1Rj2D5LBe2WENOjmZx?=
 =?us-ascii?Q?pvqzkkmHv6lQnJnyvoE5LMfYfkfdysX77T950d9zcP/D6f4p/c1RLWcOfBec?=
 =?us-ascii?Q?H4U6/SHpJthP/uNZQquvAVrtnGo14k/s3pC2IKDwzxTzCg+GLydWloZqfGby?=
 =?us-ascii?Q?BK6rxgeGtJU/XrnQIQNVsPE3A83efRYNZBgEGU5jToKZn2DAtdxw/cKyYRtd?=
 =?us-ascii?Q?yW/5FYcBMtPh8uS/qOZnShkhzYk+qCctiWzBfj8AACX8YMWgOKDYe7sRLbLU?=
 =?us-ascii?Q?OlMi5N7QpmTVhpWu+Q4rohLdASyfGWz7KYpgH96OuU4Mu98ARmWn9ZuNlCwQ?=
 =?us-ascii?Q?khqTrvYTUOwJngh+jVZuHRgvLJpHBruTCRK6RYcUzpEucA800iHfujb9HDWf?=
 =?us-ascii?Q?i72Yg3xeyhRj5D19+rdk6CS/4sVg5iH3K/XQGf5LWCe4EimwyMfeK0NvFQrt?=
 =?us-ascii?Q?a4T7DHD1iOJE6QNeds7AqQS0bcdJjP9NhwHsb4wsvyDXhRE32MiBN7aSyE/Y?=
 =?us-ascii?Q?6fLfaUypf/7Y7v7eIZtWxvkfCQqtVy4l8Ee8AMjGR53xsFmnDt7H8SQ47QC+?=
 =?us-ascii?Q?QP9UMPmSeLTAyr5/uY+COZN/imlo36AmgeUqeheOi10Ch0qKbvoa+DD59lTi?=
 =?us-ascii?Q?tAPxEFsb3+lnVrQtAqxIz/Z8m7Rwe28H0f/mZG5+iM7jSTgxdT+J7oEZxdj/?=
 =?us-ascii?Q?670DKnQE0EzzWPBUF/1W6VsLu2m3s/3pWekUyL84lTs+LuPKSSryfcldJ+69?=
 =?us-ascii?Q?dei9oZWPU4zGJ+DtW47EFMycZITtPnv3Jq/mSC4M51klYxUojSiM/aRWnOb+?=
 =?us-ascii?Q?CNQd+rbj7t5j/hHttjHlchoOGov1Y3vn352eZ037wAhrVhAOgRBDN4raHR7T?=
 =?us-ascii?Q?9OcbnIBA9E/AZbXepMPHAYJOX40iHph81qnv+rk6DxnoOe6RfDM0Gyl2AXi8?=
 =?us-ascii?Q?Ns1zltwKrK1oSYdERd5TuVbYNh8EttEGCyQTLv6UdA22HaD0gIWrKYQQg0GG?=
 =?us-ascii?Q?yryygOyIHNEcqXkLayyeAjdHtZtSAukGDV0G8hvhIRegcthIbu/pjnGg0ihf?=
 =?us-ascii?Q?wbe/5LvPobuo2K6Qp6V8crNWQdp+Za8Nl8LfJ7UT/PJWVnZSjWVrsT+eAeLY?=
 =?us-ascii?Q?31s5ze5gmiJNlVQ+BC6vcfDre6oqbU/aUw2jh0OTivAjThqklmskEg9u8P2e?=
 =?us-ascii?Q?GQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 852ade53-c2ee-4364-f3e5-08dcc1eaba04
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 14:08:26.8158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BuEn4uvixtQrqFGalI+95ciR4vftgTrugKPMz5uVynf8K2qjHsyDAjSt00ua1aEyLVzd8WmtllftZRiTYXtqkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB9673
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 14:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203607

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

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-core/util-linux/util-linux_2.40.1.bb | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.40.1.bb b/meta/recip=
es-core/util-linux/util-linux_2.40.1.bb
index a1aab94055..a8e346539a 100644
--- a/meta/recipes-core/util-linux/util-linux_2.40.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
@@ -90,7 +90,10 @@ EXTRA_OECONF:append =3D " --disable-hwclock-gplv3"
 # build host versions during development
 #
 PACKAGECONFIG ?=3D "pcre2"
-PACKAGECONFIG:class-target ?=3D "${@bb.utils.contains('DISTRO_FEATURES', '=
pam', 'chfn-chsh pam lastlog2', '', d)}"
+PACKAGECONFIG:class-target ?=3D "\
+    libmount-mountfd-support \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'chfn-chsh pam lastlog2=
', '', d)} \
+"
 # inherit manpages requires this to be present, however util-linux does no=
t have
 # configuration options, and installs manpages always
 PACKAGECONFIG[manpages] =3D ""
@@ -107,6 +110,13 @@ PACKAGECONFIG[cryptsetup] =3D "--with-cryptsetup,--wit=
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



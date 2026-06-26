Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC76CD4F26
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 07:39:09 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30174.1782459548447766307
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 00:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=ZbTXW5QL;
 spf=pass (domain: ericsson.com, ip: 52.101.70.8, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVx+ohrfBcyJW+17vh7zLXW7vFZ5qRmy0pkUIH2P9JTqFHF87uc//R4FTkfgayEkbDFmuapJRFZevBAhrWnWwlX3L2+KzUfBdprDPF/hDFDl8l+hFvlfHPmWIJb0kvpYMuorJ+xu3wyTbbvcghmdOswbNWz7hoyq+YB5ECqcH81NlGADAp1BlwXaWpHZgAllmJzh7DTX2mXY0Fz1j9mhagIGZCxNVRrVrNSMFPVpXtGqTOORtsj9f1ov9I8L5vaN0oQGu9K7QDxpdSZQmsnuXRLpimqvzyrOJjVjoLC3Ds0zi2NsOFdo55RaGWL+g0nyKS6FJscosxGpeyMsvIgUSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qJ7Qh6UM8MVcKePdsuXNdhj0injO+85fG/IMhkJT2A=;
 b=YxWm/+8vTUMoI/VWMafQgzVfKJle5eAZugwbJPZQs33qBw8ViyF0lizwBUreVCCIOlxldjWgLFc1M9IW7WDgvahlP8CutHsc+uxiEDqWT/WGmdaS4L5fswXyEwrrB/qxJPUGXUciIiwNDt69kHk400WujX5r4FwBQoK6zAi7OVMqh7fU/voT4Ec3YUvOZhzdFkjZTcJrNmX85Q0XZyGeMMVg55t4j6PXhUIbNL96/nqgPdfpnKK4f+xshIEooUOVSwiYbiI9X91Q91Rp/YwyOvoxmoiZtN7mD62u6QGngGtc+cQYcqShZgB/zmcs5pCfaXWC7lwtawZSNBBQTKBdBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=est.tech smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qJ7Qh6UM8MVcKePdsuXNdhj0injO+85fG/IMhkJT2A=;
 b=ZbTXW5QL3/o5YhNglgzAKggj4BCvDGFzs0GIAqMwy/als88vbUUFELZ8bjsSkKVLraglDYKSvutWWKgicRW9Y2ATB+ex5nEFFiP0/MqjfHEgFE972TReR/x12o+CIuxFnjew/o2cSFUNxwa/cLYpZEtkJUw0Ut8XsalKysQmEF9ZV1O9K2VfUmSKy1J/wcLIFpY0mCBj0C7B4lkzOSdTGriyAq+76oqjNqPFxrR7OZHD/HS7Weoh5u7ZgXTgfBGEfxUUHc6fgvl6/iZ5AzDK8stRhsyTDcz3CHeuhMU/kOW/u8vyENXBOzrQ0FD3L1w8t6EFYoX+MBZQDMbc6N+s3Q==
Received: from AS4P191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::11)
 by AMBPR07MB11303.eurprd07.prod.outlook.com (2603:10a6:20b:6f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 07:39:00 +0000
Received: from AMS0EPF000001A0.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::ac) by AS4P191CA0016.outlook.office365.com
 (2603:10a6:20b:5d9::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Fri,
 26 Jun 2026 07:39:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF000001A0.mail.protection.outlook.com (10.167.16.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 26 Jun 2026 07:39:00 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 09:38:29 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 9F0C14020E9E;
	Fri, 26 Jun 2026 09:38:19 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 70EF1700DF4C; Fri, 26 Jun 2026 09:38:19 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <anders.heimer@est.tech>, <qi.chen@windriver.com>,
	<alex.kanavin@gmail.com>, <richard.purdie@linuxfoundation.org>,
	<joerg.sommer@navimatix.de>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v2 3/3] systemd: add native hwdb generator for hosts without STATX_MNT_ID
Date: Fri, 26 Jun 2026 09:38:09 +0200
Message-ID: <20260626073812.769193-4-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260626073812.769193-1-daniel.turull@ericsson.com>
References: <20260626073812.769193-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A0:EE_|AMBPR07MB11303:EE_
X-MS-Office365-Filtering-Correlation-Id: f8adcfa4-fb57-466d-761a-08ded355fd50
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|56012099006|3023799007|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	ulU+xIfeNXTkZeYaxoNJ3hPajQYgd73dAvm+chSXqrjg0diTCYqfkUVOEdlXnvJuNPkipyvASHfJn3Wa6c4p8cZdiZMKM+IrCuW1G63KslYkzRETUoBOQH65w4k6qGjxblldaPA/MEV/mG//DpdMSHIAUAw0fIGSA8fhm7Kfd4N0LIWmFK7aAbN0ucM3cK8lf7w4OpbI8CTuvFql2pb/BQFMCW6mY3uYUc6dWCbWZCiAzVwQn0gVZdY3iz4DVs5BcCMNv38Rj/ojbfKs/CHytyoUXJW5MY92NzupAzb6/sfoNDptnmr4USFTDMIKyNZQPi6JtoJCVPfvAym7lPkzE5Fqs5eddXQ3JH3p8xFMN7bd5dQsdLt/JMfRCWbaCpJOrUwLyZiwu9nZe+fyin8HIJVsZQJDaWMM9DkaunRxUR6SFu+qz6cGrEvlfzYuto19z5nDASUeLyifUzkXYEErox7CfWAi8f4IObICnu8Je9+bskjmqgDZI45PNfNIjE/R4zIjBj1C7FrtBbfg25Bd/MADuUfat2IH9gqrXvuBQy8KZUvaS8EdAbnNF2eKt77MQgDw9wKPEdgN/4BLmI0Bc0BoEuYpMo77QOarMflBBTGwgL9Zn0Pjtn3jAydD6xihPKHUqsjPrewKqhE1sQ+GMpopEyghNcW6Gn+5zEcqiKEXo16HDpLjk85K2hRSHNrG1F+HhLpcb80DglkdGDcBxA==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(56012099006)(3023799007)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6tiHpgS7aIsF/sJbjBiZBVsrTYJVQ/e9N2xkbJfqwCLr2Xce+kbB+bcaysW5lkQaX/+7lsyrKKtwLHFDdiGvfroZZF/POyV/uFYQEu5ZqTxghCnsiw3iCt6C0n58hAF0XMV14oloQcF9VLaEmGXVbJ+OnpBXExhGHbg60TBhQ7ch0fjj1ZgRyPSJU+tb50ZVeou/E5io2ycdEajzXhl3ejFhznVdzGnVatibZka0veMMQFkPfF42WuPHWdH5tV4nkw3ubbuPDm2Trl8Ml3BpIpxpgwKdqoL390cyxi5A2IgcSwYRjGEDPt0ioaWnpFSAkbDUDrdyKFbECh8VhY006ut33yXX8WcEElNljTP4NYTF4CXUaDs+XjHEFIM7bJ8BjImR8upKySqnbuD3+slZTKBC8HmMV5rgTSzE5kvI5jYcnW+of/8+miAESbwMsEe0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 07:39:00.8162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8adcfa4-fb57-466d-761a-08ded355fd50
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR07MB11303
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 07:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239611

From: Daniel Turull <daniel.turull@ericsson.com>

systemd 261 requires STATX_MNT_ID (kernel >=3D 5.8) for path resolution.
On older hosts (e.g. RHEL 8 with kernel 4.18), the QEMU-emulated
udevadm hwdb fails during image construction.

Add systemd-hwdb-native recipe that builds systemd-hwdb natively with:
- A patch restoring /proc/self/fdinfo mount-ID fallback for kernels
  lacking STATX_MNT_ID (applied only to native recipes)
- A patch forcing compat mode in hwdb generation to avoid embedding
  build-host paths in hwdb.bin (reproducibility)

Update the update_udev_hwdb intercept to prefer the native
systemd-hwdb over QEMU emulation, with a test -s check to catch
silent failures from either path.

Tested on RHEL 8.10 and Ubuntu 22.04.5

AI-Generated: Claude-opus-4.6
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>

---
I'm not sure who should be the maitainer of the new native recipe.
is it Qi Chen, who is the maintainer for the rest of systemd recipes,
unassigned or me? The question I'm asking is because all need to be
updated at the same time.
---
 meta/conf/distro/include/maintainers.inc      |   1 +
 .../systemd/systemd-hwdb-native_261.bb        |  32 ++++
 .../systemd/systemd-systemctl-native_261.bb   |   3 +
 ...idfd_open-and-STATX_MNT_ID-on-older-.patch | 176 ++++++++++++++++++
 ...t-mode-for-reproducible-cross-builds.patch |  36 ++++
 meta/recipes-core/systemd/systemd_261.bb      |   2 +-
 scripts/postinst-intercepts/update_udev_hwdb  |  24 ++-
 7 files changed, 269 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd-hwdb-native_261.bb
 create mode 100644 meta/recipes-core/systemd/systemd/Handle-missing-pidfd_=
open-and-STATX_MNT_ID-on-older-.patch
 create mode 100644 meta/recipes-core/systemd/systemd/hwdb-use-compat-mode-=
for-reproducible-cross-builds.patch

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index f757fafdcb..86bf4d14ee 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -831,6 +831,7 @@ RECIPE_MAINTAINER:pn-systemd-boot-native =3D "Viswanath=
 Kraleti <quic_vkraleti@qui
 RECIPE_MAINTAINER:pn-systemd-bootchart =3D "Chen Qi <Qi.Chen@windriver.com=
>"
 RECIPE_MAINTAINER:pn-systemd-bootconf =3D "Chen Qi <Qi.Chen@windriver.com>=
"
 RECIPE_MAINTAINER:pn-systemd-conf =3D "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-systemd-hwdb-native =3D "Unassigned <unassigned@yocto=
project.org>"
 RECIPE_MAINTAINER:pn-systemd-machine-units =3D "Chen Qi <Qi.Chen@windriver=
.com>"
 RECIPE_MAINTAINER:pn-systemd-serialgetty =3D "Chen Qi <Qi.Chen@windriver.c=
om>"
 RECIPE_MAINTAINER:pn-systemd-systemctl-native =3D "Chen Qi <Qi.Chen@windri=
ver.com>"
diff --git a/meta/recipes-core/systemd/systemd-hwdb-native_261.bb b/meta/re=
cipes-core/systemd/systemd-hwdb-native_261.bb
new file mode 100644
index 0000000000..0b3ff2ba03
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-hwdb-native_261.bb
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: MIT
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/systemd:"
+
+SUMMARY =3D "Hardware database management tool from systemd"
+
+require systemd.inc
+
+DEPENDS =3D "gperf-native libcap-native util-linux-native python3-jinja2-n=
ative"
+
+# TODO: Remove STATX_MNT_ID patch once minimum supported build host kernel=
 is >=3D 5.8 (RHEL 8 EOL: 2029)
+SRC_URI +=3D "file://Handle-missing-pidfd_open-and-STATX_MNT_ID-on-older-.=
patch \
+            file://hwdb-use-compat-mode-for-reproducible-cross-builds.patc=
h \
+           "
+
+inherit pkgconfig meson native
+
+MESON_TARGET =3D "systemd-hwdb:executable"
+
+# Override prefix so compiled-in UDEVLIBEXECDIR (/usr/lib/udev) matches th=
e
+# target rootfs layout. This allows --root $D --usr to find hwdb.d source
+# files and write hwdb.bin to the correct location.
+EXTRA_OEMESON +=3D "--prefix /usr"
+EXTRA_OEMESON +=3D "-Dhwdb=3Dtrue -Dlink-udev-shared=3Dfalse"
+EXTRA_OEMESON +=3D "-Dpam=3Ddisabled -Daudit=3Ddisabled -Dselinux=3Ddisabl=
ed"
+EXTRA_OEMESON +=3D "-Dacl=3Ddisabled -Dapparmor=3Ddisabled -Dseccomp=3Ddis=
abled"
+EXTRA_OEMESON +=3D "-Dlibcryptsetup=3Ddisabled -Dlibcurl=3Ddisabled -Dlibf=
ido2=3Ddisabled"
+EXTRA_OEMESON +=3D "-Dpcre2=3Ddisabled -Dp11kit=3Ddisabled -Dopenssl=3Ddis=
abled"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${B}/systemd-hwdb ${D}${bindir}/systemd-hwdb
+}
diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_261.bb b/me=
ta/recipes-core/systemd/systemd-systemctl-native_261.bb
index 686448cf1e..a6ad6901e0 100644
--- a/meta/recipes-core/systemd/systemd-systemctl-native_261.bb
+++ b/meta/recipes-core/systemd/systemd-systemctl-native_261.bb
@@ -6,6 +6,9 @@ require systemd.inc
=20
 DEPENDS =3D "gperf-native libcap-native util-linux-native python3-jinja2-n=
ative"
=20
+# TODO: Remove STATX_MNT_ID patch once minimum supported build host kernel=
 is >=3D 5.8 (RHEL 8 EOL: 2029)
+SRC_URI +=3D "file://Handle-missing-pidfd_open-and-STATX_MNT_ID-on-older-.=
patch"
+
 inherit pkgconfig meson native
=20
 MESON_TARGET =3D "systemctl:executable"
diff --git a/meta/recipes-core/systemd/systemd/Handle-missing-pidfd_open-an=
d-STATX_MNT_ID-on-older-.patch b/meta/recipes-core/systemd/systemd/Handle-m=
issing-pidfd_open-and-STATX_MNT_ID-on-older-.patch
new file mode 100644
index 0000000000..c63423cc96
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/Handle-missing-pidfd_open-and-STATX=
_MNT_ID-on-older-.patch
@@ -0,0 +1,176 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Daniel Turull <daniel.turull@ericsson.com>
+Date: Mon, 23 Jun 2026 12:00:00 +0200
+Subject: [PATCH] Handle missing pidfd_open and STATX_MNT_ID on older kerne=
ls
+
+On hosts lacking pidfd_open (kernel < 5.3) or STATX_MNT_ID (kernel < 5.8,
+e.g. RHEL 8), native tools (systemctl --root, systemd-hwdb --root) fail
+during path resolution. Fix by:
+
+- Treating ENOSYS/EOPNOTSUPP from pidfd_open as graceful fallback.
+- Adding fd_get_mount_id() to read mnt_id from /proc/self/fdinfo (availabl=
e
+  since kernel 3.15) and using it as fallback when statx returns -EUNATCH =
in
+  fds_inode_and_mount_same() and chase_statx().
+
+This restores the /proc/self/fdinfo fallback that existed in systemd 259
+(fd_fdinfo_mnt_id in mountpoint-util.c) but was removed upstream in 260+.
+
+This patch is only applied to native recipes (systemd-systemctl-native,
+systemd-hwdb-native) where /proc/self/fdinfo is guaranteed available.
+Do NOT apply to the target systemd recipe.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Assisted-by: kiro:claude-opus-4.6
+Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
+---
+ src/basic/chase.c   | 20 ++++++++++++++-
+ src/basic/fd-util.c | 63 +++++++++++++++++++++++++++++++++++++++++++--
+ src/basic/fd-util.h |  1 +
+ src/basic/pidref.c  |  4 +--
+ 4 files changed, 83 insertions(+), 5 deletions(-)
+
+--- a/src/basic/pidref.c	2026-06-25 14:01:12.007875484 +0200
++++ b/src/basic/pidref.c	2026-06-25 14:01:55.098770206 +0200
+@@ -106,8 +106,8 @@ int pidref_set_pid(PidRef *pidref, pid_t
+=20
+         fd =3D pidfd_open(pid, 0);
+         if (fd < 0) {
+-                /* Graceful fallback in case the kernel is out of fds */
+-                if (!ERRNO_IS_RESOURCE(errno))
++                /* Graceful fallback in case the kernel is out of fds or =
lacks pidfd support */
++                if (!ERRNO_IS_RESOURCE(errno) && !ERRNO_IS_NOT_SUPPORTED(=
errno))
+                         return log_debug_errno(errno, "Failed to open pid=
fd for pid " PID_FMT ": %m", pid);
+=20
+                 fd =3D -EBADF;
+--- a/src/basic/fd-util.h	2026-06-25 14:01:12.009875526 +0200
++++ b/src/basic/fd-util.h	2026-06-25 14:01:20.909060415 +0200
+@@ -188,6 +188,7 @@ static inline int dir_fd_is_root_or_cwd(
+ }
+=20
+ int fds_inode_and_mount_same(int fd1, int fd2);
++int fd_get_mount_id(int fd, uint64_t *ret);
+=20
+ int resolve_xat_fdroot(int *fd, const char **path, char **ret_buffer);
+=20
+--- a/src/basic/fd-util.c	2026-06-25 14:01:12.011875567 +0200
++++ b/src/basic/fd-util.c	2026-06-25 14:01:40.007456905 +0200
+@@ -1082,6 +1082,38 @@ int path_is_root_at(int dir_fd, const ch
+         return fds_inode_and_mount_same(dir_fd, XAT_FDROOT);
+ }
+=20
++int fd_get_mount_id(int fd, uint64_t *ret) {
++        char path[STRLEN("/proc/self/fdinfo/") + DECIMAL_STR_MAX(int)];
++        _cleanup_close_ int real_fd =3D -EBADF;
++        _cleanup_free_ char *p =3D NULL;
++        uint64_t mnt_id;
++        int r;
++
++        assert(ret);
++
++        /* /proc/self/fdinfo/ requires a real fd; resolve AT_FDCWD/XAT_FD=
ROOT via O_PATH. */
++        if (fd =3D=3D AT_FDCWD || fd =3D=3D XAT_FDROOT) {
++                real_fd =3D open(fd =3D=3D XAT_FDROOT ? "/" : ".", O_PATH=
|O_CLOEXEC);
++                if (real_fd < 0)
++                        return -errno;
++                fd =3D real_fd;
++        }
++
++        assert(fd >=3D 0);
++        xsprintf(path, "/proc/self/fdinfo/%i", fd);
++
++        r =3D get_proc_field(path, "mnt_id", &p);
++        if (r < 0)
++                return r;
++
++        r =3D safe_atou64(p, &mnt_id);
++        if (r < 0)
++                return r;
++
++        *ret =3D mnt_id;
++        return 0;
++}
++
+ int fds_inode_and_mount_same(int fd1, int fd2) {
+         struct statx sx1, sx2;
+         int r;
+@@ -1092,7 +1124,20 @@ int fds_inode_and_mount_same(int fd1, in
+         r =3D xstatx(fd1, /* path =3D */ NULL, AT_EMPTY_PATH,
+                    STATX_TYPE|STATX_INO|STATX_MNT_ID,
+                    &sx1);
+-        if (r < 0)
++        if (r =3D=3D -EUNATCH) {
++                uint64_t mnt_id;
++
++                /* Kernel lacks STATX_MNT_ID; fall back to /proc/self/fdi=
nfo. */
++                r =3D xstatx(fd1, /* path =3D */ NULL, AT_EMPTY_PATH,
++                           STATX_TYPE|STATX_INO, &sx1);
++                if (r < 0)
++                        return r;
++                r =3D fd_get_mount_id(fd1, &mnt_id);
++                if (r < 0)
++                        return r;
++                sx1.stx_mnt_id =3D mnt_id;
++                sx1.stx_mask |=3D STATX_MNT_ID;
++        } else if (r < 0)
+                 return r;
+=20
+         if (fd1 =3D=3D fd2) /* Shortcut things if fds are the same (only =
after validating the fd) */
+@@ -1101,7 +1146,19 @@ int fds_inode_and_mount_same(int fd1, in
+         r =3D xstatx(fd2, /* path =3D */ NULL, AT_EMPTY_PATH,
+                    STATX_TYPE|STATX_INO|STATX_MNT_ID,
+                    &sx2);
+-        if (r < 0)
++        if (r =3D=3D -EUNATCH) {
++                uint64_t mnt_id;
++
++                r =3D xstatx(fd2, /* path =3D */ NULL, AT_EMPTY_PATH,
++                           STATX_TYPE|STATX_INO, &sx2);
++                if (r < 0)
++                        return r;
++                r =3D fd_get_mount_id(fd2, &mnt_id);
++                if (r < 0)
++                        return r;
++                sx2.stx_mnt_id =3D mnt_id;
++                sx2.stx_mask |=3D STATX_MNT_ID;
++        } else if (r < 0)
+                 return r;
+=20
+         r =3D statx_mount_same(&sx1, &sx2);
+--- a/src/basic/chase.c	2026-06-25 14:01:12.013875609 +0200
++++ b/src/basic/chase.c	2026-06-25 14:01:47.117604514 +0200
+@@ -40,7 +40,9 @@
+         (CHASE_MUST_BE_DIRECTORY|CHASE_MUST_BE_REGULAR|CHASE_MUST_BE_SOCK=
ET)
+=20
+ static int chase_statx(int fd, struct statx *ret) {
+-        return xstatx_full(fd,
++        int r;
++
++        r =3D xstatx_full(fd,
+                         /* path=3D */ NULL,
+                         /* statx_flags=3D */ 0,
+                         XSTATX_MNT_ID_BEST,
+@@ -48,6 +50,23 @@ static int chase_statx(int fd, struct st
+                         /* optional_mask=3D */ 0,
+                         /* mandatory_attributes=3D */ 0,
+                         ret);
++        if (r =3D=3D -EUNATCH) {
++                uint64_t mnt_id;
++
++                /* Kernel lacks STATX_MNT_ID; fall back to /proc/self/fdi=
nfo. */
++                r =3D xstatx(fd, /* path=3D */ NULL, /* statx_flags=3D */=
 0,
++                           STATX_TYPE|STATX_UID|STATX_INO,
++                           ret);
++                if (r < 0)
++                        return r;
++                r =3D fd_get_mount_id(fd, &mnt_id);
++                if (r < 0)
++                        return r;
++                ret->stx_mnt_id =3D mnt_id;
++                ret->stx_mask |=3D STATX_MNT_ID;
++        }
++
++        return r;
+ }
+=20
+ static int chase_openat2(int root_fd, int dir_fd, const char *path, Chase=
Flags chase_flags) {
diff --git a/meta/recipes-core/systemd/systemd/hwdb-use-compat-mode-for-rep=
roducible-cross-builds.patch b/meta/recipes-core/systemd/systemd/hwdb-use-c=
ompat-mode-for-reproducible-cross-builds.patch
new file mode 100644
index 0000000000..bb90105cbd
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/hwdb-use-compat-mode-for-reproducib=
le-cross-builds.patch
@@ -0,0 +1,36 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Daniel Turull <daniel.turull@ericsson.com>
+Date: Wed, 25 Jun 2026 10:00:00 +0200
+Subject: [PATCH] hwdb: use compat mode to avoid embedding source paths
+
+Use compat=3Dtrue in systemd-hwdb's verb_update() so that source
+filenames, line numbers, and priorities are not embedded in hwdb.bin.
+
+Without this, when --root $D is used during cross-compilation, the
+absolute build paths (e.g. /tmp/work/.../rootfs/usr/lib/udev/hwdb.d/...)
+are written into the database, causing:
+- Non-reproducible builds (different TMPDIR =E2=86=92 different hwdb.bin)
+- Build directory path leakage into the target image
+
+The compat format matches what udevadm hwdb (the deprecated path)
+has always produced, and is the expected format for cross-built images.
+
+Upstream-Status: Inappropriate [oe specific]
+
+AI-Generated: Claude Opus 4.6
+Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
+---
+ src/hwdb/hwdb.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/src/hwdb/hwdb.c
++++ b/src/hwdb/hwdb.c
+@@ -27,7 +27,7 @@ static int verb_update(int argc, char *argv[], uintptr_t=
 _data, void *userdata)
+         if (hwdb_bypass())
+                 return 0;
+=20
+-        return hwdb_update(arg_root, arg_hwdb_bin_dir, arg_strict, false)=
;
++        return hwdb_update(arg_root, arg_hwdb_bin_dir, arg_strict, true);
+ }
+=20
+ static int help(void) {
diff --git a/meta/recipes-core/systemd/systemd_261.bb b/meta/recipes-core/s=
ystemd/systemd_261.bb
index eedce348c3..22bd4ca5fc 100644
--- a/meta/recipes-core/systemd/systemd_261.bb
+++ b/meta/recipes-core/systemd/systemd_261.bb
@@ -910,7 +910,7 @@ pkg_prerm:${PN}:libc-glibc () {
 	fi
 }
=20
-PACKAGE_WRITE_DEPS +=3D "qemuwrapper-cross"
+PACKAGE_WRITE_DEPS +=3D "qemuwrapper-cross systemd-hwdb-native"
=20
 pkg_postinst:udev-hwdb () {
 	if test -n "$D"; then
diff --git a/scripts/postinst-intercepts/update_udev_hwdb b/scripts/postins=
t-intercepts/update_udev_hwdb
index 8b3f5de791..d7a4ffc294 100644
--- a/scripts/postinst-intercepts/update_udev_hwdb
+++ b/scripts/postinst-intercepts/update_udev_hwdb
@@ -19,7 +19,23 @@ case "${PREFERRED_PROVIDER_udev}" in
 		;;
 esac
=20
-rm -f $D${UDEVLIBDIR}/udev/hwdb.bin
-PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D $D${UDEVADM} hwdb --update=
 --root $D ${UDEV_EXTRA_ARGS} ||
-	PSEUDO_UNLOAD=3D1 qemuwrapper -L $D $D${UDEVADM} hwdb --update --root $D =
${UDEV_EXTRA_ARGS}
-chown root:root $D${UDEVLIBDIR}/udev/hwdb.bin
+hwdb_bin=3D"$D${UDEVLIBDIR}/udev/hwdb.bin"
+rm -f "$hwdb_bin"
+
+# Use native systemd-hwdb to generate hwdb.bin at build time.
+# This avoids QEMU user-mode emulation and works on host kernels < 5.8
+# (e.g. RHEL 8) where systemd 261+ would fail due to missing STATX_MNT_ID.
+NATIVE_HWDB=3D"${STAGING_DIR_NATIVE}/usr/bin/systemd-hwdb"
+if test -x "$NATIVE_HWDB" && test "${PREFERRED_PROVIDER_udev}" =3D "system=
d"; then
+	PSEUDO_UNLOAD=3D1 $NATIVE_HWDB update --root $D ${UDEV_EXTRA_ARGS}
+else
+	PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D $D${UDEVADM} hwdb --updat=
e --root $D ${UDEV_EXTRA_ARGS} ||
+		PSEUDO_UNLOAD=3D1 qemuwrapper -L $D $D${UDEVADM} hwdb --update --root $D=
 ${UDEV_EXTRA_ARGS}
+fi
+
+if ! test -s "$hwdb_bin"; then
+	echo "ERROR: hwdb.bin was not created at $hwdb_bin" >&2
+	echo "The hwdb generation command exited successfully but produced no out=
put." >&2
+	exit 1
+fi
+chown root:root "$hwdb_bin"


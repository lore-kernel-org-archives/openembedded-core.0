Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA8ACDE001
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 13:42:44 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.26])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11585.1782394961589559944
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 06:42:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=HyKUEd5t;
 spf=pass (domain: ericsson.com, ip: 52.101.83.26, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nNiYu4y+Mi1EeQIlVWkpcLfEJWX9pQNaSBdzp/BAnskkAGDPvl2ZJugzNuopU3aZoaUeUmklzEyi0iXxUoWVsvTI0bDjetldrx3XnAZxAc6qMykZLBBK8YZRew5YnNkGbj4W5wyTzGGKThSitT4+bJDKUcurNVMDyeI5L/wv9RC+uPqdaKQVlE/NQpFCQL80pYxXRAKBmQp4HkwYdou4lELsBxAKoiTptoYE+c/26dmc9qqcourV3BA46wZjHACFZCyGEtHlRPVOjluBM8ajZfvYX3zFi74Ur/5+sNmoLhnaXJkSgtemkGRf8H+5JC/soABceVeH40bXzL22ehrmDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qJ7Qh6UM8MVcKePdsuXNdhj0injO+85fG/IMhkJT2A=;
 b=NACAM8cnGh7G+/CZ3mW5ePURKbgxhuSylDi5zpCW3m1rWggHZmnamVXxpPfx70czOk+SrieEA6uyASx4EMAtNSQHN35n2jSzwi6rzMidZXNKjjV1dIWkPn7QMy9C1X7md6/lLJ/tze9T5XCU6BrTNBVQEPYLztKA8bd3OFnKxUrVmtG0gZgEElnlY6hGGaTjKxEecvaevHp2OC8ogy5p4RrIb9A640dtkWBpB9skg8+eqKtBXFjBPqA4K/K3hHdAdrrGhxt+uvHE5FtGwZCwrK1Smlsx/ayzjJRYrwUzTAxU6S2IU3IX3Jtpe+kOmzW2M9pCmNMqmVHice2yghCU0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=est.tech smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qJ7Qh6UM8MVcKePdsuXNdhj0injO+85fG/IMhkJT2A=;
 b=HyKUEd5tRmol7YRiSr4PHuEcIDrpmnM/P6skfjvBev/+i6yHByF8x4BykVwem18lay9+D/Jdm62HvPR72IUHip/x1WwG/3q8XaW+yH1+knFfRw9mF2P5UtSjDGw4pVL3wN0D1s4Yb+TGUBTufqeMui76TIPRePRL8mMLSz2KluAEtWYKmno0FVZG/RoSX54EIcD/yys48Fz1rLkXqoeTIyNcRyx/wBd3cKNvW6Z5oMyOS6QUXapG2J6h6Et/BWIYtrIrEk6roG1mMxJ2JaGGV8/wesLV1CE+mvZrA+fkuU0SdgybA7Y5wq13d796Ko6Tl876yhongNb1lV9slp8Njg==
Received: from DUZPR01CA0272.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::12) by DU0PR07MB9637.eurprd07.prod.outlook.com
 (2603:10a6:10:316::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Thu, 25 Jun
 2026 13:42:34 +0000
Received: from DB1PEPF0003922E.eurprd03.prod.outlook.com
 (2603:10a6:10:4b9:cafe::11) by DUZPR01CA0272.outlook.office365.com
 (2603:10a6:10:4b9::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 13:42:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF0003922E.mail.protection.outlook.com (10.167.8.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 13:42:34 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 15:42:29 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 0A4FD4020B43;
	Thu, 25 Jun 2026 15:42:27 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id C6280700DF4B; Thu, 25 Jun 2026 15:42:27 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <anders.heimer@est.tech>, <qi.chen@windriver.com>,
	<alex.kanavin@gmail.com>, <richard.purdie@linuxfoundation.org>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH 3/3] systemd: add native hwdb generator for hosts without STATX_MNT_ID
Date: Thu, 25 Jun 2026 15:41:32 +0200
Message-ID: <20260625134210.4046622-4-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625134210.4046622-1-daniel.turull@ericsson.com>
References: <20260625134210.4046622-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922E:EE_|DU0PR07MB9637:EE_
X-MS-Office365-Filtering-Correlation-Id: b5aa598e-6dc3-478d-5447-08ded2bf9cfb
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|56012099006|11063799006|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	eJgn3uikhHIkEZROdyfPjvO+7ygo7mCRBfiSsUQ8HFRugURJHW0UtDz7qa5uQ3IlQ9xIp6c3XOsOnw7fEA0G+pfOVGG7i5xMb32P7Zj6rCpBND7C5I9EC0DkFV2cmsBOAL3Hs+ZR2dF6uBEi+N13XxPAMiYIIKczaNjrqU8orTE5zSAcK87OoQc1i9F+JtYBniuT635E8rIZJEt3FK6fio7gE2dMbou9fZKBUuLMWQG1tYyIl+B5ZTHZV0/2J4ZLmB6hVqXXJK8Bd6dDI/x0zP8/NFqjjaofOptOsrXj7SsxvgqaI5hDyGk5LWiCr4B177Qa5wgTrOcLFS6nuwwHH9npzyPVwTd0O1GvxPF0F8vfVPYy/IVMYbXlKHJK2PduZKI07OHkjueFdhNat5pJEWmSrM2xTJAfz3IZEkKzHR0zsqZZqFQkgN/JQ2VSSq9sO2o6jw8WxM4l2nivXYYSWOaaqGtxTs7LqHcn1dtuxngwG09lEoFTUnQMZsgjUCiY3necGTY3pMeVnJDvgGwQMvuXppsTaqv8N4xMCGATLVxUYF0vBGRheUvV23f2YEbjmRriDvL8tufHxh5zkDmyhEjZOGFMNPlE4WwPTwC0yzAUq8EwCrbeFqF7gDuOaDt7ODPNgMUFg7jBXxdASQltdnfqF/KEouKfn7A1kWNuptIo4Rb4NX5g+eiYtaP6rb35jFa7aDrIGwcBjnrWw5r5YQ==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	cuXwC0/nAZF8i68SBx1UmDTms2YpoxNwYsxz3x99sGGsIeCSaOyrhk0nyQiUuD8PFPN1fJPu4YLnJqdr8+JDkeuXn0vKvwwkDwbUJxTeK+Zvt3kzXy0b0a95v9q0eQwYThCJ4lzGwrDNi/9XOt6Q5JzsYyFGVAMTJXATZ5O7DB/WgnMOuW7cJlami+MIJuHwFjkDk+UVssxDQ6q63OsWbcmLVBxVELH9y0j3KyHCRYtIsDS6JBude45n10augRw6Xq/mSzGfNTUSJHMIIL44ya7qu4Js0zTHuef2EFnpJ+AqtYmEF6K/hdi2hReQfUZpkQfzv7FMdcjuVZ/MOuZkoRuuvHzJIkZw0879w/KH3V1bxyWZ3sxvvvTnKPdsGPsFDkJoJgHW+Fd28n9ayXFwFIvRs/e6hQAsnqeStuDL8FGP52RZZEnuJvZxWS8jdnx4
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 13:42:34.6641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5aa598e-6dc3-478d-5447-08ded2bf9cfb
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR07MB9637
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 13:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239570

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


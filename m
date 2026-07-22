Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8589DC44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 13:17:15 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47639.1784726225990860139
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 06:17:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=AIG0gb8O;
 spf=pass (domain: ericsson.com, ip: 52.101.84.36, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hcItoIcbRNTjsIXr5KlTAmch2yCCaY0pUAQmtnmKIDYmQwpBDzKOxgrhwEkfqwgt3tk83LsTbQ3f9hyT0v47VbFB2N9hNVaRCSxxl3VdPp6GmJrGDTc1ZoZhpx8uhVWzeWIQcUX8n6w4tjQFFPKJff1yHlzAErYUk5K7v/9gft6i1M4872p1MifbiSdPBPaFXwEFnVNfNNL2Q2++nouDlwduvvsRuL/VswjsZV0F1tm1xQGwzNeVm6+ahbTGpgBV6++ZTcmGOx0ifKYeKH70FBihd4LR7sIhwmpJeaKOuv7bxdsMYC7IIYR6VsGPWIu0ryBTu/HKdCiFGBV7XOueuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTfj9x5xOobgXciCEVYGJbhxv0NSfOO7sVOT0DjX+LI=;
 b=kEr+zw8l33wsuF0e6b6TpHzTFOewNQla8NAYfUi+a4RnmeoLbITH1WPe/WuwidOSj0hS6D/5eMqj7Z+p1lcUN0HVy3ahvBSrOnEzpWiQL0DBkKfTVtAcyvQHrFAWAoxZog3GHs9i2cCd+mpiZXbQ3waE33aYd8++pTPO3cKPRvXQ0+FXWs59ee51UEIcN9BnJuZBJrlbUBdG2mjwmIOWbrbgHePStAdpObh+W2psanwioUtMgZs1yVowKeN6tj+v9o9Qt2BkMWkwEeO5jhsC4aOV+XiTbUozmW5BavBtMNw/1W4jOjSD/CaDlS4IAWmWsl0m3oyAihNMDzY148su5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=arm.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTfj9x5xOobgXciCEVYGJbhxv0NSfOO7sVOT0DjX+LI=;
 b=AIG0gb8OsoEo5ytDesV66ULPixAfdGM6V4ZVx7We94Rqv5dmuS//1mnfxP8rA8TIP6xZIUJVrQn8khMdLoCcqwXIkdymdCS34vpVtrln3nRfDh+q3mVVxRiNeHroIm9Jbm6SSqSfrzwFQ7DvxwSAC6RScP2PYr1PzSdDX/Cyg3IgywGQIGKGHwTxXB8uoroBdHqoo+Jhxpp+b16bfapxvfuO3AeZL1s5DJtTsUhj3oChntKmZszYhDe5H6kJZo1MXtQcXzq04mXHSkQyZQDtPRyb8hBFqDUStWzm3uKqzDYV1fv13rdlpnq5FonkNdwNf1nB1dvppohSxY5vB609aA==
Received: from AS4P191CA0001.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::14)
 by GV4PR07MB10314.eurprd07.prod.outlook.com (2603:10a6:150:29d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.5; Wed, 22 Jul
 2026 13:17:00 +0000
Received: from AM3PEPF0000A78D.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::69) by AS4P191CA0001.outlook.office365.com
 (2603:10a6:20b:5d5::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 13:17:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM3PEPF0000A78D.mail.protection.outlook.com (10.167.16.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 13:16:59 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Jul 2026 15:16:59 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 1759B4020B40;
	Wed, 22 Jul 2026 15:16:58 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id E6A77700DBB0; Wed, 22 Jul 2026 15:16:57 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <daniel.turull@ericsson.com>, <openembedded-core@lists.openembedded.org>,
	<ross.burton@arm.com>, <mathieu.dubois-briand@bootlin.com>
CC: <anders.heimer@est.tech>, <qi.chen@windriver.com>,
	<alex.kanavin@gmail.com>, <richard.purdie@linuxfoundation.org>,
	<joerg.sommer@navimatix.de>
Subject: [PATCH v5 2/2] systemd-tools-native: fix systemctl/hwdb --root on RHEL 8 hosts
Date: Wed, 22 Jul 2026 15:16:40 +0200
Message-ID: <20260722131640.4155716-3-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722131640.4155716-1-daniel.turull@ericsson.com>
References: <20260722131640.4155716-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78D:EE_|GV4PR07MB10314:EE_
X-MS-Office365-Filtering-Correlation-Id: ea416a11-6c74-4f8c-05b8-08dee7f3834c
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|10067099003|56012099006|5023799004|11063799006|3023799007|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	c3NBLLaD08odbIrrmx/wDNvGo2ReqYHel0eBToQN/rrRQSXnqi/UjJ5t7BOncGXf1ZFUbaLIc2/CjuekeV8jB///Lpgo2XuSuXLbRWRFKszfGluCtpSwcyzCnf+2veWI/jt1Y9yoxGo54jNOyIc/19IkLKQzzNSPxb4xVpXdFo0Zz/Yukya1eIk2L3QlJQVoKA73p42Ts9IIG1jTrtgM17+erLxEujLS+Ba5Ejv/uDBV9l0VHQF1XGgNtmLMrqakjExQsl4sN2S2yLzAGp4gS2toI4QII1YPE8ugbe9oGfLAELRhOKJppHXqsWKq1XqjC4mJzaFMB+kGm3+p2Ga+yLN5xI1VYXBGl4BMo135QDNiEQawWulOlbMwGezdxHXoUYs5t2Gy9oq71ZeYJU6fS52nPQKU6s4EKoK/TsMYd/oPXhltnDKcC3ySS7nmkucHvVC8nWbE7go+2qhdD+4/Dib6EP45a84auEn+4loSsiU0l9BINKFqQ0k6YcCIHyQsvdQA2t+zn8LpLx9YI3WZmlpTZ7+Ub0jKoGDur0oyaIFTdTIpbzcSaWFvC/k+BhGzaHEcDVmxtg8a4ajkl+GHDh/H1nGoMw+7BCZKT6OI8Wj5D/aCEfzWmjtmUxtELseve9xnbZ+RGJE6Fk+dL+gcStSYwW/pkV5UJ8gijvkJCfMa6BSF1XyfGUFpKW9rJ+MHyhHvDa9zja4IxCq4asdZyw==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(10067099003)(56012099006)(5023799004)(11063799006)(3023799007)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	AhQcsmvdH2peSzabhOGSm6St2hSlNPnR1LhnlGyxCI5GzFtuvoYDrfOnWaOrzT9+BZS/uarbihVdU0J72AKXMVQTLpQIWMCyZBzo7ZQp4ZkypNksiN1BoKsvTjka/fwCkh1ZuIgnBgDKITS3nooRmiRp6Ay8kNrGgn1qd0z4BHM1VFLsuQy+0cl45FzdPm631x6BwnHt4IP28lJPU4G5XTm32Nc6PTDog1qBfI7dgZwAJVw7RmRgJGatIvkh2Ih16aRD9KUnP+mmNIk33MKzzS0hOFts6SG5XS8n10v6w24DnsFAMBEDW1VN2owoTDoYb/nSq04S1I8sFuhXQqRyaifgEe9FtICMTRyioXfnR+xwid06nfxBGcVaQ8ePxowigWIgcRIVRLrxXbetaVOt4LN75NIETLU0V8upq9aN1FKgV5sSfYghOCuXUssdCONS
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 13:16:59.8407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea416a11-6c74-4f8c-05b8-08dee7f3834c
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR07MB10314
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 13:17:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241691

From: Daniel Turull <daniel.turull@ericsson.com>

The native systemctl and systemd-hwdb tools run offline against the
target rootfs (--root $D) during do_rootfs. On build hosts with a
kernel older than 5.8 (e.g. RHEL 8, kernel 4.18) statx() does not
support STATX_MNT_ID, so path resolution fails with -EUNATCH. This
breaks the offline "systemctl --root" enable/preset invoked by the
postinst of any package shipping a systemd service, e.g.:

  Failed to preset all units: Protocol driver not attached.

which in turn fails do_rootfs:

  ERROR: Postinstall scriptlets of ['busybox-syslog',
  'systemd-networkd'] have failed. [...] Deferring to first boot via
  'exit 1' is no longer supported.

- Add Handle-missing-STATX_MNT_ID-on-older-kernels.patch, which reads
  mnt_id from /proc/self/fdinfo (available since kernel 3.15) as a
  fallback when statx() lacks STATX_MNT_ID, restoring the behaviour
  removed upstream after systemd 259
- Apply it only to systemd-tools-native, where /proc/self/fdinfo is
  guaranteed available; the target systemd recipe is untouched

Tested on rhel8.10, qemux86-64 with systemd testsuite.

RESULTS:
RESULTS - ping.PingTest.test_ping: PASSED (0.00s)
RESULTS - ssh.SSHTest.test_ssh: PASSED (0.48s)
RESULTS - systemd.SystemdBasicTests.test_systemd_basic: PASSED (0.48s)
RESULTS - systemd.SystemdBasicTests.test_systemd_failed: PASSED (0.95s)
RESULTS - systemd.SystemdBasicTests.test_systemd_list: PASSED (0.66s)
RESULTS - systemd.SystemdJournalTests.test_systemd_boot_time: PASSED (0.68s=
)
RESULTS - systemd.SystemdJournalTests.test_systemd_journal: PASSED (0.68s)
RESULTS - systemd.SystemdServiceTests.test_systemd_coredump_minidebuginfo: =
SKIPPED (0.00s)
RESULTS - systemd.SystemdServiceTests.test_systemd_disable_enable: SKIPPED =
(0.00s)
RESULTS - systemd.SystemdServiceTests.test_systemd_disable_enable_ro: SKIPP=
ED (0.00s)
RESULTS - systemd.SystemdServiceTests.test_systemd_status: SKIPPED (0.00s)
RESULTS - systemd.SystemdServiceTests.test_systemd_stop_start: SKIPPED (0.0=
0s)
SUMMARY:
core-image-minimal () - Ran 12 tests in 3.923s
core-image-minimal - OK - All required tests passed (successes=3D7, skipped=
=3D5, failures=3D0, errors=3D0)

Assisted-by: kiro:claude-opus-4.8
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 .../systemd/systemd-tools-native_261.1.bb     |   3 +
 ...issing-STATX_MNT_ID-on-older-kernels.patch | 160 ++++++++++++++++++
 2 files changed, 163 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/Handle-missing-STATX_=
MNT_ID-on-older-kernels.patch

diff --git a/meta/recipes-core/systemd/systemd-tools-native_261.1.bb b/meta=
/recipes-core/systemd/systemd-tools-native_261.1.bb
index 744e874a1a..4b088afc9f 100644
--- a/meta/recipes-core/systemd/systemd-tools-native_261.1.bb
+++ b/meta/recipes-core/systemd/systemd-tools-native_261.1.bb
@@ -6,6 +6,9 @@ SUMMARY =3D "native tools from systemd"
=20
 SRC_URI +=3D "file://0001-hwdb-strip-the-root-from-filenames-when-generati=
ng-h.patch"
=20
+# TODO: Remove STATX_MNT_ID patch once minimum supported build host kernel=
 is >=3D 5.8 (RHEL 8 EOL: 2029)
+SRC_URI +=3D "file://Handle-missing-STATX_MNT_ID-on-older-kernels.patch"
+
 # We don't actually need jinja to generate code, but it's checked for at c=
onfigure time
 DEPENDS =3D "gperf-native python3-jinja2-native"
=20
diff --git a/meta/recipes-core/systemd/systemd/Handle-missing-STATX_MNT_ID-=
on-older-kernels.patch b/meta/recipes-core/systemd/systemd/Handle-missing-S=
TATX_MNT_ID-on-older-kernels.patch
new file mode 100644
index 0000000000..9d74872034
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/Handle-missing-STATX_MNT_ID-on-olde=
r-kernels.patch
@@ -0,0 +1,160 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Daniel Turull <daniel.turull@ericsson.com>
+Date: Mon, 23 Jun 2026 12:00:00 +0200
+Subject: [PATCH] Handle missing STATX_MNT_ID on older kernels
+
+On hosts lacking STATX_MNT_ID (kernel < 5.8, e.g. RHEL 8), native tools
+(systemctl --root, systemd-hwdb --root) fail during path resolution with
+-EUNATCH. Fix by adding fd_get_mount_id() to read mnt_id from
+/proc/self/fdinfo (available since kernel 3.15) and using it as a fallback
+when statx() does not return STATX_MNT_ID in fds_inode_and_mount_same() an=
d
+chase_statx().
+
+This restores the /proc/self/fdinfo fallback that existed in systemd 259
+(fd_fdinfo_mnt_id in mountpoint-util.c) but was removed upstream in 260+.
+
+This patch is only applied to the native tools recipe
+(systemd-tools-native) where /proc/self/fdinfo is guaranteed available.
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
+ 3 files changed, 82 insertions(+), 2 deletions(-)
+
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


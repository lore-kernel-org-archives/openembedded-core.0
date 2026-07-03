Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C14A9C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 07:30:47 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88142.1783063844629708801
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 00:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=ZiEuxwCw;
 spf=pass (domain: ericsson.com, ip: 52.101.72.53, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dIq0YpQcHyb3xvopvlDdgGL4hNYN6KQluWBN9GUprWD/ODLXC5MZdiop8zBc1MoaFzEjKLSZadCcpP9zRjo0fhbum5QhRmg1V+SMJ2vQE9hkumPgpZPgFuSFFM/qGa2Vgxokzs+4obPEJrlo+IERNBeMKq3yuwILuqRj1UdtqEGm6eQesSh0ilDesGGdvNsT/9ZBJQ5qxbRcOBWm/c9b5Pl4/hSNl2FpV/bqMgh9yWQP1tu05K69q589ckoUO7D97XAaW150NFKnHJnLaZiV0uRutso62rGJocf9PB0+7Qdbq6Eov+gLpTUcSJhj96xwc3jIjIr5ZJmC5GJo28NRjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lb9z5DqKKXW8mkL9/MxfHyfVPFH5+Yy3gvqDNne75Y8=;
 b=D74zKyHT2Ws4HEXclct83NFOV1ZRoc7nKkO2DzGTVTge0je1gK8b6E+nq6FcjwaXEwdCFEPhBo+sah1kTXWbYm+hTh3jgPrIFMqp4WbyQdmgV7V2HAPYc2PjC8snk5dyJpuLWwsxaXMw5HQGQSoaS0buvHwtcMsQ3vFDHmqR6MpK5zIYgnBpKdnKi+koM6XFQu0WmKHkmGvDY5O86SbNm83hK1YAiIJPx+s7ilzqmd/wjLS551kAZXNxpnAdekMH4FUYbnoJ+/vev6odYpNTmxpuCd0MoLflho7dYMaim2LnSArWLPW8fH8r5/rMDxBERhg7mnC7btFFLcCnU7a6kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=arm.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lb9z5DqKKXW8mkL9/MxfHyfVPFH5+Yy3gvqDNne75Y8=;
 b=ZiEuxwCw91Z4YgBhcGiYeLrbnj7Zw0TO0yv2J5d7dEYlPFYPH6EhxUC9VNtaBmlpFFaKkuQnQvrtR+CEZYPyBXn4s92hHUD5tmHwxmO3ZuFokP/HaY1dKGq9sYD0otyomLEzA3dRufxIO3dOGp7WC8CbjihPFJuJ5ign9aDWFByA7FnNBREpRFYrGsyiqW9/OWK4YD6XeXGP4G371T9KPCUxgSgNwggh7hwaYmPoBLKi1GJvQqvHK5dNAR6pMsVkslhfhXQwJTp5yV+vPbJK7Lrx+yuDDmpgwZnk3E2a0PH5woER35XvPmQhX/fYcqyKXCfnVjJIuv1iHLKRnzYu5A==
Received: from DUZPR01CA0291.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::9) by DB9PR07MB8524.eurprd07.prod.outlook.com
 (2603:10a6:10:368::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 07:30:37 +0000
Received: from DB1PEPF000509F7.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::1f) by DUZPR01CA0291.outlook.office365.com
 (2603:10a6:10:4b7::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.11 via Frontend Transport; Fri, 3
 Jul 2026 07:30:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF000509F7.mail.protection.outlook.com (10.167.242.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 3 Jul 2026 07:30:37 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.65) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 3 Jul 2026 09:30:36 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id D14206BEF5;
	Fri,  3 Jul 2026 09:30:11 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 39E86700DBB0; Fri,  3 Jul 2026 09:30:09 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <daniel.turull@ericsson.com>, <openembedded-core@lists.openembedded.org>,
	<ross.burton@arm.com>, <mathieu.dubois-briand@bootlin.com>
CC: <anders.heimer@est.tech>, <qi.chen@windriver.com>,
	<alex.kanavin@gmail.com>, <richard.purdie@linuxfoundation.org>,
	<joerg.sommer@navimatix.de>
Subject: [PATCH v4 2/2] systemd: add native hwdb generator via merged systemd-tools-native
Date: Fri, 3 Jul 2026 09:29:32 +0200
Message-ID: <20260703072948.2939128-3-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703072948.2939128-1-daniel.turull@ericsson.com>
References: <20260703072948.2939128-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F7:EE_|DB9PR07MB8524:EE_
X-MS-Office365-Filtering-Correlation-Id: c08926d0-4a8b-45ca-6efb-08ded8d4fa0e
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|376014|82310400026|18002099003|22082099003|56012099006|11063799006|6133799003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	4ufoilx7ahOfX5vbrJgsLI6nV74Xb6si727kby2gK5wXSp+JS79t4sDRXF98pwQ9OgKAcWnnzqjE+mA3GjbaQUSA1ipFYCSUDq0WOvSNb63/V2Fy9bQ9gyWH9hrusxlCCsyNh43v8nbLlA3cX3N9bVV/ir+c+snDsOEqG7fnoEtWsp/jIXPOKVU93wmQ8Yd5l+kIUH9BqmrhLOLbGHGxq19nHP9vyfyhebIhcnEzoNzml4ki/+81b23CPoJ1DoMpXG/xv0FzABpmrOI3m5e5T7jXsO7xKWe8/e/INsRaWP5VC63BsK4MJKkRzfLry474sUo5mSYToidqlQQifBSNhazp7OXygX3JRhSq7BnSwGKpnkpH9MYfLdupJhmC/K6buiIJWeulFm/rNkwplPTPu7VjRS0SlB2fgajT9mujkaw3vBJGldI3jig1KmRi2meobxtOVAaDGqmJ2oBLadC8xyToQaffc7m2NvVVegiIZBi/MlXoR8hPNNIAW8syOD/jN25B+xaOqtplbbY6DtJXZaivLCvE0CPZlATWKZpdxG0aHFQQNtiNRzaRd46OtSPdFJezPB+lZ+QSgS0NIWp85IIARj1p/gi7MywECkLCk/kwLYcN6KJw36DxUIvTJPFJIll0aE8VDOfdzCFw6RKD2fVLnZd4xBB9xj05LmL7X4xP98ro4h/KR12Z/H5fVEwSz/YizyeL6QAY7m+v1hdGPQ==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(18002099003)(22082099003)(56012099006)(11063799006)(6133799003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2MfaAyzKMsT+JUQ30px8DdhfE9A6ovDLc9I2db1BWBB8AqnWdsfTPDO2qLqfJuFvOyORtfsdJW/jms8TEq983XD3q8ehOjHkmxLozUD6+1xl07+Wj2hxLXGY31IFIDgmYksgpDzbcffL10mfRaEY2GoPb1dcK8ugVDZYR2dkoBvcZau9rc8Hw8hfbjTw83RmIeDeL3NBbkpdmubVwgfotct2IMEXM3wyBLa/dD20zMQF5JCjXyw+AYAqCf1mJgYrk3CxL37yLAInCFXvo0XmeQM9Ys8PYba/CQ1gO4oFgQQ7fTg5IKBNloTK0NqwBPJnaZ3SBNN2CGfaSGxAUaPZz1WF4wg2jkBFyQCECVsydOlFoJpYY13sDtbovKIvYmTqjlVLkVVLgFNYn/8szdsTE9fNp8gWJ4YOHkV8H9s999RfYUNjs6RhWf+zWWWvU1LP
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 07:30:37.2282
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c08926d0-4a8b-45ca-6efb-08ded8d4fa0e
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB8524
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 07:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240080

From: Daniel Turull <daniel.turull@ericsson.com>

systemd 261 requires STATX_MNT_ID (kernel >=3D 5.8) for path resolution.
On older hosts (e.g. RHEL 8 with kernel 4.18), the QEMU-emulated
udevadm hwdb fails during image construction.

Build systemd-hwdb natively so image construction no longer depends on
QEMU-emulated udevadm on such hosts, with:
- A patch restoring /proc/self/fdinfo mount-ID fallback for kernels
  lacking STATX_MNT_ID (applied only to the native tools recipe)
- A patch forcing compat mode in hwdb generation to avoid embedding
  build-host paths in hwdb.bin (reproducibility)

Update the update_udev_hwdb intercept to prefer the native
systemd-hwdb over QEMU emulation, with a test -s check to catch
silent failures from either path.

Rather than add a second native recipe, merge systemctl and
systemd-hwdb into a single systemd-tools-native recipe that builds both
tools from one meson configure. Both are satisfied by target-absolute
paths (--prefix /usr for hwdb's UDEVLIBEXECDIR, --sysconfdir /etc for
systemctl); systemctl --root enable/disable and hwdb generation were
verified to behave identically to the previous separate builds. All
in-tree consumers (systemd.bbclass, systemd_261.bb, keymaps,
initscripts, modutils-initscripts) are updated to the new name.

Tested on RHEL 8.10 and Ubuntu 22.04.5

AI-Generated: Claude-opus-4.6
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>

---
systemd-tools-native is assigned to Chen Qi in maintainers.inc, matching
the rest of the systemd recipes; adjust if a different owner is preferred.
---
 meta/classes-recipe/systemd.bbclass           |   4 +-
 meta/conf/distro/include/maintainers.inc      |   2 +-
 meta/recipes-bsp/keymaps/keymaps_1.0.bb       |   2 +-
 .../initscripts/initscripts_1.0.bb            |   2 +-
 .../systemd/systemd-systemctl-native_261.bb   |  25 ---
 .../systemd/systemd-tools-native_261.bb       |  42 +++++
 ...idfd_open-and-STATX_MNT_ID-on-older-.patch | 176 ++++++++++++++++++
 ...t-mode-for-reproducible-cross-builds.patch |  36 ++++
 meta/recipes-core/systemd/systemd_261.bb      |   2 +-
 .../modutils-initscripts.bb                   |   2 +-
 scripts/postinst-intercepts/update_udev_hwdb  |  24 ++-
 11 files changed, 281 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd-systemctl-native_261.=
bb
 create mode 100644 meta/recipes-core/systemd/systemd-tools-native_261.bb
 create mode 100644 meta/recipes-core/systemd/systemd/Handle-missing-pidfd_=
open-and-STATX_MNT_ID-on-older-.patch
 create mode 100644 meta/recipes-core/systemd/systemd/hwdb-use-compat-mode-=
for-reproducible-cross-builds.patch

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/syst=
emd.bbclass
index 26eaaf1922..8c6b6cae36 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -21,8 +21,8 @@ python __anonymous() {
     # Inhibit update-rcd from doing any work so that systemd images don't =
have
     # redundant init files.
     if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
-        d.appendVar("DEPENDS", " systemd-systemctl-native")
-        d.appendVar("PACKAGE_WRITE_DEPS", " systemd-systemctl-native")
+        d.appendVar("DEPENDS", " systemd-tools-native")
+        d.appendVar("PACKAGE_WRITE_DEPS", " systemd-tools-native")
         d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
 }
=20
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index 4c6307086c..53a274c0a2 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -833,7 +833,7 @@ RECIPE_MAINTAINER:pn-systemd-bootconf =3D "Chen Qi <Qi.=
Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-conf =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-machine-units =3D "Chen Qi <Qi.Chen@windriver=
.com>"
 RECIPE_MAINTAINER:pn-systemd-serialgetty =3D "Chen Qi <Qi.Chen@windriver.c=
om>"
-RECIPE_MAINTAINER:pn-systemd-systemctl-native =3D "Chen Qi <Qi.Chen@windri=
ver.com>"
+RECIPE_MAINTAINER:pn-systemd-tools-native =3D "Chen Qi <Qi.Chen@windriver.=
com>"
 RECIPE_MAINTAINER:pn-systemtap =3D "Victor Kamensky <victor.kamensky7@gmai=
l.com>"
 RECIPE_MAINTAINER:pn-systemtap-native =3D "Victor Kamensky <victor.kamensk=
y7@gmail.com>"
 RECIPE_MAINTAINER:pn-sysvinit =3D "Ross Burton <ross.burton@arm.com>"
diff --git a/meta/recipes-bsp/keymaps/keymaps_1.0.bb b/meta/recipes-bsp/key=
maps/keymaps_1.0.bb
index b7e6ef6cb1..171f7f7c0b 100644
--- a/meta/recipes-bsp/keymaps/keymaps_1.0.bb
+++ b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
@@ -36,7 +36,7 @@ do_install () {
     fi
 }
=20
-PACKAGE_WRITE_DEPS:append =3D " ${@bb.utils.contains('DISTRO_FEATURES','sy=
stemd sysvinit','systemd-systemctl-native','',d)}"
+PACKAGE_WRITE_DEPS:append =3D " ${@bb.utils.contains('DISTRO_FEATURES','sy=
stemd sysvinit','systemd-tools-native','',d)}"
 pkg_postinst:${PN} () {
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd sysvinit','true','fals=
e',d)}; then
 		if [ -n "$D" ]; then
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipe=
s-core/initscripts/initscripts_1.0.bb
index 23411b6a71..48c1b6244f 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -41,7 +41,7 @@ S =3D "${UNPACKDIR}"
 KERNEL_VERSION =3D ""
=20
 DEPENDS:append =3D " update-rc.d-native"
-PACKAGE_WRITE_DEPS:append =3D " ${@bb.utils.contains('DISTRO_FEATURES','sy=
stemd','systemd-systemctl-native','',d)}"
+PACKAGE_WRITE_DEPS:append =3D " ${@bb.utils.contains('DISTRO_FEATURES','sy=
stemd','systemd-tools-native','',d)}"
=20
 PACKAGES =3D+ "${PN}-functions ${PN}-sushell"
 RDEPENDS:${PN} =3D "initd-functions \
diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_261.bb b/me=
ta/recipes-core/systemd/systemd-systemctl-native_261.bb
deleted file mode 100644
index 28fddc79df..0000000000
--- a/meta/recipes-core/systemd/systemd-systemctl-native_261.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/systemd:"
-
-SUMMARY =3D "Systemctl executable from systemd"
-
-require systemd.inc
-
-DEPENDS =3D "gperf-native libcap-native util-linux-native python3-jinja2-n=
ative"
-
-inherit pkgconfig meson native
-
-MESON_TARGET =3D "systemctl"
-MESON_INSTALL_TAGS =3D "systemctl"
-# Explicitly disable features that meson auto-detects from the native sysr=
oot.
-# Only systemctl is built here; these prevent spurious dependencies and en=
sure
-# reproducible builds regardless of what is installed on the build host.
-EXTRA_OEMESON +=3D "-Dlink-systemctl-shared=3Dfalse"
-EXTRA_OEMESON +=3D "-Dpam=3Ddisabled -Daudit=3Ddisabled -Dselinux=3Ddisabl=
ed"
-EXTRA_OEMESON +=3D "-Dacl=3Ddisabled -Dapparmor=3Ddisabled -Dseccomp=3Ddis=
abled"
-EXTRA_OEMESON +=3D "-Dlibcryptsetup=3Ddisabled -Dlibcurl=3Ddisabled -Dlibf=
ido2=3Ddisabled"
-EXTRA_OEMESON +=3D "-Dpcre2=3Ddisabled -Dp11kit=3Ddisabled -Dopenssl=3Ddis=
abled"
-
-# Systemctl is supposed to operate on target, but the target sysroot is no=
t
-# determined at run-time, but rather set during configure
-# More details are here https://github.com/systemd/systemd/issues/35897#is=
suecomment-2665405887
-EXTRA_OEMESON +=3D "--sysconfdir ${sysconfdir_native}"
diff --git a/meta/recipes-core/systemd/systemd-tools-native_261.bb b/meta/r=
ecipes-core/systemd/systemd-tools-native_261.bb
new file mode 100644
index 0000000000..82700442eb
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-tools-native_261.bb
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: MIT
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/systemd:"
+
+SUMMARY =3D "systemd native tools (systemctl and systemd-hwdb)"
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
+# Build both tools from a single configured tree.
+MESON_TARGET =3D "systemctl systemd-hwdb"
+
+# Target-absolute paths that satisfy both tools from one meson configure:
+#  - systemd-hwdb needs prefix=3D/usr so the compiled-in UDEVLIBEXECDIR
+#    (/usr/lib/udev) matches the target rootfs layout, letting
+#    "update --root $D --usr" find hwdb.d sources and write hwdb.bin there=
.
+#  - systemctl needs sysconfdir=3D/etc; it operates on the target rootfs b=
ut the
+#    sysroot is fixed at configure time rather than run time.
+#    See https://github.com/systemd/systemd/issues/35897#issuecomment-2665=
405887
+EXTRA_OEMESON +=3D "--prefix /usr --sysconfdir /etc"
+EXTRA_OEMESON +=3D "-Dhwdb=3Dtrue -Dlink-udev-shared=3Dfalse -Dlink-system=
ctl-shared=3Dfalse"
+
+# Explicitly disable features that meson auto-detects from the native sysr=
oot.
+# These prevent spurious dependencies and ensure reproducible builds regar=
dless
+# of what is installed on the build host.
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
+    install -m 0755 ${B}/systemctl ${D}${bindir}/systemctl
+    install -m 0755 ${B}/systemd-hwdb ${D}${bindir}/systemd-hwdb
+}
diff --git a/meta/recipes-core/systemd/systemd/Handle-missing-pidfd_open-an=
d-STATX_MNT_ID-on-older-.patch b/meta/recipes-core/systemd/systemd/Handle-m=
issing-pidfd_open-and-STATX_MNT_ID-on-older-.patch
new file mode 100644
index 0000000000..65866fa01a
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
index eedce348c3..05440e92bb 100644
--- a/meta/recipes-core/systemd/systemd_261.bb
+++ b/meta/recipes-core/systemd/systemd_261.bb
@@ -910,7 +910,7 @@ pkg_prerm:${PN}:libc-glibc () {
 	fi
 }
=20
-PACKAGE_WRITE_DEPS +=3D "qemuwrapper-cross"
+PACKAGE_WRITE_DEPS +=3D "qemuwrapper-cross systemd-tools-native"
=20
 pkg_postinst:udev-hwdb () {
 	if test -n "$D"; then
diff --git a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.=
bb b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
index fb7b09393a..a1b70b9219 100644
--- a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
+++ b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
@@ -19,7 +19,7 @@ do_install () {
 	install -m 0755 ${S}/modutils.sh ${D}${sysconfdir}/init.d/
 }
=20
-PACKAGE_WRITE_DEPS:append =3D " ${@bb.utils.contains('DISTRO_FEATURES','sy=
stemd','systemd-systemctl-native','',d)}"
+PACKAGE_WRITE_DEPS:append =3D " ${@bb.utils.contains('DISTRO_FEATURES','sy=
stemd','systemd-tools-native','',d)}"
 pkg_postinst:${PN} () {
 	if type systemctl >/dev/null 2>/dev/null; then
 		if [ -n "$D" ]; then
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


Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0692AD73EA8
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 23:02:43 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28748.1769727753051427797
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 15:02:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=tY1hF7LS;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.10, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPjzqSk/JU6nBSkr/gCNg8d6go9yCqDPK6xXyLW5TF3DucfzxZUExEHXxWIxOlholR/UyGJdlNz3NwxrgYhBs6KNy6MiDjOY+LxG7dyKEJ0pcyWoEJnPejpqQvk2rih7uH8syscgr926rul/WXN6eeE+3e84zCC4KqYJVDZ6M5fm8o8i1atQD3JSOpjL9L04d5z2ZJEWZKs/SFpvNT7Wfh6jpECWEqdgZTtgqe8xAhMdfk8VFvea2OpxFKju2kbndDTNVG2LeLF50PqnJTaB4yqKxc02fUt0tuylhkdKm1RkQiYTzEPii9wcavZGdHRh6fTg8NWHmaCj2Goes8jyeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/yO0O0LeKxzgQ0ojIsFuCmUKDZtO2eWlDT7JFgS5lVc=;
 b=l/QhFmHPcQu5s8PUgzsqLwP7aOLvcTQy11pLboTyl2s8/OLyVIQt5Y68cbg2Ko0dkKRR/41RaaDnIRb1ultRQ6Pvndeq5nNnbbSPGAQLsUsAYJAwWolbR8HBVVthOwLmcKkmjWeBJzZiSnIqtWQCRfELU8NTZ30YtvnHzIVlrjPExnEJCqTMs2NQmG1OLNPRm0KZuisGHrc45JVa4xWhpoKayBnWfESYvDjH3PCeNEKgTM4aY3QH5zTDEx4qY2WhELtDaIkocPnuKK0uu4Ev6nkg6Bwaeh9JD7PyDWtBgsSCsg7AIholdZiKewR+jOVrNMrCz+vn2UuQeqpZKiOtZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/yO0O0LeKxzgQ0ojIsFuCmUKDZtO2eWlDT7JFgS5lVc=;
 b=tY1hF7LS2EQLpJhrYFYpiFlQedZkw3CHPdWgFc+nFA/BAx3FtI+ag9mTZLvO4F/PBQdo6U/sjDuj/AlU55qBDFiwugnErE0kcJKXa+UkkzFHYlon18pcE2Vp2fXYcQFj844paNe5mhNtzAqp+cWqI23X4dyvD/AZhYlWynEJVqw=
Received: from PH8PR22CA0024.namprd22.prod.outlook.com (2603:10b6:510:2d1::15)
 by BLAPR10MB5187.namprd10.prod.outlook.com (2603:10b6:208:334::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Thu, 29 Jan
 2026 23:02:30 +0000
Received: from CO1PEPF000044FD.namprd21.prod.outlook.com
 (2603:10b6:510:2d1:cafe::e6) by PH8PR22CA0024.outlook.office365.com
 (2603:10b6:510:2d1::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Thu,
 29 Jan 2026 23:02:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000044FD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Thu, 29 Jan 2026 23:02:29 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 17:02:26 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 17:02:26 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 29 Jan 2026 17:02:26 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60TN2QPH713167;
	Thu, 29 Jan 2026 17:02:26 -0600
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>,
	<a-christidis@ti.com>
Subject: [oe-core][PATCHv14 2/6] weston-init: convert to virtual-emptty-conf
Date: Thu, 29 Jan 2026 17:02:06 -0600
Message-ID: <20260129230210.2934333-3-rs@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129230210.2934333-1-rs@ti.com>
References: <20260129230210.2934333-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FD:EE_|BLAPR10MB5187:EE_
X-MS-Office365-Filtering-Correlation-Id: 73e08458-54d9-4212-e1c4-08de5f8a7a1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lx/mRxGFU7kmdZMKPho4LbyQIWWcolqo6Hz/yoCj4N96pMFCBG1qv1/e51AP?=
 =?us-ascii?Q?e6+krJS4syQNmOTe7mOoOKh81c6Ymg4N0DS1hgSUU5Q0QijESstpuN+yRZjd?=
 =?us-ascii?Q?VfIMsPk9tyoltBX2MIlk2hdl85varUawp+hd2lkEzpPVoDqrCZ7WPiyEoHzT?=
 =?us-ascii?Q?knDtmuvFcMKfwt2/HeAxEzO3fCYTBXfmJCzxlIfwVPbR4PTBIT0S94cY8/jM?=
 =?us-ascii?Q?oUTYxv5VdSVLneMBXfJ8uF+uWFkH2w43XoLoIz9QSlfgkTGuGOEHtLdjUAyy?=
 =?us-ascii?Q?kuyrjdpMVNTOvsxIQeevoFo6+uB+Ew9eSCmqhW2U8AiP+a1q8gbCeXnTCv0/?=
 =?us-ascii?Q?Cpawyz4aGzLe86GSZ1x8YjFk1jW0/caYi7/TXLW1jJ1pgogh5a2yFE0LUtae?=
 =?us-ascii?Q?yB0oDQmWskGcW3lZn14iRSs4lpYBF8I7ljbksFr4NTvpfVwBUct91Ptatf2b?=
 =?us-ascii?Q?sPj6CNlduyD3NaNLEr2bxGrXv4KZqelwmsx08K7KmiwDBgz9bNAKClbaoH5J?=
 =?us-ascii?Q?uGCItoAk6cto6Wg96Xk2J2Sun3eYXHkO0qc+SX6KdtkkEak89e/Bdnhu6nH0?=
 =?us-ascii?Q?h9nQewCqfT/i0u5WlGjJe82vxQ2TrETr2Q6cK8cxHbtipoV1hXNXTXZv1y4F?=
 =?us-ascii?Q?y57rtUla/zZoPByqNqNjyEoUnEKKU/0/uQjNlit2HcVdVYXlXYJf9wkEIiXs?=
 =?us-ascii?Q?1/vf8fPNsskwhTVlho9rmJ5hOY46LprA07KRd4vpH7CM9L5ym+xhldmneA9f?=
 =?us-ascii?Q?x0eCWmBLN5B7g22dXeA6LyYXSjwY9+Pe9sxy8McKHsjgeBVFIckmnJvS8FvV?=
 =?us-ascii?Q?w7Jz34yMTZXtyixCbmheiq3v33BPep+nFK12Tcz6+lHE3E/RmEsmwx/bNY0W?=
 =?us-ascii?Q?4pAJXxPOM53FFT/7ZL2e/03VKLqtcpXXjJ+/3Me6cTkO3W9RIRur25cmhcm9?=
 =?us-ascii?Q?V6rtgfFg+wDa8ILlNPP/Doy1fXoMgGm8OA4TJLNyeNtpKb1PS0dhCksqhx37?=
 =?us-ascii?Q?MlSg4QQ7TzpAPZ5cT3VxbYTXwggvGiqqO55ZWS66+esLVSt3EO0iUVt/CJO+?=
 =?us-ascii?Q?RBxIXluJxRVdNFCgrWa7v2lUXrdpBT58ZPlczHhCzeZiBdmZoIiLbN0i77Tq?=
 =?us-ascii?Q?pm/hWl/BnIZfe7F6trrhE5x/UTOqZ5TOV5lXQ+beIhKo0fkXxfA7Xnfp2+OK?=
 =?us-ascii?Q?SOd2U4izq9pmILARkAE3icNM9GD5cGppiw4/Ilqqz0MGhyP8jefcFzWJAeMh?=
 =?us-ascii?Q?95d1u+R4z+VZYuwVRI44QhthZSgFnqh1Sc5j0mI6gr4lUj6cD9TjYylf8s3J?=
 =?us-ascii?Q?AXHUgErbAxmKCWm2WLgX8sep3tBVNKeMEHBcvSLJL/4Ts3XMbCD2VdNiU3XN?=
 =?us-ascii?Q?vv28whA0xHK/pZUa4bKNS5Ntv99S/guUMGWBH/DjYRyK8o+bB+8aV6wXfyIi?=
 =?us-ascii?Q?AgajSYhk87ung/oTf4iBOqJv9bQte74W2gw9evuEGHr7haLPqXThM4O6fin3?=
 =?us-ascii?Q?1Q2QntYbkOxRpoWXn901N2eNeYGTeu3aAvPfX1dTQtP0/fk+jcsiAfET7RnA?=
 =?us-ascii?Q?kotO6me2Yo6Mc9JdNEbma92mFZ3UAbmdkErEki+SJLRfcNa++k1rs+UBXkm+?=
 =?us-ascii?Q?pQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CGXHv7Il13lF9DqzTblgLfpISCWs1BgxRP6w42t11RaGE5eNGK1p0WRe4r0kHVCyxDkKkgUX/t9UF5dAt5mArvTwA0jDeR83vrlZJdJGRDMLD+yTkjLbo5T3YFpaPzbEDvX26B34fGkL5zKzzW4I4I6ExRlANQI8yO9rVZeka95pQzs9hnLAxCuabxrZtBn+7x/et3XqSWXi2gIiEIUnGa6AQ/r+k20xtfvFVAVyLDPuCPtK1T2thZp/IXMWNsCxUpCX8Q8UEllCmHIwpMSP8FtlkjK2lW+LSbhW2IGAc/u3bkFN1oBpe/Y7ZeoLR7okqCyTAuSxGaxLmleidyNYg67Df0I9ZuSPlY7BKqx2PErsqpkFUNaX0ZBDG8I6MeM3h0PKrElDk/rgq83BqCBlzUMkjgnjHh+Z+eVgZxC3dp1AXbtGn20aBd06TYYOOmoc
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 23:02:29.0697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e08458-54d9-4212-e1c4-08de5f8a7a1c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044FD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5187
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 23:02:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230166

From: Randolph Sapp <rs@ti.com>

Convert this script package into a simple config for emptty using the
same weston user but leveraging the nopasswdlogin session provided by
emptty. Runtime provide virtual-emptty-conf as we need to set parameters
for the default session.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-selftest/files/static-group              |  1 -
 meta/lib/oeqa/runtime/cases/weston.py         | 18 +++--
 meta/recipes-graphics/wayland/weston-init.bb  | 66 +++-------------
 .../wayland/weston-init/emptty.conf           | 77 +++++++++++++++++++
 .../recipes-graphics/wayland/weston-init/init | 54 -------------
 .../wayland/weston-init/weston-autologin      | 11 ---
 .../wayland/weston-init/weston-socket.sh      | 20 -----
 .../wayland/weston-init/weston-start          | 76 ------------------
 .../wayland/weston-init/weston.env            |  0
 .../wayland/weston-init/weston.service        | 71 -----------------
 .../wayland/weston-init/weston.socket         | 14 ----
 11 files changed, 101 insertions(+), 307 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/weston-init/emptty.conf
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/init
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston-autolo=
gin
 delete mode 100755 meta/recipes-graphics/wayland/weston-init/weston-socket=
.sh
 delete mode 100755 meta/recipes-graphics/wayland/weston-init/weston-start
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.env
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.servic=
e
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.socket

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-=
group
index a197216165..c6c2501531 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -22,7 +22,6 @@ builder:x:522:
 _apt:x:523:
 weston-launch:x:524:
 weston:x:525:
-wayland:x:526:
 render:x:527:
 sgx:x:528:
 ptest:x:529:
diff --git a/meta/lib/oeqa/runtime/cases/weston.py b/meta/lib/oeqa/runtime/=
cases/weston.py
index b0dccee73b..bf18331e84 100644
--- a/meta/lib/oeqa/runtime/cases/weston.py
+++ b/meta/lib/oeqa/runtime/cases/weston.py
@@ -33,7 +33,7 @@ class WestonTest(OERuntimeTestCase):
=20
     def run_weston_init(self):
         if 'systemd' in self.tc.td['VIRTUAL-RUNTIME_init_manager']:
-            self.target.run('systemd-run --collect --unit=3Dweston-ptest.s=
ervice --uid=3D0 -p PAMName=3Dlogin -p TTYPath=3D/dev/tty6 -E XDG_RUNTIME_D=
IR=3D/tmp -E WAYLAND_DISPLAY=3Dwayland-0 /usr/bin/weston --socket=3Dwayland=
-1 --log=3D%s' % self.weston_log_file)
+            self.target.run(self.get_weston_command('systemd-run --collect=
 --unit=3Dweston-ptest.service --uid=3D0 -p PAMName=3Dlogin -p TTYPath=3D/d=
ev/tty6 -E XDG_RUNTIME_DIR -E WAYLAND_DISPLAY /usr/bin/weston --socket=3Dwa=
yland-2 --log=3D%s' % self.weston_log_file))
         else:
             self.target.run(self.get_weston_command('openvt -- weston --so=
cket=3Dwayland-2 --log=3D%s' % self.weston_log_file))
=20
@@ -51,12 +51,18 @@ class WestonTest(OERuntimeTestCase):
=20
     @OEHasPackage(['wayland-utils'])
     def test_wayland_info(self):
-        if 'systemd' in self.tc.td['VIRTUAL-RUNTIME_init_manager']:
-            command =3D 'XDG_RUNTIME_DIR=3D/run wayland-info'
-        else:
-            command =3D self.get_weston_command('wayland-info')
+        command =3D self.get_weston_command('wayland-info')
         status, output =3D self.target.run(command)
-        self.assertEqual(status, 0, msg=3D'wayland-info error: %s' % outpu=
t)
+        msg =3D 'wayland-info error: %s' % output
+
+        # dump last 20 lines of emptty log in case of failure
+        log_cmd =3D 'tail -n 20 /var/log/emptty/7.log'
+        msg +=3D '\n\n=3D=3D=3D=3D=3D start: snippet =3D=3D=3D=3D=3D\n\n'
+        msg +=3D 'file: /var/log/emptty/7.log\n\n'
+        msg +=3D '\n\n%s\n\n' % self.target.run(log_cmd)[1]
+        msg +=3D '\n\n=3D=3D=3D=3D=3D end: snippet =3D=3D=3D=3D=3D\n\n'
+
+        self.assertEqual(status, 0, msg=3Dmsg)
=20
     @OEHasPackage(['weston'])
     def test_weston_can_initialize_new_wayland_compositor(self):
diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-gr=
aphics/wayland/weston-init.bb
index 29cfba0833..7ef49e06f7 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -1,18 +1,14 @@
-SUMMARY =3D "Startup script and systemd unit file for the Weston Wayland c=
ompositor"
+SUMMARY =3D "Autologin package for the Weston Wayland compositor"
 HOMEPAGE =3D "https://www.yoctoproject.org/"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-SRC_URI =3D "file://init \
-           file://weston.env \
+SRC_URI =3D "\
            file://weston.ini \
-           file://weston.service \
-           file://weston.socket \
-           file://weston-socket.sh \
-           file://weston-autologin \
-           file://weston-start"
+           file://emptty.conf \
+"
=20
 S =3D "${UNPACKDIR}"
=20
@@ -30,37 +26,8 @@ WESTON_USER ??=3D "weston"
 WESTON_USER_HOME ??=3D "/home/${WESTON_USER}"
=20
 do_install() {
-	# Install weston-start script
-	if [ "${VIRTUAL-RUNTIME_init_manager}" !=3D "systemd" ]; then
-		install -Dm755 ${S}/weston-start ${D}${bindir}/weston-start
-		sed -i 's,@DATADIR@,${datadir},g' ${D}${bindir}/weston-start
-		sed -i 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${bindir}/weston-start
-		install -Dm755 ${S}/init ${D}/${sysconfdir}/init.d/weston
-		sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}/${sysconfdir}/init.d/weston
-	fi
-
-	# Install Weston systemd service
-	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; t=
hen
-		install -D -p -m0644 ${S}/weston.service ${D}${systemd_system_unitdir}/w=
eston.service
-		install -D -p -m0644 ${S}/weston.socket ${D}${systemd_system_unitdir}/we=
ston.socket
-		install -D -p -m0644 ${S}/weston-socket.sh ${D}${sysconfdir}/profile.d/w=
eston-socket.sh
-		sed -i -e s:@sysconfdir@:${sysconfdir}:g \
-			-e s:@bindir@:${bindir}:g \
-			-e s:@localstatedir@:${localstatedir}:g \
-			-e s:@runtimedir@:${runtimedir}:g \
-			-e s:@WESTON_USER@:${WESTON_USER}:g \
-			-e s:@WESTON_USER_HOME@:${WESTON_USER_HOME}:g \
-			${D}${systemd_system_unitdir}/weston.service \
-			${D}${systemd_system_unitdir}/weston.socket \
-			${D}${sysconfdir}/profile.d/weston-socket.sh
-	fi
-
-	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
-		install -D -p -m0644 ${S}/weston-autologin ${D}${sysconfdir}/pam.d/westo=
n-autologin
-	fi
-
 	install -D -p -m0644 ${S}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.=
ini
-	install -Dm644 ${S}/weston.env ${D}${sysconfdir}/default/weston
+	install -D -p -m0644 ${S}/emptty.conf ${D}${sysconfdir}/emptty/conf
=20
 	if [ -n "${DEFAULTBACKEND}" ]; then
 		sed -i -e "/^\[core\]/a backend=3D${DEFAULTBACKEND}-backend.so" ${D}${sy=
sconfdir}/xdg/weston/weston.ini
@@ -81,9 +48,7 @@ do_install() {
 	install -dm 755 -o ${WESTON_USER} -g ${WESTON_USER} ${D}/${WESTON_USER_HO=
ME}
 }
=20
-INHIBIT_UPDATERCD_BBCLASS =3D "${@oe.utils.conditional('VIRTUAL-RUNTIME_in=
it_manager', 'systemd', '1', '', d)}"
-
-inherit update-rc.d systemd useradd
+inherit useradd
=20
 USERADD_PACKAGES =3D "${PN}"
=20
@@ -91,23 +56,16 @@ USERADD_PACKAGES =3D "${PN}"
 #
 require ${THISDIR}/required-distro-features.inc
=20
-RDEPENDS:${PN} =3D "weston kbd ${@bb.utils.contains('PACKAGECONFIG', 'xway=
land', 'weston-xwayland', '', d)}"
-
-INITSCRIPT_NAME =3D "weston"
-INITSCRIPT_PARAMS =3D "start 9 5 2 . stop 20 0 1 6 ."
+RDEPENDS:${PN} =3D "emptty weston kbd ${@bb.utils.contains('PACKAGECONFIG'=
, 'xwayland', 'weston-xwayland', '', d)}"
=20
 FILES:${PN} +=3D "\
     ${sysconfdir}/xdg/weston/weston.ini \
-    ${sysconfdir}/profile.d/weston-socket.sh \
-    ${systemd_system_unitdir}/weston.service \
-    ${systemd_system_unitdir}/weston.socket \
-    ${sysconfdir}/default/weston \
-    ${sysconfdir}/pam.d/ \
+    ${sysconfdir}/emptty/conf \
     ${WESTON_USER_HOME} \
     "
=20
-CONFFILES:${PN} +=3D "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/de=
fault/weston"
+CONFFILES:${PN} +=3D "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/em=
ptty/conf"
+RPROVIDES:${PN} +=3D "virtual-emptty-conf"
=20
-SYSTEMD_SERVICE:${PN} =3D "weston.service weston.socket"
-USERADD_PARAM:${PN} =3D "--home ${WESTON_USER_HOME} --shell /bin/sh --user=
-group -G video,input,render,seat,wayland ${WESTON_USER}"
-GROUPADD_PARAM:${PN} =3D "-r wayland; -r render; -r seat"
+USERADD_PARAM:${PN} =3D "--home ${WESTON_USER_HOME} --shell /bin/sh --user=
-group -G video,input,render,seat,nopasswdlogin weston"
+GROUPADD_PARAM:${PN} =3D "-r nopasswdlogin; -r render; -r seat"
diff --git a/meta/recipes-graphics/wayland/weston-init/emptty.conf b/meta/r=
ecipes-graphics/wayland/weston-init/emptty.conf
new file mode 100644
index 0000000000..1918cc02a7
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston-init/emptty.conf
@@ -0,0 +1,77 @@
+# TTY, where emptty will start.
+TTY_NUMBER=3D7
+
+# Enables switching to defined TTY number.
+SWITCH_TTY=3Dtrue
+
+# Enables printing of /etc/issue in daemon mode.
+PRINT_ISSUE=3Dtrue
+
+# Enables printing of default motd, /etc/emptty/motd or /etc/emptty/motd-g=
en.sh.
+PRINT_MOTD=3Dtrue
+
+# Preselected user, if AUTOLOGIN is enabled, this user is logged in.
+DEFAULT_USER=3Dweston
+
+# Enables Autologin, if DEFAULT_USER is defined and part of nopasswdlogin =
group. Possible values are "true" or "false".
+AUTOLOGIN=3Dtrue
+
+# The default session used, if Autologin is enabled. If session is not fou=
nd in list of session, it proceeds to manual selection.
+AUTOLOGIN_SESSION=3DWeston
+
+# If Autologin is enabled and session does not start correctly, the number=
 of retries in short period is kept to eventually stop the infinite loop of=
 restarts. -1 is for infinite retries, 0 is for no retry.
+# AUTOLOGIN_MAX_RETRY=3D2
+
+# Default LANG, if user does not have set own in init script.
+#LANG=3Den_US.UTF-8
+
+# Starts desktop with calling "dbus-launch".
+DBUS_LAUNCH=3Dtrue
+
+# Starts Xorg desktop with calling "~/.xinitrc" script, if is true, file e=
xists and selected WM/DE is Xorg session, it overrides DBUS_LAUNCH.
+XINITRC_LAUNCH=3Dfalse
+
+# Prints available WM/DE each on new line instead of printing on single li=
ne.
+VERTICAL_SELECTION=3Dfalse
+
+# Defines the way, how is logging handled. Possible values are "rotate", "=
appending" or "disabled".
+#LOGGING=3Drotate
+
+# Overrides path of log file
+#LOGGING_FILE=3D/var/log/emptty/[TTY_NUMBER].log
+
+# Arguments passed to Xorg server.
+#XORG_ARGS=3D
+
+# Allows to use dynamic motd script to generate custom MOTD.
+#DYNAMIC_MOTD=3Dfalse
+
+# Allows to override default path to dynamic motd.
+#DYNAMIC_MOTD_PATH=3D/etc/emptty/motd-gen.sh
+
+# Allows to override default path to static motd.
+#MOTD_PATH=3D/etc/emptty/motd
+
+# Foreground color, available only in daemon mode.
+#FG_COLOR=3DLIGHT_BLACK
+
+# Background color, available only in daemon mode.
+#BG_COLOR=3DBLACK
+
+# Enables numlock in daemon mode. Possible values are "true" or "false".
+#ENABLE_NUMLOCK=3Dfalse
+
+# Defines the way, how is logging of session errors handled. Possible valu=
es are "rotate", "appending" or "disabled".
+SESSION_ERROR_LOGGING=3Drotate
+
+# Overrides path of session errors log file
+#SESSION_ERROR_LOGGING_FILE=3D/var/log/emptty/session-errors.[TTY_NUMBER].=
log
+
+# If set true, it will not use `.emptty-xauth` file, but the standard `~/.=
Xauthority` file. This allows to handle xauth issues.
+#DEFAULT_XAUTHORITY=3Dfalse
+
+#If set true, Xorg will be started as rootless, if system allows and emptt=
y is running in daemon mode.
+#ROOTLESS_XORG=3Dfalse
+
+#If set true, environmental groups are printed to differ Xorg/Wayland/Cust=
om/UserCustom desktops.
+IDENTIFY_ENVS=3Dfalse
diff --git a/meta/recipes-graphics/wayland/weston-init/init b/meta/recipes-=
graphics/wayland/weston-init/init
deleted file mode 100644
index a5c54e001e..0000000000
--- a/meta/recipes-graphics/wayland/weston-init/init
+++ /dev/null
@@ -1,54 +0,0 @@
-#!/bin/sh
-#
-### BEGIN INIT INFO
-# Provides: weston
-# Required-Start: $local_fs $remote_fs
-# Required-Stop: $local_fs $remote_fs
-# Default-Start:     2 3 4 5
-# Default-Stop:      0 1 6
-### END INIT INFO
-
-if test -e /etc/default/weston ; then
-        . /etc/default/weston
-fi
-
-killproc() {
-        pid=3D`/bin/pidof $1`
-        [ "$pid" !=3D "" ] && kill $pid
-}
-
-read CMDLINE < /proc/cmdline
-for x in $CMDLINE; do
-        case $x in
-        weston=3Dfalse)
-		echo "Weston disabled"
-		exit 0;
-                ;;
-        esac
-done
-
-case "$1" in
-  start)
-        . /etc/profile
-	      export HOME=3DROOTHOME
-
-        WESTON_USER=3Dweston weston-start $OPTARGS &
-  ;;
-
-  stop)
-        echo "Stopping Weston"
-        killproc weston
-  ;;
-
-  restart)
-	$0 stop
-        sleep 1
-        $0 start
-  ;;
-
-  *)
-        echo "usage: $0 { start | stop | restart }"
-  ;;
-esac
-
-exit 0
diff --git a/meta/recipes-graphics/wayland/weston-init/weston-autologin b/m=
eta/recipes-graphics/wayland/weston-init/weston-autologin
deleted file mode 100644
index f6e6d106de..0000000000
--- a/meta/recipes-graphics/wayland/weston-init/weston-autologin
+++ /dev/null
@@ -1,11 +0,0 @@
-auth      required  pam_nologin.so
-auth      required  pam_unix.so     try_first_pass nullok
-
-account   required  pam_nologin.so
-account   required  pam_unix.so
-
-session   required  pam_env.so
-session   required  pam_unix.so
--session  optional  pam_systemd.so type=3Dwayland class=3Duser desktop=3Dw=
eston
--session  optional  pam_loginuid.so
-
diff --git a/meta/recipes-graphics/wayland/weston-init/weston-socket.sh b/m=
eta/recipes-graphics/wayland/weston-init/weston-socket.sh
deleted file mode 100755
index 8f652862da..0000000000
--- a/meta/recipes-graphics/wayland/weston-init/weston-socket.sh
+++ /dev/null
@@ -1,20 +0,0 @@
-#!/bin/sh
-
-# set weston variables for use with global weston socket
-global_socket=3D"@runtimedir@/wayland-0"
-if [ -e "$global_socket" ]; then
-	weston_group=3D$(stat -c "%G" "$global_socket")
-	if [ "$(id -u)" =3D "0" ]; then
-		export WAYLAND_DISPLAY=3D"$global_socket"
-	else
-		case "$(groups "$USER")" in
-			*"$weston_group"*)
-				export WAYLAND_DISPLAY=3D"$global_socket"
-				;;
-			*)
-				;;
-		esac
-	fi
-	unset weston_group
-fi
-unset global_socket
diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/=
recipes-graphics/wayland/weston-init/weston-start
deleted file mode 100755
index 3b13a0047a..0000000000
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ /dev/null
@@ -1,76 +0,0 @@
-#!/bin/sh
-# Copyright (C) 2016 O.S. Systems Software LTDA.
-# Copyright (C) 2016 Freescale Semiconductor
-
-export PATH=3D"/sbin:/usr/sbin:/bin:/usr/bin"
-
-usage() {
-	cat <<EOF
-	$0 [<weston options>]
-EOF
-}
-
-## Module support
-modules_dir=3D@DATADIR@/weston-start
-
-# Add weston extra argument
-add_weston_argument() {
-	weston_args=3D"$weston_args $1"
-}
-
-## Add module to --modules argument
-add_weston_module() {
-	if [[ "x${weston_modules}" =3D=3D "x" ]]; then
-		weston_modules=3D"--modules "
-	fi;
-	weston_modules+=3D"${1},"
-}
-
-if [ -n "$WAYLAND_DISPLAY" ]; then
-	echo "ERROR: A Wayland compositor is already running, nested Weston insta=
nce is not supported yet."
-	exit 1
-fi
-
-if [ -n "$WESTON_USER" ]; then
-	if [ -z "$WESTON_GROUP" ]; then
-		# no explicit WESTON_GROUP given, therefore use WESTON_USER
-		export WESTON_GROUP=3D"${WESTON_USER}"
-	fi
-fi
-
-weston_args=3D$*
-
-# Load and run modules
-if [ -d "$modules_dir" ]; then
-	for m in "$modules_dir"/*; do
-		# Skip backup files
-		if [ "`echo $m | sed -e 's/\~$//'`" !=3D "$m" ]; then
-			continue
-		fi
-
-		# process module
-		. $m
-		if [[ x"{$weston_modules}" !=3D "x" ]]; then
-			add_weston_argument "${weston_modules}"
-		fi;
-	done
-fi
-
-if test -z "$XDG_RUNTIME_DIR"; then
-	export XDG_RUNTIME_DIR=3D/run/user/`id -u ${WESTON_USER}`
-	if test -d "$XDG_RUNTIME_DIR"; then
-	    # Check permissions on existing directory
-	    if [ "$(stat -c %u-%a "$XDG_RUNTIME_DIR")" !=3D "$(id -u ${WESTON_USE=
R})-700" ]; then
-			echo "ERROR: $XDG_RUNTIME_DIR has incorrect permissions"
-			exit 1
-		fi
-	else
-		mkdir --mode 0700 --parents $XDG_RUNTIME_DIR
-		if [ -n "$WESTON_USER" ]
-		then
-			chown $WESTON_USER:$WESTON_GROUP $XDG_RUNTIME_DIR
-		fi
-	fi
-fi
-
-su -c "XDG_RUNTIME_DIR=3D$XDG_RUNTIME_DIR weston $weston_args --log=3D/tmp=
/weston.log" $WESTON_USER
diff --git a/meta/recipes-graphics/wayland/weston-init/weston.env b/meta/re=
cipes-graphics/wayland/weston-init/weston.env
deleted file mode 100644
index e69de29bb2..0000000000
diff --git a/meta/recipes-graphics/wayland/weston-init/weston.service b/met=
a/recipes-graphics/wayland/weston-init/weston.service
deleted file mode 100644
index b7e845e88d..0000000000
--- a/meta/recipes-graphics/wayland/weston-init/weston.service
+++ /dev/null
@@ -1,71 +0,0 @@
-# This is a system unit for launching Weston with auto-login as the
-# user configured here.
-#
-# Weston must be built with systemd support, and your weston.ini must load
-# the plugin systemd-notify.so.
-[Unit]
-Description=3DWeston, a Wayland compositor, as a system service
-Documentation=3Dman:weston(1) man:weston.ini(5)
-Documentation=3Dhttp://wayland.freedesktop.org/
-
-# Make sure we are started after logins are permitted.
-Requires=3Dsystemd-user-sessions.service
-After=3Dsystemd-user-sessions.service
-
-# If Plymouth is used, we want to start when it is on its way out.
-After=3Dplymouth-quit-wait.service
-
-# D-Bus is necessary for contacting logind. Logind is required.
-Wants=3Ddbus.socket
-After=3Ddbus.socket
-
-# Ensure the socket is present
-Requires=3Dweston.socket
-
-# Since we are part of the graphical session, make sure we are started bef=
ore
-# it is complete.
-Before=3Dgraphical.target
-
-# Prevent starting on systems without virtual consoles, Weston requires on=
e
-# for now.
-ConditionPathExists=3D/dev/tty0
-
-[Service]
-# Requires systemd-notify.so Weston plugin.
-Type=3Dnotify
-EnvironmentFile=3D@sysconfdir@/default/weston
-ExecStart=3D@bindir@/weston --modules=3Dsystemd-notify.so
-
-# Optional watchdog setup
-#TimeoutStartSec=3D60
-#WatchdogSec=3D20
-
-# The user to run Weston as.
-User=3D@WESTON_USER@
-Group=3D@WESTON_USER@
-
-# Make sure the working directory is the users home directory
-WorkingDirectory=3D@WESTON_USER_HOME@
-
-# Set up a full user session for the user, required by Weston.
-PAMName=3Dweston-autologin
-
-# A virtual terminal is needed.
-TTYPath=3D/dev/tty7
-TTYReset=3Dyes
-TTYVHangup=3Dyes
-TTYVTDisallocate=3Dyes
-
-# Fail to start if not controlling the tty.
-StandardInput=3Dtty-fail
-StandardOutput=3Djournal
-StandardError=3Djournal
-
-# Log this user with utmp, letting it show up with commands 'w' and 'who'.
-UtmpIdentifier=3Dtty7
-UtmpMode=3Duser
-
-[Install]
-# Note: If you only want weston to start on-demand, remove this line with =
a
-# service drop file
-WantedBy=3Dgraphical.target
diff --git a/meta/recipes-graphics/wayland/weston-init/weston.socket b/meta=
/recipes-graphics/wayland/weston-init/weston.socket
deleted file mode 100644
index a7d461ee30..0000000000
--- a/meta/recipes-graphics/wayland/weston-init/weston.socket
+++ /dev/null
@@ -1,14 +0,0 @@
-[Unit]
-Description=3DWeston socket
-RequiresMountsFor=3D@runtimedir@
-
-[Socket]
-ListenStream=3D@runtimedir@/wayland-0
-SocketMode=3D0775
-SocketUser=3D@WESTON_USER@
-SocketGroup=3Dwayland
-RemoveOnStop=3Dyes
-
-[Install]
-WantedBy=3Dsockets.target
-
--=20
2.52.0



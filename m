Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 619CCC36002
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 12:56:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.20449.1742561778756443086
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 05:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5175e5883a=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LAo2bt015434
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 05:56:18 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45eprrd11y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 05:56:17 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 21 Mar 2025 05:56:14 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] xserver-xorg: fix CVE-2022-49737
Date: Fri, 21 Mar 2025 12:55:51 +0000
Message-ID: <20250321125552.1618829-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=LZw86ifi c=1 sm=1 tr=0 ts=67dd61f2 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=Vs1iUdzkB0EA:10 a=PYnjg3YJAAAA:8 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=aR16PxjQAAAA:8 a=pGLkceISAAAA:8
 a=isKO8siKdrtMZkWASFIA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22 a=zbFvvTOBjyH4ze5LlUjX:22
X-Proofpoint-GUID: L7QP4w8818btG832UFS4lJVr6itizED1
X-Proofpoint-ORIG-GUID: L7QP4w8818btG832UFS4lJVr6itizED1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503210096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 12:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213448

From: Yogita Urade <yogita.urade@windriver.com>

In X.Org X server 20.11 through 21.1.16, when a client application
uses easystroke for mouse gestures, the main thread modifies various
data structures used by the input thread without acquiring a lock,
aka a race condition. In particular, AttachDevice in dix/devices.c
does not acquire an input lock.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-49737

Upstream patch:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/dc7cb45482cea6ccec22d117ca0b489500b4d0a0

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../xserver-xorg/CVE-2022-49737.patch         | 90 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-49737.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-49737.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-49737.patch
new file mode 100644
index 0000000000..86c9f59f8c
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-49737.patch
@@ -0,0 +1,90 @@
+From dc7cb45482cea6ccec22d117ca0b489500b4d0a0 Mon Sep 17 00:00:00 2001
+From: tholin <thomas.lindroth@gmail.com>
+Date: Tue, 4 Jan 2022 12:08:11 +0000
+Subject: [PATCH] dix: Hold input lock for AttachDevice()
+
+Fix the following race:
+
+Possible data race during read of size 8 at 0xA112510 by thread #6
+Locks held: 1, at address 0x366B40
+   at 0x14C8B9: GetMaster (devices.c:2691)
+   by 0x15CFC5: IsFloating (events.c:346)
+   by 0x2B9554: miPointerGetScreen (mipointer.c:527)
+   by 0x1A5136: xf86PostButtonEventM (xf86Xinput.c:1379)
+   by 0x1A52BD: xf86PostButtonEvent (xf86Xinput.c:1345)
+   by 0x485F45B: EvdevProcessEvent (in /usr/lib64/xorg/modules/input/evdev_drv.so)
+   by 0x485FDAC: EvdevReadInput (in /usr/lib64/xorg/modules/input/evdev_drv.so)
+   by 0x195427: xf86ReadInput (xf86Events.c:247)
+   by 0x2CC113: InputReady (inputthread.c:180)
+   by 0x2CE4EA: ospoll_wait (ospoll.c:657)
+   by 0x2CC077: InputThreadDoWork (inputthread.c:369)
+   by 0x484A336: mythread_wrapper (hg_intercepts.c:406)
+
+This conflicts with a previous write of size 8 by thread #1
+Locks held: none
+   at 0x14D2C6: AttachDevice (devices.c:2609)
+   by 0x15CF85: ReattachToOldMaster (events.c:1457)
+   by 0x1647DD: DeactivateKeyboardGrab (events.c:1700)
+   by 0x25D7F1: ProcXIUngrabDevice (xigrabdev.c:169)
+   by 0x2552AD: ProcIDispatch (extinit.c:398)
+   by 0x155291: Dispatch (dispatch.c:479)
+   by 0x158CBA: dix_main (main.c:276)
+   by 0x143A3D: main (stubmain.c:34)
+ Address 0xa112510 is 336 bytes inside a block of size 904 alloc'd
+   at 0x4846571: calloc (vg_replace_malloc.c:1328)
+   by 0x14A0B3: AddInputDevice (devices.c:260)
+   by 0x1A31A0: xf86ActivateDevice (xf86Xinput.c:365)
+   by 0x1A4549: xf86NewInputDevice (xf86Xinput.c:948)
+   by 0x1A4B44: NewInputDeviceRequest (xf86Xinput.c:1090)
+   by 0x1B81FE: device_added (udev.c:282)
+   by 0x1B8516: config_udev_init (udev.c:439)
+   by 0x1B7091: config_init (config.c:50)
+   by 0x197970: InitInput (xf86Init.c:814)
+   by 0x158C6B: dix_main (main.c:250)
+   by 0x143A3D: main (stubmain.c:34)
+ Block was alloc'd by thread #1
+
+The steps to trigger the race are:
+1. Main thread does cleanup at mipointer.c:360 setting the slave device's
+   miPointerPtr to null.
+2. Input thread use MIPOINTER in mipointer.c and get the slave's
+   miPointerPtr = null.
+3. Main thread updates dev->master at devices.c:2609.
+4. MIPOINTER would now return the master's miPointerPtr but the input
+   thread already got the slave's miPointerPtr in step 2 and segfaults by
+   null ptr deref.
+
+Closes: https://gitlab.freedesktop.org/xorg/xserver/-/issues/1260
+Signed-off-by: Thomas Lindroth <thomas.lindroth@gmail.com>
+
+CVE: CVE-2022-49737
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/dc7cb45482cea6ccec22d117ca0b489500b4d0a0]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ dix/devices.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/dix/devices.c b/dix/devices.c
+index 459f1ed..e5a6f02 100644
+--- a/dix/devices.c
++++ b/dix/devices.c
+@@ -2671,6 +2671,8 @@ AttachDevice(ClientPtr client, DeviceIntPtr dev, DeviceIntPtr master)
+     if (IsFloating(dev) && !master && dev->enabled)
+         return Success;
+
++    input_lock();
++
+     /* free the existing sprite. */
+     if (IsFloating(dev) && dev->spriteInfo->paired == dev) {
+         screen = miPointerGetScreen(dev);
+@@ -2711,6 +2713,7 @@ AttachDevice(ClientPtr client, DeviceIntPtr dev, DeviceIntPtr master)
+         RecalculateMasterButtons(master);
+     }
+
++    input_unlock();
+     /* XXX: in theory, the MD should change back to its old, original
+      * classes when the last SD is detached. Thanks to the XTEST devices,
+      * we'll always have an SD attached until the MD is removed.
+--
+2.40.0
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index e77b81eed6..6790eb0921 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -35,6 +35,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2025-26601-2.patch \
            file://CVE-2025-26601-3.patch \
            file://CVE-2025-26601-4.patch \
+           file://CVE-2022-49737.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.40.0



Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A784C369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 11:49:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15017.1746013767289349657
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 04:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7215f10e62=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UBlGLt002070
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 04:49:26 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46b6ugrpym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 04:49:26 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 30 Apr 2025 04:49:24 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][styhead][PATCH 1/1] xserver-xorg: fix CVE-2022-49737
Date: Wed, 30 Apr 2025 11:49:04 +0000
Message-ID: <20250430114904.936755-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 8ll9sk7jyeR9lUYqOqXayD1OXoY97jQX
X-Proofpoint-ORIG-GUID: 8ll9sk7jyeR9lUYqOqXayD1OXoY97jQX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA4NCBTYWx0ZWRfX3rAx3QnF7ud+ bHoSVtdvQ3nCXKMu+tdG2EDOp3dXTHw3Q0snWBGizPyfQbhc+rPzHKqkeZVseHG+PQRhjkFzpWs J2bhhFFGDDiy0V8AVQry25gCgdCSEBHlLR/mTjjEDboBZFm0sQbVItqxqDHmWAEc1nozIkz6+p1
 ZC0m/Zgh4d+PAxcprmI2oAsUQkBr5SfX4P10AqubnVxYdoNMktj5lEvkXEvtcf/uQKgrvS/WKOW iU7Lgma0V3OvyQy79Bz+ZhTWGdLR8YyShjPZ3XTKhO2FrqV0j9Gdf+OnqINCjou5I3l/ZxjEEkt XSndfrBcnDhpDgmi/jFW7ZUQlZM0NZCfMgr8ljppdE0/RhmWhYYrjBosy04QZ4Hx8Gyp25EVVE2
 SZESIruiBquv/rNfsU+eRfnaZH/8vxfbEh1qJNNd6Tw7moHlqepEU01pjO8KR/TpESX+RaOi
X-Authority-Analysis: v=2.4 cv=Od+YDgTY c=1 sm=1 tr=0 ts=68120e46 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=XR8D0OoHHMoA:10 a=PYnjg3YJAAAA:8 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=aR16PxjQAAAA:8 a=pGLkceISAAAA:8
 a=isKO8siKdrtMZkWASFIA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22 a=zbFvvTOBjyH4ze5LlUjX:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504300084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 11:49:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215741

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
 .../xserver-xorg/CVE-2022-49737.patch         | 92 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.16.bb      |  3 +-
 2 files changed, 94 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-49737.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-49737.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-49737.patch
new file mode 100644
index 0000000000..93acd05c0a
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-49737.patch
@@ -0,0 +1,92 @@
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
+Closes: #1260
+
+Signed-off-by: Thomas Lindroth <thomas.lindroth@gmail.com>
+
+CVE: CVE-2022-49737
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/dc7cb45482cea6ccec22d117ca0b489500b4d0a0]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ dix/devices.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/dix/devices.c b/dix/devices.c
+index 77bac49..acf554d 100644
+--- a/dix/devices.c
++++ b/dix/devices.c
+@@ -2672,6 +2672,8 @@ AttachDevice(ClientPtr client, DeviceIntPtr dev, DeviceIntPtr master)
+     if (IsFloating(dev) && !master && dev->enabled)
+         return Success;
+
++    input_lock();
++
+     /* free the existing sprite. */
+     if (IsFloating(dev) && dev->spriteInfo->paired == dev) {
+         screen = miPointerGetScreen(dev);
+@@ -2715,6 +2717,8 @@ AttachDevice(ClientPtr client, DeviceIntPtr dev, DeviceIntPtr master)
+         RecalculateMasterButtons(master);
+     }
+
++    input_unlock();
++
+     /* XXX: in theory, the MD should change back to its old, original
+      * classes when the last SD is detached. Thanks to the XTEST devices,
+      * we'll always have an SD attached until the MD is removed.
+--
+2.40.0
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
index 38c81f2372..185f3eedfd 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
@@ -1,7 +1,8 @@
 require xserver-xorg.inc
 
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
-           file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
+            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
+            file://CVE-2022-49737.patch \
            "
 SRC_URI[sha256sum] = "b14a116d2d805debc5b5b2aac505a279e69b217dae2fae2dfcb62400471a9970"
 
-- 
2.40.0



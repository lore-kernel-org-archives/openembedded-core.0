Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web12.38196.1600680548454292188
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 02:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: wsFdxoPxU6WgExVraMtuv9574z/6IOHcfQ4aBfa3EXPCyDj9GybSaEA8h7D2OcJ4O1D/g3WECh
 Fz9Q2IhiK1lQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="157725337"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; 
   d="scan'208";a="157725337"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2020 02:29:06 -0700
IronPort-SDR: FxfNMofdu9K31kGiLj4qqerb24wPNyE3x7D1mbtf4f5lS0RA6Aj7bl/YPNmD7iikHEZYKLNK69
 eR5kmbpG6DNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; 
   d="scan'208";a="304430156"
Received: from andromeda01.png.intel.com (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.10])
  by orsmga003.jf.intel.com with ESMTP; 21 Sep 2020 02:29:05 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 1/2] xserver-xorg: fix CVE-2020-14346/14361/14362
Date: Mon, 21 Sep 2020 17:29:03 +0800
Message-Id: <20200921092904.1350-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Chee Yang Lee <chee.yang.lee@intel.com>

fix :
CVE-2020-14346
https://gitlab.freedesktop.org/xorg/xserver/-/commit/c940cc8b6c0a2983c1ec974f1b3f019795dd4cff

CVE-2020-14361
https://gitlab.freedesktop.org/xorg/xserver/-/commit/144849ea27230962227e62a943b399e2ab304787

CVE-2020-14362
https://gitlab.freedesktop.org/xorg/xserver/-/commit/2902b78535ecc6821cc027351818b28a5c7fdbdc

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../xserver-xorg/CVE-2020-14346.patch         | 36 ++++++++++
 .../xserver-xorg/CVE-2020-14361.patch         | 36 ++++++++++
 .../xserver-xorg/CVE-2020-14362.patch         | 70 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.8.bb       |  3 +
 4 files changed, 145 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14346.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14361.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14362.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14346.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14346.patch
new file mode 100644
index 0000000000..4994a21d33
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14346.patch
@@ -0,0 +1,36 @@
+From c940cc8b6c0a2983c1ec974f1b3f019795dd4cff Mon Sep 17 00:00:00 2001
+From: Matthieu Herrb <matthieu@herrb.eu>
+Date: Tue, 18 Aug 2020 14:49:04 +0200
+Subject: [PATCH] Fix XIChangeHierarchy() integer underflow
+
+CVE-2020-14346 / ZDI-CAN-11429
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
+
+Upstream-Status: Backport
+[https://gitlab.freedesktop.org/xorg/xserver/-/commit/c940cc8b6c0a2983c1ec974f1b3f019795dd4cff]
+CVE: CVE-2020-14346
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ Xi/xichangehierarchy.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Xi/xichangehierarchy.c b/Xi/xichangehierarchy.c
+index cbdd91258..504defe56 100644
+--- a/Xi/xichangehierarchy.c
++++ b/Xi/xichangehierarchy.c
+@@ -423,7 +423,7 @@ ProcXIChangeHierarchy(ClientPtr client)
+     if (!stuff->num_changes)
+         return rc;
+ 
+-    len = ((size_t)stuff->length << 2) - sizeof(xXIChangeHierarchyReq);
++    len = ((size_t)client->req_len << 2) - sizeof(xXIChangeHierarchyReq);
+ 
+     any = (xXIAnyHierarchyChangeInfo *) &stuff[1];
+     while (stuff->num_changes--) {
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14361.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14361.patch
new file mode 100644
index 0000000000..710cc3873c
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14361.patch
@@ -0,0 +1,36 @@
+From 144849ea27230962227e62a943b399e2ab304787 Mon Sep 17 00:00:00 2001
+From: Matthieu Herrb <matthieu@herrb.eu>
+Date: Tue, 18 Aug 2020 14:52:29 +0200
+Subject: [PATCH] Fix XkbSelectEvents() integer underflow
+
+CVE-2020-14361 ZDI-CAN 11573
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
+
+Upstream-Status: Backport
+[https://gitlab.freedesktop.org/xorg/xserver/-/commit/144849ea27230962227e62a943b399e2ab304787]
+CVE: CVE-2020-14361
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ xkb/xkbSwap.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xkb/xkbSwap.c b/xkb/xkbSwap.c
+index 1c1ed5ff4..50cabb90e 100644
+--- a/xkb/xkbSwap.c
++++ b/xkb/xkbSwap.c
+@@ -76,7 +76,7 @@ SProcXkbSelectEvents(ClientPtr client)
+         register unsigned bit, ndx, maskLeft, dataLeft, size;
+ 
+         from.c8 = (CARD8 *) &stuff[1];
+-        dataLeft = (stuff->length * 4) - SIZEOF(xkbSelectEventsReq);
++        dataLeft = (client->req_len * 4) - SIZEOF(xkbSelectEventsReq);
+         maskLeft = (stuff->affectWhich & (~XkbMapNotifyMask));
+         for (ndx = 0, bit = 1; (maskLeft != 0); ndx++, bit <<= 1) {
+             if (((bit & maskLeft) == 0) || (ndx == XkbMapNotify))
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14362.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14362.patch
new file mode 100644
index 0000000000..2103e9c198
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14362.patch
@@ -0,0 +1,70 @@
+From 2902b78535ecc6821cc027351818b28a5c7fdbdc Mon Sep 17 00:00:00 2001
+From: Matthieu Herrb <matthieu@herrb.eu>
+Date: Tue, 18 Aug 2020 14:55:01 +0200
+Subject: [PATCH] Fix XRecordRegisterClients() Integer underflow
+
+CVE-2020-14362 ZDI-CAN-11574
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
+
+Upstream-Status: Backport
+[https://gitlab.freedesktop.org/xorg/xserver/-/commit/2902b78535ecc6821cc027351818b28a5c7fdbdc]
+CVE: CVE-2020-14362
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ record/record.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/record/record.c b/record/record.c
+index f2d38c877..be154525d 100644
+--- a/record/record.c
++++ b/record/record.c
+@@ -2500,7 +2500,7 @@ SProcRecordQueryVersion(ClientPtr client)
+ }                               /* SProcRecordQueryVersion */
+ 
+ static int _X_COLD
+-SwapCreateRegister(xRecordRegisterClientsReq * stuff)
++SwapCreateRegister(ClientPtr client, xRecordRegisterClientsReq * stuff)
+ {
+     int i;
+     XID *pClientID;
+@@ -2510,13 +2510,13 @@ SwapCreateRegister(xRecordRegisterClientsReq * stuff)
+     swapl(&stuff->nRanges);
+     pClientID = (XID *) &stuff[1];
+     if (stuff->nClients >
+-        stuff->length - bytes_to_int32(sz_xRecordRegisterClientsReq))
++        client->req_len - bytes_to_int32(sz_xRecordRegisterClientsReq))
+         return BadLength;
+     for (i = 0; i < stuff->nClients; i++, pClientID++) {
+         swapl(pClientID);
+     }
+     if (stuff->nRanges >
+-        stuff->length - bytes_to_int32(sz_xRecordRegisterClientsReq)
++        client->req_len - bytes_to_int32(sz_xRecordRegisterClientsReq)
+         - stuff->nClients)
+         return BadLength;
+     RecordSwapRanges((xRecordRange *) pClientID, stuff->nRanges);
+@@ -2531,7 +2531,7 @@ SProcRecordCreateContext(ClientPtr client)
+ 
+     swaps(&stuff->length);
+     REQUEST_AT_LEAST_SIZE(xRecordCreateContextReq);
+-    if ((status = SwapCreateRegister((void *) stuff)) != Success)
++    if ((status = SwapCreateRegister(client, (void *) stuff)) != Success)
+         return status;
+     return ProcRecordCreateContext(client);
+ }                               /* SProcRecordCreateContext */
+@@ -2544,7 +2544,7 @@ SProcRecordRegisterClients(ClientPtr client)
+ 
+     swaps(&stuff->length);
+     REQUEST_AT_LEAST_SIZE(xRecordRegisterClientsReq);
+-    if ((status = SwapCreateRegister((void *) stuff)) != Success)
++    if ((status = SwapCreateRegister(client, (void *) stuff)) != Success)
+         return status;
+     return ProcRecordRegisterClients(client);
+ }                               /* SProcRecordRegisterClients */
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
index 5101134538..51d959f86c 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
@@ -6,6 +6,9 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://sdksyms-no-build-path.patch \
            file://0001-drmmode_display.c-add-missing-mi.h-include.patch \
            file://CVE-2020-14347.patch \
+           file://CVE-2020-14346.patch \
+           file://CVE-2020-14361.patch \
+           file://CVE-2020-14362.patch \
            "
 SRC_URI[md5sum] = "a770aec600116444a953ff632f51f839"
 SRC_URI[sha256sum] = "d17b646bee4ba0fb7850c1cc55b18e3e8513ed5c02bdf38da7e107f84e2d0146"
-- 
2.17.1


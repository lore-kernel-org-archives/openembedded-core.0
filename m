Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.19575.1599570480512121640
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2020 06:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: THhsZPLoijEsiEiURMQasG1gzs9SApVg77AqYjBofXH4m0psP9hDNA5vzK8Rz2PAlDG16ZDtT+
 tAVosXhbOelg==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="145843906"
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; 
   d="scan'208";a="145843906"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2020 06:07:47 -0700
IronPort-SDR: V7tIgMxzXXy9z1PZXPKdejrgwbvac0r/cTqvCsub8Lr7BenSmgoeA9+4fM2Ig9SqHzMXJgdUdf
 wVHHEVpSma7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; 
   d="scan'208";a="377518774"
Received: from andromeda01.png.intel.com (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.10])
  by orsmga001.jf.intel.com with ESMTP; 08 Sep 2020 06:07:47 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 2/3] qemu: fix CVE-2020-14364 CVE-2020-14415
Date: Tue,  8 Sep 2020 21:07:43 +0800
Message-Id: <20200908130744.63361-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200908130744.63361-1-chee.yang.lee@intel.com>
References: <20200908130744.63361-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  2 +
 .../qemu/qemu/CVE-2020-14364.patch            | 93 +++++++++++++++++++
 .../qemu/qemu/CVE-2020-14415.patch            | 37 ++++++++
 3 files changed, 132 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-14364.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-14415.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 49dbb1c13d..e0ea5ad477 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -45,6 +45,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2020-13800.patch \
 	   file://CVE-2020-13362.patch \
 	   file://CVE-2020-15863.patch \
+	   file://CVE-2020-14364.patch \
+	   file://CVE-2020-14415.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-14364.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-14364.patch
new file mode 100644
index 0000000000..8333025a32
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-14364.patch
@@ -0,0 +1,93 @@
+From b946434f2659a182afc17e155be6791ebfb302eb Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Tue, 25 Aug 2020 07:36:36 +0200
+Subject: [PATCH] usb: fix setup_len init (CVE-2020-14364)
+
+Store calculated setup_len in a local variable, verify it, and only
+write it to the struct (USBDevice->setup_len) in case it passed the
+sanity checks.
+
+This prevents other code (do_token_{in,out} functions specifically)
+from working with invalid USBDevice->setup_len values and overrunning
+the USBDevice->setup_buf[] buffer.
+
+Fixes: CVE-2020-14364
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Tested-by: Gonglei <arei.gonglei@huawei.com>
+Reviewed-by: Li Qiang <liq3ea@gmail.com>
+Message-id: 20200825053636.29648-1-kraxel@redhat.com
+
+Upstream-Status: Backport
+[https://git.qemu.org/?p=qemu.git;a=patch;h=b946434f2659a182afc17e155be6791ebfb302eb]
+CVE: CVE-2020-14364
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/usb/core.c | 16 ++++++++++------
+ 1 file changed, 10 insertions(+), 6 deletions(-)
+
+diff --git a/hw/usb/core.c b/hw/usb/core.c
+index 5abd128..5234dcc 100644
+--- a/hw/usb/core.c
++++ b/hw/usb/core.c
+@@ -129,6 +129,7 @@ void usb_wakeup(USBEndpoint *ep, unsigned int stream)
+ static void do_token_setup(USBDevice *s, USBPacket *p)
+ {
+     int request, value, index;
++    unsigned int setup_len;
+ 
+     if (p->iov.size != 8) {
+         p->status = USB_RET_STALL;
+@@ -138,14 +139,15 @@ static void do_token_setup(USBDevice *s, USBPacket *p)
+     usb_packet_copy(p, s->setup_buf, p->iov.size);
+     s->setup_index = 0;
+     p->actual_length = 0;
+-    s->setup_len   = (s->setup_buf[7] << 8) | s->setup_buf[6];
+-    if (s->setup_len > sizeof(s->data_buf)) {
++    setup_len = (s->setup_buf[7] << 8) | s->setup_buf[6];
++    if (setup_len > sizeof(s->data_buf)) {
+         fprintf(stderr,
+                 "usb_generic_handle_packet: ctrl buffer too small (%d > %zu)\n",
+-                s->setup_len, sizeof(s->data_buf));
++                setup_len, sizeof(s->data_buf));
+         p->status = USB_RET_STALL;
+         return;
+     }
++    s->setup_len = setup_len;
+ 
+     request = (s->setup_buf[0] << 8) | s->setup_buf[1];
+     value   = (s->setup_buf[3] << 8) | s->setup_buf[2];
+@@ -259,26 +261,28 @@ static void do_token_out(USBDevice *s, USBPacket *p)
+ static void do_parameter(USBDevice *s, USBPacket *p)
+ {
+     int i, request, value, index;
++    unsigned int setup_len;
+ 
+     for (i = 0; i < 8; i++) {
+         s->setup_buf[i] = p->parameter >> (i*8);
+     }
+ 
+     s->setup_state = SETUP_STATE_PARAM;
+-    s->setup_len   = (s->setup_buf[7] << 8) | s->setup_buf[6];
+     s->setup_index = 0;
+ 
+     request = (s->setup_buf[0] << 8) | s->setup_buf[1];
+     value   = (s->setup_buf[3] << 8) | s->setup_buf[2];
+     index   = (s->setup_buf[5] << 8) | s->setup_buf[4];
+ 
+-    if (s->setup_len > sizeof(s->data_buf)) {
++    setup_len = (s->setup_buf[7] << 8) | s->setup_buf[6];
++    if (setup_len > sizeof(s->data_buf)) {
+         fprintf(stderr,
+                 "usb_generic_handle_packet: ctrl buffer too small (%d > %zu)\n",
+-                s->setup_len, sizeof(s->data_buf));
++                setup_len, sizeof(s->data_buf));
+         p->status = USB_RET_STALL;
+         return;
+     }
++    s->setup_len = setup_len;
+ 
+     if (p->pid == USB_TOKEN_OUT) {
+         usb_packet_copy(p, s->data_buf, s->setup_len);
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-14415.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-14415.patch
new file mode 100644
index 0000000000..dca2f90a49
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-14415.patch
@@ -0,0 +1,37 @@
+From 7a4ede0047a8613b0e3b72c9d351038f013dd357 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Mon, 20 Jan 2020 11:18:04 +0100
+Subject: [PATCH] audio/oss: fix buffer pos calculation
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+Fixes: 3ba4066d085f ("ossaudio: port to the new audio backend api")
+Reported-by: ziming zhang <ezrakiez@gmail.com>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Message-Id: <20200120101804.29578-1-kraxel@redhat.com>
+Reviewed-by: Philippe Mathieu-DaudÃ© <philmd@redhat.com>
+
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=7a4ede0047a8613b0e3b72c9d351038f013dd357]
+CVE: CVE-2020-14415
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ audio/ossaudio.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/audio/ossaudio.c b/audio/ossaudio.c
+index c43faee..9456491 100644
+--- a/audio/ossaudio.c
++++ b/audio/ossaudio.c
+@@ -420,7 +420,7 @@ static size_t oss_write(HWVoiceOut *hw, void *buf, size_t len)
+             size_t to_copy = MIN(len, hw->size_emul - hw->pos_emul);
+             memcpy(hw->buf_emul + hw->pos_emul, buf, to_copy);
+ 
+-            hw->pos_emul = (hw->pos_emul + to_copy) % hw->pos_emul;
++            hw->pos_emul = (hw->pos_emul + to_copy) % hw->size_emul;
+             buf += to_copy;
+             len -= to_copy;
+         }
+-- 
+1.8.3.1
+
-- 
2.17.1


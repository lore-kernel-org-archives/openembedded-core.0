Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.8877.1599639105300676967
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 01:11:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: mH4J2qiWHNiJEqRZ7Zh+UO1qB/ocGjp4p3QxynlPd1m/lX16kqYSg7wx+l+ovA543NvEfCxJIJ
 InFrACWCUzEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="155767031"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="155767031"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 01:11:36 -0700
IronPort-SDR: mMyq9lSOvNA/cH5X3PKkRG5xAyGu1EwJiK+EMnU4jFPJC01y8he/m22K7JikLzGzvZsxU4Vzix
 /T/ONyQD4hzQ==
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="480371080"
Received: from rbint21-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.66.132])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 01:11:35 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 09/11] qemu: CVE-2020-14364
Date: Wed,  9 Sep 2020 16:11:11 +0800
Message-Id: <68afde919e31bb7acc7483548c22859a8860f6ef.1599638315.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599638315.git.anuj.mittal@intel.com>
References: <cover.1599638315.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Wang <li.wang@windriver.com>

Backport patch from:
https://git.qemu.org/?p=qemu.git;a=patch;h=b946434f2659a182afc17e155be6791ebfb302eb

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-14364.patch            | 93 +++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-14364.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 012be74855..ec32c90ad5 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -42,6 +42,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-16092.patch \
            file://CVE-2020-10756.patch \
            file://CVE-2020-15863.patch \
+           file://CVE-2020-14364.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-14364.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-14364.patch
new file mode 100644
index 0000000000..a109ac08d6
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
+CVE: CVE-2020-14364
+[https://git.qemu.org/?p=qemu.git;a=patch;h=b946434f2659a182afc17e155be6791ebfb302eb]
+Signed-off-by: Li Wang <li.wang@windriver.com>
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
+2.17.1
+
-- 
2.26.2


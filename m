Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.261.1599768096682829341
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 13:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 08AK1Y01017684
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 13:01:35 -0700 (PDT)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Thu, 10 Sep 2020
 13:01:34 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 20885)	id 317B5201DE;
 Thu, 10 Sep 2020 16:01:34 -0400 (EDT)
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Sakib Sajal <sakib.sajal@windriver.com>
Subject: [PATCH] qemu: fix CVE-2020-14364
Date: Thu, 10 Sep 2020 16:01:28 -0400
Message-ID: <20200910200128.32995-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Upstream-Status: Backport [b946434f2659a182afc17e155be6791ebfb302eb]

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...sb-fix-setup_len-init-CVE-2020-14364.patch | 88 +++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-usb-fix-setup_len-init-CVE-2020-14364.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 5599382a92..0d296089d0 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -30,6 +30,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-Add-enable-disable-udev.patch \
 	   file://0001-qemu-Do-not-include-file-if-not-exists.patch \
 	   file://find_datadir.patch \
+	   file://0001-usb-fix-setup_len-init-CVE-2020-14364.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-usb-fix-setup_len-init-CVE-2020-14364.patch b/meta/recipes-devtools/qemu/qemu/0001-usb-fix-setup_len-init-CVE-2020-14364.patch
new file mode 100644
index 0000000000..3915d2511f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-usb-fix-setup_len-init-CVE-2020-14364.patch
@@ -0,0 +1,88 @@
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
+---
+ hw/usb/core.c | 16 ++++++++++------
+ 1 file changed, 10 insertions(+), 6 deletions(-)
+
+diff --git a/hw/usb/core.c b/hw/usb/core.c
+index 5abd128b6b..5234dcc73f 100644
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
+2.20.1
+
-- 
2.27.0


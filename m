Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.29866.1599185985584201680
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2020 19:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: li.wang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0842JDqg021078
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Sep 2020 19:19:34 -0700
Received: from bfbf5eb70dd2.wrs.com (128.224.162.178) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 3 Sep 2020 19:19:19 -0700
From: "Li Wang" <li.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][zeus][PATCH] qemu: CVE-2020-14364
Date: Fri, 4 Sep 2020 02:16:08 +0000
Message-ID: <20200904021608.653-1-li.wang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Backport patch from:
https://git.qemu.org/?p=qemu.git;a=patch;h=b946434f2659a182afc17e155be6791ebfb302eb

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-14364.patch            | 93 +++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-14364.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 5cdba1f02c..59f6932b3d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -39,6 +39,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2020-11869.patch \
            file://CVE-2020-13765.patch \
            file://CVE-2020-10702.patch \
+	   file://CVE-2020-14364.patch \
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
2.17.1


Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.1363.1599771857924530420
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 14:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60408113E
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 14:04:17 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03CEA3F73C
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 14:04:16 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] qemu: fix CVE-2020-14364
Date: Thu, 10 Sep 2020 22:04:10 +0100
Message-Id: <20200910210413.926242-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Backport a patch from upstream to fix CVE-2020-14364.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  7 +-
 .../qemu/qemu/usb-fix-setup_len-init.patch    | 89 +++++++++++++++++++
 2 files changed, 93 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/usb-fix-setup_len-ini=
t.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 5599382a92..9091115caf 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -28,9 +28,10 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.ta=
r.xz \
            file://0009-Fix-webkitgtk-builds.patch \
            file://0010-configure-Add-pkg-config-handling-for-libgcrypt.p=
atch \
            file://0001-Add-enable-disable-udev.patch \
-	   file://0001-qemu-Do-not-include-file-if-not-exists.patch \
-	   file://find_datadir.patch \
-	   "
+           file://0001-qemu-Do-not-include-file-if-not-exists.patch \
+           file://find_datadir.patch \
+           file://usb-fix-setup_len-init.patch \
+           "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
 SRC_URI[sha256sum] =3D "c9174eb5933d9eb5e61f541cd6d1184cd3118dfe4c5c4955=
bc1bdc4d390fa4e5"
diff --git a/meta/recipes-devtools/qemu/qemu/usb-fix-setup_len-init.patch=
 b/meta/recipes-devtools/qemu/qemu/usb-fix-setup_len-init.patch
new file mode 100644
index 0000000000..92801da46f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/usb-fix-setup_len-init.patch
@@ -0,0 +1,89 @@
+CVE: CVE-2020-14364
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
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
+index 5abd128b6bc..5234dcc73fe 100644
+--- a/hw/usb/core.c
++++ b/hw/usb/core.c
+@@ -129,6 +129,7 @@ void usb_wakeup(USBEndpoint *ep, unsigned int stream=
)
+ static void do_token_setup(USBDevice *s, USBPacket *p)
+ {
+     int request, value, index;
++    unsigned int setup_len;
+=20
+     if (p->iov.size !=3D 8) {
+         p->status =3D USB_RET_STALL;
+@@ -138,14 +139,15 @@ static void do_token_setup(USBDevice *s, USBPacket=
 *p)
+     usb_packet_copy(p, s->setup_buf, p->iov.size);
+     s->setup_index =3D 0;
+     p->actual_length =3D 0;
+-    s->setup_len   =3D (s->setup_buf[7] << 8) | s->setup_buf[6];
+-    if (s->setup_len > sizeof(s->data_buf)) {
++    setup_len =3D (s->setup_buf[7] << 8) | s->setup_buf[6];
++    if (setup_len > sizeof(s->data_buf)) {
+         fprintf(stderr,
+                 "usb_generic_handle_packet: ctrl buffer too small (%d >=
 %zu)\n",
+-                s->setup_len, sizeof(s->data_buf));
++                setup_len, sizeof(s->data_buf));
+         p->status =3D USB_RET_STALL;
+         return;
+     }
++    s->setup_len =3D setup_len;
+=20
+     request =3D (s->setup_buf[0] << 8) | s->setup_buf[1];
+     value   =3D (s->setup_buf[3] << 8) | s->setup_buf[2];
+@@ -259,26 +261,28 @@ static void do_token_out(USBDevice *s, USBPacket *=
p)
+ static void do_parameter(USBDevice *s, USBPacket *p)
+ {
+     int i, request, value, index;
++    unsigned int setup_len;
+=20
+     for (i =3D 0; i < 8; i++) {
+         s->setup_buf[i] =3D p->parameter >> (i*8);
+     }
+=20
+     s->setup_state =3D SETUP_STATE_PARAM;
+-    s->setup_len   =3D (s->setup_buf[7] << 8) | s->setup_buf[6];
+     s->setup_index =3D 0;
+=20
+     request =3D (s->setup_buf[0] << 8) | s->setup_buf[1];
+     value   =3D (s->setup_buf[3] << 8) | s->setup_buf[2];
+     index   =3D (s->setup_buf[5] << 8) | s->setup_buf[4];
+=20
+-    if (s->setup_len > sizeof(s->data_buf)) {
++    setup_len =3D (s->setup_buf[7] << 8) | s->setup_buf[6];
++    if (setup_len > sizeof(s->data_buf)) {
+         fprintf(stderr,
+                 "usb_generic_handle_packet: ctrl buffer too small (%d >=
 %zu)\n",
+-                s->setup_len, sizeof(s->data_buf));
++                setup_len, sizeof(s->data_buf));
+         p->status =3D USB_RET_STALL;
+         return;
+     }
++    s->setup_len =3D setup_len;
+=20
+     if (p->pid =3D=3D USB_TOKEN_OUT) {
+         usb_packet_copy(p, s->data_buf, s->setup_len);
--=20
2.28.0


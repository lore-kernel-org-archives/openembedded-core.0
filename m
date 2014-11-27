Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 73E6072380
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 14:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sARE45en011155 for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 14:04:05 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Th6xhgWM0q-j
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 14:04:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sARE3r1D011152
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 14:04:04 GMT
Message-ID: <1417097069.15614.9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Nov 2014 14:04:29 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] qemu: Add missing wacom HID descriptor
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Nov 2014 14:04:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The wacom driver we use is missing a HID descriptor causing it not to work
with 3.17 kernels and later. This patch adds in a descriptor to make the
driver work again.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index c8b400a..3f68a56 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -16,6 +16,7 @@ SRC_URI = "\
     file://larger_default_ram_size.patch \
     file://disable-grabs.patch \
     file://exclude-some-arm-EABI-obsolete-syscalls.patch \
+    file://wacom.patch \
     "
 
 SRC_URI_append_class-native = "\
diff --git a/meta/recipes-devtools/qemu/qemu/wacom.patch b/meta/recipes-devtools/qemu/qemu/wacom.patch
new file mode 100644
index 0000000..cd06aa4
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/wacom.patch
@@ -0,0 +1,130 @@
+The USB wacom device is missing a HID descriptor which causes it
+to fail to operate with recent kernels (e.g. 3.17).
+
+This patch adds a HID desriptor to the device, based upon one from 
+real wcom device.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Upstream-Status: Submitted
+2014/11/27
+
+Index: qemu-2.1.0/hw/usb/dev-wacom.c
+===================================================================
+--- qemu-2.1.0.orig/hw/usb/dev-wacom.c	2014-08-01 15:12:17.000000000 +0100
++++ qemu-2.1.0/hw/usb/dev-wacom.c	2014-10-12 12:13:30.540306042 +0100
+@@ -68,6 +68,89 @@
+     [STR_SERIALNUMBER]     = "1",
+ };
+ 
++static const uint8_t qemu_tablet_hid_report_descriptor[] = {
++    0x05, 0x01,		/* Usage Page (Generic Desktop) */
++    0x09, 0x02,		/* Usage (Mouse) */
++    0xa1, 0x01,		/* Collection (Application) */
++    0x85, 0x01,		/*   Report ID (1) */ 
++    0x09, 0x01,		/*   Usage (Pointer) */
++    0xa1, 0x00,		/*   Collection (Physical) */
++    0x05, 0x09,		/*     Usage Page (Button) */
++    0x19, 0x01,		/*     Usage Minimum (1) */
++    0x29, 0x05,		/*     Usage Maximum (5) */
++    0x15, 0x00,		/*     Logical Minimum (0) */
++    0x25, 0x01,		/*     Logical Maximum (1) */
++    0x95, 0x05,		/*     Report Count (5) */
++    0x75, 0x01,		/*     Report Size (1) */
++    0x81, 0x02,		/*     Input (Data, Variable, Absolute) */
++    0x95, 0x01,		/*     Report Count (1) */
++    0x75, 0x03,		/*     Report Size (3) */
++    0x81, 0x01,		/*     Input (Constant) */
++    0x05, 0x01,		/*     Usage Page (Generic Desktop) */
++    0x09, 0x30,		/*     Usage (X) */
++    0x09, 0x31,		/*     Usage (Y) */
++    0x15, 0x81,		/*     Logical Minimum (-127) */
++    0x25, 0x7f,		/*     Logical Maximum (127) */
++    0x75, 0x08,		/*     Report Size (8) */
++    0x95, 0x02,		/*     Report Count (2) */
++    0x81, 0x06,		/*     Input (Data, Variable, Relative) */
++    0xc0,		/*   End Collection */
++    0xc0,		/* End Collection */
++    0x05, 0x0d,		/* Usage Page (Digitizer) */
++    0x09, 0x01,		/* Usage (Digitizer) */
++    0xa1, 0x01,		/* Collection (Application) */
++    0x85, 0x02,		/*   Report ID (2) */ 
++    0xa1, 0x00,		/*   Collection (Physical) */
++    0x06, 0x00, 0xff,   /*   Usage Page (Vendor 0xff00) */
++    0x09, 0x01, 	/*   Usage (Digitizer) */
++    0x15, 0x00, 	/*     Logical Minimum (0) */
++    0x26, 0xff, 0x00,	/*     Logical Maximum (255) */
++    0x75, 0x08,		/*     Report Size (8) */
++    0x95, 0x08,		/*     Report Count (8) */
++    0x81, 0x02,		/*     Input (Data, Variable, Absolute) */
++    0xc0, 		/*   End Collection */
++    0x09, 0x01,		/*   Usage (Digitizer) */
++    0x85, 0x02, 	/*   Report ID (2) */ 
++    0x95, 0x01,		/*   Report Count (1) */
++    0xb1, 0x02,		/*   FEATURE (2) */
++    0xc0,		/* End Collection */
++    0x06, 0x00, 0xff,	/* Usage Page (Vendor 0xff00) */
++    0x09, 0x01,		/* Usage (Digitizer) */
++    0xa1, 0x01,		/* Collection (Application) */
++    0x85, 0x02,   	/*   Report ID (2) */ 
++    0x05, 0x0d,		/*   Usage Page (Digitizer)  */
++    0x09, 0x22, 	/*   Usage (Finger) */
++    0xa1, 0x00,  	/*   Collection (Physical) */
++    0x06, 0x00, 0xff,	/*   Usage Page (Vendor 0xff00) */
++    0x09, 0x01,		/*     Usage (Digitizer) */
++    0x15, 0x00, 	/*     Logical Minimum (0) */
++    0x26, 0xff, 0x00,  	/*     Logical Maximum */
++    0x75, 0x08,		/*     Report Size (8) */
++    0x95, 0x02,		/*     Report Count (2) */
++    0x81, 0x02, 	/*     Input (Data, Variable, Absolute) */
++    0x05, 0x01,		/*     Usage Page (Generic Desktop) */
++    0x09, 0x30,		/*     Usage (X) */
++    0x35, 0x00, 	/*     Physical Minimum */
++    0x46, 0xe0, 0x2e,	/*     Physical Maximum */
++    0x26, 0xe0, 0x01,   /*     Logical Maximum */
++    0x75, 0x10,		/*     Report Size (16) */
++    0x95, 0x01,		/*     Report Count (1) */
++    0x81, 0x02,		/*     Input (Data, Variable, Absolute) */
++    0x09, 0x31,		/*     Usage (Y) */
++    0x46, 0x40, 0x1f, 	/*     Physical Maximum */
++    0x26, 0x40, 0x01, 	/*     Logical Maximum */
++    0x81, 0x02, 	/*     Input (Data, Variable, Absolute) */
++    0x06, 0x00, 0xff,	/*     Usage Page (Vendor 0xff00) */
++    0x09, 0x01, 	/*     Usage (Digitizer) */
++    0x26, 0xff, 0x00,  	/*     Logical Maximum */
++    0x75, 0x08,		/*     Report Size (8) */
++    0x95, 0x0d,		/*     Report Count (13) */
++    0x81, 0x02,		/*     Input (Data, Variable, Absolute) */
++    0xc0,		/*   End Collection */ 
++    0xc0,		/* End Collection */
++};
++
++
+ static const USBDescIface desc_iface_wacom = {
+     .bInterfaceNumber              = 0,
+     .bNumEndpoints                 = 1,
+@@ -85,7 +168,7 @@
+                 0x00,          /*  u8  country_code */
+                 0x01,          /*  u8  num_descriptors */
+                 0x22,          /*  u8  type: Report */
+-                0x6e, 0,       /*  u16 len */
++                sizeof(qemu_tablet_hid_report_descriptor), 0, /*  u16 len */
+             },
+         },
+     },
+@@ -265,6 +350,15 @@
+     }
+ 
+     switch (request) {
++    case InterfaceRequest | USB_REQ_GET_DESCRIPTOR:
++        switch (value >> 8) {
++        case 0x22:
++                memcpy(data, qemu_tablet_hid_report_descriptor,
++                       sizeof(qemu_tablet_hid_report_descriptor));
++                p->actual_length = sizeof(qemu_tablet_hid_report_descriptor);
++            break;
++        }
++        break;
+     case WACOM_SET_REPORT:
+         if (s->mouse_grabbed) {
+             qemu_remove_mouse_event_handler(s->eh_entry);




Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web12.173.1630174403449307905
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=w+ebWa2p;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.51, mailfrom: steve@sakoman.com)
Received: by mail-io1-f51.google.com with SMTP id q3so13533794iot.3
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IbSESFfzhcq1lGJIYSYEghK6/NEgrY+/HL+ZWpclPBI=;
        b=w+ebWa2p0syqTaZo6lfjRsM0JDfMRg/g7ov0v7n5kvg/ujii/fWrfAXUh8FSzaLEjX
         A6ZSrG0dPXmHqwTiuzSu2msrzK9rSEN1u5iXQ9Liyqgg5MnCkScbpHUvI6gng+ibIqA+
         ifrd503TRkqa0LfHzVU/dYbUzc16mGNSaljfW6UqN3wpH6jfoVH1qFBYjBxGDrG/AjSf
         AsSaAp6BrubTkfpMfSzcQckEY/+a+boqf4Rg+NZABj9Hh4dv1zSYjm4Jkd8aLw0Glz6Z
         iM2DvT0BrZ4Ng7IYvIOeDjDHxjKm/pEsZ+cULb6d3MrBWpOY4/2b6oOyeJ4g64qSjp0c
         O5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IbSESFfzhcq1lGJIYSYEghK6/NEgrY+/HL+ZWpclPBI=;
        b=lroo5W3CMViqRn2ZLKREZ/B7vns2I2hH5m6gM43pvsPyjsCNj4PeGtSBWCYtScRZd7
         dS+bybqjzWc06jXPq0vRrUbx+ZfFLjiI8Ld+wKosqbaE6nQJjETzhDW7dX0SNc0yanq2
         fVCd/M9prIOcSW711+j64hUSxusw/2LNGs0raVYk70U8mneNmp9rgMgbCEmwPvatPSzj
         zxKQje/P9d7sGeTZL8wACPCwZ74t/8JlO0LbwXTqf2vLHaOFl7usD3uTy0zKaA7cMcDW
         9fxG9YVBwuciM82T7fBeiwPui4HhPcMljgY7JfsBAlqzVQCOVnEs4NOvLlZo/SxuCty2
         bwLg==
X-Gm-Message-State: AOAM531f0wetCk7t4hA02wLFroMqgydGH28uBrPXeJwTScIIK42mbPma
	Ryr9tb4d085Wo74atB0RLdrn5VvPGmQZPNVS
X-Google-Smtp-Source: ABdhPJzIQLG+kV40dJjezGSe3uB3/KT95aeDZ4UCT8SRXjnzi1xeNPrXu8dA5ZNtBBWGN2jobjcrUg==
X-Received: by 2002:a02:a81a:: with SMTP id f26mr13229338jaj.79.1630174402057;
        Sat, 28 Aug 2021 11:13:22 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.13.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:13:21 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/36] qemu: fix CVE-2021-3527
Date: Sat, 28 Aug 2021 08:11:06 -1000
Message-Id: <1c7e9099b5f417a7e7664ce3572b2098e2ebbbf7.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

Source: http://git.yoctoproject.org/cgit/poky.git
MR: 111827
Type: Security Fix
Disposition: Backport from http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-devtools/qemu?h=hardknott&id=45e06a2e02cb01540d3970bd8ab5771014a031f9
ChangeID: 33bb20f503888abc346ae1a6f590f57ebdd0f1f9
Description:

(cherry picked from commit 6774efd1e3d0bd5c8c34f84dcf4f698d7eafb36a)
(From OE-Core rev: fcbcd27a1c97668af9634143376f75ab32fffd68)

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 45e06a2e02cb01540d3970bd8ab5771014a031f9)
[Fixup for Dunfell context]
Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  2 +
 .../qemu/qemu/CVE-2021-3527-1.patch           | 42 +++++++++++++
 .../qemu/qemu/CVE-2021-3527-2.patch           | 59 +++++++++++++++++++
 3 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3527-1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3527-2.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 028b81ee34..78e487fc6f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -79,6 +79,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3544_5.patch \
            file://CVE-2021-3545.patch \
            file://CVE-2021-3546.patch \
+           file://CVE-2021-3527-1.patch \
+           file://CVE-2021-3527-2.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3527-1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3527-1.patch
new file mode 100644
index 0000000000..77a5385692
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3527-1.patch
@@ -0,0 +1,42 @@
+From 05a40b172e4d691371534828078be47e7fff524c Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Mon, 3 May 2021 15:29:15 +0200
+Subject: [PATCH] usb: limit combined packets to 1 MiB (CVE-2021-3527)
+
+usb-host and usb-redirect try to batch bulk transfers by combining many
+small usb packets into a single, large transfer request, to reduce the
+overhead and improve performance.
+
+This patch adds a size limit of 1 MiB for those combined packets to
+restrict the host resources the guest can bind that way.
+
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Message-Id: <20210503132915.2335822-6-kraxel@redhat.com>
+
+Upstream-Status: Backport
+https://gitlab.com/qemu-project/qemu/-/commit/05a40b172e4d691371534828078be47e7fff524c
+CVE: CVE-2021-3527
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ hw/usb/combined-packet.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/hw/usb/combined-packet.c b/hw/usb/combined-packet.c
+index 5d57e883dc..e56802f89a 100644
+--- a/hw/usb/combined-packet.c
++++ b/hw/usb/combined-packet.c
+@@ -171,7 +171,9 @@ void usb_ep_combine_input_packets(USBEndpoint *ep)
+         if ((p->iov.size % ep->max_packet_size) != 0 || !p->short_not_ok ||
+                 next == NULL ||
+                 /* Work around for Linux usbfs bulk splitting + migration */
+-                (totalsize == (16 * KiB - 36) && p->int_req)) {
++                (totalsize == (16 * KiB - 36) && p->int_req) ||
++                /* Next package may grow combined package over 1MiB */
++                totalsize > 1 * MiB - ep->max_packet_size) {
+             usb_device_handle_data(ep->dev, first);
+             assert(first->status == USB_RET_ASYNC);
+             if (first->combined) {
+-- 
+GitLab
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3527-2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3527-2.patch
new file mode 100644
index 0000000000..6371aced12
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3527-2.patch
@@ -0,0 +1,59 @@
+From 7ec54f9eb62b5d177e30eb8b1cad795a5f8d8986 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Mon, 3 May 2021 15:29:12 +0200
+Subject: [PATCH] usb/redir: avoid dynamic stack allocation (CVE-2021-3527)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Use autofree heap allocation instead.
+
+Fixes: 4f4321c11ff ("usb: use iovecs in USBPacket")
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Message-Id: <20210503132915.2335822-3-kraxel@redhat.com>
+
+Upstream-Status: Backport
+https://gitlab.com/qemu-project/qemu/-/commit/7ec54f9eb62b5d177e30eb8b1cad795a5f8d8986
+CVE: CVE-2021-3527
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ hw/usb/redirect.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
+index 17f06f3417..6a75b0dc4a 100644
+--- a/hw/usb/redirect.c
++++ b/hw/usb/redirect.c
+@@ -620,7 +620,7 @@ static void usbredir_handle_iso_data(USBRedirDevice *dev, USBPacket *p,
+                 .endpoint = ep,
+                 .length = p->iov.size
+             };
+-            uint8_t buf[p->iov.size];
++            g_autofree uint8_t *buf = g_malloc(p->iov.size);
+             /* No id, we look at the ep when receiving a status back */
+             usb_packet_copy(p, buf, p->iov.size);
+             usbredirparser_send_iso_packet(dev->parser, 0, &iso_packet,
+@@ -818,7 +818,7 @@ static void usbredir_handle_bulk_data(USBRedirDevice *dev, USBPacket *p,
+         usbredirparser_send_bulk_packet(dev->parser, p->id,
+                                         &bulk_packet, NULL, 0);
+     } else {
+-        uint8_t buf[size];
++        g_autofree uint8_t *buf = g_malloc(size);
+         usb_packet_copy(p, buf, size);
+         usbredir_log_data(dev, "bulk data out:", buf, size);
+         usbredirparser_send_bulk_packet(dev->parser, p->id,
+@@ -923,7 +923,7 @@ static void usbredir_handle_interrupt_out_data(USBRedirDevice *dev,
+                                                USBPacket *p, uint8_t ep)
+ {
+     struct usb_redir_interrupt_packet_header interrupt_packet;
+-    uint8_t buf[p->iov.size];
++    g_autofree uint8_t *buf = g_malloc(p->iov.size);
+ 
+     DPRINTF("interrupt-out ep %02X len %zd id %"PRIu64"\n", ep,
+             p->iov.size, p->id);
+-- 
+GitLab
+
-- 
2.25.1


Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.2625.1629829114430419369
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 11:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HD2HWWvn;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id n13-20020a17090a4e0d00b0017946980d8dso2346770pjh.5
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 11:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gT1oOcTGWoaou4+ZMRI/N5zHH+nnCi2aJcy0JQe5nmg=;
        b=HD2HWWvnbRrOv/z6A5ihOqI/nkGkFToK6tvUN9E5bLe4nfIuSb4Dgz7o2kIUMBFDqI
         GQrNsi8AGdlA7rltEuLpW83B5xxKOsXaQIs1kJnT74L5x5/ktgETc7hLDEMdncJ+uPDN
         OcndKxetl5yW35zHNs6arV/xHws6ImNvx5RbbqhuFlWj5JrHRn+HIxvWv5kPjMlfZBrJ
         sXSOt2D1oYl37SU3dsziEPhimc5awtFjSN9lB5utGTElGZtpmvlK9d+ndSQsv4tPT9Su
         2G2bl8UCm34PVKcZwYdatOhFVrvq/Zj2iSIBE6deRevPf/G73tYho+WfPTxSJ7EYJ033
         lo3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gT1oOcTGWoaou4+ZMRI/N5zHH+nnCi2aJcy0JQe5nmg=;
        b=MOr3qBOrt5lOxSfxIUSXZdHy25x4fA7Zx3mVxQe4CkZElZj32KOLXGT19xGrvy3ips
         rjI48IQ2iqRz7onR/VoJ2a5mPddj/mDPoDcQmgrRVTA1ky41vFsZEzBap2a3y+GH2Tgy
         MBDTM8BZIhuBjY8vtUdGBF07IEALtUOXcLHdkOEvwZU6gK/l+HF2jaKYmVxxXkUSERXJ
         voJm/o0G+GHTIsBPgM+Ak0bzkbY6iDjWUMqsHvTuEr97BPSH8vOoM8pj29q8YJQWSiUS
         ZDge08iZ05Ruj4EAkUwwjm96IzhaBlf9v/ynX2lEfOBoS9Whwq6kCFCkvlFEzI4pyWRS
         +x0Q==
X-Gm-Message-State: AOAM533HgT5jnHc2YRduaFXFNYXj0sjA5Td2wFE3Y5HVHqxd8K0YKWDM
	liwkZSLOjDgE7whzk7UfQKK7VFZa9g4=
X-Google-Smtp-Source: ABdhPJwh0TkKo77jqIasxTd2Q9UbstTJHeQ8tJ31x3XcYSu+o2sFFlntKsLLbaaZ2+8KNKeeLfGMOA==
X-Received: by 2002:a17:902:a5c5:b029:12c:a867:a839 with SMTP id t5-20020a170902a5c5b029012ca867a839mr34505984plq.71.1629829113569;
        Tue, 24 Aug 2021 11:18:33 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:35b6:3d86:f2de:f7d2])
        by smtp.gmail.com with ESMTPSA id g26sm23416734pgb.45.2021.08.24.11.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 11:18:33 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Lee Chee Yang <chee.yang.lee@intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Anuj Mittal <anuj.mittal@intel.com>,
	Armin Kuster <akuster@mvista.com>
Subject: [Dunfell][PATCH 1/4] qemu: fix CVE-2021-3527
Date: Tue, 24 Aug 2021 11:18:28 -0700
Message-Id: <20210824181831.1045731-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
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


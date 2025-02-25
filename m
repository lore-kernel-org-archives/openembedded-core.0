Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40FAFC021BF
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:30:12 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.9017.1740493809560360519
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 06:30:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Nw/sHHBi;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2230c74c8b6so20479295ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740493809; x=1741098609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8H3d9mTzUJ6fHRXF/IVlzFljd95xJYHCM0SHeF6j5dg=;
        b=Nw/sHHBiHGPYGEYpIPD491jWBvD3WUkCoy6u3dzYEUFJgk6voL947E0Yz8XG9MF6EH
         6SlAa3JgwDrt9jo45zN9n/Oq0GLzymgJYb2DzSEuHLPDc/1tfJso2MAP0IZcyFABqkXX
         fGw/ZqhAh8jusMRRPGF+MubceR9azpUvXKyq037UUn3QIBTFpypc+hYwnMQ01LG6lGJx
         CXIMGYRTagXYxzAjrImiGT4kgHIugzPbo1Rv0kuIz4lxrJKC4A3IUiNZZATHrDNt5L4R
         fMKmy892tFg9oYG/7yMAZo1iMlIz7rl3H1S5Uc8z70/7mqzmmnzXagrcjaaBhDl7hsTk
         uPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740493809; x=1741098609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8H3d9mTzUJ6fHRXF/IVlzFljd95xJYHCM0SHeF6j5dg=;
        b=B7nyykG4oQSGGwsU91lWdwhzD7j7miq8uEINu4v1C1ZmIbaSYeD2xiCts7OibEuxKZ
         4axbOTNNM0np72ZJT9Wb4d+iJMjAgv5BHK1hpLIF6MySJz9vn5/Rm8IK9eiB2+shyHPO
         0sExk5NfVdLBAZVpcnH3QI/dQDtN1BclN1+Iqp3QzFWvx3t3oJNgIUpwqCYYm2M4Dajk
         gF00LWc/xpgXZr4ZQYENR7dO39J8Ut4a85irSYJJZZ3wpDY0GPbYViYezbLhZFudp9XY
         H4UE1m9/61LpBTzwOvr5W0ItnERiF7TEaMQjuKhKNL4ou1s5yEH4B6QGi0dpq80GmN6Z
         jgpQ==
X-Gm-Message-State: AOJu0YxZkvVebB/cBsUTwJteIMpO4T3tMs8EZiyHrNKu8OTJXC4+sj7E
	RUCbGsFqHZt8xouVje+iR2qF4lPKQH5n25OY6TYUi4I3hBy8vrGv88hr/i/V/A/QRmrOlX96HYb
	N
X-Gm-Gg: ASbGncuRXFQv0Yqc9AtZSD2zfDzIvBpUkp6QEhQYWWB1HgnMBpoiPRqqoOsrbaQ/Nwd
	gv/i/Uux8rm7tSvHft0t1c1EvCnSUs9u5LOLTGaHzVjrira++BYHYzUNUhoTT/gJ/FfBFrU5C50
	4cKgDfwjYF8pfXAN6F4LJYzyci5jpf0aC1sCH2Ug5Qa51WgyvN49i3KthpSK0tQAn2UY7IHbgQS
	bhoD5iilIFirzj7S5XpzFOWRDJ0f1KLNJlnPSYW5YaGcl+vaZSKsY0mLbRWEobLmnAVmeXfOkxG
	Qoiq38DjGFAKooqhxQ==
X-Google-Smtp-Source: AGHT+IE6Ivn+Cua5RaMKYCK79/x9axyVGfSYob6EmwB6p5RtHwvJfnstzAor3DLny94juk2YUvietg==
X-Received: by 2002:a05:6a00:80e:b0:730:74f8:25c8 with SMTP id d2e1a72fcca58-73479109825mr4975611b3a.11.1740493808405;
        Tue, 25 Feb 2025 06:30:08 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81ed10sm1535650b3a.129.2025.02.25.06.30.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:30:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/22] u-boot: fix CVE-2022-2347 and CVE-2022-30790
Date: Tue, 25 Feb 2025 06:29:37 -0800
Message-ID: <7a5220a4877cd4d3766728e8a3525c157b6167fb.1740493685.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740493685.git.steve@sakoman.com>
References: <cover.1740493685.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211887

From: Sakib Sajal <sakib.sajal@windriver.com>

Backport appropriate patches to fix CVE-2022-2347 and CVE-2022-30790.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../u-boot/files/CVE-2022-2347_1.patch        | 129 +++++++++++++++
 .../u-boot/files/CVE-2022-2347_2.patch        |  66 ++++++++
 .../u-boot/files/CVE-2022-30790.patch         | 149 ++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |   3 +
 4 files changed, 347 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2022-2347_1.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2022-2347_2.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2022-30790.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2022-2347_1.patch b/meta/recipes-bsp/u-boot/files/CVE-2022-2347_1.patch
new file mode 100644
index 0000000000..34ee82c3a5
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2022-2347_1.patch
@@ -0,0 +1,129 @@
+From 9d2d2deabc49dbedf93a7192b25f55d9933fcede Mon Sep 17 00:00:00 2001
+From: Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>
+Date: Thu, 3 Nov 2022 09:37:48 +0530
+Subject: [PATCH 1/2] usb: gadget: dfu: Fix the unchecked length field
+
+DFU implementation does not bound the length field in USB
+DFU download setup packets, and it does not verify that
+the transfer direction. Fixing the length and transfer
+direction.
+
+CVE-2022-2347
+
+Signed-off-by: Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>
+Reviewed-by: Marek Vasut <marex@denx.de>
+
+CVE: CVE-2022-2347
+Upstream-Status: Backport [fbce985e28eaca3af82afecc11961aadaf971a7e]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ drivers/usb/gadget/f_dfu.c | 56 +++++++++++++++++++++++++-------------
+ 1 file changed, 37 insertions(+), 19 deletions(-)
+
+diff --git a/drivers/usb/gadget/f_dfu.c b/drivers/usb/gadget/f_dfu.c
+index 4bedc7d3a1..33ef62f8ba 100644
+--- a/drivers/usb/gadget/f_dfu.c
++++ b/drivers/usb/gadget/f_dfu.c
+@@ -321,21 +321,29 @@ static int state_dfu_idle(struct f_dfu *f_dfu,
+ 	u16 len = le16_to_cpu(ctrl->wLength);
+ 	int value = 0;
+ 
++	len = len > DFU_USB_BUFSIZ ? DFU_USB_BUFSIZ : len;
++
+ 	switch (ctrl->bRequest) {
+ 	case USB_REQ_DFU_DNLOAD:
+-		if (len == 0) {
+-			f_dfu->dfu_state = DFU_STATE_dfuERROR;
+-			value = RET_STALL;
+-			break;
++		if (ctrl->bRequestType == USB_DIR_OUT) {
++			if (len == 0) {
++				f_dfu->dfu_state = DFU_STATE_dfuERROR;
++				value = RET_STALL;
++				break;
++			}
++			f_dfu->dfu_state = DFU_STATE_dfuDNLOAD_SYNC;
++			f_dfu->blk_seq_num = w_value;
++			value = handle_dnload(gadget, len);
+ 		}
+-		f_dfu->dfu_state = DFU_STATE_dfuDNLOAD_SYNC;
+-		f_dfu->blk_seq_num = w_value;
+-		value = handle_dnload(gadget, len);
+ 		break;
+ 	case USB_REQ_DFU_UPLOAD:
+-		f_dfu->dfu_state = DFU_STATE_dfuUPLOAD_IDLE;
+-		f_dfu->blk_seq_num = 0;
+-		value = handle_upload(req, len);
++		if (ctrl->bRequestType == USB_DIR_IN) {
++			f_dfu->dfu_state = DFU_STATE_dfuUPLOAD_IDLE;
++			f_dfu->blk_seq_num = 0;
++			value = handle_upload(req, len);
++			if (value >= 0 && value < len)
++				f_dfu->dfu_state = DFU_STATE_dfuIDLE;
++		}
+ 		break;
+ 	case USB_REQ_DFU_ABORT:
+ 		/* no zlp? */
+@@ -424,11 +432,15 @@ static int state_dfu_dnload_idle(struct f_dfu *f_dfu,
+ 	u16 len = le16_to_cpu(ctrl->wLength);
+ 	int value = 0;
+ 
++	len = len > DFU_USB_BUFSIZ ? DFU_USB_BUFSIZ : len;
++
+ 	switch (ctrl->bRequest) {
+ 	case USB_REQ_DFU_DNLOAD:
+-		f_dfu->dfu_state = DFU_STATE_dfuDNLOAD_SYNC;
+-		f_dfu->blk_seq_num = w_value;
+-		value = handle_dnload(gadget, len);
++		if (ctrl->bRequestType == USB_DIR_OUT) {
++			f_dfu->dfu_state = DFU_STATE_dfuDNLOAD_SYNC;
++			f_dfu->blk_seq_num = w_value;
++			value = handle_dnload(gadget, len);
++		}
+ 		break;
+ 	case USB_REQ_DFU_ABORT:
+ 		f_dfu->dfu_state = DFU_STATE_dfuIDLE;
+@@ -511,13 +523,17 @@ static int state_dfu_upload_idle(struct f_dfu *f_dfu,
+ 	u16 len = le16_to_cpu(ctrl->wLength);
+ 	int value = 0;
+ 
++	len = len > DFU_USB_BUFSIZ ? DFU_USB_BUFSIZ : len;
++
+ 	switch (ctrl->bRequest) {
+ 	case USB_REQ_DFU_UPLOAD:
+-		/* state transition if less data then requested */
+-		f_dfu->blk_seq_num = w_value;
+-		value = handle_upload(req, len);
+-		if (value >= 0 && value < len)
+-			f_dfu->dfu_state = DFU_STATE_dfuIDLE;
++		if (ctrl->bRequestType == USB_DIR_IN) {
++			/* state transition if less data then requested */
++			f_dfu->blk_seq_num = w_value;
++			value = handle_upload(req, len);
++			if (value >= 0 && value < len)
++				f_dfu->dfu_state = DFU_STATE_dfuIDLE;
++		}
+ 		break;
+ 	case USB_REQ_DFU_ABORT:
+ 		f_dfu->dfu_state = DFU_STATE_dfuIDLE;
+@@ -593,6 +609,8 @@ dfu_handle(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
+ 	int value = 0;
+ 	u8 req_type = ctrl->bRequestType & USB_TYPE_MASK;
+ 
++	len = len > DFU_USB_BUFSIZ ? DFU_USB_BUFSIZ : len;
++
+ 	debug("w_value: 0x%x len: 0x%x\n", w_value, len);
+ 	debug("req_type: 0x%x ctrl->bRequest: 0x%x f_dfu->dfu_state: 0x%x\n",
+ 	       req_type, ctrl->bRequest, f_dfu->dfu_state);
+@@ -612,7 +630,7 @@ dfu_handle(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
+ 		value = dfu_state[f_dfu->dfu_state] (f_dfu, ctrl, gadget, req);
+ 
+ 	if (value >= 0) {
+-		req->length = value;
++		req->length = value > DFU_USB_BUFSIZ ? DFU_USB_BUFSIZ : value;
+ 		req->zero = value < len;
+ 		value = usb_ep_queue(gadget->ep0, req, 0);
+ 		if (value < 0) {
+-- 
+2.32.0
+
diff --git a/meta/recipes-bsp/u-boot/files/CVE-2022-2347_2.patch b/meta/recipes-bsp/u-boot/files/CVE-2022-2347_2.patch
new file mode 100644
index 0000000000..708c7923d2
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2022-2347_2.patch
@@ -0,0 +1,66 @@
+From 0f465b3e81baa095b62a154a739c5378285526db Mon Sep 17 00:00:00 2001
+From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+Date: Wed, 30 Nov 2022 09:29:16 +0100
+Subject: [PATCH 2/2] usb: gadget: dfu: Fix check of transfer direction
+
+Commit fbce985e28eaca3af82afecc11961aadaf971a7e to fix CVE-2022-2347
+blocks DFU usb requests.
+The verification of the transfer direction was done by an equality
+but it is a bit mask.
+
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+Reviewed-by: Fabio Estevam <festevam@denx.de>
+Reviewed-by: Sultan Qasim Khan <sultan.qasimkhan@nccgroup.com>
+Reviewed-by: Marek Vasut <marex@denx.de>
+Tested-by: Marek Vasut <marex@denx.de>
+
+CVE: CVE-2022-2347
+Upstream-Status: Backport [14dc0ab138988a8e45ffa086444ec8db48b3f103]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ drivers/usb/gadget/f_dfu.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/usb/gadget/f_dfu.c b/drivers/usb/gadget/f_dfu.c
+index 33ef62f8ba..44877df4ec 100644
+--- a/drivers/usb/gadget/f_dfu.c
++++ b/drivers/usb/gadget/f_dfu.c
+@@ -325,7 +325,7 @@ static int state_dfu_idle(struct f_dfu *f_dfu,
+ 
+ 	switch (ctrl->bRequest) {
+ 	case USB_REQ_DFU_DNLOAD:
+-		if (ctrl->bRequestType == USB_DIR_OUT) {
++		if (!(ctrl->bRequestType & USB_DIR_IN)) {
+ 			if (len == 0) {
+ 				f_dfu->dfu_state = DFU_STATE_dfuERROR;
+ 				value = RET_STALL;
+@@ -337,7 +337,7 @@ static int state_dfu_idle(struct f_dfu *f_dfu,
+ 		}
+ 		break;
+ 	case USB_REQ_DFU_UPLOAD:
+-		if (ctrl->bRequestType == USB_DIR_IN) {
++		if (ctrl->bRequestType & USB_DIR_IN) {
+ 			f_dfu->dfu_state = DFU_STATE_dfuUPLOAD_IDLE;
+ 			f_dfu->blk_seq_num = 0;
+ 			value = handle_upload(req, len);
+@@ -436,7 +436,7 @@ static int state_dfu_dnload_idle(struct f_dfu *f_dfu,
+ 
+ 	switch (ctrl->bRequest) {
+ 	case USB_REQ_DFU_DNLOAD:
+-		if (ctrl->bRequestType == USB_DIR_OUT) {
++		if (!(ctrl->bRequestType & USB_DIR_IN)) {
+ 			f_dfu->dfu_state = DFU_STATE_dfuDNLOAD_SYNC;
+ 			f_dfu->blk_seq_num = w_value;
+ 			value = handle_dnload(gadget, len);
+@@ -527,7 +527,7 @@ static int state_dfu_upload_idle(struct f_dfu *f_dfu,
+ 
+ 	switch (ctrl->bRequest) {
+ 	case USB_REQ_DFU_UPLOAD:
+-		if (ctrl->bRequestType == USB_DIR_IN) {
++		if (ctrl->bRequestType & USB_DIR_IN) {
+ 			/* state transition if less data then requested */
+ 			f_dfu->blk_seq_num = w_value;
+ 			value = handle_upload(req, len);
+-- 
+2.32.0
+
diff --git a/meta/recipes-bsp/u-boot/files/CVE-2022-30790.patch b/meta/recipes-bsp/u-boot/files/CVE-2022-30790.patch
new file mode 100644
index 0000000000..e67cf391a8
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2022-30790.patch
@@ -0,0 +1,149 @@
+From 1817c3824a08bbad7fd2fbae1a6e73be896e8e5e Mon Sep 17 00:00:00 2001
+From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
+Date: Fri, 14 Oct 2022 19:43:39 +0200
+Subject: [PATCH] net: (actually/better) deal with CVE-2022-{30790,30552}
+
+I hit a strange problem with v2022.10: Sometimes my tftp transfer
+would seemingly just hang. It only happened for some files. Moreover,
+changing tftpblocksize from 65464 to 65460 or 65000 made it work again
+for all the files I tried. So I started suspecting it had something to
+do with the file sizes and in particular the way the tftp blocks get
+fragmented and reassembled.
+
+v2022.01 showed no problems with any of the files or any value of
+tftpblocksize.
+
+Looking at what had changed in net.c or tftp.c since January showed
+only one remotely interesting thing, b85d130ea0ca.
+
+So I fired up wireshark on my host to see if somehow one of the
+packets would be too small. But no, with both v2022.01 and v2022.10,
+the exact same sequence of packets were sent, all but the last of size
+1500, and the last being 1280 bytes.
+
+But then it struck me that 1280 is 5*256, so one of the two bytes
+on-the-wire is 0 and the other is 5, and when then looking at the code
+again the lack of endianness conversion becomes obvious. [ntohs is
+both applied to ip->ip_off just above, as well as to ip->ip_len just a
+little further down when the "len" is actually computed].
+
+IOWs the current code would falsely reject any packet which happens to
+be a multiple of 256 bytes in size, breaking tftp transfers somewhat
+randomly, and if it did get one of those "malicious" packets with
+ip_len set to, say, 27, it would be seen by this check as being 6912
+and hence not rejected.
+
+====
+
+Now, just adding the missing ntohs() would make my initial problem go
+away, in that I can now download the file where the last fragment ends
+up being 1280 bytes. But there's another bug in the code and/or
+analysis: The right-hand side is too strict, in that it is ok for the
+last fragment not to have a multiple of 8 bytes as payload - it really
+must be ok, because nothing in the IP spec says that IP datagrams must
+have a multiple of 8 bytes as payload. And comments in the code also
+mention this.
+
+To fix that, replace the comparison with <= IP_HDR_SIZE and add
+another check that len is actually a multiple of 8 when the "more
+fragments" bit is set - which it necessarily is for the case where
+offset8 ends up being 0, since we're only called when
+
+  (ip_off & (IP_OFFS | IP_FLAGS_MFRAG)).
+
+====
+
+So, does this fix CVE-2022-30790 for real? It certainly correctly
+rejects the POC code which relies on sending a packet of size 27 with
+the MFRAG flag set. Can the attack be carried out with a size 27
+packet that doesn't set MFRAG (hence must set a non-zero fragment
+offset)? I dunno. If we get a packet without MFRAG, we update
+h->last_byte in the hole we've found to be start+len, hence we'd enter
+one of
+
+	if ((h >= thisfrag) && (h->last_byte <= start + len)) {
+
+or
+
+	} else if (h->last_byte <= start + len) {
+
+and thus won't reach any of the
+
+		/* overlaps with initial part of the hole: move this hole */
+		newh = thisfrag + (len / 8);
+
+		/* fragment sits in the middle: split the hole */
+		newh = thisfrag + (len / 8);
+
+IOW these division are now guaranteed to be exact, and thus I think
+the scenario in CVE-2022-30790 cannot happen anymore.
+
+====
+
+However, there's a big elephant in the room, which has always been
+spelled out in the comments, and which makes me believe that one can
+still cause mayhem even with packets whose payloads are all 8-byte
+aligned:
+
+    This code doesn't deal with a fragment that overlaps with two
+    different holes (thus being a superset of a previously-received
+    fragment).
+
+Suppose each character below represents 8 bytes, with D being already
+received data, H being a hole descriptor (struct hole), h being
+non-populated chunks, and P representing where the payload of a just
+received packet should go:
+
+  DDDHhhhhDDDDHhhhDDDD
+        PPPPPPPPP
+
+I'm pretty sure in this case we'd end up with h being the first hole,
+enter the simple
+
+	} else if (h->last_byte <= start + len) {
+		/* overlaps with final part of the hole: shorten this hole */
+		h->last_byte = start;
+
+case, and thus in the memcpy happily overwrite the second H with our
+chosen payload. This is probably worth fixing...
+
+Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
+
+CVE: CVE-2022-30790
+Upstream-Status: Backport [1817c3824a08bbad7fd2fbae1a6e73be896e8e5e]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ net/net.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/net/net.c b/net/net.c
+index 434c3b411e..987c25931e 100644
+--- a/net/net.c
++++ b/net/net.c
+@@ -924,7 +924,11 @@ static struct ip_udp_hdr *__net_defragment(struct ip_udp_hdr *ip, int *lenp)
+ 	int offset8, start, len, done = 0;
+ 	u16 ip_off = ntohs(ip->ip_off);
+ 
+-	if (ip->ip_len < IP_MIN_FRAG_DATAGRAM_SIZE)
++	/*
++	 * Calling code already rejected <, but we don't have to deal
++	 * with an IP fragment with no payload.
++	 */
++	if (ntohs(ip->ip_len) <= IP_HDR_SIZE)
+ 		return NULL;
+ 
+ 	/* payload starts after IP header, this fragment is in there */
+@@ -934,6 +938,10 @@ static struct ip_udp_hdr *__net_defragment(struct ip_udp_hdr *ip, int *lenp)
+ 	start = offset8 * 8;
+ 	len = ntohs(ip->ip_len) - IP_HDR_SIZE;
+ 
++	/* All but last fragment must have a multiple-of-8 payload. */
++	if ((len & 7) && (ip_off & IP_FLAGS_MFRAG))
++		return NULL;
++
+ 	if (start + len > IP_MAXUDP) /* fragment extends too far */
+ 		return NULL;
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
index cd40ad1a7d..62ebe40cb6 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
@@ -8,6 +8,9 @@ SRC_URI +=       " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
                    file://0001-net-Check-for-the-minimum-IP-fragmented-datagram-siz.patch \
                    file://0001-fs-squashfs-Use-kcalloc-when-relevant.patch \
                    file://0001-CVE-2022-30767.patch \
+                   file://CVE-2022-30790.patch \
+                   file://CVE-2022-2347_1.patch \
+                   file://CVE-2022-2347_2.patch \
                  "
 
 DEPENDS += "bc-native dtc-native python3-setuptools-native"
-- 
2.43.0



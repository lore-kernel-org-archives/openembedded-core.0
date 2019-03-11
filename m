Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 591897CE4C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 03:12:34 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id q17so2629065pfh.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 20:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=F6c/Te6AJoIFBv1bIoU1ebVB4GwMPq/+6PYkVkLXLVg=;
	b=ZyvULoVW3DZBg4qXmHa7RVL9Ez8edsf7armwAoClaysaynDW33MEfWRKulMD+HYUkk
	2NYKhfIGaS8gQyIheqg1YJ8xXTO95yFoD/S6cLPC9lgYGirhNnlgW+nhtWY8FoYERcbK
	V3oNu20wwg2AEor6QKWNuZmtb+de/yLcj3aFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=F6c/Te6AJoIFBv1bIoU1ebVB4GwMPq/+6PYkVkLXLVg=;
	b=tkZsvYFlbAKfVqsRaNynAdllYQJcTwsgocLOm7sDS2A4JYQALzq9P3FQ36QND8UhgA
	2u8hNToU6N6M6tAY9AN1n265E2kjsH92isifraKN8gETdHs0NFS1A9GpI7VlbPiYcifn
	Y1Kq26hsA0bwMqy1rufgcHumxLPQNGMAUOr28WiPUDg0ZB3Hpm4InvQ1MpSNwU6/bW2N
	NSA0Wf3JbUyivIN2tDvJ/xfppWlip+gl8pL3cx5nYy+CjveMLVSbm+QCngYeUR85JNBR
	GQcnN5gMO4ln3gkNpPVJ5I9FCGhdY06FoK5AOkV0XfxpEBE8GpzhhwntKn9gE3nhk+ch
	QWpQ==
X-Gm-Message-State: APjAAAVXS1Od6He9H80CSIqpOf5MpFt/VquPrkaMQFhHSxqEbjwiU0LR
	0zTrQkUdHz8LRstZ7eCzyHaZgfwX9psvbg==
X-Google-Smtp-Source: APXvYqxuloWOwBX9vxCqa8fOogzPaPSaPeFsxnkFByWY4ypRGnP5dmPfr2vDM+7ok+iX6P5OkVKauQ==
X-Received: by 2002:a17:902:142:: with SMTP id
	60mr27272729plb.191.1552273954993; 
	Sun, 10 Mar 2019 20:12:34 -0700 (PDT)
Received: from hex.int.rpsys.net ([12.27.65.221])
	by smtp.gmail.com with ESMTPSA id l2sm6166861pgj.64.2019.03.10.20.12.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Mar 2019 20:12:34 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2019 03:12:28 +0000
Message-Id: <20190311031230.21497-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190311031230.21497-1-richard.purdie@linuxfoundation.org>
References: <20190311031230.21497-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/5] qemuarm64: Fix graphics hang with 5.0 kernel
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
X-List-Received-Date: Mon, 11 Mar 2019 03:12:34 -0000
Content-Transfer-Encoding: 8bit

Ensure we turn on edid for the VGA display which fixes a hang with the
5.0 kernel for qemuarm64.

Thanks to Jon Mason for the fix.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/machine/qemuarm64.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index 92c61cb2438..22f6cb742b6 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -17,7 +17,7 @@ QB_CPU = "-cpu cortex-a57"
 # Standard Serial console
 QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0"
 # For graphics to work we need to define the VGA device as well as the necessary USB devices
-QB_OPT_APPEND = "-show-cursor -device VGA"
+QB_OPT_APPEND = "-show-cursor -device VGA,edid=on"
 QB_OPT_APPEND += "-device qemu-xhci -device usb-tablet -device usb-kbd"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
-- 
2.20.1



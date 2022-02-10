Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11772C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 20:23:34 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web10.1235.1644524613295928552
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 12:23:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=bqtKNIkW;
 spf=pass (domain: cold-front.org, ip: 64.147.123.24,
 mailfrom: jsbronder@cold-front.org)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 88E6F3200974;
	Thu, 10 Feb 2022 15:23:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 10 Feb 2022 15:23:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=mesmtp; bh=jNmraQtxWpv7MRe5su3mr4ORcuAWcGWQWpx
	Z4SA4dUg=; b=bqtKNIkWVm8OA/YS4wRDvqi+/5EUoWmbCtMEt5cCthx/H+0nL5i
	/5SvXh0dD3u+fxBQGSopNjmAQ+MwKRfhCWwwjN57iZrxpGbFiW0wlhfkOy7D0YqY
	JY88J3a8CLE9fAb7Sxo0sm8OQhZ4Je5YCpaGRJ7Ce1K5vNS0ItzhIKd4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=jNmraQtxWpv7MRe5su3mr4ORcuAWc
	GWQWpxZ4SA4dUg=; b=hhQfk2g9hsgdPQ2yIHZ7l01AhJ+ZGmkEvhpi8QmvEv4xj
	X6GDmOgV1xO9l6eS8VcB1iADW84Qcn22pbrukrd+mAXo3RT4HwTqkslPTguS34FQ
	qGBWVJ47w6+uAtmQsbiRLw07H9IRNzrqU+5BLYojFHkN4mv6AE25dNqCUfSXPRKa
	hnkskQH60T8ED977S4JTPzUyNk8iXXc5mjCib9+u/CdNcoxAWgOALq7nk7FzcYWT
	do7TQDd7BjD70jDHGWjLLTX6McKd1q4er2hidLXemdBa0uiop8egaDlzMjGqbOqY
	VtpU8OLs4xaLkdtWvVYKwzGPWPaC+KkWen9OBMKUQ==
X-ME-Sender: <xms:Q3QFYhuYO0RMncuewG0OjrCOSBLS0uAqSZRfuJmdmiy38IGm39CoRg>
    <xme:Q3QFYqch4oL_V0Y_jqTr3wRYx8gwmfzFV40qa-NbYs1wcAHKj_aitTG7SKryN4qvg
    TIzOx8dLSn2a-oAAg>
X-ME-Received: 
 <xmr:Q3QFYky22LMrRuFyUkSb18aYJMa5FAY9HHWYZto0h6EneNtTluWeo0GJjGub0y_Pxas2y0Xc94CbzSjRDeZ4az3vftuX9e4_lbW3ELtfd4fl>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddriedugddufeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhnuggvrhes
    tgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpedvhfdthfffieffve
    etveeifeeuvddthfeludeitedukeeggfevfffgffffffffhfenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjshgsrhhonhguvghrsegtohhlug
    dqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:Q3QFYoNSAYInfukWaEQHd9hHieO8OwvYSgnD-D_50CtdH4zqlvXkew>
    <xmx:Q3QFYh-YuXHt1XIvtW18vClGxZe3c_t9JgyW8PSgb0dZ9wrt-pxW7w>
    <xmx:Q3QFYoU7LMoAgRukWWtKXksJKXA8YUeBkIJs1i-Wjqyp33trMpT9zQ>
    <xmx:RHQFYuHQcX0zPfnHrH7ahIjYlHa86BiyALIFjRTI4RWOR_dPajb4ZQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Feb 2022 15:23:31 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-core@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [PATCH] initramfs-framework: unmount automounts before switch_root
Date: Thu, 10 Feb 2022 15:23:22 -0500
Message-Id: <20220210202322.4693-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 20:23:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161628

If mounts are left lingering, then after we switch_root, attempts to
modify the block devices will result in an EBUSY with no way to unmount
them.  As we're about to switch_root anyways, there isn't much use to
keep anything mounted unless it has the new rootfs.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 .../initrdscripts/initramfs-framework/finish         | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/finish b/meta/recipes-core/initrdscripts/initramfs-framework/finish
index 717383ebac8..f08a9208675 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/finish
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/finish
@@ -12,6 +12,18 @@ finish_run() {
 			fatal "ERROR: There's no '/dev' on rootfs."
 		fi
 
+		# Unmount anything that was automounted by busybox via mdev-mount.sh.
+		# We're about to switch_root, and leaving anything mounted will prevent
+		# the next rootfs from modifying the block device.  Ignore ROOT_DISK,
+		# if it was set by setup-live, because it'll be mounted over loopback
+		# to ROOTFS_DIR.
+		local dev
+		for dev in /run/media/*; do
+			if mountpoint -q "${dev}" && [ "${dev##*/}" != "${ROOT_DISK}" ]; then
+				umount -f "${dev}" || debug "Failed to unmount ${dev}"
+			fi
+		done
+
 		info "Switching root to '$ROOTFS_DIR'..."
 
 		debug "Moving /dev, /proc and /sys onto rootfs..."
-- 
2.35.0



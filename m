Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC812C43334
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:37:15 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.64398.1656877027628082023
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ZSFj7uHo;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id s21so2827711pjq.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hugpsB5X4pePnMfK0Bwcu5Ya80oChQ15w5F1LgOsa1E=;
        b=ZSFj7uHoxbk9PN2JEAaXcA0i7V4X0FVoDd7aNsNL1RVT1TAMFaxHcMpQpGhXIwiIw8
         AkrLpPWVr4up/mWCFd90XJfBXIYZ7ZNtrq6Mt9nOMYYgF9sgo21cNYMkRWxjRzm/MUif
         OKwCwsOj6z0IUnN5Jkuw9C7x7JxHgQ65a/DlKU8EqL7a9fDcka3NVGMWCMPEKPLW8ULz
         H8M8EBcrIQY12VLjrWNMJAv5rDlMBVVGfKXMqeSxOQvXxTTls/5xDPQt9TqrX7EePqcf
         0W1etuzUZCdF8eOownjcyt+zlcRzJWfItnL4L1C+qv9uoWvW6ZxiyoOOBCq8XR5WGIGj
         DE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hugpsB5X4pePnMfK0Bwcu5Ya80oChQ15w5F1LgOsa1E=;
        b=VwTCA8w+EGG72VLIGIjAE41V2pglbEUAGrUHqLLpIl2ocr+yACnJcbtTx8jgHtRKQA
         zeDl26WG5hF+l7qX4B2HZyQAtyNsIMYFCxsgOURPpcr5GjSEqkeHkAe9vAHQnbSx2opd
         jpyzt+YSm7utF4kiJUx3IfhJDI7yroc8V+jxY/oEaeYBootjgRNA7CX6OtKQdPYNvjz6
         oSX1+FWyZwMcGBT64eOOdw5rATPGEhBhksEXcrvNYqViA1LLERnxjsZT9c/+S6NntpEY
         LTfaI04R+NgNEtOwHv718h4zoBaXseh+ERikUiiYXzFv0QfUfkHqadR9gW7OOCkBCB+E
         GRAQ==
X-Gm-Message-State: AJIora+S/z7aMZGBMn5/pulJd6JhD7/EDHr+N17K1vf5VCzZBPdDW4BE
	5SzRHmRrcV+Mj9dBD/bvMsi/IEy5wPx3LEfR
X-Google-Smtp-Source: 
 AGRyM1s4UjGk044kGZeM1CogK+zk9ljQYXYEiBgWPPxiUglZNZEBv6L8B8C2UbsgVFT+EskWxp1L2A==
X-Received: by 2002:a17:902:d48f:b0:16a:755f:86db with SMTP id
 c15-20020a170902d48f00b0016a755f86dbmr32364396plg.77.1656877026620;
        Sun, 03 Jul 2022 12:37:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.37.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:37:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/30] initramfs-framework: move storage mounts
 to actual rootfs
Date: Sun,  3 Jul 2022 09:35:46 -1000
Message-Id: 
 <0a3ebc5584384e4bf7d9c7ba4c827db587ef3bee.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:37:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167571

From: Muhammad Hamza <Muhammad_Hamza@mentor.com>

Operations such as mkfs fail on devices that are not
switched to the actual rootfs before switch_root is
called. The kernel interprets these devices as still
being used even after unmounting and errors such as
below are seen when the target is fully booted

root@v1000:~# umount /dev/sdb1
root@v1000:~# mkfs.ext4 /dev/sdb1
mke2fs 1.43.8 (1-Jan-2018)
/dev/sdb1 contains a ext4 file system
        last mounted on Wed Nov 28 07:33:54 2018
Proceed anyway? (y,N) y
/dev/sdb1 is apparently in use by the system; will not make a filesystem here!

Signed-off-by: Awais Belal <awais_belal@mentor.com>
Signed-off-by: Muhammad Hamza <muhammad_hamza@mentor.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit ec53ffd01972d1be2d6a28de828b3f0b80dc1e61)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../initrdscripts/initramfs-framework/finish             | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/finish b/meta/recipes-core/initrdscripts/initramfs-framework/finish
index f08a920867..ac0de9f996 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/finish
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/finish
@@ -26,6 +26,15 @@ finish_run() {
 
 		info "Switching root to '$ROOTFS_DIR'..."
 
+		debug "Moving basic mounts onto rootfs"
+		for dir in `awk '/\/dev.* \/run\/media/{print $2}' /proc/mounts`; do
+			# Parse any OCT or HEX encoded chars such as spaces
+			# in the mount points to actual ASCII chars
+			dir=`printf $dir`
+			mkdir -p "${ROOTFS_DIR}/media/${dir##*/}"
+			mount -n --move "$dir" "${ROOTFS_DIR}/media/${dir##*/}"
+		done
+
 		debug "Moving /dev, /proc and /sys onto rootfs..."
 		mount --move /dev $ROOTFS_DIR/dev
 		mount --move /proc $ROOTFS_DIR/proc
-- 
2.25.1



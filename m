Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3164BCCA481
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 16:23:52 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web09.27538.1656606226849583453
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:23:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Nu/STcgG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id jb13so17456045plb.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1B/5JfIrQ+0U7OL5psv0rkXLTstVLn2q+CVqmSoy3xw=;
        b=Nu/STcgGggxGOJNt4FUGGwfJSq1+dn4xOsfXxDxrLOu6l9p7T9rXRl96OIDiZVhdL/
         FoCycOCuwZxzJfUnFxZPga5Rm4XKZTD19FPUcSoG8G3Q6f39PeQIwu7xDYqWdpHOWffV
         Ocg03735XtP6kEzggxauomeQJXdc5gJ46wOvr9PcvdFNPXbXPfcjK/XQeDGKWit/AF2P
         hpapKkTz0U3zX8D9FLr3QnMw61bQcsOhlWdaTq0JHwIoYiUSPyuvI8kqnGWtBpEz8P9B
         LwWe9Riy/eW6znHG+mk+3AhhZtjajW0XSXvcSSHNn+aBq7kt4ku/oHD7ccQtwFmZq8vZ
         gu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1B/5JfIrQ+0U7OL5psv0rkXLTstVLn2q+CVqmSoy3xw=;
        b=y1XF3RNZuK27BsDYXp8HjYdD4Ws7NJjOqtHkzjf5D3pd50CQKDSVttHCRfZcZjJmO/
         I51ta5rRQE5Lh3vR0A+vOkeoPM+vjnEYUiUdkte5ST6+P4Os0Vs+I/+PRJtlqJvK1VYo
         uA9OBwRkG9e2yDnOZ14+mEhDaAvaURQfH8pYO5atgZ2wfmPmMgv1ifSQHbMih61fisDi
         cwab0j3xuVSDyCmpsXL9O1erdVOrvkkUqOVovEfUu8us2G3jCA8c1vaOUK8BJ5n6cXbr
         c/OpsJPGdp4jzcnZ1bzKQ/EQ1m9NOCgXOTRoPQbQUvqGB/dOtgOhs5orAE/uAaI7XeMW
         yj7g==
X-Gm-Message-State: AJIora9y2//FOWpPu676Sm0SjbTbNLYVbmFeaPXQdGjp3ggEI5awAiw1
	EzggvqUuG0kJx+eb93T6J4fcJLai981S4rb3
X-Google-Smtp-Source: 
 AGRyM1st9f4hClc3Ehm1iWPnIwGSu6JYTvDa80xGRgppaTWW0X7y2Dz0Be5RQ4JAhf2RP2HRQ/3VOQ==
X-Received: by 2002:a17:90a:5207:b0:1ee:dfa1:afa9 with SMTP id
 v7-20020a17090a520700b001eedfa1afa9mr11111232pjh.246.1656606225835;
        Thu, 30 Jun 2022 09:23:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t129-20020a625f87000000b005259578e8fcsm10517611pfb.181.2022.06.30.09.23.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 09:23:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/12] initramfs-framework: move storage mounts to
 actual rootfs
Date: Thu, 30 Jun 2022 06:23:10 -1000
Message-Id: 
 <ce27982c24d2398c9eadb9d4d9e7475509424195.1656605800.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656605800.git.steve@sakoman.com>
References: <cover.1656605800.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 16:23:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167426

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
index 717383ebac..dee3ab3387 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/finish
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/finish
@@ -14,6 +14,15 @@ finish_run() {
 
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



Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 07DF360685
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 17:46:18 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id t127so3273545ywg.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 10:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=km7biDxfshZT1+0DPm+0+iQQ448oCddFme8Op3k5fmY=;
	b=D0t1GhpDXijTK0a9XcE4xtfAl0aojZBloQNnEap0yAQSP6d4t1lbdf9KxJ3obgT1KH
	pg2+ZoxL6Wm7f3x44ALE/8WbCLSdPbz8Buh++ByGJOiA5aLTUTDus+Ku7GRgB4Bszv8q
	ixPtNv7QMdD+HZjEHbfjRVC0IXTMgax5yxmYoAb3xcY+J99WuyQrOFvkcU2+QB7FbdXM
	jX8vAQeJqwsbWHrPwzMBJXbcrj0EhtSdlzA8KH7q799g6oCPyH/S3Qxf8/tu/fKESL5S
	di0oTXMOhr9hGrbEhXDXOygQOsnBZyF9CMzuQGH3lHdMeptyAnEi6VqsRy9N1JM7g3YX
	AXFQ==
X-Gm-Message-State: AHPjjUjK9SMPKE+7xAOot/IVxvncm+/W3c34b5CQfm5Y+AIOTIUrfgRW
	YyFskZrGcAeDfdPZz7iJEgcd
X-Google-Smtp-Source: AOwi7QCho0vRP+UbrfcjKKCuta5qFtUUCbuWeJJlXCctaYJZlZ4FRfhq1vexd7KHHnYukDBXAB05jA==
X-Received: by 10.129.103.85 with SMTP id b82mr2153272ywc.364.1506015979557;
	Thu, 21 Sep 2017 10:46:19 -0700 (PDT)
Received: from localhost.localdomain (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68]) by smtp.gmail.com with ESMTPSA id
	n186sm704902ywn.12.2017.09.21.10.46.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Sep 2017 10:46:19 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2017 13:46:17 -0400
Message-Id: <1506015977-16858-2-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506015977-16858-1-git-send-email-trini@konsulko.com>
References: <1506015977-16858-1-git-send-email-trini@konsulko.com>
Subject: [PATCH 2/2] wic: Update canned-wks for systemd to use UUID everywhere
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
X-List-Received-Date: Thu, 21 Sep 2017 17:46:19 -0000

With systemd, the mounting of the swap partition is handled via systemd
and will mount it, regardless of if PARTUUID is parsed or not.  systemd
has a runtime dependency on util-linux-mount so PARTUUID for regular
mount points will be handled correctly.  Make all partitions that we add
to the image make use of UUIDs for maximum portability.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
Note that while systemd will automatically mount swap for you, busybox
swapon/swapoff do not understand PARTUUID syntax.  util-linux-swaponoff
is required for swapon -a / swapoff -a to work as expected from the
command line.
---
 scripts/lib/wic/canned-wks/systemd-bootdisk.wks | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/canned-wks/systemd-bootdisk.wks b/scripts/lib/wic/canned-wks/systemd-bootdisk.wks
index 4bd9d6a65fd7..95d7b97a6063 100644
--- a/scripts/lib/wic/canned-wks/systemd-bootdisk.wks
+++ b/scripts/lib/wic/canned-wks/systemd-bootdisk.wks
@@ -2,10 +2,10 @@
 # long-description: Creates a partitioned EFI disk image that the user
 # can directly dd to boot media. The selected bootloader is systemd-boot.
 
-part /boot --source bootimg-efi --sourceparams="loader=systemd-boot" --ondisk sda --label msdos --active --align 1024
+part /boot --source bootimg-efi --sourceparams="loader=systemd-boot" --ondisk sda --label msdos --active --align 1024 --use-uuid
 
 part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024 --use-uuid
 
-part swap --ondisk sda --size 44 --label swap1 --fstype=swap
+part swap --ondisk sda --size 44 --label swap1 --fstype=swap --use-uuid
 
 bootloader --ptable gpt --timeout=5 --append="rootwait rootfstype=ext4 console=ttyS0,115200 console=tty0"
-- 
1.9.1



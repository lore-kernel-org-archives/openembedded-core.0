Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id 109B97306B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 02:04:55 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id i6so6467292ywb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 19:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wAJJrKB341TxNosayL0FIbilDL/phSZf5iAuZV6VIU4=;
	b=gpUsfms5/8TgWM9yVzrrzGEnBcBF3TarstXfFhBmT98RAjbGcNYdZ1aFQmufqRGgm5
	0gboZOwrYv186xu9IHsk2v479/DFcZfoBmH0j4juorj7yKO/8JnARFQjMBCrusXP38to
	nAGAq1GhQiZQGlLSRsXfR5lgwX76o7icgzn8NNZiHvrCKZlcaIEpOCkSkUd1Oy1QymPO
	zD0c2zpMZyYJZayPlu2Cj53f022uJSWo9cb+SJb+CiG6iXiCz0bejj7fWkBeLxMqABFA
	6WHWOiODNvlPZYxkyJq2zoMSE5o9ODL/MwrSqxXk/qYgAhDRyij+6DDfwk2nRgw87LQp
	MxDQ==
X-Gm-Message-State: AIVw110idP6XfmQkFRtQIc+KYpiUNIQO2hNP6J4VbjriIvczCOFJ/qGD
	QvvZFZivHhIVFTSz
X-Received: by 10.129.173.96 with SMTP id l32mr2467454ywk.281.1501121097072;
	Wed, 26 Jul 2017 19:04:57 -0700 (PDT)
Received: from localhost.localdomain (cpe-174-106-0-58.ec.res.rr.com.
	[174.106.0.58]) by smtp.gmail.com with ESMTPSA id
	p190sm6479575ywd.81.2017.07.26.19.04.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Jul 2017 19:04:56 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jul 2017 22:06:10 -0400
Message-Id: <1501121173-29658-2-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1501121173-29658-1-git-send-email-trini@konsulko.com>
References: <1501121173-29658-1-git-send-email-trini@konsulko.com>
Subject: [PATCHv2 2/5] wic: Switch to using --use-uuid by default
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
X-List-Received-Date: Thu, 27 Jul 2017 02:04:56 -0000

The most portable way to specifiy a root device in a disk image that we
create is to use PARTUUID rather than /dev/sda2.  As background, both
GPT and MBR tables provide valid UUID values for each partition and the
Linux Kernel contains the logic to parse this value.  With this change
we can now boot the default disk images when used as any valid block
device that the included kernel uses.  This for example means that
VirtualBox can be used to run vmdk without changes as it uses IDE for
the virtual disk controller.

Cc: Matt Porter <mporter@konsulko.com>
Signed-off-by: Tom Rini <trini@konsulko.com>
---
Changes in v2: None
---
 scripts/lib/wic/canned-wks/common.wks.inc                   | 2 +-
 scripts/lib/wic/canned-wks/directdisk-bootloader-config.cfg | 8 ++++----
 scripts/lib/wic/canned-wks/qemux86-directdisk.wks           | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/wic/canned-wks/common.wks.inc b/scripts/lib/wic/canned-wks/common.wks.inc
index 5cf2fd1f3e06..89880b417b6e 100644
--- a/scripts/lib/wic/canned-wks/common.wks.inc
+++ b/scripts/lib/wic/canned-wks/common.wks.inc
@@ -1,3 +1,3 @@
 # This file is included into 3 canned wks files from this directory
 part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
-part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
+part / --source rootfs --use-uuid --fstype=ext4 --label platform --align 1024
diff --git a/scripts/lib/wic/canned-wks/directdisk-bootloader-config.cfg b/scripts/lib/wic/canned-wks/directdisk-bootloader-config.cfg
index d5a07d20484d..c58e74a853cb 100644
--- a/scripts/lib/wic/canned-wks/directdisk-bootloader-config.cfg
+++ b/scripts/lib/wic/canned-wks/directdisk-bootloader-config.cfg
@@ -12,16 +12,16 @@ DEFAULT Graphics console boot
 
 LABEL Graphics console boot
 KERNEL /vmlinuz
-APPEND label=boot root=/dev/sda2 rootwait
+APPEND label=boot rootwait
 
 LABEL Serial console boot
 KERNEL /vmlinuz
-APPEND label=boot root=/dev/sda2 rootwait console=ttyS0,115200
+APPEND label=boot rootwait console=ttyS0,115200
 
 LABEL Graphics console install
 KERNEL /vmlinuz
-APPEND label=install root=/dev/sda2 rootwait
+APPEND label=install rootwait
 
 LABEL Serial console install
 KERNEL /vmlinuz
-APPEND label=install root=/dev/sda2 rootwait console=ttyS0,115200
+APPEND label=install rootwait console=ttyS0,115200
diff --git a/scripts/lib/wic/canned-wks/qemux86-directdisk.wks b/scripts/lib/wic/canned-wks/qemux86-directdisk.wks
index db30bbced034..1f8466af29bf 100644
--- a/scripts/lib/wic/canned-wks/qemux86-directdisk.wks
+++ b/scripts/lib/wic/canned-wks/qemux86-directdisk.wks
@@ -4,5 +4,5 @@
 
 include common.wks.inc
 
-bootloader  --timeout=0  --append="vga=0 uvesafb.mode_option=640x480-32 root=/dev/sda2 rw mem=256M ip=192.168.7.2::192.168.7.1:255.255.255.0 oprofile.timer=1 rootfstype=ext4 "
+bootloader  --timeout=0  --append="vga=0 uvesafb.mode_option=640x480-32 rw mem=256M ip=192.168.7.2::192.168.7.1:255.255.255.0 oprofile.timer=1 rootfstype=ext4 "
 
-- 
1.9.1



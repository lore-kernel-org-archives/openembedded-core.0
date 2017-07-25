Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id EB55378294
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 19:57:05 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id p68so3450412ywg.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 12:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=g/zE03PbiMCqU9cLlzk03YjR5VVuakrKjT6jCEQ+cD4=;
	b=No9mvzBwC79QPHUctw6LOkTXW5HWmhr/Pmoi8Url6fzv2dKwIg72yy+t/NFnHxlCHP
	j74hvFmdUjMGRx/u9SkUuxFuvANazEFCq89vlLBHH6be4J6JNAta7WX77MpR606M96tn
	7KWmewJQoufAziSmWAOPINW541q/06/oY051uWphRRHp1tXG/tCpq8SzVd2sPjRm6iM4
	n/UH8K1NB3IntwKixCBBrGUJHCpoSJX/IsmAS+rXU9K9fGwnUFzs1h5lcOmA7iJdF17u
	0v/LZHDxGl0e9maGr4ELS5R4O2MGIo9Sj+8PjvZ1eySz5m9wuualxNeK/CJWfxHSM036
	/JBQ==
X-Gm-Message-State: AIVw113Mp5AFCz3seenXAGltR88gGrvh/o1fjrepABYwPS8UvYp8aWkQ
	13ANSQhl02bcctde
X-Received: by 10.13.236.129 with SMTP id v123mr16764301ywe.345.1501012627166; 
	Tue, 25 Jul 2017 12:57:07 -0700 (PDT)
Received: from localhost.localdomain (cpe-174-106-0-58.ec.res.rr.com.
	[174.106.0.58]) by smtp.gmail.com with ESMTPSA id
	u202sm2396729ywc.23.2017.07.25.12.57.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 25 Jul 2017 12:57:06 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jul 2017 15:58:22 -0400
Message-Id: <1501012702-2723-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] wic: Switch to using --use-uuid by default
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
X-List-Received-Date: Tue, 25 Jul 2017 19:57:06 -0000

The most portable way to specifiy a root device in a disk image that we
create is to use PARTUUID rather than /dev/sda2.  As background, both
GPT and MBR tables provide valid UUID values for each partition and the
Linux Kernel contains the logic to parse this value.  With this change
we can now boot the default disk images when used as any valid block
device that the included kernel uses.  This for example means that
VirtualBox can be used to run vmdk without changes as it uses IDE for
the virtual disk controller.

Cc: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Matt Porter <mporter@konsulko.com>
Signed-off-by: Tom Rini <trini@konsulko.com>
---
 scripts/lib/wic/canned-wks/common.wks.inc                   | 2 +-
 scripts/lib/wic/canned-wks/directdisk-bootloader-config.cfg | 8 ++++----
 scripts/lib/wic/canned-wks/qemux86-directdisk.wks           | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/wic/canned-wks/common.wks.inc b/scripts/lib/wic/canned-wks/common.wks.inc
index 5cf2fd1..89880b4 100644
--- a/scripts/lib/wic/canned-wks/common.wks.inc
+++ b/scripts/lib/wic/canned-wks/common.wks.inc
@@ -1,3 +1,3 @@
 # This file is included into 3 canned wks files from this directory
 part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
-part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
+part / --source rootfs --use-uuid --fstype=ext4 --label platform --align 1024
diff --git a/scripts/lib/wic/canned-wks/directdisk-bootloader-config.cfg b/scripts/lib/wic/canned-wks/directdisk-bootloader-config.cfg
index d5a07d2..c58e74a 100644
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
index db30bbc..1f8466a 100644
--- a/scripts/lib/wic/canned-wks/qemux86-directdisk.wks
+++ b/scripts/lib/wic/canned-wks/qemux86-directdisk.wks
@@ -4,5 +4,5 @@
 
 include common.wks.inc
 
-bootloader  --timeout=0  --append="vga=0 uvesafb.mode_option=640x480-32 root=/dev/sda2 rw mem=256M ip=192.168.7.2::192.168.7.1:255.255.255.0 oprofile.timer=1 rootfstype=ext4 "
+bootloader  --timeout=0  --append="vga=0 uvesafb.mode_option=640x480-32 rw mem=256M ip=192.168.7.2::192.168.7.1:255.255.255.0 oprofile.timer=1 rootfstype=ext4 "
 
-- 
2.1.4



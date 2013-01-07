Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TsArL-0003d6-RV
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 12:27:19 +0100
Received: from mail-bk0-f70.google.com ([209.85.214.70])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 07 Jan 2013 03:12:01 -0800
Received: by mail-bk0-f70.google.com with SMTP id jc3so16660611bkc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 03:11:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=yNv+SR4hObqApAwaxkMBOSnjj3Aiu/32f0/+oeW99aU=;
	b=Yqj8ZtIPhqwFUvNt6542OQ6zqkVeP3svOA3d+r4qre+dNEn3+cZEt4CR/vwGCT2/v3
	zwAfAW58g5Qg7+2LiVGQDs2+7Lb/R5L8vZgVJZCpICO5NDZYsprmQsvACQ3rOtszFK2E
	kyExWgEZ/pDEmZmYOHRUkzWWC3TLJnQPAKge+3ctPI4idxhzy637mPl7H60PSb15vJKe
	n46cGoui6lo+i5/Vm4og86AZHB0wRlTKmpSERpo7gIAzyFpOg97QugspDlEMG/j5IeZ5
	ZZxyNJlVH1WNB+OY2KBCmQOjRA0eLAOEECojvZIL5yjk/z2mO214qFWoz9ScISIDJBmc
	fCDQ==
X-Received: by 10.181.13.195 with SMTP id fa3mr8527830wid.8.1357557119189;
	Mon, 07 Jan 2013 03:11:59 -0800 (PST)
X-Received: by 10.181.13.195 with SMTP id fa3mr8527824wid.8.1357557119113;
	Mon, 07 Jan 2013 03:11:59 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id l5sm12993779wia.10.2013.01.07.03.11.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 03:11:58 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 11:09:57 +0000
Message-Id: <1357557002-22183-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357557002-22183-1-git-send-email-ross.burton@intel.com>
References: <1357557002-22183-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQm2yyJmN6THZkX53qIWrN1rl7oC7cn72dxxU2rZZennYslolyb1qRbIKYxvo+TblBK0LbHzg96zTstgbCMszu8P6P6m7GyvCLHggnmYEb5dotnicFM32UWjTMzxq6TPRrh6TK8KEOyTP0Tvs0WAcd3W7C70gAEBHzJYilY9iqz1ti/NS9dW3OItCE5/625KMSOM7bJH
Subject: [PATCH 2/7] Revert "initrdscripts: fix udevd in the live boot init scripts"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 11:27:38 -0000

This cherry-pick slipped through testing and lead to unbootable hddimg images.

This reverts commit 0140519ba15bfb27ccbfb3d41c7e678a1118fc5c.

[ YOCTO #3634 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh         |    4 +---
 meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb |    2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index c591f0d..5682fd1 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -14,14 +14,12 @@ early_setup() {
     mkdir -p /sys
     mount -t proc proc /proc
     mount -t sysfs sysfs /sys
-    mount -t devtmpfs none /dev
 
     # support modular kernel
     modprobe isofs 2> /dev/null
 
     mkdir -p /run
-    mkdir -p /var/run
-    /lib/udev/udevd --daemon
+    udevd --daemon
     udevadm trigger --action=add
 }
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
index 55a8600..a41b66b 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
@@ -5,7 +5,7 @@ RDEPENDS = "udev"
 DEPENDS = "virtual/kernel"
 SRC_URI = "file://init-live.sh"
 
-PR = "r11"
+PR = "r12"
 
 do_compile() {
 	#if grep -q "CONFIG_UNION_FS=y" ${STAGING_KERNEL_DIR}/.config; then
-- 
1.7.10.4




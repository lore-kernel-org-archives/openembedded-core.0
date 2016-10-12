Return-Path: <martin.jansa@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6C63870101
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 12:06:13 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id f128so2799708qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 05:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4CgOfUusRdJqwoUGeRhOC9lmFJKOhfB2oML5D8PzWlk=;
	b=Z+9vaXUlRegSOvzrvSSJkrFdzPKAbmL08kAJ0Ea68vrnP2R7ZnFifwqGzxulj8YvUA
	fxSa6okOEzaL/YDwBvA96QPCM63l07HucfqR+FmFKjniXVNtbdP/+1AZlO0u25euL8xx
	2k7SNfPHK/abbx2/My6fdUYWsJaK3frWz2ukmAaHg/05K6dcLpnNhIZbK7aHZAr4Zk11
	WBCk71wyD5E7aQD8rKzgYX4p9DVIb+7Jm+vVZ3/ydfWeEeydvO9tiJh339wDTfAgxNDP
	ppm2EQrEy0XMWk/THIMrBdQLXKFonYsRwjEQKhBEOWLwtqTjT9dBO2eOllpm2YxCZ2cV
	xXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4CgOfUusRdJqwoUGeRhOC9lmFJKOhfB2oML5D8PzWlk=;
	b=DhhDV6lO4BtxV8d/GDH3X1Z2TTKTGuYZGZM1nrzXJTapHSbKyqR4FzEYL2TSfq69cp
	wJN/2bB2JO/A2Pj8aZDxrE0ti53+f+fENuAMJLdqI2HPWK1mLRSJC2kyqEafpBMbvvsx
	Qwcf4T5FN07fJk+JpkQEmLRO/7ZVQ3bdcvUd2xjSvZaGKTKfoXM9h5u38VT8D2oDoRqu
	4VhF0uwTtt94f8Y7mOM2NmiEJbqB1Jg8EdVa0ROsj820NayxOsHszgeIk/ePQx0rEsBB
	D4xOWshisHUybghrRwmz/UGy96CM4SIdlBPK1lRR+Azq5eg0b9hmbQnj+L/Im9i6czA0
	i35Q==
X-Gm-Message-State: AA6/9RlEQ3lYIp2NzK3OkgsbW1pdn0PkwM4xriyevbVgEPJPes1xMYb4CXBLizp4Mq79UA==
X-Received: by 10.194.125.144 with SMTP id mq16mr935514wjb.35.1476273975165;
	Wed, 12 Oct 2016 05:06:15 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	17sm12345088wju.44.2016.10.12.05.06.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Oct 2016 05:06:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Oct 2016 14:06:12 +0200
Message-Id: <20161012120612.12951-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.1
Subject: [PATCH] live-vm-common.bbclass: Allow to use different kernel image than KERNEL_IMAGETYPE for /vmlinuz
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
X-List-Received-Date: Wed, 12 Oct 2016 12:06:14 -0000

* syslinux config hardcodes kernel image as /vmlinuz add warning message
  when the selected image doesn't exist and allow to select different image
  with VM_DEFAULT_KERNEL variable (qemuboot.bbclass is using QB_DEFAULT_KERNEL)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/live-vm-common.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/live-vm-common.bbclass b/meta/classes/live-vm-common.bbclass
index c751385..734697f 100644
--- a/meta/classes/live-vm-common.bbclass
+++ b/meta/classes/live-vm-common.bbclass
@@ -31,14 +31,18 @@ inherit ${EFI_CLASS}
 inherit ${PCBIOS_CLASS}
 
 KERNEL_IMAGETYPE ??= "bzImage"
+VM_DEFAULT_KERNEL ??= "${KERNEL_IMAGETYPE}"
 
 populate_kernel() {
 	dest=$1
 	install -d $dest
 
 	# Install bzImage, initrd, and rootfs.img in DEST for all loaders to use.
-	if [ -e ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} ]; then
-		install -m 0644 ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} $dest/vmlinuz
+	bbnote "Trying to install ${DEPLOY_DIR_IMAGE}/${VM_DEFAULT_KERNEL} as $dest/vmlinuz"
+	if [ -e ${DEPLOY_DIR_IMAGE}/${VM_DEFAULT_KERNEL} ]; then
+		install -m 0644 ${DEPLOY_DIR_IMAGE}/${VM_DEFAULT_KERNEL} $dest/vmlinuz
+	else
+		bbwarn "${DEPLOY_DIR_IMAGE}/${VM_DEFAULT_KERNEL} doesn't exist"
 	fi
 
 	# initrd is made of concatenation of multiple filesystem images
-- 
2.10.1



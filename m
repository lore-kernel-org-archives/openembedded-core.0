Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id DFDBA6011F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Nov 2015 14:43:19 +0000 (UTC)
Received: by igl9 with SMTP id 9so40963663igl.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Nov 2015 06:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8Y+SkhRadR/N7zRMfJWMW+WGWaYfJiONzCQ2L8JZHIk=;
	b=Y25Ggtcm0l2jI5+wNMN92+D/W+xtd5Z6fwPFkJkgq4gBK5sceUXBQW6KutTLMKbL7N
	ruKR8WiCvtj3SQwIHfCawy8aR43lqIla6sIbG9w5pVbpb874nKrquwcVwSNujfuD/Jte
	omaLOJSN6vWiuW7+lodl9IigpEd5rvqGAV96g7FEa2jqOGxxSM4LwxigqNNUE/JoE4V0
	IHKtf/BZrDFuwPmRYzN+ytRVN5qm9rfUbT6oZuR4mVByqb1IVPs0RAomwNy/jEVS/TNl
	dCykVUceJTyHQlj8bp17QMdCxl1euZfzHx6c6ZdSllqvOs3++2/L5U/6KGcBHW9M/s59
	klHA==
X-Received: by 10.50.183.37 with SMTP id ej5mr13406964igc.95.1448721799594;
	Sat, 28 Nov 2015 06:43:19 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	c21sm14587203ioc.24.2015.11.28.06.43.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 Nov 2015 06:43:19 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Nov 2015 09:43:02 -0500
Message-Id: <1448721782-30965-1-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.6.3.368.gf34be46
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH] mkefidisk.sh: add startup script for automated boot
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
X-List-Received-Date: Sat, 28 Nov 2015 14:43:21 -0000

Regardless of which image is built using which layers, try to ensure the image
on the SD device being prepared is the one that is booted automatically when
the board is powered.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 scripts/contrib/mkefidisk.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index 23c18cb..333284f 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -438,6 +438,9 @@ if [ -d $ROOTFS_MNT/etc/udev/ ] ; then
 	echo "$TARGET_DEVICE" >> $ROOTFS_MNT/etc/udev/mount.blacklist
 fi
 
+# Add startup.nsh script for automated boot
+echo "fs0:\EFI\BOOT\bootx64.efi" > $BOOTFS_MNT/startup.nsh
+
 
 # Call cleanup to unmount devices and images and remove the TMPDIR
 cleanup
-- 
2.6.3.368.gf34be46



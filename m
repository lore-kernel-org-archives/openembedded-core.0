Return-Path: <tdh@tkhanson.net>
X-Greylist: delayed 467 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 19 Jun 2016 21:47:26 UTC
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
	[66.111.4.27])
	by mail.openembedded.org (Postfix) with ESMTP id 3B5AB62136
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2016 21:47:26 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 46779204F7;
	Sun, 19 Jun 2016 17:39:40 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute3.internal (MEProxy); Sun, 19 Jun 2016 17:39:40 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=tkhanson.net; h=cc
	:date:from:message-id:subject:to:x-sasl-enc:x-sasl-enc; s=
	mesmtp; bh=AxwyNTMUDZBpEUBz8AdLLan6fwA=; b=SdXXgu7vSTSQn1Ps2V7wl
	yD3xxDs4GSJU7eyeIiB7J18obIfQSOAUpJS+lF3+k8JY1+vp2F7hionwwNUxV1+/
	35IrCjD+7o8KIdKTZyRU2QPuvSR33/QJ5qwSGofsJhBeSF83ABqiUlmdTexSzIVB
	babp8j2DY9KHCveSg7oPdg=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-sasl-enc:x-sasl-enc; s=smtpout; bh=AxwyNTMUDZBpEUBz8AdLLan6fw
	A=; b=gqLzzvQ65cLXgwNpz29x8ykg2VkovxUdorbJI8pWS3xsxmv8AZyIB6zu8c
	WsAcjKSAaomrdpt3E3URrRCThQ9K+dMiLBMhTwdxp0KwMmDP66bzAJM226cOVvvz
	V3qvkwKfO1Pqc83RBLK7IT2vyolkZS7GEJGnMm/QezOFewC3I=
X-Sasl-enc: XUpCQjNefN0tIQNfINZ5CDe5DY56kp+Ei26l2c+bBeE0 1466372379
Received: from localhost.localdomain (c-69-140-48-38.hsd1.md.comcast.net
	[69.140.48.38])
	by mail.messagingengine.com (Postfix) with ESMTPA id D3F52F29EE;
	Sun, 19 Jun 2016 17:39:39 -0400 (EDT)
From: "Troy D. Hanson" <tdh@tkhanson.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Jun 2016 17:38:25 -0400
Message-Id: <1466372305-8895-1-git-send-email-tdh@tkhanson.net>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] mkefidisk.sh; correct quoting
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
X-List-Received-Date: Sun, 19 Jun 2016 21:47:27 -0000

mkefidisk.sh writes embedded control characters into startup.nsh.
Causes bootup to fail, dropping user into EFI shell.  Encountered while
following the the Yocto Quick Start example with the Minnowboard Max.

[YOCTO #9665]

Signed-off-by: Troy D. Hanson <tdh@tkhanson.net>
---
 scripts/contrib/mkefidisk.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index 333284f..a7b17d9 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -439,7 +439,7 @@ if [ -d $ROOTFS_MNT/etc/udev/ ] ; then
 fi
 
 # Add startup.nsh script for automated boot
-echo "fs0:\EFI\BOOT\bootx64.efi" > $BOOTFS_MNT/startup.nsh
+echo 'fs0:\\EFI\\BOOT\\bootx64.efi' > $BOOTFS_MNT/startup.nsh
 
 
 # Call cleanup to unmount devices and images and remove the TMPDIR
-- 
2.7.4



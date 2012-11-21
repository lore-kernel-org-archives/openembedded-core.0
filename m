Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TbBlK-0001SZ-4s
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 15:58:52 +0100
Received: by mail-wi0-f177.google.com with SMTP id c10so1707823wiw.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2012 06:44:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=qYdZwA0IJEKHZ5q2WTeQ/f8VYDPZ/5Rx+ZxyfQ3Z02g=;
	b=QbElVMHboVN/kxXvX0cSn8sDy/Fvite8rtmoHJ4LU302Uot8zISbebpY/G9+JKo6rt
	Ap7YOG9wby8taFsvWXSHGE/RfhE0fa7lyt4/YPp1s4hi0XYZ5YhtB3QuNnc+EIncGZx/
	KSLrNIHkxPL/w2ri4nTAp1PgKfeeE8oA9vS1c3LYibC5NLmsLDI3aD1U0SYIJJ63zn4J
	wOCSi4pngjhFEb1W35PyQnHOkgaW5dIeuTNY7xrHcLNY7U6NUF3BIdkorHjQNmYCtLI5
	vhkk5BTsgUIeFRFGl1+C0Aybm3cPrhHoeORiTzytFo8bUcrBF1U+gbRTgbvpEK5jVOKg
	Hirg==
Received: by 10.180.100.97 with SMTP id ex1mr14291608wib.1.1353509079559;
	Wed, 21 Nov 2012 06:44:39 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id s12sm22276357wik.11.2012.11.21.06.44.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Nov 2012 06:44:38 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Nov 2012 15:44:34 +0100
Message-Id: <1353509074-16375-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
X-Gm-Message-State: ALoCoQmOQMoFsO2GFNypaaKxtfzKwCf7Lkcrtf0mYXtWcfhm8WwUrvFbqFCuhgd1IqedYFyoQvlM
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] image classes: use PN for depends, not IMAGE_BASE_NAME
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
X-List-Received-Date: Wed, 21 Nov 2012 14:58:57 -0000

Some images override IMAGE_BASE_NAME in the recipe causing targets using image-{live,vmdk} to fail.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/image-live.bbclass |    2 +-
 meta/classes/image-vmdk.bbclass |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index 2f3261e..bfb59f8 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -10,6 +10,6 @@ LABELS_append = " ${SYSLINUX_LABELS} "
 ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext3"
 
 do_bootimg[depends] += "${INITRD_IMAGE}:do_rootfs"
-do_bootimg[depends] += "${IMAGE_BASENAME}:do_rootfs"
+do_bootimg[depends] += "${PN}:do_rootfs"
 
 inherit bootimg
diff --git a/meta/classes/image-vmdk.bbclass b/meta/classes/image-vmdk.bbclass
index 736d1d7..6f7df3f 100644
--- a/meta/classes/image-vmdk.bbclass
+++ b/meta/classes/image-vmdk.bbclass
@@ -8,7 +8,7 @@ SYSLINUX_LABELS = "boot"
 LABELS_append = " ${SYSLINUX_LABELS} "
 
 # need to define the dependency and the ROOTFS for directdisk
-do_bootdirectdisk[depends] += "${IMAGE_BASENAME}:do_rootfs"
+do_bootdirectdisk[depends] += "${PN}:do_rootfs"
 ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext3"
 
 # creating VMDK relies on having a live hddimg so ensure we
-- 
1.7.7.6




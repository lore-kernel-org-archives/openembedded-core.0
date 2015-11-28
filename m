Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9D9FA605B3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Nov 2015 14:30:07 +0000 (UTC)
Received: by igcmv3 with SMTP id mv3so45582749igc.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Nov 2015 06:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pMXJOpi3wLUblJtbbBdINHi8YYxRUq7ELM9yYVNQGGY=;
	b=CdhaRvQrPY34z26phecNWan1y+0CA81idzUF0DeWp5vQdz0qdgTOwNpRzZzAu0hglx
	/QsJvrwxQwH4JewRdNi70NRcp7QurRt99fpcKS+nlz2LPsT5SRM+xZqSovwNeO7wAK7d
	nF/Dl9GFqCC2ryJgtvnpcUqTL1GECzILkiKJsvOVMn2iXOPGLfHPEU638JhFbLYY+oSY
	kPPb1/Z8fn8jp3jllJ5YGQDIIvpdSB1fZKDqNk+PvvHE02eJTCPCyzIERvmpw3wiYwtj
	pfjEmRWTdJKE4OmYGIcTdGGX5EDTgPk4GEEsNG/U2Ja2XOoxebDul7V1qdlCA4KK3raS
	tE0A==
X-Received: by 10.50.155.65 with SMTP id vu1mr13448215igb.11.1448721007866;
	Sat, 28 Nov 2015 06:30:07 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	wi7sm1117842igb.19.2015.11.28.06.30.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 Nov 2015 06:30:07 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Nov 2015 09:29:51 -0500
Message-Id: <1448720991-29707-1-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.6.3.368.gf34be46
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH] mkefidisk.sh: add boot log on console
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
X-List-Received-Date: Sat, 28 Nov 2015 14:30:07 -0000

Hooking up a serial console is a "developer mode", the chances are pretty good
developers are interested in watching the kernel boot log on the console so
they can spot any problems or diagnose any failed boots (e.g. can't find root
fs).

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 scripts/contrib/mkefidisk.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index cd4de05..23c18cb 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -402,7 +402,7 @@ if [ -e "$GRUB_CFG" ]; then
 	sed -i "s/ LABEL=[^ ]*/ /" $GRUB_CFG
 
 	sed -i "s@ root=[^ ]*@ @" $GRUB_CFG
-	sed -i "s@vmlinuz @vmlinuz root=$TARGET_ROOTFS ro rootwait quiet @" $GRUB_CFG
+	sed -i "s@vmlinuz @vmlinuz root=$TARGET_ROOTFS ro rootwait console=ttyS0 console=tty0 @" $GRUB_CFG
 fi
 
 # Look for a gummiboot installation
@@ -419,7 +419,7 @@ if [ -d "$GUMMI_ENTRIES" ]; then
 
 	sed -i "/initrd /d" $GUMMI_CFG
 	sed -i "s@ root=[^ ]*@ @" $GUMMI_CFG
-	sed -i "s@options *LABEL=boot @options LABEL=Boot root=$TARGET_ROOTFS ro rootwait quiet @" $GUMMI_CFG
+	sed -i "s@options *LABEL=boot @options LABEL=Boot root=$TARGET_ROOTFS ro rootwait console=ttyS0 console=tty0 @" $GUMMI_CFG
 fi
 
 # Ensure we have at least one EFI bootloader configured
-- 
2.6.3.368.gf34be46



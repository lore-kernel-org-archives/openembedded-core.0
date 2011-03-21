Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q1jjP-00081B-RE
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 19:21:32 +0100
Received: by iwn10 with SMTP id 10so6835825iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2011 11:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=p2pYh+toMjPIsPrkOD4rslyQ7CaOMbHWJta2JPZQ0qg=;
	b=oMcOl6gW53Qc1+KHyDZwRsZsTx6SPGNEeHAnt46jGjONg4T1LLPuLisWDME0HsCBrB
	qShiISv2RKM7Ku5VRVvW90aWo1m3HD2u6BJLpUWHEB0MLYg82TWsIzXtEqeiXw3tvCK6
	ftqfZHEL0ytZ5tRLIgRZUCp+vIRW34R7VlmjU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=lm916z1mh6A/nt/YBLxENnW+Rw+SHCQP9AysswwSuzqAjDRLVCIKjEiNfIfR+brRn5
	rtVLqF2SBBvulLLejFGoypLy5f0qFC2uVQ/VsDO/rAd0JhEVKs4+oE2KrqhZtef1WoeO
	HXC3urSpp+oFboXA0b/7izGMrWdBZs+vK+7hA=
Received: by 10.42.115.131 with SMTP id k3mr2187861icq.143.1300731582460;
	Mon, 21 Mar 2011 11:19:42 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c4sm4100919ict.19.2011.03.21.11.19.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Mar 2011 11:19:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Mar 2011 11:19:37 -0700
Message-Id: <65b9e5677c44ce9adbcca244918cb063c55bd448.1300731432.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1300731432.git.raj.khem@gmail.com>
References: <cover.1300731432.git.raj.khem@gmail.com>
Subject: [PATCH 1/1] scripts/poky-qemu-internal: Add call to stty
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Mar 2011 18:21:32 -0000

When qemu is booted into console with -nographics
then after exiting the terminal line settings are messed
up. This patch calls stty sane to restore the terminal
settings to default.

stty is part of coreutils which is installed on all
host distros hence there is no need to warn about it
being available or not

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/poky-qemu-internal |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/scripts/poky-qemu-internal b/scripts/poky-qemu-internal
index 82ef265..ea6539e 100755
--- a/scripts/poky-qemu-internal
+++ b/scripts/poky-qemu-internal
@@ -187,6 +187,7 @@ cleanup() {
         echo "poky-export-rootfs stop $ROOTFS"
         poky-export-rootfs stop $ROOTFS
     fi
+    stty sane
 }
 
 n1=$[ (`echo $TAP | sed 's/tap//'` * 2) + 1 ]
@@ -377,7 +378,7 @@ if [ "$MACHINE" = "qemuppc" ]; then
     MACHINE_SUBTYPE=prep
     CPU_SUBTYPE=603e
     BIOS=powerpc_rom.bin
-    QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -nographic"
+    QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
     if [ "$FSTYPE" = "ext3" ]; then
         KERNCMDLINE="root=/dev/hda console=ttyS0 console=tty0 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $MACHINE_SUBTYPE -bios $BIOS -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
-- 
1.7.4.1




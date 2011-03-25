Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q3GZu-0007WS-FF
	for openembedded-core@lists.openembedded.org;
	Sat, 26 Mar 2011 00:38:03 +0100
Received: by pzk35 with SMTP id 35so225377pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2011 16:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=zRMxT0z54a3yYnlw1Waa02VgWujTA2XSu9sBGfVchNA=;
	b=qUETpTVbdc7QFCjVd8UO7G3XIQoIDnaVDkEQqf1X+6QGkcU9RYRzJPoC1bGK+QHnKz
	4YgmIrGCwxw5vCtX4W3GUv2giCJzryAlmkNxJBMgf9/+29ZgXJ7gGxPVNMzKOacnYQwW
	XR5k7hwo4o0JnQdNXnNszAafXdDjARCqdJXvw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=YWLNbMaR70CzTx07JXEnayrQ7nQjR3Osuy8qHw4LdbsSQN4qqYrbzJTjOHrtYtNhPG
	kQ1xFqZss1pFqpDLbkLur0YqMik60VdLivROv8kCHym8mHBh8/UM2bDGIHoF/dG+JCsc
	mYI52sB20atO3vYGMeeQskI0/JJK4KcZQY78c=
Received: by 10.142.148.16 with SMTP id v16mr1099632wfd.447.1301096167464;
	Fri, 25 Mar 2011 16:36:07 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id m10sm1935126wfl.23.2011.03.25.16.36.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 Mar 2011 16:36:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Mar 2011 16:36:02 -0700
Message-Id: <f237830edbabedd254ea7e56e741ece13418a8b0.1301095943.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301095943.git.raj.khem@gmail.com>
References: <cover.1301095943.git.raj.khem@gmail.com>
Subject: [PATCH V3 1/2] scripts/poky-qemu-internal: call stty sane before exit
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
X-List-Received-Date: Fri, 25 Mar 2011 23:38:03 -0000

When qemu is booted into console with -nographics
then after exiting the terminal line settings are messed
up. This patch calls stty sane to restore the terminal
settings to default.

stty is part of coreutils which is installed on all
host distros hence there is no need to warn about it
being available or not

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/poky-qemu-internal |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/poky-qemu-internal b/scripts/poky-qemu-internal
index 8fd1834..c88d711 100755
--- a/scripts/poky-qemu-internal
+++ b/scripts/poky-qemu-internal
@@ -189,6 +189,9 @@ cleanup() {
         echo "poky-export-rootfs stop $ROOTFS"
         poky-export-rootfs stop $ROOTFS
     fi
+    # If QEMU crashes or somehow tty properties are not restored
+    # after qemu exits, we need to run stty sane
+    stty sane
 }
 
 n1=$[ (`echo $TAP | sed 's/tap//'` * 2) + 1 ]
@@ -458,8 +461,7 @@ fi
 echo "Running $QEMU..."
 # -no-reboot is a mandatory option - see bug #100
 echo $QEMUBIN -kernel $KERNEL $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT --append '"'$KERNCMDLINE $SCRIPT_KERNEL_OPT'"'
-# If QEMU crashes, we need to run stty sane
-$QEMUBIN -kernel $KERNEL $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT --append "$KERNCMDLINE $SCRIPT_KERNEL_OPT" || stty sane
+$QEMUBIN -kernel $KERNEL $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT --append "$KERNCMDLINE $SCRIPT_KERNEL_OPT"
 
 
 cleanup
-- 
1.7.4.1




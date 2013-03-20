Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UIKu2-0005V8-Fe
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 16:26:11 +0100
Received: by mail-pb0-f52.google.com with SMTP id ma3so1434794pbc.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 08:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=nVqTswPSjPJIodbYrymQKnuyp1Vbtd4r81H9ng+ws9w=;
	b=Tw+f/KyZd25iMy/d6MHyqkMqfMdxU2cf4+m6wP6z5uRHO5Bgd/yUpf6UEh8R0sLdqM
	EnSQFiTMrwHDv1swMMGSSrxO3RV68I59Rd3CWK7ghXBPYQJXscf58zfcbV9XFsG9ZvAX
	On3Ak3sPrsPEixMj3ZRSjKkw8FPhel/4oMfbAPovFdCm7YvgvgJufh3zTGxU/UgP62PK
	VMC8HgG/MIiFInE/koq7b1Cq5ix+EwwwRD6g5XPDBohCuOZWUvYqmZDHgBrZq3gfuetP
	sUx6YZFJAP08RzozSNo2Y1f8M20BhDSbyenn49CyiG2QN+xQWkEAB8lNoJ/wDBvVGo5/
	ITQw==
X-Received: by 10.68.170.193 with SMTP id ao1mr9282931pbc.129.1363792158858;
	Wed, 20 Mar 2013 08:09:18 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ti8sm2430765pbc.12.2013.03.20.08.09.15
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 Mar 2013 08:09:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Mar 2013 16:09:10 +0100
Message-Id: <1363792150-24988-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH] util-linux: Use u-a for getopt
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
X-List-Received-Date: Wed, 20 Mar 2013 15:26:12 -0000

* when enable busybox installs getopt to ${base_bindir} and
  util-linux to ${bindir}, so there is no file conflict, but
  because busybox implementation does not support --long used
  by lsb_release (which RDEPENDS on util-linux) we need to use
  util-linux getopt even when busybox defconfig has it enabled

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc       | 6 ++++--
 meta/recipes-core/util-linux/util-linux_2.22.2.bb | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 41a5471..c75d318 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -110,7 +110,7 @@ do_install () {
 
         sbinprogs="agetty ctrlaltdel cfdisk vipw vigr"
         sbinprogs_a="pivot_root hwclock mkswap mkfs.minix fsck.minix losetup swapon fdisk readprofile fsck blkid blockdev"
-        usrbinprogs_a="chfn chsh hexdump last logger mesg newgrp renice utmpdump wall setsid chrt flock"
+        usrbinprogs_a="chfn chsh hexdump last logger mesg newgrp renice utmpdump wall setsid chrt flock getopt"
         binprogs_a="dmesg kill more umount mount login reset"
 
         if [ "${base_sbindir}" != "${sbindir}" ]; then
@@ -146,7 +146,7 @@ ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root"
 ALTERNATIVE_${PN} += "mkfs.minix hexdump last logger mesg renice wall"
-ALTERNATIVE_${PN} += "setsid chrt flock hwclock utmpdump eject"
+ALTERNATIVE_${PN} += "setsid chrt flock hwclock utmpdump eject getopt"
 
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
 ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
@@ -156,6 +156,8 @@ ALTERNATIVE_LINK_NAME[blockdev] = "${base_sbindir}/blockdev"
 ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
 ALTERNATIVE_LINK_NAME[mkfs.minix] = "${base_sbindir}/mkfs.minix"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
+ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
+ALTERNATIVE_TARGET[getopt] = "${bindir}/getopt"
 
 ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 mesg.1 wall.1 sulogin.8 utmpdump.1"
 
diff --git a/meta/recipes-core/util-linux/util-linux_2.22.2.bb b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
index 9b94a47..43a55a6 100644
--- a/meta/recipes-core/util-linux/util-linux_2.22.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.22"
-PR = "r2"
+PR = "r3"
 require util-linux.inc
 
 SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
-- 
1.8.1.5




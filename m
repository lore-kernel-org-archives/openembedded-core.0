Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5013071F1B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2015 07:40:46 +0000 (UTC)
Received: by wghl18 with SMTP id l18so38165262wgh.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Mar 2015 23:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=diSv4B3qrRtPBmNWZL3Y+FRPaJazX1pc0bBbxoSPyNU=;
	b=u/VO9yT6gPUuHczDdC0eFzobg3/GZ1BrZVOax09RuGvJG0OPeH4Aj0Rle0nBvc9wmz
	NOgCypG2lRm9Su9Yz+BELo28a0IN8UqKQMlrWn8ufAKj56eYaY4XSpL6CcmfGSQbIsdD
	GPVOPyqZi+cY3bN1Hfip7F9tRrp6jl5bveVa7CiQQECHkyjPgNOR6tUz/rN4b+DqNCY+
	E8+tE+Krt264jDM+hXegMFS0MwCh2NlL67cvXVbIQAh6a8/Iu6Dl11oAGVyr2nb72BGP
	8JBh1c34HZH1MjrSGHO5KQmZu7mddyGIkrtTB9UOZHpzfMv6hg5moKiQ3N/N559rr3Kj
	9Ocg==
X-Received: by 10.194.19.10 with SMTP id a10mr60989825wje.153.1425368447228;
	Mon, 02 Mar 2015 23:40:47 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bd3sm1190038wib.17.2015.03.02.23.40.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Mar 2015 23:40:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Mar 2015 08:40:47 +0100
Message-Id: <1425368447-10236-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [PATCH] util-linux: move getopt u-a link to base_bindir
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
X-List-Received-Date: Tue, 03 Mar 2015 07:40:51 -0000

* busybox installs getopt u-a in base_bindir when GETOPT is enabled, move util-linux
  link to the same location to fix calling u-a in read-only images
* remove unused variable usrbinprogs_a

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 3d8a4d0..dd607ef 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -83,7 +83,7 @@ FILES_util-linux-reset = "${base_bindir}/reset"
 FILES_util-linux-partx = "${sbindir}/partx"
 FILES_util-linux-hwclock = "${base_sbindir}/hwclock.${BPN}"
 FILES_util-linux-findfs = "${sbindir}/findfs"
-FILES_util-linux-getopt = "${bindir}/getopt.${BPN}"
+FILES_util-linux-getopt = "${base_bindir}/getopt.${BPN}"
 
 FILES_util-linux-libblkid = "${base_libdir}/libblkid.so.*"
 FILES_util-linux-libmount = "${base_libdir}/libmount.so.*"
@@ -139,8 +139,7 @@ do_install () {
 
         sbinprogs="agetty ctrlaltdel cfdisk vipw vigr"
         sbinprogs_a="pivot_root hwclock mkswap mkfs.minix fsck.minix losetup swapon swapoff fdisk fsck blkid blockdev fstrim sulogin switch_root"
-        usrbinprogs_a="chfn chsh hexdump last logger mesg newgrp renice utmpdump wall setsid chrt flock getopt readprofile"
-        binprogs_a="dmesg kill more umount mount login reset su"
+        binprogs_a="dmesg getopt kill more umount mount login reset su"
 
         if [ "${base_sbindir}" != "${sbindir}" ]; then
         	mkdir -p ${D}${base_sbindir}
@@ -234,6 +233,7 @@ ALTERNATIVE_LINK_NAME[reset] = "${bindir}/reset"
 ALTERNATIVE_TARGET[reset] = "${base_bindir}/reset"
 
 ALTERNATIVE_util-linux-getopt = "getopt"
+ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.3.1



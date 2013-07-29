Return-Path: <walters@verbum.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id E63FB6B42D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 17:48:16 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.mail.srv.osa [10.202.2.44])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 27A632167D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 13:48:15 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Mon, 29 Jul 2013 13:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:content-type:date
	:message-id:mime-version; s=smtpout; bh=Lke4PkKaFcp88jfonyBpaJyn
	j8A=; b=GkZHoO+kTk0zSIFcWuMUy2QqgILRiXy57ZikPalhTF5g9uy70xL9QOhs
	TfEgaL+kYpuA7UUyu4BZ38NMbtnnrJEM3I0Ud9q5JSzek/x9wT0cdjbPx40diCnc
	m6/NwiwtV5Gh/QFI/rXHqmhF9jS5uSp7y8t0a3Nb2467WUiyElY=
X-Sasl-enc: prHJcQXc0zL2E74APqT82y4wIlbvEBqB+j/qRrHv5lv8 1375120094
Received: from [192.168.1.2] (unknown [66.31.18.51])
	by mail.messagingengine.com (Postfix) with ESMTPA id C8CFDC00E83
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 13:48:14 -0400 (EDT)
From: Colin Walters <walters@verbum.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2013 13:48:13 -0400
Message-ID: <1375120093.15230.63.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 (2.32.3-13.el6) 
Subject: [PATCH] util-linux: Update for swapoff being a separate binary
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
X-List-Received-Date: Mon, 29 Jul 2013 17:48:17 -0000
X-Groupsio-MsgNum: 42627
Content-Type: multipart/mixed; boundary="=-leORBbz7p/tr2O+2L5xu"

--=-leORBbz7p/tr2O+2L5xu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

In older versions of util-linux, swapon and swapoff were the
same binary, and it did runtime detection.  But since v2.22
which is util-linux commit 6cf8d46ceefe9a7, they are separate
binaries.

This patch is necessary to make the util-linux version of
swapoff work at all - currently in OE swapoff = swapon, which
is clearly broken =)

Probably most OE consumers use the busybox swapoff and hence
this has gone unnoticed.

Signed-off-by: Colin Walters <walters@verbum.org>
---
 meta/recipes-core/util-linux/util-linux.inc |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)




--=-leORBbz7p/tr2O+2L5xu
Content-Disposition: attachment; filename*0=0001-util-linux-Update-for-swapoff-being-a-separate-binar.pat; filename*1=ch
Content-Type: text/x-patch; name="0001-util-linux-Update-for-swapoff-being-a-separate-binar.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From fe4bb20bbbff31ce1eb86afe8e81e8f0a3564877 Mon Sep 17 00:00:00 2001
From: Colin Walters <walters@verbum.org>
Date: Mon, 29 Jul 2013 08:43:14 -0400
Subject: [PATCH] util-linux: Update for swapoff being a separate binary

In older versions of util-linux, swapon and swapoff were the
same binary, and it did runtime detection.  But since v2.22
which is util-linux commit 6cf8d46ceefe9a7, they are separate
binaries.

This patch is necessary to make the util-linux version of
swapoff work at all - currently in OE swapoff = swapon, which
is clearly broken =)

Probably most OE consumers use the busybox swapoff and hence
this has gone unnoticed.

Signed-off-by: Colin Walters <walters@verbum.org>
---
 meta/recipes-core/util-linux/util-linux.inc |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index c783385..0e18567 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -116,7 +116,7 @@ do_install () {
 	mkdir -p ${D}${base_bindir}
 
         sbinprogs="agetty ctrlaltdel cfdisk vipw vigr"
-        sbinprogs_a="pivot_root hwclock mkswap mkfs.minix fsck.minix losetup swapon fdisk readprofile fsck blkid blockdev"
+        sbinprogs_a="pivot_root hwclock mkswap mkfs.minix fsck.minix losetup swapon swapoff fdisk readprofile fsck blkid blockdev"
         usrbinprogs_a="chfn chsh hexdump last logger mesg newgrp renice utmpdump wall setsid chrt flock getopt"
         binprogs_a="dmesg kill more umount mount login reset"
 
@@ -141,9 +141,6 @@ do_install () {
 	install -d ${D}${sysconfdir}/default/
 	echo 'MOUNTALL="-t nonfs,nosmbfs,noncpfs"' > ${D}${sysconfdir}/default/mountall
 
-	ln -sf swapon.${BPN}   ${D}${base_sbindir}/swapoff.${BPN}
-	rm -f ${D}${sbindir}/swapoff
-
 	rm -f ${D}${bindir}/chkdupexe
 }
 
-- 
1.7.1


--=-leORBbz7p/tr2O+2L5xu--

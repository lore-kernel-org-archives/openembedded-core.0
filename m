Return-Path: <alex.olson@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id CB2516AD55
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 20:10:47 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id n57so9719244wev.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 13:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=xB5uulCXYTqGh4P5DzROUz7Ra2bAWWdBqqmU0nmLzq4=;
	b=n0dLMePHCScAtvSwvLR2bIt6b4ahd5IreSjqoGJU4AftJtRDO2/TfEiNJ/sJE0tsVu
	AOdQ907985QMN+FKtDhoBtAUrr1KTsOt50RGYYP/w31qbgpEGVg34j6pxW4ZDjxYnopX
	l1/gAKNQXk/ojqMnAobmjvNh4gUTRhQUM1civuIPUpR2HylbKSgWqCw8aLil66MkbmKP
	5Z0AVop0l/ipGhqFLRaGDLNXB78DhTgkYC704mYSYFP2RbHdDvkaVlU5ZqQ98UdFYy3Y
	TeI43PhkAATnFuvcSFDsSMg9uWTumsM4RUrIuTx0xIVLhhqfIlXfypFwY3XTFSSCD5Z7
	U35g==
MIME-Version: 1.0
X-Received: by 10.180.188.97 with SMTP id fz1mr428819wic.34.1372191048229;
	Tue, 25 Jun 2013 13:10:48 -0700 (PDT)
Sender: alex.olson@gmail.com
Received: by 10.194.19.100 with HTTP; Tue, 25 Jun 2013 13:10:48 -0700 (PDT)
Date: Tue, 25 Jun 2013 15:10:48 -0500
X-Google-Sender-Auth: jZifVX2uB1cCCAME78nUP6acVgE
Message-ID: <CAGcOEOk7QUzUPnkwxKYEBKuauYvSh07BwcM0pB6chtCcD4f5tw@mail.gmail.com>
From: Alex Olson <alex.olson+yocto@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] udev - only use devtmpfs for udev
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
X-List-Received-Date: Tue, 25 Jun 2013 20:10:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

udev - only use devtmpfs for udev

Fix for bug: https://bugzilla.yoctoproject.org/show_bug.cgi?id=4632
Since udev 172, the 'mknod' logic was removed from udev. Yocto Dylan
is now using udev 182. This means /dev is now required to be a
devtmpfs filesystem (maintained by the kernel).    If the root
filesystem is a ramdisk,  the kernel's auto-mount of /dev doesn't
activate since there is no rootfs to actually mount...  The bug causes
an unusable system as /dev doesn't contain even basic nodes required
to even get a login prompt.

The Yocto  udev/init script mounts tmpfs if it does not detect tmpfs
or devtmpfs mounted at /dev.  This appears to be  outdated logic that
is no longer correct. I believe the Yocto udev init script should be
checking and mounting only 'devtmpfs' on dev.


Signed-off-by: Alex Olson <alex.olson+yocto@gmail.com>
--- a/meta/recipes-core/udev/udev/init  2013-05-18 14:38:09.000000000 -0500
+++ b/meta/recipes-core/udev/udev/init  2013-06-25 14:21:15.859918023 -0500
@@ -44,8 +44,8 @@
         halt
     fi
     # mount the tmpfs on /dev, if not already done
-    LANG=C awk '$2 == "/dev" && ($3 == "tmpfs" || $3 == "devtmpfs") {
exit 1 }' /proc/mounts && {
-            mount -n -o mode=0755 -t tmpfs none "/dev"
+    LANG=C awk '$2 == "/dev" && ($3 == "devtmpfs") { exit 1 }'
/proc/mounts && {
+            mount -n -o mode=0755 -t devtmpfs none "/dev"
     }
     [ -e /dev/pts ] || mkdir -m 0755 /dev/pts
     [ -e /dev/shm ] || mkdir -m 1777 /dev/shm


Return-Path: <net147@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0183B6F909
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 22:58:24 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id kq14so21351pab.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 15:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=LG0nZCROZ61dIoUSADR8L36NQ3Ld+v4gUphmlGhr6Lo=;
	b=rV9xKu5DBhdwU5a56IbJDsE/xanS4loICOpY5l67G8j7PIFSynVMZTHZPzZmmeZQID
	jrdsZZPOsaeSrAPA/qmow9BkbJx8H5HX8XS6M1yt5FmTJDKbd1XIgo1V1TRG06RI4GWd
	v1S9vPs86pW9eJ5bo9mS94pHC4eMwKAf5BrZ+INd73JIZfCP6KY4tPdOAzV05BfsFRWu
	jeUq2fJ7adt1XXApbZ+zasghFCuYt7CIMpBpfpXkaKyA94Cw+H3AIfiDWHVbOpawFQL2
	s+3sTCO6W6YWg+8CdZDcFQs9euDKG15+IfV/nsFvKkPas0o0P9uGcgm95+zSDBW3QU6k
	WVVA==
X-Received: by 10.67.13.134 with SMTP id ey6mr43358565pad.44.1395269905505;
	Wed, 19 Mar 2014 15:58:25 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id dk1sm2473pbc.46.2014.03.19.15.58.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Mar 2014 15:58:24 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Mar 2014 10:02:41 +1100
Message-Id: <1395270161-24084-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] base-files: use /dev/root in /etc/fstab for systemd support
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
X-List-Received-Date: Wed, 19 Mar 2014 22:58:27 -0000

systemd does not recognize "rootfs" in /etc/fstab so the root
filesystem is not checked. As a result, the following message
is logged by journalctl:
systemd-fstab-generator[68]: Checking was requested for "rootfs", but it
is not a device

Changing "rootfs" to "/dev/root" in /etc/fstab allows systemd to
check the root filesystem when the kernel is booted with the root
filesystem mounted read-only.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/base-files/base-files/fstab | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files/fstab b/meta/recipes-core/base-files/base-files/fstab
index e625ebc..739b844 100644
--- a/meta/recipes-core/base-files/base-files/fstab
+++ b/meta/recipes-core/base-files/base-files/fstab
@@ -1,6 +1,6 @@
 # stock fstab - you probably want to override this with a machine specific one
 
-rootfs               /                    auto       defaults              1  1
+/dev/root            /                    auto       defaults              1  1
 proc                 /proc                proc       defaults              0  0
 devpts               /dev/pts             devpts     mode=0620,gid=5       0  0
 usbdevfs             /proc/bus/usb        usbdevfs   noauto                0  0
-- 
1.9.0



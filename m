Return-Path: <net147@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2C5C160E79
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 22:59:31 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id y13so28573pdi.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 15:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=fkbFYmAeQG/jOokvQUyPq/XZoOAB3thhEE39wUmk6po=;
	b=grUtyVOIs8/Wm4+vXS4YaXQGnKUWIF9y/JI5rgj84M14e8AxMXqCpMpG2gqTQNZw85
	l45glCmy5zYcxRfKsMp/XqYHLk1wB/ZJa9VYkgAjxn1gdQzpCQZE1MyqbK3HaNT3Tknn
	xHKQDqU/KFMKjw2JrpgzGWTlQdnD3lFJjg6rjAWlYPlo5CIw1LjwZpElc1YNT1su+kRe
	zf1eHseLGivJFYeVXkRjPicOGzpG28jzhL+LfjqfHOqtHgpCq+YdXHzWR0TyQzgmozC3
	eknAVfB+FQpWfQDgzW8sUh9C5eL6yKaDKHlJb4q8ekRiUZCtle+nxXvan+CaQtzAKQbu
	rxvQ==
X-Received: by 10.66.164.36 with SMTP id yn4mr42578253pab.25.1395269972714;
	Wed, 19 Mar 2014 15:59:32 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id eb5sm7609pad.22.2014.03.19.15.59.30
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Mar 2014 15:59:32 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Mar 2014 10:05:04 +1100
Message-Id: <1395270304-24331-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH v2] base-files: use /dev/root in /etc/fstab for systemd support
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
X-List-Received-Date: Wed, 19 Mar 2014 22:59:33 -0000

systemd does not recognize "rootfs" in /etc/fstab so the root
filesystem is not checked. As a result, the following message
is logged by journalctl:
systemd-fstab-generator[68]: Checking was requested for "rootfs", but it
is not a device

Changing "rootfs" to "/dev/root" in /etc/fstab allows systemd to
check the root filesystem when the kernel is booted with the root
filesystem mounted read-only.

[YOCTO #5950]

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



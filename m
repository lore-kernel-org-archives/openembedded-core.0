Return-Path: <guslees@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3D0BB6011C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 05:49:36 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id i19so3610672pfd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 22:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=aZJYUvyhAj3gS7zgibMF0MIlI2oVhp9BfGpkFPWxwMQ=;
	b=i2dqcfP1gSq7wMei3qBnL9RKy/HSntnk7dLOxh36he+KytzfzdI7AN9hpXArv7gD4H
	tNSvb8Zi688ExzVkFYqgdzGT7VUAiCkQK1H2uNMA8Ha4gmeCsadGXV3C1riFQ0EgUN01
	cmb7xQjyDg3Xg0/MCElECfU6VtpowvQA8HW+JXi5E/XgnzTzJrEjZiZjGPQgkLrxYwf4
	IVV2DcYK4MzeXaokJSgb5SEmL5kcZt3o4FN2GOxQVJd7Ka3X+LOms+nhfmZonDnw1ceY
	PnJbsCPuhi4p7A157tJmPJLhRYPqG/GqqhDkFvLomMHxehwtQy6dr97+gadjtujQNHcN
	nBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=aZJYUvyhAj3gS7zgibMF0MIlI2oVhp9BfGpkFPWxwMQ=;
	b=eyVJ+fv8TONSC6t6acKZGlNgxQ6JhumvRJ567HNaZeLOAyc/Lrp0aTP03oYB7Cj9HN
	Wkf+TV9CQEX+yH0MSntUSRtXUNKnP7vcpjHxRD9beIjCD4Y4wWtsnS1+3JRXosiU8YHw
	bH7k83LMKLQFRXiFwaCHeD8aM/AVeJHJFBZwjyStEUNd1tDz00m1gc0JOhvx6FM9Lukn
	r2CWUZv0Gbib2LVCIZ9kugrseONH9pBlkeC4tguTfVLF20KUO0d9mtWisQlfUtov+PSx
	I7Xrdy7y+uGGOePXmxtyyPNpCXkHn8CQf9CwUIzGf5b6wO99RIwsPkMUOQ3PdDepepOY
	6BUw==
X-Gm-Message-State: APjAAAUvDWQj0OnsypABw7rQJFBUkjzXO5zbcKNcIEsWRICF2zVLXpjd
	/GAZEaTv+fYhHsvyIyYNEMhni2H0mJc=
X-Google-Smtp-Source: APXvYqwDAyjUNdwIdVRx6at+y6k09NbFsHYqW6KNR0hFiNXoiKbyEh58SuIIC/bZTSEP3p103hmtZg==
X-Received: by 2002:a17:902:ab82:: with SMTP id
	f2mr1714337plr.93.1553147377054; 
	Wed, 20 Mar 2019 22:49:37 -0700 (PDT)
Received: from roachbait.lan
	(2001-44b8-3185-9c00-ea2a-eaff-fe60-e749.static.ipv6.internode.on.net.
	[2001:44b8:3185:9c00:ea2a:eaff:fe60:e749])
	by smtp.gmail.com with ESMTPSA id
	16sm6851593pfz.106.2019.03.20.22.49.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Mar 2019 22:49:36 -0700 (PDT)
Sender: Angus Lees <guslees@gmail.com>
From: Angus Lees <gus@inodes.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2019 16:46:05 +1100
Message-Id: <20190321054605.902-1-gus@inodes.org>
X-Mailer: git-send-email 2.11.0
Cc: Angus Lees <gus@inodes.org>
Subject: [PATCH] Revert "wic: Set a miniumum FAT16 volume size."
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
X-List-Received-Date: Thu, 21 Mar 2019 05:49:37 -0000

This reverts commit f7dfb4d43247d3c13a4e0a3853007d63b9512b83.

FAT16 volumes do not have a minimum size of 8250 blocks
(== slightly over 4MB).  Exhibit A: floppy disks.

The original commit message suggests this was a workaround for a bug in
parted - in which case we should fix it there, or use the wic
`--fixed-size` option to pass down an enforced minimum from a more
context-aware point in the callstack.
---
(This should also be backported to sumo)

 scripts/lib/wic/partition.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 3fe5c4e26c..2178321404 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -322,7 +322,7 @@ class Partition():
 
         dosfs_cmd = "mkdosfs %s -i %s %s %s -C %s %d" % \
                     (label_str, self.fsuuid, size_str, extraopts, rootfs,
-                     max(8250, rootfs_size))
+                     rootfs_size)
         exec_native_cmd(dosfs_cmd, native_sysroot)
 
         mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (rootfs, rootfs_dir)
-- 
2.11.0



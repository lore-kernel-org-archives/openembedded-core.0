Return-Path: <ptsneves@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 26720786CD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Feb 2018 16:50:04 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id l191so18895776lfe.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Feb 2018 08:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=kTAuMx+Aaf3/JRAx0rLO7zlwm4c05AebmIUXLzkAbG0=;
	b=Rb78G/nfHV3JrW5N71ouFne4W4oG55gs8zgjs5nJbzJAYv+g82kd1k4HGSGZ7hOf4B
	S6MheKCv/05U0IKSdoNlAXk/fxNP9iqEfVQ4drTsEvWlwkTw3eR/VUPVVSzX//XSCMmC
	8lGB5Kmf7TlYNH2M2dRB/safY493Pl2q+u45dfHRTLndcjSmxDjalz+yK7U5xM2TFWQF
	VQN1oJ48b8FSX+6+TxJAQVL1gZE+EqKPmMUlyJSmrIHTAZFiXXkYdo8G1KJeb85rKnzq
	itKRowSM6bOmQd8gz5HBqKM7tSVGzbshJPckIwqJ8T2YkpNTDqwnfH7XOdFuf3DSB2MX
	+E0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kTAuMx+Aaf3/JRAx0rLO7zlwm4c05AebmIUXLzkAbG0=;
	b=DY1g300/5iRKi/fFLh8CChnLJdiIbELl6f+4rumGMkM0plZh2vcCMpHOSEK4CYutec
	4QP0otGZUAKtuqBtUYkmRzhjKovc7+0yaBjJhWZQRWbDXsrNG5j8h1t6Wl5D5OgMKzMc
	fJHoTk57fd4Rzig0e2Gri7cAhqifL9TVggPNBR6yptQcTj+w0SRCg8HWI5YA6Aa8LHdm
	IC+QaHP8FROfPuitwH03BYIhVrRKH0HuHeLJ+3xBtqI20uwfXMXxi4YvJh85IGWNG4SR
	xy3rRcKrKbxjYmE4qtxweEoizWpW2oYLiQikgb4kS/QRfebu2h/bhnC/ncZ/464Pf2dp
	goQw==
X-Gm-Message-State: APf1xPC0Y/mo911XI/Q9DRLf+YVlxpyXVcB1oHyUK8iw9v/h0q5A9h4i
	f252UZUsG420G68/ztI12/aPNFM=
X-Google-Smtp-Source: AG47ELuV5iz4TugSgB1b3eJKc2kJsd8iUm89HoTRC0OQQUvX0ys4iKWvbDHQMcPGR2ifTTzbHraMKw==
X-Received: by 10.46.93.207 with SMTP id v76mr5929669lje.134.1519577405494;
	Sun, 25 Feb 2018 08:50:05 -0800 (PST)
Received: from localhost.localdomain (user-94-254-244-94.play-internet.pl.
	[94.254.244.94]) by smtp.gmail.com with ESMTPSA id
	m202sm1517669lfg.37.2018.02.25.08.50.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Feb 2018 08:50:04 -0800 (PST)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Feb 2018 17:49:25 +0100
Message-Id: <20180225164926.18993-1-ptsneves@gmail.com>
X-Mailer: git-send-email 2.14.1
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH 1/2] wic: partition plugin wrongly assumes it is rootfs
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
X-List-Received-Date: Sun, 25 Feb 2018 16:50:05 -0000

The partition plugin is used as the base for other plugins.
One of the methods the plugins use, is the prepare_rootfs
method.

The prepare_rootfs method wrongly assumes that the value
ROOTFS_SIZE from bitbake datastore is relevant to every
invocation of prepare_rootfs, which it clearly is not, for
example in the bootimg-partition case.

This commit adds an optional argument to prepare_rootfs
where a caller can tell prepare_rootfs if it is an actual
rootfs and whether related rootfs information retrieved from
bitbake is valid. The default behavior of this optional
argument is to assume that the invocation is an actual
rootfs, to maintain compatibility with previous
implementations.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 scripts/lib/wic/partition.py                        | 4 ++--
 scripts/lib/wic/plugins/source/bootimg-partition.py | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 72f2e2708f..695e0abd3b 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -199,7 +199,7 @@ class Partition():
                            (self.mountpoint, self.size, self.fixed_size))
 
     def prepare_rootfs(self, cr_workdir, oe_builddir, rootfs_dir,
-                       native_sysroot):
+                       native_sysroot, real_rootfs = True):
         """
         Prepare content for a rootfs partition i.e. create a partition
         and fill it from a /rootfs dir.
@@ -223,7 +223,7 @@ class Partition():
             os.remove(rootfs)
 
         # Get rootfs size from bitbake variable if it's not set in .ks file
-        if not self.size:
+        if not self.size and real_rootfs:
             # Bitbake variable ROOTFS_SIZE is calculated in
             # Image._get_rootfs_size method from meta/lib/oe/image.py
             # using IMAGE_ROOTFS_SIZE, IMAGE_ROOTFS_ALIGNMENT,
diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index 67e5498d5e..b239fc0b4c 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -129,4 +129,4 @@ class BootimgPartitionPlugin(SourcePlugin):
 
         logger.debug('Prepare boot partition using rootfs in %s', hdddir)
         part.prepare_rootfs(cr_workdir, oe_builddir, hdddir,
-                            native_sysroot)
+                            native_sysroot, False)
-- 
2.14.1



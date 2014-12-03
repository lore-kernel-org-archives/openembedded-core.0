Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2B2ED7209B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 16:21:52 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id kx10so16091191pab.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Dec 2014 08:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=g2dvU8MS0/n96bMhBhupeNpEyBJu03LgBcgiVNewXSY=;
	b=nic8+mCDuKKyticBhNF9ob8OBSI4mHwHUZrnfM8gdsEQwhVDXDpod6jP2QKUUqWnmW
	KPhoMqDP6AJFaVFDFEr39chVMEdliWL5qHXD4PzIjBuTzlTXPkjfcVwsa6SjZ780dgLS
	3wSbjApsB0vaiKgoHZr8rRLN58ApDKSOVzI33P83a77mUHEPhajacw5/o8uKktKUnB5v
	I4SxOoA9P+nwXcn5fr1KNIhbUu31M5L6yGcyIe6KFDfpH675ZjWhXxnU4xQtoAGePDNe
	X+vW+LNpkodx+MViv7goeIlxS3HSd+CWZ13+sE7FK0LSdZ5l4DoKLSTmVTDmTF5bmGXG
	F1Zg==
X-Received: by 10.70.100.199 with SMTP id fa7mr10241281pdb.114.1417623713442; 
	Wed, 03 Dec 2014 08:21:53 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id l6sm23580640pdr.39.2014.12.03.08.21.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Dec 2014 08:21:52 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Dec 2014 08:21:41 -0800
Message-Id: <d881747edf02dc49bb619d2bc1e6215270d8a0a3.1417623438.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1417623438.git.akuster808@gmail.com>
References: <cover.1417623438.git.akuster808@gmail.com>
In-Reply-To: <cover.1417623438.git.akuster808@gmail.com>
References: <cover.1417623438.git.akuster808@gmail.com>
Subject: [PATCH 1/2] wic: Use overhead factor when creating partitions from rootfs directories
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
X-List-Received-Date: Wed, 03 Dec 2014 16:21:56 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

When creating partitions sized to given rootfs directories, filesystem
creation could fail in cases where the calculated target partition
size was too small to contain the filesystem created using mkfs.  This
occurred in particular when creating partitions to contain very large
filesystems such as those containing sdk image artifacts.

This same limition is present in the oe-core image creation classes,
which can be readily see by changing IMAGE_OVERHEAD_FACTOR from the
default 1.3 to 1.0 and building a sato-sdk image.

It should be possible to calculate required sizes exactly given the
source rootfs and target filesystem types, but for now, to address the
specific problem users are hitting in such situations, we'll just do
exactly what oe-core does and define and use an IMAGE_OVERHEAD_FACTOR
or 1.3 in those cases.

Fixes [YOCTO #6863].

(From OE-Core rev: bbaef3ff5833fc1d97b7b028d7770834f62789da)

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/wic/kickstart/custom_commands/partition.py | 2 ++
 scripts/lib/wic/utils/oe/misc.py                       | 1 +
 2 files changed, 3 insertions(+)

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index 3950b43..54a494e 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -229,6 +229,7 @@ class Wic_PartData(Mic_PartData):
             extra_blocks = IMAGE_EXTRA_SPACE
 
         rootfs_size = actual_rootfs_size + extra_blocks
+        rootfs_size *= IMAGE_OVERHEAD_FACTOR
 
         msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
                     (extra_blocks, self.mountpoint, rootfs_size))
@@ -276,6 +277,7 @@ class Wic_PartData(Mic_PartData):
             extra_blocks = IMAGE_EXTRA_SPACE
 
         rootfs_size = actual_rootfs_size + extra_blocks
+        rootfs_size *= IMAGE_OVERHEAD_FACTOR
 
         msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
                     (extra_blocks, self.mountpoint, rootfs_size))
diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index aa9b235..b0b5baa 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -123,6 +123,7 @@ def add_wks_var(key, val):
 
 BOOTDD_EXTRA_SPACE = 16384
 IMAGE_EXTRA_SPACE = 10240
+IMAGE_OVERHEAD_FACTOR = 1.3
 
 __bitbake_env_lines = ""
 
-- 
1.9.1



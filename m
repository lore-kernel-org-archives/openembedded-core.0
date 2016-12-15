Return-Path: <kergoth@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id DF99D77248
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 19:42:41 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id 189so10191798pfz.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 11:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=EWfGzrgtwFzNPM4+SjFDtnyxdNA2f1EGJ6ZKgTXdp18=;
	b=GmVJmgOb6PfRQPxUrwpj/V6iL90kW3eOn/HYaEfVZaCoO7DzTlpGkgb3hYkzcQ7/89
	Qz3lu4hj0I2qjRgWt/azn1Lf4QcFOawzGb/uNOoYNEItiH1dk4tZhwXghPQFPicHOQMA
	YpUHXw8y11Rkx6FIJ0bj545C+g99m8HTjjuP6wxvOvGEV5AanYLRIR3dho1UP1ZfjTD5
	Co8WK5Ry0NaTNVlXO/7cDad/ECzs3Sv/Irr/QYxGN0U3ZQG+55Bl+XQ9U0LUqe75UBm3
	OAzi5N+eyLWBkRvOl56gZfpug5zh4nIT0BAerpomjsmHtZ+Z05R7NrGfAvNQjE5ztGhO
	XEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EWfGzrgtwFzNPM4+SjFDtnyxdNA2f1EGJ6ZKgTXdp18=;
	b=OrklB26Mh9u3ewZVDZWkyJHNlJpLrOCt+FGtVavnJiAh8U98eeG8DF2et/f/cpfm29
	imsybHgG+KmBWgA65BEkll+LjDU+khZ94DoQiNcuGfEgESMMa1qM12G+De2Ra7YEh9pC
	n1rU/T5O9zDbtbg5pCYB4/aAqcNJay2I/cbzCX+/ub3nkJc12wNiCF2vzFtsRU3i07/j
	c3zepBHfFXl92Ku99XPSK6EiI1by6lsn5eTcH79Gx8xuoQqApcCQWMLsoJnD4PFnafCz
	7cI0r5BbP06leFI3jC25ze1JJBzFqpXobMll4hZerCTgCs14m7bYVP1GX+S3EUl0PmkN
	OTCg==
X-Gm-Message-State: AKaTC00/W/wl2AZxsLeR1j5sZlvCnagleSrXIpshk42mpO/UjSLEf/H4jMC5UUkgCd42bw==
X-Received: by 10.84.133.69 with SMTP id 63mr5667552plf.15.1481830963371;
	Thu, 15 Dec 2016 11:42:43 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	y200sm6401594pfb.16.2016.12.15.11.42.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 15 Dec 2016 11:42:42 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2016 12:42:39 -0700
Message-Id: <1481830959-24831-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] wic: obey the rootfs size from the metadata
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
X-List-Received-Date: Thu, 15 Dec 2016 19:42:43 -0000

From: Christopher Larson <chris_larson@mentor.com>

When no --size is specified for the rootfs in the .wks, we want to obey the
rootfs size from the metadata, otherwise the defined IMAGE_ROOTFS_EXTRA_SPACE
and IMAGE_OVERHEAD_FACTOR will not be obeyed. In some cases, this can result
in image construction failure, if the size determined by du was insufficient
to hold the files without the aforementioned extra space.

This fallback from --size to ROOTFS_SIZE was already implemented when
--rootfs-dir is specified in the .wks, but it did not occur otherwise, neither
when --rootfs-dir= was passed to `wic create` nor when IMAGE_ROOTFS was used.
This made a certain amount of sense, as this fallback logic happened at such
a level that it wasn't able to identify which partitions were rootfs
partitions otherwise. Rather than doing it at that level, we can do it in
prepare_rootfs(), which is run by the rootfs source plugins.

Note that IMAGE_OVERHEAD_FACTOR and a --overhead-factor in the .wks will now
both be applied when --size isn't specified in the .wks. A warning is added
about this, though a user won't see it unless wic fails or they examine the
do_image_wic log.

Fixes [YOCTO #10815]

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/lib/wic/partition.py | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index ac4c836..b191cde 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -28,7 +28,7 @@ import os
 import tempfile
 
 from wic.utils.oe.misc import msger, parse_sourceparams
-from wic.utils.oe.misc import exec_cmd, exec_native_cmd
+from wic.utils.oe.misc import exec_cmd, exec_native_cmd, get_bitbake_var
 from wic.plugin import pluginmgr
 
 partition_methods = {
@@ -194,6 +194,17 @@ class Partition():
             msger.error("File system for partition %s not specified in kickstart, " \
                         "use --fstype option" % (self.mountpoint))
 
+        # Get rootfs size from bitbake variable if it's not set in .ks file
+        if not self.size:
+            # Bitbake variable ROOTFS_SIZE is calculated in
+            # Image._get_rootfs_size method from meta/lib/oe/image.py
+            # using IMAGE_ROOTFS_SIZE, IMAGE_ROOTFS_ALIGNMENT,
+            # IMAGE_OVERHEAD_FACTOR and IMAGE_ROOTFS_EXTRA_SPACE
+            rsize_bb = get_bitbake_var('ROOTFS_SIZE')
+            if rsize_bb:
+                msger.warning('overhead-factor was specified, but size was not, so bitbake variables will be used for the size. In this case both IMAGE_OVERHEAD_FACTOR and --overhead-factor will be applied')
+                self.size = int(round(float(rsize_bb)))
+
         for prefix in ("ext", "btrfs", "vfat", "squashfs"):
             if self.fstype.startswith(prefix):
                 method = getattr(self, "prepare_rootfs_" + prefix)
-- 
2.8.0



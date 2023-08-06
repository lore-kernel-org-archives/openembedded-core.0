Return-Path: <charles-antoine.couret@mind.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB3CC04E69
	for <webhook@archiver.kernel.org>; Sun,  6 Aug 2023 21:14:08 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.19654.1691356441176008502
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Aug 2023 14:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mind.be header.s=google header.b=eor8JAN+;
 spf=pass (domain: essensium.com, ip: 209.85.221.49, mailfrom: charles-antoine.couret@essensium.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3175f17a7baso2827277f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 14:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1691356439; x=1691961239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYhqziA1aSTdq1Ymgxyf/OWY+6CjckhuuYlfvfxE87U=;
        b=eor8JAN+H+kloxKA+V7RpKQX6KXCGap9Hd2GVzPaUid+vdzSXxPAJhY3lM1P44OWaG
         uVYu+SVuWCYgj4RQxBoethrAgQpJ5UhrAmIHLQH3GOl3fNCQ6E7XHLfZGS8uA88et+6C
         JjpfQ73gzzHNXMBtp0zsJwwNBNah6Sv96eBH/6AC6dWoZqaKCW02Wy5S+dGxw0h7vH/u
         /mZigQ8WCxnReW6XNOpUQomN6BnemIqEBYFKPwDX87XDQ2YAk30YuF+W3htoBtt2fn6w
         QKqpU+4SNQudgI4xYD2IKvbMbVozHthht+MKKqPCLwkDxDLSGg/CyKSCglwC2Y0uFQRw
         Qurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691356439; x=1691961239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYhqziA1aSTdq1Ymgxyf/OWY+6CjckhuuYlfvfxE87U=;
        b=R8u5dAOObPhzA+8BVG/jP6HIlt7lkrrVZBBL1e2x3IotoU79jy1wICaf4lUiFLxGxh
         67Bzh8zVS2diZEFqup7ZHHvn5jDeGXt/3CQrF/QNyrH2IO7UWgKCSBz4s+fHXk/DFgpl
         kfzU+WPLxWBs2lSyARCh6vtJfE7Qukx7x+z5/cTqKUk+T7mzW/r/gHyiseHGWKYsU9z8
         NoPfdTEA7kPxHmD+sTZeI9/dz6x3epMiGfnwLAv7t9PK3owWgbGKXbj0kxOeenPmyR2I
         a2cuwphj/A4MSbYiiYXe2vZwrUbbF1I5weAzu2nn/STiR4wtG89Xhuk9k9Mbau3ycS3t
         FCMA==
X-Gm-Message-State: AOJu0YzPEbljYk4Eq3B6/r9YiSg0XjoABwCDP+jPjUU9eQZtOteT8wgG
	8UTz0axuFKpiN94Eo/c/bT8TrCg/fEZwbzQrORA=
X-Google-Smtp-Source: AGHT+IGYgOronmvBDpPYYX9eHDkwmP5X6XXZvmH2YEhVwAh33NDXHNtmlUS8OEHEkONE0CZ/k/LP0w==
X-Received: by 2002:a5d:54d2:0:b0:317:e025:5a5c with SMTP id x18-20020a5d54d2000000b00317e0255a5cmr1681322wrv.48.1691356439672;
        Sun, 06 Aug 2023 14:13:59 -0700 (PDT)
Received: from Bishop.fritz.box ([2a02:578:85c6:1101:e7a2:3f2c:a83f:5e92])
        by smtp.gmail.com with ESMTPSA id 21-20020a05600c021500b003fe1a092925sm8612055wmi.19.2023.08.06.14.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 14:13:59 -0700 (PDT)
From: Charles-Antoine Couret <charles-antoine.couret@mind.be>
To: openembedded-core@lists.openembedded.org
Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>
Subject: [PATCH 1/5 v2] image_types: add python function to get the IMAGE_FILE_MAXSIZE:fstype value
Date: Sun,  6 Aug 2023 23:13:42 +0200
Message-ID: <20230806211348.1191553-2-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230806211348.1191553-1-charles-antoine.couret@mind.be>
References: <20230806211348.1191553-1-charles-antoine.couret@mind.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 21:14:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185575

It returns 0 if the variable is not set for this filesystem.

In case of fixed partitionning where the rootfs partition can't exceed an
amount of bytes, there is currently no automatic and no generic way to have
this requirement met in any case.

Until now, ROOTFS_SIZE value got from directory_size() does not takes into account
the size of required metadata for the filesystem itself (and does not work well
for other block size than 4k BTW).
Obviously it's a difficult task which depends on rootfs size and filesystem type.

The workaround was to set IMAGE_OVERHEAD_FACTOR and IMAGE_ROOTFS_EXTRA_SPACE
to add the required extra margins. But when the final rootfs is closed to the
maximum size, it's difficult to adjust them correctly  And if you remove
or add new recipes in your image, you've to recompute these margins to have enough
space for these metadata when the rootfs is small, and to not have too big final
file when the rootfs is big.

It's cumbersome and error prone to just have a build failure when the final output
can't be flashed into the partition.

The solution is to follow how it's implemented in buildroot by having a
specific variable, here IMAGE_FILE_MAXSIZE, to create the final sparse file
and trying to fill it with the content of rootfs. If there is enough space,
margins are well compressed and does not consume space in the filesystem.
If there is no enough space, an error is triggered to warm the developer before
trying to use it in the device.

If IMAGE_FILE_MAXSIZE is not set, the idea is to keep the previous behaviour
for compatibility reason and to met other requirements.

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
---
 documentation/ref-manual/variables.rst  | 14 ++++++++++++++
 meta/classes-recipe/image_types.bbclass |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index fc29e476cd..d0e476d2eb 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3476,6 +3476,20 @@ system and gives an overview of their function and contents.
       variable, see the ":ref:`dev-manual/customizing-images:customizing images using custom \`\`image_features\`\` and \`\`extra_image_features\`\``"
       section in the Yocto Project Development Tasks Manual.
 
+   :term:`IMAGE_FILE_MAXSIZE`
+      Specifies the maximum size in kilobytes to create the image file for a
+      specific image type, which corresponds to the value set in
+      :term:`IMAGE_FSTYPES`, (e.g. ``ext3``,
+      ``btrfs``, and so forth). When setting this variable, you should use
+      an override for the associated type. Here is an example::
+
+         IMAGE_FILE_MAXSIZE:ext4 = "8192"
+
+      It overrides the :term:`IMAGE_OVERHEAD_FACTOR` and
+      :term:`IMAGE_ROOTFS_EXTRA_SPACE` mechanism for some filesystems.
+      If the maximum size is below the required size to store the rootfs content,
+      the operation will fail.
+
    :term:`IMAGE_FSTYPES`
       Specifies the formats the OpenEmbedded build system uses during the
       build when creating the root filesystem. For example, setting
diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index 023eb87537..33c65e8282 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -54,6 +54,13 @@ def imagetypes_getdepends(d):
     # Sort the set so that ordering is consistant
     return " ".join(sorted(deps))
 
+def get_max_image_size(d, fs):
+    max_size = d.getVar("IMAGE_FILE_MAXSIZE:%s" % fs)
+    if max_size is not None:
+        return max_size
+
+    return 0
+
 XZ_COMPRESSION_LEVEL ?= "-9"
 XZ_INTEGRITY_CHECK ?= "crc32"
 
-- 
2.41.0



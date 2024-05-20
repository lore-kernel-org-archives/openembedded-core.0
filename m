Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B46C41513
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 13:34:06 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.60347.1716212037498830794
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 06:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tDuirZ7M;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1f0937479f8so71647175ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 06:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716212037; x=1716816837; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PU45kwa7GPlCKVBq6n6JkhqTIhYA/V3S3fsUD53hkj4=;
        b=tDuirZ7M/mt7f9X8n9wlhlHJPCpZp1yItsP4GXfKeKZcsG1NdcvhCJQqlG9z5FU+wM
         BfzQJRIK5PbYoKSmZIqhZ8+HscDBRW4FATXN8OQrpc8QRvhFXbnR2hTp7UFQK7d+uALP
         wqjoROPxMhi6Eyll1oVvfiA7hvW2cq0Ip3YQaXYm/qEpH7x7jwRfUHJSavBglilNkKbA
         g1MxzavPz4vI0Jr1MRQrWfR0hgCB2Bi7Pwg7+ra98Q3vZ3eaVhw8FhcAxRzPitFTP7aS
         nL37z7SU2VrFqJX/DIFZhPP/Kf4sKAUnXVq/FG/pJA52P62S/fE6rJ+YeVmozZ3x0mnQ
         Bx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716212037; x=1716816837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PU45kwa7GPlCKVBq6n6JkhqTIhYA/V3S3fsUD53hkj4=;
        b=ODxJrKtnOM4Cjvb0SBlWTpz7faIhL341ihL9Gu2CjbrdxsRpl4M2H1IDEDqtclBqJC
         bWN/dVzMy9wm7GWfIC02lu8e2lyN2mMXkJk9nQ8WT6PYljRitkxLYJobQq5GfGY5tNTy
         5yudjUe5ApUF5+KuxgGNsTg08044aZ6vtNm/jPGe7zW0t9/6S2DplAjYFzEJhfOJB9UD
         G2gCaAmFLBhKKDM0EGFRqF8vUEimwaTnrnA70uAaIFKKl4ucQXBFjo8Y1I2TGVEgVBSI
         D5oJiFnwuIRrOUFOa8BqvMRFhc/mM5upW19J6E+2idOUgOJcXwyIdyMh5Bsj6jtcRwc3
         yi3g==
X-Gm-Message-State: AOJu0Yy6xC5QEclV3QYsvWIdUu8w7X5/OBh8S5jktD7vZlDTOQAtEAwf
	gCZoIWGX4sXiHtHHh40IUs3UkdYYEYMzlGqXmMrUIEnCZb5AUQXjPTPrtnLToNMIYgOFkdyHD5y
	v
X-Google-Smtp-Source: AGHT+IHNlD0jOE7C1FjNIicM3c5/38DQMjy2FVSSsJ3LF+OqSAdBye2v96f4vSYAyfRm+i4Flm3aww==
X-Received: by 2002:a05:6a21:3115:b0:1b0:812:ab3e with SMTP id adf61e73a8af0-1b00812ab79mr21059674637.38.1716212036684;
        Mon, 20 May 2024 06:33:56 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a66621sm19671465b3a.13.2024.05.20.06.33.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 06:33:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/21] classes: image_types: apply EXTRA_IMAGECMD:squashfs* in oe_mksquashfs()
Date: Mon, 20 May 2024 06:33:24 -0700
Message-Id: <39fc503036312e38ff0b9d8fb90b4c929b5ca7df.1716211838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716211838.git.steve@sakoman.com>
References: <cover.1716211838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 13:34:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199584

From: Martin Hundebøll <martin@geanix.com>

Since commit c991f9d6031 ("image_types: Set SOURCE_DATE_EPOCH for squashfs"),
I assume, the EXTRA_IMAGECMD:squashfs* variable(s) has been ignored.
This is due to the override magic, which isn't applied to functions
called by IMAGE_CMD:<type>, but only to the IMAGE_CMD:<type> itself.

Other image types (e.g. ext*) works around this by passing the
EXTRA_IMAGECMD variable as an argument to the called function.

To do the same for oe_mksquashfs(), the number of mandatory arguments is
fixed to one (with a little logic to handle the zstd filename). This
allows passing ${EXTRA_IMAGECMD} as an argument to oe_mksquashfs(),
which makes the variable functional again.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/image_types.bbclass | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index 913cb8788c..b4a83ae284 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -112,18 +112,22 @@ IMAGE_CMD:btrfs () {
 }
 
 oe_mksquashfs () {
-    local comp=$1
-    local suffix=$2
+    local comp=$1; shift
+    local extra_imagecmd=$@
+
+    if [ "$comp" = "zstd" ]; then
+        suffix="zst"
+    fi
 
     # Use the bitbake reproducible timestamp instead of the hardcoded squashfs one
     export SOURCE_DATE_EPOCH=$(stat -c '%Y' ${IMAGE_ROOTFS})
-    mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}.squashfs${comp:+-}${suffix:-$comp} ${EXTRA_IMAGECMD} -noappend ${comp:+-comp }$comp
+    mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}.squashfs${comp:+-}${suffix:-$comp} -noappend ${comp:+-comp }$comp $extra_imagecmd
 }
-IMAGE_CMD:squashfs = "oe_mksquashfs"
-IMAGE_CMD:squashfs-xz = "oe_mksquashfs xz"
-IMAGE_CMD:squashfs-lzo = "oe_mksquashfs lzo"
-IMAGE_CMD:squashfs-lz4 = "oe_mksquashfs lz4"
-IMAGE_CMD:squashfs-zst = "oe_mksquashfs zstd zst"
+IMAGE_CMD:squashfs = "oe_mksquashfs '' ${EXTRA_IMAGECMD}"
+IMAGE_CMD:squashfs-xz = "oe_mksquashfs xz ${EXTRA_IMAGECMD}"
+IMAGE_CMD:squashfs-lzo = "oe_mksquashfs lzo ${EXTRA_IMAGECMD}"
+IMAGE_CMD:squashfs-lz4 = "oe_mksquashfs lz4 ${EXTRA_IMAGECMD}"
+IMAGE_CMD:squashfs-zst = "oe_mksquashfs zstd ${EXTRA_IMAGECMD}"
 
 IMAGE_CMD:erofs = "mkfs.erofs ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${IMAGE_NAME}.erofs ${IMAGE_ROOTFS}"
 IMAGE_CMD:erofs-lz4 = "mkfs.erofs -zlz4 ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${IMAGE_NAME}.erofs-lz4 ${IMAGE_ROOTFS}"
-- 
2.34.1



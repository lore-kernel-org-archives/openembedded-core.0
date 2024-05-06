Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3D5C10F16
	for <webhook@archiver.kernel.org>; Mon,  6 May 2024 12:24:44 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.19293.1714998280964660352
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 05:24:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=FVvQi82x;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=EwEVwY0M8fgFKIYRm8Mjx7xccTvwWRRhPAZfujb9RN4=; b=FVvQi82xd3jdxWUFNXPiqKl2IK
	JAkqvbia0bu10k83NIIWqRdGBt2bkzOvSoYDRuBaNaUyzz0SOyF3fXGLYXf/DPJJ0gHGII3BidlyH
	2S3SLn//e34J78hxtwZESBpp45WT4QywPR3LyDGD8GbB/30zUvD2JpLspiHwF4RdYzjzBhGi6y8ol
	QMp8TI1lDMVhFYBOZKDz97ucsd1dWz9WnHo6eRk550c+gdvqCA3cCttsSJz+zBC9zNk8bhxC9fgID
	zLO2EOIAzSnXXLhQGAT0fLwM3vUldaq8rxryhkkn7YyaWQ2GRrX9GqCHjjSVIW7n5OFngruGdr8j4
	ckfRwX7g==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1s3xOX-0003ws-RQ; Mon, 06 May 2024 14:24:37 +0200
Received: from [185.17.218.86] (helo=zen..)
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1s3xOX-000HIM-0t;
	Mon, 06 May 2024 14:24:37 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>,
	=?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [PATH][master][scarthgap] classes: image_types: apply EXTRA_IMAGECMD:squashfs* in oe_mksquashfs()
Date: Mon,  6 May 2024 14:24:13 +0200
Message-ID: <20240506122414.1783512-1-martin@geanix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27267/Mon May  6 10:24:34 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 12:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199041

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
2.44.0



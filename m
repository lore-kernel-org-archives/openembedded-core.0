Return-Path: <wak@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A56D8ECAAD2
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 23:10:30 +0000 (UTC)
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com
 [209.85.128.201])
 by mx.groups.io with SMTP id smtpd.web12.5240.1661814626322085196
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 16:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=ZgvxwLjC;
 spf=pass (domain: flex--wak.bounces.google.com, ip: 209.85.128.201,
 mailfrom: 3yucnywmkaeq2gqmuumrk.ius@flex--wak.bounces.google.com)
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-3363b1dffa0so150423577b3.23
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 16:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc;
        bh=s79i5BRpjkadnS3F+anOjg2DotvRUd6EaopToFUbPPI=;
        b=ZgvxwLjCtJUpuMwTeO8cGIwVNp1EIeEdV+EeJY0IgXfocmn+/DDmklePvs+rDmb5Fp
         FUnjN4CJRAIB4n/tAFNg2itiFqJDiJrMXNpp/al5tRPQZAAqfQIey0hIz72YqTF+7HBo
         sorOJzKtGWJdno/ZPQXQKgcZOTwydvsERYS7VzeeIXb3hmEglob3fmehoWk2W88T+eSm
         2TyWhe1VTMJIpS/AWVvlwKqRVLjNU8QpBTAajSV2YICyTWNJtOyr5Cm2lBIez4gatmfv
         lpl+vheePvKvP/KDC/5iDijVLZwKp9JvFeLL8sXK7NQwwtwc4ZMHP+nQ0Wl/lvLNwz7G
         +Xtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc;
        bh=s79i5BRpjkadnS3F+anOjg2DotvRUd6EaopToFUbPPI=;
        b=lPTEF+umU2TfsN5+7yQde8qZTiB135sotm6FHO4ZoooUANmjsw5VjGxAwrKAbXOAD+
         hWyswCYzh1jdM+0TgqaQ6cFFkhUZJecnvf5G6WVI8r/pS4BtbhSboAPqQMzNcs+99TVI
         dTGWHVjVy5xcTXQjI2HtkuNR6L+SAZJI0iOn4x+oGjbLeG10aSDt/zoYYATFps+YCrFC
         4zGZfY3K//e4ti8dvIqnmpwtDAYXpVzEZLYmJLwm9+BPy0j46bzSxmYRLMS4rHCHb/LK
         F/f3CdR+UEYpvdhqsN8YNDmPPnS3TK20goHGAZwwlDiShlCpaLBDgwynRoWE5KtvHnpn
         YpLw==
X-Gm-Message-State: ACgBeo1kbPjLaxCbeMty9qwmOiPgkEEq18Aou/CuIognxPwSK6joSaXI
	NmKvdkgEwNRB5XnVdnwxBphvuFtKAYq4hfzcnVk9SSRW942+zteRIDQTYGWCZ3FqAwiSN3QT2lc
	Z1MwugY1j2y4NrbWcVWzZBkRT3etLlqlm2F6YB+W35xBRM45YEQ8DgpEcTk+tTLQzhohR+XETOR
	Zhhw==
X-Google-Smtp-Source: 
 AA6agR6zlgN6sJK1RtP3a3MtMrM2NcMDQ0+9B+9xumnPXKwVRSSFN57rMQCCZ6cS0XkhABO/LJW+CK8=
X-Received: from wak-linux.svl.corp.google.com
 ([2620:15c:2c5:13:f09:65fb:3a24:a5b4])
 (user=wak job=sendgmr) by 2002:a25:bf92:0:b0:695:8d8f:2af4 with SMTP id
 l18-20020a25bf92000000b006958d8f2af4mr10022866ybk.200.1661814625614; Mon, 29
 Aug 2022 16:10:25 -0700 (PDT)
Date: Mon, 29 Aug 2022 16:10:22 -0700
Message-Id: <20220829231022.662462-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Subject: [PATCH] image_types: Set SOURCE_DATE_EPOCH for squashfs
From: "William A. Kennington III" <wak@google.com>
To: openembedded-core@lists.openembedded.org
Cc: "William A. Kennington III" <wak@google.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Aug 2022 23:10:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170040

We want to use the reproducible timestamp for all of the files that is
set rootfs-postcommands.bbclass, derived from
REPRODUCIBLE_TIMESTAMP_ROOTFS. Without this, we use a hardcoded time
that is built into the squashfs sources.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 meta/classes-recipe/image_types.bbclass | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index a731e585b2..764e6a5574 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -109,11 +109,19 @@ IMAGE_CMD:btrfs () {
 	mkfs.btrfs ${EXTRA_IMAGECMD} -r ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.btrfs
 }
 
-IMAGE_CMD:squashfs = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs ${EXTRA_IMAGECMD} -noappend"
-IMAGE_CMD:squashfs-xz = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-xz ${EXTRA_IMAGECMD} -noappend -comp xz"
-IMAGE_CMD:squashfs-lzo = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-lzo ${EXTRA_IMAGECMD} -noappend -comp lzo"
-IMAGE_CMD:squashfs-lz4 = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-lz4 ${EXTRA_IMAGECMD} -noappend -comp lz4"
-IMAGE_CMD:squashfs-zst = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-zst ${EXTRA_IMAGECMD} -noappend -comp zstd"
+oe_mksquashfs () {
+    local comp=$1
+    local suffix=$2
+
+    # Use the bitbake reproducible timestamp instead of the hardcoded squashfs one
+    export SOURCE_DATE_EPOCH=$(stat -c '%Y' ${IMAGE_ROOTFS})
+    mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs${comp:+-}${suffix:-$comp} ${EXTRA_IMAGECMD} -noappend ${comp:+-comp }$comp
+}
+IMAGE_CMD:squashfs = "oe_mksquashfs"
+IMAGE_CMD:squashfs-xz = "oe_mksquashfs xz"
+IMAGE_CMD:squashfs-lzo = "oe_mksquashfs lzo"
+IMAGE_CMD:squashfs-lz4 = "oe_mksquashfs lz4"
+IMAGE_CMD:squashfs-zst = "oe_mksquashfs zstd zst"
 
 IMAGE_CMD:erofs = "mkfs.erofs ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.erofs ${IMAGE_ROOTFS}"
 IMAGE_CMD:erofs-lz4 = "mkfs.erofs -zlz4 ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.erofs-lz4 ${IMAGE_ROOTFS}"
-- 
2.37.2.672.g94769d06f0-goog



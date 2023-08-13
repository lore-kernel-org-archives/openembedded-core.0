Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 053DAC41513
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 21:19:39 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.94032.1691961573003920662
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 14:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=jfFbBFRu;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-26b2beae166so1048920a91.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 14:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691961572; x=1692566372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4rYc7kv+dgfhVqEz0nerYFTgWRXqoVC91sGIfVqWqb4=;
        b=jfFbBFRunH0bsZum+W+wDbJx5dCyMb3ilrkGldV4sY0DDKnHp9Rojzb+/9ijVfNXRt
         PFkPyVWKPS7QbHTuRxFSmwMio3EqPoDfNO3Wh7vn5OkvK7rSpLLHX6RyeS1sLKH5CE1f
         v+SZms7rn4hX4kNB+EaEc00IPX9TNJHobh9a5HwTFyQvTt9kLAc1vnxMoKDxQXSf8QkN
         vlqpZ0TkTfcMxh71rGsTt32/o/On3dVT/iRMKPxqB3Fu/ZYQWisRCSNp6QOiQb3h9i+U
         uJ81f4Xp7Qfi/Y3bOdBu2P5+1OikeWrKstA1g3OE6k+ls4LYVEcGKKMWXHfTb3L0eQOV
         YHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691961572; x=1692566372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rYc7kv+dgfhVqEz0nerYFTgWRXqoVC91sGIfVqWqb4=;
        b=gpEMD+3E05kA/eWulKHSw247dGnpP5YsgGOGRxu6/s7dkmqQkfcZ6jvnxznpiyaUGj
         6GD29KNZb3LcorpEVajxbBqa2YmrKQhcZvOGZZWGPUnfpZqVbGRD8ZzvzF/QJOy24QSu
         KdpitnuX9/cGujdMPokiLyRWOMU7sj6gMavB4hib8Gv40CLoCtXvAVIEbhOlhRM+IV2U
         u733FJokfEZZcpGeeIFD+dEP4TAjV9/dddNuCDAlvbDeymwQBFh5vRy9LjIFqSe6PlmI
         NE/o2o1Uuqrv1l+vedjGVD4s6YPxhsMYrZxsHtSXrf6yR10t0RGHZOfexPiuMJZ3bt+X
         J0Ag==
X-Gm-Message-State: AOJu0Yw+MKCA5nXOqJufrI3PK6eIj4jv6p1PRdtROyWfJys0Gp8o4ccN
	XfzpTupouGERTnw45d7YSbNgvPvjWILnwVoeIQnH6w==
X-Google-Smtp-Source: AGHT+IEHPxa2biKFl3vrgFTAOezjLbFCyFn/KXSlmqmuf0zAcwXRUwikQdkNKvUOafC8UMUIl9sc9Q==
X-Received: by 2002:a17:90b:8d1:b0:26b:4f2f:6da7 with SMTP id ds17-20020a17090b08d100b0026b4f2f6da7mr1895474pjb.1.1691961572074;
        Sun, 13 Aug 2023 14:19:32 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id qa2-20020a17090b4fc200b00263dfe9b972sm8690578pjb.0.2023.08.13.14.19.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 14:19:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 22/22] kernel: skip installing fitImage when using Initramfs bundles
Date: Sun, 13 Aug 2023 11:18:28 -1000
Message-Id: <b70a8333a7467162b9d148b99f5970c0af2a531f.1691961051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691961051.git.steve@sakoman.com>
References: <cover.1691961051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 21:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185913

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

When including an initramfs bundle inside a FIT image, the fitImage is created
after the install task by do_assemble_fitimage_initramfs.

This happens after the generation of the initramfs bundle
(done by do_bundle_initramfs).

So, at the level of the install task we should not try to install the fitImage.
The fitImage is still not generated yet.

After the generation of the fitImage, the deploy task copies the fitImage from
the build directory to the deploy folder.

Change-Id: I3eaa6bba1412f388f710fa0f389f66631c1c4826
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1b67fd9ac74935fa41e960478c54e45422339138)
Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index c6310d8de7..5d8b3b062a 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -417,12 +417,26 @@ kernel_do_install() {
 	#
 	install -d ${D}/${KERNEL_IMAGEDEST}
 	install -d ${D}/boot
+
+	#
+	# When including an initramfs bundle inside a FIT image, the fitImage is created after the install task
+	# by do_assemble_fitimage_initramfs.
+	# This happens after the generation of the initramfs bundle (done by do_bundle_initramfs).
+	# So, at the level of the install task we should not try to install the fitImage. fitImage is still not
+	# generated yet.
+	# After the generation of the fitImage, the deploy task copies the fitImage from the build directory to
+	# the deploy folder.
+	#
+
 	for imageType in ${KERNEL_IMAGETYPES} ; do
-		install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION}
-		if [ "${KERNEL_PACKAGE_NAME}" = "kernel" ]; then
-			ln -sf ${imageType}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${imageType}
+		if [ $imageType != "fitImage" ] || [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ] ; then
+			install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION}
+			if [ "${KERNEL_PACKAGE_NAME}" = "kernel" ]; then
+				ln -sf ${imageType}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${imageType}
+			fi
 		fi
 	done
+
 	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
 	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
 	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
-- 
2.34.1



Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF9C5C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 14:16:02 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.11451.1648476961286971675
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 07:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YzfIl0HU;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id w7so25016701lfd.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 07:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Goh0mQt1lMW8Tu0170K+CIcNMi7BQ3KjE730VtuwQg=;
        b=YzfIl0HUiGjjr2vGEG5vmcUqzEevX4m4lGhBrPubd5ecIwP4yo7F5yxzasYej1JjRQ
         gTc7+ClpB20sD5nJMscbwg79b+DO9RMbmJNYaC7cft6JEc96yEYSY0qNBJyiQ7fL7Wx3
         slK0aLdKDRu1NxeHgir/FWkS6xIrPPRPrdzK0/0smblEiC3Zj83t/Vu1TJKo1Q3T/ggS
         XlU4rTM+GKKpIRUSYuhCjDX9HpRBiYGhTu9Bxvjjhc1Wmeumj3aakhdzRt8V8PRCKopQ
         uPE7pgmHaXUtkcPA2ehDo0SYPfZGG0ljujP3wudgYXmpPKJ4wVbr+MOqp/ZUjsgsw28J
         df8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Goh0mQt1lMW8Tu0170K+CIcNMi7BQ3KjE730VtuwQg=;
        b=x30cDO+VZPhhcjrVu6XJjLcsYKqIaL4GKQ0egdHge57E0iE5wcfabw/E5Ig2isG69A
         QKm4PS6orTka6bkHKmguLN6zg8ceJ6e1BFkbFR+sw8sWGOBrP9NMA217STfy5uQ8KkYE
         8Hf3d+z7xCxL45hNchTUkwp2rGx5INTr204UU++/J/c73lAW1S/ml+ABbvRpnM2+wRmZ
         S5O2IP+bmGGjLRW7Ihd3sGo7ZGWNlbVKaUXl9HQXwTSQ+7llOCgz1waS6/O5b0LFoFUP
         0dIZHAadwgpoe20d3/3DzqzH3WlnMa7+8htLFb9AdJgDUrhVjKioo6CLdMnGq0RlwaX0
         UOsA==
X-Gm-Message-State: AOAM531Aetwc6NQTn9j3/NFtvfpvffcv+9++6P7iqyJJqkdNDTmEYHzt
	3I92uwb/atKfl/+Rfg57j8A7LT0XBSunDA==
X-Google-Smtp-Source: 
 ABdhPJxvd0qTK3TJTW6xz1JwdrfgezRqCeareaWt2Fvn/GTwAp1dJou3OJW8RYzDLIhrSgxZ3m0unA==
X-Received: by 2002:a05:6512:ad3:b0:44a:614e:9d4d with SMTP id
 n19-20020a0565120ad300b0044a614e9d4dmr18360965lfu.557.1648476959490;
        Mon, 28 Mar 2022 07:15:59 -0700 (PDT)
Received: from localhost.localdomain ([2a00:801:73c:8290:4c78:ea54:965b:7b3c])
        by smtp.gmail.com with ESMTPSA id
 r11-20020a2e8e2b000000b0024980665874sm1729301ljk.52.2022.03.28.07.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 07:15:59 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH 2/2] kernel-fitimage.bbclass: introduce
 FIT_SUPPORTED_INITRAMFS_FSTYPES
Date: Mon, 28 Mar 2022 16:15:51 +0200
Message-Id: <20220328141551.571676-3-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220328141551.571676-1-liu.ming50@gmail.com>
References: <20220328141551.571676-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 14:16:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163709

From: Ming Liu <liu.ming50@gmail.com>

It was found when a end user wants to build a squashfs type initramfs
into fitimage, it just fails without printing out any error or warning
messages, which is not right.

Introduce a FIT_SUPPORTED_INITRAMFS_FSTYPES variable to avoid
hard-coding the supported initramfs types, and it could be overridden
in config files. Also break the build when none of a supported
initramfs type is found.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/kernel-fitimage.bbclass | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 13af4daafc..f28c943860 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -65,6 +65,8 @@ FIT_SIGN_INDIVIDUAL ?= "0"
 FIT_CONF_PREFIX ?= "conf-"
 FIT_CONF_PREFIX[doc] = "Prefix to use for FIT configuration node name"
 
+FIT_SUPPORTED_INITRAMFS_FSTYPES ?= "cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.zst cpio.gz ext2.gz cpio"
+
 # Keys used to sign individually image nodes.
 # The keys to sign image nodes must be different from those used to sign
 # configuration nodes, otherwise the "required" property, from
@@ -566,16 +568,22 @@ fitimage_assemble() {
 	#
 	if [ "x${ramdiskcount}" = "x1" ] && [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
 		# Find and use the first initramfs image archive type we find
-		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.zst cpio.gz ext2.gz cpio; do
+		found=
+		for img in ${FIT_SUPPORTED_INITRAMFS_FSTYPES}; do
 			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img"
 			if [ -e "$initramfs_path" ]; then
 				bbnote "Found initramfs image: $initramfs_path"
+				found=true
 				fitimage_emit_section_ramdisk $1 "$ramdiskcount" "$initramfs_path"
 				break
 			else
 				bbnote "Did not find initramfs image: $initramfs_path"
 			fi
 		done
+
+		if [ -z "$found" ]; then
+			bbfatal "Could not find a valid initramfs type for ${INITRAMFS_IMAGE_NAME}, the supported types are: ${FIT_SUPPORTED_INITRAMFS_FSTYPES}"
+		fi
 	fi
 
 	fitimage_emit_section_maint $1 sectend
-- 
2.25.1



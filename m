Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B598C61DB3
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:45:18 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.18434.1700657114026053165
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 04:45:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VHxEQ+UR;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c87adce180so46935071fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 04:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700657112; x=1701261912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZyEUh/T/qToStF5ZzG0KtriNPfDdQITZFOzGEjOxIQ=;
        b=VHxEQ+URNLphCrJ34LUWTXeaPx88/h9JOR10ek/CnKwZ9PNUbPRxCdUJ+oWw3Kkb4/
         CJBuK3QOEbtdqoej0gz9kJw39SKUCM+npczr5p4cFqqG4KbvzadwWD4081OxTl5sAjFR
         z+oKrk05dTBeumNA9fxF6UblX1+MlKmV9uaSUHVzCRm2WAORsqmRYkOaZw8aiPcVmalv
         QO8BPJbJmV3F7GOnmOoQVCzPAJr4JZ2r7dGwyFqsbF0gj66Mh4KPd1TDk4HCOEES58ZI
         eqvD9/wvd25CFOhd7x+Ya84hiNIRg/AjpISug0070OOjggagVQiZe1LMearBrf1pMGsK
         +8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700657112; x=1701261912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZyEUh/T/qToStF5ZzG0KtriNPfDdQITZFOzGEjOxIQ=;
        b=GHXgn9PsB6DFj9zkHqyGRfhFDZJ7SOGqEQWUdZ9vm81sdM7iqIiDl+OHjJV3+P6Vgc
         0hktK9LgX9LH4cEZSNDuMEVDQmcTtqFPCHFPTWCjgr2iV9EIOC1Htz9ZWMCuLruroqzc
         1HyQTNPBfYi2+BnbKk5GSAlMk3D/jXoePsBtBDq7eJN/PVR9hDF5MyDyG2mnts9bteuJ
         jB4Hqsbrg7h9q2xluAixieCGPf9PAsj561J3wkilLYc/Ws5OP/SjgVKYymAwic3ZBdbt
         7HzSLVw9/+yGndZ2duZZFc7OCQaB8xZx22ylowTrkAvu1Tm2ef86UmoUJAmwUbkVf5Cx
         v7Nw==
X-Gm-Message-State: AOJu0YyZROgFJ3o6Rd82my96jr1nwKpMbCPHmwMhwWw35VXaZqQS66Ff
	vvb3S6tnsSmYGsbZMh6c2VH7wtDMo7E=
X-Google-Smtp-Source: AGHT+IE6NtY20SVzFZCMOkeGmMJZ+dClN4Nsl2cx34+mxRAGA1kV7rkj1h8LxT20V020U+x2Ndxa+A==
X-Received: by 2002:a05:6512:ac3:b0:509:1033:c544 with SMTP id n3-20020a0565120ac300b005091033c544mr2343365lfu.50.1700657112170;
        Wed, 22 Nov 2023 04:45:12 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id cm7-20020a170906f58700b009e5e1710ae7sm5377963ejd.191.2023.11.22.04.45.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 04:45:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/21] kernel-fitimage.bbclass: avoid duplicate .bin extension
Date: Wed, 22 Nov 2023 13:44:35 +0100
Message-ID: <e85b3b89eaeb8770bd0156f61068e8e20ba1e719.1700600804.git.martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1700600804.git.martin.jansa@gmail.com>
References: <cover.1700600804.git.martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 12:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191082

* the linux.bin was deployed as:
  fitImage-linux.bin${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}
  where KERNEL_FIT_BIN_EXT is the 2nd ".bin"

* add the${KERNEL_FIT_BIN_EXT} also to corresponding links:
  fitImage-linux${KERNEL_FIT_LINK_NAME}${KERNEL_FIT_BIN_EXT}

[YOCTO #12937]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 266680ffa8..25a33123a6 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -845,7 +845,7 @@ kernel_do_deploy:append() {
 			bbnote "Copying fit-image.its source file..."
 			install -m 0644 ${B}/fit-image.its "$deployDir/fitImage-its${KERNEL_FIT_NAME}.its"
 			bbnote "Copying linux.bin file..."
-			install -m 0644 ${B}/linux.bin $deployDir/fitImage-linux.bin${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}
+			install -m 0644 ${B}/linux.bin $deployDir/fitImage-linux${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}
 		fi
 
 		if [ -n "${INITRAMFS_IMAGE}" ]; then
@@ -865,13 +865,13 @@ kernel_do_deploy_links:append() {
 		else
 			if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
 				ln -vf $deployDir/fitImage-its${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its${KERNEL_FIT_LINK_NAME}"
-				ln -vf $deployDir/fitImage-linux.bin${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-linux.bin${KERNEL_FIT_LINK_NAME}"
+				ln -vf $deployDir/fitImage-linux${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-linux${KERNEL_FIT_LINK_NAME}${KERNEL_FIT_BIN_EXT}"
 			fi
 
 			if [ -n "${INITRAMFS_IMAGE}" ]; then
 				ln -vf $deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}${KERNEL_FIT_LINK_NAME}"
 				if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
-					ln -vf $deployDir/fitImage-${INITRAMFS_IMAGE_NAME}${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}${KERNEL_FIT_LINK_NAME}"
+					ln -vf $deployDir/fitImage-${INITRAMFS_IMAGE_NAME}${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}${KERNEL_FIT_LINK_NAME}${KERNEL_FIT_BIN_EXT}"
 				fi
 			fi
 		fi
-- 
2.43.0



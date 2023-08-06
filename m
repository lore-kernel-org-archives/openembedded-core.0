Return-Path: <charles-antoine.couret@mind.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AACA7C04A6A
	for <webhook@archiver.kernel.org>; Sun,  6 Aug 2023 21:14:08 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.19680.1691356443767383686
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Aug 2023 14:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mind.be header.s=google header.b=PQhjtMaC;
 spf=pass (domain: essensium.com, ip: 209.85.128.43, mailfrom: charles-antoine.couret@essensium.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fe426b86a8so30959215e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 14:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1691356442; x=1691961242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZG1iJZoCpSpl4eL30M5IH8WQPHYpPpyh/WJOq0ap5k=;
        b=PQhjtMaClWlsN+AuirBvmYFvxiUQxImkT9F96WzYWfAVyR8MEHjHZVXhsf3MS77vxZ
         INeHpcuGWLCJV4iuFj0AcXiObBqyueC3rDqId5NaQBIfkekMQm7icIilC9UgT1s57E6w
         NMhtnksmv13mQ7FLDVFYPbOdoBfqR/lFlRPshg1VU2gGfgYZH1oyU/FT0V4qEmGiVaGg
         iiJPjCAxXkUvoeRu7GIABAdPHtXp5GIgTcEGMHPDbggHAU9ySeSwD+HXO6Z+O84H5Md+
         +6Ir6DdSRjBpf2R6Wo51JdhRKAxy9xnNRBXcMQxTmzyHT97wqZ3YsOY1BU285XVot3lS
         O+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691356442; x=1691961242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZG1iJZoCpSpl4eL30M5IH8WQPHYpPpyh/WJOq0ap5k=;
        b=HWrs7xSDlR1FKRpMQrPOUyMuwECOdxGbhen1S9/wKsum+Dq4IpxjFL12mmKppmkw60
         EUv9/PDR73dhSahS3f06AYBlZG06k3F88YQ7d08WLozb/Bk7reSihCeZBxov29kkgqP+
         u3KNpq1YQGj+Szzj8g8oFMy8QIf/cXqk9TFnRhaEZW+6YP1kOVIIj386CblGGkfXwET4
         rr1RqdrRm/BixI0QZjgrHJIhV9el7T/d8uWBXoEaqaIYXdb0V5c9fPMJEt3q7uJ7EQvr
         Cksmby3ZkhCG+HMF/NMaJkBNVhSkP4wfg9Ghrx+D7ADLxA2bQseg2WbGm3q/Su30k6E/
         Z2TA==
X-Gm-Message-State: AOJu0YxYzFBov9nY+smtBMrkw1heJFHOj/CvTgnjvHRp2+UbdqOwhFWk
	uMABYVGiYjG9YTsyd/qhsp7j0+s3EdincXkNYmk=
X-Google-Smtp-Source: AGHT+IEUlZp0z0yZxgme9SNNBSmNAhTaHjXgu+8fX+cnwkqAZ171PZ+TY21KbKIWyuE1sGJDY0VoRA==
X-Received: by 2002:a05:600c:2106:b0:3fb:e206:ca5f with SMTP id u6-20020a05600c210600b003fbe206ca5fmr5497597wml.31.1691356442319;
        Sun, 06 Aug 2023 14:14:02 -0700 (PDT)
Received: from Bishop.fritz.box ([2a02:578:85c6:1101:e7a2:3f2c:a83f:5e92])
        by smtp.gmail.com with ESMTPSA id 21-20020a05600c021500b003fe1a092925sm8612055wmi.19.2023.08.06.14.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 14:14:01 -0700 (PDT)
From: Charles-Antoine Couret <charles-antoine.couret@mind.be>
To: openembedded-core@lists.openembedded.org
Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>
Subject: [PATCH 3/5 v2] image_types: use IMAGE_FILE_MAXSIZE variable for btrfs image types
Date: Sun,  6 Aug 2023 23:13:44 +0200
Message-ID: <20230806211348.1191553-4-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230806211348.1191553-1-charles-antoine.couret@mind.be>
References: <20230806211348.1191553-1-charles-antoine.couret@mind.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 21:14:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185577

If defined, this variable value overrides the size of btrfs partition file created by mkfs.
Otherwise previous logic based on ROOTFS_SIZE variable is used.

It should be set when the final file size would not be above a specific value due to fixed
partitionning for example.

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
---
 meta/classes-recipe/image_types.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index 2ec41c6e54..6e54f2f13a 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -120,6 +120,12 @@ IMAGE_CMD:ext4 = "oe_mkext234fs ext4 ${@get_max_image_size(d, 'ext4')} ${EXTRA_I
 MIN_BTRFS_SIZE ?= "16384"
 IMAGE_CMD:btrfs () {
 	size=${ROOTFS_SIZE}
+	image_file_maxsize=${@get_max_image_size(d, "btrfs")}
+
+	if [[ ${image_file_maxsize} -ne 0 ]]; then
+		size=${image_file_maxsize}
+	fi
+
 	if [ ${size} -lt ${MIN_BTRFS_SIZE} ] ; then
 		size=${MIN_BTRFS_SIZE}
 		bbwarn "Rootfs size is too small for BTRFS. Filesystem will be extended to ${size}K"
-- 
2.41.0



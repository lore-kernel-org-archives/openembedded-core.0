Return-Path: <charles-antoine.couret@mind.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE32CC77B73
	for <webhook@archiver.kernel.org>; Sun,  4 Jun 2023 12:38:11 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.16122.1685882291064075298
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jun 2023 05:38:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mind.be header.s=google header.b=cpt14HOx;
 spf=pass (domain: essensium.com, ip: 209.85.128.45, mailfrom: charles-antoine.couret@essensium.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f70fc4682aso32989165e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Jun 2023 05:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1685882289; x=1688474289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyonirXnzumDXz6JkIZCoM2MTc0eIkDlV5y3FL3jNIQ=;
        b=cpt14HOxoI3MR4L6djtaGb4jUfIF4nkUsgPjb+OZxhCxm6BEUJcQp4KCzGBLHQHBgT
         51mqtujaZ5MJ4iSmW/cGa59SOALibMljEfUfpe40QiDzvjQw3dMJGgyAnwEpBuuRNYdX
         /Ye2RBBx/rRda51HoFrZa/0A6q/uV/B0Ywm8Q+9w+9wx+39gdZ3XICSjYBx0jpRAZvd5
         Gj+pYBeyBeNno5tS9UgL4vxuA7Qn+ll8O47OPecDY46FAehezfo/Z6KYSevAsqrFFhN8
         Z2HnR8bbJbgd9U93hTHgocoEv6mi0r4ZFWf1v5Fgp6KReGwiLiNpW6Gqa+LVJqyhqjFu
         lYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685882289; x=1688474289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hyonirXnzumDXz6JkIZCoM2MTc0eIkDlV5y3FL3jNIQ=;
        b=i7C1QG3G+rC73dmVIqkzYIBQGUMpzOD96lT9OVa93ykk2xFF0Y9bbEzuumTCzE9EkQ
         eO8n3umNZb/TMwJx2Gt/JCJ8sqcMsKtBjhfdFJDT97xfdJf7vHZe2pv1vT2kBOhxaFfT
         xSuRcLAg5IfYjwhJDS48mORkCiHSwmhC6NnWU+l281fLNNexLnY+BhRokaeDlqyMloq0
         txkNbRUQxuFsX7vr6f8ZxvsbHLheya8AOtNRP8V7OduSqR084rnjduLQc/CWlhxwdXCF
         x2g0GZCioal+PUHFG7T/d9VYEoTPFmsZCgST6KLimisgeP3QBt3vGKtqMBp9wA1i9kb/
         5FQg==
X-Gm-Message-State: AC+VfDxHA5dXURRAwlK6JOU+1Vryd63aNnj7FZmODLxX6+fRZOgb5SIz
	s9brrr18rRL9Voa8fb5CxfV//aE7aqSvSqgs3L8=
X-Google-Smtp-Source: ACHHUZ5QlYKfpPnq8dDlA/1qybvG98y7fCWp+RTLzvj30k+nXNa/+UGLmJRkpP6wxP54KHmcil0apA==
X-Received: by 2002:a7b:c391:0:b0:3f4:298f:4d01 with SMTP id s17-20020a7bc391000000b003f4298f4d01mr4504348wmj.26.1685882289697;
        Sun, 04 Jun 2023 05:38:09 -0700 (PDT)
Received: from Bishop.fritz.box ([2a02:578:85c6:1101:e7a2:3f2c:a83f:5e92])
        by smtp.googlemail.com with ESMTPSA id w16-20020adfd4d0000000b0030aefa3a957sm6967673wrk.28.2023.06.04.05.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 05:38:09 -0700 (PDT)
From: Charles-Antoine Couret <charles-antoine.couret@mind.be>
To: openembedded-core@lists.openembedded.org
Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>
Subject: [PATCH 3/3] image_types: use IMAGE_FILE_MAXSIZE variable for f2fs image types
Date: Sun,  4 Jun 2023 14:37:55 +0200
Message-Id: <20230604123755.2541295-4-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230604123755.2541295-1-charles-antoine.couret@mind.be>
References: <20230604123755.2541295-1-charles-antoine.couret@mind.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Jun 2023 12:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182362

If defined, this variable value overrides the size of f2fs partition file created by mkfs.
Otherwise previous logic based on ROOTFS_SIZE variable is used.

It should be set when the final file size would not be above a specific value due to fixed
partitionning for example.

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
---
 meta/classes-recipe/image_types.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index f157a84b2e..b5d32b7622 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -250,6 +250,11 @@ IMAGE_CMD:f2fs () {
         # 500M the standard IMAGE_OVERHEAD_FACTOR does not work, so add additional
         # space here when under 500M
 	size=${ROOTFS_SIZE}
+
+	if [ -n "${IMAGE_FILE_MAXSIZE:f2fs}" ]; then
+		size=${IMAGE_FILE_MAXSIZE:f2fs}
+	fi
+
 	if [ ${size} -lt ${MIN_F2FS_SIZE} ] ; then
 		size=${MIN_F2FS_SIZE}
 		bbwarn "Rootfs size is too small for F2FS. Filesystem will be extended to ${size}K"
-- 
2.40.1



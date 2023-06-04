Return-Path: <charles-antoine.couret@mind.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6514C7EE29
	for <webhook@archiver.kernel.org>; Sun,  4 Jun 2023 12:38:11 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.16181.1685882289405359554
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jun 2023 05:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mind.be header.s=google header.b=T53cJwYD;
 spf=pass (domain: essensium.com, ip: 209.85.221.48, mailfrom: charles-antoine.couret@essensium.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3094910b150so3926121f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Jun 2023 05:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1685882288; x=1688474288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2jkPg6p8l2kDMqQGpqOJPXfttmudEqENGBARhTHFSo=;
        b=T53cJwYDzl22jXaGZR0PXxxbRk2uEsLYFE1xIcV1YKObEkMBb++5DlOq0XCXCOOnCf
         RpbmFnWyFrERmy8StsAbiPh+zXiCk5C3LuISgWFBaZnEKIdgJ/1r34BLolWWW3dVz/16
         hJbTTWntVsoQAouVgAfqde8yju86wwvBE0fZa4EHlSPJe0i+j7tWWw1ktBKrf+Qa+ftX
         lHWXpyvzG7fmb1kD2hPgGUZZ9P6MjLaBvpz44skPVdOyKhTWNYpeuqbl5CnQsCPsjlLu
         HvgxumGRTm7uDma1DumvcFCXkqEaKoVdO61mQk/nZNFsw3+Glmym3Gumv7A8zU+jN5HG
         PMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685882288; x=1688474288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2jkPg6p8l2kDMqQGpqOJPXfttmudEqENGBARhTHFSo=;
        b=gTaBDWgB0BpGPKPe8D8pmkvYgfZ/TaxYacmREXoQ47GYSTvHnJZ4R4t9+xxH9/5Bg9
         oGvAaRvaTYETzWJ80f9pK97NAvSf3zvUVNmD1Zi/c3ME7JS5IVYAM9hFXdC1i4Idn0Gz
         48m9LDcINiRf3Kd5eIEwXJz7bmozCzqscRellRaYFbKsKHbdMbjshIbhSuf4hwLhmrUR
         CyW5a81MSpiwAqes1hwCbIKBXDcgh5PBJhHelArR9ohOk26Lqx3KX6rYoayGFKwTyw+6
         NdTs4M3nArjdZYBBCsbjFkTfmtJs6b+FEZFopOBamf+5+ZiaIYQk3kTtnmRwhyXk+JKL
         xFSw==
X-Gm-Message-State: AC+VfDxNIGK6tm9FhS+ex4Wdn2Of90hEZkHwvRPwQVBC07Ghedpm0erk
	5Lnnx8mn6CmHhBCZxRlUFGpDn2rljgh7hoPhRSg=
X-Google-Smtp-Source: ACHHUZ7XEeCTZ3jq7HKWRBjdtmy1Y3r8kED3ETIrEA4SNCSy8uHPOnx+Q3556lZIE0+dv3U2AA8LMw==
X-Received: by 2002:a5d:614c:0:b0:30e:3d28:ba75 with SMTP id y12-20020a5d614c000000b0030e3d28ba75mr1869973wrt.28.1685882287945;
        Sun, 04 Jun 2023 05:38:07 -0700 (PDT)
Received: from Bishop.fritz.box ([2a02:578:85c6:1101:e7a2:3f2c:a83f:5e92])
        by smtp.googlemail.com with ESMTPSA id w16-20020adfd4d0000000b0030aefa3a957sm6967673wrk.28.2023.06.04.05.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 05:38:07 -0700 (PDT)
From: Charles-Antoine Couret <charles-antoine.couret@mind.be>
To: openembedded-core@lists.openembedded.org
Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>
Subject: [PATCH 2/3] image_types: use IMAGE_FILE_MAXSIZE variable for btrfs image types
Date: Sun,  4 Jun 2023 14:37:54 +0200
Message-Id: <20230604123755.2541295-3-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230604123755.2541295-1-charles-antoine.couret@mind.be>
References: <20230604123755.2541295-1-charles-antoine.couret@mind.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Jun 2023 12:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182361

If defined, this variable value overrides the size of btrfs partition file created by mkfs.
Otherwise previous logic based on ROOTFS_SIZE variable is used.

It should be set when the final file size would not be above a specific value due to fixed
partitionning for example.

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
---
 meta/classes-recipe/image_types.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index cebbb61545..f157a84b2e 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -110,6 +110,10 @@ IMAGE_CMD:ext4 = "oe_mkext234fs ext4 \"${IMAGE_FILE_MAXSIZE:ext4}\" ${EXTRA_IMAG
 MIN_BTRFS_SIZE ?= "16384"
 IMAGE_CMD:btrfs () {
 	size=${ROOTFS_SIZE}
+	if [ -n "${IMAGE_FILE_MAXSIZE:btrfs}" ]; then
+		size=${IMAGE_FILE_MAXSIZE:btrfs}
+	fi
+
 	if [ ${size} -lt ${MIN_BTRFS_SIZE} ] ; then
 		size=${MIN_BTRFS_SIZE}
 		bbwarn "Rootfs size is too small for BTRFS. Filesystem will be extended to ${size}K"
-- 
2.40.1



Return-Path: <charles-antoine.couret@mind.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A2F6C41535
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 23:11:23 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.2555.1698880281317888188
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 16:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mind.be header.s=google header.b=ahVMjroc;
 spf=pass (domain: essensium.com, ip: 209.85.128.44, mailfrom: charles-antoine.couret@essensium.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4094301d505so2372415e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 16:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1698880279; x=1699485079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjb6oFVhxVokTB+M07EYVOSfJtbkPXR5TBbiVtAEZf0=;
        b=ahVMjrocuRqctwxedVp61rxA/forJKjoSLJVwKtGtLtSc2pf3chV9n8TKSmYG/43kI
         nRvLt04ln6AEFj1GM8y7KQB4oEbXYqdc2K5TPaVcMwG/Fwr9t6IQWikTD/7Nm/qJkSXM
         MJY3spbCHQHmnOBIlHjPQwiKqw7PfKgEVdGK9VRwjavQAMRY3PS5e7uA3g7CuTvoVXHV
         YFMuMUvcM+clkmPtOY3lbn2oHdge0GvdG8dzb21NFWNL8DnUtVHSs8SLy3ekfTcOW2zh
         lexEhrJivq1Q/VsIzpSTZQ3DzGaWug2PodhEck44DCTGk7c+axWjukVET0gCc3wrP5Yu
         FPow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698880279; x=1699485079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjb6oFVhxVokTB+M07EYVOSfJtbkPXR5TBbiVtAEZf0=;
        b=fxYFXwx1Re4Ub7b5GWRvxx1PT70mdfpzM6M35YX31jsRyB5x4kwjmWPL8MTvfqgQpd
         HRIJRFIJb+qMWHIzSce/mSzm8VznL0DFRHQF/bSLIT2W/GNl5DEFk+FC6SOM59C+2YN8
         4jiIVf3eaFXDaleQtpzEHh0zcmicHXF8BZAjO2Y31HkyqtlI55CcVnZNKI4OW0KrH0Ui
         BfVotPTAR/2CXEhYrmBUDLKXM2Jno2NvixCq2SkPMlDbiZ7A81O24JXPRCsaUAhHgiye
         NelumxUi0+wwDUT0SQeUe+P7z10uAFLeFVMLYglePTEdctbaRodJtXnTkWnNCh5kzrP7
         TURA==
X-Gm-Message-State: AOJu0YyDva/AAi0/ieBo2RkthZuQJB1otFDmR3EaSmjV25d4xH+AYFA/
	WP1b5AdzgiCGyBxtt59dNOkDYZkquIvxLfVds2I=
X-Google-Smtp-Source: AGHT+IHQalmjxuxjHhei2Yz06B/2+T/kwlLXCbgh3lESsd25aa6rJBoTe+YyO4thy2IJIb9Jm12FNg==
X-Received: by 2002:a5d:64ae:0:b0:32f:a3fb:835b with SMTP id m14-20020a5d64ae000000b0032fa3fb835bmr2155152wrp.44.1698880279527;
        Wed, 01 Nov 2023 16:11:19 -0700 (PDT)
Received: from Bishop.fritz.box ([2a02:578:85c6:1101:e7a2:3f2c:a83f:5e92])
        by smtp.gmail.com with ESMTPSA id m11-20020adff38b000000b0032db4e660d9sm854601wro.56.2023.11.01.16.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 16:11:19 -0700 (PDT)
From: Charles-Antoine Couret <charles-antoine.couret@mind.be>
To: openembedded-core@lists.openembedded.org
Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>
Subject: [PATCH 3/5 v3] image_types: use IMAGE_FILE_MAXSIZE variable for btrfs image types
Date: Thu,  2 Nov 2023 00:10:52 +0100
Message-ID: <20231101231058.86928-4-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101231058.86928-1-charles-antoine.couret@mind.be>
References: <20231101231058.86928-1-charles-antoine.couret@mind.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 23:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190051

If defined, this variable value overrides the size of btrfs partition file created by mkfs.
Otherwise previous logic based on ROOTFS_SIZE variable is used.

It should be set when the final file size would not be above a specific value due to fixed
partitionning for example.

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
---
 meta/classes-recipe/image_types.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index fb1e33cf3e..1356552445 100644
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



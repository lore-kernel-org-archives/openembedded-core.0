Return-Path: <charles-antoine.couret@mind.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A7FC7EE23
	for <webhook@archiver.kernel.org>; Sun,  4 Jun 2023 12:38:02 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.16117.1685882281411192477
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jun 2023 05:38:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mind.be header.s=google header.b=dDIWFLvB;
 spf=pass (domain: essensium.com, ip: 209.85.221.41, mailfrom: charles-antoine.couret@essensium.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-30af86a966eso3075354f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Jun 2023 05:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1685882280; x=1688474280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQBBM3I8TfThjxctUzFo1w5at/OmQ3Dv3DrmawQE3Fs=;
        b=dDIWFLvBJ4eub/tX6dQ/4oFihSXLT3YkJI0puS4T1b8K3UOTM2UGe32YKaU3NjWzIV
         1C8eoTHMlpUb5E3XATaAL24a+WOScT5WPz2h7ozywi/uwJhNtn1RLTm6+w0r/id6f7iq
         p0dNwVdNYLEem7eBYW92wGx3DMrhK5CIz5TuctPwTfKRHIpzRq8xcZF985FHL214NN+G
         vc/kOHgReZMvdU66sDBK8vj9dx3QYMLkLuajnB71NppndOHh0/kjTzxHrq5ZMQ4RXrQf
         miV+Kh4VCW3jgq0Pjt50lYqC/gMH97jSyqAeqVY/FYDytMO7NV6KYV3eXQYGBMS3F196
         nSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685882280; x=1688474280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQBBM3I8TfThjxctUzFo1w5at/OmQ3Dv3DrmawQE3Fs=;
        b=ZXiziJUA++d97HIVUfIKLVh4DJb1zz+/V2YFUH+hVt2ZydyFlnXFjjqV1hwEIg9BBi
         1dp/JuLCu5KJE7652Pp9EXInKq3LEVOVIKfJPt/YRSLjoockWkBQoJwK6i4pFPcw13vC
         tQtG+yhomv8mODL/t6WJhF9/GNtRSkM0L/BfLLpDvB7hi258Rdhuhg4vgpsiFTHPD4HO
         9Lw/kqaPmlHDZbe2A/vd8/H7zz0pjbEAc2ST1NoSjaM/UtfZKQ9mjfZLfnCvUdwCkLAj
         zWdFqBZmI0/xBLfMf7/fMATqgSw5ZwGXhUzwPhh1/khlPHXAMXYrLpz0F45SfGq1Vt/V
         4zow==
X-Gm-Message-State: AC+VfDz6e9Ae/nCgbiUMJUCd3qWGembMuwgqbS2WP0ler1A9RXrsS4Ag
	y8iAcoBg4UdJA8SHCXKcEUChOxYG2g5mwh4yBMA=
X-Google-Smtp-Source: ACHHUZ5SDD2OJ0emaKy8U2ZkhDOSivfgT0gYmuLJCVUyHJYg62E5LhT8qL9xLf37o5hHWIBJ2R4p0w==
X-Received: by 2002:a5d:58c3:0:b0:306:475d:92ff with SMTP id o3-20020a5d58c3000000b00306475d92ffmr3166985wrf.3.1685882279970;
        Sun, 04 Jun 2023 05:37:59 -0700 (PDT)
Received: from Bishop.fritz.box ([2a02:578:85c6:1101:e7a2:3f2c:a83f:5e92])
        by smtp.googlemail.com with ESMTPSA id w16-20020adfd4d0000000b0030aefa3a957sm6967673wrk.28.2023.06.04.05.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 05:37:59 -0700 (PDT)
From: Charles-Antoine Couret <charles-antoine.couret@mind.be>
To: openembedded-core@lists.openembedded.org
Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>
Subject: [PATCH 0/3] image_types: use IMAGE_FILE_MAXSIZE variable to create fixed partition size
Date: Sun,  4 Jun 2023 14:37:52 +0200
Message-Id: <20230604123755.2541295-1-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Jun 2023 12:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182359

In case of fixed partitionning where the rootfs partition can't exceed an
amount of bytes, there is currently no automatic and no generic way to have
this requirement met in any case.

Until now, ROOTFS_SIZE value got from directory_size() does not takes into account
the size of required metadata for the filesystem itself (and does not work well
for other block size than 4k BTW).
Obviously it's a difficult task which depends on rootfs size and filesystem type.

The workaround was to set IMAGE_OVERHEAD_FACTOR and IMAGE_ROOTFS_EXTRA_SPACE
to add the required extra margins. But when the final rootfs is closed to the
maximum size, it's difficult to adjust them correctly  And if you remove
or add new recipes in your image, you've to recompute these margins to have enough
space for these metadata when the rootfs is small, and to not have too big final
file when the rootfs is big.

It's cumbersome and error prone to just have a build failure when the final output
can't be flashed into the partition.

The solution is to follow how it's implemented in buildroot by having a
specific variable, here IMAGE_FILE_MAXSIZE, to create the final sparse file
and trying to fill it with the content of rootfs. If there is enough space,
margins are well compressed and does not consume space in the filesystem.
If there is no enough space, an error is triggered to warm the developer before
trying to use it in the device.

If IMAGE_FILE_MAXSIZE is not set, the idea is to keep the previous behaviour
for compatibility reason and to met other requirements.

Charles-Antoine Couret (3):
  image_types: use IMAGE_FILE_MAXSIZE variable for ext2/3/4 image types
  image_types: use IMAGE_FILE_MAXSIZE variable for btrfs image types
  image_types: use IMAGE_FILE_MAXSIZE variable for f2fs image types

 meta/classes-recipe/image_types.bbclass | 34 +++++++++++++++++++------
 1 file changed, 26 insertions(+), 8 deletions(-)

-- 
2.40.1



Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD38C52D7B
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 12:02:40 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.96187.1723636951487385662
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Aug 2024 05:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hIbW4hgk;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-70d199fb3dfso5277478b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 05:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723636951; x=1724241751; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BFKIXIva1SufJ27wPtxF5EtXeM4BxnEiNPt2PKXBXwE=;
        b=hIbW4hgkEJ1eUXjCIQFdHygDOcSdytzujadr3ZBo+r9xn/v5g9K6Zthug+xpVIbQvy
         0trIzbDYlQeF+oZRfGSVoRk69nGjNOqs14sv76stS+RuHuomu1VesqlzHxcSU3I3qbNH
         T27sTmvBaZ2ev8tTLekKDAB2Z7RwyZllKkzSbjlOogAqH46aaAm7kMxRVeBXuKy3Wtpk
         y2f98gsydcPr/fTadDyWpfxJy1755IpJOjcbqlf/3yauINAyhbW0R294dOYcURG/h6tF
         l3Vq/BO5AZSirNE2BXUKeKoxhaPm79PbdaMEDId9nVuTSPOD2XwAv8szm5CnsJbIhPVB
         6/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723636951; x=1724241751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BFKIXIva1SufJ27wPtxF5EtXeM4BxnEiNPt2PKXBXwE=;
        b=DKI/R8qUvRwB7B3HaXi2yUlD7E0OYjWGn+kYtZWHwXODll5e/EOh3VkkJfAcbkZ7cD
         AP8GGYBu7p9VnJ2Gv8fGvO92MqzVylOWWpQk7rZemV6nORSZikEmMfjSBbbZzbQCnZJx
         zSUOUUTjMr38KIBbVxeSbC5G6z+gPV1O6NtytL1QIfjAxWCLu3h0rKvsYcD9iUZZ4GMd
         fZcnLWmBC8oF6PvpVcSwbp/C4qtp4UZ8ePhP4vlLaDqQPBdNiIqyRZpD7RQRKhLFQKye
         3UNMJv8Ish4K46h35cvgNjU7KiCbheENAP9BeHoH4JGvN/tkvfWPzEfnWFqafNwjPG1q
         HKeA==
X-Gm-Message-State: AOJu0YyITdr4oUYvO0RtstfckVJkEMV5c50v2cbyWFcR17E5PXl2+yO+
	kTCZbzcTmsTjRGnQ1KRy4JK0KMmJmOIfIAP1XuY2yJS2O0Z+QKr9LlgvevXRpm8jYB19G+kVrmO
	z9DQ=
X-Google-Smtp-Source: AGHT+IF+AOUD25N/hbSPuxV8fWZWvyAoU1r8/5Us5uXkCCbp3+aZ/olYtq6XCjGJscZnQRihalE5UQ==
X-Received: by 2002:a05:6a21:3a81:b0:1c6:f043:693f with SMTP id adf61e73a8af0-1c8eae6f47dmr3217238637.17.1723636950620;
        Wed, 14 Aug 2024 05:02:30 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3ac80e0d1sm1512214a91.43.2024.08.14.05.02.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 05:02:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 8/9] image_types.bbclass: Use --force also with lz4,lzop
Date: Wed, 14 Aug 2024 05:02:08 -0700
Message-Id: <59b60266edd078679df46cb4043353c4bd1662ca.1723636705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723636705.git.steve@sakoman.com>
References: <cover.1723636705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 12:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203319

From: Niko Mauno <niko.mauno@vaisala.com>

Several conversion commands already make use of 'force' option in the
compression, which enables overwriting existing files without
prompting.

Since occasionally an existing residual destination file from a
previously aborted or failed task can prevent the re-execution of the
conversion command task, by enabling the 'force' option also for lz4
and lzop compression commands we can avoid following kind of BitBake
failures with these compressors:

  | DEBUG: Executing shell function do_image_cpio
  | 117685 blocks
  | 2 blocks
  | example-image.cpio.lz4 already exists; do you want to overwrite (y/N) ?     not overwritten
  | Error 20 : example-image.cpio : open file error
  | WARNING: exit code 20 from a shell command.
  ERROR: Task (.../recipes-core/images/example-image.bb:do_image_cpio) failed with exit code '1'

(From OE-Core rev: 623ab22434909f10aaf613cd3032cc2a2c6e3ff9)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/image_types.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index 2f948ecbf8..28afff4571 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -335,8 +335,8 @@ CONVERSION_CMD:lzma = "lzma -k -f -7 ${IMAGE_NAME}.${type}"
 CONVERSION_CMD:gz = "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.gz"
 CONVERSION_CMD:bz2 = "pbzip2 -f -k ${IMAGE_NAME}.${type}"
 CONVERSION_CMD:xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_DEFAULTS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.xz"
-CONVERSION_CMD:lz4 = "lz4 -9 -z -l ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.lz4"
-CONVERSION_CMD:lzo = "lzop -9 ${IMAGE_NAME}.${type}"
+CONVERSION_CMD:lz4 = "lz4 -f -9 -z -l ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.lz4"
+CONVERSION_CMD:lzo = "lzop -f -9 ${IMAGE_NAME}.${type}"
 CONVERSION_CMD:zip = "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}.${type}.zip ${IMAGE_NAME}.${type}"
 CONVERSION_CMD:7zip = "7za a -mx=${7ZIP_COMPRESSION_LEVEL} -mm=${7ZIP_COMPRESSION_METHOD} ${IMAGE_NAME}.${type}.${7ZIP_EXTENSION} ${IMAGE_NAME}.${type}"
 CONVERSION_CMD:zst = "zstd -f -k -c ${ZSTD_DEFAULTS} ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.zst"
-- 
2.34.1



Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A2FC5472C
	for <webhook@archiver.kernel.org>; Sun, 25 Aug 2024 18:50:05 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.37012.1724611803422165727
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Aug 2024 11:50:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=u0bvJPPg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71456acebe8so998814b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Aug 2024 11:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724611803; x=1725216603; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iR0vkpIy9nCczthekizmpRvD3VV08z3DO8XUWQ3Rh+Y=;
        b=u0bvJPPgO3XOppKrrSyZ7VuFbDo46MbOwHWMHAm99NYcNbRACgDrIyDCeVt2gPyIlQ
         O33vLVIjmOt3HqFjMCFMeivje7v7FEjsfsPRFgSWMEeoe0ghLEsae9mulkKt7eZILnCp
         T3gDJblA4C1AYFxUucdfpwHYab0A4VsZqevDKG5o1n/PfJO2qwj94utsdNRIrBU+L+HE
         XsvVfhSY1mMa4isoGauXp0trmsZocbA+hlDvaNusFFngKLXGfX91MJwGIIoikfJV4cw/
         v7zko0MIvzxR3pD+/wCpWa2mfXAbMDoOPHj9HgBQzDwIHCDXUea4wRDGIMMglPjNUsMx
         AT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724611803; x=1725216603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iR0vkpIy9nCczthekizmpRvD3VV08z3DO8XUWQ3Rh+Y=;
        b=dPVR/MkhYhvFFZFPWbEKw0lGIF8MehYFhBOnUsuprksLwBopzka1ZIxQoqbb6ZOzSb
         LxcMk2UEImMuhcq6cTLyQpUdtVobLn40Z5bwsBHoRkSV655DBMQiuEOjy1ch8KGqJux9
         Auv568VscYaAAoxLZMjBPdKrWJGHOTGYWJxj8F1MGy8pdyU9EOFXX7S7nNGDOerkUhdV
         dItgmgHclh8Ixkv/pBU0eirJPH+ypAJr4+4aEKApJCREvVjF0fs796J5L2OAnXYjUjyy
         AezNg2E60gbLa+Pdc/GhwC7naUvvP9i9XyI5s5pH1zGyKP0KgLgoSM9HsrJbgbzDYZQX
         OIoQ==
X-Gm-Message-State: AOJu0YzAI8pcn/c1PU3tZ5Velc8hzPne9O9wNpnTQoC49VXkwJQorDst
	4pOYP883JKlMu66PrciIoTx69XMGe4JmdLCC1LZC/JNE/aID7zRHKafpzakgR+QutqmIcpp1M2H
	KJE92kQ==
X-Google-Smtp-Source: AGHT+IHmbR8UJEde36oHF/AGEzafV6q16rMJP1EPRrjJ7/MNoQog4tJTolLMbGT3CWsFUK+VAmvtnA==
X-Received: by 2002:a05:6a21:e8a:b0:1c6:ed16:30e4 with SMTP id adf61e73a8af0-1cc89d29e87mr9014640637.7.1724611802571;
        Sun, 25 Aug 2024 11:50:02 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d61391fe09sm8294216a91.19.2024.08.25.11.50.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 11:50:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/6] image_types.bbclass: Use --force also with lz4,lzop
Date: Sun, 25 Aug 2024 11:49:50 -0700
Message-Id: <35a92023766b562dab9f8561cc3adb4938b03692.1724611692.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724611692.git.steve@sakoman.com>
References: <cover.1724611692.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Aug 2024 18:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203730

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
 meta/classes/image_types.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 9d5f8c68a4..72245019f4 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -292,8 +292,8 @@ CONVERSION_CMD:lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 CONVERSION_CMD:gz = "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
 CONVERSION_CMD:bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 CONVERSION_CMD:xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_DEFAULTS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
-CONVERSION_CMD:lz4 = "lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
-CONVERSION_CMD:lzo = "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
+CONVERSION_CMD:lz4 = "lz4 -f -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
+CONVERSION_CMD:lzo = "lzop -f -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 CONVERSION_CMD:zip = "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 CONVERSION_CMD:zst = "zstd -f -k -T0 -c ${ZSTD_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zst"
 CONVERSION_CMD:sum = "sumtool -i ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
-- 
2.34.1



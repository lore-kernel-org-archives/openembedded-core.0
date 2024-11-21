Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70EF3E64025
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 21:55:01 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.10704.1732226098226298172
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 13:54:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=O253mTtX;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7ea9739647bso1188759a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732226097; x=1732830897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5oOFCFpI6IwA+PzzonMbGpqWHBJ9FCgmFPEOsPEqoM=;
        b=O253mTtXyMmxz7n7uHPX1AO7QbVFAK9eHwk9GFxbLUft9RS99WrzHexpC3ZS3kEZYe
         RMRfT9OtIx2UMWGmtASpiPXxabWAfmpUQ/gIv+swTQO34z6HkdYNexUZmagvKvzUtSeK
         5keygJGIlx5APwCveZot7gyEAvJVKgcmXdgoFOwldgjfonhbZfQPOIk5452wMvveBLbY
         TdClafllu49aGteMT3OuroIWPgZETXbxPJXJzB38wbCrvVTA+m2wX0ctgYCYNl9Kn8nG
         tD30ysAKuAFxOoo+yxzOuWCXMiWzDE+vKyAdmszxNFEsMa17CBKwCbI13mCqoHIdBceE
         On0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226097; x=1732830897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m5oOFCFpI6IwA+PzzonMbGpqWHBJ9FCgmFPEOsPEqoM=;
        b=UH22Qvgyi3ZT3BY4/a1er9SwpONtoQ5nixjxHYoNF6cieKGlDDqBAK3cudgxrNA6tB
         oNdfVe5jYZYYVn8MVHXCjDRleeoGpcYfNIiXu0TTGRvg2t99qNqqohdMcxUtDXXFbqQl
         6ol8NkIujuhNPj3C5bVMQqv9r9wpDDvP/ac75Sbho+TI7lTHGhfhrJfoveB2gJHUAaM0
         hRfgt+ncbQXN2aqrnNcgcWIupcaevTA9QbRAeEmzhRq+BKeHjhKHgWQX8+o4vuLl9NR4
         wANZwX+bF8SHuyYx4L/GOw18PH7hn2NCXiqjYYyO56H2GAiO1iZwdU8G3smIBQMA0Zwb
         5l5Q==
X-Gm-Message-State: AOJu0YwowHfYpMo91KlG7BWtmJVZzBJeYulFsNbEXw9+nrlzMqz5d/UM
	ccyIzy0oN3CymNptR2TRaERVWzEiXAlw8GaOFKh7VfzR49sDMXCLHqB76HkIGFKIlJhJ+aB+uGC
	n
X-Gm-Gg: ASbGnctAfe4PaBv+50ThAP8JFCfXCKvJDLbU6eiyD1j6Fnf5IfKeq56ITro6p0P+/yC
	w3EAXbzyXPFNcOl2CP3IXk4O+RE2Jy6nC0vKNzigKfo868pujPb6e8ZrnK8YGvvMj9/KfP3Jv7F
	fAf1IvSCR0+8AQZXuIo2/nbPzP7ca7ma+rgPzouFpf39YhFNCEXrHy7OdwtKncgE0ZCLeeKJqpq
	ul0emRJGgarwT0bR8N/MRVBU5l4RnanUPUTC1o=
X-Google-Smtp-Source: AGHT+IEaVUOkQ3AupD3tHSSdxwU/cabjWDXKbWgGhRfUJXHgeF/1wcjUzuf4bRQHkLy7wm1lu5jLJg==
X-Received: by 2002:a05:6a20:4313:b0:1dc:37a:8dc0 with SMTP id adf61e73a8af0-1e09e4a7b38mr644272637.21.1732226097252;
        Thu, 21 Nov 2024 13:54:57 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47eb05sm249710b3a.75.2024.11.21.13.54.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:54:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 24/27] tune-cortexa32: set tune feature as armv8a
Date: Thu, 21 Nov 2024 13:54:14 -0800
Message-Id: <f61741a2371de25800687afdb0a8ff8286a1afb0.1732225943.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732225943.git.steve@sakoman.com>
References: <cover.1732225943.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 21:55:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207579

From: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>

Cortexa32 is a 32-bit armv8a architecture processor, so set the tune feature
as armv8a instead of aarch64 which is 64-bit armv8a architecture.

It solves the following build error while compiling libgcc-initial
and libssp-nonshared.
-- snip --
aarch64-poky-linux-musl-gcc: error: unrecognized command-line option '-mfpu=neon'
aarch64-poky-linux-musl-gcc: error: unrecognized command-line option '-mfloat-abi=hard'
-- snip --

Signed-off-by: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3b898270aca62559dfa42ed71d296fe8a8b46a41)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
index 25bdf12b18..0eb938a240 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
@@ -10,7 +10,7 @@ AVAILTUNES += "cortexa32 cortexa32-crypto"
 ARMPKGARCH:tune-cortexa32             = "cortexa32"
 ARMPKGARCH:tune-cortexa32-crypto      = "cortexa32"
 # We do not want -march since -mcpu is added above to cover for it
-TUNE_FEATURES:tune-cortexa32          = "aarch64 cortexa32 crc callconvention-hard neon"
+TUNE_FEATURES:tune-cortexa32          = "armv8a cortexa32 crc callconvention-hard neon"
 TUNE_FEATURES:tune-cortexa32-crypto   = "${TUNE_FEATURES:tune-cortexa32} crypto"
 PACKAGE_EXTRA_ARCHS:tune-cortexa32             = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa32 cortexa32hf-neon"
 PACKAGE_EXTRA_ARCHS:tune-cortexa32-crypto      = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa32 cortexa32hf-neon cortexa32hf-neon-crypto"
-- 
2.34.1



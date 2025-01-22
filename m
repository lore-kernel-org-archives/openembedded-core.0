Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C40C0218C
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 03:03:47 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.34204.1737515026482355275
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 19:03:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vZB1XZRm;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ef748105deso8270837a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 19:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737515026; x=1738119826; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OpWKPBi6pmyUDaX65Dm6J5RnSmneVvwK3QWPDaQPaaU=;
        b=vZB1XZRmLSx61v7ByevZb8mv2bu5QbOUxLDKolknnc7cjpE/lHVdpIFpYecNSIyDuh
         OzMKiazCqLEn1Fkr3H/1e/OxRvb2oXFD0IPptrjF2CrlwCKf7tbV+hi4ehhuzVTiOoFJ
         /P5HmehIOe2AE17gElIjfPJIoHLEN+BgyM3nuHSjqRjrVb0J/xZC9l+NvrMh9V52sKd3
         vnce512wmEe8ccq9KA5Um2nHiTJiiE1JmRhW1D8C24xY1kXTlnyWuhk2cCRv01rv05qM
         baN63Qbub4mwXPOYXhF90bi3uKgeI8ogEUIxBI3c65uJncYIqpED5EL812cqXfQmg2pi
         edcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737515026; x=1738119826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OpWKPBi6pmyUDaX65Dm6J5RnSmneVvwK3QWPDaQPaaU=;
        b=jv0FWfbT9DoTFOAntlr+OlQ4ZexGToLXnEpKvwo2sil0pBdlww4yIrgrOUE/Z2iaaA
         +qrLBeJWlRRdpG7w9H5j1AdCh9ynzf4/p4NQfKxwEKg1AhLi/rOwbeqTXtBiKd541Hw5
         2vymKwdOw3fNE5vOgNIzblo15srhhJTIQjt1xJgpyJJgZvMOp6A3Cjuyedquhamwz+8H
         drdgYxoc2UnWSV0XM6cRHEI+VcIBE+OMPSnYBHHPj+RHnQdBfovtJ6VVGXcGpMF4wpK5
         +mt/yT/HxJgjfdHufOfv7rRltB2rw8t2NmaHAaBJTOctI7McSHd2urgbu2QCsvtyo1uY
         yW3w==
X-Gm-Message-State: AOJu0Yxmn0+kU1b1Fun7fot/4W9qJRM7RC2xaZ2PRhg/E0/NgO1bWu6P
	CQTbgHps9/eis8PkQS6JODUVNmiNKuzU30rPEtYNDIPg1Gi3fcaw5icWgnzphhENFmPIhpH6wSO
	Com4=
X-Gm-Gg: ASbGncu4SFAh0861BOQ5HdhjjwZiDZzaoRK/FZzj+gB+TcbxBLOvZGw+bT3F+OwAHn0
	P8hyCQL2gZXAU+HlZQRUF7DlaF0ED6W5VP9+A4rZNlPlS4t+pAKybQx5Az3DXQqY6Zj5n9mLi7E
	AS1N+v6ScvWMgktzlGKGBn3XFzy6wQNwV6615k0tDweuSc5sVI5yIFeXyc8QOctMdXNR2ht7LX0
	IwNQwZMvSZ5QdUFYZGTC8Swc2qMf0Oj2xRk9zd7I01AY0LxQ6GPqi3kVms=
X-Google-Smtp-Source: AGHT+IG3H0BW9wiphZKO7gOOjsiqSjgAqwVQ6JKcFNrdIsHXvfinHU9OZdx54qYjVFkRCFCYjoHb4g==
X-Received: by 2002:a05:6a00:2448:b0:725:322a:922c with SMTP id d2e1a72fcca58-72daf9abd78mr32326971b3a.3.1737515025668;
        Tue, 21 Jan 2025 19:03:45 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab8112c1sm9800337b3a.37.2025.01.21.19.03.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 19:03:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/14] classes/nativesdk: also override TUNE_PKGARCH
Date: Tue, 21 Jan 2025 19:03:07 -0800
Message-ID: <812cf123af5821c300c630cda35be8faed73b9d5.1737514842.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737514842.git.steve@sakoman.com>
References: <cover.1737514842.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 03:03:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210125

From: Ross Burton <ross.burton@arm.com>

The nativesdk class overrides PACKAGE_ARCH and unsets TUNE_FEATURES, but
as recipes might want to look at TUNE_PKGARCH too (for example, when
setting QEMU_EXTRAOPTIONS) we should also override that variable.

Otherwise, a nativesdk recipe will have the TUNE_PKGARCH of the target,
which leads to errors (eg passing mips arguments to an arm qemu).

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 05322beb290e1db30bef49b4364f8a8e6e9f7408)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/nativesdk.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/nativesdk.bbclass
index de6debda93..83ea901fa5 100644
--- a/meta/classes-recipe/nativesdk.bbclass
+++ b/meta/classes-recipe/nativesdk.bbclass
@@ -32,6 +32,7 @@ RECIPE_SYSROOT = "${WORKDIR}/recipe-sysroot"
 #
 PACKAGE_ARCH = "${SDK_ARCH}-${SDKPKGSUFFIX}"
 PACKAGE_ARCHS = "${SDK_PACKAGE_ARCHS}"
+TUNE_PKGARCH = "${SDK_ARCH}"
 
 #
 # We need chrpath >= 0.14 to ensure we can deal with 32 and 64 bit
-- 
2.43.0



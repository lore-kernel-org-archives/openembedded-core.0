Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70DE9E77172
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:54:55 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.21459.1733334892008263914
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:54:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lgc3isTY;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7fcdbfd8090so47846a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334891; x=1733939691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XYvGErDO2r4NJdeR3H/fxzI+4VtshizvsIUqbQ/bEqY=;
        b=lgc3isTYVHx2wF7pAx6L5orf+G1S9lmz1neEo6RG5AvzV8MfI2jgtR1L0VrLJJ9+Nt
         lOqB6AphjRUb2fJk43OOUql0dYCB/DXGFn73fOsb8cX6kPEIYyeMBGHHmrfjrzbJrLPA
         +sjvYE0fIWpbDtUogiAZcEJKflP21LShTFUCjmcLjYmL0aPpxKM+/hFKAgani9uFE678
         l81Lw5/K5vRsUhMXVcNJdHVDj79Sr0qZO7e7NFQhw5O1A8qNEPScq/tdFBLtrFTKb+bR
         nnLawXH/tKtY2Tl01OSoqRNixMjyxOWIIn2cZAKs9D3WsEVAdoZuDB3hTm9QatBs5J0/
         2Jsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334891; x=1733939691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYvGErDO2r4NJdeR3H/fxzI+4VtshizvsIUqbQ/bEqY=;
        b=My4VXX7kvwU/OqaCBMCdDEIVDbIxo8pxv92Q2W9cRQiiIHYEWGrir4Zq7ENWhF4hji
         IOS3/9pNcUryDOmEPpqJtAsneAmC5nyk6Oy6Pc7tmV+VEB9CcajrmbwEVLED4U5m40My
         h5Coszu3nIMXHmxPQ74yzbwlgS3PdFkKIwFwLGlEnimXoPqIjQpdxeN7+WlB1caLU8pd
         ps/TMQHd9AeIvC8fdYIo+kvRB8NTxXMxrdt29nz/j42SH9cQoWDwSMB7Wb1UGGbkLStU
         hKYzDXZ3HfzvKaNQSz5CVmkVaVYRIJXc+yQyv/vaTwv1v4Qdy4wa4wtprOuG6crTSW5V
         GPkA==
X-Gm-Message-State: AOJu0YwfASSOcdu+D4ilKjrkKzJj1BVIdrpaqp9TlY64S3IX8nLdGONg
	WyJuc5uQ5HagnRxKC74OFdVgyIh3st11TmX43zNnTBlIcU3pcnrKwy2uUpM2ymHC7jjwPCdUAHE
	B
X-Gm-Gg: ASbGncvN4qnMDTiUFwepgR4d7/Xa+Qw/hukRMZumMQVRiJ+TqMYhwNYmjVOaSYFRR0B
	ovhDRas/5/bksdu/UVTj6tvRbS0qS8wg8Vr9fCPAy6hdPBFdRj3CuA6yxjdvkbQ7RCr+iL+Zuky
	R1i1Q4BBAI7KRfHF7jpya4Oe3DBaziK5CeVumckOqT9L1hrqPIfhZZpM5u0gMDozbbxZzKCcQJk
	SvF262ZV7nclMA7BIQ4hggOD1CR611Bn6cjzM0=
X-Google-Smtp-Source: AGHT+IFJuou6ii0/WqPbaoQzIkiR+gotQj7IshQ+HGySvr/X2WUHen0ZZkKPDMo28CvvNw3JzJzx0Q==
X-Received: by 2002:a05:6a20:a120:b0:1e0:d533:cb2f with SMTP id adf61e73a8af0-1e165411bf1mr10873690637.44.1733334891343;
        Wed, 04 Dec 2024 09:54:51 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.54.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:54:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/38] pixman: ignore CVE-2023-37769
Date: Wed,  4 Dec 2024 09:53:48 -0800
Message-Id: <390421edf8b6eb6031de657cdcaf0c7d50b605be.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208304

From: Peter Marko <peter.marko@siemens.com>

Same was done in newer Yocto releases.
See commit 72f2d4cf44b795f766ecdee0b8362c7e162c5efc

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
index 63fd6d2978..51728078fb 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
@@ -40,3 +40,6 @@ EXTRA_OEMESON:append:class-target:powerpc64 = " ${@bb.utils.contains("TUNE_FEATU
 EXTRA_OEMESON:append:class-target:powerpc64le = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "-Dvmx=enabled", "-Dvmx=disabled", d)}"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# not-applicable-config: stress-test is an uninstalled test
+CVE_CHECK_IGNORE += "CVE-2023-37769"
-- 
2.34.1



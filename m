Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B02AC46CA3
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 20:58:00 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.5135.1701377870361395985
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 12:57:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0lG+HDH1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6cde4aeea29so1183600b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 12:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701377869; x=1701982669; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/48nr0ez3BWOos+vY3tHm3qySJMAMuS0ho8rIIEdTo4=;
        b=0lG+HDH1XFHh97r6g5adzPxWjBMUoCInZ+K4MQEwJF/GwxCxQSSd9W3VT/DrTNphi4
         KelrQS/LCZjAmmhHQ4Wsv6YtYnSZpOAZ4fyDBllqDo08oC1kydDE1Qf6ePRMrhVXQbyE
         6rWlCex/MCKMHhzeyTA4cUZYzEyvXqrlKp+uzrCfwnJlrdj24Vbniwk0uLcS6w6Z2eKl
         TypijS+X/UOH217fzqLVoSXhHVJzst+BBRJ49V3OVffVdogJ6E2UgLK5lXDUmDiRSvbw
         eD8bsHzxneVDqui2sWtsrQxJ6HyhrP72ajsPhaCwtblNSM9EeFLhahET6ZpJ1HWyPzIn
         ST0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701377869; x=1701982669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/48nr0ez3BWOos+vY3tHm3qySJMAMuS0ho8rIIEdTo4=;
        b=LAiswgRMJMPuwqYsqOk1zWrxuKyxGvSwXdQsMOEhWHxE9lVdTeyOLpKuUqpXvHizro
         v0+vQbLFOMSKFkO/jnhpPBk8NVfKQFiL+rVM4J38fi7uuAqvdpft2ZZiQ1dLqPxUxbRh
         8zYWJpPY4XvNAfA3OrzPrJenw2zFbBgK32poeJxSszC0YGWZP8ovbebrXF93btVjwfGh
         AXU1vFVFt6E2iCUVZUIgOi5ZVTm1Dj4ULKr6JiJdfJzaAdBfp+r7Uq0MlVF+UDgjKoEb
         oD9P/CjjY6Dxvz4o9CyvPlJYgylV1/NfDGdQepxY4/1ZYBA0Q2PNRaLSqYZ3UeI5ut8u
         7GzQ==
X-Gm-Message-State: AOJu0Yz0JkntDJeBO9AsxItgjcGDRLmWXQctkoGMKcREIoG+Al+d8AY5
	7EXWpkhOf6PoVJcRlH/W5ZwR6wvTAFr1UhpIkVhe5Q==
X-Google-Smtp-Source: AGHT+IG2LzaM/Sk0q0Vc3/akvqey5NM44PhpknGZpIHXDiE8XtWDKK7KwURtjcAL74Aw8IPF+WA+FQ==
X-Received: by 2002:a05:6a00:21c4:b0:6cb:a1fe:18c0 with SMTP id t4-20020a056a0021c400b006cba1fe18c0mr23721127pfj.8.1701377869319;
        Thu, 30 Nov 2023 12:57:49 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id f18-20020aa79d92000000b006cbbc07a1c0sm1635418pfq.156.2023.11.30.12.57.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:57:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 05/25] libjpeg-turbo: upgrade 3.0.0 -> 3.0.1
Date: Thu, 30 Nov 2023 10:57:13 -1000
Message-Id: <c86d9c34aea1e735c9c828029ce0ae1501928e4c.1701377676.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701377676.git.steve@sakoman.com>
References: <cover.1701377676.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 20:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191523

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
1. The x86-64 SIMD functions now use a standard stack frame, prologue, and
epilogue so that debuggers and profilers can reliably capture backtraces from
within the functions.

2. Fixed two minor issues in the interblock smoothing algorithm that caused
mathematical (but not necessarily perceptible) edge block errors when
decompressing progressive JPEG images exactly two MCU blocks in width or that
use vertical chrominance subsampling.

3. Fixed a regression introduced by 3.0 beta2[6] that, in rare cases, caused
the C Huffman encoder (which is not used by default on x86 and Arm CPUs) to
generate incorrect results if the Neon SIMD extensions were explicitly disabled
at build time (by setting the 'WITH_SIMD' CMake variable to '0') in an AArch64
build of libjpeg-turbo.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f1d2ffb6c7282751919a7057ffc445db71866f96)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../jpeg/{libjpeg-turbo_3.0.0.bb => libjpeg-turbo_3.0.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_3.0.0.bb => libjpeg-turbo_3.0.1.bb} (97%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
similarity index 97%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
index 146d80008c..99ed82dac4 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
@@ -10,7 +10,7 @@ DEPENDS:append:x86:class-target = " nasm-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "c77c65fcce3d33417b2e90432e7a0eb05f59a7fff884022a9d931775d583bfaa"
+SRC_URI[sha256sum] = "22429507714ae147b3acacd299e82099fce5d9f456882fc28e252e4579ba2a75"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
 UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
 
-- 
2.34.1



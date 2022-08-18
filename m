Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B67C00140
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 16:57:12 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.44558.1660841829248798586
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 09:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=KLamFZJc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id w14so1989902plp.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 09:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=LDzEmCp2bnGPvzCZFahGPBW52QUZ4J5nW+UEzQQvB7E=;
        b=KLamFZJcCWsif7RfL1dKoubcJlD6Iiwfnm6/IuZOGyZRdLhfyHl1Pl6dyhS+roipZ7
         MOPVRmMu0paWsUaQw8WkjqftbJEZfpKoR+ry9mHJdWryP1aKbc3yeMCFPxhhTakvYYpk
         s9QpiAF814bX79bN/egwmPUtsJGGBi59Wej6nh+Xn/6lwgLF1wM3D3zbmyjvpgMaZ6Vy
         gVvWwM6MzF2qT+A6j8fSfkPow974yZBRiKzA1VyIOYmNkTNfS+IuOtZdRlJOE5dyXA00
         442zH04zFSgxm5oGMUiD1X+5BqSJ80clQffm2PbkQ1TiLkU2uuZ8c+1iR5CYCtMi0TIy
         trrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=LDzEmCp2bnGPvzCZFahGPBW52QUZ4J5nW+UEzQQvB7E=;
        b=s0R99NyItUsavZGtChGAkrGPXKd24H7QY4NkRZfFkqoZ2GSrkcqaouVZ9ydMIMpobV
         dxyYD9AmoekoQeG3R3WD/0j7cNrQ+p65hWYijnmZr7d4QvZWpPlcDDcs9T6gjhcydvyF
         OIKYI3XRru5bUyvqihPfnWQW3ANfoCCI//9y0bPJSsVnXhCGJmSn0AQn1e3eyV9Vxatw
         g2ygU+j6neT/XDR15dizmJJXpiB6xEFvtEwxun9eVLWqz84kI68yhp/vFvQ5PQ7GkrBU
         aDxoXCfWHITlHIv7oKjhjIPcTi2qZzQuTvxNRP+72+205+JVGqhldMRu5V6f8yIGFuZt
         bfKg==
X-Gm-Message-State: ACgBeo1hKPVrAoDWGk62iCitoYsyO2Zx9OZCuCI1tgQHbGR+/QjR07wE
	Wg3ShnCjkrGsFRojSdBiHbI0gDZgVkCDNlEP
X-Google-Smtp-Source: 
 AA6agR40cwmVhDJuQv889UvK69zQK+2FCKCT/W2nae5bIdOSNS4FIV78FVZqkB5P+xFsHKMJEwWScg==
X-Received: by 2002:a17:90b:3a86:b0:1f7:2103:a8c5 with SMTP id
 om6-20020a17090b3a8600b001f72103a8c5mr3982370pjb.64.1660841828348;
        Thu, 18 Aug 2022 09:57:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h135-20020a62838d000000b0052d432b4cc0sm1897446pfe.33.2022.08.18.09.57.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 09:57:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/11] kernel-arch: Fix buildpaths leaking into
 external module compiles
Date: Thu, 18 Aug 2022 06:56:25 -1000
Message-Id: 
 <386bd116c0d2bce9ff88ba1e09104d097e0f678c.1660841536.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660841536.git.steve@sakoman.com>
References: <cover.1660841536.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 16:57:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169530

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Building external kernel modules like lttng-modules was showing build paths
inside the debug symbols for the modules and breaking build reproducibility.

Fix this by adding in the mapping needed to map the kernel build directory
to something more approriate on target.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b56dc9009ba93174de6bf4c01e17808ef249dc5c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-arch.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 07ec242e63..348a3adf22 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -61,7 +61,7 @@ HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
 TARGET_AR_KERNEL_ARCH ?= ""
 HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
 
-KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH}"
+KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -fdebug-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}"
 KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
 KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
 TOOLCHAIN = "gcc"
-- 
2.25.1



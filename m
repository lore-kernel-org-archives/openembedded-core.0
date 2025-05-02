Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07722C3ABB6
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 16:55:30 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.24048.1746204923010868187
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 May 2025 09:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lUsXqOkz;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-227c7e57da2so22226565ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 09:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746204922; x=1746809722; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfG9KvC0Yi0ZfpFQDCzV+4Qiz1nxJ1wMHdo1gjxCHNc=;
        b=lUsXqOkzESuLVEgt14PJvpUuX2Hd+MfvGXdwZt1bziQ8AcXJJGuNMy3n70HD5bbGJM
         upfz6oCkvaQews8MHxCIasN2ICkxKIMSWRsrziosYOaSN/BRpD1IgwsR94IK35Rkl4kU
         QsBUdjaLfqbsE4X7LoW0ezWYkoqtRLIx+TLEkjveUmtH80IAr4wRlW5kHaIIpa1Ztypf
         sH3PJQpvzEoqVAY3HQl0yWBCI6MOVChReVuk/K8+xbebkyAic0M1w9xR3n4xleSXo/2Z
         FsnQ2kx/0CketHwoNp1exYZsV0LFwj5W65kwP2snQUFG3Yyqomq6eOZUfK4YOLD+rubr
         BrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746204922; x=1746809722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfG9KvC0Yi0ZfpFQDCzV+4Qiz1nxJ1wMHdo1gjxCHNc=;
        b=j0+hwnXh5ZIcYVqJILRQ26VGhyqCOc7H/rDhoD6gu0WbhIXkPum54VgA0kfdRrKKOd
         SLZaQQ2ofurL7paLVffWL5oJ0l0Qw5OBgB/GinUebeU87SBmhM5c753p4ue3zDDEZyRa
         2eBWnr62OfkjTlPivUXJeXQVCu3s1sf9J5KXQUw4PbW5ywO8Zp5UXOzbI/QDKTWcQH6J
         1tiXq/WVFAhEXzN83Or2ycKwN4DscCIaqknRY9ZfgWaWLSR8E/4cUicnpGqEetmvwVEE
         KZsdg2ZqIEnOhyrgxJmTxbtky/jOKqI9H/Loss9I123Y037NayUXyaKQXj2bWJd0j/yu
         S2Ow==
X-Gm-Message-State: AOJu0YyHbfvbHfTjYtPuvfIjWxV2partaFYS92m56RPJO37OoDnI1PCc
	wk7mclTGvksTxRklFbBcAXu8NgYaA5tKhVTcdpR1xNr3H1+uYDdZhV91kLlu
X-Gm-Gg: ASbGncvLZm0A66VQv+nMCPBzuPhTo21BGXTsMMEHOT9tsqWnhQpzeujA4uRcbOfEqDR
	2m/jdK8iYrzMg4UUz04PQ/8YCAjhLb9itkpNwET8H9fsZeWRkCMDeuFtZUlpWgoXljaHzqRYBx4
	ZOZv7kKKHf/6n+bo3ConxEDfdPfV0J13l3WJ4xL0NPpeE1cV6a6Jzt2icSN6GQHG1mU9GjxvWi4
	X5QV8YrGqkVezpkaK5iRD+KDD1ygyUQg3SvU1OdVs4u+je+rm40S59OYLOhN7dp7UbmQiUX8fnF
	5YR5ohy0rAczRD9ddP5YNJ0ZS2JHxETJ
X-Google-Smtp-Source: AGHT+IE4Q/xA4Y7h7nkgZoSYVaiPZ8hslopyLtsQuz9bz0ZoOlmsy4803L66+x6QFRoW7jMaUJcdxg==
X-Received: by 2002:a17:903:110e:b0:223:f408:c3f8 with SMTP id d9443c01a7336-22e1031ba47mr56210145ad.14.1746204922177;
        Fri, 02 May 2025 09:55:22 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::fb82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a47625af9sm3253794a91.31.2025.05.02.09.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 09:55:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 02 May 2025 09:55:17 -0700
Subject: [PATCH v6 3/6] mesa: Pass needed clang flags via
 BINDGEN_EXTRA_CLANG_ARGS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-clang-merge-v6-3-00f2c2e9ff68@gmail.com>
References: <20250502-clang-merge-v6-0-00f2c2e9ff68@gmail.com>
In-Reply-To: <20250502-clang-merge-v6-0-00f2c2e9ff68@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 16:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215914

This is needed for clang to find the c++ headers when invoked via
bindgen

Fixes
| /mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-linux/mesa/25.0.2/recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fatal error: 'cassert' file not found
| Unable to generate bindings: clang diagnosed error: /mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-linux/mesa/25.0.2/recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fatal error: 'cassert' file not found
|

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index cd0f02c6d7b7c8de37bdb1695abc70d95f99a919..c477b774628eb49dacae8b64244d3e98bfcc2588 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -266,6 +266,10 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              mesa-vdpau-drivers mesa-tools \
             "
 
+do_compile:prepend:class-target() {
+    export BINDGEN_EXTRA_CLANG_ARGS="${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} --target=${TARGET_SYS}"
+}
+
 do_install:append () {
     # libwayland-egl has been moved to wayland 1.15+
     rm -f ${D}${libdir}/libwayland-egl*

-- 
2.49.0



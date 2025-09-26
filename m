Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21C1CAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 05:02:48 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.10531.1758862951644629153
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 22:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e6VKXdaG;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2570bf605b1so19029455ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 22:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758862951; x=1759467751; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qWa+uIYaeon4WpZ1L+ZTrH9tLmxJjrCP3UsNprxL0s8=;
        b=e6VKXdaGZj9r55gBeYtL2ip7hpyN2VZbPOPWDzBvwRec/hR/be31jzGmRDfTyuzIAJ
         dFCqllqjO6JjdyQ6hUeGh0ug9rHLYtZabB/TvIXJMrYcVQ7+j5pQKEhRn8IrDCRsNi3R
         u/40d15qujgonjbDqRpAos7MShtQfzBw13OegbajL37Qy2+CjfDg5tTXVs5xG/fCuP1V
         GHoEn3UTmjy61U7BvXuJCuBE0Nbaj6Qy7q0UHAk5zhPebkpa30/EdAZlQrKdUvmHN100
         gT1PjkeFdipF5D815T5lROhRUzUlpiQe2zEUygPmPvG+0Td86Qo4crRQOv6w8JXjW73v
         Rqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758862951; x=1759467751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qWa+uIYaeon4WpZ1L+ZTrH9tLmxJjrCP3UsNprxL0s8=;
        b=WuGOzha0yMNF8IjCLLBT03/ojZuadmjR4w/5KUIZj5ZjRHjclMlTbVDJKioSnk6rH8
         L8yrPSYqMJGg4LBKsatVlRPZ3yQIZNIb8fFQRu7BFxbJwfNUKC1OVwDGyAnOGKSFn807
         tfrvTfi5c5AHZuOthSg3lHQJ4NlWKAyih+8JQuElFB+zraNHkz/4U/J1mtQflYSvlMZv
         vPVRYHHGKVNAYSoDqWzOGXLrU2ZihPEg4uGrPn2zvsFbzpe7g37KtAOkVqkJloYmCxou
         R+fcFJWZCP//BQEy2LgD5uYsdyvlCB39isfEK55IOp7jqAj739j+HRceAz6d7IyKN7yb
         VOTg==
X-Gm-Message-State: AOJu0YzzrWhfyG0hh+y5K6dRor0x1MIm70xyeA4prRYSM8rvFY3BZEyP
	3aztm7eWBk9XLNza0A8tj/qpwgDW6LUNkEosgTn7f+Mw1KinhPCQiCjD6THsfmbP
X-Gm-Gg: ASbGncumKfwfsBLHL8RGBi4Zm+LHwCdDyf6mT3bU1oEF2cjESF6IbmKLcWD3WJyJEnJ
	F43/C1t7i0ApgNV3qfLkvrA4PMyz7Nel4g7j3l2MYOa/cN1rSIrJKubQha+PVQ949WqTJ9rbpYA
	cwotiUKatvDJvUJl2Th76/O3BYA4azNcP1YclaVsOw8mqwVggztBFG2Buw2K+Ojy/wRJgfl0d4+
	UVpQU0WbDWF1FD42l80/52rHOrC/yZwQ8G3PAB7w06T1HLD86tbYLrWuEh1L/ElZNuA6nRUAn8U
	sbXNenDGIJbAITMGCA8OXDgBDIsRaBqnMVnFU+u0BgmEgX3H1IMpY1YpowKXZFT0xu/Cq66th7J
	s56R+4smNVt/30qQAnqzu7pQFVo09Q7VhSWYmoNzc2pFxtfj65qk0+N0bsEg4QADiV3yYCatG7v
	c/+WA+H/XshMFl2r0RDK6wS/ARWd7BBN7qgd3CHthK
X-Google-Smtp-Source: AGHT+IGS1snaaC2DFcsF6AmJ+BfoppJmP+5HdXPu49MqUg3SB/CqdPataAXGTMV66679UeFpyPfpow==
X-Received: by 2002:a17:903:32c3:b0:267:e3af:ae67 with SMTP id d9443c01a7336-27ed49d2f64mr63052635ad.14.1758862950659;
        Thu, 25 Sep 2025 22:02:30 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::fa7e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69952b3sm41410745ad.96.2025.09.25.22.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 22:02:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH] cmake.bbclass: Unset LDFLAGS for native builds
Date: Thu, 25 Sep 2025 22:02:28 -0700
Message-ID: <20250926050228.1782175-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 05:02:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224052

It ends up appending LDFLAGS to CMAKE_C_LDFLAGS and CMAKE_CXX_LDFLAGS
which is not good when bulding native pieces in otherwise nativesdk or
target packages where LDFLAGS corresponds to them and not the native
portion of building the package.

Addresses the nativesdk-clang build regression when using

TOOLCHAIN = "clang"

because clang toolchain class add dynamic linker settings to LDFLAGS
which unearthed this issue

Suggested-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-recipe/cmake.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index b8cd622c2df..c9a03dc3fa1 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -181,6 +181,7 @@ list(APPEND CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES ${includedir})
 
 EOF
         cat > ${WORKDIR}/toolchain-native.cmake <<EOF
+unset( ENV{LDFLAGS} )
 set( CMAKE_C_COMPILER ${OECMAKE_NATIVE_C_COMPILER} )
 set( CMAKE_CXX_COMPILER ${OECMAKE_NATIVE_CXX_COMPILER} )
 set( CMAKE_ASM_COMPILER ${OECMAKE_NATIVE_C_COMPILER} )


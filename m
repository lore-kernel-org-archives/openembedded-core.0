Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC32BC61D92
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 13:26:59 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.39821.1700573214193973835
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 05:26:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=T/IuU9Tj;
 spf=pass (domain: linaro.org, ip: 209.85.210.173, mailfrom: javier.tia@linaro.org)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6cb66f23eddso1958648b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 05:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700573213; x=1701178013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z06T3O5w1TF2+d8tK724lE7Cx8zSYeceJdukSqPJ2ig=;
        b=T/IuU9Tj5mKsgcfmKLSeiYrh7IrTgSHPiLIULlJltwKi0wj+an7woRPCVc+gNt1rf/
         5LS4rENHbdRsuDQFpnXtlUCefthtZmfJ6jWg/xLoVYR3dmfwzeGC10eblSmjcSgHMzzQ
         Oyp+mVBcOAbYW3UAv4h0Gr5X0KjL5sO4/bHmVa+eECa7uD8qdLL/ycNjPV22DhxpETRz
         sdQvrq1FlxvMuG4kW2621oGudtWrxSLkmIaLSvBjuKk5JGa5673ksigUhMgbnyrgFLH/
         sB975ZClgqNELThpOEmTW90agetDkNzbzL70Fs9J7PKCTR/a12mbGc8GXzD/QstaWspg
         STYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700573213; x=1701178013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z06T3O5w1TF2+d8tK724lE7Cx8zSYeceJdukSqPJ2ig=;
        b=ZATwxnixF63lafib2ZOesL++556NogHpwBZvsUFWoheW9tb96FIPfnuExPEndVTU41
         PNwfPAXTXDPrbJhRTHVA1ZqdMiPgOtFpVgUie5pFLY/CnCoNU5hMT+E2274NHgQDoJm8
         DLFXSZEHr8yJ8BrhY0vsp0jwU27sz7FUNhwfLmrQv3V97NIUT3om61QkCYDr/0rD07pq
         n+2SZvmP5EeV78uNkF3Byeptq5Tehi+sl1uDzd5JUBeUCSYFGKANtUHVbGmox6SkATDc
         RYEYjIStcZRhHg8ls4RpSyrdcQGt+k6ON6facEsNmu0JH5Xk6uS991Kt8VUwTuhnoOtW
         aiBg==
X-Gm-Message-State: AOJu0YyKFQGGTvOB5E7pj4Gw/C2w241ihzq7htgcsYo379Bc/WnBq/GC
	oEBbpKaL05L1VdRN2Dp4dkw9ZF+wBDTE0e409/ZwGA==
X-Google-Smtp-Source: AGHT+IHhYh+SdaTYvOxRnpYHyn/ZpyKHYBvj7x13you2pg0xy/thEy7y3Wz5C/KASoepBq7QVPlpbQ==
X-Received: by 2002:a05:6a20:2d25:b0:187:e302:2d09 with SMTP id g37-20020a056a202d2500b00187e3022d09mr10528621pzl.24.1700573213320;
        Tue, 21 Nov 2023 05:26:53 -0800 (PST)
Received: from jetm-rog-x670e-gene.. ([177.93.3.242])
        by smtp.gmail.com with ESMTPSA id x19-20020a056a000bd300b006cbae51f335sm3321289pfu.144.2023.11.21.05.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 05:26:52 -0800 (PST)
From: Javier Tia <javier.tia@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Javier Tia <javier.tia@linaro.org>
Subject: [PATCH] kernel-arch: use ccache only for compiler
Date: Tue, 21 Nov 2023 07:26:38 -0600
Message-ID: <20231121132638.1106320-1-javier.tia@linaro.org>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 13:26:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190978

Attempting to use it with other tools is not beneficial, only with the
compiler. Confirmation from ccache's maintainer [1].

[1] https://github.com/ccache/ccache/discussions/1346#discussioncomment-7616180

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 meta/classes-recipe/kernel-arch.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 6a50bbfd42..404f2e7061 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -74,8 +74,8 @@ TARGET_STRIP_KERNEL_ARCH ?= ""
 HOST_STRIP_KERNEL_ARCH ?= "${TARGET_STRIP_KERNEL_ARCH}"

 KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -fdebug-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}"
-KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
-KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
-KERNEL_OBJCOPY = "${CCACHE}${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
+KERNEL_LD = "${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
+KERNEL_AR = "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
+KERNEL_OBJCOPY = "${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
 KERNEL_STRIP = "${HOST_PREFIX}strip ${HOST_STRIP_KERNEL_ARCH}"
 TOOLCHAIN ?= "gcc"
-- 
2.42.1



Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E9BC3ABC1
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 04:15:24 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.42936.1746418518074324228
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 21:15:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O9XkgN0T;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7376e311086so5620363b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 21:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746418517; x=1747023317; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfG9KvC0Yi0ZfpFQDCzV+4Qiz1nxJ1wMHdo1gjxCHNc=;
        b=O9XkgN0TacMQc0LrfevG/d1OHgw+rxNenLZ3OWrB37HHBj/n+Y79E0rAn0KgRNfUsw
         OP2AWOLPNcj1Mq9stAbJJ1ZOcb6WSAs53+OHZhkDYw4IqPWXr6k4vinfKg22Gwi0jrWp
         HOeQpJP+sAmoms/CPptj+hSk56pcpH6QSUsYBzcpLX00Opy2mYckcol5deS+UT3uqA8V
         HDDxxsbVaEj+2Zk3v24PdKy2KsFhe656oIzw7pYvWindg/BdifqoQ3XF0HYFXnKAhhG9
         eRB4j7zWjcZO6dJLCnPm5UTVt+io6rkXqGDNw3T0F2jkZ7rdboe/rNAauzwVMuRJ3fis
         i8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746418517; x=1747023317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfG9KvC0Yi0ZfpFQDCzV+4Qiz1nxJ1wMHdo1gjxCHNc=;
        b=v5rIZi9PuQ0KZNLw0DR9iTatjzSaS24kBT3rpeQWCwpb/A7Cfuf6xEVELsoEppXiR7
         6RsCzsJyaN+Y+HGYnEiShHwpkP6aBuci4FSVroI2SXvTwtQmL6tfhEdB5BqHZ9mwNINN
         EEElXN51lb4JOY4zwywVO9DYIkO3LTOTTzZGXkqzrYCusWTpiUOVlwVxOIeGue8q0OQN
         Z6g/4Gmnx2/KQSHHqjwqnuK0DEwd/C+YLyh9SIXle6HvkcLYMzKj9FOQ0STi7xz2fheJ
         +gRJ1ufiBBpOXQStcVtSKZHnK+eW0iqHM1RAVvH5zqZSviGEemlOG5gIRJ/eyOovADel
         BJow==
X-Gm-Message-State: AOJu0YzQK//XjoMyBmQzjEkUnBUcW+WztHR5XS6pch9yiFkiT9ybmt9e
	HMOF6OcS/Es9dxv79Kmj+njhxsoqyljdGUlAlhphh+Utlu+xxMps8fSJgdOh
X-Gm-Gg: ASbGncsyECEjPMSZkX27ELwmrCnwyQnTNt/ono5ZjoOY8viqVksiPAiYBiWILSBBq/K
	8vCCjbU6+X76UyYdxBfKiV7cf0JQ0RwenXnOyvqiZeJ1+9gC96oxnqLne/68qIOMr0PDNm2EGa4
	P1I0DEx77RnX0TZfeNSSeX0tb2qYd3fzc1Ct6GF2yKt3xIWVUuFh4Bi/yzOXp2TZTbruv1fkvWh
	BJp6CaETHKrNV4ar4+xbseoFYd19cgxF2xuJB0+F5oFfzOBBAYFgBaF9fBVRncCgjwN3fyhxNCM
	+rIv28mBZt7EqxHTVx68izvv1bFGXctA
X-Google-Smtp-Source: AGHT+IHguWvlGhv0z0E7Ma8D5Ydj89vxM6G+wrtAP0d0S7nzPrbISeXoB3HCPOA1vXrPCWqxfx9rVA==
X-Received: by 2002:a05:6a00:e10:b0:73e:23bd:fb9c with SMTP id d2e1a72fcca58-7406f1b24a5mr8504475b3a.23.1746418517462;
        Sun, 04 May 2025 21:15:17 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059021044sm5905039b3a.96.2025.05.04.21.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 21:15:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 04 May 2025 21:15:13 -0700
Subject: [PATCH v7 3/8] mesa: Pass needed clang flags via
 BINDGEN_EXTRA_CLANG_ARGS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250504-clang-merge-v7-3-165be7b96180@gmail.com>
References: <20250504-clang-merge-v7-0-165be7b96180@gmail.com>
In-Reply-To: <20250504-clang-merge-v7-0-165be7b96180@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 04:15:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215979

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



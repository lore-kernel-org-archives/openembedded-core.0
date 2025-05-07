Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6864BC3ABBF
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 18:58:35 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.3945.1746644311284052894
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 11:58:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NsQyN9x/;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736c062b1f5so341947b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 11:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746644310; x=1747249110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9758gt0GUnNfPWac3hqtewFCalLGcIk7cet584hOFz8=;
        b=NsQyN9x/bsDL0IEdlS2uIT4aUoVumN1BW7Zxi5qlQ7gq3VJUKBwZFcrKcaxrQgrNt1
         Inq1czHN2/3c2+yEsPQd5ECTkDNN6Pmm8Q+yHBG8cxXYycNpftyJBf4L5+v+vcMALC0Q
         AHg6ct1JVpb4WtZXmGm6UtDrSJxsW8r8i/fcOTki+K+I94Kg9L+SNsx3ScbekBv7A33u
         VgT0ljiDwo/gpW7OZbTDWe9tiLQ4zB7166Q0zE64lHVEeYulSEWi0SxnPYC9vhD3Wirj
         jtVaWnROj2pC62iooA53H7nlxVko+sHJy+krlHCCwNNf2iZO/8Nuagbk+dzUXTKTNoZ/
         dkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746644310; x=1747249110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9758gt0GUnNfPWac3hqtewFCalLGcIk7cet584hOFz8=;
        b=NBXqu6XHMUliqwZqT3MfhaTAOlnifrTNZ1k7gJLj2/sxI17e+kjEcEd3YtfwGUFMWe
         Mikqt/QwTkIygVFnoZcm89sQCZ1l9sX4vDjtjSOHp5Ikgfmbo7Om/wmYinsukQRC1psq
         v5r6vU1dJ9Go57VU6zZUWlGJgQPJk9u2vE+ywqtTMAwA75vm4NpvnWXqgYBsCBveWn8s
         IaQw2Oic8feCfAyEGKqrDCOTPp/RZfPoTCvoWbr8wJSlZ5qhQLZ7NUF6r5yiZUNb4Szw
         JqsirfajX9Zql3XDKzKELTn77hzf9WfpQcNjlN32umjKUnZwZfxS4MFZBGJDsfm/CfI9
         s1pw==
X-Gm-Message-State: AOJu0YzI9ndY7/L04wZJmjwEl3pk6+ghglatKxW1/WiH/oLrBUtKeO2l
	EzMyruGl4RZpJn7X2VO6EJ3Ahm8jQzQtJo6o/PjL7Yh1JqotdZjFmcBOiyPU
X-Gm-Gg: ASbGnct+UApJ1dMWS3Hqc1bFdR9TfTWqEIdwIVRSJKNMdMbh6EC3vHNN+IVoFa0yeB5
	48dM9CGvfOtKvYth3/bfGfcWu4haX17JxinMmHYeWa9/yGkQG75DIXxZ7c/iVq60XfoilRBdv6I
	tjHqWW3gZBPF+y61wJ3pJ+DBqCYqDBOaPD2Zr3E64fVWAa387t4v2Xmuh9FNkraFz1mxUX+bWsQ
	C2Es7tQTPUHVxhAJ8mFaBbyd+dM+kBxOmWUsKIkObPfK4g9j0JtfGnTnUl27y3A4EfPy8K1CXqx
	RnoTTOLdKJZMdJY/vtyctRtVJHWuWVTs
X-Google-Smtp-Source: AGHT+IHtPK9ody/p/saoEt5KnELn3vPaA2XfDpstMlxaJ31PqdR+15YHkXOhHElVoDl6T+5hFX5KvA==
X-Received: by 2002:aa7:9306:0:b0:736:32d2:aa82 with SMTP id d2e1a72fcca58-740a9a9c1e8mr619940b3a.23.1746644310306;
        Wed, 07 May 2025 11:58:30 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059021044sm12084705b3a.96.2025.05.07.11.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 11:58:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 1/2] clang: Space optimize clang recipes
Date: Wed,  7 May 2025 11:58:26 -0700
Message-ID: <20250507185827.843653-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 18:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216128

They can consume quite a bit of build space, we don't debug them as often

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: No change
v3: No change

 meta/conf/distro/include/yocto-space-optimize.inc | 4 +++-
 meta/recipes-devtools/clang/clang_git.bb          | 2 --
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/yocto-space-optimize.inc b/meta/conf/distro/include/yocto-space-optimize.inc
index 407e8937f08..b83ba426e78 100644
--- a/meta/conf/distro/include/yocto-space-optimize.inc
+++ b/meta/conf/distro/include/yocto-space-optimize.inc
@@ -3,6 +3,8 @@
 # and build speed.
 
 # With -g, llvm workdir is 40GB, llvm-staticdev is 1.3GB, llvm-dbg is 1GB
-DEBUG_LEVELFLAG:pn-llvm = ""
+DEBUG_LEVELFLAG:pn-clang = ""
+DEBUG_LEVELFLAG:pn-clang-native = ""
+DEBUG_LEVELFLAG:pn-nativesdk-clang = ""
 # With -g, qemu workdir is 10GB, qemu-dbg is 363MB
 DEBUG_LEVELFLAG:pn-qemu = ""
diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index ba037e59785..c93554622f1 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -153,8 +153,6 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DLLVM_BUILD_EXTERNAL_COMPILER_RT=ON \
                   -DCMAKE_SYSTEM_NAME=Linux \
                   -DCMAKE_BUILD_TYPE=Release \
-                  -DCMAKE_CXX_FLAGS_RELEASE='${CXXFLAGS} -DNDEBUG -g0' \
-                  -DCMAKE_C_FLAGS_RELEASE='${CFLAGS} -DNDEBUG -g0' \
                   -DLLVM_ENABLE_PROJECTS='${LLVM_PROJECTS}' \
                   -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR} \
                   -DLLVM_VERSION_SUFFIX='${VER_SUFFIX}' \


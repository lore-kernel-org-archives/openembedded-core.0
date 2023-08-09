Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF7A0C001B0
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 20:56:41 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.2710.1691614594065572777
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 13:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cTBWsm3o;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-686efa1804eso162117b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 13:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691614593; x=1692219393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1RHszseevMgnjhd/AJ9tTO4OS5jUSy4SDFsG1MUvyWA=;
        b=cTBWsm3o6DIQLOUezZ2MGrHPUNlQiAN5KUlKmK9Ix81DYCaqYnHtelils5YaXL1uX4
         JWuNSzrxLTjFjatTzhZCTW6F6zFgKLmIYUyLZDfCwYT+DvwiKVgwZLTXWU6FEgnsU0m4
         ArLI9t+VK2z+7UmsXNuWKIxjUvAgKxQ5FrOP1sI/iMdmkCfYeRHYJB8UxTCmB7pQ1nVj
         xERLQtZCG1cutVHirOflJrVIQ5DjV0v0iaCdvCaIW24FXXQe7Ly+ZFUN/FEcNUtbz21h
         1bOmk0WgZrBfu93sUXJbhqwoIxw/v1nmzl2UrAsBqBIWjsuuyY5OOrCbWyhsLX/SBa8O
         JXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691614593; x=1692219393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1RHszseevMgnjhd/AJ9tTO4OS5jUSy4SDFsG1MUvyWA=;
        b=TA8k3WL1MgB4BsLtpDzFt96gzVlbn2d5r7Vj/pGzuc9a8aRhuda0+0WYBIS+D6MR2N
         Y+lzKqEb5/7N4ibbSQ6iE9t/X4BQaocZxmjn05ppUqLvFrG5dE1K/ZVUlAhptgmo+hQf
         F4n2oJcOLb1Ugt3hGWSwcLd1L+70I0Ehpk+lAPKw148DxhXE5daymq/x0lMQCpSyLAdh
         EclfiXcbHw+UC5OGH1sQSi6GMKvZ8LKo5uO9rLGf0FTSc4+elPXdSeDqEoEqj6LosYTc
         HvhbVLASWYQggweNn+AxDSaME2IuKmQNSvhhii6o5J4rXpPXlmIY2cQ7qo7kBqtojWIS
         8ygw==
X-Gm-Message-State: AOJu0Yz+M/CFUCXjKqsCbLawGX8expZFIZL05LsxVoFkkolELkWD26op
	ePuwy2ottng43Oo1h8uMsR09kTzIMfzVBg==
X-Google-Smtp-Source: AGHT+IFdbKlCr1Jv+XhF2Th6Q1rhPj2Vn8ZtrWsP9cCiBt/ZVvukPTthIzwmcXe+QQWUPRiim5038w==
X-Received: by 2002:a05:6a00:188c:b0:687:3f06:5939 with SMTP id x12-20020a056a00188c00b006873f065939mr383134pfh.32.1691614593052;
        Wed, 09 Aug 2023 13:56:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::61c9])
        by smtp.gmail.com with ESMTPSA id 26-20020aa7925a000000b006675c242548sm19376pfp.182.2023.08.09.13.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 13:56:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] gnu-efi: Fix build on musl
Date: Wed,  9 Aug 2023 13:56:30 -0700
Message-ID: <20230809205630.2723070-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 20:56:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185717

Build with musl emits extra warnings about pointer incompatibility due
to different type of wchar_t than glibc which turns to be error in the
end, disable -Werror for musl.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Always apply the patch

 .../gnu-efi/gnu-efi/no-werror.patch           | 19 +++++++++++++++++++
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.17.bb    |  2 +-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/no-werror.patch

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/no-werror.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/no-werror.patch
new file mode 100644
index 00000000000..db2bcf70b76
--- /dev/null
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi/no-werror.patch
@@ -0,0 +1,19 @@
+Do not treat warnings as errors
+
+There are additional warnings found with musl which are
+treated as errors and fails the build, we have more combinations
+then upstream supports to handle
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Inappropriate [OE specific]
+--- a/Make.defaults
++++ b/Make.defaults
+@@ -187,7 +187,7 @@ CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wex
+            -funsigned-char -fshort-wchar -fno-strict-aliasing \
+            -ffreestanding -fno-stack-protector
+ else
+-CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Wno-pointer-sign -Werror \
++CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Wno-pointer-sign \
+            -funsigned-char -fshort-wchar -fno-strict-aliasing \
+ 	   -ffreestanding -fno-stack-protector -fno-stack-check \
+            -fno-stack-check \
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.17.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.17.bb
index d37d638e097..43b7cc7529e 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.17.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.17.bb
@@ -17,8 +17,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/files/${BP}.tar.bz2 \
            file://gnu-efi-3.0.9-fix-clang-build.patch \
            file://0001-riscv64-adjust-type-definitions.patch \
            file://0001-riscv64-ignore-unknown-relocs.patch \
+           file://no-werror.patch \
            "
-
 SRC_URI[sha256sum] = "7807e903349343a7a142ebb934703a2872235e89688cf586c032b0a1087bcaf4"
 
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*|riscv64.*)-linux"
-- 
2.41.0



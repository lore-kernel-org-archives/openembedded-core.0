Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121F0C41513
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 16:50:21 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.67120.1691513414983460629
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 09:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=XdL8W+SF;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-686b9964ae2so4246182b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 09:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691513414; x=1692118214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=85CHZfo3JdVo40EjFPaR/9MpfXY4tCqZBrjVADGMomQ=;
        b=XdL8W+SFzXH0QA46KzqY0h+oAVDMMNOf8ZD7wWSKmuMBKVGl/xDesbqSLKeSK7/toy
         K10B5RlRsml0EqqoUPSzNqZtij9h2G+eEJ7Vryp40ym+0TW/hdT4qm+N6miUF8WN+QZ/
         Wc1t+FR85lmOdvDCEcCLQd6Uke6Jdgi4WgQ9j8fzN72jeXiwJYOQli/LjLve+wdQJ80h
         6UVtkrK1Iq7u3Tyl6wvlbK7j9etGsSN2WRrimgn5XebDfG2Gv9zRYFkwS99tzGILmmzd
         0ILMrJIn23m9ayN6uqYYj3+FoEMjDrOMQteJvrx4qGxEFGNtmIYoCmjTj8auu65xACR/
         Lfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691513414; x=1692118214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=85CHZfo3JdVo40EjFPaR/9MpfXY4tCqZBrjVADGMomQ=;
        b=N2XbcwgoO32RoTkuj69JHUqAZ7vHc/Zbp6PliOchYbTqNc3OalxYqycq/9YLr1ctfx
         /pmgOFlEg/fBMHCNn9bE3u7adSS/Dy9ei/1cqyL6sgYvt/gQlygJZ20+IaJFm1jt0J82
         CN1GTcLl+DsNHB/DeLu0oV3ECeTwiwKvQm3cOlZsZoYBER4YM/ZqxJqYMBzVd8OFxL3j
         9ouTVVMYgcPUY4rxN+EfTfG+AGhRW8swVCDBlm5vJ/K7Rq81QaPipIjY2h7nEpo3bfSi
         JeI1c3miHU2201K4UUed+sViuxWH3gFJa4zHg5xX1EUPvHxLk3fpbOkk81In7jWMvTXX
         4tKg==
X-Gm-Message-State: AOJu0YxQM3DyiJkeyssr7cbsZNzkmkso4KkauEWAdJ9RTbq1/C/xJcC4
	Bz8OgEXM+ztZFAlFWhS647IdwSih5pTA7A==
X-Google-Smtp-Source: AGHT+IF0YLyUAb//rWlBHj17l2vf6J3GStwBF89RHDpgluRqmghcUsCtZrR4fTG5+DFeXbbf7QBHgQ==
X-Received: by 2002:a05:6a20:3d15:b0:134:37bb:89be with SMTP id y21-20020a056a203d1500b0013437bb89bemr27500pzi.57.1691513413930;
        Tue, 08 Aug 2023 09:50:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::61c9])
        by smtp.gmail.com with ESMTPSA id f12-20020aa78b0c000000b0068790e58edfsm8303438pfd.56.2023.08.08.09.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 09:50:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gnu-efi: Fix build on musl
Date: Tue,  8 Aug 2023 09:50:09 -0700
Message-ID: <20230808165009.3282120-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 16:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185671

Build with musl emits extra warnings about pointer incompatibility due
to different type of wchar_t than glibc which turns to be error in the
end, disable -Werror for musl.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-bsp/gnu-efi/gnu-efi/no-werror.patch | 17 +++++++++++++++++
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.17.bb      |  1 +
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/no-werror.patch

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/no-werror.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/no-werror.patch
new file mode 100644
index 00000000000..2d7ad740723
--- /dev/null
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi/no-werror.patch
@@ -0,0 +1,17 @@
+Do not treat warnings as errors on musl
+
+There are additional warnings found with musl which may not be treated as errors
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Inappropriate [musl specific]
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
index d37d638e097..819d376f9d9 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.17.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.17.bb
@@ -18,6 +18,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/files/${BP}.tar.bz2 \
            file://0001-riscv64-adjust-type-definitions.patch \
            file://0001-riscv64-ignore-unknown-relocs.patch \
            "
+SRC_URI:append:libc-musl = " file://no-werror.patch"
 
 SRC_URI[sha256sum] = "7807e903349343a7a142ebb934703a2872235e89688cf586c032b0a1087bcaf4"
 
-- 
2.41.0



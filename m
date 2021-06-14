Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web09.2435.1623698361917140876
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jun 2021 12:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vck72JyP;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id k6so25533pfk.12
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jun 2021 12:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p65yYZEdNsWMqjZVpRvw2VfoE40w66hSR5+CRiNdd28=;
        b=vck72JyPWrcObc70MB0zGnEH631vDWlr+LqCWfcIAlNsrKr2yGkGvUpM1aME4TEdoG
         oz1ACi+CBNgvqZSQfDlfNTF6doWgmhUww27DDy7TwWEukZVeFH5lBekhzrpcPZVPOK7k
         O9zL58okjF5P8e0vA7VSsfvZEqd4BMuDhOt/uaJUIFyW+lveoxhz2bdDb+THiFAFZ+BT
         P1U9K1X1+eHLHIe2ye1CwbIA4CY9E/DmFqvn/kyEb3h7SKT7NSXmt3CMwS45aKnqnLTN
         fC7Ge0GEVKvRlodlW1sbPetZjSW7pkpMKcdPkdjpiCELOzzKVox+F0uEht5hCaMKC0aS
         uKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p65yYZEdNsWMqjZVpRvw2VfoE40w66hSR5+CRiNdd28=;
        b=Oitczhi8jn/9vNNTdZhQ88Pd3SkbA3dxChgvz8VBo8s456wd0F0404xpQ0VR2YskqF
         KfR+jH9fDWoaHWCLS6QPcnhP7KxlEsNfpdm4dar0V3qB6ldiVxBLQf0DQDgDYtza8NHK
         gO+5rI3u8dUO64Oupjooeajw+7lz0yjYIxRlkY7A2eMJBQLGgrBeGpF0oPMyriJIFz7v
         ZVOZxN8HHAGr5SoTjfRC5UL0F25oBRg9ZEgGdFylWOCp8ZcybqE/5DwhQPSPNEHQ+YAq
         n8RJ85ZynnsdYBOZShTF+mCm5ndjJsbrsFJK/Tq2IEWs7iI1ETJh4sVrkoiKw2jVq+2I
         7zAA==
X-Gm-Message-State: AOAM531qP2QhIddx5xS0ImY0tQ1oHQO/C7bwJNNAozSyUFtYri9xBOIt
	w+sceK5OmGc7Kd5HIj+KTtdWpDJioOHcRw==
X-Google-Smtp-Source: ABdhPJw0d/ZK1P4V6Eh7ycaxKOfWpkRe1zlAWeykRTaw9lLRai+S4miCBEOUyg07w6WW2b/Tqj9PBQ==
X-Received: by 2002:a63:4719:: with SMTP id u25mr19106487pga.193.1623698361144;
        Mon, 14 Jun 2021 12:19:21 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id z15sm14513970pgu.71.2021.06.14.12.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 12:19:20 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] qemu: Provide float128 via hwcaps2 on ppc64le
Date: Mon, 14 Jun 2021 12:19:18 -0700
Message-Id: <20210614191918.2982389-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes runtime problems with qemu-user
Fatal glibc error: CPU lacks float128 support (POWER 9 or later required)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...nux-user-Tag-vsx-with-ieee128-fpbits.patch | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-Tag-vsx-with-ieee128-fpbits.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index aa7cf74dd3..6674936fef 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -36,6 +36,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0005-vhost-user-gpu-fix-memory-leak-in-virgl_cmd_resource.patch \
            file://0006-vhost-user-gpu-fix-memory-leak-in-virgl_resource_att.patch \
            file://0007-vhost-user-gpu-fix-OOB-write-in-virgl_cmd_get_capset.patch \
+           file://0001-linux-user-Tag-vsx-with-ieee128-fpbits.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-linux-user-Tag-vsx-with-ieee128-fpbits.patch b/meta/recipes-devtools/qemu/qemu/0001-linux-user-Tag-vsx-with-ieee128-fpbits.patch
new file mode 100644
index 0000000000..11b6e3c678
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-linux-user-Tag-vsx-with-ieee128-fpbits.patch
@@ -0,0 +1,35 @@
+From c5844a4cdee37268c9b65a65e6968ee129bb742d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 14 Jun 2021 10:27:17 -0700
+Subject: [PATCH] linux-user: Tag vsx with ieee128 fpbits
+
+In OE we need this for ppc64le usermode to work since we generate 128bit
+long doubles and glibc 2.34 is now checking for this in hwcaps at
+runtime and failing to run the binary if machine does not support 128bit
+IEEE fp
+
+Fixes
+Fatal glibc error: CPU lacks float128 support (POWER 9 or later required)
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ linux-user/elfload.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/linux-user/elfload.c b/linux-user/elfload.c
+index 17ab06f612..e7dd18fd40 100644
+--- a/linux-user/elfload.c
++++ b/linux-user/elfload.c
+@@ -830,7 +830,7 @@ static uint32_t get_elf_hwcap2(void)
+                   PPC2_ISA207S), QEMU_PPC_FEATURE2_ARCH_2_07 |
+                   QEMU_PPC_FEATURE2_VEC_CRYPTO);
+     GET_FEATURE2(PPC2_ISA300, QEMU_PPC_FEATURE2_ARCH_3_00 |
+-                 QEMU_PPC_FEATURE2_DARN);
++                 QEMU_PPC_FEATURE2_DARN | QEMU_PPC_FEATURE2_HAS_IEEE128);
+ 
+ #undef GET_FEATURE
+ #undef GET_FEATURE2
+-- 
+2.32.0
+
-- 
2.32.0


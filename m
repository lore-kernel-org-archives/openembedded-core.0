Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.8326.1621409848324149162
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 May 2021 00:37:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KjfxpM05;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 6so8839570pgk.5
        for <openembedded-core@lists.openembedded.org>; Wed, 19 May 2021 00:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hcopLKOlIkiyjfcqn7rHrqF0vWXvNqCYplKWrqEfv2U=;
        b=KjfxpM05JQgNuZk5yfsPeqRJA+P8bOzfh5oyivVxxhUzRzGfjui70DNEEEHwjFjeOW
         oRVaJoS/iqYXWSNzSq2LLVR4JKLNYuWYN3DLyzSOaqQbdh/RfRMy/0YbZhu3MJPYZpj0
         oVBFZZCkZJNTp6e4VjpRN7HUi7rXvsogd6B2NWvfZ4b/nmwjIQxZjGk77n62pAjiq0gq
         miO4arixntJ5+6E/87eINKFR9m54Vq0BpHS4Fi6Xom0l6Ap6kgewusBvhDvwHRAPQ66N
         2WtDVc8GiUVj/GkByXTx2VaxEpwjB0+gr1hJgx7KW4IRZoksdF1oSKjyD52aGG32bueR
         5/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hcopLKOlIkiyjfcqn7rHrqF0vWXvNqCYplKWrqEfv2U=;
        b=jcX+lE4aepKVwYmpq40ddudQUQa7EAn5gjbrrIG2Kc+6jYan24i3fno+Dja71ZgkQ7
         12VugCKVXRsAX/ZPzhcD8N10P/DYR9LLmesJmdkOoBca8XpJI5qdCWs1WEzpOI18pZuD
         lFld9PGgKpfsLwXpTb6y/ArE9IqbiXTPHDpSJlOpJBUAoWR3MiH9YeDpz9YpKir35yw1
         MV6q6T+CFA/RVIySFBhow2ZM4NaZbIa5aS+Jg+VDbrWcn/uHhudT4x7gUGwETl2jTz+U
         wHpNA1gZMuBhQiG2kacC4H4MyECgkJXqZsH5ccS/hkVDlmwckISFCLYszW0dIr0SMJ8i
         z+8g==
X-Gm-Message-State: AOAM5305jCoJRJKHz4dILo59diPqXCKoAVQOJlO0yESVUykr1+sHpaQm
	RrpqoijQEyLOBEWzhLuXLvwC8uhP6KvIvQ==
X-Google-Smtp-Source: ABdhPJxjV1Z51PnEGqWFEhBwB9x0mOnXm0fpGlMUks1yA0cRQfnxthhfSXp5AggGlKaXD4ETO1uJDQ==
X-Received: by 2002:a62:60c2:0:b029:2cb:70a7:a8ce with SMTP id u185-20020a6260c20000b02902cb70a7a8cemr9622606pfb.77.1621409847646;
        Wed, 19 May 2021 00:37:27 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a746])
        by smtp.gmail.com with ESMTPSA id 3sm14032876pfn.11.2021.05.19.00.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 00:37:27 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Fix __NR_fstatat syscall name for riscv
Date: Wed, 19 May 2021 00:37:24 -0700
Message-Id: <20210519073724.2234940-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Rename-__NR_fstatat-__NR_newfstatat.patch | 32 +++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb            |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/musl/musl/0001-riscv-Rename-__NR_fstatat-__NR_newfstatat.patch

diff --git a/meta/recipes-core/musl/musl/0001-riscv-Rename-__NR_fstatat-__NR_newfstatat.patch b/meta/recipes-core/musl/musl/0001-riscv-Rename-__NR_fstatat-__NR_newfstatat.patch
new file mode 100644
index 0000000000..9d9f16cee6
--- /dev/null
+++ b/meta/recipes-core/musl/musl/0001-riscv-Rename-__NR_fstatat-__NR_newfstatat.patch
@@ -0,0 +1,32 @@
+From 40732d03990632049d5ba63dd736269a81756b16 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 19 May 2021 00:30:05 -0700
+Subject: [PATCH] riscv: Rename __NR_fstatat __NR_newfstatat
+
+on riscv64 this syscall is called __NR_newfstatat
+this helps the name match kernel UAPI for external
+programs
+
+Upstream-Status: Submitted [https://www.openwall.com/lists/musl/2021/05/19/3]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: zabolcs Nagy <nsz@port70.net>
+---
+ arch/riscv64/bits/syscall.h.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/riscv64/bits/syscall.h.in b/arch/riscv64/bits/syscall.h.in
+index f9c421d0..39c0d650 100644
+--- a/arch/riscv64/bits/syscall.h.in
++++ b/arch/riscv64/bits/syscall.h.in
+@@ -76,7 +76,7 @@
+ #define __NR_splice 76
+ #define __NR_tee 77
+ #define __NR_readlinkat 78
+-#define __NR_fstatat 79
++#define __NR_newfstatat 79
+ #define __NR_fstat 80
+ #define __NR_sync 81
+ #define __NR_fsync 82
+-- 
+2.31.1
+
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index ef8bc2eec3..795b888bb3 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -15,6 +15,7 @@ PV = "${BASEVER}+git${SRCPV}"
 SRC_URI = "git://git.musl-libc.org/musl \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
+           file://0001-riscv-Rename-__NR_fstatat-__NR_newfstatat.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.31.1


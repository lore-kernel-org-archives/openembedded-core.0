Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5019AC433F5
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 20:42:03 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web09.2511.1636404122449117558
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 12:42:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lHYl6fUS;
 spf=pass (domain: gmail.com, ip: 209.85.215.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 188so3874970pgb.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 12:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xgYt737MUoapKbtvnnqRmZ+WOaBTb7+OgI5A3WJ7DGo=;
        b=lHYl6fUSMNEz1vZ9XqTuBlHsLkjBupIhOOnxOHeKDW8Kq2KmQcQQzotTq1URjDRpEn
         6RdPWNS9oBT0CzBMgKkpL+mPJ+tVD/bjevKpA6qsQGY8Qjzb25ZIlyG29zTFudUFYA6x
         l89EbWsKkJ6Utn0F3L9A2WR2TH12mv56ku95mTAaPrYaSoz0jDLU4xp2sCfuokuvrBKi
         lGJ4+idB85+dD6hOM3wrwsKWDQ53KtI5YohBT8O61LjQuhmY0OxwVOF10XbhwPboPamj
         Qj9wuqqmavp032mvPVcRXyhJi132Ei4H1rF2+lPLPUWWVsOYUpRDHlP78NBgWwRgdmzt
         QHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xgYt737MUoapKbtvnnqRmZ+WOaBTb7+OgI5A3WJ7DGo=;
        b=N9PzAdZZ/qqcluzNpjaLhiaotwCax3jdfhLBwVMZzmg6FHAHLTrH2hQG7/l4lRq1PT
         yb2uPAgThIxeNcQkU4zy8mFEJRCGYqpks2n+/3e+2yslC51fdpigZA3VOumGKW1u/btu
         GXhq1GbA28rIrSx9X+HA5FymraA84hCrsCSdaOrDP+c4s1GNXMYJmd8P69YpuuG11a/Y
         LHiq9wIW2uaajAqWTUZASgSGi8LAKuzuWZaaFZXueya6ADOGs1gDttzgnJMIF6OYAnC+
         KH8oxyu6RKh+7RsOLfV1OqZIWoHVuVe1+lzFLyGu+qaHz1ZYliD44LaiKdymtS9LSvC5
         jQ+Q==
X-Gm-Message-State: AOAM530d2JaEmOOj5lsmckyYGvPQDWdUAmX0QzwcvJXst3i26+6Ff1l6
	HIc3UEkAcllbIE4NroMOY4mmGzem+Tk=
X-Google-Smtp-Source: 
 ABdhPJyPYtlByw8KXz38nu5PiK/q5K5MngRlh0T69DxL6Qe6QIOmitYwNbgJ7cIcYAjF2xYpgMDxag==
X-Received: by 2002:aa7:9e9c:0:b0:49f:c7cf:ff5 with SMTP id
 p28-20020aa79e9c000000b0049fc7cf0ff5mr2116976pfq.62.1636404121672;
        Mon, 08 Nov 2021 12:42:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 mi9sm204407pjb.33.2021.11.08.12.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 12:42:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] qemu: Fix build on aarch64/musl
Date: Mon,  8 Nov 2021 12:41:57 -0800
Message-Id: <20211108204157.2910907-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Nov 2021 20:42:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157988

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...nux-user-Replace-__u64-with-uint64_t.patch | 31 +++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_6.1.0.bb      |  2 ++
 3 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-Replace-__u64-with-uint64_t.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 33052a9d492..8cc4600cad5 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -26,6 +26,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://mmap2.patch \
            file://determinism.patch \
            file://0001-tests-meson.build-use-relative-path-to-refer-to-file.patch \
+           file://0001-linux-user-Replace-__u64-with-uint64_t.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-linux-user-Replace-__u64-with-uint64_t.patch b/meta/recipes-devtools/qemu/qemu/0001-linux-user-Replace-__u64-with-uint64_t.patch
new file mode 100644
index 00000000000..3d5c890b0fb
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-linux-user-Replace-__u64-with-uint64_t.patch
@@ -0,0 +1,31 @@
+From 5cc7b63299602d0aa8b57c684bbd9829856d54ad Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 8 Nov 2021 11:39:26 -0800
+Subject: [PATCH] linux-user: Replace __u64 with uint64_t
+
+uint64_t is available in all userspaces via compiler include stdint.h
+therefore use it instead of __u64 which is linux internal type, it fixes
+build on some platforms eg. aarch64 systems using musl C library
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg01955.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ linux-user/host/aarch64/hostdep.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/linux-user/host/aarch64/hostdep.h b/linux-user/host/aarch64/hostdep.h
+index a8d41a21ad..34d934f665 100644
+--- a/linux-user/host/aarch64/hostdep.h
++++ b/linux-user/host/aarch64/hostdep.h
+@@ -25,7 +25,7 @@ extern char safe_syscall_end[];
+ static inline void rewind_if_in_safe_syscall(void *puc)
+ {
+     ucontext_t *uc = puc;
+-    __u64 *pcreg = &uc->uc_mcontext.pc;
++    uint64_t *pcreg = &uc->uc_mcontext.pc;
+ 
+     if (*pcreg > (uintptr_t)safe_syscall_start
+         && *pcreg < (uintptr_t)safe_syscall_end) {
+-- 
+2.33.1
+
diff --git a/meta/recipes-devtools/qemu/qemu_6.1.0.bb b/meta/recipes-devtools/qemu/qemu_6.1.0.bb
index 017a054d5d6..c9a53e3b05b 100644
--- a/meta/recipes-devtools/qemu/qemu_6.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_6.1.0.bb
@@ -4,6 +4,8 @@ require qemu.inc
 
 DEPENDS = "glib-2.0 zlib pixman bison-native ninja-native meson-native"
 
+DEPENDS:append:libc-musl = " libucontext"
+
 RDEPENDS:${PN}:class-target += "bash"
 
 EXTRA_OECONF:append:class-target = " --target-list=${@get_qemu_target_list(d)}"
-- 
2.33.1



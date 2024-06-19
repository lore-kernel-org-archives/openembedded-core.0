Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 745F3C2D0CE
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 09:00:12 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.16254.1718787606633766202
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 02:00:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O0Xh+kvk;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-36336aa7ca1so599615f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 02:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718787605; x=1719392405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFvPZ2aXTKGNR3jFv01NFdo210/Fn9DAqqmmuyHPKh8=;
        b=O0Xh+kvk34xKf0yE5NSxDWthNfFfvNZeSMEnE9OMczUMTkHpLcXpRJUuK9xx1OXb/f
         +4i7aq1vF6Y73ENlAHAIQxzvrddr0V7hnG9oFsO8uD++N2EyZyKj9gyTb9tGMhar7j7Q
         +fGWUX70hWMRPludetROPekEMZK9215NXmRrNC3RkW/p349Hh4MbMHQo97KhXaQ/LN6x
         mTQEHs+gRM8e0J6U4rdWthRLmXcKG0WRX2L38tIuSJrswD85CG2LlA4kePojCGEvHpXl
         GGB94yn3OgPfLzVjt/cwOw/8W6B9hIpwtckCk/AhxNBhvgZTtm0as5YdoUeouZdNPzjd
         E+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718787605; x=1719392405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CFvPZ2aXTKGNR3jFv01NFdo210/Fn9DAqqmmuyHPKh8=;
        b=DbnUd00EU2Dq6OItXgDUCl3loc8MWZQVM6PPwhkJhWByZX8QEaO7ltwms29xQpb9jv
         fFZ8PYxkm7+WJQU5ADeWRDXU02aoPEb7k8+Ti7peH2tb+1ah7XbETYkJypS5vjLuaS07
         LlybTeQAsqZIMQMWO6w0w7qx9gEkdJoiKRCalNwc9rRY1Ht706jH65BaIPb/jNINlcQj
         dkqOutXlnqe7qDJRlYghGKN65IUZLxYqBmj3CjDHfWgZAxRzfb0We29dumZDbv/zB9Kr
         u3f7dM3510apZZ7Gj4GO4IRr+GRqs4sGZIB54noFm4WpdLW5eg9ydEA8RBDt3K2YWAnr
         1j6w==
X-Gm-Message-State: AOJu0YyvcKqOjubH6OfEW9ZzbZLIHqHTyUr66alNjvQdWSWHuNdcDCwT
	93SynGAzIp0M8a1BZfW3l8Sh2/A0eSDjCbEOfQ4dEgRRjjI8PuDBeH04Cw==
X-Google-Smtp-Source: AGHT+IFwEdDRHRe7NgI5KjON72ftUZjl5vbOAozJf6FmNbt5gvax0r3HAqPjeyM4JHCoqtakijsX8A==
X-Received: by 2002:a5d:4535:0:b0:362:b09a:c4d3 with SMTP id ffacd0b85a97d-363171e2b36mr1409216f8f.14.1718787604947;
        Wed, 19 Jun 2024 02:00:04 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36076515a80sm16401876f8f.76.2024.06.19.02.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 02:00:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/15] psmisc: remove 0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch
Date: Wed, 19 Jun 2024 10:59:49 +0200
Message-Id: <20240619085957.2787700-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240619085957.2787700-1-alex.kanavin@gmail.com>
References: <20240619085957.2787700-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 09:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200892

From: Alexander Kanavin <alex@linutronix.de>

Somewhere on the way it ceased to be needed (checked on musl).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...se-UINTPTR_MAX-instead-of-__WORDSIZE.patch | 47 -------------------
 meta/recipes-extended/psmisc/psmisc_23.7.bb   |  1 -
 2 files changed, 48 deletions(-)
 delete mode 100644 meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch

diff --git a/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch b/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch
deleted file mode 100644
index 01335bdf405..00000000000
--- a/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 338d2d46d1c20ebadf317938af98d0532a62f8d4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 24 Mar 2016 15:46:14 +0000
-Subject: [PATCH] Use UINTPTR_MAX instead of __WORDSIZE
-
-Do not include sys/user.h since it conflicts with
-pt_regs struct from kernel APIs in asm/ptrace.h
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
----
- src/peekfd.c | 13 ++++++++-----
- 1 file changed, 8 insertions(+), 5 deletions(-)
-
-diff --git a/src/peekfd.c b/src/peekfd.c
-index 36dff04..2b4b1dc 100644
---- a/src/peekfd.c
-+++ b/src/peekfd.c
-@@ -30,8 +30,11 @@
- #include <asm/ptrace.h>
- #include <byteswap.h>
- #include <endian.h>
-+#ifdef __GLIBC__
- #include <sys/user.h>
-+#endif
- #include <stdlib.h>
-+#include <stdint.h>
- #include <getopt.h>
- #include <ctype.h>
- #include <dirent.h>
-@@ -341,11 +344,11 @@ int main(int argc, char **argv)
- 		if (WIFSTOPPED(status)) {
- #ifdef PPC
- 			struct pt_regs regs;
--			regs.gpr[0] = ptrace(PTRACE_PEEKUSER, pid, __WORDSIZE/8 * PT_R0, 0);
--			regs.gpr[3] = ptrace(PTRACE_PEEKUSER, pid, __WORDSIZE/8 * PT_R3, 0);
--			regs.gpr[4] = ptrace(PTRACE_PEEKUSER, pid, __WORDSIZE/8 * PT_R4, 0);
--			regs.gpr[5] = ptrace(PTRACE_PEEKUSER, pid, __WORDSIZE/8 * PT_R5, 0);
--			regs.orig_gpr3 = ptrace(PTRACE_PEEKUSER, pid, __WORDSIZE/8 * PT_ORIG_R3, 0);
-+			regs.gpr[0] = ptrace(PTRACE_PEEKUSER, pid, UINTPTR_MAX/8 * PT_R0, 0);
-+			regs.gpr[3] = ptrace(PTRACE_PEEKUSER, pid, UINTPTR_MAX/8 * PT_R3, 0);
-+			regs.gpr[4] = ptrace(PTRACE_PEEKUSER, pid, UINTPTR_MAX/8 * PT_R4, 0);
-+			regs.gpr[5] = ptrace(PTRACE_PEEKUSER, pid, UINTPTR_MAX/8 * PT_R5, 0);
-+			regs.orig_gpr3 = ptrace(PTRACE_PEEKUSER, pid, UINTPTR_MAX/8 * PT_ORIG_R3, 0);
- #elif defined(ARM)
- 			struct pt_regs regs;
- 			ptrace(PTRACE_GETREGS, pid, 0, &regs);
diff --git a/meta/recipes-extended/psmisc/psmisc_23.7.bb b/meta/recipes-extended/psmisc/psmisc_23.7.bb
index d96eaf5fe8a..4128ca05335 100644
--- a/meta/recipes-extended/psmisc/psmisc_23.7.bb
+++ b/meta/recipes-extended/psmisc/psmisc_23.7.bb
@@ -13,7 +13,6 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 SRC_URI = "git://gitlab.com/psmisc/psmisc.git;protocol=https;branch=master \
-           file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
            "
 SRCREV = "9091d6dbcce3d8fb87adf9249a2eb346d25a562c"
 S = "${WORKDIR}/git"
-- 
2.39.2



Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.3288.1623379481373723051
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jun 2021 19:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PYs4CHZv;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id l1so1298472pgm.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Jun 2021 19:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RACUfFVb4clL6cFXuYO6Ktgzid+EIsmdjn+0PEqv/AE=;
        b=PYs4CHZvmHT3sFP/ttAxNzanzPJxSeYa+jIRudEFnbjqqCK3uKHBKxsz57VGBW4UOZ
         2t4p77H+ztUNkierLX19VGlctAUDU2Kb3VogSuzPCUCoPWHnhBMg1bceo8qhNLMyPuwl
         RW1/abwIs8UlZBrnMvV1XxzcaBLoLFKCjUCrMjdM7dREaF1tZgJ7DMN19hl8xQD14eZl
         MWsxaGqBv7UxA0H80dDu2hOw2Sa4HISAgETZ0yenax0K2lyFormcaSKLUqJskIFl+sQW
         0kUcjMBLFp6PPcLAqlHFI6MR/b5HheUamTSzN0EzlT01Qdlogq1Pl0ORkxPKoANTi7jm
         ODZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RACUfFVb4clL6cFXuYO6Ktgzid+EIsmdjn+0PEqv/AE=;
        b=KXszDP/5zbQprUnpi27jQFi3Wap7L7tetu7Eocy2wjylZc1suGDyw9uZqZyHQmgEDQ
         5O0t7+JISl3wZ2PksvWcHHDowlPtS6EO4Z5/RfYyRUcSuECBQL194J9gK27cNw4UhbU/
         BcZxK65WUXDdPrjgGEK14uZWSFcsTttECkQIDr6J7HYIRs3dxNLEIVVW/6lx6sl4Wz4F
         4QHgHLL2FEgsh4uTcvOedQJ19o2Gk87qHegjMQwj3RUSvNU/rRos69cpCM5oIYtan9fW
         aRVXKqj7fMJmgLO2zydw+B0/n/wA1KzAlbfzZW9WTnpY9+l6nBkOdtia1AKmYYOE1W79
         UmFg==
X-Gm-Message-State: AOAM5336K7qZA0u/WUrl/gKbaNAapDdDHanXb65LqUiF/ipSQDGTrOm+
	3bjuCubtj9wi9nKfTt0t4Khcn3wXy7M54Q==
X-Google-Smtp-Source: ABdhPJznkUyiRSb0pxXTEU6CbBFM0gDYYt/Ibvuorlc5sYlpe8UGSYl7NhFnk1yFrJgpj1opQTaH/A==
X-Received: by 2002:a63:c00d:: with SMTP id h13mr1322944pgg.445.1623379480371;
        Thu, 10 Jun 2021 19:44:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id s13sm3943839pgi.36.2021.06.10.19.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 19:44:39 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] libssp-nonshared: Use a different implementation for __stack_chk_fail
Date: Thu, 10 Jun 2021 19:44:35 -0700
Message-Id: <20210611024436.2109932-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/libssp-nonshared.bb    | 11 ++---
 .../musl/libssp-nonshared/ssp-local.c         | 45 -------------------
 .../musl/libssp-nonshared/stack_chk.c         | 40 +++++++++++++++++
 3 files changed, 46 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-core/musl/libssp-nonshared/ssp-local.c
 create mode 100644 meta/recipes-core/musl/libssp-nonshared/stack_chk.c

diff --git a/meta/recipes-core/musl/libssp-nonshared.bb b/meta/recipes-core/musl/libssp-nonshared.bb
index bae8c81cc7..81c87e8e8d 100644
--- a/meta/recipes-core/musl/libssp-nonshared.bb
+++ b/meta/recipes-core/musl/libssp-nonshared.bb
@@ -2,11 +2,12 @@
 # Released under the MIT license (see COPYING.MIT for the terms)
 
 SUMMARY = "Minimal libssp_nonshared.a must needed for ssp to work with gcc on musl"
-LICENSE = "GPL-3.0-with-GCC-exception"
-LIC_FILES_CHKSUM = "file://ssp-local.c;beginline=1;endline=32;md5=c06d391208c0cfcbc541a6728ed65cc4"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://stack_chk.c;beginline=1;endline=30;md5=97e59d9deee678a9332c9ddb2ab6360d"
 SECTION = "libs"
 
-SRC_URI = "file://ssp-local.c"
+# Sourced from https://github.com/intel/linux-sgx/blob/master/sdk/compiler-rt/stack_chk.c
+SRC_URI = "file://stack_chk.c"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
@@ -19,8 +20,8 @@ do_configure[noexec] = "1"
 S = "${WORKDIR}"
 
 do_compile() {
-	${CC} ${CPPFLAGS} ${CFLAGS} -fPIE -c ssp-local.c -o ssp-local.o
-	${AR} r libssp_nonshared.a ssp-local.o
+	${CC} ${CPPFLAGS} ${CFLAGS} -fPIE -c stack_chk.c -o stack_chk.o
+	${AR} r libssp_nonshared.a stack_chk.o
 }
 do_install() {
 	install -Dm 0644 ${B}/libssp_nonshared.a ${D}${base_libdir}/libssp_nonshared.a
diff --git a/meta/recipes-core/musl/libssp-nonshared/ssp-local.c b/meta/recipes-core/musl/libssp-nonshared/ssp-local.c
deleted file mode 100644
index 8f51afa2c1..0000000000
--- a/meta/recipes-core/musl/libssp-nonshared/ssp-local.c
+++ /dev/null
@@ -1,45 +0,0 @@
-/* Stack protector support.
-   Copyright (C) 2005-2018 Free Software Foundation, Inc.
-
-This file is part of GCC.
-
-GCC is free software; you can redistribute it and/or modify it under
-the terms of the GNU General Public License as published by the Free
-Software Foundation; either version 3, or (at your option) any later
-version.
-
-In addition to the permissions in the GNU General Public License, the
-Free Software Foundation gives you unlimited permission to link the
-compiled version of this file into combinations with other programs,
-and to distribute those combinations without any restriction coming
-from the use of this file.  (The General Public License restrictions
-do apply in other respects; for example, they cover modification of
-the file, and distribution when not linked into a combine
-executable.)
-
-GCC is distributed in the hope that it will be useful, but WITHOUT ANY
-WARRANTY; without even the implied warranty of MERCHANTABILITY or
-FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-for more details.
-
-Under Section 7 of GPL version 3, you are granted additional
-permissions described in the GCC Runtime Library Exception, version
-3.1, as published by the Free Software Foundation.
-
-You should have received a copy of the GNU General Public License and
-a copy of the GCC Runtime Library Exception along with this program;
-see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
-<http://www.gnu.org/licenses/>.  */
-
-extern void __stack_chk_fail (void);
-
-/* Some targets can avoid loading a GP for calls to hidden functions.
-   Using this entry point may avoid the load of a GP entirely for the
-   function, making the overall code smaller.  */
-
-void
-__attribute__((visibility ("hidden")))
-__stack_chk_fail_local (void)
-{
-  __stack_chk_fail ();
-}
diff --git a/meta/recipes-core/musl/libssp-nonshared/stack_chk.c b/meta/recipes-core/musl/libssp-nonshared/stack_chk.c
new file mode 100644
index 0000000000..097aae24b6
--- /dev/null
+++ b/meta/recipes-core/musl/libssp-nonshared/stack_chk.c
@@ -0,0 +1,40 @@
+/*
+ * Copyright (C) 2011-2021 Intel Corporation. All rights reserved.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ *   * Redistributions of source code must retain the above copyright
+ *     notice, this list of conditions and the following disclaimer.
+ *   * Redistributions in binary form must reproduce the above copyright
+ *     notice, this list of conditions and the following disclaimer in
+ *     the documentation and/or other materials provided with the
+ *     distribution.
+ *   * Neither the name of Intel Corporation nor the names of its
+ *     contributors may be used to endorse or promote products derived
+ *     from this software without specific prior written permission.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ *
+ */
+
+extern void __attribute__((noreturn)) __stack_chk_fail(void);
+
+void
+__attribute__((noreturn))
+__attribute__((visibility ("hidden")))
+__stack_chk_fail_local (void)
+{
+    __stack_chk_fail ();
+}
-- 
2.32.0


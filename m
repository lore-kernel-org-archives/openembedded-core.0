Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D10C5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 03:20:48 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.4637.1709004047271011647
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 19:20:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MyMfGiGP;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1dc0d11d1b7so30288735ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 19:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709004046; x=1709608846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hEYaU0pCEoRHDeHGbqkgZtgyL62J9WHSAATww3RlB4U=;
        b=MyMfGiGPHoVGt9Tc2FIcd2m7QERgqYR2G2K9s1EemtUmTsH9EmQuwUNTCUQ9/IKnX5
         K68DkJZbBBGxQz9/SBZnoMYsq6WDtJWkjJBt58AxW3O9Gz01DA8LrVegAx1Dr3hepmz7
         ukQafbZkYozLtqifGCVs81aNVXpzY0gj71Sty7j2Faer5zmwK8ygo/us2csE58wzDW/O
         xWysBwJ+MS8AAHMost74WCMiw8g+1lQvW10syPhKpWGK8TAG2HbK+Tx/STYuKV0/4duW
         Amji4F42EXS1ejccT8jAc0I4U7+fTusQ9xx7XMyJreTNoTp68eZzMV4fXTDtpBEqrhC1
         2buQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709004046; x=1709608846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hEYaU0pCEoRHDeHGbqkgZtgyL62J9WHSAATww3RlB4U=;
        b=YWzLxAztNH3wgbXjzH46znCkEvX9t37Wyb5xNUvVuORCcv1LJ9k6gEiIF39AU3etu9
         6iesq55pyBPzMm+ynz44jaLZxOpjsSdopoFJqWsCAcDgchx2bm3AMRQceQ8EPeuDYv6h
         FKGzg8UdqjiTYciPgPufONoqH7mcnbU0MYj4+03PZALi5V1TxADSpqhPvtegnikFgCxt
         i7WmS/R3GPyfD+YSgsWib7tG/YimT2vTgS1EVkq0whWqVmc56uJ/aFRQjEjWibmACcMD
         dTl6Xo1XPsbqWlksLxguiaYVBaCuOhxu2zu6rHqW3JkX0p+RMpyTbVEFP59XLIF2SiJk
         7RIA==
X-Gm-Message-State: AOJu0YyVIhkLdHY8oxyoERhwOM0D2mGJOhKZvPmD6GdBiRkEEZf5CM8D
	bAyZoDu4+4J1mET+0XSjCaRqKzIK4q0H+TSMM+hDvbqE9mVpff01lXAJfTmSGwc=
X-Google-Smtp-Source: AGHT+IEVrYxLXzhDHbATmwumcXEAGj6dbJW9U0YBDqGtWuq1RkJQ5gcLrrFJBSehcTRUsB5yaRpNyA==
X-Received: by 2002:a17:903:120c:b0:1dc:518e:45b7 with SMTP id l12-20020a170903120c00b001dc518e45b7mr7763402plh.49.1709004046139;
        Mon, 26 Feb 2024 19:20:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::48d7])
        by smtp.gmail.com with ESMTPSA id ja9-20020a170902efc900b001dbcf7f43c9sm393397plb.303.2024.02.26.19.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 19:20:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3-bcrypt: Fix build break on riscv32
Date: Mon, 26 Feb 2024 19:20:43 -0800
Message-ID: <20240227032043.3219477-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 03:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196241

bump pyo3 to 0.20.3, which brings the needed fixes for building for
architectures without 64bit atomics [1]

[1] https://github.com/pyca/bcrypt/pull/746

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-bcrypt-crates.inc          |  22 ++--
 ...-0.20.0-to-0.20.3-in-src-_bcrypt-746.patch | 111 ++++++++++++++++++
 .../python/python3-bcrypt_4.1.2.bb            |   1 +
 3 files changed, 124 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-bcrypt/0001-Bump-pyo3-from-0.20.0-to-0.20.3-in-src-_bcrypt-746.patch

diff --git a/meta/recipes-devtools/python/python3-bcrypt-crates.inc b/meta/recipes-devtools/python/python3-bcrypt-crates.inc
index 5db6d1e96ef..0e7479f0b57 100644
--- a/meta/recipes-devtools/python/python3-bcrypt-crates.inc
+++ b/meta/recipes-devtools/python/python3-bcrypt-crates.inc
@@ -27,12 +27,13 @@ SRC_URI += " \
     crate://crates.io/parking_lot/0.12.1 \
     crate://crates.io/parking_lot_core/0.9.9 \
     crate://crates.io/pbkdf2/0.12.2 \
+    crate://crates.io/portable-atomic/1.6.0 \
     crate://crates.io/proc-macro2/1.0.70 \
-    crate://crates.io/pyo3/0.20.0 \
-    crate://crates.io/pyo3-build-config/0.20.0 \
-    crate://crates.io/pyo3-ffi/0.20.0 \
-    crate://crates.io/pyo3-macros/0.20.0 \
-    crate://crates.io/pyo3-macros-backend/0.20.0 \
+    crate://crates.io/pyo3/0.20.3 \
+    crate://crates.io/pyo3-build-config/0.20.3 \
+    crate://crates.io/pyo3-ffi/0.20.3 \
+    crate://crates.io/pyo3-macros/0.20.3 \
+    crate://crates.io/pyo3-macros-backend/0.20.3 \
     crate://crates.io/quote/1.0.33 \
     crate://crates.io/redox_syscall/0.4.1 \
     crate://crates.io/scopeguard/1.2.0 \
@@ -82,12 +83,13 @@ SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa
 SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
 SRC_URI[parking_lot_core-0.9.9.sha256sum] = "4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e"
 SRC_URI[pbkdf2-0.12.2.sha256sum] = "f8ed6a7761f76e3b9f92dfb0a60a6a6477c61024b775147ff0973a02653abaf2"
+SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
 SRC_URI[proc-macro2-1.0.70.sha256sum] = "39278fbbf5fb4f646ce651690877f89d1c5811a3d4acb27700c1cb3cdb78fd3b"
-SRC_URI[pyo3-0.20.0.sha256sum] = "04e8453b658fe480c3e70c8ed4e3d3ec33eb74988bd186561b0cc66b85c3bc4b"
-SRC_URI[pyo3-build-config-0.20.0.sha256sum] = "a96fe70b176a89cff78f2fa7b3c930081e163d5379b4dcdf993e3ae29ca662e5"
-SRC_URI[pyo3-ffi-0.20.0.sha256sum] = "214929900fd25e6604661ed9cf349727c8920d47deff196c4e28165a6ef2a96b"
-SRC_URI[pyo3-macros-0.20.0.sha256sum] = "dac53072f717aa1bfa4db832b39de8c875b7c7af4f4a6fe93cdbf9264cf8383b"
-SRC_URI[pyo3-macros-backend-0.20.0.sha256sum] = "7774b5a8282bd4f25f803b1f0d945120be959a36c72e08e7cd031c792fdfd424"
+SRC_URI[pyo3-0.20.3.sha256sum] = "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d4bb8233"
+SRC_URI[pyo3-build-config-0.20.3.sha256sum] = "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
+SRC_URI[pyo3-ffi-0.20.3.sha256sum] = "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa"
+SRC_URI[pyo3-macros-0.20.3.sha256sum] = "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158"
+SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] = "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185"
 SRC_URI[quote-1.0.33.sha256sum] = "5267fca4496028628a95160fc423a33e8b2e6af8a5302579e322e4b520293cae"
 SRC_URI[redox_syscall-0.4.1.sha256sum] = "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
diff --git a/meta/recipes-devtools/python/python3-bcrypt/0001-Bump-pyo3-from-0.20.0-to-0.20.3-in-src-_bcrypt-746.patch b/meta/recipes-devtools/python/python3-bcrypt/0001-Bump-pyo3-from-0.20.0-to-0.20.3-in-src-_bcrypt-746.patch
new file mode 100644
index 00000000000..3f671fcc981
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-bcrypt/0001-Bump-pyo3-from-0.20.0-to-0.20.3-in-src-_bcrypt-746.patch
@@ -0,0 +1,111 @@
+From cfdd98b3215cc12e66190a9c7f0a32c052e3c2e7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 26 Feb 2024 18:26:30 -0800
+Subject: [PATCH] Bump pyo3 from 0.20.0 to 0.20.3 in /src/_bcrypt (#746)
+
+It fixes build on hosts without 64bit atomics
+
+Upstream-Status: Backport [https://github.com/pyca/bcrypt/commit/c2ef9350798ab59b18e8a0e04a01389858578fe0]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/_bcrypt/Cargo.lock | 22 ++++++++++++++--------
+ src/_bcrypt/Cargo.toml |  2 +-
+ 2 files changed, 15 insertions(+), 9 deletions(-)
+
+--- a/src/_bcrypt/Cargo.lock
++++ b/src/_bcrypt/Cargo.lock
+@@ -233,6 +233,12 @@ dependencies = [
+ ]
+ 
+ [[package]]
++name = "portable-atomic"
++version = "1.6.0"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
++
++[[package]]
+ name = "proc-macro2"
+ version = "1.0.70"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+@@ -243,15 +249,16 @@ dependencies = [
+ 
+ [[package]]
+ name = "pyo3"
+-version = "0.20.0"
++version = "0.20.3"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "04e8453b658fe480c3e70c8ed4e3d3ec33eb74988bd186561b0cc66b85c3bc4b"
++checksum = "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d4bb8233"
+ dependencies = [
+  "cfg-if",
+  "indoc",
+  "libc",
+  "memoffset",
+  "parking_lot",
++ "portable-atomic",
+  "pyo3-build-config",
+  "pyo3-ffi",
+  "pyo3-macros",
+@@ -260,9 +267,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "pyo3-build-config"
+-version = "0.20.0"
++version = "0.20.3"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "a96fe70b176a89cff78f2fa7b3c930081e163d5379b4dcdf993e3ae29ca662e5"
++checksum = "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
+ dependencies = [
+  "once_cell",
+  "target-lexicon",
+@@ -270,9 +277,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "pyo3-ffi"
+-version = "0.20.0"
++version = "0.20.3"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "214929900fd25e6604661ed9cf349727c8920d47deff196c4e28165a6ef2a96b"
++checksum = "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa"
+ dependencies = [
+  "libc",
+  "pyo3-build-config",
+@@ -280,9 +287,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "pyo3-macros"
+-version = "0.20.0"
++version = "0.20.3"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "dac53072f717aa1bfa4db832b39de8c875b7c7af4f4a6fe93cdbf9264cf8383b"
++checksum = "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158"
+ dependencies = [
+  "proc-macro2",
+  "pyo3-macros-backend",
+@@ -292,12 +299,13 @@ dependencies = [
+ 
+ [[package]]
+ name = "pyo3-macros-backend"
+-version = "0.20.0"
++version = "0.20.3"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "7774b5a8282bd4f25f803b1f0d945120be959a36c72e08e7cd031c792fdfd424"
++checksum = "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185"
+ dependencies = [
+  "heck",
+  "proc-macro2",
++ "pyo3-build-config",
+  "quote",
+  "syn",
+ ]
+--- a/src/_bcrypt/Cargo.toml
++++ b/src/_bcrypt/Cargo.toml
+@@ -6,7 +6,7 @@ edition = "2018"
+ publish = false
+ 
+ [dependencies]
+-pyo3 = { version = "0.20.0", features = ["abi3"] }
++pyo3 = { version = "0.20.3", features = ["abi3"] }
+ bcrypt = "0.15"
+ bcrypt-pbkdf = "0.10.0"
+ base64 = "0.21.5"
diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb b/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
index 8328594bad6..93fa645f330 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
@@ -11,6 +11,7 @@ SRC_URI[sha256sum] = "33313a1200a3ae90b75587ceac502b048b840fc69e7f7a0905b5f87fac
 inherit pypi python_setuptools3_rust ptest-cargo cargo-update-recipe-crates
 
 SRC_URI += " \
+	file://0001-Bump-pyo3-from-0.20.0-to-0.20.3-in-src-_bcrypt-746.patch \
 	file://run-ptest \
 "
 
-- 
2.44.0



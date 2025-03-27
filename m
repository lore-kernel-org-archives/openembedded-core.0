Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB2B9C36011
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 16:32:47 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.842.1743093164351040633
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 09:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NQ54f8KY;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22423adf751so24768585ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 09:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743093163; x=1743697963; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v/b38vq99PbV8lorEpoPMkuw516BzDX8fXbX0GmEeL8=;
        b=NQ54f8KYYRGMIKsGuH1r2kwqy+6ZvPK6Q5Ni92+XpU3yFlZxAtVif6ouZvHumkxUxM
         XV9h5ldPpSZaxOI/xkwuBloUAKrDv6/2/3ougyWLqQtH01RNz69wA8961Uxv17tlf+/6
         y7PqjFbZdOkxJWmc1VIgEJxvv0ZUdN9/+6/sDzsuwZljvNTUdJmw6+/HyE+cUzcntoNO
         30vGlNQ5J2J9c03ZrwoF7ry2ySxFMVkVVsfYdi6c0uoZEr3GGmPpqkd7HL+88jbdCxMf
         ZNco9fYI+tp+9p1YWMoYMOXfDCVNBkqif+KNoJrKrjdhQAkqL9EFaSdJfrINh11vM7oy
         29Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743093163; x=1743697963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v/b38vq99PbV8lorEpoPMkuw516BzDX8fXbX0GmEeL8=;
        b=ueHWlUjEcrDtWI9yiuwVD5dnFzRNADkGJXzmqinEp7uEzC0pnzPJHs4CaHNxF4GFxn
         B2w2Qo7p7fGXzamjd0eQejS3RBDEkW4nOra1L7CkuDtdA711xlAaFH4c+hXtStk9HVtR
         OeQNqFuvc9TJtRO1HGkB6Sj4xy+OQ06FOx36LiOmr41pvgGdF6GvO2fdcvyDcF6WwVtT
         ugBEvrhOTtX05Kr5NIr/56CnT79i43c2dpxPCC2Ctu4CzLjpTpD4tv9+TR1TPqB5IRCL
         v07oCaFtAyQB2o4uLv5PNP7mVC3aRjTObLXERPrY8rlMp3hWioHP/yUqlPNUROfQcB+m
         kOmg==
X-Gm-Message-State: AOJu0Yy5WQfL8scaT82XzUZOn0OvbfseunfdPv5HCYmhxikka4QgrYg7
	I3USa8wzzrNCX3FE+M0+nKBNtcpK5CQR/iidWgDJpijvCuNAiNp0hRKQ++yw
X-Gm-Gg: ASbGncuhuabw2AN1EAy+mfmCknEsmxd72BKVA+2XcGPqNY1GVPpkMkk7rPhVrez/CG5
	qcY3QZtiUcMeJFvW43k9ESzUYbY7d6YcHQykz+gCFHnWz0tRt5NoNn2KcWgxZDqcBEF9eyorMNE
	GJPtJ3c9N59mdBnCRGDqUB4o6r05YQRTZEvnf1TIW8aazUtpK1eaRHW3D4+hkVnX9zV4++oMO+D
	HMUsTCnYie1chJB+CNTWVcOZNzuE/F8SLNDiuUZFxU0nb3dFVbRRBGHdhEvY/NpcOuKRAhaBew4
	aW03DBMi6c1PPDN3H0EW2Yqp14V+wArjZAwU
X-Google-Smtp-Source: AGHT+IHrJo1iGHv4clbNRXz43G9TfbWYzCjbWkmPqN/43NIoKJCltLSfCRsYsG8mNKcnNfcXc1bVHw==
X-Received: by 2002:a05:6a20:4499:b0:1f5:6abb:7cbb with SMTP id adf61e73a8af0-1fea2e9f467mr7653881637.23.1743093163242;
        Thu, 27 Mar 2025 09:32:43 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f147])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b67f48fsm92953a12.9.2025.03.27.09.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 09:32:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] fmt: Backport patch to fix spdlog ABI issue
Date: Thu, 27 Mar 2025 09:32:37 -0700
Message-ID: <20250327163238.442756-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 16:32:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213764

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-Workaround-an-ABI-issue-in-spdlog.patch | 35 +++++++++++++++++++
 meta/recipes-devtools/fmt/fmt_11.1.4.bb       |  3 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.patch

diff --git a/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.patch b/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.patch
new file mode 100644
index 00000000000..3fe85d51ee4
--- /dev/null
+++ b/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.patch
@@ -0,0 +1,35 @@
+From 5a5637c306c617ddb3726c76d3f7490a2dc0a5cd Mon Sep 17 00:00:00 2001
+From: Victor Zverovich <viz@meta.com>
+Date: Sat, 22 Mar 2025 06:57:04 -0700
+Subject: [PATCH] Workaround an ABI issue in spdlog
+
+Upstream-Status: Backport [https://github.com/fmtlib/fmt/commit/784eac839df77df1852dc1c50b17b76c3aec8f4a]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/fmt/format.h | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/include/fmt/format.h b/include/fmt/format.h
+index 287e7163..61cb2825 100644
+--- a/include/fmt/format.h
++++ b/include/fmt/format.h
+@@ -774,7 +774,9 @@ enum { inline_buffer_size = 500 };
+  * converted to `std::string` with `to_string(out)`.
+  */
+ template <typename T, size_t SIZE = inline_buffer_size,
+-          typename Allocator = detail::allocator<T>>
++          // DEPRECATED! std::allocator should be replaced with
++          // detail::allocator
++          typename Allocator = std::allocator<T>>
+ class basic_memory_buffer : public detail::buffer<T> {
+  private:
+   T store_[SIZE];
+@@ -2594,7 +2596,7 @@ class bigint {
+   }
+ 
+  public:
+-  FMT_CONSTEXPR bigint() : exp_(0) {}
++  FMT_CONSTEXPR20 bigint() : exp_(0) {}
+   explicit bigint(uint64_t n) { assign(n); }
+ 
+   bigint(const bigint&) = delete;
diff --git a/meta/recipes-devtools/fmt/fmt_11.1.4.bb b/meta/recipes-devtools/fmt/fmt_11.1.4.bb
index 7c860eb6087..1bcf758fd9a 100644
--- a/meta/recipes-devtools/fmt/fmt_11.1.4.bb
+++ b/meta/recipes-devtools/fmt/fmt_11.1.4.bb
@@ -4,7 +4,8 @@ HOMEPAGE = "https://fmt.dev"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b9257785fc4f3803a4b71b76c1412729"
 
-SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https"
+SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https \
+           file://0001-Workaround-an-ABI-issue-in-spdlog.patch"
 SRCREV = "123913715afeb8a437e6388b4473fcc4753e1c9a"
 
 S = "${WORKDIR}/git"


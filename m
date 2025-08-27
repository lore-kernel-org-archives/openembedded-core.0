Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E378CA0FFB
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:30:39 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.6611.1756330234131858181
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:30:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1Lj8QjWD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-771e4378263so300684b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330233; x=1756935033; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RgxT5WlEMBGpdaOJJZF7VhP7y+Jv5n64WS4j1y9zrEo=;
        b=1Lj8QjWDmntGa2lj2yk5fHtcYytUu5p4Y0WqJvhPaQbeZgqgAusg6z5hBQrG6Jzlz7
         M/KW6d4Q88NTCkycCR3urYBNV351EyqTKjctKmxZwINjfajRSjWB9KTNTQKhyebCa6nx
         9PhtU5BhEo9vMCs6qvWr8jblHmN9Ab305URMjtSBTwGveMV998Fudsrre1sQ+4jh+ed9
         kuQf3FlLDlTWKSrEdmCc3h5KsGnsilXTHm6AGxgBgIDLg1LR0IDs4vnAuomteE4JLjkN
         kBFU4Le7hToXB4i1bxPB+ppHljomKyQwf+bfbo1/6CjAp6PEheFQgikwTuvA6zHbZhWA
         Gmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330233; x=1756935033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RgxT5WlEMBGpdaOJJZF7VhP7y+Jv5n64WS4j1y9zrEo=;
        b=BpvLPZBYSgSSyuRPOdBewi17CuDx3phFZ4Bm9N0aLXslUvdY2cimsIZhOBXvj+VtjA
         1+HN8KanOn7VaqlHEUw+651DKIZxek1wpOXa/wIitqxSUrscN5RlqI9q54dgcK9vPMpo
         wX6Kjc7HdERbfNHMinF75fkiPZlepwkd4uKP0UZgTdCtyvILQKIcFFwMhnFPsOVrvhHp
         PdpJz3R5pXSvj0okB/ZD0+90AVEyFPkhiptW5MZ4Tjo3MDCquHTzlYjctae04CGHwcJU
         I1+B7k3ybpzUPAQJ4dVkFjHOMMOblxdedWblNhDMFpXRU/OVsTnvrPv4hg+drw6GFh8P
         wjdw==
X-Gm-Message-State: AOJu0YxKkJEcWKqFHbNC6IBJhZaeLICCsA/lfCz3KJBUX8swnwFCF+nr
	G2s4+QHKMEkM8DYb8yZMO2h8z230ipXdmYNpDwvqpZBhAIvpWWdzizYG/+trUy1L6LmN6y/iWoA
	FhfS4
X-Gm-Gg: ASbGncukAJajdGfaFj9RjJXaNeHaRBnJEfr3BbzxS3pBdJ8iypyVfXc1TmLi5mf2A3t
	awH9s3p44tTLAyaSFilsJLmnk6yu4MQKEcoHwB+UoSzEJ/vCjphyRKOVmmIYBFACa2+0AC9cQVm
	7fjaK+EHQ10yZ8Iu78Ba5S7sVqSc9j/8UkDZFZ+qMzxB+8LB98ZAGuN6HxbwDWgf9WA+Xh46UAf
	+Ey3tWpfpfIHSLRYRssGwzsLovzrLhvDhu7QorkPX0mWsJg3z4wbSPACFVhtlO5Y45o3RaRxJTu
	+xDlwgretyDolOiUFP3BfInaD1Kh95tkT4wOFEje+Mk3Vq7iYgsWiWXEhA5HkoE2DT3rtJyjTm4
	987ykio0S8294WA==
X-Google-Smtp-Source: AGHT+IGlyAXp+krr3FucwXKMsgDw8P6WSYGChfp6OYSSmZfjiCKTysAZHGMiuwGhWlWupp4LgUGxNA==
X-Received: by 2002:a05:6a20:a728:b0:243:a17b:6414 with SMTP id adf61e73a8af0-243a17b69a0mr3801253637.26.1756330233370;
        Wed, 27 Aug 2025 14:30:33 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.30.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:30:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 23/33] libgpg-error: fix build with gcc-15
Date: Wed, 27 Aug 2025 14:29:30 -0700
Message-ID: <cef0a6c3245a2556614f7e009c2e00e1eb16e08e.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222531

From: Martin Jansa <martin.jansa@gmail.com>

Backport a fix for native build with gcc-15 on host

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...oid-use-of-nullptr-for-an-identifier.patch | 52 +++++++++++++++++++
 .../libgpg-error/libgpg-error_1.48.bb         |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0001-Avoid-use-of-nullptr-for-an-identifier.patch

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0001-Avoid-use-of-nullptr-for-an-identifier.patch b/meta/recipes-support/libgpg-error/libgpg-error/0001-Avoid-use-of-nullptr-for-an-identifier.patch
new file mode 100644
index 0000000000..11ab7a2a4e
--- /dev/null
+++ b/meta/recipes-support/libgpg-error/libgpg-error/0001-Avoid-use-of-nullptr-for-an-identifier.patch
@@ -0,0 +1,52 @@
+From d14c69a7f256a9444c5c64b808d8767e5a8ba68e Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Wed, 23 Oct 2024 08:48:06 +0900
+Subject: [PATCH] Avoid use of 'nullptr' for an identifier.
+
+* tests/t-printf.c (check_fprintf_sf): Use 'null_ptr'
+as an identifier.
+
+--
+
+GnuPG-bug-id: 7344
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+
+Upstream-Status: Backport [libgpg-error-1.51 d14c69a7f256a9444c5c64b808d8767e5a8ba68e]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ tests/t-printf.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tests/t-printf.c b/tests/t-printf.c
+index c1ad0b0..87c201d 100644
+--- a/tests/t-printf.c
++++ b/tests/t-printf.c
+@@ -449,7 +449,7 @@ string_filter (const char *string, int no, void *opaque)
+ static void
+ check_fprintf_sf (void)
+ {
+-  volatile char *nullptr = NULL; /* Avoid compiler warning.  */
++  volatile char *null_ptr = NULL; /* Avoid compiler warning.  */
+   struct sfstate_s sfstate = {NULL};
+   gpgrt_stream_t stream;
+   const char *expect;
+@@ -461,8 +461,8 @@ check_fprintf_sf (void)
+ 
+   gpgrt_fprintf_sf (stream, string_filter, &sfstate,
+                     "%s a=%d b=%s c=%d d=%.8s null=%s\n",
+-                    nullptr, 1, "foo\x01 bar", 2,
+-                    "a longer string", nullptr);
++                    null_ptr, 1, "foo\x01 bar", 2,
++                    "a longer string", null_ptr);
+   expect = "[==>Niente<==] a=1 b=foo\x01 bar c=2 d=a longer null=(null)\n";
+   result = stream_to_string (stream);
+   if (strcmp (result, expect))
+@@ -475,7 +475,7 @@ check_fprintf_sf (void)
+ 
+   gpgrt_fprintf_sf (stream, string_filter, &sfstate,
+                     "a=%d b=%s c=%d d=%.8s e=%s\n",
+-                    1, "foo\n bar", 2, nullptr, "");
++                    1, "foo\n bar", 2, null_ptr, "");
+   expect = "a=1 b=foo\n bar c=2 d=[==>Nien e=\n";
+   result = stream_to_string (stream);
+   if (strcmp (result, expect))
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb
index 9f2b49209d..2106f3de85 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb
@@ -17,6 +17,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
            file://0001-Do-not-fail-when-testing-config-scripts.patch \
+           file://0001-Avoid-use-of-nullptr-for-an-identifier.patch \
            file://run-ptest \
            "
 
-- 
2.43.0



Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D385BC678D9
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:52:02 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.147209.1673808717675495114
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:51:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UtcM6spN;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id k18so4206818pll.5
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 10:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vViIPr9Wfz1GDkzyMAdQEpaAVwTP6pOBz6mq8OFAW3U=;
        b=UtcM6spNmIIhC2ZuRFIEQPsIARqdcQhIN+9yJ2nTSL3XpfuI0jHzQgYw4Y9Kp6rhQp
         vfTLSmRc5KbjX4Z71Tcu4u1nfVcpxnYKmG5ZuJjQarR19L3l+GLQxFBhEa14QGUBqrL7
         bferCcAXysLVF5ag0OOu5p0HILw6HQstfFct4rvkd/x3OdK5CLWCMuGR2e0i5hWGFmDU
         PtPxtEGa2AiI1wwVhrXXSUBsUlFahD1MAv1iv6l1WlM3AFGFLzTQGx4XIS+/OpXFzHf/
         ql0WgvMit/mlDypiybJLq6yqkVHWOhN1Ml0m7QdAqLJRnmqzumvGTxQINAmHmuEBkWwF
         X8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vViIPr9Wfz1GDkzyMAdQEpaAVwTP6pOBz6mq8OFAW3U=;
        b=utVg+W10HkSuL6SxaAiyUXa8rVvJGZCu0NzrJBEwp0NeFjPIW/zK4nGXuMKnLP7Iq4
         ejjY0BVu+jrEtmJchd2jkPAl4BF5t7v19HQB6TJhKxcRJ2Diu+lK04n68TPg95F3apij
         R7ofGUDXs38hDLHmLYVydhjvS0LtS4/r2L24XcmbLfCgKoXxxWJe6Lo8mjciSLETs5dl
         7Lkjpi+A67LxYsFZ0XCOfXV/dzBgvBs6fYEypHrXrNb6+kfXs4HwwCCDV32FWfoUmiL3
         B10wykmBnzHrmGw/bZi+ROxKYqBatvk10mHWt6CzSK0cIbIreFx+6xd1BtzippeIpn9L
         br/g==
X-Gm-Message-State: AFqh2krz9vhv1ULEbzatqF+cwbTJOFCnfh0tRJ7Q95PALuBL04bPGuUE
	BCcL23iAkJ2E3Xw99KI1/1E96XIW9fV/5A==
X-Google-Smtp-Source: AMrXdXviWlFYlOikABnvn3nuqSG27Xt3tOjE720V1U7oq0QKGJ5iZ516pvrkebLpQ2Vbr04PkgABEA==
X-Received: by 2002:a17:902:bb8f:b0:194:620c:9216 with SMTP id m15-20020a170902bb8f00b00194620c9216mr14285190pls.21.1673808716790;
        Sun, 15 Jan 2023 10:51:56 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c20600b0019468fe44d3sm5417127pll.25.2023.01.15.10.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 10:51:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/6] glib-2.0: Switch to using C11 std
Date: Sun, 15 Jan 2023 10:51:49 -0800
Message-Id: <20230115185153.2277534-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230115185153.2277534-1-raj.khem@gmail.com>
References: <20230115185153.2277534-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175951

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-Switch-from-C99-to-C11-standard.patch | 40 +++++++++++++++++
 ...efine-check_alignof-for-std-c11-and-.patch | 44 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.74.4.bb |  2 +
 3 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-C99-to-C11-standard.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-tests-macros.c-Define-check_alignof-for-std-c11-and-.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-C99-to-C11-standard.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-C99-to-C11-standard.patch
new file mode 100644
index 0000000000..4ddf49a9df
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-C99-to-C11-standard.patch
@@ -0,0 +1,40 @@
+From 59f4bdaedccb14802810e2f28646cc039a92f3d3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 14 Jan 2023 12:15:29 -0800
+Subject: [PATCH] Switch from C99 to C11 standard
+
+We need to start using _Alignof consistently as the fallback
+implementation which uses types within offsetof is UB as per WG14 N2350
+[1], moreover newer compilers like clang 16+ have started to error on
+such use.
+
+Fixes errors like below with clang 16+
+
+| ../glib-2.74.4/glib/ghash.c:299:18: error: 'struct (unnamed at ../glib-2.74.4/glib/ghash.c:299:1)' cannot be defined in '__builtin_offsetof'
+| G_STATIC_ASSERT (G_ALIGNOF (GHashTableIter) >= G_ALIGNOF (RealIter));
+
+[1] https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm
+[2] https://reviews.llvm.org/D133574
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3202]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 8d3500ad7..87662fa47 100644
+--- a/meson.build
++++ b/meson.build
+@@ -5,7 +5,7 @@ project('glib', 'c',
+   default_options : [
+     'buildtype=debugoptimized',
+     'warning_level=3',
+-    'c_std=gnu99'
++    'c_std=gnu11'
+   ]
+ )
+ 
+-- 
+2.39.0
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-tests-macros.c-Define-check_alignof-for-std-c11-and-.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-tests-macros.c-Define-check_alignof-for-std-c11-and-.patch
new file mode 100644
index 0000000000..c6f2ee1948
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-tests-macros.c-Define-check_alignof-for-std-c11-and-.patch
@@ -0,0 +1,44 @@
+From 3a86bfadd67983267e5d89b1a7e3a637041e599b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 14 Jan 2023 10:54:28 -0800
+Subject: [PATCH] tests/macros.c: Define check_alignof for std=c11 and newer
+
+WG14 N2350 made very clear that it is an UB having type definitions
+within "offsetof" [1]. This patch changes the implementation of macro
+check_alignof to builtin "_Alignof" to avoid undefined behavior.
+
+clang 16+ has started to diagnose this [2]
+
+Fixes build when using -std >= gnu11 and using clang16+
+
+[1] https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm
+[2] https://reviews.llvm.org/D133574
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3201]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ glib/tests/macros.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/glib/tests/macros.c b/glib/tests/macros.c
+index efe632b..17b1646 100644
+--- a/glib/tests/macros.c
++++ b/glib/tests/macros.c
+@@ -42,9 +42,13 @@ test_assert_static (void)
+ static void
+ test_alignof_fallback (void)
+ {
++#if defined(__STDC_VERSION__) && __STDC_VERSION__ >= 201112L && !defined(__cplusplus)
++#define check_alignof(type) \
++  g_assert_cmpint (G_ALIGNOF (type), ==, _Alignof (type))
++#else
+ #define check_alignof(type) \
+   g_assert_cmpint (G_ALIGNOF (type), ==, G_STRUCT_OFFSET (struct { char a; type b; }, b))
+-
++#endif
+   check_alignof (char);
+   check_alignof (int);
+   check_alignof (float);
+-- 
+2.39.0
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.74.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.74.4.bb
index e5279e946c..de3f55e865 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.74.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.74.4.bb
@@ -19,6 +19,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://cpp-null.patch \
            file://cpp-null2.patch \
            file://fix-errno.patch \
+           file://0001-tests-macros.c-Define-check_alignof-for-std-c11-and-.patch \
+           file://0001-Switch-from-C99-to-C11-standard.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-- 
2.39.0



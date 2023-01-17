Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D05C6379F
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 23:19:00 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.2255.1673997536761078161
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 15:18:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FC/Dikv7;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id e10so23204153pgc.9
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 15:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SeyTYKAju90T13CMCu3GIZ4bX2HzU7ilzl2u7eq+88E=;
        b=FC/Dikv7QtRd4B+TGV+G7GVuvIKZB0qW6pO012Hv2pTZe6ducxiMxQjxU01S4U5zvG
         6a/mvFd8OmJeuBrZ5uhGkEbbRuJu2i4kwrVmLxTg1bbG28EJRCPY2Q5kgXu0iHEcFNNk
         E6b2FyFqA0SOUUvBU3btqNmEa4YfSAqTz2FnfHdVymDyZqrrbmnfpijXr63oMEKnS4qZ
         MNSi439QHUivJXuCnLUqOxlqbjeqnMjRg4xUnCJbwwNsvj3CyQQDDxkcDd2iv71bb4K5
         oxRPH2VtJaAmzB6qTgC3EqkMiUsr+AoIZBfqfhrPv+6dLfLT7kHpO7roOH63zXyepTzU
         wdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SeyTYKAju90T13CMCu3GIZ4bX2HzU7ilzl2u7eq+88E=;
        b=bF6rkLadB4P05dmyWnsNpBgWyDDFynVV4xy7JOIK/yVDs4O/6iHx0mG0czbgacClnq
         GIUP+1OYJGlrtOXt/QH4SCA1YRDZdnpYQCFV6g6Jz8Te3SxJJsicR8NM3nlcz9j4sxZg
         S3coceiCpl5mNjPWU03C0vEoduQWRp6xrF70HHtAWNUogSh6rah10KxaAunl/l3zy0m/
         5qk0xa5KiffKgGJsa9a05g+BaMfCyToFUmS8gsQuqxWBtf9Zz8VrD6TWtIjwnbAn324g
         HMUaZLageSsB7kdZ7rWWvyWrWxnAWT7PHZrMDkBQS1mrvvH5dPiWz+ZnWCSmS0qe4tm/
         w4Hg==
X-Gm-Message-State: AFqh2kqHoagVYeo9OX42Ndd5/MdlIkLJGmHoyrviA/zMzysAZC/T7/tz
	UzvH1RuwYsF2/48r0iq4JoQnj0kWpMXxag==
X-Google-Smtp-Source: AMrXdXutnf2X766kASdv4GRTv/MDX8IgAZCZMTk7XgNpCIHFTIwfxX71oTMpyUI7GA39vDahTlCktw==
X-Received: by 2002:a05:6a00:1585:b0:578:8864:b25c with SMTP id u5-20020a056a00158500b005788864b25cmr6837553pfk.25.1673997535900;
        Tue, 17 Jan 2023 15:18:55 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id y15-20020aa7942f000000b0058d92d6e4ddsm5445717pfo.5.2023.01.17.15.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 15:18:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/4] python3-numpy: Define _ALIGN using _Alignof when using C11 or newer
Date: Tue, 17 Jan 2023 15:18:51 -0800
Message-Id: <20230117231853.1511529-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117231853.1511529-1-raj.khem@gmail.com>
References: <20230117231853.1511529-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 23:19:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176067

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ing-_Alignof-when-using-C11-or-newer.patch | 77 +++++++++++++++++++
 .../python/python3-numpy_1.24.1.bb            |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-numpy/0001-Define-_ALIGN-using-_Alignof-when-using-C11-or-newer.patch

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-Define-_ALIGN-using-_Alignof-when-using-C11-or-newer.patch b/meta/recipes-devtools/python/python3-numpy/0001-Define-_ALIGN-using-_Alignof-when-using-C11-or-newer.patch
new file mode 100644
index 0000000000..97391e2c12
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-numpy/0001-Define-_ALIGN-using-_Alignof-when-using-C11-or-newer.patch
@@ -0,0 +1,77 @@
+From f9ac08a0fea543d68b2dba540093bd079e50be47 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 15 Jan 2023 15:49:09 -0800
+Subject: [PATCH] Define _ALIGN using _Alignof when using C11 or newer
+
+WG14 N2350 made very clear that it is an UB having type definitions
+within "offsetof" [1]. This patch enhances the implementation of macro
+_ALIGN to use builtin "_Alignof" to avoid undefined behavior on
+when using std=c11 or newer
+
+clang 16+ has started to flag this [2]
+
+Fixes build when using -std >= gnu11 and using clang16+
+
+Older compilers gcc < 4.9 or clang < 8 has buggy _Alignof even though it
+may support C11, exclude those compilers too
+
+[1] https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm
+[2] https://reviews.llvm.org/D133574
+
+Upstream-Status: Submitted [https://github.com/numpy/numpy/pull/23016]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ numpy/core/src/multiarray/arraytypes.c.src | 13 +++++++++++--
+ numpy/core/src/multiarray/common.h         | 12 +++++++++++-
+ 2 files changed, 22 insertions(+), 3 deletions(-)
+
+diff --git a/numpy/core/src/multiarray/arraytypes.c.src b/numpy/core/src/multiarray/arraytypes.c.src
+index c03d09784..683917220 100644
+--- a/numpy/core/src/multiarray/arraytypes.c.src
++++ b/numpy/core/src/multiarray/arraytypes.c.src
+@@ -224,8 +224,17 @@ MyPyLong_AsUnsigned@Type@(PyObject *obj)
+  **                         GETITEM AND SETITEM                             **
+  *****************************************************************************
+  */
+-
+-#define _ALIGN(type) offsetof(struct {char c; type v;}, v)
++/* GCC releases before GCC 4.9 had a bug in _Alignof.  See GCC bug 52023
++   <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52023>.
++   clang versions < 8.0.0 have the same bug.  */
++#if (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112 \
++     || (defined __GNUC__ && __GNUC__ < 4 + (__GNUC_MINOR__ < 9) \
++  && !defined __clang__) \
++     || (defined __clang__ && __clang_major__ < 8))
++# define _ALIGN(type) offsetof(struct {char c; type v;}, v)
++#else
++# define _ALIGN(type) _Alignof(type)
++#endif
+ /*
+  * Disable harmless compiler warning "4116: unnamed type definition in
+  * parentheses" which is caused by the _ALIGN macro.
+diff --git a/numpy/core/src/multiarray/common.h b/numpy/core/src/multiarray/common.h
+index 3de8c842d..d01074c45 100644
+--- a/numpy/core/src/multiarray/common.h
++++ b/numpy/core/src/multiarray/common.h
+@@ -178,7 +178,17 @@ check_and_adjust_axis(int *axis, int ndim)
+ }
+ 
+ /* used for some alignment checks */
+-#define _ALIGN(type) offsetof(struct {char c; type v;}, v)
++/* GCC releases before GCC 4.9 had a bug in _Alignof.  See GCC bug 52023
++   <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52023>.
++   clang versions < 8.0.0 have the same bug.  */
++#if (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112 \
++     || (defined __GNUC__ && __GNUC__ < 4 + (__GNUC_MINOR__ < 9) \
++  && !defined __clang__) \
++     || (defined __clang__ && __clang_major__ < 8))
++# define _ALIGN(type) offsetof(struct {char c; type v;}, v)
++#else
++# define _ALIGN(type) _Alignof(type)
++#endif
+ #define _UINT_ALIGN(type) npy_uint_alignment(sizeof(type))
+ /*
+  * Disable harmless compiler warning "4116: unnamed type definition in
+-- 
+2.39.0
+
diff --git a/meta/recipes-devtools/python/python3-numpy_1.24.1.bb b/meta/recipes-devtools/python/python3-numpy_1.24.1.bb
index 83b8ac4232..adac08b3e1 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.24.1.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.24.1.bb
@@ -10,6 +10,7 @@ SRCNAME = "numpy"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://0001-numpy-core-Define-RISCV-32-support.patch \
+           file://0001-Define-_ALIGN-using-_Alignof-when-using-C11-or-newer.patch \
            file://run-ptest \
            "
 SRC_URI[sha256sum] = "2386da9a471cc00a1f47845e27d916d5ec5346ae9696e01a8a34760858fe9dd2"
-- 
2.39.0



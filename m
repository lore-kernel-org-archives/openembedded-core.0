Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A42CCCF9E3
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 19:03:43 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1105.1762801413860105895
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 11:03:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XlD6qUqQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3436cbb723fso1968747a91.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 11:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762801413; x=1763406213; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uFjqsnBHF7cimD9lZMx1XtPm08QAMmmF5Od9LJrGztg=;
        b=XlD6qUqQ13CQsZpvmUH33TcvxmQH7DSKD5OCyJv73UlTHRLwiozfpyh2Ai3HFzWxBd
         4IumpgXIehjumww+85CdKIbGMbPh6gqF9PDrufSYRo8YEMiGsl8D6dKNvVvk3rdQug1s
         5cTgpPLKwOL7XRSRTcDASmYWMGcNRIhvtAm4t+FylnwPL5HcdXIxRwxafINx6Mv4Cy1G
         w0ItIuO2WiQOwAw6taB99MHwWKCUubABKKR834foAFLZ/qarKvE7IsxaS5MJmzV4giZW
         VDuMEHZTP+3B0rpNcGBHBGV99Y1o7CE+/mmvnODW1jKfziq2y4T7FsVWUMjat1WwaYmg
         EaXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762801413; x=1763406213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFjqsnBHF7cimD9lZMx1XtPm08QAMmmF5Od9LJrGztg=;
        b=TxCjzeFXTOasFKky1V+DH5Wo08PEE90/TE+NUzqwh7mQkLYnbDGYafj5CS7G6waz99
         y87CtdYk0fwriOufU/h7mG31ptDiIFDDqDzNh4uNChBPCxsbOqq6CFe3YPzuJIIemjFo
         oPuyxSS4l4P7P42bpY6/U96Ze+R9ZXYBCGVNl2Rz1DFsbfq8zUOfTeKXXg0pNfkD/d8c
         qt6ctm+LiW48a0QnkBtLtwj+jkH4K6/SXwWbuotmt+vfe4EOLLmztGVH1p20lduRezqL
         jHuYHGygHiJLTFEkY55TmUwNWRMFKMUA3EduHabVW5UbgrHjTTakh2UoN1Ox8nug+Q+t
         XLCQ==
X-Gm-Message-State: AOJu0YzqkJeQAxNQp3RW4Hi4a3HZrTmk1JNshhNRVAbkm/wxf4l74cuE
	retlqxX4jE7wph5CuxWMEvd6w0HJIRLtMeuNdcZQcwb9Gt68kL24fGItfDp7syEupMU=
X-Gm-Gg: ASbGncvdNVaTLAYPpdVFFD/eHInPmERKBYZr7Kusx0zGyz9A8FSXpnB5CD2L+dqp4dO
	meB+2hV6B5ODCn4cn5Er+RiMkL0Mv5abrjrzV7WZnbafbbE+oWbZxEk8ZOXA9lQUsM1T5hmpZPI
	JQbg65ZQYyRwBsL/253RDqa4syJgT0hhrOCW3jrHB5SAceMbqWQAuldPC8YgXNzZvh9phO+kPXN
	ieFVgiDI3uvEB9S0de4sfbTVFXp/QT5b4iIaSk9j+khnjRCBJ0BalnmWWpPT3NHLv3uzyxniFEd
	3wwZvTLr4FGYaTmkXJpEZ7Vwg3YRe3ZhpYrks+1ZdMUBnpQlODKEC7I+PlxhF4FBHmEBjPfsAkW
	4OkSXAXc359hLvfE5ag5MNmKe0UFjm+aI1FIuNdiJLawDx/VzXDia9Ye6QQRGZNYSW8euKuSPcs
	rXQby0xTfSIs5/fgPBv6R36ca8dBAaBF29JmedWgF6X7Kgarsip8glENl5vaA4UmuUdUTS5wNi
X-Google-Smtp-Source: AGHT+IEO/94AKO8DbzJcrKIpZQy9plMf/y+iR9WWx1CiXql+50nKfpDucyusPJs5XHyFfFP2oD9gfw==
X-Received: by 2002:a17:90b:3bcb:b0:340:b152:efe7 with SMTP id 98e67ed59e1d1-3436cb91d57mr10895659a91.11.1762801412940;
        Mon, 10 Nov 2025 11:03:32 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c300173sm11780325a91.4.2025.11.10.11.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:03:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] mesa: Fix build with C23 implementing once_flag
Date: Mon, 10 Nov 2025 11:03:30 -0800
Message-ID: <20251110190330.463836-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 19:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226136

This is needed to build with glibc 2.43+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use finally upstreamed patch as backport

 ...once_flag-ONCE_FLAG_INIT-when-presen.patch | 56 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch b/meta/recipes-graphics/mesa/files/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
new file mode 100644
index 00000000000..db8c90d5ffd
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
@@ -0,0 +1,56 @@
+From 179e744f7577d98df7c79d7324c22acfb32a0154 Mon Sep 17 00:00:00 2001
+From: Dave Airlie <airlied@redhat.com>
+Date: Fri, 7 Nov 2025 13:14:56 +1000
+Subject: [PATCH] c11/threads: fix build on c23
+
+C23/glibc is now including once_init in stdlib.h
+
+https://patchwork.sourceware.org/project/glibc/patch/78061085-f04a-0c45-107b-5a8a15521083@redhat.com/#213088
+
+Just fix up our use of it.
+
+Cc: mesa-stable
+Reviewed-by: Yonggang Luo <luoyonggang@gmail.com>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/38298>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/179e744f7577d98df7c79d7324c22acfb32a0154?merge_request_iid=38298]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/c11/impl/threads_posix.c | 3 ++-
+ src/c11/threads.h            | 2 ++
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/c11/impl/threads_posix.c b/src/c11/impl/threads_posix.c
+index 3b8692482bb..6db8c42f08c 100644
+--- a/src/c11/impl/threads_posix.c
++++ b/src/c11/impl/threads_posix.c
+@@ -46,12 +46,13 @@ impl_thrd_routine(void *p)
+
+ /*--------------- 7.25.2 Initialization functions ---------------*/
+ // 7.25.2.1
++#ifndef __once_flag_defined
+ void
+ call_once(once_flag *flag, void (*func)(void))
+ {
+     pthread_once(flag, func);
+ }
+-
++#endif
+
+ /*------------- 7.25.3 Condition variable functions -------------*/
+ // 7.25.3.1
+diff --git a/src/c11/threads.h b/src/c11/threads.h
+index dbcb3459a9b..c849f385e30 100644
+--- a/src/c11/threads.h
++++ b/src/c11/threads.h
+@@ -118,8 +118,10 @@ typedef pthread_cond_t  cnd_t;
+ typedef pthread_t       thrd_t;
+ typedef pthread_key_t   tss_t;
+ typedef pthread_mutex_t mtx_t;
++#ifndef __once_flag_defined
+ typedef pthread_once_t  once_flag;
+ #  define ONCE_FLAG_INIT PTHREAD_ONCE_INIT
++#endif
+ #  ifdef PTHREAD_DESTRUCTOR_ITERATIONS
+ #    define TSS_DTOR_ITERATIONS PTHREAD_DESTRUCTOR_ITERATIONS
+ #  else
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 6a36aea259f..4863a27949e 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,6 +17,7 @@ PE = "2"
 SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
+           file://0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch \
 "

 SRC_URI[sha256sum] = "bb6243e7a6f525febfa1e6ab50827ca4d4bfdad73812377b0ca9b6c50998b03e"


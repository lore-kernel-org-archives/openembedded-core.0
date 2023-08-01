Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F1BBC001E0
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 09:42:39 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.8885.1690882950735869054
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 02:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=F6DXnmsF;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fe2ba3e260so2041715e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 02:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690882949; x=1691487749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vl4tEU6PBBPbT2sJb5YSOXxH9HgidvnHk4+GOtQg8/k=;
        b=F6DXnmsFkSU3CsPDmT1yZkM5ELuG+jXF2fDa4Q9XVchwFr2Na2JXvl9F5wJukZzzIw
         znnDeWR3MVpCMSN3KbV6yxdspAcBN55Nj4nibvs22t6s8eZH3T1hD9r1OIpGUdoFvT1h
         8q3Ir+ZpMbmZsyx1mROTKxcNuNLS0C/FFNepfutaknqZsjvPEmGwcGmsiPJ4t8GdvCaa
         6VTJsgFXOyNPuB9xhnXfGRxra/Rv7VCeXw9t3z7Ar/WwMoFHQkj2mVlsm4rZX2mcQnrO
         +6tMxDIPS2b70mVrkbn2A5Fie40mPYxZ/hTKJTlztkXK6KMCMZcuRp9nPTqI3EHuf32T
         fAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690882949; x=1691487749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vl4tEU6PBBPbT2sJb5YSOXxH9HgidvnHk4+GOtQg8/k=;
        b=RNDoCIEZD1ZfJ1KsHw1oOdvBh4jPpzjPW9cXEEB/obWV9QmvF2HXXgQJ63EX60N6U4
         D9tDlQNQeH1AgZNIQBKy5M8EGL2YG8eLEh2DwM5O93UzU5KWmRPt5tHs3rNIk1mOihy9
         whpzRKiSClBuK2g+q4G8Bp0ynikyClO/lo0e73akNeqXU/TKKjR3SF3MB/O4SYNU5Piq
         R+by1mbHqGR53VJP19srN6JTJBgqnhspCtWt34KJAvffZpbld7RbVkyWkNSucS0On27t
         4ha7Czb4roEFzsGBbAyUohOLtCesvUbYBRnZ5ZLopuAfh+ccstaKuZhFX/pgCKR/zp8V
         edNQ==
X-Gm-Message-State: ABy/qLYOaOMpYqtK9D+6pwYnDkYyLwhEV5IrkVK9WqWaz9Z83tpqLQmC
	eACPhdqiYO1dA6sVaeg8wsbqgRfH3Pw=
X-Google-Smtp-Source: APBJJlFVN4YzaAMaSV7J04P7vYPUBYbzAY6KIWBRVQJB36etFNZSqI5VaYs8AAec9tzJS8pgYUyF7A==
X-Received: by 2002:a7b:c3d2:0:b0:3fa:934c:8356 with SMTP id t18-20020a7bc3d2000000b003fa934c8356mr1985419wmj.10.1690882948888;
        Tue, 01 Aug 2023 02:42:28 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id y17-20020a05600c20d100b003fba6709c68sm13554404wmm.47.2023.08.01.02.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 02:42:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] alsa-utils: backport a fix to build with glibc-2.38
Date: Tue,  1 Aug 2023 11:42:23 +0200
Message-ID: <20230801094223.459136-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 09:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185224

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...dd-define-to-compile-with-glibc-2.38.patch | 39 +++++++++++++++++++
 .../alsa/alsa-utils_1.2.9.bb                  |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-add-define-to-compile-with-glibc-2.38.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-add-define-to-compile-with-glibc-2.38.patch b/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-add-define-to-compile-with-glibc-2.38.patch
new file mode 100644
index 0000000000..8c23fb2cec
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-add-define-to-compile-with-glibc-2.38.patch
@@ -0,0 +1,39 @@
+From a610f4c21b083c0f9cf62ad2251dfadc98abb50e Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Sat, 22 Jul 2023 15:36:09 +0000
+Subject: [PATCH] alsactl: add define to compile with glibc 2.38
+
+strlcat and strlcpy have been added to glibc 2.38.
+update the defines to use the glibc versions, and not conflict with
+string.h.
+
+ref:
+- https://sourceware.org/git/?p=glibc.git;a=commit;h=454a20c8756c9c1d55419153255fc7692b3d2199
+
+Fixes: https://github.com/alsa-project/alsa-utils/pull/225
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+Upstream-Status: Backport [https://github.com/alsa-project/alsa-utils/commit/d6a71bfbde9e1710743d3a446c6ea3b41c45234e]
+---
+ alsactl/init_sysdeps.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/alsactl/init_sysdeps.c b/alsactl/init_sysdeps.c
+index 3aca1b4..f09b1ae 100644
+--- a/alsactl/init_sysdeps.c
++++ b/alsactl/init_sysdeps.c
+@@ -18,6 +18,7 @@
+  */
+ 
+ #if defined(__GLIBC__) && !(defined(__UCLIBC__) && defined(__USE_BSD))
++#if !(__GLIBC_PREREQ(2, 38))
+ static size_t strlcpy(char *dst, const char *src, size_t size)
+ {
+ 	size_t bytes = 0;
+@@ -60,4 +61,5 @@ static size_t strlcat(char *dst, const char *src, size_t size)
+ 	*q = '\0';
+ 	return bytes;
+ }
++#endif /* !(__GLIBC_PREREQ(2, 38)) */
+ #endif /* __GLIBC__ */
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb
index 2f344015a9..af28f5468f 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb
@@ -26,6 +26,7 @@ PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://0001-alsactl-fix-compilation-when-building-in-a-subdir.patch \
+           file://0001-alsactl-add-define-to-compile-with-glibc-2.38.patch \
           "
 SRC_URI[sha256sum] = "e7623d4525595f92e11ce25ee9a97f2040a14c6e4dcd027aa96e06cbce7817bd"
 
-- 
2.41.0



Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8ABDC677F1
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:52:02 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.147061.1673808721260438838
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:52:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Uy6X3Uxs;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id dw9so25706564pjb.5
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 10:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKj7wQ7kNuz1BHNi1sZGZVSIk4Mg6KHpbCG9mKMFrjs=;
        b=Uy6X3Uxsd3+hvoLj5SoeEXuM3VorKFm+2dJXEvrPtcdLWiM4VdnqOTalLyminfh3/+
         cqMNgLoynPsb+LZCKIwrVFP+0xOE7YRcJmsQaWfJEIUT8IA0uho0czqAf2DDViAN5MOz
         oZBkqutzJ0nP3982v/vrvyzTU+Sgl+y19JuhHHoY4MPUiilz1t+e6r/+qEBYTEqCyVCv
         tI/i9lUy05WhPhZcKf/W8OGNpcaZbRoNylcCnKJN0xoYrpc9lEnpzwJaAKIawwihRGAO
         8+z5IJRfB4Y4AN+CEtBkGR+KlUEZRTg+q6gLe7zWqgf4U7sZUTlv8s0X3EGJaHQuRr/x
         miXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKj7wQ7kNuz1BHNi1sZGZVSIk4Mg6KHpbCG9mKMFrjs=;
        b=f/U3LShu+Xee9FhPLaLtUS1+5AETxf6btXJH6J/0dFvhSp4xI8U/8oBoUFwtLqedtj
         VYZOtCQ5CKHWlC40a2pzPS0mgSxJ8SUH/sOwB/kp3Mr1sOL/nztNU6Y42M0Apd8dfTmp
         pUF4UR+NOi65oCydTNqPSThk0hnsKTGDfudqev8TSkkyEFRZ4CcsbbhFAz6rBnsSeGGG
         gLbMJ4KTxsfZhajjxXjAwV/6dLvCIxICQsFoOzJI/rn+6N6OZO0GT99aettFvArAsXDv
         XLpbB4OPMEqKzS19vyBqYM+iVf+kZHTjdW1YzMjfE4hND+osQTWSN7+Y7TU+55Jx0951
         or8A==
X-Gm-Message-State: AFqh2koSIPnfvTOE/N3yAa+HZ6EOxg/DP++NsNZfNI2YZSm75G4fHX3f
	0SCmUR1VdjbIEY0vohO+3wh9Z5EApNATUw==
X-Google-Smtp-Source: AMrXdXv0PheOpJDBUFlHB5jLfejxVZdQaIsu4NI6G2Jri1Yx6U4vUATcfNj0GwtjlpinBj18dWCwvA==
X-Received: by 2002:a17:902:7b8d:b0:193:25b6:71bc with SMTP id w13-20020a1709027b8d00b0019325b671bcmr26698037pll.25.1673808720445;
        Sun, 15 Jan 2023 10:52:00 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c20600b0019468fe44d3sm5417127pll.25.2023.01.15.10.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 10:51:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 6/6] cpio: Fix gnulib alignof implementation on clang
Date: Sun, 15 Jan 2023 10:51:53 -0800
Message-Id: <20230115185153.2277534-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230115185153.2277534-1-raj.khem@gmail.com>
References: <20230115185153.2277534-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175955

Backport needed patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Use-__alignof__-with-clang.patch     | 42 +++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.13.bb       |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.13/0001-Use-__alignof__-with-clang.patch

diff --git a/meta/recipes-extended/cpio/cpio-2.13/0001-Use-__alignof__-with-clang.patch b/meta/recipes-extended/cpio/cpio-2.13/0001-Use-__alignof__-with-clang.patch
new file mode 100644
index 0000000000..d637e70395
--- /dev/null
+++ b/meta/recipes-extended/cpio/cpio-2.13/0001-Use-__alignof__-with-clang.patch
@@ -0,0 +1,42 @@
+From 6e169bb5fadb73b4dd300b28e9cae1e1772855e8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 15 Jan 2023 02:05:23 -0800
+Subject: [PATCH] Use __alignof__ with clang.
+
+For clang versions < 8, use the same
+workaround as for GCC versions < 4.9.
+
+Backport couple of gnulib patches squashed
+
+[1] https://git.savannah.gnu.org/cgit/gnulib.git/commit/lib/stdalign.in.h?id=57caf9541d98314102a55dd1cd0b8dc2be747471
+[2] https://git.savannah.gnu.org/cgit/gnulib.git/commit/lib/stdalign.in.h?id=2af490a4c4ce85567296e27be6a9528964ca851e
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/gnulib.git/commit/lib/stdalign.in.h?id=57caf9541d98314102a55dd1cd0b8dc2be747471]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gnu/stdalign.in.h | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/gnu/stdalign.in.h b/gnu/stdalign.in.h
+index 5f56eee..e6e6a65 100644
+--- a/gnu/stdalign.in.h
++++ b/gnu/stdalign.in.h
+@@ -53,9 +53,12 @@
+ #undef _Alignof
+ 
+ /* GCC releases before GCC 4.9 had a bug in _Alignof.  See GCC bug 52023
+-   <http://gcc.gnu.org/bugzilla/show_bug.cgi?id=52023>.  */
++   <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52023>.
++   clang versions < 8.0.0 have the same bug.  */
+ #if (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112 \
+-     || (defined __GNUC__ && __GNUC__ < 4 + (__GNUC_MINOR__ < 9)))
++     || (defined __GNUC__ && __GNUC__ < 4 + (__GNUC_MINOR__ < 9) \
++         && !defined __clang__) \
++     || (defined __clang__ && __clang_major__ < 8))
+ # ifdef __cplusplus
+ #  if 201103 <= __cplusplus
+ #   define _Alignof(type) alignof (type)
+-- 
+2.39.0
+
diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-extended/cpio/cpio_2.13.bb
index 50d3e14c14..eb3dc138a9 100644
--- a/meta/recipes-extended/cpio/cpio_2.13.bb
+++ b/meta/recipes-extended/cpio/cpio_2.13.bb
@@ -11,6 +11,7 @@ SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
            file://0002-src-global.c-Remove-superfluous-declaration-of-progr.patch \
            file://0001-obstack-Fix-a-clang-warning.patch \
            file://CVE-2021-38185.patch \
+           file://0001-Use-__alignof__-with-clang.patch \
            "
 
 SRC_URI[md5sum] = "389c5452d667c23b5eceb206f5000810"
-- 
2.39.0



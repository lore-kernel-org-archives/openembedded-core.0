Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31046C04E69
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:05:07 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web10.21371.1691683502472258944
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=1H+dc3z6;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.177, mailfrom: steve@sakoman.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-34978cc9e53so3819855ab.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683501; x=1692288301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5COIofR7gxZ5MTla787BCKwx1WEqf1kWBQaynSBpxPg=;
        b=1H+dc3z6Uc8XV6jXDOyLno/aMknpF4KdICR9HZRuS5h7sqAxR7LrDpz7QAXGMg766M
         +tnFiPzCpa3wDEC+sZeA/oPI9gxifPMbcE8Z1eb7G1op4OApgh9jqR/QxEJX4cphodjU
         2AZFIQeloG7FtPJ/3jDiYTo0GUiNVXgEK0oPg+w13e6XQRRhGkFsdDe3GCkubV7ZXxpn
         M2HJ/5SJQvbXFDXbMnrmBMR2PyWWEcAqoqLKJGK061shtBpXdDRo9zPqcyTY+2XrP4w5
         AJ15lKV4oIz6fBSkbjLzmvL5cfVBuHiqlmeF+A/1dZwQf52GhMaCKLbH6A9UY4Q/HQKL
         w2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683501; x=1692288301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5COIofR7gxZ5MTla787BCKwx1WEqf1kWBQaynSBpxPg=;
        b=M/u54sa1div4QYtTdRDBbL0+BpYRfcef/owAWr6j9DVkIgoswU5/CvEI6ePQutfvfW
         bHFS4b9ZG/j8gCIM83uWy9wey8NH0arzTnDB2UNwzeNaHQl8rJYYfvL785p1tjzLo2Ay
         RYVQ8gMkj6xS2EoInq/AG5gHJ2HayUPZkNxH4zdgz9PDGYgGzwAkSmdtoBx6P/drs0Od
         UplBkBxwhtsjPRTAz7RKgIfNRQs9wYEEHzo+VGxSD+dr2j9qpKDv3KtIrojz8AATrL8a
         8WwC3vKEfnp+aNAccaLmXShbkapZnokeK4bF5KYCcNPsRzNU8kd6fIYM2sq2hZvTY6Hp
         pkCQ==
X-Gm-Message-State: AOJu0Yxji/Yy7ctA/CXObRBb6c19/PYAx81zOMyUuf0WDEFs32stMVlT
	CekstRzU63Bfhw7aL5EdceqB/et7cNsgxvP1Mp4=
X-Google-Smtp-Source: AGHT+IGi5WKW6hQr5pj2lzY7YMrzmKAlbF0HmakWRY7ag4Ksabe6pQOVLvY0AFIrR7B3owtV2teIWA==
X-Received: by 2002:a05:6e02:1083:b0:349:9778:d9f7 with SMTP id r3-20020a056e02108300b003499778d9f7mr975802ilj.16.1691683501145;
        Thu, 10 Aug 2023 09:05:01 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.05.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:05:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 08/37] opkg: upgrade 0.6.1 -> 0.6.2
Date: Thu, 10 Aug 2023 06:04:07 -1000
Message-Id: <5bdfde3fd4266d637019b59d55a33438cb36903f.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:05:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185770

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch
removed since they're included in 0.6.2.

Changelog:
===========
### Changed
- the project's developer documentation to be more correct and current.

### Fixed
- a bug in the 'opkg-keys' utility script which caused the script to ignore settings in the '/etc/opkg/gpg/gpg.conf' file.
- a compilation error in 'md5.c' when using clang16+ and '-std >= gnu11'.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit d7c8a58297e38f6222035aa9135fedf2ca387742)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...sing-_Alignof-when-using-C11-or-newe.patch | 51 -------------------
 ...emove-no-options-flag-from-gpg-calls.patch | 34 -------------
 .../opkg/{opkg_0.6.1.bb => opkg_0.6.2.bb}     |  6 +--
 3 files changed, 2 insertions(+), 89 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch
 rename meta/recipes-devtools/opkg/{opkg_0.6.1.bb => opkg_0.6.2.bb} (92%)

diff --git a/meta/recipes-devtools/opkg/opkg/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch b/meta/recipes-devtools/opkg/opkg/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
deleted file mode 100644
index 3406878a1d..0000000000
--- a/meta/recipes-devtools/opkg/opkg/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 4089affd371e6d62dd8c1e57b344f8cc329005ea Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 14 Jan 2023 23:11:08 -0800
-Subject: [PATCH] Define alignof using _Alignof when using C11 or newer
-
-WG14 N2350 made very clear that it is an UB having type definitions
-within "offsetof" [1]. This patch enhances the implementation of macro
-alignof_slot to use builtin "_Alignof" to avoid undefined behavior on
-when using std=c11 or newer
-
-clang 16+ has started to flag this [2]
-
-Fixes build when using -std >= gnu11 and using clang16+
-
-Older compilers gcc < 4.9 or clang < 8 has buggy _Alignof even though it
-may support C11, exclude those compilers too
-
-[1] https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm
-[2] https://reviews.llvm.org/D133574
-
-Upstream-Status: Submitted [https://groups.google.com/g/opkg-devel/c/gjcQPZgT_jI]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libopkg/md5.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/libopkg/md5.c b/libopkg/md5.c
-index 981b9b8..ccb645e 100644
---- a/libopkg/md5.c
-+++ b/libopkg/md5.c
-@@ -237,7 +237,17 @@ void md5_process_bytes(const void *buffer, size_t len, struct md5_ctx *ctx)
-     /* Process available complete blocks.  */
-     if (len >= 64) {
- #if !_STRING_ARCH_unaligned
-+/* GCC releases before GCC 4.9 had a bug in _Alignof.  See GCC bug 52023
-+   <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52023>.
-+   clang versions < 8.0.0 have the same bug.  */
-+#if (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112 \
-+     || (defined __GNUC__ && __GNUC__ < 4 + (__GNUC_MINOR__ < 9) \
-+         && !defined __clang__) \
-+     || (defined __clang__ && __clang_major__ < 8))
- #define alignof(type) offsetof (struct { char c; type x; }, x)
-+#else
-+#define alignof(type) _Alignof(type)
-+#endif
- #define UNALIGNED_P(p) (((size_t) p) % alignof (uint32_t) != 0)
-         if (UNALIGNED_P(buffer))
-             while (len > 64) {
--- 
-2.39.0
-
diff --git a/meta/recipes-devtools/opkg/opkg/0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch b/meta/recipes-devtools/opkg/opkg/0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch
deleted file mode 100644
index f216950002..0000000000
--- a/meta/recipes-devtools/opkg/opkg/0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From a658e6402382250f0164c5b47b744740e04f3611 Mon Sep 17 00:00:00 2001
-From: Charlie Johnston <charlie.johnston@ni.com>
-Date: Fri, 30 Dec 2022 15:21:14 -0600
-Subject: [PATCH] opkg-key: Remove --no-options flag from gpg calls.
-
-The opkg-key script was always passing the --no-options
-flag to gpg, which uses /dev/null as the options file.
-As a result, the opkg gpg.conf file was not getting
-used. This change removes that flag so that gpg.conf
-in the GPGHOMEDIR for opkg (currently /etc/opkg/gpg/)
-will be used if present.
-
-Upstream-Status: Accepted [https://git.yoctoproject.org/opkg/commit/?id=cee294e72d257417b5e55ef7a76a0fd15313e46b]
-Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
----
- utils/opkg-key | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/utils/opkg-key b/utils/opkg-key
-index e395a59..8645ebc 100755
---- a/utils/opkg-key
-+++ b/utils/opkg-key
-@@ -53,7 +53,7 @@ else
-     exit 1
- fi
- 
--GPG="$GPGCMD --no-options --homedir $GPGHOMEDIR"
-+GPG="$GPGCMD --homedir $GPGHOMEDIR"
- 
- # Gpg home dir isn't created automatically when --homedir option is used
- if [ ! -e "$GPGHOMEDIR" ]; then
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/opkg/opkg_0.6.1.bb b/meta/recipes-devtools/opkg/opkg_0.6.2.bb
similarity index 92%
rename from meta/recipes-devtools/opkg/opkg_0.6.1.bb
rename to meta/recipes-devtools/opkg/opkg_0.6.2.bb
index 4c25fe963a..46be137354 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.1.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.2.bb
@@ -15,12 +15,10 @@ PE = "1"
 SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
-           file://0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch \
-           file://0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
            file://run-ptest \
-"
+           "
 
-SRC_URI[sha256sum] = "e87fccb575c64d3ac0559444016a2795f12125986a0da896bab97c4a1a2f1b2a"
+SRC_URI[sha256sum] = "ac73a90a2549cd04948e563d915912c78e1b8ba0f43af75c5a53fcca474adbd5"
 
 # This needs to be before ptest inherit, otherwise all ptest files end packaged
 # in libopkg package if OPKGLIBDIR == libdir, because default
-- 
2.34.1



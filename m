Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web11.6495.1595369412771913597
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2020 15:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=miRGg97g;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id z5so115384pgb.6
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2020 15:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pncaz8iZ2bpB4d3X8A/RYTOmPrVjs8EFP9/ruywTGpQ=;
        b=miRGg97g0imMBIBIdz6iqqWg0b+FJPrbyiPyxiAnw7/tUmvo3tW6uxeWUAxzsLb3gE
         KSSEntb7Ahti1Vn4ySArNqmsegXqlg9BiHqyUsmIBU+60CQKtTpshrCswGeFzkzZmc8c
         FmuLzUYxqJsqQVyeNYUX76WwlthocsMLgtYAXX2JN9Zqc4txB1JnUgb7zeTu2hKzsJer
         blfzFBPVkTrq/6e4f9yqzpyA6cuJz0ggHHQ3AJ7ssZ6OVpV2ltA1r+j4LZN1/08n5oji
         SZzDWoR2VdW/omKwi/ELToEYlFrCG44WdnNapyfLJXSwwGSC/nGsmbA+NlFDzHoTKYCH
         DsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pncaz8iZ2bpB4d3X8A/RYTOmPrVjs8EFP9/ruywTGpQ=;
        b=ngU33OXzWwb+r0kHnqv3pXqGXqFRiKHJH9IAfIR8r1BAiFsWebY48cYGn3qI0ExFQA
         KX0bOzOeah1o8ipNEGAPS2mNmtnJg9wbmjnU9upxImtavVZT37BNgcCTLXigBIDA8aV3
         9hOJf9skMw7A2A3UhGhtmkqnX/mH5j0flj+wCcMk5jKObKn4TZ16lvRN6DIbAXKZuR8U
         qyJN92pG/JcIHUuXRb51/NvOZvTsUKBMZzAyiiNprjJCSaYPCjef4NeNJ5fZ7B2Wv36U
         Mba4NDQoOV3hgbRAUgbiDYf5sqZYMJTzrMxo4LBqd9sy4C+afkawpCFVpLP10CdK9105
         WkAQ==
X-Gm-Message-State: AOAM531UVuE5PFzRpnTYwDJmWwaLvcUkG5nNAd1XIWJnhxSyrKbqgs+2
	gr1Vn246FBBelEQ2byxsdVo+5CHv7Tc=
X-Google-Smtp-Source: ABdhPJz4BidRT0m/05842hGhJwr7yLaFEUf80mNFAk19j/qDGILt/XH/z9+utAZCmQL8arlLWgQSUw==
X-Received: by 2002:a63:125f:: with SMTP id 31mr25200413pgs.239.1595369411848;
        Tue, 21 Jul 2020 15:10:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6651])
        by smtp.gmail.com with ESMTPSA id c14sm21479106pfj.82.2020.07.21.15.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 15:10:11 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] site: Make sys_siglist default to no
Date: Tue, 21 Jul 2020 15:10:09 -0700
Message-Id: <20200721221009.2570384-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

glibc 2.32 has deprecated sys_siglist [1]

since no is default for musl as well, therefore elevate it to common
site file for all

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=b1ccfc061feee9ce616444ded8e1cd5acf9fa97f

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/site/common       | 7 +++++++
 meta/site/common-glibc | 3 ---
 meta/site/common-musl  | 5 -----
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta/site/common b/meta/site/common
index ff552329bd..62907274d7 100644
--- a/meta/site/common
+++ b/meta/site/common
@@ -19,3 +19,10 @@ shadow_cv_passwd_dir=${bindir}
 ac_cv_buggy_getaddrinfo=no
 
 ac_cv_path_SED=${ac_cv_path_SED=sed}
+
+# General
+ac_cv_have_decl_sys_siglist=${ac_cv_have_decl_sys_siglist=no}
+
+# bash
+bash_cv_under_sys_siglist=${bash_cv_under_sys_siglist=no}
+bash_cv_sys_siglist=${bash_cv_sys_siglist=no}
diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index a0680bc44c..0a665658fb 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -1,5 +1,4 @@
 # general
-ac_cv_have_decl_sys_siglist=${ac_cv_have_decl_sys_siglist=yes}
 ac_cv_func_calloc_0_nonnull=${ac_cv_func_calloc_0_nonnull=yes}
 ac_cv_func_realloc_works=${ac_cv_func_realloc_works=yes}
 ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
@@ -18,8 +17,6 @@ ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
 ac_cv_func_strtod=${ac_cv_func_strtod=yes}
 
 # bash
-bash_cv_under_sys_siglist=${bash_cv_under_sys_siglist=yes}
-bash_cv_sys_siglist=${bash_cv_sys_siglist=yes}
 bash_cv_getcwd_malloc=${bash_cv_getcwd_malloc=yes}
 
 # clamav
diff --git a/meta/site/common-musl b/meta/site/common-musl
index 4be8d002d6..44a7a1aea9 100644
--- a/meta/site/common-musl
+++ b/meta/site/common-musl
@@ -1,5 +1,4 @@
 # general
-ac_cv_have_decl_sys_siglist=${ac_cv_have_decl_sys_siglist=no}
 ac_cv_func_calloc_0_nonnull=${ac_cv_func_calloc_0_nonnull=yes}
 ac_cv_func_realloc_works=${ac_cv_func_realloc_works=yes}
 ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
@@ -29,10 +28,6 @@ glib_cv_have_qsort_r=${glib_cv_have_qsort_r=no}
 #dbus-glib
 ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
 
-# bash
-bash_cv_under_sys_siglist=${bash_cv_under_sys_siglist=no}
-bash_cv_sys_siglist=${bash_cv_sys_siglist=no}
-
 # coreutils
 fu_cv_sys_stat_statfs2_bsize=${fu_cv_sys_stat_statfs2_bsize=yes}
 gl_cv_func_getcwd_abort_bug=${gl_cv_func_getcwd_abort_bug=no}
-- 
2.27.0


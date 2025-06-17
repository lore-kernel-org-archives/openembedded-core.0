Return-Path: <victor.kamensky7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7EB3C71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 05:26:38 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.11495.1750137995091516811
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 22:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nNyJ0cNA;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: victor.kamensky7@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-235d6de331fso64075785ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 22:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750137994; x=1750742794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NRGss+cny7I0oI+O3AfsSlQL9oRSpTzWSMKHfJbk7ro=;
        b=nNyJ0cNAmA6EAE8WRwGYlUhiVcKHLbW3Wem93zCAl7/ML6r7X64t0xoD+CGHWb0EfJ
         BRxPG86joJ7YNXobjUi/88BXMo1qgrApRdFPv/GiEHLP28gq4xrrznnEL4ROLIkuNmVM
         20q0FoeqF1RbTTmhqdDH3pVEZs738zwOqqpzz0vbFRF5vZs+a9Hw4evsLwB25yHiB3va
         1XswCLLu+07EncA52bjVrLpuidyezw89eEja+KNWGEWdlQU0attqddRT7D28/5bcNb8l
         5rT3Ro/x2xDl8ho0opMPm9/HHu7IgrYvIODPzh3dGDtNaliuWQLWH7R0EGzsNOJiBifE
         AJXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750137994; x=1750742794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NRGss+cny7I0oI+O3AfsSlQL9oRSpTzWSMKHfJbk7ro=;
        b=mzGLYGS31xXw4ivF2IU8zFJ0KNN9eKi0omFi6Amf3fNiRCh37VPNWPmhYfDOTB96mX
         Bur30byeb6+gPzsVoIkX6vRqcAvWlpbZny0VkYNm4f6lSaLpT30hUOP4Fh+NCNwQsook
         76zp/8EjJQOszqd+RUBbRgwodgJDpgKRVGj2MVzsGrs31cPTtUiIwLtTz9pCKYjn2ePQ
         XX7zQ7ln+eeQxAfTUornKxw/tHlrj6DGnRRSSYiVK/2v5ki6BZwXqSDPAwIehwNpXXt7
         6qEc9lTVPVsFg3sOQ/w5Mmwndhpj4V+y+Zg9EGL9dbYyztaYZVF8+/GgsI5eG82qb0G7
         QXOg==
X-Gm-Message-State: AOJu0YyvV4OWEwnhap5EESLIY4seqB8mhb+c+Z15vlmkDozApDkp/4dm
	SXRXrtBdwyDjwTdnNTviOPtR/La2EQxmD/QOkLBjAuwloHf+Mr+HTYwBvEguzg==
X-Gm-Gg: ASbGncuYxrDYGmhrYLtVdSxMg1Dei3dz2tPu0KdrtEAkT/cM69VBuNQx1SPvkxZUvVN
	ohyawW6jK+bABcDfNlJrEYs7EHeNeNJyP6R5hXCUwipxqOglR3lBAUJYFAy21amMsEhSD9gIuP8
	cDTi+GKSgzmiqDAb8/6qaW/rsJ+lkxf6g70LZfYOGuQRpCKHLxEzrx6e4mnLMLBs3GJyzzmZG8i
	y1KmohBC425rdDgET2+mmyuthKwLtdpQU27g7KXQlmGT75egcFErBRQRLM90IOHHXp2UaRFh0sf
	zNoPJ50KMG2CzDmH0/cZ+BjiWsqD5ofDw7Pm8LXgQG2A9CDFaVa1kDjeRrEPwq6wNuLeCb4=
X-Google-Smtp-Source: AGHT+IFndV0/pvLmAzwFfK0EsKqgtPkEaWZcjxu6GzJBmwvnXX6P9UjcGCpve0UyOm/xzsd2QXMrFg==
X-Received: by 2002:a17:903:18f:b0:235:eb8b:9968 with SMTP id d9443c01a7336-2366b149d13mr183562295ad.36.1750137993814;
        Mon, 16 Jun 2025 22:26:33 -0700 (PDT)
Received: from kamensky-p15s.cisco.com ([2601:646:9d86:8270::6b7b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a19b0sm71125555ad.61.2025.06.16.22.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 22:26:33 -0700 (PDT)
From: Victor Kamensky <victor.kamensky7@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ross Burton <ross.burton@arm.com>,
	Victor Kamensky <victor.kamensky7@gmail.com>
Subject: [PATCH 1/3] systemtap: upgrade 5.2 -> 5.3
Date: Mon, 16 Jun 2025 22:25:38 -0700
Message-Id: <20250617052540.8256-1-victor.kamensky7@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 05:26:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218851

* fixed patch fuzz issue

Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
---
 ...mtap-native_5.2.bb => systemtap-native_5.3.bb} |  0
 ...-improve-reproducibility-for-c-compiling.patch | 15 ++++++---------
 .../{systemtap_5.2.bb => systemtap_5.3.bb}        |  0
 meta/recipes-kernel/systemtap/systemtap_git.inc   |  2 +-
 4 files changed, 7 insertions(+), 10 deletions(-)
 rename meta/recipes-kernel/systemtap/{systemtap-native_5.2.bb => systemtap-native_5.3.bb} (100%)
 rename meta/recipes-kernel/systemtap/{systemtap_5.2.bb => systemtap_5.3.bb} (100%)

diff --git a/meta/recipes-kernel/systemtap/systemtap-native_5.2.bb b/meta/recipes-kernel/systemtap/systemtap-native_5.3.bb
similarity index 100%
rename from meta/recipes-kernel/systemtap/systemtap-native_5.2.bb
rename to meta/recipes-kernel/systemtap/systemtap-native_5.3.bb
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-improve-reproducibility-for-c-compiling.patch b/meta/recipes-kernel/systemtap/systemtap/0001-improve-reproducibility-for-c-compiling.patch
index 15a6f2a9a5..7d35f76b29 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-improve-reproducibility-for-c-compiling.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-improve-reproducibility-for-c-compiling.patch
@@ -13,19 +13,16 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  stringtable.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/stringtable.h b/stringtable.h
-index 5fc42e7..6fd8a1e 100644
---- a/stringtable.h
-+++ b/stringtable.h
-@@ -19,7 +19,7 @@
+Index: git/stringtable.h
+===================================================================
+--- git.orig/stringtable.h
++++ git/stringtable.h
+@@ -23,7 +23,7 @@
  
- #if defined(HAVE_BOOST_UTILITY_STRING_REF_HPP)
+ #if 0 && defined(HAVE_BOOST_UTILITY_STRING_REF_HPP)
  #include <boost/version.hpp>
 -#include <boost/utility/string_ref.hpp> //header with string_ref
 +#include "@RELATIVE_STAGING_INCDIR@/boost/utility/string_ref.hpp" //header with string_ref
  
  // XXX: experimental tunables
  #define INTERNED_STRING_FIND_MEMMEM 1 /* perf stat indicates a very slight benefit */
--- 
-2.7.4
-
diff --git a/meta/recipes-kernel/systemtap/systemtap_5.2.bb b/meta/recipes-kernel/systemtap/systemtap_5.3.bb
similarity index 100%
rename from meta/recipes-kernel/systemtap/systemtap_5.2.bb
rename to meta/recipes-kernel/systemtap/systemtap_5.3.bb
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index a6688f2604..ed806d2cdb 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -7,7 +7,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git;protocol=https;branch=master \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
            "
 
-SRCREV = "3a92ffe673c1621309a0b60892114495b651c9de"
+SRCREV = "c4fc655170b534478a6b131292b987630c7c0865"
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips|riscv64).*-linux'
 COMPATIBLE_HOST:libc-musl = 'null'
-- 
2.45.0



Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D7AC678D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 23:18:34 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.61267.1674170305940217990
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 15:18:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O3IHND4S;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id 127so2730299pfe.4
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 15:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHxcvOGC/5Si+B0bZxsJO+OA7o4ESzO0drLnXoPks1w=;
        b=O3IHND4Syp93So6w6PEjVwgQm2tZPto0h+YzPPPBrQwuDNvHgA21ITM84XIUXsXCs9
         wYySSvyv5Y7n51us+Sy1UmxwcewMS8E+HxcL/SiAlr4jPIybZ3kwgd7hR1JUidH5rhYV
         3le8v2hJyAk1ueD5LOhsjfgLzKjCNXHSfvFPre7IUlyIZ6V3Gd21oYXUxTLYtaqI8py1
         zxyHTVAnbYV9ITVdi5fk/J5h7/hmmGrsf4ye5j7q8rsoUYJa7X3oXrDmIfl7lesKpEis
         9akWvkUPqyCgBaiiYsO/4bNT4Tki09kCSY9QKRbv8dQgqa2KgjP4cHCt8ccigIAMwYLW
         ZhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lHxcvOGC/5Si+B0bZxsJO+OA7o4ESzO0drLnXoPks1w=;
        b=E3JGL1TeBr+SKmHjZ7FE1rkL7ZqwCJJjo41Wl0d0GlDdAeQ7KY4BDpt1Z5f4MAobQg
         xcIdi/vsZZGOCVz6+GojSfhiZivWeVjx7qq730P4OzvQshHL2G429ZaOsykn+PszZhpl
         ZiN+p+Q6ySSxRQgEloBFfIfJdN3CNWql16i11m/+Ucr045XR98RY02Km6HQez3ikDxNB
         F7dpSq69GulsOYphyORShVX3/pKIvazLiGGvyyzggQM7FYX+cyxlu/bhTfUE+Px7PPKr
         9YamYkJGIxVfOcyZU4oFQ6ilcFv4W3SziwXyAAW8DqOSPBozWWLxIdhqQw/1ti8MZ4qH
         l9zA==
X-Gm-Message-State: AFqh2kpjUkXZH1Ro7cVr1WWQQXmONmjpP5Jmhsyp7mV4JgFADpYPHqMN
	/mAoh/o4gj7iRPK5ua5xtcINgbrr0W7Fog==
X-Google-Smtp-Source: AMrXdXus3O0/K5yTNH0gvWUSwOOm2qpJrK+Fa3IBt8EZi8R07YH/1ovroQ4NdLYSrGBRhv0Goj1EEw==
X-Received: by 2002:aa7:85d5:0:b0:582:6732:ee0b with SMTP id z21-20020aa785d5000000b005826732ee0bmr34974469pfn.28.1674170305102;
        Thu, 19 Jan 2023 15:18:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id 8-20020a621608000000b0058a3d8eab6asm18382507pfw.134.2023.01.19.15.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 15:18:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] ruby: Use C11 _Alignof to define ALIGN_OF when possible
Date: Thu, 19 Jan 2023 15:18:17 -0800
Message-Id: <20230119231817.1187300-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230119231817.1187300-1-raj.khem@gmail.com>
References: <20230119231817.1187300-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 23:18:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176171

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Alignof-to-define-ALIGN_OF-when-poss.patch | 52 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.2.0.bb      |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch

diff --git a/meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch b/meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch
new file mode 100644
index 0000000000..30caf2c2de
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch
@@ -0,0 +1,52 @@
+From 6b3c202b46b9312c5bb0789145f13d8086e70948 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 15 Jan 2023 02:34:17 -0800
+Subject: [PATCH] fiddle: Use C11 _Alignof to define ALIGN_OF when possible
+
+WG14 N2350 made very clear that it is an UB having type definitions
+within "offsetof" [1]. This patch enhances the implementation of macro
+ALIGN_OF to use builtin "_Alignof" to avoid undefined behavior
+when using std=c11 or newer
+
+clang 16+ has started to flag this [2]
+
+Fixes build when using -std >= gnu11 and using clang16+
+
+Older compilers gcc < 4.9 or clang < 8 has buggy _Alignof even though it
+may support C11, exclude those compiler versions
+
+[1] https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm
+[2] https://reviews.llvm.org/D133574
+
+Upstream-Status: Submitted [https://ml.ruby-lang.org/mailman3/hyperkitty/list/ruby-core@ml.ruby-lang.org/thread/DLES4EPPXSPCHQMWJPPWMWXXS42AVPFA/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ext/fiddle/fiddle.h | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/ext/fiddle/fiddle.h b/ext/fiddle/fiddle.h
+index 10eb9ce..ffb395e 100644
+--- a/ext/fiddle/fiddle.h
++++ b/ext/fiddle/fiddle.h
+@@ -196,7 +196,17 @@
+ #endif
+ #define TYPE_UINTPTR_T (-TYPE_INTPTR_T)
+ 
+-#define ALIGN_OF(type) offsetof(struct {char align_c; type align_x;}, align_x)
++/* GCC releases before GCC 4.9 had a bug in _Alignof.  See GCC bug 52023
++   <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52023>.
++   clang versions < 8.0.0 have the same bug.  */
++#if (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112 \
++     || (defined __GNUC__ && __GNUC__ < 4 + (__GNUC_MINOR__ < 9) \
++         && !defined __clang__) \
++     || (defined __clang__ && __clang_major__ < 8))
++# define ALIGN_OF(type) offsetof(struct {char align_c; type align_x;}, align_x)
++#else
++# define ALIGN_OF(type) _Alignof(type)
++#endif
+ 
+ #define ALIGN_VOIDP  ALIGN_OF(void*)
+ #define ALIGN_CHAR   ALIGN_OF(char)
+-- 
+2.39.0
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.2.0.bb b/meta/recipes-devtools/ruby/ruby_3.2.0.bb
index 1981a7524c..0e1336f5b0 100644
--- a/meta/recipes-devtools/ruby/ruby_3.2.0.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.2.0.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch \
            file://0006-Make-gemspecs-reproducible.patch \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
+           file://0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.39.1



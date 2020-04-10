Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.2937.1586543489544061113
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2020 11:31:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CFEdG0nH;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id a13so1373434pfa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2020 11:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LA8NRcf0JNtLhAMXvk4cwvQ8WU5/UoPYGt2uBLY+eps=;
        b=CFEdG0nHqEpHv+XqBfle4CCiUvxzB/y3ZZYFgUTAIO7PpiK+kLuWVqalHRmrrvGPqM
         9ysxGFVAPnMNr2WCU3lbnJ8fSs5cEZmD+6y1m+kuz0rvMT4uNzdXQjm0v7oUHUJgCmxA
         +Vw8rNezg3F1y7Wx0/wxXyHov0StcyjhwnDBufTfNvJbZnmZVLOoFZf1BwtMbvjmYAup
         zrN/AlNuFmPzL0h4fn1rnyaPZ0BBFkttK8tLCWWJjrT5vds4Owol7bZZPkuqAi6IK8fG
         XawwFtmn/NyTD1ffMQ4YijIJEpPAH5v1Wcl5PexiomBTpFUZhGfv+3X7e8QCbf2rhJyw
         LTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LA8NRcf0JNtLhAMXvk4cwvQ8WU5/UoPYGt2uBLY+eps=;
        b=XU5vEqXdwr3OfmAq2rDzbiofNsXQAxo/nouF9K7NcOgoWScLHVS/ethWWXNHJt1RCC
         I0suSdxUMBcPfPwAOXvBdcAXMIOq3eDitQyEZFTXSDdPB+XXQ4ahidiQUbhVqY2vcy+7
         yqUGJBnV6QzdDfXXUvjB8CrlKbQgvVOG6A7racS7SF4XuiD3Msz6x/JGp0C0b1TY3P2w
         01ODkdNEfTFR06IjCxtQdN+Z0aVM6N+oJnZkL035GTEboKbTeWu+3f7K/U+PNI8cWnsq
         O3r/PiWbPp+6XHUq/KkTPueoWFGCuxm7O0WdEsvSg9/PHVTfHtb9k+0AxyPgzIMa046a
         79PA==
X-Gm-Message-State: AGi0PuZxn7DRnkJLKliLZi3lpj7+opWyougqSUGw7uicgRS77RhBDTKB
	IN44iIDbG0nBdOp9uTG2vQ20X3EPFXc=
X-Google-Smtp-Source: APiQypJD9PmTJjz+lPhdWtO996yflPI32BLKbjYRHFZRfao9BfIxWMw3qjdFdp0q181cLosRhtYOQw==
X-Received: by 2002:a63:f658:: with SMTP id u24mr5555652pgj.357.1586543488601;
        Fri, 10 Apr 2020 11:31:28 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::58e0])
        by smtp.gmail.com with ESMTPSA id c12sm2463353pji.19.2020.04.10.11.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 11:31:28 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 2/2] ruby: Link with libucontext on musl
Date: Fri, 10 Apr 2020 11:31:25 -0700
Message-Id: <20200410183125.1026358-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200410183125.1026358-1-raj.khem@gmail.com>
References: <20200410183125.1026358-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

coroutines in ruby 2.7+ needs ucontext APIs which are not available in
musl but an external library is available to provide them so use it

Use cached values for ac_cv_func_isnan and ac_cv_func_isinf this is not
detected correctly by configure on musl

on ARM drop using old arm32 implementation of coroutine which is slow and
inefficient

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: No change
v3: No change

 meta/recipes-devtools/ruby/ruby_2.7.0.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/ruby/ruby_2.7.0.bb b/meta/recipes-devtools/ruby/ruby_2.7.0.bb
index 44c76161d5..7f07080497 100644
--- a/meta/recipes-devtools/ruby/ruby_2.7.0.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.7.0.bb
@@ -1,5 +1,7 @@
 require ruby.inc
 
+DEPENDS_append_libc-musl = " libucontext"
+
 SRC_URI += " \
            file://remove_has_include_macros.patch \
            file://run-ptest \
@@ -25,8 +27,11 @@ EXTRA_OECONF = "\
     --with-pkg-config=pkg-config \
 "
 
-EXTRA_OECONF_append_libc-musl_arm = " --with-coroutine=arm32"
-EXTRA_OECONF_append_libc-musl_armeb = " --with-coroutine=arm32"
+EXTRA_OECONF_append_libc-musl = "\
+    LIBS='-lucontext' \
+    ac_cv_func_isnan=yes \
+    ac_cv_func_isinf=yes \
+"
 
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
-- 
2.26.0


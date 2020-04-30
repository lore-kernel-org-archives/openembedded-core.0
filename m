Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web12.2175.1588285868864910425
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 15:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=fdMA4IQT;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.195, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f195.google.com with SMTP id u22so2889862plq.12
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 15:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=mO+pGm7Uy+tSWKdlku1YrzZIPkRqFMgcwNpaafVIX3A=;
        b=fdMA4IQTUmJWnbodb9jbTJ8R1kfNfDUwEOFd0iunmuQlmSNYEVdqZjigmxvWWAR+bg
         IUqvzi0zJmsmpumsibu4QvZQ7NMqQMFDhRD9JkosK8XGry+4G2D+JNnSgTa5/vArCUOq
         lEU1M0i1kW1GUEpX4tnXh7d1bzpDtIDubpCdNRV+skXE5OlX/kFbB685OSJFSskExiwT
         KZjRVPTf5Fx0KEtdWYD/H8zuuY6JrOmmjLewTr9yRYOgvaMrmXAiLHeqb523dQx72pXj
         gVZ//e3woPgUOop5qYXR06/L5k4vW5q1SOfzenW+G1jdyPr0c2x2IOSywKmoTZyFAyBR
         VTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=mO+pGm7Uy+tSWKdlku1YrzZIPkRqFMgcwNpaafVIX3A=;
        b=B1vfoQXhzwY6ftatDENW3+aR+h4L9mGTIUrQRuqtJ8k4MnBF9pTn6n07/S14F0uwTR
         7q3mvJpOeyDkPnyG024MxqvyPgw9byzPfajBt1PMvsUSQg35/dNSyAGUsmiKP32T1hVL
         kC0bX4hWlJihc24FNxGnLKWZZ+qVgnYC8i5XD3cLKKUEg8n0eujKHBAkDglaQ10u1XvR
         vuh4W8VPXc1gfGnAnBZWHZseFbitaiaafnknjDMbkHmzMtOUcWLLGGGTZ6XuAubXr6Lj
         2+kIbGIE9085YRQCH1cDo/rfSOjVbTfcut5jJVmD6JMckRevtDN/zV4Mn8+cNkExCXpj
         fKOA==
X-Gm-Message-State: AGi0PuaRZA83UBm+AbDec/S0zjmsquQ7UUggj8fKvNPMY+TOl41XmkmL
	33rQfA812Y2HsXEoQfN+qDtG9vRhM5F9Zw==
X-Google-Smtp-Source: APiQypLSwPA6j4bA1LZ6vo1Wvr1B5UhGgKYev/aLimozefAGpV0WNp+7FJ3kNwUqxXIiwNlEhWGiJw==
X-Received: by 2002:a17:902:8647:: with SMTP id y7mr1294889plt.87.1588285867871;
        Thu, 30 Apr 2020 15:31:07 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d124sm646011pfa.98.2020.04.30.15.31.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 15:31:07 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell v2 07/14] ruby: Link with libucontext on musl
Date: Thu, 30 Apr 2020 12:30:12 -1000
Message-Id: <a2b1af47316a9f5c522db0c9feff1fbe0d39e022.1588285073.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588285073.git.steve@sakoman.com>
References: <cover.1588285073.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

coroutines in ruby 2.7+ needs ucontext APIs which are not available in
musl but an external library is available to provide them so use it

Use cached values for ac_cv_func_isnan and ac_cv_func_isinf this is not
detected correctly by configure on musl

on ARM drop using old arm32 implementation of coroutine which is slow and
inefficient

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
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
2.17.1


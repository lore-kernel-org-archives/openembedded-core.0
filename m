Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web12.4536.1588176710789145999
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 09:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ZFPcpwvm;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.193, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f193.google.com with SMTP id f8so1004730plt.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 09:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=mO+pGm7Uy+tSWKdlku1YrzZIPkRqFMgcwNpaafVIX3A=;
        b=ZFPcpwvmbELeMeQ670iV5+bppbE79NTmKM4xQRUY1lNWpj/DamUoBOs+WhkXxZ2lpx
         bx44rK8nGTR5Vi7LY6mvsz0JdBd8Nhqg9QIcSBRLKrL0mLVw9ZmA9dkbmsRgWf/M9Eh/
         wWl9N6gM5+cQ1Jvz3aTMA68pppL0Pg3hKfzPUMzmWFJBZ0hmN2OVHjBAly+PK/LytPC/
         s0WnvQF+sECytkNLNEkZADpGn7+m5qKy+Jqqw4UO/E/YmDr0KWiEkKPFLKjBmcB0Tpgx
         vIBbxhosyHvcnwebwVjw+prXAceGIEWaShVcDZfhUDWoGYBVkN1dGYRK7jijZ2Kual7X
         //5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=mO+pGm7Uy+tSWKdlku1YrzZIPkRqFMgcwNpaafVIX3A=;
        b=XJK8VUDnwWB6mAGu5P2zLgUtih8QyoiUnNbHtciZ9/VnGB+12wLO3QPGfOpKOlgBpd
         3HsuCE2K+fVDWREhlNbFcoa6+OXoOmPZQIb3PKqlF4hthTAOT47f+FLV8SD0ALsQl2L1
         PKoPEc/87cyFNzucYy+Egv3BC+YLQJU0OedM5nXSkI9LQFNnqlmmrTVDprd8gzZOvsqY
         n5lKImHJBpDNOVWFl+COiOJLKZE9R2zPkTl3vWbivg7TjxmqIK8Csuiqp86WQhtHUHh2
         Hz7TDkHlVHp6e+vnSfWIZVDsx4FLxC5CEn0ZT6XRLD0H4h7fjvgoznROrc6GLRz8LlDh
         akCQ==
X-Gm-Message-State: AGi0PuY49i8I8XjV4xf4HpJkIVpNGeKgq84d06flTDxj3p4XZ3BTxR6T
	1SyVooBTIKTxnLBA+/ZgaOGOP4+357Lk6A==
X-Google-Smtp-Source: APiQypI9Jw0s39qumDQuJS4j2eDHflbbRx5xsdO5kfR7kv/JtqhbGXXiiDtvFfdqgjeC3R/7yq7tCQ==
X-Received: by 2002:a17:90b:3d8:: with SMTP id go24mr3986751pjb.33.1588176709720;
        Wed, 29 Apr 2020 09:11:49 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o1sm4833062pjs.39.2020.04.29.09.11.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 09:11:49 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/16] ruby: Link with libucontext on musl
Date: Wed, 29 Apr 2020 06:10:53 -1000
Message-Id: <a81d12a2efdf233d92234873699ad8420b92ba29.1588175775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588175775.git.steve@sakoman.com>
References: <cover.1588175775.git.steve@sakoman.com>

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


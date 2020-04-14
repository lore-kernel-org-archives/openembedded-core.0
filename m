Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.593.1586885518301501309
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2020 10:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EMKn5KgY;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id t4so189740plq.12
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2020 10:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GNLHumhz0mpk4QVebK82wPIu9Q+xKo4CdbZOEcxWOnM=;
        b=EMKn5KgYnCQkLIlokufUNTnwASPfsmeoJDJrGPbl1jKLKBvDYGeazjdPJTGhhSUpxc
         4y/EYj+TwLxv/Pt5x7JT5T77S2bhYfmzlZt3+JCb5YFFttecdavj+RrJVmNzB3LN0pFC
         y1Sh4EC8BP+IS49y3OGQbg0pCPCvuf1mdI38i5QSnIknF23q4lJ1wUSl7zsYx/sPO6o3
         ervNXVwtIgklR2txHwqVi6F8nb/d6OidwOplVWXYqCU8sdAnbheyVuSYUv5yT5yT98Oh
         XvJAKApO46lmK6eIGQL5PXSnqnVVSi5yDVxeUp9y+k1y3H/erLRy2X0QZom1FYk6ht+O
         9ZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GNLHumhz0mpk4QVebK82wPIu9Q+xKo4CdbZOEcxWOnM=;
        b=Of07O/jhElnA7EntxLYUREoxtKoI2g/D2SLK1i91hY40ab1tqZpvHHl2YR9+itN/cq
         WPy7Mqm1ZjmSQCkLYOmRM+iTc5uWFo3tcVc8HncAsNyq8/rJ60OcFH9tTc7i5BeeZS/7
         0RubA32rQYgKMkteqgU2vjjrBCU5U9s0Pai1fqWUEkXebOAyTJafYLlXixwo7+00N+jq
         iRI3TDqpMoef5jXcvhgi2aZJ7F2BS4CerO/+0q8ESveLtMm6U0tHihoaByUsI4vXo8ad
         E+cHkYX2rvAvcimyDrkOeAan4Wp23rd2sLOsVPr3FwbEzUcykOOd2nHNusLY3pGuCmaB
         SWiw==
X-Gm-Message-State: AGi0PuaRG8OFAQaimFNA7CgMHuA+Rb6LiS13Pdm5MwPBAdpoq9Us78rZ
	dkcsUWJXpvJtAV69Fd4gGXbQwJBzwgE=
X-Google-Smtp-Source: APiQypKj0HlIzGQndydSPD9EGdwtgflQdBMGpf1aV6QixKyr6TShYRR8xgUz3ViWLaNEV1k1zNEeGw==
X-Received: by 2002:a17:902:8a85:: with SMTP id p5mr953592plo.305.1586885517426;
        Tue, 14 Apr 2020 10:31:57 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::58e0])
        by smtp.gmail.com with ESMTPSA id a9sm10592302pgv.18.2020.04.14.10.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 10:31:57 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4 2/2] ruby: Link with libucontext on musl
Date: Tue, 14 Apr 2020 10:31:53 -0700
Message-Id: <20200414173153.984125-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200414173153.984125-1-raj.khem@gmail.com>
References: <20200414173153.984125-1-raj.khem@gmail.com>
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
v2: Rebased
v3: Rebased
v4: Rebased

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


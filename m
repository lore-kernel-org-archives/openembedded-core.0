Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.22279.1586476335163331420
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 16:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WE045gK9;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id c138so306303pfc.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2020 16:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YTieVNMNxDTr6ZBY2YoMdLgAwdwdIo9g3uOIDK+RCmw=;
        b=WE045gK9a4Ki5+UZoyuhbJE69iTZNQgNZY9tG27ZbgO74h7HgjL6esWIl7u8MqNmVd
         vWPZ688PBOkmonGHOHYdPzJyOAOfgYDAt0FLuyj0dG5c3Z9nuAEBc+fepKsxrjszCOzY
         YHrdot7+ngd7Gd+Ot1fLXPIYCh4rHQuo70JXOepSNmJtCJP2Ge2WXPS9xmsJQL1O8rGo
         SEPbgpfFh/R3yVC1E3wsU46zZZR9KhznbAQJyAaE508KWlNfBlLMwpLAop6OvH1kfPGx
         pOrY+hixSiKCmCu7lAFTaGxBIvvMMrWv3+nfVvzVTUrpiSgCjFCE7hkpgIHqlWuXpWiy
         +RgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YTieVNMNxDTr6ZBY2YoMdLgAwdwdIo9g3uOIDK+RCmw=;
        b=dpM8Q6bcWLOgFP6588KG1qsGOHmpTOfZfTAYeJBDV/oE8IBe7W/aJwwryU8syP2Nd8
         WQ3TIXCIXl9O8JuXqdoKBIpMJgXmijSoqT8leKAyaJR35/LgmCTkUseWbm7FvuU6SPDN
         as7rY9uwuTrmuL5m0rB0/kqm1PHF4qY4GY7CJ4F2CWZL8lq5fycPEzODJEobmSFy7zsq
         R8DQodf/HIHzDuzkTpxN++axHkGEr1NOGscVUE0ito9zjIcz5Bd3KdpUN0u9E2TskOqh
         a3rcv+ba18Sw21qMb3+Ztad4SpWqr4tAyznbPV1eWgyKpXhFuyvkzB9CWBWpGQUmn2RF
         i+mQ==
X-Gm-Message-State: AGi0PubZBZE85nJG0AcIibPynnWtxmhR9QbIjkLz/91zYsOmJ98u1AF3
	iQLp2bt3LJ96KtZf42Sw56yCDrm1WHs=
X-Google-Smtp-Source: APiQypJ8geLwt0nqznFWxWXPBEoVuOD+OCvNdbuupLg+p1g9yyX60YMoY0tlgzuZfCRNx7Bs6GwZgA==
X-Received: by 2002:a63:c345:: with SMTP id e5mr1718326pgd.403.1586476334301;
        Thu, 09 Apr 2020 16:52:14 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::58e0])
        by smtp.gmail.com with ESMTPSA id 36sm200091pgs.70.2020.04.09.16.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 16:52:13 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/2] ruby: Link with libucontext on musl
Date: Thu,  9 Apr 2020 16:52:09 -0700
Message-Id: <20200409235209.985108-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200409235209.985108-1-raj.khem@gmail.com>
References: <20200409235209.985108-1-raj.khem@gmail.com>
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


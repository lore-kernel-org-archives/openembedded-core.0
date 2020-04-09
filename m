Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.17821.1586462474258825754
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 13:01:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QrkxuquI;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id r4so5464840pgg.4
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2020 13:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OoHs8Kq2lK5G6bWSCryeG/UTRJMUW8G1+Zs802RvLgU=;
        b=QrkxuquItRQYOMQCHXDQgBSctSnV31svPlaIDhaJ5IjldGj/lbkAO6NbsEVAETFPUE
         zfeK+3Ntb1eEuRfObkzr+3wlaJA5G1XMGPYasBNqiK3p5brglMjOq58grjmTyKH7t4LY
         OrlxtC0EbaxOllqnS9jqSLlT1G4rFiEoNC3DsDIGkg5Edm9Jn61vLrt1PI3vTTHc4YTw
         WEwF0+eSk8qdYmlpRMSK5/gpn4CEzW4/dtmIeyz1QZ8z9IjEAy1j6/V0sXpgLC+Q4Pja
         8awQQu5SXsRnjs+WdrrJ7itlVMgTwSternx8pSZtOCJ5VzCE85wEDqem3FfTxzp2IRf5
         JPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OoHs8Kq2lK5G6bWSCryeG/UTRJMUW8G1+Zs802RvLgU=;
        b=GGFrSDQGSIOijek4o+XIMPBPD8BEWeqwjpMRQQ465dX8Je1eL4iQuwPlskzu8fV3Jk
         h8Jlw6j1saPbOqmva0/pUvJRdTxCLG3tX9zW7vI2x4wYhNKYei0CpG94BjkhUOQ00t/I
         k6bxAkBaIhhhUlwy8LYr3zviYbeGynxUs4k/Fga6pKJr9YL+NC0G+BmGzU/g7OQuOCOY
         5joFDIYfCe8ExRgk2CTQmdime7cBNOHYGVLtyl9uN25J9tdxZGCCCSUK92xEhgJFgY3G
         pi9Fhq9GUC+/AaCBN9nuKGCtEO9G/KU56ozkExi7dyS7Od419AsXo3jtB/l5vbrNRftb
         ePRQ==
X-Gm-Message-State: AGi0PuaHRMCKkC+gEOY9oD1y7BaRpLPxY5P41sjwuydXeRQFZhKmWQ/J
	ZEap0U5IcIPUW5F29WHXxvJFJ/v7hCQ=
X-Google-Smtp-Source: APiQypJIKC5SyPzjxF5378ponWPxjwFsvS2ZKCkBOdDDy81sHXBi5K/PeEg/4C2HvfCXB5ihMsWLOg==
X-Received: by 2002:a63:5c02:: with SMTP id q2mr1189575pgb.262.1586462473368;
        Thu, 09 Apr 2020 13:01:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::58e0])
        by smtp.gmail.com with ESMTPSA id y10sm2583024pfm.201.2020.04.09.13.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 13:01:12 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] ruby: Link with libucontext on musl
Date: Thu,  9 Apr 2020 13:01:26 -0700
Message-Id: <20200409200126.791501-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200409200126.791501-1-raj.khem@gmail.com>
References: <20200409200126.791501-1-raj.khem@gmail.com>
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


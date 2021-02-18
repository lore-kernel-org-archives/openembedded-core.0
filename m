Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.2340.1613620344242550024
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 19:52:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ebqQf3PM;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id u11so480879plg.13
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 19:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MHAyYSZJ4wakflMKpjEm8aiSfT2+zrxYC1pRxFiXkvc=;
        b=ebqQf3PMAB5PdDa+reKRZv5ldbqMiBTyU7HZ9ZiZYKpd4QfnIyFGaPmDb5F+vxN1BB
         mL/0nVukBh3G6VuyGZBC4VtEhQFhUHJb8WK6y5vCqw3t66DQBwsX5HUipkjryPbbwxnm
         AjBSfLYfE46q5v1pgHI9mHkEdKDRu9AWmKVNiebepp2UvVlD2yGwaYWy57PnEFkjok+G
         m8aAV8sAfSfMhuanMNZiwKXRL3ZbXDUXwSY/uWVYSnu3jp9ETvAcG1az0YlVW0qRam5x
         tv3yfUR6ZAfR/uzLvZa7K82k3gITEtonqbc/RuDJBcdJC+O1SUIbkliX6JdkbvswEEdW
         3+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MHAyYSZJ4wakflMKpjEm8aiSfT2+zrxYC1pRxFiXkvc=;
        b=ax+YfGmDVSzEjIyCgl5iWcrbV3Zh0KnRTrr6kEtbXNL47hi5oJklBnmOtYfHMBEzPp
         ZdnD5UJm7cbCXtpBKXAWiM86JHiL6eGXf8RU7c0WoxTV9yGGMfZ1mEpyTpeaLHM2Uvh0
         OwB/QdiTUUpwXCPdz/0p6ytZOk0KK4ctyOv9bH6+ND+wnobWNACdN4taFONYsNXh9f9B
         tN1QJbZogBkmNtsQ4RXY8Hl9gOfFL+zE16wqUF2TDZcEwHYoCE94dvDC3K0+5xP8yhyh
         zSavX6cjLQ4g5Uhj95TCMGjYj+hyN4yGWnDOzS4E48zmfauPiNwAEnEkjNBqoSNQNhl7
         NKEQ==
X-Gm-Message-State: AOAM533PxBUrqlPVr8nbIiB466tZ3zyDsj2wNC7Rf1iM3ea4FmgM3SG+
	I80c1y5WoS8Cn7QjBFYahE5+TmrqkWiF7Q==
X-Google-Smtp-Source: ABdhPJyyBp+VK/ix5LDpJUmmcwDS8Ff1sOCiy/Jvm/qtxJJU1vTfjBsVJgq6vjTrWgIDjvJMYzCdRQ==
X-Received: by 2002:a17:90a:6549:: with SMTP id f9mr2110415pjs.17.1613620343479;
        Wed, 17 Feb 2021 19:52:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::54b4])
        by smtp.gmail.com with ESMTPSA id n1sm4059659pgn.94.2021.02.17.19.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 19:52:23 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ruby: Do not use ucontext implementation for coroutines on musl/riscv
Date: Wed, 17 Feb 2021 19:52:20 -0800
Message-Id: <20210218035220.3828246-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The coroutine implementation in ruby has either arch specific
implementations or it falls back to slower ucontext API based
implementation assuming libc will provide the needed APIs, however musl
does not implement ucontext APIs like glibc, therefore fallback is to
use libucontext library on musl. However, libucontext is not ported to
riscv yet. which means on musl/riscv ruby is unbuildable, however a
third option is to use copy implementation for coroutines, which will be
not as good performance-wise, but it will do the job, therefore for now
use copy implementation for rv32/rv64 when using musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/ruby/ruby_3.0.0.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/ruby/ruby_3.0.0.bb b/meta/recipes-devtools/ruby/ruby_3.0.0.bb
index 5e143ee87f..28e12c3cd7 100644
--- a/meta/recipes-devtools/ruby/ruby_3.0.0.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.0.0.bb
@@ -32,6 +32,13 @@ EXTRA_OECONF_append_libc-musl = "\
     ac_cv_func_isinf=yes \
 "
 
+EXTRA_OECONF_append_libc-musl_riscv64 = "\
+    --with-coroutine=copy \
+"
+EXTRA_OECONF_append_libc-musl_riscv32 = "\
+    --with-coroutine=copy \
+"
+
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
 }
-- 
2.30.1


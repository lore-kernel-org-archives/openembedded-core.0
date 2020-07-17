Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.12662.1594996703151968718
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 07:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=FsSFax7l;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id w2so6753085pgg.10
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 07:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=zGW9w3zohDMA9Qn4Qq+p8ctkGUwL0kqsPv4hKHEeh3w=;
        b=FsSFax7lIHIHBZUEgFELcIWaM1pqJFvPx6RAUAKF83VXZEpWrtv8xlWlt/UhTxt6bn
         lItdeVfIPrFFxWNIsDsKbCcSd8RQZ9uupRVZh1HEcVcuHfyOCGh7d9ypPJu/06HD1Ob8
         qEkhBvPpVEPdal/QiPQYX3oE4vtHGbkdkIW374l2bFfFp43EC0HjGDnhUJ7R5abRNpfG
         RnQ7XtrPhWXBa2M/ydA2Qpth38qChOBBHbf3KU6lIGEWGNp4l1JM5A9zBaC1ImYMiR/j
         bL9CzucglWi3TfwT4kyjKuGhj1yxl8P4tgQIr3SoHQBSNmcUwkd3+qsH7giOv5dGHN8y
         kFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=zGW9w3zohDMA9Qn4Qq+p8ctkGUwL0kqsPv4hKHEeh3w=;
        b=IILmLEU53BL1nq1M/HcJ0chCU4rdX4utG4uu9d/TKlCcgLaEgSW57u2hkKnNbVKaVs
         J7ajHwaOFTZdsIQxsrxYnE36XjbJ0LL5EFJquO54Qrf4pvd+N7pe+PL2XsSWfor5Q3pE
         bSHwUeCGiV5QBDJ1Ng8zuvaHLtkMXA6aRrVuHahAqdPur6eKdUfJDoS67ukThhzXdsxI
         DKSPeo/sEbmg7G5F+uJ0jtMDsoZJ+kpLhNd4khCNgl7t5mh+RtW2eZVcYa+JsOHfhAKp
         dN8mp7q58jCyDTdKQjIo5gFtZSStkZZ4DyUAuduM9gmCAIMhPAQGUdgBdyx6AImqMZwd
         CN7A==
X-Gm-Message-State: AOAM532CkpMo/VIjJDnitFxH5n2xJq1kFeyMB80NR7yjOSL9k730xCcl
	LdFyW8c3xtCf0OoXlcVZlYPYY0nYxYs=
X-Google-Smtp-Source: ABdhPJzrjK2qHuUkGp/DrWX7oOoW0TXPOE/QFLk//cJAAxY35Zrcd7Rtu1ZVBZJ+emxgYO5afp5Vyw==
X-Received: by 2002:aa7:96d1:: with SMTP id h17mr8034561pfq.141.1594996702209;
        Fri, 17 Jul 2020 07:38:22 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id mw5sm3448727pjb.27.2020.07.17.07.38.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 07:38:21 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/20] go: Disbale CGO for riscv64
Date: Fri, 17 Jul 2020 04:37:15 -1000
Message-Id: <987d29d0b0dfa19ef6564996198f22c2b08f6ff9.1594996440.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594996440.git.steve@sakoman.com>
References: <cover.1594996440.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

cgo is still not available in go for riscv64, we will re-evaluate it
once we upgrade to 1.15

Fixes
| /usr/src/debug/go-runtime/1.14.4-r0/go/src/runtime/cgo/gcc_util.c:23: undefined reference to `_cgo_sys_thread_start'

[YOCTO #13966]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f512b3308ed6ee878c77f72b9235ada83d107dba)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-runtime_1.14.bb | 1 +
 meta/recipes-devtools/go/go_1.14.bb         | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-runtime_1.14.bb b/meta/recipes-devtools/go/go-runtime_1.14.bb
index 43b68b4e46..4eeee65e0c 100644
--- a/meta/recipes-devtools/go/go-runtime_1.14.bb
+++ b/meta/recipes-devtools/go/go-runtime_1.14.bb
@@ -1,2 +1,3 @@
+export CGO_ENABLED_riscv64 = ""
 require go-${PV}.inc
 require go-runtime.inc
diff --git a/meta/recipes-devtools/go/go_1.14.bb b/meta/recipes-devtools/go/go_1.14.bb
index 5d40cf9d04..bc90a1329e 100644
--- a/meta/recipes-devtools/go/go_1.14.bb
+++ b/meta/recipes-devtools/go/go_1.14.bb
@@ -2,7 +2,7 @@ require go-${PV}.inc
 require go-target.inc
 
 export GOBUILDMODE=""
-
+export CGO_ENABLED_riscv64 = ""
 # Add pie to GOBUILDMODE to satisfy "textrel" QA checking, but mips/riscv
 # doesn't support -buildmode=pie, so skip the QA checking for mips/riscv and its
 # variants.
-- 
2.17.1


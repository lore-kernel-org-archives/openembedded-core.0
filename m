Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web12.3786.1594324666017824329
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 12:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SJjz/Lfn;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id q17so1247839pls.9
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2020 12:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DGXh5hVi4wxrc6qfBVXF/b5UWUYXz2Ju+6FIqGzi4Wk=;
        b=SJjz/Lfnci/f+mWN8C9DB7oDY5dxDAvtBuAt1G8juilbzv/Urd4gj0+HBtEL2WSMur
         ZXp0uwY5mjZlpcIlxdPXpeRtF8AFf7YiboJ+m3yVEt5tXg2jJTDYknG5rjlRhxUWgQRl
         JSO/3iDmUfxL3Ll5P+RYvta1G0kt0MIkNd2bHQbArmFGXVPtdQDpNZA90Iks9tnMMtQX
         PGIrN6xMo4cLfgmq9HKNmgQMG3vH2o1k9ZEoU3JxIdg3wWffG8htCMyQ1KRXAYmWqE9n
         6WpErNG/mOU1syjlf14WEEQnNEmUqJyBn/eaHipATa+BCoQQOxskcvHhd4+Ei0U4vPyt
         lM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DGXh5hVi4wxrc6qfBVXF/b5UWUYXz2Ju+6FIqGzi4Wk=;
        b=Nl0cAFd/bwkeqnDJT7WKUv+6qocZjsAJDSApT2M5zs+EBVYzr++lCvaprDF9LW4egR
         TGJm6GmiheM9hFbNEtEvMy80tkacUgQ7WAt4Zp2i97i18gPic8FDenzoMDFtaEgtnxY6
         woiNeqq/I63CsdGA6H93sBcPTUYsErkTTPnir00GGdqqEdAhWzY/hLn/XOAqZ8GlT416
         /1tR+QWznTghhJF7ODmjWUsOavvzojQ+dN0HlVX151mfGbMAXkr1XjPIZ3s/hSUQOG8W
         zkKLPuLVXVUcL6UNoPK7QqhefnBtqFq8VHRVclx5q5T6KpEBpbFX2IUzm6hRwdOKngzw
         AvTg==
X-Gm-Message-State: AOAM5324V2TAr8voNFV4Fa4vLdqOC5jtpNmeh9f/0LT+xSLdOyr1xXfR
	uvz5YGzKOe8pq8z/S9kwKQDfS40eL78=
X-Google-Smtp-Source: ABdhPJx/XFYrh+kGcC1v9CUIPdkR7/cxnuE1crN36BB2qZQIEcq7m+qNK9IRLHZ7ICIhOpHNn+pwUw==
X-Received: by 2002:a17:902:8bc3:: with SMTP id r3mr17532685plo.162.1594324665212;
        Thu, 09 Jul 2020 12:57:45 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c85a])
        by smtp.gmail.com with ESMTPSA id n15sm3575933pjf.12.2020.07.09.12.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 12:57:36 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] go: Disbale CGO for riscv64
Date: Thu,  9 Jul 2020 12:57:29 -0700
Message-Id: <20200709195729.2224354-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cgo is still not available in go for riscv64, we will re-evaluate it
once we upgrade to 1.15

Fixes
| /usr/src/debug/go-runtime/1.14.4-r0/go/src/runtime/cgo/gcc_util.c:23: undefined reference to `_cgo_sys_thread_start'

[YOCTO #13966]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix go as well along with go-runtime

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
2.27.0


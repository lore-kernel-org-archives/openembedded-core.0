Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.2814.1614140005525115001
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 20:13:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h+7Ssn1y;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id p21so613862pgl.12
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Feb 2021 20:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wXCZOWk+PqE4K8qdm2Qs+4TVZa7dvpkEwucUAnx97SE=;
        b=h+7Ssn1yUbr2iQqVQj9K6/H0yZY2t8kefgkASZRMYBxvqaV/1EETmtj+220PCWnRdp
         v/e6GKrqOIpSgZP1qzy/S0Ci/zEVGp6dvM4eqtbLpRxTZnsFF27+8MabXhndebeyx9HO
         C4qDgjQPHHYSh7Xx3//EqUin9CLTufwHI3DJStHEY8+QSQ4EpxQUQHw8NvwAeYRt+jrm
         6m+lRW2God+t4vMIO1qqotThZs8xRN/mEjp2gPbKeU0QrdYT8JjrBROlqziXxAytXsXV
         aEti7JSbLBTDg/dtrfDkEExc7o969BdtlOvlvLPR0kiixDtvh/J3ae3At8GFfiSyRvT0
         o0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wXCZOWk+PqE4K8qdm2Qs+4TVZa7dvpkEwucUAnx97SE=;
        b=blFxgwgi7eu7f6rp6iWDjhNrM7zPlooqphNJ0PJtrRJLplUJZ/4RSoY8E+T4GKD55n
         f0O8estPn63mb1fO/Qdoc6N+BMJmMH5Rd8WLf04HW8A5lXWGEBuPHktzbe4t7mS7P0nl
         q57Cp4xEB4q5sT3Cdm6WfzUYTBtlmPqBErRgZLruI8ZfzurmkciRb1OaiyJ2decnDChu
         U2iWAcLW5JSIZSSHY7cZFkZ8THf6pgsF9c/tXA64ymoQm1bun1b8EFH175NY2ghVJLxp
         lDsRkJtFAuRbz6JAZrnz2//hBMb6C+ccR0JPdeDYzRr5E7JXKBtB4wLA6KmggJTJ5k/s
         umbQ==
X-Gm-Message-State: AOAM532nMuS97e3y+kPpgHj3/03RxZ2uD+CV6TIkxyFnhmAmCa28Otis
	S0bvXzDQxyyCM23msUxly9bJ9t6LOoUuxg==
X-Google-Smtp-Source: ABdhPJzBx3C0DBj+IXPB0KtxnloWmjAZdkGn14NV2fheGVDWy9OctYl9ntVRY18Hk0dZY5NO4jEQxg==
X-Received: by 2002:a65:4508:: with SMTP id n8mr24177974pgq.294.1614140004578;
        Tue, 23 Feb 2021 20:13:24 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id jx20sm640681pjb.30.2021.02.23.20.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 20:13:24 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/3] go: Enable CGO and pie buildmode on rv64
Date: Tue, 23 Feb 2021 20:13:19 -0800
Message-Id: <20210224041320.3968776-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210224041320.3968776-1-raj.khem@gmail.com>
References: <20210224041320.3968776-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

go1.16 has added CGO support for riscv64 arch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/go.bbclass                     | 5 ++---
 meta/recipes-devtools/go/go-runtime_1.16.bb | 1 -
 meta/recipes-devtools/go/go_1.16.bb         | 5 ++---
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index fa147892b0..77ec98dd51 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -54,7 +54,6 @@ GOTOOLDIR_class-native = "${STAGING_LIBDIR_NATIVE}/go/pkg/tool/${BUILD_GOTUPLE}"
 export GOTOOLDIR
 
 export CGO_ENABLED ?= "1"
-export CGO_ENABLED_riscv64 = "0"
 export CGO_CFLAGS ?= "${CFLAGS}"
 export CGO_CPPFLAGS ?= "${CPPFLAGS}"
 export CGO_CXXFLAGS ?= "${CXXFLAGS}"
@@ -147,10 +146,10 @@ FILES_${PN}-staticdev = "${libdir}/go/pkg"
 INSANE_SKIP_${PN} += "ldflags"
 
 # Add -buildmode=pie to GOBUILDFLAGS to satisfy "textrel" QA checking, but mips
-# doesn't support -buildmode=pie, so skip the QA checking for mips and its
+# doesn't support -buildmode=pie, so skip the QA checking for mips/rv32 and its
 # variants.
 python() {
-    if 'mips' in d.getVar('TARGET_ARCH') or 'riscv' in d.getVar('TARGET_ARCH'):
+    if 'mips' in d.getVar('TARGET_ARCH') or 'riscv32' in d.getVar('TARGET_ARCH'):
         d.appendVar('INSANE_SKIP_%s' % d.getVar('PN'), " textrel")
     else:
         d.appendVar('GOBUILDFLAGS', ' -buildmode=pie')
diff --git a/meta/recipes-devtools/go/go-runtime_1.16.bb b/meta/recipes-devtools/go/go-runtime_1.16.bb
index d6ddb31ed4..63464a1501 100644
--- a/meta/recipes-devtools/go/go-runtime_1.16.bb
+++ b/meta/recipes-devtools/go/go-runtime_1.16.bb
@@ -1,4 +1,3 @@
-export CGO_ENABLED_riscv64 = ""
 require go-${PV}.inc
 require go-runtime.inc
 
diff --git a/meta/recipes-devtools/go/go_1.16.bb b/meta/recipes-devtools/go/go_1.16.bb
index d4812c0f0a..4e9e0ebec8 100644
--- a/meta/recipes-devtools/go/go_1.16.bb
+++ b/meta/recipes-devtools/go/go_1.16.bb
@@ -4,15 +4,14 @@ require go-target.inc
 inherit linuxloader
 
 export GOBUILDMODE=""
-export CGO_ENABLED_riscv64 = ""
 export GO_LDSO = "${@get_linuxloader(d)}"
 export CC_FOR_TARGET = "gcc"
 export CXX_FOR_TARGET = "g++"
 
-# mips/rv64 doesn't support -buildmode=pie, so skip the QA checking for mips/riscv and its
+# mips/rv64 doesn't support -buildmode=pie, so skip the QA checking for mips/riscv32 and its
 # variants.
 python() {
-    if 'mips' in d.getVar('TARGET_ARCH',True) or 'riscv' in d.getVar('TARGET_ARCH',True):
+    if 'mips' in d.getVar('TARGET_ARCH',True) or 'riscv32' in d.getVar('TARGET_ARCH',True):
         d.appendVar('INSANE_SKIP_%s' % d.getVar('PN',True), " textrel")
 }
 
-- 
2.30.1


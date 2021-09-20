Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.11081.1632141995610773722
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 05:46:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HcCppjww;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id x6so29281506wrv.13
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 05:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qS7OddXcUrHkXoVKip6lpeV2ULBGEVUvZwUrDFYnvj0=;
        b=HcCppjwwKVY8gzXfdgfE9nud8yComkHyvjDbfTN4Ym4ibXIAQtbqnLgShNvbR8Mlkt
         v2qNI0ZoOw+AvY3LlrDBVYkKzZ14iPeLq/MLs9jBuWBR2OAcdAcSMWc2R2XCZhiHC+Bd
         Urh2wLkgJsKbe/Meubh4yzOah8rp6Vh/hCSOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qS7OddXcUrHkXoVKip6lpeV2ULBGEVUvZwUrDFYnvj0=;
        b=XLdOBhT6EydTT7JVhxjMxcKe2YkVqSb2I/s9Mc+Ep6YB/kFCg7Mcp2krHuYBkrYiF7
         ytPthzAHxxJbQfHCswUZMtvJnTGPrgG1DB5si1+jz2iNVlDgmCs9ssJOxFnhv6glS4Nw
         Z/QWwwMJXPKhr5ZqAAseAp3C+ksWhvOyG1frZbfFdUOC2bWNjsGqzG28GGJa34sabOv9
         qv3fp2tjymjB7lqKTeDGsbMqZ0X8SWngv7oX14T6Sx7DiE5YAM/imqVsCqspW7NhACW/
         1Vwi5pFQAETG/PJMHoLKqcJS2lQ3bsqF8ce2E5YUORXEtGVWex2Wu/zwi5HCjNKPSjBJ
         RAVA==
X-Gm-Message-State: AOAM530xPqM8vAjobcTdkY3YKtkbFh+FXwZzYbtjdORfuBBBxp0LO0Bq
	Hkwz2iqvugydaVTd4lmwO9FhieK/VvFWphBa
X-Google-Smtp-Source: ABdhPJyFX6BPgG80yds5p1vWHkOuyJhm3O+NzPEyp/r4cTPWqVrLSBlLNvGldWtYAI4mT9io3NhIRw==
X-Received: by 2002:adf:f011:: with SMTP id j17mr28053985wro.320.1632141994086;
        Mon, 20 Sep 2021 05:46:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7173:466e:b128:3e8b])
        by smtp.gmail.com with ESMTPSA id j21sm15773514wrd.48.2021.09.20.05.46.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 05:46:33 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/14] buildtools-tarball/uninative-tarball/meta-ide-support: Drop useless meta class
Date: Mon, 20 Sep 2021 13:46:19 +0100
Message-Id: <20210920124621.1576702-12-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The class adds an emtpy PACKAGES setting but most code now uses the
nopackages class which is much clearer. It also adds recursive do_build
dependencies which don't really serve any useful purpose any more.

Simplify the code and drop the class use.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 -
 meta/recipes-core/meta/meta-ide-support.bb   | 2 +-
 meta/recipes-core/meta/testexport-tarball.bb | 1 -
 meta/recipes-core/meta/uninative-tarball.bb  | 1 -
 4 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 6e96cf6c326..fb28930656b 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -49,7 +49,6 @@ RDEPENDS = "${TOOLCHAIN_HOST_TASK}"
 
 EXCLUDE_FROM_WORLD = "1"
 
-inherit meta
 inherit populate_sdk
 inherit toolchain-scripts-base
 inherit nopackages
diff --git a/meta/recipes-core/meta/meta-ide-support.bb b/meta/recipes-core/meta/meta-ide-support.bb
index 768f6f4bb67..37e65a49cac 100644
--- a/meta/recipes-core/meta/meta-ide-support.bb
+++ b/meta/recipes-core/meta/meta-ide-support.bb
@@ -6,7 +6,7 @@ DEPENDS = "virtual/libc gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native
 PR = "r3"
 RM_WORK_EXCLUDE += "${PN}"
 
-inherit meta toolchain-scripts nopackages
+inherit toolchain-scripts nopackages
 
 do_populate_ide_support () {
   toolchain_create_tree_env_script
diff --git a/meta/recipes-core/meta/testexport-tarball.bb b/meta/recipes-core/meta/testexport-tarball.bb
index de7663b38c0..7cb84a01049 100644
--- a/meta/recipes-core/meta/testexport-tarball.bb
+++ b/meta/recipes-core/meta/testexport-tarball.bb
@@ -26,7 +26,6 @@ RDEPENDS = "${TOOLCHAIN_HOST_TASK}"
 
 EXCLUDE_FROM_WORLD = "1"
 
-inherit meta
 inherit populate_sdk
 inherit toolchain-scripts-base
 inherit nopackages
diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
index bbdaebad947..a21d08b591c 100644
--- a/meta/recipes-core/meta/uninative-tarball.bb
+++ b/meta/recipes-core/meta/uninative-tarball.bb
@@ -36,7 +36,6 @@ RDEPENDS = "${TOOLCHAIN_HOST_TASK}"
 
 EXCLUDE_FROM_WORLD = "1"
 
-inherit meta
 inherit populate_sdk
 inherit nopackages
 
-- 
2.32.0


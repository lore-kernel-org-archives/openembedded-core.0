Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.4608.1618479164967676057
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 02:32:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PbvcAnMC;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id ot17-20020a17090b3b51b0290109c9ac3c34so14063417pjb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 02:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IPjmTQiXEt0+NUidzL2esVSGV4NvNCWlgQ5DAU0AIfQ=;
        b=PbvcAnMCr2i3pR+Qxp9236L7T+zFO40xvEulrRKHcewgyZm9xjnfL/mzAfZx7JRtp2
         YgRSs0PoZGwXkzUaQssysxjtXAiQGgPzjI6Zks7y4oaLYKx/+gc/P5+EUZ6umtGQrWXj
         Lzrq3LsmlUI5Lw8m8Ysxdl94sio6S7x4n6VSbwM2WLMhoHPH/ZxDzOFT53mBcye3oB1q
         Ii7Oe39co5Z+GfHy+KkpTWJm7paPR1s1EbBgyJnv2FnMHOZ0lcTbnXA7H7iRp2EJbNe0
         6TU/dSOYkBP1umLnjbO1Pv56diH954W79faA5WdVuiomJwiCbqmJMjDCWs0XMfncx8si
         zKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IPjmTQiXEt0+NUidzL2esVSGV4NvNCWlgQ5DAU0AIfQ=;
        b=VlMVsy7b9B8dIXnvmHBcyJ+SeYJzKyalw/ZE+rWwtD5RtoumtZlFtnz/p11MukOl6i
         6ZrxvAlSr7XjWaHjiJas9xbWgtA8xoQ3OXpm26gXur7UWfa/qrPRKRQhpi0/RnOZCXxQ
         qE/MoVcGRX1yXhbZXBdG4PCAh6iiV33oyqnvCiUCgTlc7VF/Fomdlrsu+v8pnN2jM7eo
         9yaarHCatZ0nvqX27YSqcBmchTjqoT4HaQI1g2UjYb0SltKl+5hLtV8YMCRnnRKonfp2
         h6QgbUMxdqBs69GAqXO2eOrPg9okwbN1iHew/KOJ+E5C4Dxn9JGvEvVyKaB//nfGsxCv
         KQIg==
X-Gm-Message-State: AOAM5333aA1PpK/jtH87Xqp2sgazFwWx559nWiEsZ7D1y8lmAyYlLTGE
	3dPHpasVztfNY0OfhOUjkrZzYRJzgri7dhYK
X-Google-Smtp-Source: ABdhPJy4G7UA0TnD3nfmgdgQdq85oM6aJ9DbjKJHFvCMOcXIyyGHn5nK4UGIGcCDO3qIsl8+k6j0jw==
X-Received: by 2002:a17:90a:f3d1:: with SMTP id ha17mr2989999pjb.123.1618479164281;
        Thu, 15 Apr 2021 02:32:44 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id ms9sm1994851pjb.32.2021.04.15.02.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 02:32:44 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH 2/8] The function "do_compile" is to compile remote-test-server, and "do_check" to trigger the rust testing.
Date: Thu, 15 Apr 2021 02:32:21 -0700
Message-Id: <20210415093227.175608-2-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210415093227.175608-1-vinay.m.engg@gmail.com>
References: <CANNYZj85zmWjRe2KR53u_eF-DDf47eR9eOJnP1Ch0Df6COoAaA@mail.gmail.com>
 <20210415093227.175608-1-vinay.m.engg@gmail.com>

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/recipes-devtools/rust/rust-test.inc | 34 +++++++++---------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-test.inc b/meta/recipes-devtools/rust/rust-test.inc
index 0d3eaa10cf..3a9b5b367c 100644
--- a/meta/recipes-devtools/rust/rust-test.inc
+++ b/meta/recipes-devtools/rust/rust-test.inc
@@ -492,29 +492,21 @@ rust_runx () {
 }
 rust_runx[vardepsexclude] += "PARALLEL_MAKE"
 
+# We have to build target specific remote-test-server 
+# Reference link - https://rustc-dev-guide.rust-lang.org/tests/intro.html#running-tests-on-a-remote-machine
 do_compile () {
-    rust_runx build
+    rust_runx build src/tools/remote-test-server --target "${RUST_TARGET_SYS}"
 }
 
-rust_do_install () {
-    mkdir -p ${D}${bindir}
-    cp build/${HOST_SYS}/stage2/bin/* ${D}${bindir}
+# To test the rust
+# Copy remote-test-server to qemu-image and execute remote-test-server on qemu-image through ssh in background.
+do_check[dirs] += "${B}"
+do_check[nostamp] = "1"
+do_check () {
+    scp -P 2222 -o StrictHostKeyChecking=no build/${SNAPSHOT_BUILD_SYS}/stage2-tools-bin/remote-test-server root@127.0.0.1:~/
+    ssh -p 2222 -o StrictHostKeyChecking=no -f root@127.0.0.1 "~/remote-test-server -v remote"
 
-    mkdir -p ${D}${libdir}/rustlib
-    cp -pRd build/${HOST_SYS}/stage2/lib/* ${D}${libdir}
-    # Remove absolute symlink so bitbake doesn't complain
-    rm -f ${D}${libdir}/rustlib/src/rust
-
-    # Install our custom target.json files
-    local td="${D}${libdir}/rustlib/"
-    install -d "$td"
-    for tgt in "${WORKDIR}/targets/"* ; do
-        install -m 0644 "$tgt" "$td"
-    done
-}
-
-
-do_install () {
-    rust_do_install
+    export TEST_DEVICE_ADDR="127.0.0.1:12345" 
+    rust_runx test --no-fail-fast --target "${RUST_TARGET_SYS}" > summary.txt 2> /dev/null
 }
-# ex: sts=4 et sw=4 ts=8
+addtask do_check after do_compile
-- 
2.17.1


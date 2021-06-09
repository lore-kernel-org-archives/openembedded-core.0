Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.4420.1623220643122294640
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fPxR2GAS;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id m13-20020a17090b068db02901656cc93a75so790447pjz.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jun 2021 23:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WhT4q25+0XGArXUyeT0TiLRKInUSnNSoEuu4DpZQuOg=;
        b=fPxR2GAS6NoAVH7y4oyu3phEgh2VN3XWRt0GIWZRHUH9mX9HXSjy6NzQ1MvR4TwsUE
         9KOHw06Ro+sVJnN5G0dVA7q+K/nF/NlnxONE5qZOCjZI9b3VBKHULPAsM2NddSgQ81ji
         ORYDjf+qPkuwK43zDiSvX1ANtfV4Pp0pCflxC04h0fnoS2GG/0Eeyzci9nUxbBkpMhgY
         GqrS+2XhqAtWaixfrkeGoK1oO9JfdtQeZOEbmfE8FqoyBfghchlv3zwnauVFryKs1B1A
         TnnVkqdVsfngV6+q674bHLQ5ZucNhwYxrZxzdno2oUyEWy6VIsxmDLed41S5tsWpAasN
         +1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WhT4q25+0XGArXUyeT0TiLRKInUSnNSoEuu4DpZQuOg=;
        b=KScKVgILsmGR6e9+WNLLoCtx9+/cJSLwygn/j399DrAo4u4yQA0N4B/H05CwCNHbro
         dFQZ53r3K6uxnaGSPXyFASlqDCQvfPKsVg/k90n5yhOxizos1oMlVkLklclY6aOOxgvf
         ntNS0Uzk3A6SCie0bY9pl15hmIu4B+YPvRNWKvzqvOwHUsasfCP9xk0TuLVt34RLhZn1
         utYIUn3uM1ih/yNymEypd4Vp7WOxD9xtQr+/103HkievxvdbH5o+z6KRCS8g1mH1UZNv
         2JCigssqIv9tz+C2oDwSoCiFoAkaWpT/O9Li8i14wg1EVvm0vtMktrQWTpUaEHbEgzor
         vahQ==
X-Gm-Message-State: AOAM530vpfe5krcpc2OPs1uTzMvQAyvQusEDseMsZQz6ta5E7WKVMqwK
	cJn67gcYzqSFWdEHC80xtU05XkLMYS8CvQ==
X-Google-Smtp-Source: ABdhPJytoIlZlO7UnyY4Es2qVcWBXzAk7pEbxNLYRgaX1veOmDt5DFDWJPOphapJAto5zW8ksUjz1g==
X-Received: by 2002:a17:90a:578a:: with SMTP id g10mr8882224pji.165.1623220642267;
        Tue, 08 Jun 2021 23:37:22 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id p40sm5686365pfw.142.2021.06.08.23.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:37:21 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] systemd: Fix libseccomp testcase involving __NR_ppoll
Date: Tue,  8 Jun 2021 23:37:20 -0700
Message-Id: <20210609063720.2645885-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some architectures may not have this syscall

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...comp-Check-for-__NR_ppoll-before-use.patch | 39 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_248.3.bb    |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-test-seccomp-Check-for-__NR_ppoll-before-use.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-test-seccomp-Check-for-__NR_ppoll-before-use.patch b/meta/recipes-core/systemd/systemd/0001-test-seccomp-Check-for-__NR_ppoll-before-use.patch
new file mode 100644
index 0000000000..0ba5fa2547
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-test-seccomp-Check-for-__NR_ppoll-before-use.patch
@@ -0,0 +1,39 @@
+From 027ac2ad0695bb506460f9dd7e57149b71055887 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 8 Jun 2021 23:21:01 -0700
+Subject: [PATCH] test-seccomp: Check for __NR_ppoll before use
+
+some newer architectures like riscv32 do not have __NR_ppoll from get go
+
+Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/19858]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/test/test-seccomp.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/test/test-seccomp.c b/src/test/test-seccomp.c
+index b1f917eb54..daac0fcea8 100644
+--- a/src/test/test-seccomp.c
++++ b/src/test/test-seccomp.c
+@@ -832,7 +832,7 @@ static void test_load_syscall_filter_set_raw(void) {
+                 assert_se(s = hashmap_new(NULL));
+ #if defined __NR_poll && __NR_poll >= 0
+                 assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_poll + 1), INT_TO_PTR(-1)) >= 0);
+-#else
++#elif defined __NR_ppoll
+                 assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_ppoll + 1), INT_TO_PTR(-1)) >= 0);
+ #endif
+ 
+@@ -849,7 +849,8 @@ static void test_load_syscall_filter_set_raw(void) {
+                 assert_se(s = hashmap_new(NULL));
+ #if defined __NR_poll && __NR_poll >= 0
+                 assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_poll + 1), INT_TO_PTR(EILSEQ)) >= 0);
+-#else
++#elif defined __NR_ppoll
++                assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_ppoll + 1), INT_TO_PTR(-1)) >= 0);
+                 assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_ppoll + 1), INT_TO_PTR(EILSEQ)) >= 0);
+ #endif
+ 
+-- 
+2.32.0
+
diff --git a/meta/recipes-core/systemd/systemd_248.3.bb b/meta/recipes-core/systemd/systemd_248.3.bb
index 4e65656494..7498f5b48e 100644
--- a/meta/recipes-core/systemd/systemd_248.3.bb
+++ b/meta/recipes-core/systemd/systemd_248.3.bb
@@ -26,6 +26,7 @@ SRC_URI += " \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch \
            file://0001-test-parse-argument-Include-signal.h.patch \
+           file://0001-test-seccomp-Check-for-__NR_ppoll-before-use.patch \
            "
 
 # patches needed by musl
-- 
2.32.0


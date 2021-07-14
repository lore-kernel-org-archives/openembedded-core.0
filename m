Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.1636.1626228806357762880
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jul 2021 19:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZqQ6WUCC;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id jx7-20020a17090b46c7b02901757deaf2c8so335754pjb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jul 2021 19:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=28j0ywRvd0DPTH5nKq+XykZEDhxxnfuiSsNuNHFkE6Q=;
        b=ZqQ6WUCCUKRFA1ug5bnYfZ23rPyDrJxjyVKHDm/Sn9pEJk/ZdECtrWBAEkUCDaD0xu
         W+c5e7GXXiUMU4wIYwieqyJOcnWhmAr6U+tK2GjdghoqjKgWg7tQqgUzyjrEyNQcjrAg
         gbXgdxXV/9hf0wzSzXEENP8MdoXf254UfaTIKTYY6ixR9WzA+VDZMttbbpKhnsqk6ms9
         49oExH0LOL7XDTekk0Bf6skpE5wQEbenzypA3abRhGv6wemeJGhXp+qXEHTxSSlfnNmT
         KdVWlYWA/BlbD3BkhIJj0ixO3vffM3FA+JI07xXTp4HH4R4NyFEQutAQb87hXe2waBJe
         My0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=28j0ywRvd0DPTH5nKq+XykZEDhxxnfuiSsNuNHFkE6Q=;
        b=R8TkU6NmjdQOzjLxegwSxo9UvNL9oQrfpnRd0t5PlWB6oGyG3QGqokjfsvvgD6jHyx
         ulNHeRRygOodrx7cnvoDlGou7PZNAh7V1XhcLHcw/cb+2ypAAIdvxNRj17I57UdnJm52
         j7jDQdUtIqY72AFH8keMVwxXLVtvXU185fWzW461vVlKDLjkrZlaDY7MIbIZLTYqxL7J
         b/4hUuILZiNgUR8qm1ZqbmWoAYa5lqFGZYZD6NzVjCOlCLudyYIdyzPIfs0mGO6Q0z53
         e2wYHmxsp2Fl6lR61sonqwBCEpPoo0yJxQlSsYFpHAvpLD77TvUd2Ud5iDpAPfVrqytZ
         vdmw==
X-Gm-Message-State: AOAM532yfaw3pAH1tn5YK7ghU0zDdEGcgU5e4V21Bh+3FG9wtD/mkUEG
	uZ8zVpP+7tWtRz18SDxCsM+2kGj/yOYELQ==
X-Google-Smtp-Source: ABdhPJwrONSep2cs/WWCsa2cTNJLIdaXQUDO5okrsTWobQC4tpVTsXRPiegqJnnoVaNjWtpSJbU0ag==
X-Received: by 2002:a17:90a:2c09:: with SMTP id m9mr1332456pjd.212.1626228805725;
        Tue, 13 Jul 2021 19:13:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::5593])
        by smtp.gmail.com with ESMTPSA id f5sm458321pfn.134.2021.07.13.19.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 19:13:25 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] systemd: Fix libseccomp testcase involving __NR_ppoll
Date: Tue, 13 Jul 2021 19:13:22 -0700
Message-Id: <20210714021322.1245535-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210714021322.1245535-1-raj.khem@gmail.com>
References: <20210714021322.1245535-1-raj.khem@gmail.com>
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
index 37607708f7..f5022a99c2 100644
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


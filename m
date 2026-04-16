Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32207F8DFFD
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:27 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28578.1776378799391720682
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=r4JSrgKj;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so508675e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378797; x=1776983597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kK7I/Dj6jEptH08CVaYYpmC8ZWnGsKlnT4Wcpctu+Ww=;
        b=r4JSrgKjeKP5yNsnIvl49bvDARvKvJ2KnQzCZBlaj9q1VnIHmQk2MEoX6UiKQNF58W
         qw5Ht7pV2zxDm4wWJCmCnAZ8Ou5I5fJzmC4OdVAG8l7atYsDAKkPznoA5iw94fmZMUpU
         P2elrbig7GAX/tfjFbk8kMY2iH1bgxN07OCcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378797; x=1776983597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kK7I/Dj6jEptH08CVaYYpmC8ZWnGsKlnT4Wcpctu+Ww=;
        b=CZUyR2MBbKeVMn67GleQ2iJipDj3+1ZJ5ODMrLgsnTe0LJlbmJoVhju0GW3A+7wvFU
         MQPwHVllyed0a/TzOFguE4tvEgcWC1h7D0CmHYDGAG7tCyyz8L11w4Z3z/AMN4u75Zak
         0vinJ5X4ioXkuZhwQtlXZPDlUu6MiqmkTuNhTEnUsOjRtwe57BD00GDulF3y8faEYRHk
         i0CvSvpjSVC6PQUQnqPi2K8XpQlbeh0IICBt4TunDg6crxNfMopJmBLsJZ0WBMlmlAUl
         dYF4WyTAU6O9lZBTC4D+dc5MQkft4QcffKzYpaSImKxM9FIBycO2pbJBe40p587jbbmu
         A34Q==
X-Gm-Message-State: AOJu0YxP3JK4g0t1lHSEupzkMQ+GFwiflEJolk1MnPkMhnsUzV9lqPdv
	wc1Yh15MG4ASd9FYomwKeazj4TldjQGMQjS2KKzbKWFBDxwdw2LlW8n7YGutl40biJR89AebR9L
	13Mpg+oTP4VD3
X-Gm-Gg: AeBDievnzfYmS8Uxuz6Jdse8f00NS5vp3iDH/PhKIR5+zN1b7UIDik6FfjQwTuH0DLz
	NnS1ff94dmJwKegEtgZJ0dxKFnYcWYSl+M8GXmTX3QZBgdQOTb29lr9DsfoUn7p41R2PPsv55In
	gjXL2NoZp7tOSJ/OtaZLvNhgwYtSpeQUGWkz7hXBS7ev45NbfT/rldJJ7CjnIhvF3ckLIJCaIDe
	Pgu7YRuKNJq3E7LUlzzuNYvy+ypzZU7pWdjLRu7u6e8oBOgxwgVMiIXjTWVJYY8id2lhn12Qom/
	td40oxT1sZNAhRCxLMWqJDd3FaYfkB0NdlieU0eAyGbmfLuE20DSxQsT+sJ0dBXucMNPkx5uolz
	wZm88axgyP5IFjLSha++1iQ1UnJJ04/HPb6PamlcMizGH8vn01uZsG0jWa3a9TgjeGIR3Xgyd8X
	38f28zse4EXscd7xVCY3xEVHlV7i7UvLXw/EPjhz8aWgxkp4ML9gJPxNH3aH2AD9c3LL31wT8gi
	iaexbs1O1hgmRzXpHGqbvDUSHJzHb1Amr0/qw==
X-Received: by 2002:a05:600c:4750:b0:486:fdba:f5db with SMTP id 5b1f17b1804b1-488fb6e7316mr6577565e9.0.1776378797489;
        Thu, 16 Apr 2026 15:33:17 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 29/51] glibc: stable 2.42 branch updates
Date: Fri, 17 Apr 2026 00:30:12 +0200
Message-ID: <6261f1fb32d248ab3b242642674b913039d01758.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235458

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

$ git log --oneline 912d89a766847649a3857985a3b5e6065c51bfd4..a56a2943d2ce541102c630142c2eae0fbfc5886b

a56a2943d2 tests: fix tst-rseq with Linux 7.0
68099ccc94 elf: parse /proc/self/maps as the last resort to find the gap for tst-link-map-contiguous-ldso
426378547e resolv: Check hostname for validity (CVE-2026-4438)
8e863fb1c9 resolv: Count records correctly (CVE-2026-4437)
1a19d5a507 posix: Run tst-wordexp-reuse-mem test
9cd9c90544 iconvdata: Fix invalid pointer arithmetic in ANSI_X3.110 module
ebd45473f5 nss: Missing checks in __nss_configure_lookup, __nss_database_get (bug 28940)
937ef7aaf3 Linux: In getlogin_r, use utmp fallback only for specific errors
3989780591 nss: Introduce dedicated struct nss_database_for_fork type

Testing Results:
+--------------+--------+--------+------+
| Result       | Before | After  | Diff |
+--------------+--------+--------+------+
| PASS         | 6934   | 6938   | +4   |
| XPASS        | 4      | 4      |  0   |
| FAIL         | 76     | 75     | -1   |
| XFAIL        | 16     | 16     |  0   |
| UNSUPPORTED  | 108    | 109    | +1   |
+--------------+--------+--------+------+

Changes in testcases:
+------------------------------------------------------+--------+-------------+
| Testcase                                             | Before | After       |
+------------------------------------------------------+--------+-------------+
| elf/tst-glibc-hwcaps                                | FAIL   | PASS        |
| elf/tst-ldconfig-soname                             | FAIL   | PASS        |
| nptl/tst-thread-affinity-pthread2                   | PASS   | FAIL        |
| nss/tst-nss-malloc-failure-getlogin_r               | N/A    | UNSUPPORTED |
| posix/tst-wordexp-reuse-mem                         | N/A    | PASS        |
| resolv/tst-resolv-dns-section                       | N/A    | PASS        |
| resolv/tst-resolv-invalid-ptr                       | N/A    | PASS        |
+------------------------------------------------------+--------+-------------+

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.42.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 9991c024953..9f1003570d7 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.42/master"
 PV = "2.42+git"
-SRCREV_glibc ?= "912d89a766847649a3857985a3b5e6065c51bfd4"
+SRCREV_glibc ?= "a56a2943d2ce541102c630142c2eae0fbfc5886b"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.42.bb b/meta/recipes-core/glibc/glibc_2.42.bb
index a8717c0eae2..7e0aa3d5fc5 100644
--- a/meta/recipes-core/glibc/glibc_2.42.bb
+++ b/meta/recipes-core/glibc/glibc_2.42.bb
@@ -17,7 +17,7 @@ Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, m
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
-CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915"
+CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-2026-4437 CVE-2026-4438"
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
 DEPENDS += "gperf-native bison-native"


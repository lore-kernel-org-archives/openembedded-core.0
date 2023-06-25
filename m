Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A644EC04E69
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 21:22:57 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.20345.1687728171421582741
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 14:22:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=VBAEWdiZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3fa7cd95dacso32906045e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 14:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687728170; x=1690320170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LaB4iIcYWFXa3BxqleE2dSixh617amAsAFwYEkJ1Q8=;
        b=VBAEWdiZ+5mZgl/5LUkY+XWJIgXRkd9vM/q/VZccyMtnODrPqQKyg/v5fwmNcuUskB
         PbIfUbORbhByGv6kQHnYhviPl5/FzLey3Mvf5T2MXD8r4+FRkyuLEwyDKM4egEdifubt
         3UbjC0mwjpGHLADA5N7/5ynd3TEy51KPBEdue0T5A6c0na5qBoenWA2oQ62DP25H9z2E
         oYnQ/kltt7SPAbo5Z8qT0EfrRVqahSdxUwTB3od33fXifsgVvBdQLAux9jvgoabJY/6P
         r8nFLCSytOAw+ZTsaKHMK3KpdYGajLb9I+VzC4vFJvTLhGwEjKo0BnqMRrjy0T/xG0W/
         X0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728170; x=1690320170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0LaB4iIcYWFXa3BxqleE2dSixh617amAsAFwYEkJ1Q8=;
        b=QIGwvpNe+t96dBrUhr4Vy1PDMxo4rpaxB5+6xuTNwIcZY1PoDoBuhbMoiOOEcoBgA4
         RvYdg9O+XSAW8z9BKy/e1HOJK4Oq7MwFBvePID+QS5JJYCH1JjP30QkxEvrMPJ+pTq/b
         +h4NHbkODgra3gjxeUYGsFR6BNTSokbyITysUBmwh3XMEGN6JmyI2/4FSFhwdDGHZ6AH
         sMTo9K5WFbOgdBwpzbbeUx0G86WSLX4rsjZiwLYqh6P0Yo9yuSwMXLT2sugU5yGz/09O
         fXqtzi7XLp32Rtg+WjgKJdLn3z2Jr2niDJyYimq2Fh4vy7tzeQ0fVawR1OvTz6MuqwBP
         NQXA==
X-Gm-Message-State: AC+VfDwuaA9vNvZgnd+wio5lyAK9Sxeh008kHJsFOtJTIzlz6vkoqQb2
	nFnSo1viiK5NtNSuYo9LJ9EY3tZ+QoyruQ==
X-Google-Smtp-Source: ACHHUZ4/75Ly1wJ3Z1quegZrTjMA8xnWaAYCMiQ8iRbUp+CivbJOUZvBaPoscltv1xzaaRvQe2whdQ==
X-Received: by 2002:a7b:cd97:0:b0:3f9:c1b:83c3 with SMTP id y23-20020a7bcd97000000b003f90c1b83c3mr17877716wmj.2.1687728169665;
        Sun, 25 Jun 2023 14:22:49 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id q9-20020a056000136900b0030f9c3219aasm5426736wrz.47.2023.06.25.14.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 14:22:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/21] diffutils: update 3.9 -> 3.10
Date: Sun, 25 Jun 2023 23:22:30 +0200
Message-Id: <20230625212241.915739-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230625212241.915739-1-alex@linutronix.de>
References: <20230625212241.915739-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 21:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183385

Remove the comment addition from the patch body, as it
increases likelyhood of rebase conflicts, and repeats what
the commit says.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...001-Skip-strip-trailing-cr-test-case.patch | 19 +++++++------------
 .../{diffutils_3.9.bb => diffutils_3.10.bb}   |  2 +-
 2 files changed, 8 insertions(+), 13 deletions(-)
 rename meta/recipes-extended/diffutils/{diffutils_3.9.bb => diffutils_3.10.bb} (93%)

diff --git a/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch b/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch
index 8b88c308f21..32793233f9f 100644
--- a/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch
+++ b/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch
@@ -1,4 +1,4 @@
-From 027229d25392b22d7280c0abbc3efde4f467d167 Mon Sep 17 00:00:00 2001
+From f31395c931bc633206eccfcfaaaa5d15021a3e86 Mon Sep 17 00:00:00 2001
 From: Peiran Hong <peiran.hong@windriver.com>
 Date: Thu, 5 Sep 2019 15:42:22 -0400
 Subject: [PATCH] Skip strip-trailing-cr test case
@@ -12,23 +12,18 @@ Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
 
 ---
- tests/Makefile.am | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
+ tests/Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index d98df82..757ea52 100644
+index 79bacfb..4adb4d7 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -21,9 +21,11 @@ TESTS = \
+@@ -22,7 +22,6 @@ TESTS = \
    stdin \
    strcoll-0-names \
    filename-quoting \
 -  strip-trailing-cr \
    timezone \
-   colors
-+# Skipping this test since it requires valgrind
-+# and thus is too heavy for diffutils package
-+# strip-trailing-cr
- 
- XFAIL_TESTS = large-subopt
- 
+   colors \
+   y2038-vs-32bit
diff --git a/meta/recipes-extended/diffutils/diffutils_3.9.bb b/meta/recipes-extended/diffutils/diffutils_3.10.bb
similarity index 93%
rename from meta/recipes-extended/diffutils/diffutils_3.9.bb
rename to meta/recipes-extended/diffutils/diffutils_3.10.bb
index 2bb9e6f32d8..08e83056127 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.9.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.10.bb
@@ -8,7 +8,7 @@ SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz \
            file://0001-Skip-strip-trailing-cr-test-case.patch \
            "
 
-SRC_URI[sha256sum] = "d80d3be90a201868de83d78dad3413ad88160cc53bcc36eb9eaf7c20dbf023f1"
+SRC_URI[sha256sum] = "90e5e93cc724e4ebe12ede80df1634063c7a855692685919bfe60b556c9bd09e"
 
 EXTRA_OECONF += "ac_cv_path_PR_PROGRAM=${bindir}/pr --without-libsigsegv-prefix"
 
-- 
2.30.2



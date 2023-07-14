Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D485FC001B0
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 22:33:28 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.799.1689374000930471702
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 15:33:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=CCQAFDIG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b890e2b9b7so14620545ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 15:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689374000; x=1691966000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bvJlp18WDYdWsX8aT1asA+f5A2OsOcL+DLGAzUAlSWw=;
        b=CCQAFDIG3dRQ5OTUf29FtErb1xvjbGqS+nb1KsUWqI9EF1x6A06PQvBY3GF4oOxRot
         TtYtBmrqg8BxYv8cav1osEKrqryFkUofonlnHhn23dMaS2TMN75BoSUhVuG91VQYkQei
         uLouPOnmeriKEYXsYYr2X/dKpn037SaoEO6X1nHC1yV2NapZK2HQfZyYSPNJim9YVHr3
         8uCUlC1Ix6WGYiA3jsoFZwRdjy+DBCM/mot2J6Y5JKjFcM9Hzugr0g94GExa0lmODhrh
         oDORqNLiZ3RZePKWSWWG+BV2MWa0PHahDDf3YXMbOIfhDovtjl/508gU2X6eM9mD9MtS
         /3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689374000; x=1691966000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvJlp18WDYdWsX8aT1asA+f5A2OsOcL+DLGAzUAlSWw=;
        b=PopI502hFn4MLfAW0i9kIA6QOFasDW27DZ4HfLdmvGEDTIO5rk9uom4CD42pgjZrLz
         +zqEvZLp+rFdwUInkQv7NllsxxJeLd278rsKg6zhXbmy+U/upU+x5qbROY8U9/fAmi6G
         goYNsj5XgQdIjrw8RFb3NLytL/YpV7RVmT404krajXeRgSrG1Ttp45FfhVTSMZl30/Ph
         feXNaSRNHXR8pbTtxqHckPamMN/Vy02GFrwxGb9B8udsKLqE08VaG7lrbxkwf42gWh7z
         hg1Ecf9J8QSYfIfhLh/kl7GDgTaSKYv5VoihIgSPGtiYP5DJMRHDyyDjWK59e1hnSWZk
         s4VA==
X-Gm-Message-State: ABy/qLZAgt0SoYgDU9rs2KFT7Lc9cpJI+LNqjjlXDl4YreQltoFuHQlq
	9xBeeZ+oaLCueBxxO/wd/LDNai/4CMMk39AkczQ=
X-Google-Smtp-Source: APBJJlEiMcF+Srs/5gCJX0WDRkYjHO87fv+ce34NDHileSM4JTsffqod8tR6QI1nPuJ68zdhimMA/Q==
X-Received: by 2002:a17:903:41d2:b0:1b8:ab0d:cd5 with SMTP id u18-20020a17090341d200b001b8ab0d0cd5mr5249911ple.49.1689373999784;
        Fri, 14 Jul 2023 15:33:19 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902788100b001b80760fd04sm8236782pll.112.2023.07.14.15.33.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 15:33:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 05/26] diffutils: update 3.9 -> 3.10
Date: Fri, 14 Jul 2023 12:32:39 -1000
Message-Id: <21e40166870fadee986fb36be80019d3bcdb69e5.1689373876.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689373875.git.steve@sakoman.com>
References: <cover.1689373875.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 22:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184287

From: Alexander Kanavin <alex.kanavin@gmail.com>

* Noteworthy changes in release 3.10 (2023-05-21) [stable]

** Bug fixes

  cmp/diff can again work with file dates past Y2K38
  [bug introduced in 3.9]

  diff -D no longer fails to output #ifndef lines.
  [bug#61193 introduced in 3.9]

Remove the comment addition from the patch body, as it
increases likelyhood of rebase conflicts, and repeats what
the commit says.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 925155acc6922f7e9df2afa45e79ad1b2c57ba24)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...001-Skip-strip-trailing-cr-test-case.patch | 19 +++++++------------
 .../{diffutils_3.9.bb => diffutils_3.10.bb}   |  2 +-
 2 files changed, 8 insertions(+), 13 deletions(-)
 rename meta/recipes-extended/diffutils/{diffutils_3.9.bb => diffutils_3.10.bb} (93%)

diff --git a/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch b/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch
index 8b88c308f2..32793233f9 100644
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
index 2bb9e6f32d..08e8305612 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.9.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.10.bb
@@ -8,7 +8,7 @@ SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz \
            file://0001-Skip-strip-trailing-cr-test-case.patch \
            "
 
-SRC_URI[sha256sum] = "d80d3be90a201868de83d78dad3413ad88160cc53bcc36eb9eaf7c20dbf023f1"
+SRC_URI[sha256sum] = "90e5e93cc724e4ebe12ede80df1634063c7a855692685919bfe60b556c9bd09e"
 
 EXTRA_OECONF += "ac_cv_path_PR_PROGRAM=${bindir}/pr --without-libsigsegv-prefix"
 
-- 
2.34.1



Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF97FC04A94
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:01:21 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.78389.1690740078636393203
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ZhtEW4mO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-686e0213c0bso2566864b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740078; x=1691344878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5g/34/5CwiGN298XSieFIynqz2HddfKv1uBMqPa1hU=;
        b=ZhtEW4mOMAXvdCHWzKUESl0/fIRVXAJ0cuGbbVFfK7TaSailwSXSCxKcVIJ53hRZr8
         adAmNPzKAl2I38pmvGZwIrDOpzfydQUqM0xNamNRoZGjlTHU0k/iclLM6Inbaiq6c/7V
         Qwu3DmcESR8Az527EgnTm452gt7YCzzIbhCrniK0MPic/kRS2qdN3MUCF+U1sH0aUN31
         ytp/KRO1HLjSXSCLU4sPII23Kce1L9y/rotKuXAjhsfShhu/SEYi2FNoo4Del+uEaJFi
         sQjdnXYj6cgYK/mZ+SjPEylGqnhFO074M4JtxxRCTktFJt9CaNxIodwNhGn5VqtbAMlE
         eVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740078; x=1691344878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5g/34/5CwiGN298XSieFIynqz2HddfKv1uBMqPa1hU=;
        b=Bg1/IcsbCWoVgq/psYb04nrIuCJeXubmQE3AkZqKswxeXYm/Jm0Wm8RNjvDWHvzhdn
         lS3x7tKyLxJEZsoGs/Nk3ImH6CFZKxMTrhBlHecPbK0aaDxPrIsDO8iIs34AYcZEEKTU
         FHdocGcnly+7RJPh0gSAxrcyfLEkbYF9wl2oI7zBL/ZwzsfRq/3OZ5mrqfiuP5brlMml
         kWlMvaCVnhq8CDsdvgPW+hC1a7oZDBt4jo9FJxy4RDLWorjHM5HJ2Yg9GWOcKmYSShyr
         xgLoa2PMdBARbe9YFiAWZI/JF89UPwlplQOyizOfJKuMKR9oMP66ZANmeQFt6E+BIl7l
         SeCg==
X-Gm-Message-State: ABy/qLbJ2KkLcrvF9t2gGR0gv1rUXORtWtPzv6WvdxHPzEnRWPwOb+Lv
	3dZcwoZnN3JuZnG/o6+pKBJrNOtEpN0mCs/3eafKCA==
X-Google-Smtp-Source: APBJJlGW0P5TuB/AQtpCpHiDLN/0i44MKrAvJGI15toJb/GI0IRslS3Q4FOXeEbaYA8fhCuDHpKFvA==
X-Received: by 2002:a05:6a00:a20:b0:67b:f249:35e3 with SMTP id p32-20020a056a000a2000b0067bf24935e3mr8818139pfh.26.1690740077742;
        Sun, 30 Jul 2023 11:01:17 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.01.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:01:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/30] diffutils: update 3.9 -> 3.10
Date: Sun, 30 Jul 2023 08:00:33 -1000
Message-Id: <ab9ae300ce3895cdf64d207b5dc281b65c984211.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690739937.git.steve@sakoman.com>
References: <cover.1690739937.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:01:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185088

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
(cherry picked from commit 21e40166870fadee986fb36be80019d3bcdb69e5)
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



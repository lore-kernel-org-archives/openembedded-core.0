Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 239B2C001DB
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 21:19:09 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.93767.1691961541140431411
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 14:19:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=K+jCZLoB;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-26b4c6a5e61so580181a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 14:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691961540; x=1692566340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7z4reaK5/vTt9P5ZAzzcjAcAz2jBKQNHP5r2YSOy6s=;
        b=K+jCZLoBOQyzbXdvA3M0lTe4iKXcpREpk7vB09TP5MXXO36CA6IKNIMat9SFCo9p5A
         O8OCln69gHRMkVd6nI0UBRIBbISgSlqcvQCZmKqWqNqqCkQaPtIcx4a+TP7U5JOGSIY/
         Zv2Oiqi2IuDXdUpOdImKQOiP+aQfybZkC7QeJAdI6vWUcGMDCHhbINB+eGogOpxhPEww
         wO8mFFwgh1kKM6oQpCEfcWJ8LdiG8viRy3sjlQ95KykaahbOCNx3iP7wcAOri0ldR4ss
         MjjdQ/cg9jSMifVssTkr4qKdKpt0S9owoSWJb1IpgOaj8MYEB7Ts1G9Yv/Zwu2+TZXD+
         +LSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691961540; x=1692566340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7z4reaK5/vTt9P5ZAzzcjAcAz2jBKQNHP5r2YSOy6s=;
        b=aQzpO96M5k3GxBMnM4zjaFdHh4tx8zs5WbHJZaoujCFLKWucNpKR1v2SBG0bTO26f6
         XKvRedzK92CFqWzQ2yzCsqwHa56gzHLW9PuEDD7MKdEwE0ZZTaTygEIGgHzRT/FjQscJ
         kv+FwPumlS4qtJsqQvqdnNmYpaJsLO9KWg9uBE53+NoXvu2V5cJzYFcKTLY59Riy2iTO
         vTGQC2YzYe6gGiXHQegFOakR7lQcsa4iictEQxE9Ira8tjHKQnmmu7CJCqHcWNR5PZjt
         wDSXMOpNVrvRBexqu9fKywZmKN6wDbtrvD6W2nbyGUD6LojOseoHQ6ZjKnsgbIhEAIak
         uMkw==
X-Gm-Message-State: AOJu0YyuG8JYxwBUwHoaRVyOLBMuPGoXTbGzAe8OreVREhtaSyK/tLo4
	o1dj3ABnhgWGGhfhGqNjV29eKWRT9YoP6BReBn7uHw==
X-Google-Smtp-Source: AGHT+IHUI3+yyRKLBejM92zeG+cL4HxYxNIt8rXEm+dHoylCoTTSnf2oIfjD3LmSWKMzU0gPj2GflA==
X-Received: by 2002:a17:90a:294e:b0:263:9816:fe0f with SMTP id x14-20020a17090a294e00b002639816fe0fmr6957206pjf.15.1691961540281;
        Sun, 13 Aug 2023 14:19:00 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id qa2-20020a17090b4fc200b00263dfe9b972sm8690578pjb.0.2023.08.13.14.18.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 14:18:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/22] libpcre2: patch CVE-2022-41409
Date: Sun, 13 Aug 2023 11:18:12 -1000
Message-Id: <c25b88fc321b7c050108b29c75c0a159e0754f84.1691961051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691961051.git.steve@sakoman.com>
References: <cover.1691961051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 21:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185897

From: Peter Marko <peter.marko@siemens.com>

Backport commit mentioned in NVD DB links.
https://github.com/PCRE2Project/pcre2/commit/94e1c001761373b7d9450768aa15d04c25547a35

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libpcre/libpcre2/CVE-2022-41409.patch     | 74 +++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.34.bb |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2022-41409.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2022-41409.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2022-41409.patch
new file mode 100644
index 0000000000..882277ae73
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2/CVE-2022-41409.patch
@@ -0,0 +1,74 @@
+From 94e1c001761373b7d9450768aa15d04c25547a35 Mon Sep 17 00:00:00 2001
+From: Philip Hazel <Philip.Hazel@gmail.com>
+Date: Tue, 16 Aug 2022 17:00:45 +0100
+Subject: [PATCH] Diagnose negative repeat value in pcre2test subject line
+
+CVE: CVE-2022-41409
+Upstream-Status: Backport [https://github.com/PCRE2Project/pcre2/commit/94e1c001761373b7d9450768aa15d04c25547a35]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+---
+ ChangeLog            | 3 +++
+ src/pcre2test.c      | 4 ++--
+ testdata/testinput2  | 3 +++
+ testdata/testoutput2 | 4 ++++
+ 4 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index eab50eb7..276eb57a 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -7,6 +7,9 @@ fully read in caseless matching.
+ 24. Fixed an issue affecting recursions in JIT caused by duplicated data
+ transfers.
+ 
++20. A negative repeat value in a pcre2test subject line was not being 
++diagnosed, leading to infinite looping.
++
+ 
+ Version 10.34 21-November-2019
+ ------------------------------
+diff --git a/src/pcre2test.c b/src/pcre2test.c
+index 08f86096..f6f5d66c 100644
+--- a/src/pcre2test.c
++++ b/src/pcre2test.c
+@@ -6700,9 +6700,9 @@ while ((c = *p++) != 0)
+       }
+ 
+     i = (int32_t)li;
+-    if (i-- == 0)
++    if (i-- <= 0)
+       {
+-      fprintf(outfile, "** Zero repeat not allowed\n");
++      fprintf(outfile, "** Zero or negative repeat not allowed\n");
+       return PR_OK;
+       }
+ 
+diff --git a/testdata/testinput2 b/testdata/testinput2
+index 655e519..14e00ed 100644
+--- a/testdata/testinput2
++++ b/testdata/testinput2
+@@ -5772,4 +5772,7 @@ a)"xI
+ /(a)?a/I
+     manm
+ 
++--
++    \[X]{-10}
++
+ # End of testinput2
+diff --git a/testdata/testoutput2 b/testdata/testoutput2
+index c733c12..958f246 100644
+--- a/testdata/testoutput2
++++ b/testdata/testoutput2
+@@ -17435,6 +17435,10 @@ Subject length lower bound = 1
+     manm
+  0: a
+ 
++--
++    \[X]{-10}
++** Zero or negative repeat not allowed
++
+ # End of testinput2
+ Error -70: PCRE2_ERROR_BADDATA (unknown error number)
+ Error -62: bad serialized data
diff --git a/meta/recipes-support/libpcre/libpcre2_10.34.bb b/meta/recipes-support/libpcre/libpcre2_10.34.bb
index 254badf6f6..3e1b001c32 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.34.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.34.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/pcre2-${PV}.tar.bz2
            file://pcre-cross.patch \
            file://CVE-2022-1586.patch \
 	    file://CVE-2022-1587.patch \
+	    file://CVE-2022-41409.patch \
 "
 
 SRC_URI[md5sum] = "d280b62ded13f9ccf2fac16ee5286366"
-- 
2.34.1



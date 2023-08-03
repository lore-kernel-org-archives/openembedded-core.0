Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC3F2C04A6A
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 14:04:28 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.15483.1691071463867136719
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 07:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=P6IzGlYU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-68706d67ed9so698647b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 07:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691071463; x=1691676263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OfjuUJMCss61aIuL6CLDn5sMcz6Bq8cPfyI12jJPJ2Y=;
        b=P6IzGlYU5onVsFrcCZkUDHCU4OeGCXEUJrk7jB46EXrs5EiyAmZJAIQVtGfDv4ii6j
         MNk8KoZ7P8qrsohZT/JpTaBXBcgHwtkAOgllcXNdcxxinnMhIGynrIi81Ob3yp9y97Am
         BXume6yBbX34V5BX488P16hS/ZQ2SDGtQ5wQ3VKJYmW6BGJZjBlSZuMK5zbYO8XRRAdd
         zguo+Og8pYWM0X0qy9TGu8fnYC/kR/0iOSdugguTVkWGE3IT2b7cSJfBmoEIjhVKOWuH
         THIug5rJKb84qcma1b5xYRLQR+4aHD1XdFZHArXIeTtFMRG01xSGHCXObkpUnoz57Fl9
         ul0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071463; x=1691676263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OfjuUJMCss61aIuL6CLDn5sMcz6Bq8cPfyI12jJPJ2Y=;
        b=QaG+c8dEFafUmSHfOt5nHLnplga3LHDKHEuBBikiThoQLt8p7ujpkFDqolFbpcSKXZ
         WOXEMduuZWfgWwfKGrTg78VQmorh5IE8zhMj2e2riRUVqcerQt1ndq7gDvTrgvJWcDqS
         z1IMi3t41++CHhmdSRRGOGj2yRNKtpfe0oj7Q9tEwOi/M5laJSwbaNORdNT4UaF4hh0x
         OphyqPLxA7BX6YFDctYuOIk3LSwzYrwoXM29qJhV4p4dDYEKvBGtk6MtqoI4frmFZcWb
         BrA6Hlhg4Nogvf3JHrnWinIU3IbiO6OfIzR6dyzYar30ONRBp8PKv0QXcotLYSuMLqci
         Yx4Q==
X-Gm-Message-State: ABy/qLZNLPP754LVxmw3KH1oEPtXRAMGwByMVEFMTSt21K0krL+6lwsW
	S5cGBHb3MbEVfZ4BGN4Yl3C2XFSeVzgupgeg9YA=
X-Google-Smtp-Source: APBJJlGoUFKlHt08fCrzd+NzYK0J16nqWwFialaZDc+13YssMCdkJz5X3CFTwyoZ8Ab4ElAnfisZFQ==
X-Received: by 2002:a05:6a20:659:b0:137:6958:d517 with SMTP id 25-20020a056a20065900b001376958d517mr16605299pzm.24.1691071462568;
        Thu, 03 Aug 2023 07:04:22 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j8-20020aa78d08000000b006828e49c04csm12866242pfe.75.2023.08.03.07.04.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 07:04:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/10] libpcre2: patch CVE-2022-41409
Date: Thu,  3 Aug 2023 04:04:05 -1000
Message-Id: <410cdbc70cfba709ec5bef508e772f52514ba28a.1691071255.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691071255.git.steve@sakoman.com>
References: <cover.1691071255.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 14:04:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185480

From: Peter Marko <peter.marko@siemens.com>

Backport commit mentioned in NVD DB links.
https://github.com/PCRE2Project/pcre2/commit/94e1c001761373b7d9450768aa15d04c25547a35

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libpcre/libpcre2/CVE-2022-41409.patch     | 75 +++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.40.bb |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2022-41409.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2022-41409.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2022-41409.patch
new file mode 100644
index 0000000000..833348cdf1
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2/CVE-2022-41409.patch
@@ -0,0 +1,75 @@
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
+index eab50eb7..276eb57a 100644
+@@ -1,6 +1,9 @@
+ Change Log for PCRE2
+ --------------------
+ 
++20. A negative repeat value in a pcre2test subject line was not being 
++diagnosed, leading to infinite looping.
++
+ 
+ Version 10.40 15-April-2022
+ ---------------------------
+diff --git a/src/pcre2test.c b/src/pcre2test.c
+index 08f86096..f6f5d66c 100644
+--- a/src/pcre2test.c
++++ b/src/pcre2test.c
+@@ -6781,9 +6781,9 @@ while ((c = *p++) != 0)
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
+index d37d8f30..717ba2ae 100644
+--- a/testdata/testinput2
++++ b/testdata/testinput2
+@@ -5932,4 +5932,7 @@ a)"xI
+ /[Aa]{2,3}/BI
+     aabcd
+ 
++--
++    \[X]{-10}
++
+ # End of testinput2
+diff --git a/testdata/testoutput2 b/testdata/testoutput2
+index ce090f8c..d2188d3c 100644
+--- a/testdata/testoutput2
++++ b/testdata/testoutput2
+@@ -17746,6 +17746,10 @@ Subject length lower bound = 2
+     aabcd
+  0: aa
+ 
++--
++    \[X]{-10}
++** Zero or negative repeat not allowed
++
+ # End of testinput2
+ Error -70: PCRE2_ERROR_BADDATA (unknown error number)
+ Error -62: bad serialized data
diff --git a/meta/recipes-support/libpcre/libpcre2_10.40.bb b/meta/recipes-support/libpcre/libpcre2_10.40.bb
index 3843d43b69..74c12ecec2 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.40.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.40.bb
@@ -11,6 +11,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=41bfb977e4933c506588724ce69bf5d2"
 
 SRC_URI = "https://github.com/PhilipHazel/pcre2/releases/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
+    file://CVE-2022-41409.patch \
 "
 UPSTREAM_CHECK_URI = "https://github.com/PhilipHazel/pcre2/releases"
 
-- 
2.34.1



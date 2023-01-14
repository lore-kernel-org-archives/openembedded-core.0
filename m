Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D94C678D7
	for <webhook@archiver.kernel.org>; Sat, 14 Jan 2023 15:49:33 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.118672.1673711371887205185
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 07:49:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K59eFKUJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id z1-20020a17090a66c100b00226f05b9595so12099527pjl.0
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Jan 2023 07:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkMIQ8GQWYVMzwCbV0509w8j+KdQSloUKl7foC82ip0=;
        b=K59eFKUJKd5n3QCxvVsMw87u9Pc8X4bKtFhtxqQIjLopsGgr/Wx3f8WmCHbLd8dNDv
         QPCssYcxdE8ULMXipiJilie5hUa4iqYUUeO8f7D1GZ2Mxow0tle2+TwAjK/YQAu/pp1u
         cvJnZHgPR6ArEgBs0QQmDu/WBi3GiLOBkyd0N1AJAdHopb/TFsNyQJCXm8wDOkLoyZLd
         3Hsa8WVAkqkaLeCMDc+Kw3x/AP5ZZkAeuHiwxMKxPyoOYZf3pKZ8lm+nbBzb/cfyqD1n
         sRnFvpuzLhrV7NxrH1etnqCPybSMUTa02yhd99bm0S/XwF65Greal89f4Msfl1bF7bEb
         /e9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OkMIQ8GQWYVMzwCbV0509w8j+KdQSloUKl7foC82ip0=;
        b=FD7UDScTzmp6H33zNsCe58J7zP9VSC3FI5aOZmP1oQQnNYnjKjTa9xATGz0yseeZOI
         YaRgWkB1ouqJI1iR/f2veYVL0tLZyIkMNjm8v9WbqyouGQu5bgySBGBVsMTm5igScpUo
         +D2BHNY+eWVa3QFNbshSOsGzRCIut8s4PdeddldFQVzw9TXj3eCmpsKJBW8TVqgqykDM
         6vNy9jsHi7Gr593J4oLyxjH6RE2muJdCprCzxSJ6olGL7RA31ryz+cRfu+gUuUhHLksy
         Uanm7f8L0VNCk++638RTJMT99E1Zeu8RUgIuV+/BGA8Da6Hk7vflAba6UCRfJGqBpZC5
         sdhQ==
X-Gm-Message-State: AFqh2koT8Pb7h7FNEZljWMCH8PFEv0dbf0DQ6QhKNIt6nDKsmMcIE4JM
	4S7Hs0ll9GceVrqwd5q7BKLc2FBTzQiIzg==
X-Google-Smtp-Source: AMrXdXvKe8gBRY7vo3QIxufrDk9DucCFfKNEfT+9/pyeaxj5rKvBgxeloAtrX/XUP1/JTO4hqvzKlw==
X-Received: by 2002:a05:6a20:8b28:b0:b2:637a:2b78 with SMTP id l40-20020a056a208b2800b000b2637a2b78mr15269771pzh.32.1673711370877;
        Sat, 14 Jan 2023 07:49:30 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id b7-20020a63eb47000000b00460ea630c1bsm13129200pgk.46.2023.01.14.07.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jan 2023 07:49:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/5] gperf: Make the code C++17 compliant
Date: Sat, 14 Jan 2023 07:49:21 -0800
Message-Id: <20230114154921.3757493-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114154921.3757493-1-raj.khem@gmail.com>
References: <20230114154921.3757493-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Jan 2023 15:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175854

Fixes
| ../../gperf-3.1/lib/getline.cc:58:7: error: ISO C++17 does not allow 'register' storage class specifier [-Wregister]
|       register int c = getc (stream);
|       ^~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Make-the-code-C-17-compliant.patch   | 29 +++++++++++++++++++
 meta/recipes-extended/gperf/gperf_3.1.bb      |  3 +-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/gperf/gperf/0001-Make-the-code-C-17-compliant.patch

diff --git a/meta/recipes-extended/gperf/gperf/0001-Make-the-code-C-17-compliant.patch b/meta/recipes-extended/gperf/gperf/0001-Make-the-code-C-17-compliant.patch
new file mode 100644
index 0000000000..96e70cdb36
--- /dev/null
+++ b/meta/recipes-extended/gperf/gperf/0001-Make-the-code-C-17-compliant.patch
@@ -0,0 +1,29 @@
+From 6194f0027045433598a61965758b4531a3d06d1f Mon Sep 17 00:00:00 2001
+From: Bruno Haible <bruno@clisp.org>
+Date: Sun, 30 Aug 2020 12:36:15 +0200
+Subject: [PATCH] Make the code C++17 compliant.
+
+* lib/getline.cc (getstr): Don't use the 'register' keyword.
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=gperf.git;a=commit;h=a63b830554920476881837eeacd4a6b507632b19]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/getline.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/getline.cc b/lib/getline.cc
+index c57c633..0984a7c 100644
+--- a/lib/getline.cc
++++ b/lib/getline.cc
+@@ -55,7 +55,7 @@ getstr (char **lineptr, size_t *n, FILE *stream, char terminator, size_t offset)
+ 
+   for (;;)
+     {
+-      register int c = getc (stream);
++      int c = getc (stream);
+ 
+       /* We always want at least one char left in the buffer, since we
+          always (unless we get an error while reading the first char)
+-- 
+2.39.0
+
diff --git a/meta/recipes-extended/gperf/gperf_3.1.bb b/meta/recipes-extended/gperf/gperf_3.1.bb
index 4c32a5dc83..c57ade9fe3 100644
--- a/meta/recipes-extended/gperf/gperf_3.1.bb
+++ b/meta/recipes-extended/gperf/gperf_3.1.bb
@@ -5,7 +5,8 @@ LICENSE  = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://src/main.cc;beginline=8;endline=19;md5=dec8f611845d047387ed56b5b85fa99b"
 
-SRC_URI  = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
+SRC_URI  = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
+            file://0001-Make-the-code-C-17-compliant.patch"
 SRC_URI[md5sum] = "9e251c0a618ad0824b51117d5d9db87e"
 SRC_URI[sha256sum] = "588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cdbb3ae2"
 
-- 
2.39.0



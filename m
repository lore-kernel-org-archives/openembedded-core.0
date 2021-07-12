Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.12651.1626103970187391562
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 08:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=bGCAalV0;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id oj10-20020a17090b4d8ab0290172f77377ebso239885pjb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 08:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=B/WrZU6SH0nfWYyS3poyWxosU3N1kQFS8oAvSWLl5/w=;
        b=bGCAalV0bSt/6bWgl/NXMUrKOULIg1HOTCnDdlQTrb6Qe38t0yKohAc1p4thuycP8N
         i3yrCLMAypB62nsUyTw0nMO1j6oEeqnePy83tqhDBKmuQRheIEXv7pT+uT+O/Bx258Gs
         1H/Cr6/8vbp6Ygo9JNK8nigH4PScWuJ1nk+dBHfJGCg5mYkppE3T+a/DAcxhgprc1ghT
         Ae3Mp6CNtW/eITiTTTjFrP7jpzNedBR1rX/zQ7ccTAILhKtXmmXMcqJVfYFMNIa0db/Q
         FNTQ/s6/NEhS1Jr0xafCDr+tGjIV0f4AHuVtzPbov6UwGhoAeoxqRPkwGlkaoAxDao4b
         VuAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B/WrZU6SH0nfWYyS3poyWxosU3N1kQFS8oAvSWLl5/w=;
        b=d40k22QhtOLyoWtMLeodZOYtsI08ned1xNLQQKmqSufnxd7dh/+xo6+f2KKjuzw17v
         Trj3BkE9ZRuBAs2LAW5JQ4gGziKFk4oJOQI46cceYOLjr6yqcyJKtpDtvB2xNXSvoZag
         Woxfo0Sl3BJxZxkJfhoWfEJbrSw1/mVC2LFjfRt/7KYKzsdH28fM8U2j+2wwZnu23wuu
         zbsVv9GSpI5vvInA81OVr9buZ8OOw6049fqapt3f9t663mTlm+HbTuqUUjtB5EirpcTu
         Cl8N1ijKWpuIQZ9TsTm5YoMvrBP+5J1aLUxAvnq+Kcnbo/GQFZf1RLaHOKeUrTyIt6q2
         w4ow==
X-Gm-Message-State: AOAM532bYC9DIUTOdyEvB48nPOL1EbH3iz7/Cv/MR3UulZv7k/2CUy4X
	TUQu7q2gQ8+RTTzl4BolqU2h/kYECV7TK1nP
X-Google-Smtp-Source: ABdhPJzdE1BWczSFOveUKj+FLoLd/JfdnUy0ajzzuwugDV1u3KaDOqbWi77XREN3TAWhy5IOo8gW1g==
X-Received: by 2002:a17:903:186:b029:129:5733:85c8 with SMTP id z6-20020a1709030186b0290129573385c8mr44302012plg.39.1626103969317;
        Mon, 12 Jul 2021 08:32:49 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n3sm16765942pfn.216.2021.07.12.08.32.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 08:32:48 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/12] dwarfsrcfiles: Avoid races over debug-link files
Date: Mon, 12 Jul 2021 05:32:01 -1000
Message-Id: <317e334518c6394ecba4a3fdd4ba18b185822d22.1626103708.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626103708.git.steve@sakoman.com>
References: <cover.1626103708.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We use dwarfsrcfiles in package.bbclass to list the source files used by a binary.
This is done before they're stripped and linked to debug symbols in separate files.

It is possible a binary may already have a link to separate debug symbols, e.g.
some of the test binaries in lttng-tools ptest. In those cases, the linked binary
may be changed by package.bbclass code whilst dwarfsrcfiles is reading it. That
would result in a rare SIGBUS race causing the binary to fail.

To avoid this, break the debug file search path so no other binaries are found.

Also fix a segfault if no binary is specified while here.

[YOCTO #14400]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit efef732859e265533acf16f2f4da3b29d50e0df4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../dwarfsrcfiles/files/dwarfsrcfiles.c             | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/dwarfsrcfiles/files/dwarfsrcfiles.c b/meta/recipes-devtools/dwarfsrcfiles/files/dwarfsrcfiles.c
index af7af524eb..9eb5ca807a 100644
--- a/meta/recipes-devtools/dwarfsrcfiles/files/dwarfsrcfiles.c
+++ b/meta/recipes-devtools/dwarfsrcfiles/files/dwarfsrcfiles.c
@@ -9,6 +9,7 @@
 
 #include <argp.h>
 #include <stdio.h>
+#include <stdlib.h>
 
 #include <dwarf.h>
 #include <elfutils/libdw.h>
@@ -83,13 +84,15 @@ process_cu (Dwarf_Die *cu_die)
 int
 main (int argc, char **argv)
 {
-  char* args[3];
+  char* args[5];
   int res = 0;
   Dwfl *dwfl;
   Dwarf_Addr bias;
   
-  if (argc != 2)
+  if (argc != 2) {
     fprintf(stderr, "Usage %s <file>", argv[0]);
+    exit(EXIT_FAILURE);
+  }
   
   // Pretend "dwarfsrcfiles -e <file>" was given, so we can use standard
   // dwfl argp parser to open the file for us and get our Dwfl. Useful
@@ -98,8 +101,12 @@ main (int argc, char **argv)
   args[0] = argv[0];
   args[1] = "-e";
   args[2] = argv[1];
+  // We don't want to follow debug linked files due to the way OE processes
+  // files, could race against changes in the linked binary (e.g. objcopy on it)
+  args[3] = "--debuginfo-path";
+  args[4] = "/not/exist";
   
-  argp_parse (dwfl_standard_argp (), 3, args, 0, NULL, &dwfl);
+  argp_parse (dwfl_standard_argp (), 5, args, 0, NULL, &dwfl);
   
   Dwarf_Die *cu = NULL;
   while ((cu = dwfl_nextcu (dwfl, cu, &bias)) != NULL)
-- 
2.25.1


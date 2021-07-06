Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.4492.1625568396384917250
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 03:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FqMbcnZd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id a5-20020a7bc1c50000b02901e3bbe0939bso1942242wmj.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jul 2021 03:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JKtivHkztX4udmLE5fT9X/FxFMfPSlbwv0VHYPysZfI=;
        b=FqMbcnZdYdvshk6F83+mhK4sUpcMr9+q8qtc9tWynw48gQcMowlYMpUQEenxHlrqh6
         pliiYm/TIHl00Hel+hGOvSXeraxovnaWtWKVgZ71N6g8qftn5D8SzBfSLptECFX3J2jO
         N8gn8qZoB5iuxFRbsV4WbF24vTOO6U/vOsD3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JKtivHkztX4udmLE5fT9X/FxFMfPSlbwv0VHYPysZfI=;
        b=eMzvSMUM1elXAUxS09vT8HkwDwveZXGACdp0ph8A0D3ZOiiQ/4YK6aeVcIApaELskd
         CbtoBMWZyv96nxSoaD8Yev+oVxbmaUDJJpyeKctGlCcNVRno4167WDgFPkQdi2xNcqLB
         LVAJPklpx5p7oBg5RO/QcCxjH1upIfrECW2a+s4RJ161m8B5LZGXA1tPmMlHsiylZfJN
         n6RJtMkpMJsmoBOfmxPeYQ1EZb1RdK/MRVjn6JRNTuPd9y3ZqNxfx8gRf55+4ST6YG/R
         6LXXvNA0Y8A1mnG0Gfff1WPJDWQ54Bxo/cFPJcIz9EYWNoMpsOrJ5VaFgFyrJVz/HpjA
         V2dw==
X-Gm-Message-State: AOAM530gfbL5Knrb5YN+0jpfyjymJXVPzVc6szRwSLcmMsuVPgwA+gaH
	G4XGgyyBg8WeiKZSv3A2mK4MAiT7Kz/1JA==
X-Google-Smtp-Source: ABdhPJwNzSQBPAuodghKBRDcMSo0YQDsjrxmbzKiEUvRODhwyGtfR+RGu3FLQmoDpQupE4RI8T2/EQ==
X-Received: by 2002:a1c:771a:: with SMTP id t26mr4165626wmi.36.1625568018798;
        Tue, 06 Jul 2021 03:40:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e563:c72:c3fb:aae5])
        by smtp.gmail.com with ESMTPSA id s9sm5450866wrn.87.2021.07.06.03.40.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 03:40:18 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] dwarfsrcfiles: Avoid races over debug-link files
Date: Tue,  6 Jul 2021 11:40:17 +0100
Message-Id: <20210706104017.2660913-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 .../dwarfsrcfiles/files/dwarfsrcfiles.c             | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/dwarfsrcfiles/files/dwarfsrcfiles.c b/meta/recipes-devtools/dwarfsrcfiles/files/dwarfsrcfiles.c
index af7af524ebe..9eb5ca807ad 100644
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
2.30.2


Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web11.40262.1595803190916535842
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2020 15:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RJ7fLg+o;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: wata2ki@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id j20so8031183pfe.5
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2020 15:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=iun0AND9sp1IFwsCpzWJ2lfxH5XGnkyvq/s6vAMW0WU=;
        b=RJ7fLg+olyXkRBXgZfcwwnbAKFKJEBf7AtuvS/GtozK+C3WqqbCF7RCIQYIHR9oW7A
         wppLtCybd/UmMt1PwZi5wdT0BAg3/1SiATbcpmVs5H9Ua/yyLDAV/VubukRAGapd1rCM
         rYYIJL2rimF7FEer/UQGPJv6Rhz9R8/NiEBmRtHX6Xni9sOSFugrY1o/Alv+exe7itBF
         T+3RDCi2wl6TLxQnbDqafwhKQtOb5XAKeZs/bMkCthd1C6kD1yMBCS9A0dbWRsCS6aUi
         cN6vgoGrmpgrHOL2GZu5uLnhBj+UMOO2a/JDk6Owb22t8SkWdttb7ICyu8cYUn1CarSo
         oh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=iun0AND9sp1IFwsCpzWJ2lfxH5XGnkyvq/s6vAMW0WU=;
        b=Zw8w0dWPmr8qlPFNlP7yGdDn1P7EeCnd+MBrIE9diPMVCZV6F7hGgdoy5uSOlW9ZCf
         x5WiZ2a3ixbiLkqjs4no2jo8nR/tFgwKExcZekzBY0+jxY3SVJipqbNLYusQH7YzSKZz
         iN1Ho6RDrii9b0sgpBZSwy9G+5kUf7AKR5nVFYxnJ/4+rn2B4dgoLEVa6Xr1KVeOo8MW
         XgvaqQwYHWNo7z391wWgbcpwRcHIPCbUEbuleFFZWKtGbgFJQYSlzjmPmSjm8SEEEZLc
         vfwk/eLyKgOqzyuy2G2wWGQfC9xFZJpanQvQsSG4UnohbW5jvMf3qQ2PjvyOPNFVJF4v
         9e8g==
X-Gm-Message-State: AOAM532mV4TeNEySDxzJewtjr9paQwfejL7nb3kwAF77SunXgtx38Niy
	qtG7wLTkXpSYtXrVQV/omRTU8KFWJgg=
X-Google-Smtp-Source: ABdhPJw2qx9Szq3rxdjhU0lhSAC0tgviWKu/RYloePKLoSS4Gv3ZtUbt2Q/lmKSYhYWw0UtTbyJGSg==
X-Received: by 2002:a63:80c8:: with SMTP id j191mr16556821pgd.38.1595803190048;
        Sun, 26 Jul 2020 15:39:50 -0700 (PDT)
Return-Path: <wata2ki@gmail.com>
Received: from localhost.localdomain (p2438235-ipngn200604tokaisakaetozai.aichi.ocn.ne.jp. [221.113.241.235])
        by smtp.gmail.com with ESMTPSA id u24sm12638147pfm.211.2020.07.26.15.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 15:39:49 -0700 (PDT)
From: "Naoto YAMAGUCHI" <wata2ki@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Naoto Yamaguchi <wata2ki@gmail.com>
Subject: [PATCH] patch.py: Change to more strictly fuzz detection
Date: Mon, 27 Jul 2020 07:39:34 +0900
Message-Id: <20200726223934.14588-1-wata2ki@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Naoto Yamaguchi <wata2ki@gmail.com>

When applying patch subject is including a " fuzz ", do_patch_qa detect
Fuzz.

After the patch is applied, the following log message appears.

  Applying: meson: treat all fuzz cases as unit tests

The current Fuzz detection checks for the presence of "fuzz" in this
log message.  The log in this example will be treated as Fuzz,
despite its success.

This patch change to more strictly fuzz detection.
if log message is including " fuzz " and "Hunk " in log message,
it will be treated as Fuzz.

Signed-off-by: Naoto Yamaguchi <wata2ki@gmail.com>
---
 meta/lib/oe/patch.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 7ca2e28b1f..40755fbb03 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -41,7 +41,7 @@ def runcmd(args, dir = None):
         (exitstatus, output) = subprocess.getstatusoutput(cmd)
         if exitstatus != 0:
             raise CmdError(cmd, exitstatus >> 8, output)
-        if " fuzz " in output:
+        if " fuzz " in output and "Hunk " in output:
             # Drop patch fuzz info with header and footer to log file so
             # insane.bbclass can handle to throw error/warning
             bb.note("--- Patch fuzz start ---\n%s\n--- Patch fuzz end ---" % format(output))
-- 
2.17.1


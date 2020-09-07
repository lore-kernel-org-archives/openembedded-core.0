Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.1783.1599498176684227408
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 10:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=vB/jkpyY;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id w186so8264235pgb.8
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 10:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=/RJiKuSyYomgX5dPtnBcj3dpaO4mLjwH7zruqeTm+Cc=;
        b=vB/jkpyYcJOX82MZGiwQfeMkNP9bhu0vtLFp2mhOWF5Z+zQA3hMdJVaewu/NRBlK14
         Dk29vxdX5YVd9ymzaQ25wIR3V9DJj3u05ujKvxp/dIM1UKBZZJd9Zd3WoSRURcaY9BIc
         v80z0u3EmRi1ch2a8Kh77UJ6MYyE79sP4ikMone1E5d1ZIa0gATx9u9xdsKBHwx2teHD
         VM3XISkTCBvaZkRX547CbQ0qADzVCMUpJphORjWY474bq9mgu/cPFpilisXKIiDMd0HD
         oZYkZonDmeUWZiDGrO+zn+QlCsKBaE2k9zPuMQEsE1SEoWKkwFpyTXudKogpnIVFAbk2
         kozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=/RJiKuSyYomgX5dPtnBcj3dpaO4mLjwH7zruqeTm+Cc=;
        b=BQ3M2TpeqzVkmpR9P/OJruU797nFPI29c+oQHpisUtDaeHwQqz9eFJaWJwfEjFqU3k
         KhJE/xE/vqWhZqXLhZBDca9N+k/bq5nuxz88dQX1izFUJSWHFgCX30DmK1ffKBlZ6rEX
         +eRjO18K1llTV+f0iBo4GcOPFFr/DMTaroIBj1Zh0XpTRC78OfPp+G0UHYA7e3Q3nLpy
         0XCIn7oCBMs/q+LyOAXF3/2mFK2AwkSwfm+AmBxYMBZU3qIxAxRs20af6JHFyD4nafbD
         BZIt4+Mj1+FR146UelgXc0KoeTlc50w4RZRJeKK6XK2pL04WIIHuwOwHPUW8clHrIdxu
         vOtA==
X-Gm-Message-State: AOAM530VrIZBlOxi+0hNmtmYGcmsMW5fJvx/Ez2fxpWozxzCtBqujmpx
	MFiFZdmXxLyDIQydU18PkqJq92yoMu7geS//
X-Google-Smtp-Source: ABdhPJz3Wi87eFPhTPtKswolGHHVp3LHoyqGpnQuJIyj9V8Vd6LiuBNB6OUA1s7TMSaWjwYF/8W47Q==
X-Received: by 2002:a62:5b47:: with SMTP id p68mr21188620pfb.153.1599498175800;
        Mon, 07 Sep 2020 10:02:55 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s8sm16525902pfm.180.2020.09.07.10.02.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 10:02:55 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/18] insane: fix gnu-hash-style check
Date: Mon,  7 Sep 2020 07:02:11 -1000
Message-Id: <af265eca8c95ba92718b37e62b5b4eeb2f17668c.1599495862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599495862.git.steve@sakoman.com>
References: <cover.1599495862.git.steve@sakoman.com>

From: Sumit Garg <sumit.garg@linaro.org>

Fix gnu-hash-style check that always returned True after commit [1]
leading to false positive presence of "GNU_HASH" in objdump output.

Fixes: 9ff90bf04a4c ("mips: Enable gnu-hash-style on glibc") [1]
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 996010f1b9ca98592e2c87e1adcb0c79b86517b7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 1d76ae7c1d..12ae44d4d1 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -437,7 +437,7 @@ def package_qa_hash_style(path, name, d, elf, messages):
     for line in phdrs.split("\n"):
         if "SYMTAB" in line:
             has_syms = True
-        if "GNU_HASH" or "DT_MIPS_XHASH" in line:
+        if "GNU_HASH" in line or "DT_MIPS_XHASH" in line:
             sane = True
         if ("[mips32]" in line or "[mips64]" in line) and d.getVar('TCLIBC') == "musl":
             sane = True
-- 
2.17.1


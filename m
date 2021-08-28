Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web11.207.1630174490959157729
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:14:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=z4ZyTWwq;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.52, mailfrom: steve@sakoman.com)
Received: by mail-io1-f52.google.com with SMTP id n24so13514501ion.10
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZM6emAf7NfKPp0mKQdaaCkLI8ETXVRxAAkEVuddHpVU=;
        b=z4ZyTWwqxKtLACPWnoieDQHOCqEPgHzOWJ++PD2hVPChB6HRMxiZobzkLneMjCHJV7
         g7U76JD9v4aaqW9mmJ5hMrecY8RkDqV7n1tFvvLG7aB5HSw7WGlzm3WlUssg8Ja7GhLw
         6ZgTd0lc1jtXwp7f4S19NDxg7P6ZfYwkQEdIY9VfaKR11bUa4sgpDE4jOS9wZo3K0bQH
         BidcbI04QFJiGN10+8CdDBSCmC2+PZmsy1UrKx2NXw51v2iQGEBBqLAByrg1+Tz+OMWV
         /AfHQ/nYrQgMIGAmzYL+FSDkV1vNsNV1DdaLVQP1FiBryHv9LS6eh9ZyxFDsfor2QcHp
         FNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZM6emAf7NfKPp0mKQdaaCkLI8ETXVRxAAkEVuddHpVU=;
        b=ZYFwIjSh/mXn1AN0SfpkKER3v7sk0qxMjf5OELFYcdlUKHq09FPaJwnIxdQlb3WqZz
         8KV2yv83mTHFYrk4+GaY0YPvpdJeq34AUFuBP/JZzgT/yuB2PQ6LGgod18qDaUj0LTSc
         2PQOgAXHo9tVEuQA6kCHAVtg11QXLpOQyItSAwoWOkz7/iWqzsf8gWpzN+9F5eN/5rQ+
         SMuj0jPXCxSqpPNi0f+KinKaMvShcJEQIH9yeguh1VKdknv7L6h7XGkDR0ZJEJjAaj8u
         Ff1PWbYmgFWQGqZwkkEz+Ejytn10QNRXP6IFuLzLcHdmPHMLctExEgC1luuzRLsxAR2a
         i+7g==
X-Gm-Message-State: AOAM5335bcMiav1Dtd32rdmbFxS7tl3IiXczbca+lZb1MZ6qVcILzNXh
	XR/WbKLp+HADSVTWJFy1P0Ybwby4hzpbNsPL
X-Google-Smtp-Source: ABdhPJwceM+rEU7Ny1BBymoBXytaYYbVyLqwEjSbccLa5gLdZac0nJFlmaiY99n+rs901H9CdYmJaw==
X-Received: by 2002:a5d:9653:: with SMTP id d19mr12073245ios.74.1630174489907;
        Sat, 28 Aug 2021 11:14:49 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.14.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:14:49 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 34/36] qemurunner.py: handle getOutput() having nothing to read
Date: Sat, 28 Aug 2021 08:11:22 -1000
Message-Id: <6f3a8e259ecf6934b32a264661422a6872aca2ef.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f4abfdeea175cfcadd6f73a69a676632ab4334a6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index a9efb849d9..f7e5a3b3a6 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -120,7 +120,10 @@ class QemuRunner:
         import fcntl
         fl = fcntl.fcntl(o, fcntl.F_GETFL)
         fcntl.fcntl(o, fcntl.F_SETFL, fl | os.O_NONBLOCK)
-        return os.read(o.fileno(), 1000000).decode("utf-8")
+        try:
+            return os.read(o.fileno(), 1000000).decode("utf-8")
+        except BlockingIOError:
+            return ""
 
 
     def handleSIGCHLD(self, signum, frame):
-- 
2.25.1


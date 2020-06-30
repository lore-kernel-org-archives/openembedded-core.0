Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web12.7487.1593486278758363207
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 20:04:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=y7VpEPg8;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id x11so7881058plo.7
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 20:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=vvVa7nAjHabNc8PDOdJcXbbTBGQlouq/T+9P6BuIjWA=;
        b=y7VpEPg87Ae4PBQ2a1Hyjb9ROcUu9tLBQc829YbRggpoRTRx0MQPeT7KDalXU7bLAd
         IlHlw9faboSnBwKhioo2Hyz6I7UcILJlndqyjTrVokjrTRTpGIOLsh7WNfnYEm415ID9
         C7eUTYNB077gcf95HOWnNlh/44T2lW73sZLRZt7fo3aVvInpjzfV6wOmgvLAreOnOt1x
         5HZSo0QR59DXZ2gcABqQ0MEb+8f13NaAOpxCdNJxmzdv7N91HELH0aSst5rgyNQdiziq
         u/9WzpuodNbQz6m3zcFCt85++mSBJxiKai2MiCMDgJ2VGzw2st5ASRXjUEBtRJ+39Jlb
         9krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=vvVa7nAjHabNc8PDOdJcXbbTBGQlouq/T+9P6BuIjWA=;
        b=kaYWMG1AaipD5KL2Z8jQrgb3tFMsMC6A6qJA1RwZHhTGzZJzqnlNogLPoyXab8/MYu
         zKlgrkRP3WqRqelusSAEv7RMP9GqMaHm112xsdmHlYIgJXaU+1XAUYXtcrgg9J8BZ21I
         jiyzpgeIHqeYkFKIVQYmKk2NKYaZH2YZs7Eu5jS8EuhV0Y4Jm+6+txj9Vt89WGrizG7t
         e61MDQGVZc+ohEj2YuO5jQ0N2X9G/ApbFcUUnBNGYv7Fbwx4XEs+cANtAQ7yTwtH0TVY
         VungL9HQWLB6gZOpL/jm7W/vCxURP1QEMk9Ohz40hzfsEbqwb3qFPVkOL59SUk0oJYxb
         7wYA==
X-Gm-Message-State: AOAM531UvbKXzvXdiS6E7RHhvQqhht/EYcMrkitDiG0IdWrdfMpcvmjY
	ts8rkxrkQxE/6UeodYVYu+PbHtgSq9LpTw==
X-Google-Smtp-Source: ABdhPJx+KjQkcBMTlWB8TxcTp/kTuZ8tr48/w65hjnTa4Q/N4ugTK3OBhl4R0q1bwHp9iBkASuJt4w==
X-Received: by 2002:a17:90b:916:: with SMTP id bo22mr20510674pjb.100.1593486277804;
        Mon, 29 Jun 2020 20:04:37 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id 6sm875627pfi.170.2020.06.29.20.04.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 20:04:37 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/22] oeqa/utils/command: Improve stdin handling in runCmd
Date: Mon, 29 Jun 2020 17:03:08 -1000
Message-Id: <9034ac93518b74dae5e05776c0bce085171cdd1f.1593485896.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593485896.git.steve@sakoman.com>
References: <cover.1593485896.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Occasionally we've been seeing leftover threads from runCmd. The stdin test
assumes we clean up all threads but the code assumes that the daemonic thread
can be left behind.

The issue can be reproduced by adding a time.sleep(10) to the end of
writeThread() which will mean it stays resident past the end of the command.

We may as well add it to the threads list and clean it up properly,
hopefully removing the race in the tests from the autobuilder.

[YOCTO #13055]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9b251dcaffe52d32c1faf41ab57ab414fbc29722)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/commands.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index df373c4169..f7f8c16bf0 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -95,7 +95,9 @@ class Command(object):
         # reason, the main process will still exit, which will then
         # kill the write thread.
         if self.data:
-            threading.Thread(target=writeThread, daemon=True).start()
+            thread = threading.Thread(target=writeThread, daemon=True)
+            thread.start()
+            self.threads.append(thread)
         if self.process.stderr:
             thread = threading.Thread(target=readStderrThread)
             thread.start()
-- 
2.17.1


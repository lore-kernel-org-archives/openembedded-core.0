Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.5682.1592862976889566489
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 14:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O3TrBHLa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id r12so1011602wrj.13
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 14:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SUC8gwoY9AkNbo+CBGooOlNtVsEtGPtElk/MnrMStC0=;
        b=O3TrBHLayAUE2pBaKwHZYjVQMZske/3p38RHv74BqQZOxvdHFoGeiimjz/MaTfY9Cu
         oEbPxJGoepYPjwX85dIT2ACrrmE+PpJc2wp3jm1rmIt2M6M/wLNokkASgrLqrGs3FCDL
         0Wfu3coFV2FHdpUWfEYpWR9mPsFlLlvxZS8dc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SUC8gwoY9AkNbo+CBGooOlNtVsEtGPtElk/MnrMStC0=;
        b=hXgqL19ay837e7+AiQdsL/z+qZPSAZ2kbJJdBnlaqd8bAIz5z2MQac4bJZZdcBmui0
         zAQ+bN0z+za2URuOo89rbsw5e2n0ftsXqCNR9aFakCJcvD0WJdF8AqYmITCcmLwCri3h
         4ZwjXIH3QEToPmrMNJ8GjpOdYBAvCFaCuK85DJSepnof2iEJOF9swLzMZcvvgGo8SejV
         hhYvMzPd+zX4sufQv8F5oAglqF+MfQkwEebrBsGRj5HqcQHhem3spBcCHKLsZ1KYlKkJ
         emC2PgO+k9V5zMEl8mWoLEfs2KuTYXOkOruC4cCDwn0BITicM+8o+Wr5QmOg/8LfKYRE
         oXxg==
X-Gm-Message-State: AOAM532VeZBMeXXSC1bnwW+4OBiFXpy3HmPXqGSI9sD6/C/I48XQ1tTL
	Duji0xhZZFhWIUmpOHFPbKGlaWiT9a2zRQ==
X-Google-Smtp-Source: ABdhPJwz4HUxyixbEoFEG75B3iejstd0axglQ79lGXpELqS6kfv3MjCZmbvmt79612E6ScCXrK99MA==
X-Received: by 2002:adf:f082:: with SMTP id n2mr14767037wro.326.1592862974934;
        Mon, 22 Jun 2020 14:56:14 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 104sm20155407wrl.25.2020.06.22.14.56.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 14:56:14 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/utils/command: Improve stdin handling in runCmd
Date: Mon, 22 Jun 2020 22:56:13 +0100
Message-Id: <20200622215613.576291-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Occasionally we've been seeing leftover threads from runCmd. The stdin test
assumes we clean up all threads but the code assumes that the daemonic thread
can be left behind.

The issue can be reproduced by adding a time.sleep(10) to the end of
writeThread() which will mean it stays resident past the end of the command.

We may as well add it to the threads list and clean it up properly,
hopefully removing the race in the tests from the autobuilder.

[YOCTO #13055]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/commands.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index df373c41696..f7f8c16bf00 100644
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
2.25.1


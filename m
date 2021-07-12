Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.12652.1626103972181434902
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 08:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=oO6u5Zoe;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id o3-20020a17090a6783b0290173ce472b8aso1860479pjj.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 08:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=T4bX87sw7gohXGmqanJrAwhHcNMhzm4hGskWpeIwgiw=;
        b=oO6u5ZoeT0ZeWvb+s0HjDMca452rMT7mL9C1eaF24XAG5NkgYkM6C7E+EvIkESKXt0
         Eyij6VgFWKQq3TDIx7DqGbgKMZB5Ii4+8yARaMSDOS3ISfauCPRvm53g5P4ANO6H5mJL
         QchuJi7tEsPSuYvhl7foTj3Wby7CSzCXJ/yeg/JK66lqBu4igZanuhCnTqtsQLugh2Hn
         ZG3stHSStG1W1tj3im2Tth61HeqavNn9uu5Ny4P+yLqoPujaSFomhI3Qaz1cHba3vMo2
         QDZyfKH3rXX/kOuZarETe5V8Wa8Bh0ECbL8/Oa2jsS6hzKSboP0SkhXQvVs+CoX/DKyj
         fyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T4bX87sw7gohXGmqanJrAwhHcNMhzm4hGskWpeIwgiw=;
        b=VKwoalWEc8P5Hxcn5bAyCFmUeEaDWBWydqDcmP9baJ6shp3C5Drb5bCzroQZKo7uVL
         RITS+p+IwKWWpNzEfwekPq5MTzTwY9Jh5O327bGMpjFEUHYDNcNCcw1gjTOSLBuEkFn3
         avK8eQBED55Zu9tshow/ZoNNm3zFHcujx6QBMAqjP6MB970hMc/wXGdJpJfcrx/mQG1c
         HyoIPdRSgIJ5y8ce3dPZ1lWUK4mqTTRRYJgGvtnm4wxpPVm0a8mDB290hahgE+Rlu3KO
         pYG5DKHeusn3i6O28bnxbOl5+8xAEoFnBHKtYVkcsejPQhaUYupvdyO+SRBQMUibY1En
         1jqA==
X-Gm-Message-State: AOAM533pVtX1atQHoZqIeR50IIZcUG4415l9HIKSOFU3/Kp1rvsMF5KC
	rF26MmjBazVfX8/ZIwzVu5PyOvWZ28IqShpP
X-Google-Smtp-Source: ABdhPJxB1NLikCWQLZM1nypxzY+iFI28jqEKiA0dVDwobbYfoO7Q8VHepAOHdRYGPXHRO31VB39S8w==
X-Received: by 2002:a17:90a:ab07:: with SMTP id m7mr25578222pjq.27.1626103971309;
        Mon, 12 Jul 2021 08:32:51 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n3sm16765942pfn.216.2021.07.12.08.32.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 08:32:50 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/12] oeqa/selftest/multiprocesslauch: Fix test race
Date: Mon, 12 Jul 2021 05:32:02 -1000
Message-Id: <5df87fc7d3353abb8a8f4a25b544e7927c8b39eb.1626103708.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626103708.git.steve@sakoman.com>
References: <cover.1626103708.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Having two possible failures in multiprocesslauch creates a race where one failure
may occur and stop processes being lanuched meaning the second failure may not
be seen. Rather than having periodic races appearing on the autobuilder, only
have one failure, making the test much more deterministic.

[YOCTO #13054]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 31e9dcda40aae3ce0801580c838928956e1455e3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/oelib/utils.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/oelib/utils.py b/meta/lib/oeqa/selftest/cases/oelib/utils.py
index a7214beb4c..bbf67bf9c9 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/utils.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/utils.py
@@ -64,7 +64,7 @@ class TestMultiprocessLaunch(TestCase):
         import bb
 
         def testfunction(item, d):
-            if item == "2" or item == "1":
+            if item == "2":
                 raise KeyError("Invalid number %s" % item)
             return "Found %s" % item
 
@@ -99,5 +99,4 @@ class TestMultiprocessLaunch(TestCase):
         # Assert the function prints exceptions
         with captured_output() as (out, err):
             self.assertRaises(bb.BBHandledException, multiprocess_launch, testfunction, ["1", "2", "3", "4", "5", "6"], d, extraargs=(d,))
-        self.assertIn("KeyError: 'Invalid number 1'", out.getvalue())
         self.assertIn("KeyError: 'Invalid number 2'", out.getvalue())
-- 
2.25.1


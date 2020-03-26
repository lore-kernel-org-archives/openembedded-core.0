Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.33066.1585212883352426227
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 01:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WKVnjQuV;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id d198so5588926wmd.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 01:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0YiAZscsOBSAwXe6+Vlq7K/nPOZ3vU8bVLRz9iD1S4M=;
        b=WKVnjQuVh5Dmkax6wm9qd7YzAlNes9C3GHFJkveQGNaCG7ZMcGKnMr1bPyQmNGK/ft
         fiEwLEOk9yt2gjgusUkZUPLdKWIwuNCPHMTbUKXjcfbaf8LBjHWD3qTfiYzKh1F5SoNQ
         FRXwLDXSm2Y3gzO1vADVmHK8y9rJl9/Jk6FYmAa9Ap95aM1nlylD58aeF6ywJaxuMQeE
         +nfffKHVdAcZ1GuzsPZhP5HvpFYHHz/X2liz4Ti3sSrVlRZrPKXD+pIrS6M4tFY3N303
         HZeqvB9LHXbjoU5EXvxALzrty27o5D2IOYRlPozBBUoL+7dni1NXaJrENE51p9P490w4
         BFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0YiAZscsOBSAwXe6+Vlq7K/nPOZ3vU8bVLRz9iD1S4M=;
        b=DlwS+4yp4XH7638/tHcuap4LIOeNNwRAkZYFty3tcIAHZbaCco72VBkCyt8BM1JTdR
         3cmEWpAjcF/nVD+5UXbnUNdh5gyd9OPF9tdXwc8ozbLONK6M6w530GKkDo0cobFYkGBN
         QjXeUhb6a7xyOE3FVK/OCtvZ6iQ8O9pK6fblxMIl1mjRFXfL/1KfU3bMkhFLMG08pHNP
         mLetDGWRWhN2qzvYguBoXmXl4iRBCqhOVgGpyFrYJBZlAXm3RH6yYV268J0R4QtRRUTy
         ZyGcQ/Wmf7A+UZlxkaSW5Pg9YLMhAk8GERwAG/BwO5fwvvizLLuu0oAf00LTN+qbmFwY
         AGcw==
X-Gm-Message-State: ANhLgQ19MEFKMSepjXltDTGZc9UccM7gJ1sGnsj4410Qf4em3aFabU2F
	Vdj4ffEXXBOwvLqDyf6i8Xh9rFaN
X-Google-Smtp-Source: ADFU+vvi6Aj5ZLQgoIPFqfrDEdIOwjGnXPkEfAHpDLuTgj3nY7RqwvYGFS/YeFSdCdZh+Qc9YUkDPg==
X-Received: by 2002:a7b:c764:: with SMTP id x4mr2069071wmk.39.1585212881786;
        Thu, 26 Mar 2020 01:54:41 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id h26sm2484107wmb.19.2020.03.26.01.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 01:54:41 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH 12/13] oeqa/runtime/cases: Disable and stop systemd-timesyncd
Date: Thu, 26 Mar 2020 08:54:25 +0000
Message-Id: <20200326085426.117209-13-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326085426.117209-1-alex.kiernan@gmail.com>
References: <20200326085426.117209-1-alex.kiernan@gmail.com>

Stopping systemd-timesyncd doesn't prevent it being restarted by a
different transaction within systemd. Disable the service instead during
the date test to ensure it can't be restarted.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2: None

 meta/lib/oeqa/runtime/cases/date.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/date.py b/meta/lib/oeqa/runtime/cases/date.py
index 7750a7293f8e..fdd2a6ae587e 100644
--- a/meta/lib/oeqa/runtime/cases/date.py
+++ b/meta/lib/oeqa/runtime/cases/date.py
@@ -13,12 +13,12 @@ class DateTest(OERuntimeTestCase):
     def setUp(self):
         if self.tc.td.get('VIRTUAL-RUNTIME_init_manager') == 'systemd':
             self.logger.debug('Stopping systemd-timesyncd daemon')
-            self.target.run('systemctl stop systemd-timesyncd')
+            self.target.run('systemctl disable --now systemd-timesyncd')
 
     def tearDown(self):
         if self.tc.td.get('VIRTUAL-RUNTIME_init_manager') == 'systemd':
             self.logger.debug('Starting systemd-timesyncd daemon')
-            self.target.run('systemctl start systemd-timesyncd')
+            self.target.run('systemctl enable --now systemd-timesyncd')
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['coreutils', 'busybox'])
-- 
2.17.1


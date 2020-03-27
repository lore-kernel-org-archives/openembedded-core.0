Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.17636.1585329938465596205
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 10:25:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rIBN45x9;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id u10so12352527wro.7
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2020 10:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IMuk/9S94zQN12VkV0syaVHNe94A4YmGL1fQZ+ZjKo4=;
        b=rIBN45x9s887P5gBewGbmMaR5EplcMbP//SCImM4NcEvX3FIdLh8/tUd+Sv9pZOQha
         BhIKTrirWBtOkQDB3xYhvsbN6RDMjjxDpzohtpj/saVlt1DP+NBMBB2ETQXxX/Zg7uhc
         bQtIZaWrKIb0Nf70avu8il+cOx+Mb45NcIHtekxyo10weXiganE112BBW5i6QrNKmmTv
         Y8h1vH7I2i235RLeTUL5qw75gxp5WO9fVtOn1Olbi+ZCoM8nb8nBZTjb21AVUDvxTwb7
         1ZmpP6pEhPD8QB0LJuFXykihoTw1ofn/ESpla1JEOLuFfy28r37HKPafs2pQ33f1lPfV
         AL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IMuk/9S94zQN12VkV0syaVHNe94A4YmGL1fQZ+ZjKo4=;
        b=Djk9GXoznBYoivrZZmWhruk5G/GOgwPpVgVh4L/2bI3ESkrDACN0Oa/5xojL25kmL+
         lQllpypqWNVmawXJNkrlFyMZqUpjztM+lgH2jifS5gS2V35L4CGApsP0nALEWy1W79aa
         ePUTWDAbL9gFBc5bbiJZVMxHU7scu/ndE8Os/vY8I/xtXOLwclvOFNWKx1K3TXkVkPCb
         jeDiRTjmYYpd981J+ZiqwmEn/9SlScr8HqCAaBAqU/DNweedsCLl5LLHsyA0IqXFjXY7
         kmExDi9k3tSjixsPEhUJIaaO/o6obiQV+EZIpaP0HLb0sr3NL/iVxuY+Uk6HpfRbLW30
         2sfg==
X-Gm-Message-State: ANhLgQ318fCNh17isZfv8SwKcooQjCDpyiB7DPrKN+6Hn9qa+6zdWpAv
	PXJtDH0NU4bXi6RkULLZnTKb5g8M
X-Google-Smtp-Source: ADFU+vsvbLXg1g9+spta+iBO5a2ax7SM1qaNrRDXEPwg8T8Un/zkO3rUDsuxXlJARpHQURs7/lyGug==
X-Received: by 2002:a5d:518b:: with SMTP id k11mr475809wrv.256.1585329936813;
        Fri, 27 Mar 2020 10:25:36 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id g186sm9281419wmg.36.2020.03.27.10.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 10:25:36 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH v3 12/13] oeqa/runtime/cases: Disable and stop systemd-timesyncd
Date: Fri, 27 Mar 2020 17:25:19 +0000
Message-Id: <20200327172520.62888-13-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327172520.62888-1-alex.kiernan@gmail.com>
References: <20200327172520.62888-1-alex.kiernan@gmail.com>

Stopping systemd-timesyncd doesn't prevent it being restarted by a
different transaction within systemd. Disable the service instead during
the date test to ensure it can't be restarted.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3: None
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


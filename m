Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web12.27801.1618199446763797121
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Apr 2021 20:50:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M5XOcAJO;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: wesley.lindauer@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id s5so3308048qkj.5
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Apr 2021 20:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9mL8880Y9AwvsxN0iQGyZtWzUQPABv0Eh/Ebj9muhv0=;
        b=M5XOcAJOTmrXM6Pquosuf1+kHy6hb6/2hARJ5b9ifGntLnVhafwNrvQvXwhhE56PdW
         ovEXu9inOeO6ObAaTnJ/Yr6x5r9NSNQ85+lQDOGRNJcrCdxGQUVg7/H3mxo9hggjiZ2M
         i0We5aUwrW3EhPc80tYrwRMQCrR9QBBBda0wU7ArXwMzASsz6pajTJwNa6eQGFE6U8LC
         k6zFNPZlhOeqVT7XX8EgZlAMIT71BaO8C2qVf8oxeTL2+Snzy1+jaDaIAkW9FzEy/Ulf
         kZVz+bf+fVocgUHW1Plsu13nWQQXQUON+7B9mpYG3HjrY6D5RxCpK1cyTQ8dag85tUxE
         3nHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9mL8880Y9AwvsxN0iQGyZtWzUQPABv0Eh/Ebj9muhv0=;
        b=HL/yiuA1rYmkZnkIpbF+BFFVVZ4UYtOA5xzqEQIJS/WXteFN9gbGpP+j4MxuCexLlp
         kbGMQy9XliBtkuDXrwMDMuqxI04MOqEncISIKmwSto+oy7rcwwQw8SxqvazaD0V6gkYe
         PxTE7e0A90pNUzAkpYyqQHC/rcOEtghRPsPtRGSyFyR/jZCOQseHiU/Slj0iq74Jb3BN
         CP5rA9k5uk0k7ahy4jYcuOwW6h8PUGk3R1CDONYAIUlseaCZZF3o8ucJUnhhQcfv9ii/
         P4u0fnbCe/gLHMDvnwbjOdVLsTsdd8E7raUm1VF5UwGaD3szZMiQKii2s7J+ZBdKg/AJ
         dpaw==
X-Gm-Message-State: AOAM531Ukw/Khnt/jrTb5EgjFw6nBPJCLeq6M5uPtvd6qhT06Knp1brg
	iZJel6AMm8kOeUHykF+QKm52y5SoBIU=
X-Google-Smtp-Source: ABdhPJwRfyK3hcB7DBZsG9ZumM7hVJqFoNfmw0FKGPcTyKICLIE+f9/bN3whB22AAmyJhKJinj3jMA==
X-Received: by 2002:a37:ef18:: with SMTP id j24mr25515672qkk.96.1618199445838;
        Sun, 11 Apr 2021 20:50:45 -0700 (PDT)
Return-Path: <wesley.lindauer@gmail.com>
Received: from nova.wlindauer.baselinux.net (cpe-65-24-166-29.columbus.res.rr.com. [65.24.166.29])
        by smtp.gmail.com with ESMTPSA id p5sm7064798qkj.35.2021.04.11.20.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 20:50:45 -0700 (PDT)
From: "Wes Lindauer" <wesley.lindauer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com,
	Wes Lindauer <wesley.lindauer@gmail.com>
Subject: [PATCH] oeqa/runtime/cases: Only disable/enable for current boot
Date: Sun, 11 Apr 2021 23:50:34 -0400
Message-Id: <20210412035034.333047-1-wesley.lindauer@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wes Lindauer <wesley.lindauer@gmail.com>

Previously doing a stop/start worked, but using a disable/enable does
not work on a read-only rootfs. Add a --runtime flag to systemctl so
that systemd only modifies the current boot and does not attempt to
write to the filesystem.

This also keeps the test from making a permanent (one could argue
policy) change to the running system being tested. i.e. What if the
image being tested had intentionally disabled the timesyncd service in
preference to using chrony or ntpd? The test shouldn't assume that the
user wants the timesyncd service enabled.

Signed-off-by: Wes Lindauer <wesley.lindauer@gmail.com>
---
 meta/lib/oeqa/runtime/cases/date.py | 4 ++--
 meta/lib/oeqa/runtime/cases/rtc.py  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/date.py b/meta/lib/oeqa/runtime/cases/date.py
index fdd2a6ae58..e14322911d 100644
--- a/meta/lib/oeqa/runtime/cases/date.py
+++ b/meta/lib/oeqa/runtime/cases/date.py
@@ -13,12 +13,12 @@ class DateTest(OERuntimeTestCase):
     def setUp(self):
         if self.tc.td.get('VIRTUAL-RUNTIME_init_manager') == 'systemd':
             self.logger.debug('Stopping systemd-timesyncd daemon')
-            self.target.run('systemctl disable --now systemd-timesyncd')
+            self.target.run('systemctl disable --now --runtime systemd-timesyncd')
 
     def tearDown(self):
         if self.tc.td.get('VIRTUAL-RUNTIME_init_manager') == 'systemd':
             self.logger.debug('Starting systemd-timesyncd daemon')
-            self.target.run('systemctl enable --now systemd-timesyncd')
+            self.target.run('systemctl enable --now --runtime systemd-timesyncd')
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['coreutils', 'busybox'])
diff --git a/meta/lib/oeqa/runtime/cases/rtc.py b/meta/lib/oeqa/runtime/cases/rtc.py
index a34c101a9d..c4e6681324 100644
--- a/meta/lib/oeqa/runtime/cases/rtc.py
+++ b/meta/lib/oeqa/runtime/cases/rtc.py
@@ -9,12 +9,12 @@ class RTCTest(OERuntimeTestCase):
     def setUp(self):
         if self.tc.td.get('VIRTUAL-RUNTIME_init_manager') == 'systemd':
             self.logger.debug('Stopping systemd-timesyncd daemon')
-            self.target.run('systemctl disable --now systemd-timesyncd')
+            self.target.run('systemctl disable --now --runtime systemd-timesyncd')
 
     def tearDown(self):
         if self.tc.td.get('VIRTUAL-RUNTIME_init_manager') == 'systemd':
             self.logger.debug('Starting systemd-timesyncd daemon')
-            self.target.run('systemctl enable --now systemd-timesyncd')
+            self.target.run('systemctl enable --now --runtime systemd-timesyncd')
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['coreutils', 'busybox'])
-- 
2.21.3


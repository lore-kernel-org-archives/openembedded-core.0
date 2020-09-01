Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.8478.1599000141852159620
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 15:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eSu6kFc4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id c15so3174112wrs.11
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 15:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=y/XtUZuMmOgW+LgUN3OZq3CripgbzNVGyZU/Fw4pfss=;
        b=eSu6kFc4AaVKVpoKDnbxRMFxR1hVIdmos1jMRcRJhOnvaV00Xj/1bJjbs0M8fWo4zS
         Xsy6uMRqwjhKHpsHV6vxZXAM8zhLCXJLwzU+1VQhgZgb9Ny7St8Fhw01P63BKl+w2t24
         3kKvMeybRnTZ5YIgfZ9eatACiFPbewplv31s0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y/XtUZuMmOgW+LgUN3OZq3CripgbzNVGyZU/Fw4pfss=;
        b=t6wHwvYoZrcJf5M0cgVQan5beiStx9xrIddUIjzDvvU37Krn8EMXq8kQ9H6dW7/YL1
         RzFJ+/crdYn+SQ76MpGmRAgs+O0lNmSxbbMYD4/t2o5jGCU4sMrNJIknQ3Eg1Khp5/H3
         z0/js9RXLeEaUFThHl/dodbfudp2OxASMe3rVgQSX5yYHPsIg8IUzz2SLhIxYPC7eEPL
         OYdARTfxiMw78mKi2z1f6/d0pM4JYSmd1C9O4yDuhmO2YB0kveQ6Zc0hQxEgj7PS7euY
         BjhYK8pOXDgZw6s7uurZq8YvRHa5Ks5dZAa8pYm2j3T3iUhC/z/hoGwl82vxx61uRmtJ
         9zWg==
X-Gm-Message-State: AOAM531BRiHe8394pD0ci0GtxUyxq5dNIjWoH6glTqeyiDu3+dqt4jw6
	W321LZpvLaLAD1sZQcoiD0whpikYdM2oYh4Q
X-Google-Smtp-Source: ABdhPJySJIpSeCOpS9rOB18LT/0eLNxpT076pashkCMg7CzVNE9vXthVmj/HAgbf0CiYFQv/uwm2zA==
X-Received: by 2002:adf:f0c3:: with SMTP id x3mr3972037wro.163.1599000140116;
        Tue, 01 Sep 2020 15:42:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.d.2.7.a.9.f.9.6.8.f.0.2.a.5.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:d5a2:f86:9f9a:72df])
        by smtp.gmail.com with ESMTPSA id t13sm4091540wru.65.2020.09.01.15.42.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 15:42:19 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] selftest/prservice: Improve test failure message
Date: Tue,  1 Sep 2020 23:42:18 +0100
Message-Id: <20200901224218.1677415-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200901224218.1677415-1-richard.purdie@linuxfoundation.org>
References: <20200901224218.1677415-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When failing, give more information about why exactly a failure is
happening such as the PR values in question.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/prservice.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/prservice.py b/meta/lib/oeqa/selftest/cases/prservice.py
index fe1f24ea6d6..85b534963db 100644
--- a/meta/lib/oeqa/selftest/cases/prservice.py
+++ b/meta/lib/oeqa/selftest/cases/prservice.py
@@ -63,7 +63,7 @@ class BitbakePrTests(OESelftestTestCase):
         pr_2 = self.get_pr_version(package_name)
         stamp_2 = self.get_task_stamp(package_name, track_task)
 
-        self.assertTrue(pr_2 - pr_1 == 1, "Step between same pkg. revision is greater than 1")
+        self.assertTrue(pr_2 - pr_1 == 1, "Step between pkg revisions is not 1 (was %s - %s)" % (pr_2, pr_1))
         self.assertTrue(stamp_1 != stamp_2, "Different pkg rev. but same stamp: %s" % stamp_1)
 
     def run_test_pr_export_import(self, package_name, replace_current_db=True):
@@ -89,7 +89,7 @@ class BitbakePrTests(OESelftestTestCase):
         self.increment_package_pr(package_name)
         pr_2 = self.get_pr_version(package_name)
 
-        self.assertTrue(pr_2 - pr_1 == 1, "Step between same pkg. revision is greater than 1")
+        self.assertTrue(pr_2 - pr_1 == 1, "Step between pkg revisions is not 1 (was %s - %s)" % (pr_2, pr_1))
 
     def test_import_export_replace_db(self):
         self.run_test_pr_export_import('m4')
-- 
2.25.1


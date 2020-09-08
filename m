Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.306.1599602943857231349
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2020 15:09:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FfOhGK1R;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id x14so746298wrl.12
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2020 15:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RlOlwqccm7Vg838s7d2QT690Azh7vr/cpzwrz/SWYkQ=;
        b=FfOhGK1RoqaxP09I+ukIOOKY5JqIJHBg7sWFIlTXN2jgtsyyMCnLnZJmTeg3aoiHBE
         oCOkH5XLyKV7SJ3gYVAhkkklsP8hzqgtzjXC6I4myjoyxU2oXG5PwygTffHROzUFNxAi
         wz6YQQCgSI2vMMgtIvf4C0cuK1knEUGwCkBPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RlOlwqccm7Vg838s7d2QT690Azh7vr/cpzwrz/SWYkQ=;
        b=E6tSR2ko8O0wt4yX+UlgX72q6iHdodvPcDclWUnv2NvC3BzgRAZIh4K0qpNWb6BFPb
         fTKX9fW3ZxiLDE3q1Qf/Tx7DUXUAJY5Shee0QlvQTUkh3889InTm1v91nUXRF6v9thq4
         Dgtmk+fy5VBWtaCOwlBDruSk1jrv+mcFmRArsaaJNkCsPEWMRgreVwmq8ixs76l76pAZ
         w2BcXtK0QoJhRErA7gFZ3U7zwKfIKoLfQzxHknS5P1EyqyLktYwOtNQ1h99hvU1QJc3d
         1jUUj5pZFA6fHOqmdXABJMCDfWWbpWJawo+yALZc0FuLtvhGmboDGCBMe3AqRVvNWanZ
         rQHw==
X-Gm-Message-State: AOAM533pWNhikoSDSGQI3R6L8fN+8MoLxnAOlh3lMydhQxASaOj4v4Tn
	ARBTNIHs7qUXZiFoiDDIGSGY1ip5mD7clQ==
X-Google-Smtp-Source: ABdhPJxU/AOrDFHQ6JVN2RHQGL6dBvw75N0nwRg+N5bEm2n2B4/c5veCVmAK5TErbyKF6bqi+B+sXw==
X-Received: by 2002:adf:e7c8:: with SMTP id e8mr607992wrn.358.1599602941654;
        Tue, 08 Sep 2020 15:09:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8509:fcf:4f80:b44e])
        by smtp.gmail.com with ESMTPSA id v9sm1094397wru.37.2020.09.08.15.09.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:09:01 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][warrior] oeqa/runtime_test: Disable test_testimage_virgl_gtk
Date: Tue,  8 Sep 2020 23:09:00 +0100
Message-Id: <20200908220900.1992263-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This test keeps failing on the autobuilder and is proving extremely
annoying. It works much better in later releases but for zeus and
earlier, lets just stop running it as it doesn't really tell us
anything useful at this point, nobody has any plans to improve
the distro exclusions or otherwise fix it in the older releases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index d817b755fed..5149583bd49 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -168,7 +168,7 @@ class TestImage(OESelftestTestCase):
         # remove the oeqa-feed-sign temporal directory
         shutil.rmtree(self.gpg_home, ignore_errors=True)
 
-    def test_testimage_virgl_gtk(self):
+    def disabled_test_testimage_virgl_gtk(self):
         """
         Summary: Check host-assisted accelerate OpenGL functionality in qemu with gtk frontend
         Expected: 1. Check that virgl kernel driver is loaded and 3d acceleration is enabled
-- 
2.25.1


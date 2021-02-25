Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web12.58.1614287882893369357
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 13:18:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=svdYGV7k;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id a24so3890522plm.11
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Feb 2021 13:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BaMX/DjG7QnFGiYtybCX493JozlstDxdqDwSBCfW80c=;
        b=svdYGV7knmahi8TCsj2/+4z6TsrpcmyJ9VYlOh5JcsECXkPzh7yTNURq6xeqQ+Er+D
         ppezj3nsO0+E2MIq5/diaqs1WM2+mwZZ4t1BnV0bfEV+ay2MFsmGHOW1QUFt/3WR2zfu
         s7n80llZpjlJxEp60m/TnB6DKAcd1unvqmIsu/F+q3g7oP63vZbkLq4ImKkR5yW+BQaH
         j8Ejhw1gxNnlsZj2i6pFgEUg1kVs2nPZYJdgWys0W4kBnrErB/17rsRsWPjGztZvgx07
         jsMTGEM4JCUR8W8g5d0e8gmXxotj8aHZ83GmrKSPtYvAFgs5x0JyZyfEMyU5e2ijo5KY
         KW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BaMX/DjG7QnFGiYtybCX493JozlstDxdqDwSBCfW80c=;
        b=ixU0J3AI5h0LJ9FCzb0QDybQo8Yau7sR3cgfsav6EllIPeQ+5PkRkPYaFve4CV+t/9
         bRcZf7KJqhWQH5hNd+jfzrEjjz6s2hrWdZHOo8fQrlzABvhT8KJl3C9CApOs89Ft59nN
         oDRk/wCnrOurloAQpt8JSd1phnL2jbfO3EXZ5z6tROJhbHtRUF4wwicaUgKyvgaz6gxl
         VAGqyS8WQmlF0eC2bXxRgLdHcN9f5GKGAmevZEC4j1dkrYDApcWxrT6813CtPRJXRoWp
         H5ljDSSaXhwa6TCSb2B1qpvjxfiP/7i7OsYGxvYy/G1J0HR/piRdjSpQ8RZk8Zx3Q2PW
         D7Yg==
X-Gm-Message-State: AOAM530Fj0Esut4tXEA/x2Nny14o4bcJ16sGtUTs7TMUdbHuWofWIFnY
	9hlAGP34vHu6vv/wQQlk4x4Lw2Uu6sQhLw==
X-Google-Smtp-Source: ABdhPJxmZLVbru6ahcltErRrw953r5uT625xMe0T7cmHZLRWvuVfHFFF53ehk0604v/qC9AUeRXL+w==
X-Received: by 2002:a17:90a:db8f:: with SMTP id h15mr320180pjv.212.1614287881965;
        Thu, 25 Feb 2021 13:18:01 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id d16sm1207085pfq.203.2021.02.25.13.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 13:18:01 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] oeqa/pam: Fix tests to work with busybox
Date: Thu, 25 Feb 2021 13:17:58 -0800
Message-Id: <20210225211758.176441-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Distros may not use shadow for login manager
secondly login --help return 0 not 1 so adjust the check accordingly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oeqa/runtime/cases/pam.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/pam.py b/meta/lib/oeqa/runtime/cases/pam.py
index 271a1943e3..a61b5a881e 100644
--- a/meta/lib/oeqa/runtime/cases/pam.py
+++ b/meta/lib/oeqa/runtime/cases/pam.py
@@ -17,7 +17,7 @@ class PamBasicTest(OERuntimeTestCase):
         status, output = self.target.run('login --help')
         msg = ('login command does not work as expected. '
                'Status and output:%s and %s' % (status, output))
-        self.assertEqual(status, 1, msg = msg)
+        self.assertEqual(status, 0, msg = msg)
 
         status, output = self.target.run('passwd --help')
         msg = ('passwd command does not work as expected. '
@@ -28,8 +28,8 @@ class PamBasicTest(OERuntimeTestCase):
         msg = ('su command does not work as expected. '
                'Status and output:%s and %s' % (status, output))
         self.assertEqual(status, 0, msg = msg)
-
-        status, output = self.target.run('useradd --help')
-        msg = ('useradd command does not work as expected. '
-               'Status and output:%s and %s' % (status, output))
-        self.assertEqual(status, 0, msg = msg)
+        if self.tc.td.get('VIRTUAL-RUNTIME_login_manager') == 'shadow-base':
+            status, output = self.target.run('useradd --help')
+            msg = ('useradd command does not work as expected. '
+                   'Status and output:%s and %s' % (status, output))
+            self.assertEqual(status, 0, msg = msg)
-- 
2.30.1


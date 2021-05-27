Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.7532.1622124818147293815
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 May 2021 07:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X2FpPzeV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id z130so306581wmg.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 07:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EUIo3sAMnLCpj5YS6raOIctzL0ChJMzqv7HJeUTd8Kw=;
        b=X2FpPzeVpKHfHAichBDwK9lm44ctIXJ+p/lQgvYD+/Xy8lkSirvBY6qgTuU+a8f1u/
         mvaC3YzGvGLl1iKJ3mLcUh+/r9lAycc+wDcKlSGTng40inByE8pAgLxd5jII8n28M/mT
         ntXw1Dxft/FjtmKuyYYW5bMTjJ1TfiITRlld0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EUIo3sAMnLCpj5YS6raOIctzL0ChJMzqv7HJeUTd8Kw=;
        b=QkCWvH/+zctqfWlJYFMziynuT3w26LvZIhEqAJdSZlOI0l8vcd8XxWLu8AUqQyGwTF
         PHv/hE/1aATgP1lTQoWkaDlOm7d87TOjaNQsMJLf4/Pwumc40mceSQDbvJP0gf0EboW3
         1vhKCvUeaBzyIWYreq/dw88MQnkWenScJMN3J8uYNt7jmPARJue73p5NsyTtLXu79gew
         FvSrQjdmu/FBy8aA20BZnot+wLyN223uAX3fpFle/+4M+2vnSav8utDtpvrzVs5N8/hp
         tR37u59tcD7VCG9xR++Btn7mtv8u2+hd11PQaFxM8Czj+950LvFDYVZvvk7zrZxBtxqT
         hzxw==
X-Gm-Message-State: AOAM5310gqm7qkZXT3eqwEeYrXsMYllB5ke9mnxAbwBOZaSM+WaDeqi7
	J2JF6Xfr3wj7P/QDPb7nxhytcQW5fBNmJQ==
X-Google-Smtp-Source: ABdhPJzcpNeHKcEH4uyQ3u3J6IkTFwLVP5WgFaPF671jqBYSX4RVK5pGl16WASna9qWQPUPEEZpSqg==
X-Received: by 2002:a1c:4e09:: with SMTP id g9mr3826025wmh.134.1622124816330;
        Thu, 27 May 2021 07:13:36 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6fb3:5aad:eb2a:f310])
        by smtp.gmail.com with ESMTPSA id v11sm3770526wrs.9.2021.05.27.07.13.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 07:13:36 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/runtime/rpm: Drop log message counting test component
Date: Thu, 27 May 2021 15:13:35 +0100
Message-Id: <20210527141335.2752019-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This test is flawed since multiple parts of the system can write to the log
and we obtain different numbers of log messages depending on factors we
can't control.

Drop the log testing component of the test.

[YOCTO #12465]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/rpm.py | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index 8e18b426f8b..7a9d62c0038 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -141,13 +141,4 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
 
         self.tc.target.run('rm -f %s' % self.dst)
 
-        # if using systemd this should ensure all entries are flushed to /var
-        status, output = self.target.run("journalctl --sync")
-        # Get the amount of entries in the log file
-        status, output = self.target.run(check_log_cmd)
-        msg = 'Failed to get the final size of the log file.'
-        self.assertEqual(0, status, msg=msg)
 
-        # Check that there's enough of them
-        self.assertGreaterEqual(int(output), 80,
-                                   'Cound not find sufficient amount of rpm entries in /var/log/messages, found {} entries'.format(output))
-- 
2.30.2


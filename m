Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.17016.1620554456003972358
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 May 2021 03:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eqeIZs3r;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id x5so13535269wrv.13
        for <openembedded-core@lists.openembedded.org>; Sun, 09 May 2021 03:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iQjObk3eOOUa7iR3AXOXfdTgdPmj1PiKjdEYOsqpLiA=;
        b=eqeIZs3rLj1SrSgn0KqydOKPoeayk4iuoenUYRQgbYwqODRr6W13xdX7e7pIev3qgT
         6folc/6oaB9IxytaasqXT35JB00ROSFO8iD+XMGTtGj2W2N9cxdz3d9lrXJYREAiDuiN
         AhEteNkv9q1IjhuzgvxKnm5vJqL4vszXdKd9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iQjObk3eOOUa7iR3AXOXfdTgdPmj1PiKjdEYOsqpLiA=;
        b=AOTfPmmXnsCeAJVAgq/OmDXKpxE46JdP1AJnjwC07mVvbTHZfxYGbVlngqxfnuKnhG
         wEUP6kR5PcK2XWiUX6NL8HCcaFjRgAL687M50EgyNC7N2b+FjGcwQRWX8yYqGsLSl8XC
         ldTJlAqLE//pjSysPVXF7vCmJISYXTN6Fde64Z3jTSA6zosFo/DeeG+2LE0x62e7twKQ
         QaP4Eoalak/kxtDMXyKzb4JtVkg2QiiiKqNZYmJpP9P8e0ueOtpofpioLHq4EjnD+GF6
         nwXX7n/9j1EeL9fqV73YbISHXQ7Bue71ON6K1byXPtzJy+y8HrBMzieze2xoyc3VVWub
         k7qw==
X-Gm-Message-State: AOAM5330kt30B9xSsp0h3KFqpEqfRsn1usAIfREQCh2Hl2R0Ui8NU/2o
	QsG1Z30WPbNocGha6D8n8sZ3YPUsPWcVZA==
X-Google-Smtp-Source: ABdhPJwau3SUtHGoD00QVEhMAQ8ebQsUY3+P7Ib1V7+fVjoyoSDJ3CE6npJWCAN3Ym6LCv8zoZKIfA==
X-Received: by 2002:adf:e0c6:: with SMTP id m6mr25258356wri.66.1620554454359;
        Sun, 09 May 2021 03:00:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2a5:760d:7a5d:1e99])
        by smtp.gmail.com with ESMTPSA id m5sm3762235wrs.76.2021.05.09.03.00.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 03:00:54 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/qemurunner: Improve handling of run_serial for shutdown commands
Date: Sun,  9 May 2021 11:00:53 +0100
Message-Id: <20210509100053.2116771-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When running a shutdown command, the serial port can close without the
command returning. This is seen as the socket being readable but having
no data. Change the way this case is handled in the code to avoid
tracebacks.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 899152c7adc..e6137053887 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -73,6 +73,8 @@ class QemuRunner:
         self.monitorpipe = None
 
         self.logger = logger
+        # Whether we're expecting an exit and should show related errors
+        self.allowexit = False
 
         # Enable testing other OS's
         # Set commands for target communication, and default to Linux ALWAYS
@@ -543,6 +545,7 @@ class QemuRunner:
             self.thread.join()
 
     def allowexit(self):
+        self.allowexit = True
         if self.thread:
             self.thread.allowexit()
 
@@ -604,7 +607,9 @@ class QemuRunner:
                     if re.search(self.boot_patterns['search_cmd_finished'], data):
                         break
                 else:
-                    raise Exception("No data on serial console socket")
+                    if self.allowexit:
+                        return (1, "")
+                    raise Exception("No data on serial console socket, connection closed?")
 
         if data:
             if raw:
-- 
2.30.2


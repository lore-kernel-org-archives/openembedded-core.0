Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.19458.1620571674489716165
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 May 2021 07:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TgSmdk0u;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id d11so13941615wrw.8
        for <openembedded-core@lists.openembedded.org>; Sun, 09 May 2021 07:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dRvY2Muc/QE4xRsIDEI9++u7ymL9+z6C8LC/PPJJq1A=;
        b=TgSmdk0uM4Yv6yCGAJYbvGVnRFVhIqtqzSU2j+t/kMm8w1lqBcqnMyoIkk6AP4NX5e
         FMHk6pNenLj6dyeBUgHcB6xNDq46j8XKFkXe/YOwkXhWSKfVW5UGuoV/cDyVhief38FC
         yYZ1C73bNIM6/4eIlRC1NyGE8pYPtOIYb4a4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dRvY2Muc/QE4xRsIDEI9++u7ymL9+z6C8LC/PPJJq1A=;
        b=EUnymapIADN+EBldx6b7s6/vxGmwSjGglVO7lw/19vsGe2yIyyKcxOQtlTlElhadLK
         dmar0wfUB38utNVWCjOAGwnZVdd60NWjYFLPgJe9nQf6X2n7InqQ7csq2MidhCRa/GIG
         Gp90SGbsspDnQpc5zPvObRYM1KLRKsdjUMCijAceJwoZRYUzJeVhyt7Lzf8dAtAGHatp
         1al6EulkDAwsy7lrU/Ph59D1xDLUPCIItI17E8CHhMTPeCxL0Cp8aSJJG4aFuze3/lF5
         kA+ynTzZP9ybUPcAteQSRXuZeE5Xq6oW/UzevJBZofqZnqP37HLutST9dJkBsJjsJLbe
         rxtA==
X-Gm-Message-State: AOAM5300r3WWyFmloRNnmTN4wV7BaHDkASIhJxBdNFgEdtEV4N9hkNUQ
	x0+crsB8hD/P/9HPX8mq/Wc5g4qqWXsesQ==
X-Google-Smtp-Source: ABdhPJy3sIUm2BkbOs5T4ALEd4lmLgvbY802HZyyQCflUwN1SqrcXGM2R3qf6zeILjQjHoRHhMHdtw==
X-Received: by 2002:adf:f74d:: with SMTP id z13mr25236502wrp.147.1620571672597;
        Sun, 09 May 2021 07:47:52 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2a5:760d:7a5d:1e99])
        by smtp.gmail.com with ESMTPSA id f25sm18307225wrd.67.2021.05.09.07.47.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 07:47:52 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] oeqa/qemurunner: Improve handling of run_serial for shutdown commands
Date: Sun,  9 May 2021 15:47:51 +0100
Message-Id: <20210509144751.2125002-1-richard.purdie@linuxfoundation.org>
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
index 899152c7adc..4f094e29c73 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -73,6 +73,8 @@ class QemuRunner:
         self.monitorpipe = None
 
         self.logger = logger
+        # Whether we're expecting an exit and should show related errors
+        self.canexit = False
 
         # Enable testing other OS's
         # Set commands for target communication, and default to Linux ALWAYS
@@ -543,6 +545,7 @@ class QemuRunner:
             self.thread.join()
 
     def allowexit(self):
+        self.canexit = True
         if self.thread:
             self.thread.allowexit()
 
@@ -604,7 +607,9 @@ class QemuRunner:
                     if re.search(self.boot_patterns['search_cmd_finished'], data):
                         break
                 else:
-                    raise Exception("No data on serial console socket")
+                    if self.canexit:
+                        return (1, "")
+                    raise Exception("No data on serial console socket, connection closed?")
 
         if data:
             if raw:
-- 
2.30.2


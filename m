Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web12.8357.1620831541806648770
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 07:59:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=lNJjQdwc;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.47, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f47.google.com with SMTP id i23-20020a9d68d70000b02902dc19ed4c15so16813168oto.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 07:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wQZDN47I90+2Rna5FAy4BeXXmL1bh95BnohE+ebJx+s=;
        b=lNJjQdwcf6LK9IgyFqv9dqWo6GP4dnCtRww1PxFW9FdYpLWOpIH0MzoZkhWSgTNy7L
         QHLJ1E9xO0hxNg9bgEA6kYBV20rtzYmFgG6FOu9vHo6o831yCg06dbngpJbhkXqmfjOL
         v144RXGPq+6zqA9JGcoqUjVQuSpXOOMrorik0dDI2kgAHfNTNbsb6o0SwILsAv0hrNJt
         wzhlThda3QJq7RR4JqwQxXQ8hK2TVp++lgz/sWNGjeJZ+BWlCGQyfaZCWAuyP4uxcTIf
         uuXTzu2xxe2WRbo08illlpDn4qSmK82c02jNqo97BNUgUe+Y7/eIKJnfyKCqbUdabKiA
         YojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wQZDN47I90+2Rna5FAy4BeXXmL1bh95BnohE+ebJx+s=;
        b=Vc7hXvfgH5i3LSkVRvQfInCOYI/sY7ljfvlN6euWJn3XIHifO1WroM0nnuTFHSPVM2
         LHlVGC5B5XpFWh8pf4/jrmHd+3vhzSyStGjPWPz/Z2USV9DoqiScvfgHxKND/j/BHauu
         i1HRbwjkJ3GPtVuk03CiTyVf4YpHLphIVqdfrHFMD3vj7Lq7hfE+piZAGWIE2esLnRZD
         ul2Zk5mRBlcKfbRmEb+Y0oO6w3mrs28J6OjEgzUVTh6khJjsoJ42y4UIRLi5LAqYe3sf
         IxXNiz2ysB0jWG1k7RW6Z0diMThH8G83b1LYGH1GAkP1nkDmma68EdGIXn4QyuCbMT23
         YGeg==
X-Gm-Message-State: AOAM531NZ7GHzddKe6N2fZm8kdMgV8Oxg9mDGYXBhddAwpLTXOWlYpKp
	0k/Yg2tJ768D0Mj3S4WI5gbQJPKufdZMpWLcKpY=
X-Google-Smtp-Source: ABdhPJwvNNFGQaC65dwMhRrc5heMf3kmW8os8Uf0/RfBbmxiFcae/oeD4rlojbY/ZITfedXEH2TEhg==
X-Received: by 2002:a05:6830:1dba:: with SMTP id z26mr10090034oti.133.1620831540719;
        Wed, 12 May 2021 07:59:00 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id 21sm1678otg.4.2021.05.12.07.58.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:59:00 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/22] oeqa/qemurunner: Improve handling of run_serial for shutdown commands
Date: Wed, 12 May 2021 04:56:55 -1000
Message-Id: <a7590631e5263e8924a4f516fe7acc7eaba97ff4.1620831171.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620831171.git.steve@sakoman.com>
References: <cover.1620831171.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When running a shutdown command, the serial port can close without the
command returning. This is seen as the socket being readable but having
no data. Change the way this case is handled in the code to avoid
tracebacks.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 396a3ba884820d040c91f7592daf20ac28c49b5d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 09ef9fadb2..79db2cc247 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -70,6 +70,8 @@ class QemuRunner:
         self.monitorpipe = None
 
         self.logger = logger
+        # Whether we're expecting an exit and should show related errors
+        self.canexit = False
 
         # Enable testing other OS's
         # Set commands for target communication, and default to Linux ALWAYS
@@ -468,6 +470,7 @@ class QemuRunner:
             self.thread.join()
 
     def allowexit(self):
+        self.canexit = True
         if self.thread:
             self.thread.allowexit()
 
@@ -526,7 +529,9 @@ class QemuRunner:
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
2.25.1


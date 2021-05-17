Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.19527.1621260896622392414
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:14:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=hYqsLUph;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id m124so4716651pgm.13
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wQZDN47I90+2Rna5FAy4BeXXmL1bh95BnohE+ebJx+s=;
        b=hYqsLUph7lalq7j9Ogrkau8kSvrduw+AbeJPPNZGm08GOBYhCWZaTVwLnmOWACnLEZ
         zF0l8/qmmI/QlJvbnm0VENC1mlKqIgisWeaHLZdOuKwBqlEyy9eH5Uf+h2xanKKI+6bY
         oilB6qRHMgEIJpCnBVfoFB0ln7sZsl7gh03Vt0f/V3tW+jioMDN+XEuDEZd3lm2RMd2U
         5XXlozYSyl2niH3vYQKo9i2Y0tGwkfIuJeuD15wzuNAyeiamHgePPs9l1aCI9aBHfvsa
         2tNsEwbD7tjSvbibr8djEYdMw/+zk7ypSpUR8kmbIlRmHbqZoa6Fag+dYXtpIsRy8PVT
         lYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wQZDN47I90+2Rna5FAy4BeXXmL1bh95BnohE+ebJx+s=;
        b=YHwaPfz0BMnyDzUj6LZ8hhsrxzTkbzflRoknW7DEdstwWtbQHQr4us8Vt90Rqt1YwY
         6E0X3n/A37I/POolvGXEJOvDlf6YoWMSHqj5Q6czl0KfIMg8lhNfv2b5SspC949o40cq
         QyILKyUOptiUgcw3QelCVecmd5Af60U+yxyfFKxTavw7c3uLIRPBCa6M7Ig3zC8rvVrU
         65yYgIhM+QxDEYeXNDTgFt+86raNrpEvBdhfQzhGICZkjeXcFUe9t2ugKzP7WBdU1mux
         Y4S/iChutbcbm+KnsfWVzbZxs8ooEmjHKrjcfG9rdnh1pIzGkAyykjdgryfAvmeGQ2lN
         82UA==
X-Gm-Message-State: AOAM530rWtiavFINLAXxfHG1Jic+oxNZ9oNWiukjUq5120/fXzdXty8u
	kVpIqgwldz2CHtj+FT2N/0g2UqHYRkWQKJAzxBw=
X-Google-Smtp-Source: ABdhPJyoh3v7cCnFlGNIF5XF2PrsS2m4GHTNbnXyxkTUt4WyzsotR3ZFRTVI7Zwt5hoPnWqoOb6JVA==
X-Received: by 2002:a63:8149:: with SMTP id t70mr61609565pgd.299.1621260895761;
        Mon, 17 May 2021 07:14:55 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.14.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:14:55 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 26/35] oeqa/qemurunner: Improve handling of run_serial for shutdown commands
Date: Mon, 17 May 2021 04:13:32 -1000
Message-Id: <9c0b242856de519c58be179f82441a35fc635ad9.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
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


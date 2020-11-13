Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.5354.1605279185116044547
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 06:53:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=JPpalEp0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id b3so4621578pls.11
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 06:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=SJ2lfM01JrTSYYd1RH6iUhXJstr45NPhARyOFiNkZXc=;
        b=JPpalEp0adwc+CukMhQmcLEwuj6P2iBB2GK5eOtAG3NF4Uhp4MpjNOePCtUHGSffZr
         eYGQcSUHNViWygi6IOAB+v7B/Oz4eN3EcJuhO9ImK+BF8qMGxDzFlTIaBBewE0AdasLL
         os2LfRfewa862XYLcHnkC0WQafw4XFoaDu8LwA2bgiV4FAQySze5MgHuuRQwtCYe8WNt
         qP7RNrf9vXb1jszt5maMsUMcZ2pOi6V3TqSk8I3XbCqoDVGKyq3INDhlwCjnmgZ2PVZ9
         rHcvBaCQ1des9Bc0lu0olasR6p5bP3vwTIgL2SFLHNMcD1lUMflEdMnDP3bgFGAHpXSD
         hHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=SJ2lfM01JrTSYYd1RH6iUhXJstr45NPhARyOFiNkZXc=;
        b=ub7sh8bjYmZGSeO9lpH+IXK3c3cL/lU4anW/xs8aV+rkwYZ7IE1lJvE3CLsGhmna1M
         GT+rc/ofaQHLuB+4uKD+Y4HIbTgwUvaZEcnL9VO76rAV1+xoueD3NQjSsxDBnK3HWmt9
         DPlFkscGlyDT+Sw3x4oStWQcCjVmu3+h4nsGPX0gL6iU8bZZcvDE1r36QNDr/xVR7LZD
         s/qoddtRN44oXf9XnbfuylYmz5jBqBPKgbh7ZwlWc1mPUVJ6t3AzdSVpQ8xTreM5kfnz
         plYeysf5oXTD0OLx05bC8zZSh0/LAledAphRr/FvY5e6XizCuy4ZDmaeaDvg/4d507Tx
         8VMw==
X-Gm-Message-State: AOAM5337ZIXm0HQbR2IEKbgYu0TOR4axgeViXC/p1KxBy+reBTR8MwPI
	D/F8wbxoaQgjOZbxIwNB4R49WEuLoTAylKRL
X-Google-Smtp-Source: ABdhPJyfdgaW7AdYJ6DJAlcH4Tq65FmQVY7FP9nUK5MLsMniK0dbAPxrVPO+ZJSnZ/JD9L/j6bWGMA==
X-Received: by 2002:a17:902:bd8e:b029:d4:c98b:c315 with SMTP id q14-20020a170902bd8eb02900d4c98bc315mr2578767pls.69.1605279184173;
        Fri, 13 Nov 2020 06:53:04 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r134sm10370694pfc.145.2020.11.13.06.53.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 06:53:03 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/18] oeqa/core/context: expose results as variable
Date: Fri, 13 Nov 2020 04:52:15 -1000
Message-Id: <07a3ea1aece5c67d75b60417ee0978cc0e15719a.1605278902.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605278902.git.steve@sakoman.com>
References: <cover.1605278902.git.steve@sakoman.com>

From: Konrad Weihmann <kweihmann@outlook.com>

register an unittest handler for testresults and expose it as
variable result.
With this even partial results from an interrupted test suite run
can be made available

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a97ae47525157871b6c098ffc352293e365a4335)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/context.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 4705d608ac..4ce3089ad0 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -31,6 +31,9 @@ class OETestContext(object):
         self._registry = {}
         self._registry['cases'] = collections.OrderedDict()
 
+        self.results = unittest.TestResult()
+        unittest.registerResult(self.results)
+
     def _read_modules_from_manifest(self, manifest):
         if not os.path.exists(manifest):
             raise OEQAMissingManifest("Manifest does not exist on %s" % manifest)
-- 
2.17.1


Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.7431.1618831010416934416
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Apr 2021 04:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bl48LfNq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id w7-20020a1cdf070000b0290125f388fb34so17832518wmg.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Apr 2021 04:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ydanm/9GHVnU+oAy8eOmC6Pa4BcU48BDfqBIZl1atI0=;
        b=bl48LfNqAIq5IJeSwxXV5grDOHToG9fJgxP9XSeM1KnlA4Y0dqJkR29a1V3a5VWFJ6
         PhIhLelChH/P6IC86Z+JBgS1P3jYeDRtyAnCXd+snNeFUqrGFztLnekKEY3YKjHPI6Qj
         VaOFNrCBndf5hcgJoAaC72JNS7m85xgvjnauI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ydanm/9GHVnU+oAy8eOmC6Pa4BcU48BDfqBIZl1atI0=;
        b=mX2+iiKa5wOJgBmR/CX6VLaRZ4lzZFdypCxN2tDj9kO1Ip1/y1TywPdZlFrmoYZmbi
         fv/ypMOvlvRrxkx4XN7KCjIz7xFHBR5NmtN1Pb2VFbnnIyzmsgo5dly+penMZ2jWTvWT
         gXvQzo/8burME/1dNLG5w75HutXmlzzNJXjYIFyogIDjcHpwcN2qtMfrypxyhndmqxl0
         wighUxjdC4Qiguy6/gXDumIBccrhSFjl7gxEw4Adn4Q+UeTexRsPSFs+hvz1LNCvVz/R
         68SoKQ4Vf9ybNBhBLIoaPiY1OaTUuWKSrnJ9W9JdnmPKJTRCn/grnhWLJXYkCxEYpN2n
         bWQQ==
X-Gm-Message-State: AOAM531dVx3Cu8Ofkqoft4FHF8ynwIJ7bZCsh1//dgY9DFfo6PR3DY4I
	HpNBn9Xlt/jNuugREZLj5mXamWpS/HYHKg==
X-Google-Smtp-Source: ABdhPJwFiP4FyMQ97XvZ6eicFJmC5jmQXFOdfFrlv1RyqPm+OmwLiEJYutJyLVF1cufdDZQyO1BxNQ==
X-Received: by 2002:a7b:cb4e:: with SMTP id v14mr20793168wmj.47.1618831008662;
        Mon, 19 Apr 2021 04:16:48 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:3b9d:2a57:e60:cfc4])
        by smtp.gmail.com with ESMTPSA id c2sm19199037wmr.22.2021.04.19.04.16.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 04:16:48 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sanity: Further improve directory sanity tests
Date: Mon, 19 Apr 2021 12:16:47 +0100
Message-Id: <20210419111647.1465532-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tests to ensure COREBASE/TMPDIR doon't contain ".." as this causes
hard to understand build failures.

Also rework the code to test TMPDIR and COREBASE for all the patterns
since they may be set differently and one may contain problematic
characters.

[YOCTO #14111]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sanity.bbclass | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 14ffac0bf28..a377917f2a9 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -882,15 +882,18 @@ def check_sanity_everybuild(status, d):
         except:
             pass
 
-    oeroot = d.getVar('COREBASE')
-    if oeroot.find('+') != -1:
-        status.addresult("Error, you have an invalid character (+) in your COREBASE directory path. Please move the installation to a directory which doesn't include any + characters.")
-    if oeroot.find('@') != -1:
-        status.addresult("Error, you have an invalid character (@) in your COREBASE directory path. Please move the installation to a directory which doesn't include any @ characters.")
-    if oeroot.find('%') != -1:
-        status.addresult("Error, you have an invalid character (%) in your COREBASE directory path which causes problems with python string formatting. Please move the installation to a directory which doesn't include any % characters.") 
-    if oeroot.find(' ') != -1:
-        status.addresult("Error, you have a space in your COREBASE directory path. Please move the installation to a directory which doesn't include a space since autotools doesn't support this.")
+    for checkdir in ['COREBASE', 'TMPDIR']:
+        val = d.getVar(checkdir)
+        if val.find('..') != -1:
+            status.addresult("Error, you have '..' in your %s directory path. Please ensure the variable contains an absolute path as this can break some recipe builds in obtuse ways." % checkdir)
+        if val.find('+') != -1:
+            status.addresult("Error, you have an invalid character (+) in your %s directory path. Please move the installation to a directory which doesn't include any + characters." % checkdir)
+        if val.find('@') != -1:
+            status.addresult("Error, you have an invalid character (@) in your %s directory path. Please move the installation to a directory which doesn't include any @ characters." % checkdir)
+        if val.find(' ') != -1:
+            status.addresult("Error, you have a space in your %s directory path. Please move the installation to a directory which doesn't include a space since autotools doesn't support this." % checkdir)
+        if val.find('%') != -1:
+            status.addresult("Error, you have an invalid character (%) in your %s directory path which causes problems with python string formatting. Please move the installation to a directory which doesn't include any % characters." % checkdir)
 
     # Check the format of MIRRORS, PREMIRRORS and SSTATE_MIRRORS
     import re
-- 
2.30.2


Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.22928.1617030972847009914
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Mar 2021 08:16:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wrrx/X9T;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: devendra.tewari@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id y12so2421506qtx.11
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Mar 2021 08:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RYS3a0T4OSg2ilgoqno7/m4TL+zX9sQJOq2nMgIUq6c=;
        b=Wrrx/X9ThzolnZ4g+HZ1gxlTa45ZCf+asc3/WAEOfPkgCrbISlGbR7GYKPemTkWNqD
         i6uCFKs25+5jbhDXbpZCFEf6Uvo50FM+Bt1ewJjsyIH3k9M2Ysx96GjK6frwuUltGppY
         SxKTc7j87UGAhxIShHAKa9+XZg87CWugKm+kzksu60Fzfh/S1tgUdjU+8W5agmWoghQ3
         kkZaq+iy9sYTbcB60p+trsLJkT+gCcd8a7oUZdKMbbN8uE40NSbslk8EX6GCoib2PDT1
         kZg6bNV8G8KwR/vBbQNLWLyMAUymO0Ed6pKtokJ7pzAJKsJ8t93x728NppXrLpyHL/9K
         gDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RYS3a0T4OSg2ilgoqno7/m4TL+zX9sQJOq2nMgIUq6c=;
        b=H90q3SVOSQsIcONGDPhvPxuW0ZJHtX119I9W1Y9zsFVOIAlSaDCgJyKxKOyI3uSOpc
         TsLhiyO847H8RPEMAmbwZJIPYXlrlFQcqwoXolSsblR+IsiFlly7exXm4L+aocWvuImw
         qpiC+H0cAFhE5IoM1yLDHtdQygvZFDSPigw6IzFbWMxZ8qGVkmhTIyGbAFP3LaYZB22Q
         fX111tHg70Cm5g5vbwoeMFxmPCyQAHUwgV5CsN5klsSbpcUfpUGZOpEHVloSdtaAYZyE
         ExkKM78spOGd+mveHKs0gM1dkR38oajCnvubgtBlS4Hzv5c7s85DWKn7jKVQtTi5qzfp
         6ReQ==
X-Gm-Message-State: AOAM530NwRxEZB7xLuabcXBufFesBhXteN6JOhK6usmfEdPfQtUXKWwm
	X9KCPEPaAE9ZxKAd2I5O56KmymzTchRKmw==
X-Google-Smtp-Source: ABdhPJzk2WLwPF/omWnXmWVRUN/tsi0cV7GRuGsKvzA1/4cRyukffPRWYXktx1jg9jeKFxwKPuFs8Q==
X-Received: by 2002:a05:622a:188:: with SMTP id s8mr23037818qtw.42.1617030971600;
        Mon, 29 Mar 2021 08:16:11 -0700 (PDT)
Return-Path: <devendra.tewari@gmail.com>
Received: from ma-mailsvcp-relay-lapp03.apple.com ([2804:14d:5487:a7d6:c0bd:9fb5:3b:e2c2])
        by smtp.gmail.com with ESMTPSA id n1sm5901483qtp.76.2021.03.29.08.16.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Mar 2021 08:16:11 -0700 (PDT)
From: devendra.tewari@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Devendra Tewari <devendra.tewari@gmail.com>
Subject: [PATCH] Use shutil.move when os.rename fails
Date: Mon, 29 Mar 2021 12:14:42 -0300
Message-Id: <20210329151442.86306-1-devendra.tewari@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 meta/classes/sstate.bbclass | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index f579168162..f94aa96d70 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -384,6 +384,7 @@ def sstate_installpkg(ss, d):
 def sstate_installpkgdir(ss, d):
     import oe.path
     import subprocess
+    import shutil
 
     sstateinst = d.getVar("SSTATE_INSTDIR")
     d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])
@@ -401,7 +402,11 @@ def sstate_installpkgdir(ss, d):
 
     for state in ss['dirs']:
         prepdir(state[1])
-        os.rename(sstateinst + state[0], state[1])
+        try:
+            os.rename(sstateinst + state[0], state[1])
+            break
+        except OSError:
+            shutil.move(sstateinst + state[0], state[1])
     sstate_install(ss, d)
 
     for plain in ss['plaindirs']:
@@ -413,7 +418,11 @@ def sstate_installpkgdir(ss, d):
         dest = plain
         bb.utils.mkdirhier(src)
         prepdir(dest)
-        os.rename(src, dest)
+        try:
+            os.rename(src, dest)
+            break
+        except OSError:
+            shutil.move(src, dest)
 
     return True
 
@@ -638,6 +647,7 @@ python sstate_hardcode_path () {
 
 def sstate_package(ss, d):
     import oe.path
+    import shutil
 
     tmpdir = d.getVar('TMPDIR')
 
@@ -664,7 +674,11 @@ def sstate_package(ss, d):
                     continue
                 bb.error("sstate found an absolute path symlink %s pointing at %s. Please replace this with a relative link." % (srcpath, link))
         bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1], sstatebuild + state[0]))
-        os.rename(state[1], sstatebuild + state[0])
+        try:
+            os.rename(state[1], sstatebuild + state[0])
+            break
+        except OSError:
+            shutil.move(state[1], sstatebuild + state[0])
 
     workdir = d.getVar('WORKDIR')
     sharedworkdir = os.path.join(d.getVar('TMPDIR'), "work-shared")
@@ -674,7 +688,11 @@ def sstate_package(ss, d):
             pdir = plain.replace(sharedworkdir, sstatebuild)
         bb.utils.mkdirhier(plain)
         bb.utils.mkdirhier(pdir)
-        os.rename(plain, pdir)
+        try:
+            os.rename(plain, pdir)
+            break
+        except OSError:
+            shutil.move(plain, pdir)
 
     d.setVar('SSTATE_BUILDDIR', sstatebuild)
     d.setVar('SSTATE_INSTDIR', sstatebuild)
-- 
2.29.2


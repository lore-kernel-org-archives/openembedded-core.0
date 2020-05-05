Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.7074.1588683744860082493
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 06:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XEB/mrWx;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id u16so2228818wmc.5
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 06:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1C0qRRFrCu/baAKXDYpClmkqBZ+CmCguvzyEqTSvJnk=;
        b=XEB/mrWxSp/A3uALoovzglMrsJxAv3EQm8l/XSiTTzsA6TTh+bTWVaZy/r3++B8XY1
         UiHqWxaPJah6SRcdTB27D3Ho7NhPcj55Q1Zi7qe/dECNPO1bvUnJnHROA2RhXpLmo/RS
         FlRyFJTsWJqkeansYdORKLuVHIuzVKsnIn4tihHbUCeu/Ak6F3RPk7Oi5sqUFZGAG/Ym
         7qr2WhUkzW3hT36f4G4QLMRgnwC+XbIV9NkI1+TJgGWwvvck4manlei7pCAbXucs2h06
         qkUo8fpcwGLny87RzKNBF00lD68xwL+WGttI0q4/gF1MCh3oL9hn8+eyGm4iMQGSdsFE
         ArHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1C0qRRFrCu/baAKXDYpClmkqBZ+CmCguvzyEqTSvJnk=;
        b=f3fzfHW6hZS0Q4SlWFDz/7G8WRkIlqKGGx1nuQN2QxLB4lfukRN6xZUxQUbna1+qpl
         hf0aheW18fV80HkaWoya8/5TCIwvOzUK7VAemL3+xBmXlmZ4ZEZRNWeorJhGtXuRm55A
         51rijOO9xV91oGmD+TSqLm74qt6nyzbEvkbtZc3la1RmnECCEVBrzxlVaeHsnzYXk0aK
         RWndV2zQlSlkUbqxQbg9sq689EQT+kwJNIJmHnmRR9fnGkQ82lXdqLLleRA6UqcOwMR1
         Dto2XrcFM6CRSb9FdMMrJAFExhkLbiIKkPRzb5UYBWMuTJxTTA2e0tQbNoEHXcJ0MGgE
         43DA==
X-Gm-Message-State: AGi0PubMm3TW+N+JsX5glcDpUMOAygoJ2//lfZWYqCVW/4ywRyzzUqD9
	ZUnUyknhhvh9VxK1sKiL9JXRsmos
X-Google-Smtp-Source: APiQypKKyp7uWhDWXJEk1hgCYxosazhUvk/xsNISDeILZCjQ5Wfk2I8slKsbhYWR6h8iwKpKak3dRw==
X-Received: by 2002:a7b:c772:: with SMTP id x18mr3426153wmk.39.1588683742761;
        Tue, 05 May 2020 06:02:22 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id h16sm3388113wrw.36.2020.05.05.06.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 06:02:22 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 23/24] testresults.json: add duration of the tests as well
Date: Tue,  5 May 2020 15:01:32 +0200
Message-Id: <20200505130133.24930-23-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200505130133.24930-1-alex.kanavin@gmail.com>
References: <20200505130133.24930-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is printed by testimage, but isn't actually saved.
It's a useful metric for tracking execution times.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/core/runner.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 1284295c34..00b7d0bb12 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -182,8 +182,10 @@ class OETestResult(_TestResult):
             (status, log) = self._getTestResultDetails(case)
 
             t = ""
+            duration = 0
             if case.id() in self.starttime and case.id() in self.endtime:
-                t = " (" + "{0:.2f}".format(self.endtime[case.id()] - self.starttime[case.id()]) + "s)"
+                duration = self.endtime[case.id()] - self.starttime[case.id()]
+                t = " (" + "{0:.2f}".format(duration) + "s)"
 
             if status not in logs:
                 logs[status] = []
@@ -191,6 +193,8 @@ class OETestResult(_TestResult):
             report = {'status': status}
             if log:
                 report['log'] = log
+            if duration:
+                report['duration'] = duration
             if dump_streams and case.id() in self.logged_output:
                 (stdout, stderr) = self.logged_output[case.id()]
                 report['stdout'] = stdout
-- 
2.26.1


Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web09.14709.1618413558395015774
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 08:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=p84nksKk;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id gv2so749749qvb.8
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Apr 2021 08:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JNJddTUrwcoXcuTpFKhRcecPTTcFpbc80pdSsh77mgc=;
        b=p84nksKkrJq1HOASKQgrcN+/hYHLrqZ9+QhynU+58MhyELz2qLp3ZiutMEQMn1M4yy
         7ecWg43/9KZdj0hPqF5Qemsf/hlKvxbjDpG9Pm/Qv9W9EetEGNRb2Loo6fQmBqa3/wbC
         6yXlyzpSo1bvSjXkX8rO0u47QFp9WXpAotnyV4YErbbeTO2/j7AkPkAoF5vAN23Puz+x
         ySKwRgt8DvBqgZBEi09NtKtBIghEdtyNVQJihtXJd0wstzKH8w5Ap2jZU1749ueSO0Db
         hr6VEZlJ3AMIdoxZLaFpiIRlcgRIkEuyX13U4XCqFcbjGVQ3HEPajGPyoVYgIoU3bHJu
         tdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JNJddTUrwcoXcuTpFKhRcecPTTcFpbc80pdSsh77mgc=;
        b=gYFFmCvK4pXf/4ltRvM99S6zGKlksvkaoLaTyLIRmi3ozfJWPOiBz58ilNT9O9mhbi
         vkTqtiQVK6SiXiqrt9bIi577uDa6lqkOwn6qwsFy+8KB2nrLRvUPdY6RiziLaLSdf/OF
         IW132LreBJOhFG2B1q2X27B34lGumtEqeGalZF4eo6+J+UEEDuL7GacvKZhhFAe8do4t
         hbnFDaGLkcjgFpOZxeENcAHxEGr5Fkz/PrJcW4M602fBkfsyai59aXf16uY0/iCe9NOA
         raPunfRfVRhVJVBIc5rQInp5mAfjadXJJInf6Z2SCfcDI7p3dUofEVy2HUtUYGb4LFeA
         cv8Q==
X-Gm-Message-State: AOAM5320uEhLiY3/zCKE7ejmZrclPaLHQbYv3u9kn4qSJ9nVlKPLUoHB
	9WfL3iTO15SVXQed2alyfj0OJ1lDgt19ew==
X-Google-Smtp-Source: ABdhPJyjTHumdhg+OzZP1AdwurLMGRYGnbXfagl/O6/8zZ9Z11UDDXbuaDCRZOuGLw5xM3momtNQzg==
X-Received: by 2002:a05:6214:849:: with SMTP id dg9mr302651qvb.30.1618413557407;
        Wed, 14 Apr 2021 08:19:17 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a601:f800:fdd8:668a:3c97:6f4d])
        by smtp.gmail.com with ESMTPSA id x82sm9710752qkb.0.2021.04.14.08.19.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 08:19:17 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/runtime: space needed
Date: Wed, 14 Apr 2021 11:19:16 -0400
Message-Id: <20210414151916.14863-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Messages are currently being printed as:
	Test requires dropbear, oropenssh-sshd to be installed
but should be
	Test requires dropbear, or openssh-sshd to be installed
Adding the space after the 'or' corrects this.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/lib/oeqa/runtime/decorator/package.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/decorator/package.py b/meta/lib/oeqa/runtime/decorator/package.py
index 57178655ccab..2d7e174dbfdf 100644
--- a/meta/lib/oeqa/runtime/decorator/package.py
+++ b/meta/lib/oeqa/runtime/decorator/package.py
@@ -45,14 +45,14 @@ class OEHasPackage(OETestDecorator):
             msg = 'Checking if %s is not installed' % ', '.join(unneed_pkgs)
             self.logger.debug(msg)
             if not self.case.tc.image_packages.isdisjoint(unneed_pkgs):
-                msg = "Test can't run with %s installed" % ', or'.join(unneed_pkgs)
+                msg = "Test can't run with %s installed" % ', or '.join(unneed_pkgs)
                 self._decorator_fail(msg)
 
         if need_pkgs:
             msg = 'Checking if at least one of %s is installed' % ', '.join(need_pkgs)
             self.logger.debug(msg)
             if self.case.tc.image_packages.isdisjoint(need_pkgs):
-                msg = "Test requires %s to be installed" % ', or'.join(need_pkgs)
+                msg = "Test requires %s to be installed" % ', or '.join(need_pkgs)
                 self._decorator_fail(msg)
 
     def _decorator_fail(self, msg):
-- 
2.20.1


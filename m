Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F33C433F5
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 14:21:31 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.10088.1633357290656884176
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=kvrS2pt6;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id q201so4035100pgq.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8dOjL5duDKBMZRC/QIBfTPGlY7t0DNYktA5hWgZWuXE=;
        b=kvrS2pt6ZfSNFC9UZl6jpGBhntbFcYqZTMt5+ODKkqYDGxSvj5oR0HcOF7DZtzHN4G
         vAuDqnrTBf0hiqKhciHoOlWHFfZ0WKgjPc1NL7WDDhDL6XU1QGEooSMsoNhg4fLK4spc
         lcnECleakS4XmUKr4wkulppXbJ+U/tW67PRQOAYBiI04bPmLnocnRciadg2lvScLghJ/
         N6vwI+ReYX+sUc/DrPFyqpsGUE+PtwelQh728t3HEeKO1ynkSuek1rek0hZjAw0r6HWu
         cZfsxk8PRCq46e69ugigUQoWLS+zzyTMwWnE4UJX4ekTkTk/Ld5u/gUlmgp6CJaMsnlr
         EMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8dOjL5duDKBMZRC/QIBfTPGlY7t0DNYktA5hWgZWuXE=;
        b=JssmqgmRpR2Mfg4I03czso7GRPVjVCQKtdrgeaqz+SSJklcKsm+g1m/xkDadeqy/1s
         DsDgfGYnLd482MWVNErHRqSI+fvT2bCbJDvbEfnTWt39IfzFNoTtbL9W9R9zinRFpveI
         8oqMdwK+tnLwZLK+xPAVmF4kyKGvcOVGIDA5/idzfF3MNTMUUilrmTAeO3qCaoNbLjuH
         QfRK9dHKwsrupsPEHTbqqt7Fcix/yDc0dqK+6SGPPrST5s2JyRuWiN4bV+YQAV1wXB7Q
         eiP1xohzf+1N67TGVnmbxF4eSr1+KVjYqr+/qlWeiKHvS+HGT/frF9PJ/v56GSYZpR+J
         caWQ==
X-Gm-Message-State: AOAM530kPsj+HR1X3aPR60Fx8+XEWEhZ7oRrCfZjYuIoViVonOI5gNye
	ziMBgAktZlIerda4qJMtY6UB8dzytXyqJDYFnc4=
X-Google-Smtp-Source: 
 ABdhPJxeVlbYueT5ujVKN3g3QbzrkicuKTk3R/U0KGv4BdkZIGF1ZR+KF+g3XRKxeWebXo2W8nxPyw==
X-Received: by 2002:a63:5848:: with SMTP id i8mr11123365pgm.281.1633357289747;
        Mon, 04 Oct 2021 07:21:29 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 t4sm8313066pfj.13.2021.10.04.07.21.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 07:21:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/15] oeqa/buildproject: Ensure temp directories
 are cleaned up
Date: Mon,  4 Oct 2021 04:18:42 -1000
Message-Id: 
 <15db91abd152aa3d22d24f951ba7663ab59ff7eb.1633356813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633356813.git.steve@sakoman.com>
References: <cover.1633356813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 14:21:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156607

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d10aff865120a5feecc42c24726bd119364e0188)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/buildproject.py | 3 +++
 meta/lib/oeqa/utils/targetbuild.py  | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/buildproject.py b/meta/lib/oeqa/utils/buildproject.py
index e6d80cc8dc..dfb9661868 100644
--- a/meta/lib/oeqa/utils/buildproject.py
+++ b/meta/lib/oeqa/utils/buildproject.py
@@ -18,6 +18,7 @@ class BuildProject(metaclass=ABCMeta):
     def __init__(self, uri, foldername=None, tmpdir=None, dl_dir=None):
         self.uri = uri
         self.archive = os.path.basename(uri)
+        self.tempdirobj = None
         if not tmpdir:
             self.tempdirobj = tempfile.TemporaryDirectory(prefix='buildproject-')
             tmpdir = self.tempdirobj.name
@@ -57,6 +58,8 @@ class BuildProject(metaclass=ABCMeta):
         return self._run('cd %s; make install %s' % (self.targetdir, install_args))
 
     def clean(self):
+        if self.tempdirobj:
+            self.tempdirobj.cleanup()
         if not self.needclean:
              return
         self._run('rm -rf %s' % self.targetdir)
diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/targetbuild.py
index 1055810ca3..09738add1d 100644
--- a/meta/lib/oeqa/utils/targetbuild.py
+++ b/meta/lib/oeqa/utils/targetbuild.py
@@ -19,6 +19,7 @@ class BuildProject(metaclass=ABCMeta):
         self.d = d
         self.uri = uri
         self.archive = os.path.basename(uri)
+        self.tempdirobj = None
         if not tmpdir:
             tmpdir = self.d.getVar('WORKDIR')
             if not tmpdir:
@@ -71,9 +72,10 @@ class BuildProject(metaclass=ABCMeta):
         return self._run('cd %s; make install %s' % (self.targetdir, install_args))
 
     def clean(self):
+        if self.tempdirobj:
+            self.tempdirobj.cleanup()
         self._run('rm -rf %s' % self.targetdir)
         subprocess.check_call('rm -f %s' % self.localarchive, shell=True)
-        pass
 
 class TargetBuildProject(BuildProject):
 
-- 
2.25.1



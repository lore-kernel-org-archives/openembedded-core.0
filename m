Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D9BFD530A
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 19:39:44 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.104593.1772221181437619029
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 11:39:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HhXdvQIK;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-358fb86de36so2105843a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 11:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772221180; x=1772825980; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NeES2s+uBD88zULu8g66KH2T9piHZLzdE+AztSjjubc=;
        b=HhXdvQIKP1sxMdd1+BUgotI7MEzIqb6yYXTTngb9g2dH6u0k+OZHkMlO5mqEz+9NSI
         FF6QPop5/8OnMTyFqIrF+DBwBJHZ8gexkxoZivu3Txpvt2AaR/jjb0WqtWfU2DDBIzo6
         3G+hdH4yJ8M2U6ude+I1+vSW6aK2hOBq/Ec3/hR27WKLap0XdVJLTANXYRwlcCSXgBlJ
         QlI0UQGYiaxDncJYYuIEIPmzAmp8keAJZvIFBL3Ju852xUcOzNIUVZeFlToFz/kvyG6F
         UGBKuDq+FSWOiCAsvzCG4ObIffdlN3DX9YbqFhLuxYxtxziRNgutv29NqiF64A/zTFph
         foFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772221180; x=1772825980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NeES2s+uBD88zULu8g66KH2T9piHZLzdE+AztSjjubc=;
        b=IkpLzn3SscEst0xCxuIoj8CwVjb+MttlRy5QKKUV4pnwtrZNSbJsD8Ox/sgjKhAEj5
         rJ9KCrvD4FraUmYs5TImMWjYDK//JrZZ4DskA4LnHqEasK0UCA5gdv11XAIifeGSgJ25
         yxBLIGHE6dljlF+Pyuv7L+VW0MVyOr3lmj6faisTpS1z1RrtmT0iUJ6DVpqfKGFr8A/t
         LDnlWRtiEykBdkvgN8dWoVSMp2fiTAZtQAb2E36FUJuaL5pPwdYcga5tLNmSF31F0kuQ
         H5W0wNdJ+RbWEKUuAotw65APpsaZmAi/PTrW4XzDrDOeHiPn83IHOIxabwd7rWaREgCg
         Pmew==
X-Gm-Message-State: AOJu0Yy6BX4RnHT0gQdAAEqrJ2+6zS74DStbky0D+xnPbe0vmXtUJcW4
	l0FB5XQXSWfHlZG06ICO85vJecYcDcQ0Pa7isEhliJpsr81NWUwwf4ZqDgA1OA==
X-Gm-Gg: ATEYQzwI2MdvUOCwvn5zjSDlBsizk0yKyPKd2JFMnOSzREK6kS7uMw9TSPSKAYNdtlE
	qHvZ/PeFOWH8aOe0coTmLe5Y0spAT/hk9fvfFGlUT77TmYw6KcqtvHE+rSMw1pNmw0b+iuS9RyC
	ijqDGG7aORMBIMqVEGRWQjOD187bQ1wj7URHBCWdi39S1NzvVp1bMTdUYF5GuPETzIYPHlHqgAq
	0BbYHFrnjqBjCMmdPMelfLxrR4xhi/mVFaqjPGIgceAM5H1fel8tblyJjA/ZrS54TOvwB8zu/Vo
	dfMRpEokOMsse3Kh9UCRXXfkLT3RVlecCGHs0DruF97Jv0P6B6JA0s7ajNJrovnzFY6szfm2Gyt
	r48ahfj7ZGTh6Dt1X+MUtTp0nmfaEU8AO+j3MtaNTRPU6wmezPlba+Y4NnX3vua5r2G03uB6Kfp
	+AxMMamN6FW7SblWyu21Dl8WVP2L7p1Jakio+OJ8ItMWozSTIInneu3Z3e6OS7Ko9E5chvhLho9
	JNlE1M9U+38QuorS+OIcw==
X-Received: by 2002:a17:90a:c2cf:b0:343:7714:4ca8 with SMTP id 98e67ed59e1d1-35965c630aamr3871821a91.15.1772221180281;
        Fri, 27 Feb 2026 11:39:40 -0800 (PST)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3593dcc9c37sm5866738a91.8.2026.02.27.11.39.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Feb 2026 11:39:39 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] oeqa/runtime/ptest: Make ptest-runner timeout configurable
Date: Fri, 27 Feb 2026 11:39:28 -0800
Message-ID: <f991f88aaaa7bb34bc46e2af9fdfd1ce2f00bc86.1772220652.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1772220652.git.tim.orling@konsulko.com>
References: <cover.1772220652.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 19:39:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232112

Replace the hardcoded 450 second timeout with a configurable
PTEST_RUNNER_TIMEOUT variable, defaulting to 450 seconds.

[YOCTO #16163]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index 75165101af4..1a0782374d0 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -59,7 +59,8 @@ class PtestRunnerTest(OERuntimeTestCase):
         ptest_dirs = [ '/usr/lib' ]
         if not libdir in ptest_dirs:
             ptest_dirs.append(libdir)
-        status, output = self.target.run('ptest-runner -t 450 -d \"{}\"'.format(' '.join(ptest_dirs)), 0)
+        ptest_timeout = self.td.get('PTEST_RUNNER_TIMEOUT', '450')
+        status, output = self.target.run('ptest-runner -t {} -d \"{}\"'.format(ptest_timeout, ' '.join(ptest_dirs)), 0)
         os.makedirs(ptest_log_dir)
         with open(ptest_runner_log, 'w') as f:
             f.write(output)
-- 
2.50.1 (Apple Git-155)



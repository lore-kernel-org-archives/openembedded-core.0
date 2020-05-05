Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web10.1515.1588648858891349196
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 20:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=idwOd0aL;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.193, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f193.google.com with SMTP id x77so230058pfc.0
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 20:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=cumxdskSHyqTLgUX+idJj0n3/t/bEHrO2//HlPMV54c=;
        b=idwOd0aLozrqMxmJtO401sD6jP8mq0BHhSSGty1Zaq24pra4MMGAplF/3kvaJra+By
         EKs08oFfYGe8tc8OOB9QsAj32F+qwrxM2kCmNm8eo5pPz6AZbHTEgbr+Xf8S9tuitEoV
         FMAerITKNMdctAZo7KXfDwRfxBmP45eF4wVXKuHKUMYLWjzbIDAJNjIPybd+CzGNLdrR
         oPmNiPcP+3t4jYsYHE+fEaYpT3a0YBLT2i8w2dehnFXuGcBiRlg8dypmy/PSJROrAsnU
         4RLPjdTq0sII7MzEQ6iD9DO+YQ6USpqonrGVZg9caLAh75auQUFJeNa7ejp4iYECaYTF
         NgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=cumxdskSHyqTLgUX+idJj0n3/t/bEHrO2//HlPMV54c=;
        b=EjpBPY7QJp5xwCGDdg60P2kaFeokydmLG/Ko2sv7PmHF2KCu2ehfZiPNXmwBF8cmeN
         6abITnwTN6n4a3KZYpEsGVfZyYMzOaWFcHQxBtfgvk6rq7O+YnsvTYFSOGFvNVGxM/kc
         EkHulKx6NLkDfUI2KYJceI2sSHyoBOIa5bGmbFp48qlWHgYh0K3wkd/GzFyBIEAdZzQX
         XP/kzm2vSlrDePUGB9zApmIJcRFVKu1wE3ZiuJD0CXoBckTxZDuJXkce9CrrsoZEwZJ8
         HKmz8YucDrc1dJcavgKWB2hEIzWjqgu0AKJPfat1L7NHercp3FDqZ4ATVgxJJwxtIMEY
         McYg==
X-Gm-Message-State: AGi0PubeCINukwP4/3MXwxrdr4k+qCQ/UtHGWmirNTaYQ2TZhQraOfOT
	QHY4iYdhMqOzXTTx4uIqVIVjKJJgU7g8BQ==
X-Google-Smtp-Source: APiQypKebkz+bQEMSbuA2FuGGOv5jVaEwBDuOSoA8NJcR9qZ8ygOgYqPu5ficFQLVVapxVMZ8aEozw==
X-Received: by 2002:aa7:9d84:: with SMTP id f4mr1112474pfq.290.1588648857862;
        Mon, 04 May 2020 20:20:57 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 20sm503379pfx.116.2020.05.04.20.20.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:20:57 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/28] targetcontrol: Fix leaking log handler
Date: Mon,  4 May 2020 17:19:15 -1000
Message-Id: <924b020eacf111b4fd4d731b363084e254a3422d.1588638879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588638879.git.steve@sakoman.com>
References: <cover.1588638879.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We had a mystery failure on the autobuilder where runqemu appeared to
be failing as a logfile directory no longer existed. The key to
reproducing was running a runqemu where the image was deleted (as
devtool does), then running another runqemu test. E.g.:

'oe-selftest -r  devtool.DevtoolExtractTests.test_devtool_deploy_target wic.Wic2.test_qemu_efi'

This then tries to write to the logfile from the first test, the
image directory was deleted and we get strange failures.

The fix is to remove the logging handler when qemu is stopped.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/targetcontrol.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 0b2915d5cc..2aa548e1ad 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -117,9 +117,9 @@ class QemuTarget(BaseTarget):
         import oe.path
         bb.utils.mkdirhier(self.testdir)
         self.qemurunnerlog = os.path.join(self.testdir, 'qemurunner_log.%s' % self.datetime)
-        loggerhandler = logging.FileHandler(self.qemurunnerlog)
-        loggerhandler.setFormatter(logging.Formatter("%(levelname)s: %(message)s"))
-        self.logger.addHandler(loggerhandler)
+        self.loggerhandler = logging.FileHandler(self.qemurunnerlog)
+        self.loggerhandler.setFormatter(logging.Formatter("%(levelname)s: %(message)s"))
+        self.logger.addHandler(self.loggerhandler)
         oe.path.symlink(os.path.basename(self.qemurunnerlog), os.path.join(self.testdir, 'qemurunner_log'), force=True)
 
         if d.getVar("DISTRO") == "poky-tiny":
@@ -183,6 +183,7 @@ class QemuTarget(BaseTarget):
 
     def stop(self):
         self.runner.stop()
+        self.logger.removeHandler(self.loggerhandler)
         self.connection = None
         self.ip = None
         self.server_ip = None
-- 
2.17.1


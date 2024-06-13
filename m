Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 681E5C27C78
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:20:53 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.9965.1718288450355784517
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=z75Fvc03;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f65a3abd01so9940995ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288449; x=1718893249; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2d5Fv2zhCe45b0vumu8v4PzSk8d9DfEpBFGq8y6R2c=;
        b=z75Fvc03KMhuJF665YnjKILibOHJTU3eZBaS/77Erv7h6Dwtf/hPJsHqV8/4z7g3cN
         tYiqUd/LWvlQAtiTT8CKdKYVkdU7heVeMhZP9GKlRxLpJljZbG0HQioWc2zjLuXZh06b
         DKlh4OMfnRW5fCSKnAjgdJgtRSMjJIKb0RBBT6o4U4XKhxmkBUIoh0H3Mb3dF7PZ9zG6
         fQdfMvXfEUEhs24KQSRgKRZ1hdkEnv09fEPLrh4Md+0Av9L6VWtwbAlO/JDk0eOVMZpv
         Uzp1zEZigvYvtwWcfzQLhS/xyjzgnELJ8ftZ/9V+Rv/nxzvy+4EM8wmGEXDPYpHs0jc6
         M1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288450; x=1718893250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2d5Fv2zhCe45b0vumu8v4PzSk8d9DfEpBFGq8y6R2c=;
        b=OIl457P4CUuJozHlAnaB6Q2nogPAKnAhtJrTrwwdFLF8JEYn5r4w3wzq5cpoGFKGo7
         ao1e2s470f86rWTFzn+Fo27TGj51eCgoMn+586c5u733KlYIIId49bf/LFUiowofmtgK
         YZCKH3D6YdgbaNvTA6G4Nue0C8p5lw4s0AFulQwybDt/DqaF5eGCzWZ2s4K4Fx5jDRRn
         SLI3VgrgDwTzqoP0U+oHuCO8tVPes76P8WpE/f3GQ6SqKhbJ02xDHpJOWYHoXs2Vj0nj
         iuNxnhO2VgMkuhe4ypF35lXxU+3CZ/h8UxoEZLtPwAoosmh1fzZr022i08sJlRh2qw81
         TkJQ==
X-Gm-Message-State: AOJu0Yw13w1TFSpE52bLmn89nO/Ym+ADEvFeymaz5DM2dOMm3WCwlxb7
	mQ3vdA+vvZltdgDryaL1gmXKjqXbY72UipsDLrTjRh7waoKgCy5BUQjzrsOrvWwDYf15xmBG7qb
	d
X-Google-Smtp-Source: AGHT+IELHlhC/bPOCgr0VGTdOlgracTRvP2xMqOAO8NFwFaMrNaZYAZ+wTzqRQs4YHOXYI8+h3aNNg==
X-Received: by 2002:a17:902:d2c4:b0:1f7:13db:528c with SMTP id d9443c01a7336-1f83b56893emr60258845ad.13.1718288449628;
        Thu, 13 Jun 2024 07:20:49 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.20.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:20:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/29] oeqa/selftest/devtool: add test for modifying recipes using go.bbclass
Date: Thu, 13 Jun 2024 07:20:12 -0700
Message-Id: <71adf7c18215faf73454be79d7b51f2a0c338c0f.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:20:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200610

From: Ola x Nilsson <olani@axis.com>

go.bbclass uses a special do_unpack function that causes the git root
to be different from S.  Verify that it unpacks as expected.

[ YOCTO #15483 ]

Signed-off-by: Ola x Nilsson <olani@axis.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fab0c737b95b8d0c0bbf58336bc308776c956406)
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 51949e3c93..cc4cbec5ae 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -749,6 +749,25 @@ class DevtoolModifyTests(DevtoolBase):
         result = runCmd('devtool status')
         self.assertNotIn('mdadm', result.output)
 
+    def test_devtool_modify_go(self):
+        import oe.path
+        from tempfile import TemporaryDirectory
+        with TemporaryDirectory(prefix='devtoolqa') as tempdir:
+            self.track_for_cleanup(self.workspacedir)
+            self.add_command_to_tearDown('bitbake -c clean go-helloworld')
+            self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+            result = runCmd('devtool modify go-helloworld -x %s' % tempdir)
+            self.assertExists(
+                oe.path.join(tempdir, 'src', 'golang.org', 'x', 'example', 'go.mod'),
+                             'Extracted source could not be found'
+            )
+            self.assertExists(
+                oe.path.join(self.workspacedir, 'conf', 'layer.conf'),
+                'Workspace directory not created'
+            )
+            matches = glob.glob(oe.path.join(self.workspacedir, 'appends', 'go-helloworld_*.bbappend'))
+            self.assertTrue(matches, 'bbappend not created %s' % result.output)
+
     def test_devtool_buildclean(self):
         def assertFile(path, *paths):
             f = os.path.join(path, *paths)
-- 
2.34.1



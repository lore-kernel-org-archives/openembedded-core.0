Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB0DC47071
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 16:46:39 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.11536.1700153198060036117
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 08:46:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=DnEinkm2;
 spf=pass (domain: baylibre.com, ip: 209.85.221.51, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-32f9268bf8cso782300f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 08:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700153195; x=1700757995; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eiBpdCLcvS84JtRUbRLD0Jog2l2izAD9WupcDkUcvAY=;
        b=DnEinkm2sTNAjneyl0ED+vEJTF/GNzfhxZWRLR23V1gjWTaxKZY3am3MWRN3B8qlg/
         Hq209Mnb4Vytf63sjvMTeCmlPBr6bN/puLTCEPvPVue7Q1CqzgGm7GRQG+5uws52xmPd
         7I5uOGusX5ZkA5yjzUUkisft/gx1HoYd2+GbkQorArzHspsP+z/G6TPrUC1ZPcBRuMAE
         c1AeIMEv1e/UvJUCMv9nX9HcVhQIKu3ZS19As+I8t4ggfK6jGOQj0r5XdFudraZIzqdS
         tcA5ZEtdzSfToiB9aoaJBSIH1WTgLkyB8/3OAkSrJdAqiH5eQ+4gut7GVHe3HgtLT0Gm
         MTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700153195; x=1700757995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eiBpdCLcvS84JtRUbRLD0Jog2l2izAD9WupcDkUcvAY=;
        b=vEJ3eWNO5sZluPDy1m1AMixYBnHOfw0VjRj5AtCk0akDnEwhTsRVeNsTN+MeKjzYCK
         REKGiN3iG/I5z/XffPcW4GGhUHlwGoSt5Z256rHwJgCZ1Nr8NcbXCIw6tPn3c2kCHAAm
         LUOIz0u3GpGnVwg1QOTBYg7YB5BMmcUmaa45LqyGf/+I54ga1WS/Xb5nHcc4tqNWk9NN
         ZTAlWl1MyK/VI6EXjQT67OOJ44w0uoenogm5GoGGm5QfArGfOcP+mt+ymcAWZOcus7ox
         2bLNSjB8A4o2HSalnay+wYZwz7T3Y8fTZ0w730/i5ggS7G6gaafG3UF5/QKgdbyvhAR2
         KFoQ==
X-Gm-Message-State: AOJu0YwtSZSr3kmgZUtnDApe4fSs2Qe4kLXP4Ecgg+7AVCgKQ538jusg
	meucGz6AtxJoXhE7saihHM9VdrUZS8mVk58P9cfeFQ==
X-Google-Smtp-Source: AGHT+IEdf1/JTVvJTqsufFP0E9u2sedqVuOwHdfNzvhgZDo9yrDUJw72cpeihFVAy51ziWUTR+s8bg==
X-Received: by 2002:adf:d1e1:0:b0:32f:83e4:50e5 with SMTP id g1-20020adfd1e1000000b0032f83e450e5mr15969437wrd.6.1700153195454;
        Thu, 16 Nov 2023 08:46:35 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id z2-20020adfec82000000b003200c918c81sm14121917wrn.112.2023.11.16.08.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 08:46:35 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH] oeqa/selftest/devtool: fix test_devtool_modify_overrides test
Date: Thu, 16 Nov 2023 17:46:21 +0100
Message-ID: <20231116164621.3283458-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 16:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190805

This test fails for machines qemuarm and qemux86 because when doing
devtool modify, the default devtool branch contains the patch that match
the current configuration, so for both qemuarm and qemux86  machines the
corresponding override patch is applied and we get the following error
(for qemuarm machine):

  AssertionError: 'This is a test for qemuarm\n' != 'This is a test for something\n'
  - This is a test for qemuarm
  ?                    ^ ^^^^^
  + This is a test for something
  ?                    ^^^ ^^^^^

Fix the test by looking at the correct value depending on the current
machine configuration

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index b5c488be8e8..ab58971fec7 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1075,7 +1075,12 @@ class DevtoolModifyTests(DevtoolBase):
             with open(source, "rt") as f:
                 content = f.read()
             self.assertEquals(content, expected)
-        check('devtool', 'This is a test for something\n')
+        if self.td["MACHINE"] == "qemux86":
+            check('devtool', 'This is a test for qemux86\n')
+        elif self.td["MACHINE"] == "qemuarm":
+            check('devtool', 'This is a test for qemuarm\n')
+        else:
+            check('devtool', 'This is a test for something\n')
         check('devtool-no-overrides', 'This is a test for something\n')
         check('devtool-override-qemuarm', 'This is a test for qemuarm\n')
         check('devtool-override-qemux86', 'This is a test for qemux86\n')
-- 
2.42.0



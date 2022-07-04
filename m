Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9529FC43334
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 14:47:01 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.73294.1656946019677558319
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 07:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qoelnEk1;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: ptsneves@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id h17so669583wrx.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 07:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NrCvaciejEb2VGHC7QMHM3mpuxy+s4PNgkom7LNi+j8=;
        b=qoelnEk1rlu3mggH+FO1SXdyjcULjWJH31ckLmGt5lI6VHnkCXupcaXVGkimgWoLik
         P0vyoyuXwoGpbfSOYSRj7D2yLjfg9DGLMwgR1NQ96XULIEca+MhHHABIY+GHdLoHnySh
         CDwH2YeTko/Sh6wS3jB2DQi2ZCMMXP0hxT6hxkO0+BYTPtaXoIMiu7CxGipZB1P6okhd
         N8ukb/iGSp+NqQym1qo+YkzEUYo1J1cO08eJjxyHaBpC8qsXfmZ+4cniUtg4k5XtNG6h
         WCeW9f7APgI9phxkNVd/XU2ax8UD7aqDDBLQiBJk2o3ZwMB3PTcXYNhe4qxFTuH3qFRc
         2kuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NrCvaciejEb2VGHC7QMHM3mpuxy+s4PNgkom7LNi+j8=;
        b=uhgLmk/FGUXwslSOhZTnuqUSRlx1BXWuBoaBMprzgmienQBOSQgkV4LcEEIXcPVeTW
         /n2cDHWVNrNhqGxG6QSUh4uDe+InEG84CYom7yVy95A65rIShissVZmr0T+K7txQXq21
         iQXT8Gfu94x/1JbL4NbEReTEDSEMz47xft/rDLawSN3cfGGGQ8KAohmxJ/GIpNRCFPkN
         sN2DegTZGK9Yjds0wumczbwOQATVbcNhoYKdOjCEDtLHxwQaC4LiAfVnTpd5H3LIbbil
         T7Qjn2tMvMrXIWb47/iCb4wN+UNxL6vxJLBkUgDeaKX8gt54s7S/J6TjXoZilwlvuu3l
         csEQ==
X-Gm-Message-State: AJIora/XhfSTY0Lxjnpj96Ow7hOx9FPuZ9U9UQmJJ8uC86+eHyWP9+nK
	tQhlCpiKj+S7zqIBJUsm3pSglFyh6S9e
X-Google-Smtp-Source: 
 AGRyM1ucJGXXJOgNO6N8/9dubpEdW7Fi5HPGT981KA2eg98ov9lUtxB+4GHbwjdw1CHh5T/E+6+KKw==
X-Received: by 2002:a05:6000:1d97:b0:210:25d6:e125 with SMTP id
 bk23-20020a0560001d9700b0021025d6e125mr26389632wrb.464.1656946018206;
        Mon, 04 Jul 2022 07:46:58 -0700 (PDT)
Received: from localhost.localdomain (83.11.75.211.ipv4.supernova.orange.pl.
 [83.11.75.211])
        by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c204f00b0039c5cecf206sm19518363wmg.4.2022.07.04.07.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 07:46:57 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v2 3/3] oeqa/sysroot.py: Check bitbake return status
Date: Mon,  4 Jul 2022 16:46:53 +0200
Message-Id: <20220704144653.2490662-3-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220704144653.2490662-1-ptsneves@gmail.com>
References: <20220704144653.2490662-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Jul 2022 14:47:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167621

bitbake ran but we incorrectly did not check the exit status needs to
be non 0. Now all sysroot tests commands expected to fail are verified
to do so.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 meta/lib/oeqa/selftest/cases/sysroot.py | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sysroot.py b/meta/lib/oeqa/selftest/cases/sysroot.py
index 588fc8c713..6371a10074 100644
--- a/meta/lib/oeqa/selftest/cases/sysroot.py
+++ b/meta/lib/oeqa/selftest/cases/sysroot.py
@@ -43,7 +43,7 @@ TESTSTRING:pn-sysroot-test-arch2 = "%s"
         Author:    Paulo Neves <ptsneves@gmail.com>
         """
         expected = "maximum shebang size exceeded, the maximum size is 128. [shebang-size]"
-        res = bitbake("sysroot-shebang-test-native -c populate_sysroot", ignore_status=True)
+        res = bitbake("sysroot-shebang-test-native -c populate_sysroot")
         self.assertTrue(expected in res.output, msg=res.output)
 
     def test_sysroot_la(self):
@@ -54,11 +54,11 @@ TESTSTRING:pn-sysroot-test-arch2 = "%s"
         """
         expected = "la-test.la failed sanity test (workdir) in path"
 
-        res = bitbake("sysroot-la-test -c populate_sysroot", ignore_status=True)
+        res = bitbake("sysroot-la-test -c populate_sysroot")
         self.assertTrue(expected in res.output, msg=res.output)
         self.assertTrue('[la]' in res.output, msg=res.output)
 
-        res = bitbake("sysroot-la-test-native -c populate_sysroot", ignore_status=True)
+        res = bitbake("sysroot-la-test-native -c populate_sysroot")
         self.assertTrue(expected in res.output, msg=res.output)
         self.assertTrue('[la]' in res.output, msg=res.output)
 
@@ -70,10 +70,11 @@ TESTSTRING:pn-sysroot-test-arch2 = "%s"
         """
         expected = "test.pc failed sanity test (tmpdir) in path"
 
-        res = bitbake("sysroot-pc-test -c populate_sysroot", ignore_status=True)
+        res = bitbake("sysroot-pc-test -c populate_sysroot")
         self.assertTrue('[pkgconfig]' in res.output, msg=res.output)
         self.assertTrue(expected in res.output, msg=res.output)
 
-        res = bitbake("sysroot-pc-test-native -c populate_sysroot", ignore_status=True)
+        res = bitbake("sysroot-pc-test-native -c populate_sysroot")
         self.assertTrue(expected in res.output, msg=res.output)
         self.assertTrue('[pkgconfig]' in res.output, msg=res.output)
+        self.assertTrue(res.status != 0)
-- 
2.25.1



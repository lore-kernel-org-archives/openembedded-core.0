Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F11CC74A44
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 22:58:45 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.5696.1678402719697777411
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 14:58:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Q2vVvkbo;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id cp12so2535496pfb.5
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 14:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678402719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W9lPnrFHzKRPiMsSD4ApjEOsJQSrlRgh6VuIulu2TME=;
        b=Q2vVvkboJc1WQbmJB7kF0UmZWoTO+c1S4s1YRz4MyElZ89CbpSN0o/WOWHKCkBE7hh
         T/27pdwq/7oekFIavdnTbk0J/2ApcGiv6qX/KvfmDK1NogglxdiIjbOZIjVy3Za5kZvy
         uSTIqj4wQCdNXKvjO1RMgOCxGTNYlvoEbR+RK2dQUfhc2h9sf3TTYliJHF9r/sSCTsUJ
         HrkdZQrX3v5u4BxtPHCQZmb3l2a5okYikv2otXbuxUY53VMityyVzXVzr/g0MrrEk8Rc
         MzSGzSs7j4rZ2xgyh0z0dO00JPjo2/FtyQg6JUQ1vriaPcBzXbH5sxh06f7HXe1KOieS
         Ekgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678402719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9lPnrFHzKRPiMsSD4ApjEOsJQSrlRgh6VuIulu2TME=;
        b=z16aC4JGG/r+eZ2H0ckjWrvCKG3SIaKl5V15xet4yK1ASp78Y4A41MU5f8ZrIOECsN
         nlnqOF0iIwtnFQYuXgfZULloVwdwt+gEJKypRy3qGr0pSQQAidOOlsfVQIP2ENP7UZZ7
         CDtKk2fbNXLw6xwuN5yzHRAR1j5YO8t+Ahd4EGnLcKtpTXBnLHxyZbnd3ztU0TKPl1Os
         94QLeWkPUK5pfioKqupGYOv2TQln+YFvtzLtF8/T8c9KCIkA4c0lcE1SJDvr5Ymp5P2M
         texkR+f//tTXVaRRWU+1Cs3rbrXaybO8gr2s7j43BiQIk+X6vncvQiePvUJLyUcy+3Pw
         Le4Q==
X-Gm-Message-State: AO0yUKWqH8g/6kAd0ORx5XyPB0RSIeCZ8V/PIlJ2xrmvYG8Jot7bYYPe
	FRRUolHf3sdOkzn8fdsHjMfD6zKf/svm+syUWYc=
X-Google-Smtp-Source: AK7set+7bulRBcQq+rvwQpi7Ix4Oiy15DJllsaRVnjV5Vj+9SQVPf6tYKK36yJCI7mbzIQ01gPCtlA==
X-Received: by 2002:aa7:8f04:0:b0:5a9:d58e:796f with SMTP id x4-20020aa78f04000000b005a9d58e796fmr21131367pfr.29.1678402718787;
        Thu, 09 Mar 2023 14:58:38 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id j9-20020aa79289000000b0058db8f8bce8sm89717pfa.166.2023.03.09.14.58.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 14:58:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 15/27] oeqa/selftest/prservice: Improve debug output for failure
Date: Thu,  9 Mar 2023 12:57:50 -1000
Message-Id: <66f1adb38c1752e0bbb0bd66a2df9aea0e3e0282.1678401759.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678401759.git.steve@sakoman.com>
References: <cover.1678401759.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 22:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178288

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We keep seeing this failure on the autobuilder but the output amounts
to "False is not True". Improve the debug message on the chance it may
make the issue clearer.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d03f4cf19c2cc96e9d942252a451521dfec42ebc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/prservice.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/prservice.py b/meta/lib/oeqa/selftest/cases/prservice.py
index cb95503c2c..9fe3b80a31 100644
--- a/meta/lib/oeqa/selftest/cases/prservice.py
+++ b/meta/lib/oeqa/selftest/cases/prservice.py
@@ -77,7 +77,7 @@ class BitbakePrTests(OESelftestTestCase):
         exported_db_path = os.path.join(self.builddir, 'export.inc')
         export_result = runCmd("bitbake-prserv-tool export %s" % exported_db_path, ignore_status=True)
         self.assertEqual(export_result.status, 0, msg="PR Service database export failed: %s" % export_result.output)
-        self.assertTrue(os.path.exists(exported_db_path))
+        self.assertTrue(os.path.exists(exported_db_path), msg="%s didn't exist, tool output %s" % (exported_db_path, export_result.output))
 
         if replace_current_db:
             current_db_path = os.path.join(get_bb_var('PERSISTENT_DIR'), 'prserv.sqlite3')
-- 
2.34.1



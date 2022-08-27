Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D7BC0502C
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:26:54 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.51638.1661624804490792441
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=2cgg1PF0;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 t11-20020a17090a510b00b001fac77e9d1fso10923618pjh.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=ZG7C+nMzmEHGxvFg2UBP7+fRtIhzgf22jrDbzcs38EM=;
        b=2cgg1PF0K1LQuycZBaR/bf2cOeWaO2poQY33gZKq7ZBR0ivVXjFvwUSXas1UdPZ+ep
         MpMwn8qouq9xMvPEawzgQhNfw49b7Q8itbqj6gCB1MOMyOtlzJqbAF9v07aPnPGLaPge
         HsTK1T6Z5CiZU058Ti2vqrGo9L/BMoUlidYMAiF1AdoLXVyuyC0oShIJOyHEYTHgPOQg
         /h5VQjAQ6pB/4u6znVAT3hvnlAb+ajX7DaClmDArAbJ/m/NTfXraJ3CUOJwhIKYmJLBU
         raE70bwWaCq8MhkSgApE0cM3wJIio6JiyYLIKXCsPuBlAN5gT2k5KE58udtNlOpKzPoc
         sV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=ZG7C+nMzmEHGxvFg2UBP7+fRtIhzgf22jrDbzcs38EM=;
        b=KETKmU7v8bvwB/uqgp2Q/ufRvnrs9kL4hS5iSWF7IFgKYvkIhxf5z7Y+2EI/Ed7aUz
         7Rf2vvSS1jW1kRVYcuDiD77RX/1M7zWWNpRFf03/+qMhWD7m0lgZhcAv9hfDZxP+LN+W
         ccgmMNziSLyIq9JymGIHi7u8oAelD38pUbn+MWaT4/aLHEA4VMK4EwAP7dMvFtbtwLjU
         PAeLmlK9Q9Vtj4QSAKfVyRmISgwpbz6V2DagrreGGSVb7VBKUAJM4aQtm0N+d8ygyM+a
         dH4OOlqsWxBUm49pvMpzc1/bFKhMTn0sTO8illMi4yogVAXplf62eaTLQVF+N3QSYC46
         MOGQ==
X-Gm-Message-State: ACgBeo1LAod4kmV0tOsERE7rYgtuLKtYPD/se4qp3vno1onrV4s794hn
	IzSSG8i35pOIq6Tw4mNoKKTcSLJQzPtWc8xG
X-Google-Smtp-Source: 
 AA6agR6EVO/kl7tfOO6snkx++DMd54bSWC54pT/nPZXf6gTBEpEFgo8Y7o5XCGRDd3+koc2qpBCuZw==
X-Received: by 2002:a17:902:9b97:b0:173:dd7:3f3 with SMTP id
 y23-20020a1709029b9700b001730dd703f3mr9222304plp.56.1661624803600;
        Sat, 27 Aug 2022 11:26:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 r21-20020a170902ea5500b001708c4ebbaesm3864716plg.309.2022.08.27.11.26.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 11:26:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/24] oeqa/selftest: rename git.py to
 intercept.py
Date: Sat, 27 Aug 2022 08:25:43 -1000
Message-Id: 
 <09ed7d9d5c6455508ab9d29cb2a43be0e458bb64.1661624569.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661624569.git.steve@sakoman.com>
References: <cover.1661624569.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 18:26:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169960

From: Ross Burton <ross.burton@arm.com>

By naming this test class git.py, any attempt to import GitPython (as
needed by oelib.buildhistory) failed.

As this class exercises the intercepts, rename it to intercept.py.

(From OE-Core rev: d557cbbf86767bc2ebf2beb3d70af3b3ca5e0529)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/{git.py => intercept.py} | 0
 meta/lib/oeqa/selftest/cases/oelib/buildhistory.py    | 6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/lib/oeqa/selftest/cases/{git.py => intercept.py} (100%)

diff --git a/meta/lib/oeqa/selftest/cases/git.py b/meta/lib/oeqa/selftest/cases/intercept.py
similarity index 100%
rename from meta/lib/oeqa/selftest/cases/git.py
rename to meta/lib/oeqa/selftest/cases/intercept.py
diff --git a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
index 802a91a488..33bd6df2f3 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
@@ -3,6 +3,7 @@
 #
 
 import os
+import sys
 from oeqa.selftest.case import OESelftestTestCase
 import tempfile
 import operator
@@ -11,15 +12,14 @@ from oeqa.utils.commands import get_bb_var
 class TestBlobParsing(OESelftestTestCase):
 
     def setUp(self):
-        import time
         self.repo_path = tempfile.mkdtemp(prefix='selftest-buildhistory',
             dir=get_bb_var('TOPDIR'))
 
         try:
             from git import Repo
             self.repo = Repo.init(self.repo_path)
-        except ImportError:
-            self.skipTest('Python module GitPython is not present')
+        except ImportError as e:
+            self.skipTest('Python module GitPython is not present (%s)  (%s)' % (e, sys.path))
 
         self.test_file = "test"
         self.var_map = {}
-- 
2.25.1



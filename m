Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D782C6FA8B
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 12:28:09 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.5429.1663331279752024637
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 05:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hNHD3JNE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id g3so14881767wrq.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 05:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=wDJuudSnAvgnRD8hF3+R0hnYfyo4k6WTQt4NDVGzc7I=;
        b=hNHD3JNELQ6oMGx4n+wfzLwP11rJLs5G75HScpKyenMOeAGXnAzQ81BirBLDcg5k9j
         M/7QYkBvVf4rW+aeXqyKLPGURZWNxqtOdchUPbRvX0tHBvuGrNlxXqryvJEh3JQQY17e
         96ENBFVjRI2NGmgGOotOJV6gCbwVgQA0wdjRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=wDJuudSnAvgnRD8hF3+R0hnYfyo4k6WTQt4NDVGzc7I=;
        b=UeyYcj+y0kQJY7fG5UpoyajGM1qNd/pS+vxVVG1LRR7XTo9CIS21Loj/N+Pa8+Bjwy
         n6GLxvvkPYXcwBpWOwx38v2kGLInii2TRnT3RKxJpfLWmN669dUA+IqqEL676e94TwX4
         WC1laYummh6FYOIUaPFMGJf1HY2GkvPQS3nCZa1JNW4LxZWbVhl9ThSJWlGGokbn7ohz
         Ih0S0ppMTnekOH5EsuMjxa9Atq7wCfBoDmmma49IgF7pvAP7yqxqX43x3KqBFCj3d5JB
         WvociDmSTLu5gSmeA21qp3PhJzttzoqtYYrFh4IjnTvuPcFdmc4+J2xfE4+Edm3WLf41
         pUog==
X-Gm-Message-State: ACrzQf37j0ynBrSPNzalTPwCT9m6Psf6epYhyslkyRBUlJjlKy8nfKQV
	CpYQF7DiVX+TtqVSIMiHio2zaIIcTKKVhQ==
X-Google-Smtp-Source: 
 AMsMyM7cB9KCz3yRQycbtzmUiojhluc8xJgrafvVlr7CCCSSSsqYaHx7xlFau13h/HOFT36j9jptrQ==
X-Received: by 2002:adf:dd8f:0:b0:22a:84ab:4be3 with SMTP id
 x15-20020adfdd8f000000b0022a84ab4be3mr2687304wrl.40.1663331277659;
        Fri, 16 Sep 2022 05:27:57 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:816c:1950:863b:51c])
        by smtp.gmail.com with ESMTPSA id
 y6-20020a7bcd86000000b003b33de17577sm1988312wmj.13.2022.09.16.05.27.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 05:27:57 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] oetest: Drop unused variable
Date: Fri, 16 Sep 2022 13:27:53 +0100
Message-Id: <20220916122756.1191173-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 12:28:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170787

The pscmd variable appears unused, drop it and the code which then
isn't needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/oetest.py | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 9c84466dd02..cf2cb30a3e2 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -57,7 +57,6 @@ def filterByTagExp(testsuite, tagexp):
 @LogResults
 class oeTest(unittest.TestCase):
 
-    pscmd = "ps"
     longMessage = True
 
     @classmethod
@@ -398,11 +397,6 @@ class RuntimeTestContext(TestContext):
     def _get_test_suites_required(self):
         return [t for t in self.d.getVar("TEST_SUITES").split() if t != "auto"]
 
-    def loadTests(self):
-        super(RuntimeTestContext, self).loadTests()
-        if oeTest.hasPackage("procps"):
-            oeRuntimeTest.pscmd = "ps -ef"
-
     def extract_packages(self):
         """
         Find packages that will be needed during runtime.
-- 
2.34.1



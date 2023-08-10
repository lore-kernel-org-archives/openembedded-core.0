Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4039DC04FE0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:06:07 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.21430.1691683562596535942
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=m869dUwv;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-686ba29ccb1so782400b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683562; x=1692288362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dwnxQoR0s8b/+SCK+RZriKQK6RNOOR7pxsb9p7RepYA=;
        b=m869dUwvSEO2LxA9jJqyl7KlbRuDz77SvP42DuE220pCg+orKAePgzJ6aCZgOtbmeS
         vu4yt+94AOKAbc31rdLJBcjqbw0XDo/YQ7kxWETOePAzQdGRVjkhz7lbmWzx5nZ46L57
         FE7mMsobZb6s4jvPXEph1YFpn1UMmmR7sFKcFzR8WNQ2WCvzjVewvxtpDQhqLU2cV2h4
         xqZNzkLf43ltnAaqu+Y2+z8mxy/Hrw0Q5qd7V207GXSBpz8dtUcu62iPv9MSSPAxYPsh
         HI0iDWSc2Y/S5tSDysHelMiU6WcVcA4LLGoW5qoh/WE0VxYEHT0lDpwDSt9ge9+vACvO
         n+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683562; x=1692288362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dwnxQoR0s8b/+SCK+RZriKQK6RNOOR7pxsb9p7RepYA=;
        b=VWi9EhA1sguiHJbtkKG6/Ivuts9l2Fng8Nm6UU/aDqHcyHemAVwxOSBHOqlvjZr0V2
         D1I/HcoIC3/3j/+uSlR2MMXEuKhHI4b2TmXYkMu47eCVMjbXz59Bl/YxX61af6mbCJC3
         cFmfeL1YGpF5jDcc+x5gZfo610+l8mygw3ia4yD9ZTij2Vf66vEAnFg3LYMkA9Lp8o9x
         FBTDoLjEb4R1gmVrajjXIKjb8r78CyTI51K9PFxcO3qun8TqSD7ElIJLguOSIBmef94K
         f3F1ePLBq2J+qUC2QyyNqg30lGU0KGMyNppQaKfzBEVbBNLeo3zEIK1JpaEAGvMfVzTB
         k2Dg==
X-Gm-Message-State: AOJu0YxNat+eRxWl7h0Lz/oZc0dBwF8DV2RhaIt3P+wHvQDBUAbdqqtz
	n0rJw/VB9xdQgv1VkbEWD6HPLtrXucI2sbkhzOE=
X-Google-Smtp-Source: AGHT+IGGx+1DQwgIJphT7f1YU73DM+RbvNFAYyXjcK6CzSQ64ZhN2ksmOBUIzdAbk2TEyMJnVco8xA==
X-Received: by 2002:a05:6a20:7f84:b0:140:61f8:53f6 with SMTP id d4-20020a056a207f8400b0014061f853f6mr2965686pzj.29.1691683561666;
        Thu, 10 Aug 2023 09:06:01 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.06.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:06:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 35/37] oeqa/runtime/ltp: Increase ltp test output timeout
Date: Thu, 10 Aug 2023 06:04:34 -1000
Message-Id: <a9e2179f3b4a4fe7321539de9e8e2707c9ca350a.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:06:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185797

From: Richard Purdie <richard.purdie@linuxfoundation.org>

On our slower arm server, the tests currently timeout leading to inconsistent test
results. Increase the timeout to avoid this and aim to make the test results
consistent.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9a8b49208f3c99e184eab426360b137bc773aa31)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/ltp.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
index a66d5d13d7..879f2a673c 100644
--- a/meta/lib/oeqa/runtime/cases/ltp.py
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
@@ -67,7 +67,7 @@ class LtpTest(LtpTestBase):
     def runltp(self, ltp_group):
             cmd = '/opt/ltp/runltp -f %s -p -q -r /opt/ltp -l /opt/ltp/results/%s -I 1 -d /opt/ltp' % (ltp_group, ltp_group)
             starttime = time.time()
-            (status, output) = self.target.run(cmd)
+            (status, output) = self.target.run(cmd, timeout=1200)
             endtime = time.time()
 
             with open(os.path.join(self.ltptest_log_dir, "%s-raw.log" % ltp_group), 'w') as f:
-- 
2.34.1



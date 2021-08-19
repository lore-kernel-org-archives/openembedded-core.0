Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web09.74176.1629400130546428149
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 12:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=OiQXhkb0;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.51, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f51.google.com with SMTP id r38-20020a05683044a600b0051a2c6dd421so10006456otv.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 12:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/sf8ln5yNZ8Wxs+mmzPGS/F4TWmQyYXnKVOqlYfPuf0=;
        b=OiQXhkb0ZglYV4RJ6huSJ7PEe0tcWIGG5xYmH0S5eTF2+GZ6uTOxframh3YxHQ8PxZ
         jYH94qVxsIXGt6ZoTyymO0x9+PJjnztqkdQpCSrVpi5g7VLdsKKDgh1jMIQ1c/GTidq9
         SVBjwyrMCLJ1PxW6U4ppEmq4GUB6Q1lwZDkt0gSE0WwcuSmR0a+VOjloMPpAN2TYDhTz
         jXRLD31jeqFfxYhkA8/X4QqoFowBL91YRvBnzrLGyBXYSx4JhjKTDwJIR5/0KDJRelA8
         TQxQ3A81dj5kS2uRMupenLd8A7Xccsh4f3uYV0X5OtyILmVEc0absL1ZhtyPPQPV949x
         tAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/sf8ln5yNZ8Wxs+mmzPGS/F4TWmQyYXnKVOqlYfPuf0=;
        b=OAfXP1Bs6J6VSMoBvJTof+94ama2DY4wycQjte2AyEhvnK82qoBZyZ2Fuq+0+Ldz6F
         aFs1uYCI9cijZ01iR492IqyS1Z4X/wWJhscAZ0PmxQVvWETKAEtykbPhalOr4JM8AaR8
         l/5+LWDAk9qki5xxRXZjLf4SVgoFaLe7BBL2/ObGqmlrieB35cWE/93Rpk/6mfBsF4YS
         vaP29HkpN4CdEIKycUbPLb7szxeMqFX1HdccbIWuXo9YLFDkeRuhLt9VSkXRqBRhiODg
         ldgXjA1Ndvo0ejI5kC5QbwqgQCRU1zMiJd6OFf2lfuaR6B/q7JU6kK401R1Nd9fFy4MQ
         wtbQ==
X-Gm-Message-State: AOAM532GU/5P1R3XHRp0T8CnfU8fOwFf+3k6uJSXTtADvV8SBgpzyQQp
	LHdInPWQRPLLb7FspLuqroT5Qil06s2tbzR6
X-Google-Smtp-Source: ABdhPJxH5S/P6lM2SZ8WkcmvU9C20NbPg5rQ35ExkuiPLfuzLJSCT5ayJ/SMXcJQZIHY9/4v2MWoqw==
X-Received: by 2002:a05:6830:314d:: with SMTP id c13mr9108539ots.310.1629400129310;
        Thu, 19 Aug 2021 12:08:49 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s10sm765080oog.14.2021.08.19.12.08.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 12:08:48 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/12] oeqa/selftest/glibc: Handle incorrect encoding issuesin glibc test results
Date: Thu, 19 Aug 2021 09:07:55 -1000
Message-Id: <bea86c9fc8c1f2e80209fb83c0ed73c7ae350e10.1629399953.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629399953.git.steve@sakoman.com>
References: <cover.1629399953.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We dont control the test output and sometimes see badly encoded characters.
These don't affect the operation of the code we're running. Use
errors='replace' to avoid those issues and the resulting test failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3939b1923387d3bc440118ed1663d28a03a1ea5d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/glibc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
index c687f6ef93..cf8c92887b 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -33,7 +33,7 @@ class GlibcSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
 
         ptestsuite = "glibc-user" if ssh is None else "glibc"
         self.ptest_section(ptestsuite)
-        with open(os.path.join(builddir, "tests.sum"), "r") as f:
+        with open(os.path.join(builddir, "tests.sum"), "r",  errors='replace') as f:
             for test, result in parse_values(f):
                 self.ptest_result(ptestsuite, test, result)
 
-- 
2.25.1


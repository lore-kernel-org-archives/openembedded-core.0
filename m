Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6296FC54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 14:30:48 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.13826.1708698647029740000
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 06:30:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OCWCk/7i;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33d146737e6so354289f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 06:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708698645; x=1709303445; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mo41r27Jy4KlS+R0MFok2ufbh7cBkq04BBnh/ysmMAQ=;
        b=OCWCk/7ilIPl5y4J8nGcGCU9zDtfWJzyincFHHJMNeu5klE3GM7ydotdSJSEzu4qGM
         jyZmjk+Hk14gGoRBepc22jGVnCpwtIAIRAtN9Uzmh0SqsouhVJEoYSsKDH+U1TwbKe1g
         AG9cgDtdXacLFo9aD3uavYc1C8reDgo7gHEAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708698645; x=1709303445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mo41r27Jy4KlS+R0MFok2ufbh7cBkq04BBnh/ysmMAQ=;
        b=rKbh4Ei3DSOm3I7Hid5AhPdo/DYqQ/b6j2NHZxsXTSJFaFRVEGAAlIJMFQheKv7w11
         ij+uD8Rj4jVeCyEiK9dBTnz+7H20dwa/kN7Dews50PzzTiIWBYoom0fKMESyg2dXEKpN
         ILbNvehaaFYJ9ZE+1L9/oiduvFto4SNuVq5hbhfXQeQXuU1K3vNfkU3BKz6/1qFl26MR
         yv7M4tbvI7SkncXy9XTA8gysePuFKDP+lHdZhXhQNYQgTrz1gCrPuQRWGrVW+dgIvtiU
         LUQMh/D7/rI7MLjOQ9rYu245CsuJ6E49Qc0HtNkacdRxQEubpNim8rtM8VTDIHaNjg8w
         4qfA==
X-Gm-Message-State: AOJu0YyZ2nzzwDB4giXuKFOO4fFIOIf88qQAAQ6e4fruCx9ScAyMdq2w
	CDD09w6ytE3aO7O1i4O9B06TjifBUQCYfSpFgZFyzYAzOSkFEGRs2s7GXznScMswplcQPvlnfqK
	v
X-Google-Smtp-Source: AGHT+IHCcUuSWwUbBhC4VNmTxdxh/rA89yuCQ5Qa82tDXcj3stXHYliRLD14xQ1K3aWsqv3RQ/Ntzw==
X-Received: by 2002:a05:6000:24c:b0:33d:6bd5:d372 with SMTP id m12-20020a056000024c00b0033d6bd5d372mr1573241wrz.15.1708698644723;
        Fri, 23 Feb 2024 06:30:44 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:25c1:6c0c:e2b8:37ae])
        by smtp.gmail.com with ESMTPSA id e5-20020adffc45000000b00337d5cd0d8asm3045361wrs.90.2024.02.23.06.30.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 06:30:44 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] recipetool: Fix errors with meta-poky bbappend
Date: Fri, 23 Feb 2024 14:30:43 +0000
Message-Id: <20240223143043.1053070-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 14:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196092

When a new base-files bbappend was added to meta-poky, it causes selftest
failures. Whilst this isn't ideal, workaround that issue for now since
the append is being added for security visibility and changing the tests
to support this more generically looks invasive.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 2eca1800de1..aebea42502b 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -48,6 +48,8 @@ class RecipetoolBase(devtool.DevtoolTestCase):
         self.testfile = os.path.join(self.tempdir, 'testfile')
         with open(self.testfile, 'w') as f:
             f.write('Test file\n')
+        config = 'BBMASK += "meta-poky/recipes-core/base-files/base-files_%.bbappend"\n'
+        self.append_config(config)
 
     def tearDownLocal(self):
         runCmd('rm -rf %s/recipes-*' % self.templayerdir)
-- 
2.40.1



Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4087C433EF
	for <webhook@archiver.kernel.org>; Sun, 29 May 2022 10:26:02 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.23799.1653819954969784703
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 03:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RuCA4AXW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id
 c5-20020a1c3505000000b0038e37907b5bso6932214wma.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 03:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lWWPgwJpb2NzDLQWKj/P1JuYh+rqLIU0hwUgQ4F38QA=;
        b=RuCA4AXWesy12BQKmEspMkpVRFJ3y9frtdxsWYuAV7DZqxmK26jwEkMvOiYcT6lXtW
         9xwvEMVe7elgSmqFb+41wW7ozXosh7bmaQU/eUwIOEBCHoIeRTKkPtBhgAnkz4fTNyqQ
         L5rJwMAomFUhGR85yLbA2tLUYPKe76WFa0Kjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lWWPgwJpb2NzDLQWKj/P1JuYh+rqLIU0hwUgQ4F38QA=;
        b=V1DKY3J9fbU5t9TwnLTkto32ziupUS+F4AmiNFlN/9wOJnYZlBw+N8R1wBUNMTvu1p
         q6s7gcWPiAsDtBJQSwjSqDE3QLGY0I85JHkf+ULGMu47BWgJFzmgSzF1lJXDcUG8HfKR
         p3qt3UPAvQSEMaObBEnMuQquXKVkfbU+ftmKO1EcLMMsZtLzQHm5u3qVP6CZ/GrcGl0k
         OC5wbfI4BkJnXhOZSvu/kk3/Q6JuaFqmL6qkyhnEvYStAqfXaZ9xx+6p3LHl6hUTBxNA
         yLtEywYhbUXKcRE/KTympdQFOfPmze6EzHL8H19bPkKIHLqj9vNf8JDJA10jchN0IDYE
         aa5g==
X-Gm-Message-State: AOAM5309+ox3wD2RkMA0X2GLLXSdeALHP3lenVy/vTgHomAR17lrPJmF
	F9Y6hBOo/V9iOe5FQnLVgRlYF9aDyFyONnVM
X-Google-Smtp-Source: 
 ABdhPJyjOQAou8Fc7nJ89zIt6s1POuHwMqQTu0W8DfenDvKB1cQDl9IgycfYU30mAxkUvPQFdtNvVg==
X-Received: by 2002:a05:600c:a0b:b0:389:dd65:66f1 with SMTP id
 z11-20020a05600c0a0b00b00389dd6566f1mr14029960wmp.95.1653819953082;
        Sun, 29 May 2022 03:25:53 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4777:d166:870b:18dd])
        by smtp.gmail.com with ESMTPSA id
 k15-20020a7bc30f000000b0039749b01ea7sm8328226wmj.32.2022.05.29.03.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 03:25:52 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: David Reyna <david.reyna@windriver.com>
Subject: [PATCH] oeqa/selftest/bbtests: Add taskexp_tty UI test
Date: Sun, 29 May 2022 11:25:51 +0100
Message-Id: <20220529102551.563718-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 May 2022 10:26:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166232

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index cfac7afcf49..d222f0fb297 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -205,6 +205,11 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         result = runCmd('bitbake -R conf/postfile.conf -e | grep TEST_POSTFILE=')
         self.assertIn('postfile', result.output)
 
+    def test_taskexp_tty(self):
+        cmd = 'bitbake -g -u taskexp_tty zlib acl'
+        result = runCmd(cmd)
+        self.assertEqual(0, result.status, "Command %s didn't run as expected. %s" % (cmd, result.output))
+
     def test_checkuri(self):
         result = runCmd('bitbake -c checkuri m4')
         self.assertEqual(0, result.status, msg = "\"checkuri\" task was not executed. bitbake output: %s" % result.output)
-- 
2.34.1



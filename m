Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAAF5C30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 11:41:55 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.8137.1720093311527502373
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 04:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E4mrbOez;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42574064b16so3612245e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 04:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720093310; x=1720698110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rio/WznRCVeA4Ee6TBuV3RdU+LmLrRWQ2q9lxLTvqao=;
        b=E4mrbOezrSw5d0MbFnPu7UkURTNnB/g9mPichovT3fu1/Z6dBCskiTCuN8N2WsoqdZ
         zptvfD+LASdu7MqXSOT+TSbby+FNqTcY4GTNTFuOJ7bOAv80lNXeoYZPa2ZxWnYHAEdF
         MT7hk/hwyHgdpMzstf5dYqaNOiaZeUqwtYPCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720093310; x=1720698110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rio/WznRCVeA4Ee6TBuV3RdU+LmLrRWQ2q9lxLTvqao=;
        b=A4qOz1XZnQWasnY0G6mqeLOCIKuBaOZZH3SvX8BubFGGqabrB0aQaPlPwPLfF/wO5y
         BRL6GidEzYRxmH4w1f2uB1IdZsM/hUXun/VAT5fuE439SGlyEG5mwqTFz/ale8kmLXjS
         YM84bTqwnVIJJdsSKtVxKHMfLQaW9fDTe/mxiOxAasbUIydnl1MgLVKqGDhV6RSExCej
         cSFVIF3ft2aOdA5sLHkFZyK8/XQF+12XNVLt5FBnIvlqHxuX1hWTqMSQbB7SPX+w8Dgp
         vXDM4jteL4UIFfR5tsXJA18GsYAHvCAlkuHAzAOGWHjpdgu4m5X9Xw/S6KTedFU4JxXJ
         yRvw==
X-Gm-Message-State: AOJu0YwrRcN+X/OIeG6+sawQ/lZrGpEL0eJUCPZuHoFbFKg7AL4VpBoj
	3Ohi2tjJvCKfk3EJEmMEjqI5U+IFJz+qWNtaTaMDvhQbnRkZgv/LPWZCXzb7X1upfOHbJqq2XS6
	K
X-Google-Smtp-Source: AGHT+IEu4fPL0oHHjdYdBWBpTSX2e9lLu68LoMswzBSDVxov4DC2b1rWBtHT9pv4xpfzE1bCGpkAIg==
X-Received: by 2002:a05:600c:88a:b0:424:a4f1:8c3e with SMTP id 5b1f17b1804b1-4264a46cb5cmr10054615e9.34.1720093309518;
        Thu, 04 Jul 2024 04:41:49 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:be20:56c3:ce73:d7de])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679927d7aesm2166289f8f.30.2024.07.04.04.41.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 04:41:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/runtime/ssh: In case of failure, show exit code and handle -15
Date: Thu,  4 Jul 2024 12:41:48 +0100
Message-ID: <20240704114148.3218721-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 11:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201539

Ensure we show the failing exit code in case of failures.

We're seeing autobuilder failures with -15 which is probably from slow
boot/init. Retry in these cases for now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/ssh.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/cases/ssh.py
index ae92bb34cd9..9295ed14787 100644
--- a/meta/lib/oeqa/runtime/cases/ssh.py
+++ b/meta/lib/oeqa/runtime/cases/ssh.py
@@ -19,16 +19,18 @@ class SSHTest(OERuntimeTestCase):
           status, output = self.target.run("uname -a", timeout=5)
           if status == 0:
               break
-          elif status == 255:
+          elif status == 255 or status == -15:
               # ssh returns 255 only if a ssh error occurs.  This could
               # be an issue with "Connection refused" because the port
               # isn't open yet, and this could check explicitly for that
               # here.  However, let's keep it simple and just retry for
               # all errors a limited amount of times with a sleep to
               # give it time for the port to open.
+              # We sometimes see -15 on slow emulation machines too, likely
+              # from boot/init not being 100% complete, retry for these too.
               time.sleep(5)
               continue
           else:
-              self.fail("uname failed with \"%s\"" %output)
+              self.fail("uname failed with \"%s\" (exit code %s)" % (output, status))
         if status == 255:
             self.fail("ssh error %s" %output)


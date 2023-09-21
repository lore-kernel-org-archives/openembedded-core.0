Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A8DBE7D0B4
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 22:37:17 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.9201.1695335831214209068
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 15:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EeqiWZ35;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4052755d5bbso16689375e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 15:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695335829; x=1695940629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1GsuBFN80/Xj9qc3c76oiFaNodfLerEwJRIxE1Zv6v8=;
        b=EeqiWZ35MfMonR4xT0JZS3JPjjIofJruRRXULSOs1ZD3ZiiBXd8Q1nPwkrvb5Cc3dw
         5F2sct50D/exE22YQdQVtVXIoskGuO+3l6pxZXtZ+ZxR2jptmRrDUJUwifeJK+54xYgh
         yVv/DM9JcVOm5etnom+FqsKIOoSCnpe9wLJIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695335829; x=1695940629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1GsuBFN80/Xj9qc3c76oiFaNodfLerEwJRIxE1Zv6v8=;
        b=utugxLBtqoUNIbVF9jEEt6kRozwLYt2+2PzcoPx/K103+X3AMfV3+m+fG7zcoZUMrj
         UxczgUG7SRA/TnkT9SbHDb1xfGGtz3tjsVxIidurU+A8N0d1fhF7y/jZjNxg7ASGPOS3
         5lypQfi3R7XG0X3dTTrNwGCdj6AKtTuS6JGwnHdu6TMG9gvp9dUZd2w4OqIdBrn32PHS
         Td6G5dVTHWwVLPBv2BF7slwA9dmp8XpfvTEDjXQ0c2Md6KmXtqbe5/7+bzqGjLKNBkaC
         nTfcfRP+CKzxRt+sGxZ4SISs+uaVgqoxq9jD1WOe1WfoNHm0lC/I6zEA2Yqdz0di6TtT
         24aQ==
X-Gm-Message-State: AOJu0YyvZTqMphBq5S9zpcdvH79J7vctCRiVBBw4YZ8PY3MM9Zaw6Nqg
	SOAMbMuiIqbL/OwpXJFt0K77SC/8M4386+X/KDc=
X-Google-Smtp-Source: AGHT+IHFRiBmHbHHStkGtVLPFPbzbr//5xUHvafiF9VshY2Q/jixFJXQXdnHwgaxQVNEO7sDl7Rjzw==
X-Received: by 2002:a05:600c:224e:b0:3fe:5501:d284 with SMTP id a14-20020a05600c224e00b003fe5501d284mr5876028wmm.11.1695335829281;
        Thu, 21 Sep 2023 15:37:09 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f6e4:1bee:736d:f9fd])
        by smtp.gmail.com with ESMTPSA id p11-20020a05600c05cb00b003fc06169ab3sm947410wmd.20.2023.09.21.15.37.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 15:37:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] oeqa/selftest: Fix broken symlink removal handling
Date: Thu, 21 Sep 2023 23:37:04 +0100
Message-Id: <20230921223708.1333390-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 22:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188029

The test above this removal correctly looks at symlinks however to
remove a symlink we should call unlink(), not remove(). This avoids
some build failures/tracebacks.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/context.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 7dab5614a92..16486e7eb99 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -437,7 +437,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
             output_link = os.path.join(os.path.dirname(args.output_log),
                     "%s-results.log" % self.name)
             if os.path.lexists(output_link):
-                os.remove(output_link)
+                os.unlink(output_link)
             os.symlink(args.output_log, output_link)
 
         return rc
-- 
2.39.2



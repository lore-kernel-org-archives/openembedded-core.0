Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF54C54E94
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 17:16:54 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.79698.1674753411919750620
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 09:16:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Fi2KLcpH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id h16so2448853wrz.12
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 09:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jwjx/CzySkKzAwJTAWYv5yFT9JDrxorX3UtFdOX+NNA=;
        b=Fi2KLcpH9/mrsc44yNEp37EWG13yGy36HBGl+7gASRpiY5ujpeXnht7U7xM8AKFyJG
         rxImqwTepgXeZ+7NbQaDHDLK4pwgW9F0h+ZG6fk47V3e3rGJOsxcHlWo9e4H1YNO2kSt
         GJuiezy60+KvxCkthsFIEpjLcMsxDfN4Rlar8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jwjx/CzySkKzAwJTAWYv5yFT9JDrxorX3UtFdOX+NNA=;
        b=d5X14phXZWg5AXx+Z5Ec/nk+Iwqx8gedl58S604j8IUH6sjfWM4XbnA+PIqZKghxPN
         0zS/clgoggHnQkjkofd7yeQ8exHENgYNJgGpqDRi7LcoknAyJrChaHSDJxE/nT+Eu+Sn
         gEQ039X4fOroW6lxcJEJZlnqW1PcGrWXymvGxDAG6SCwKekvrKkGsa/Q4DSD7qBiLwqO
         UOA5RNIVoHT81HohAhJg9cQkKXV9cZnVMQjUSHvvVO/l6RXMjGHQpSNaxdzw/QacMaHC
         rh4sdzFn75+QETD7wQa0Zb0pdEn80AMWzA0l0YS9zVWLS7F3n6iwzWrUaNRU6tuQx8d7
         aiIQ==
X-Gm-Message-State: AFqh2krUxb19eBaa3dt5QE7PY+YqueBWWuWwSDKBOOyt4rZaTYOoYYhq
	4cvgd4RUW/4J6oDtxNz5nZ2S/YQ08J4DhzKw
X-Google-Smtp-Source: AMrXdXtgVDd7XR9mZykQW0bz+pbvTkRqt0/KepjpoEQO1XnLmLpCOu6Y5NQXcNvLvtDVeRisOePYYw==
X-Received: by 2002:a05:6000:1e18:b0:2be:151a:dda0 with SMTP id bj24-20020a0560001e1800b002be151adda0mr33636673wrb.70.1674753410063;
        Thu, 26 Jan 2023 09:16:50 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f2d7:e330:f537:35d8])
        by smtp.gmail.com with ESMTPSA id l7-20020adffe87000000b002bfbe30e8f8sm1724685wrr.98.2023.01.26.09.16.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 09:16:49 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] oeqa/selftest/devtool: Fix for linux 6.1 versions onwards
Date: Thu, 26 Jan 2023 17:16:47 +0000
Message-Id: <20230126171648.2527833-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 17:16:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176411

In recent kernel versions the string "Linux" moved to a header,
'include/linux/uts.h' instead of init/version.c. Allow the test
to work with both situations.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index c78a68be5b4..86014d25576 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2040,7 +2040,9 @@ class DevtoolUpgradeTests(DevtoolBase):
 
         #Modify the kernel source
         modfile = os.path.join(tempdir, 'init/version.c')
-        runCmd("sed -i 's/Linux/LiNuX/g' %s" % (modfile))
+        # Moved to uts.h in 6.1 onwards
+        modfile2 = os.path.join(tempdir, 'include/linux/uts.h')
+        runCmd("sed -i 's/Linux/LiNuX/g' %s %s" % (modfile, modfile2))
 
         #Modify the configuration
         codeconfigfile = os.path.join(tempdir, '.config.new')
-- 
2.37.2



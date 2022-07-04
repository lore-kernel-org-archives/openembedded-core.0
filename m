Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85AECC43334
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 14:18:11 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web09.72907.1656944290764046130
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 07:18:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Wr/arcb0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f49.google.com with SMTP id n8so11962518eda.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 07:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jqyW+I6aGdOhqlLPSG+3885vmvxhCOg11vKBh9Vr1nE=;
        b=Wr/arcb0b9O/1bHQ6ljIs026KP1XVJuBHmjsnewtQIbKZm4NiWmVHmse4ugm4A7+lR
         xbUuac0zYQ4KXgoak2QElwWFc1kcnSb5VrzMXTeiW6xztYkqqunCAlbKDnk8K2O2n8nm
         Xc4wKuEUHRU2hxYlaleEBivnbLwvlJZxVcEaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jqyW+I6aGdOhqlLPSG+3885vmvxhCOg11vKBh9Vr1nE=;
        b=EwFhStO62YUFKAgo9whnpWvtY7h3EnlwMNCpWZ8mIDkS3zosQG5vAuzYzwp6ysZvZ5
         ZpMmsc/30F76jDah1le7yyoWDtFxDsyvQNoqKL41JMSQWDNMG5SVCjLTF9Y5v5NmuMWe
         kRwJQzIC+f/zvCghV7vaJ/sJ8pMpPTMqvmuLQ3CkfFC9uxjCj9OVZ9UK7qCaeFg5lKFk
         Iaf8Kc63lgQOb52sb8JnijQMdgv2O2QGb8srVg8dauTi/UMwYyA6RTjfplfyDU3ZzCL1
         1K2C+b5eWPM6/0pPJFT4WIMQCRGWV+PSd+2gPk1RMsacllIqGeEqOCUCnQ4GZqXCVB4k
         FiWQ==
X-Gm-Message-State: AJIora9X685Pb+/CgbFacyQkqrqiyUDZvHJJ+3NuqOKHCmX19tZ+J3DK
	FPyaQWixT+aAKIQxbX9B8asP1HZxSwl/jg==
X-Google-Smtp-Source: 
 AGRyM1sD4JzbJYuMvMnZQNvymv+8wq+Ykp8WidSNZRvnDzoxsk4RmWZEfDFy5Gc5oB7mMh+9mekVzg==
X-Received: by 2002:a05:6402:4252:b0:437:6618:1738 with SMTP id
 g18-20020a056402425200b0043766181738mr39098157edb.259.1656944289140;
        Mon, 04 Jul 2022 07:18:09 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fa18:c075:6c8f:aaa2])
        by smtp.gmail.com with ESMTPSA id
 t23-20020a170906609700b006fed062c68esm14239753ejj.182.2022.07.04.07.18.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 07:18:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] insane: Drop debug exclusion from buildpaths test
Date: Mon,  4 Jul 2022 15:18:08 +0100
Message-Id: <20220704141808.917689-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Jul 2022 14:18:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167614

Once, we didn't have reproducible debug info and weren't sure how we'd get it.
This is long since fixed so we can drop this exclusion as obsolete.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/insane.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index e571d72e183..37e10ad850a 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -445,9 +445,6 @@ def package_qa_check_buildpaths(path, name, d, elf, messages):
     explicitly ignored.
     """
     import stat
-    # Ignore .debug files, not interesting
-    if path.find(".debug") != -1:
-        return
 
     # Ignore symlinks/devs/fifos
     mode = os.lstat(path).st_mode
-- 
2.34.1



Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BBB3C77B7C
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 06:52:32 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.2757.1685083948105878678
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 23:52:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=MYwkKp9j;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f60dfc6028so4190925e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 23:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685083946; x=1687675946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Pp4QuYzBYQTo0PnSmumaBPX491/iHUmClnjvEbQ7Ag=;
        b=MYwkKp9jTfJ6fgpO7DOf5hG6/GGdTv/Ry+wAwaV7nK2gAPFPr0hf44rw/9y6ujwxms
         qpVcpCashOg/4y8OTrIEtw8vELJ/07bw53Z4GoqSsnsiMYt5ZptJhN2JA3R3Xl6jwt9o
         tnohAc+vwav26uEG9Y8BfxByzofzUv5n/bjns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685083946; x=1687675946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Pp4QuYzBYQTo0PnSmumaBPX491/iHUmClnjvEbQ7Ag=;
        b=L/rZGEK04aYvmjiKd1MKhXA90ukk2iZR6V84Xq2kN8U3lTUT6LNY6QshLlgTLCjhe4
         0nfHeBhjvE7K+taxv6GZs5ZcOomThqnvc4GnTxelZ3azE002F0fbUF7igrTUmSMEs48F
         zjUe02hfEDbIjB9xL1aN0mXRMnJX1P/UXdcwA0SJzJcU+3Wl2hssou0RAjnBug5zrGGX
         O0fzKK2FXosTeKrnKxxRLLH22qOjKCxFvw47pE/dcC5VbgeGPzrIStqAoe03jdkqhzrC
         eqspu6pkB9wUwWc4kdVyyQhkl8IELzoGz78QLf3FOty1MXBIeMvcZB7CIFfZKWuUqGD/
         RDBA==
X-Gm-Message-State: AC+VfDxTvNENG4wYbm/GA34xT6jNn3iPult2U4ZAfBYqCFKbctywo+72
	DL4G7Mg66jb6OkzHaUD4RBViu6UBSWHkRcWSeDs=
X-Google-Smtp-Source: ACHHUZ6OXG8EEPyADxGnGgwhNmUHafIA0ri3A9CPjLvB8Nh8e6npzf60s6t5ymz/dInozHG4hqvG9A==
X-Received: by 2002:a1c:7407:0:b0:3f6:766:f76f with SMTP id p7-20020a1c7407000000b003f60766f76fmr604538wmc.36.1685083946293;
        Thu, 25 May 2023 23:52:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fb7f:e528:bcc3:c3ef])
        by smtp.gmail.com with ESMTPSA id c3-20020a05600c0ac300b003f50e88ffc1sm7895589wmr.0.2023.05.25.23.52.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 23:52:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glib-2.0: Fix TMPDIR mismatch test failures
Date: Fri, 26 May 2023 07:52:25 +0100
Message-Id: <20230526065225.2817347-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 06:52:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181762

gcc 13 appears to trigger TMPDIR changes in glib which causes ptest failures:

FAIL: glib/utils-c-90.test (Child process killed by signal 6)
FAIL: glib/utils.test (Child process killed by signal 6)
FAIL: glib/utils-c-99.test (Child process killed by signal 6)
FAIL: glib/utils-c-17.test (Child process killed by signal 6)
FAIL: glib/utils-c-11.test (Child process killed by signal 6)

The issue is caused by our symlinks between tmp directories which
cause the tests to get confused. We can set G_TEST_TMPDIR to
a resolved path using readlink to avoid the failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glib-2.0/glib-2.0/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
index c476d67310d..831bc3b91f1 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
+++ b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
@@ -6,5 +6,5 @@ if id -u glib2-test; then
 fi
 useradd glib2-test
 cd /tmp
-su glib2-test -c 'gnome-desktop-testing-runner glib'
+su glib2-test -c 'G_TEST_TMPDIR=`readlink -f /tmp` gnome-desktop-testing-runner glib'
 userdel glib2-test
-- 
2.39.2



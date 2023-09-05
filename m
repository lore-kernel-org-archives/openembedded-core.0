Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31386CA1006
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 19:34:15 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.31806.1693942451085091017
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 12:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=qpQyUBZF;
 spf=pass (domain: baylibre.com, ip: 209.85.219.50, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6491907dbc3so17520216d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 12:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1693942450; x=1694547250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=f8eFJ7pwg065+ZWmRs6Jer+FG1YgDnBtkcwGXaNpqCg=;
        b=qpQyUBZFrwf6WZobGgMzpZf0XU2O/bkxcf9gd2aCoWWPSREJRoW+zq043LaviSEMZt
         CUv/DAmmUiaz6oY/mpwYsGUCanJS+j7TjpynsekwPG3hvD+q1xjOvZ9RMD9sjnpgiGhx
         TiusrKQwlqQWVvKo87J2Yg0bWwvuOJG9N+n3o0863JH8A7+fR8U7Vo4YUbsG83KcVV+/
         TBJ0OgNjAFGLNf+BOCsrfu7KqWs7brpCMh7b/zp3W8z8X/n2YmsW3y8E3w1bJkEYQF0u
         wSwVa9pPolxJBxnFjGKh8x+cX7Cm0Ns4l0JWaOPIyxKWuOA9rMGgpW0AfRaNFvlCSdWu
         psVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693942450; x=1694547250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f8eFJ7pwg065+ZWmRs6Jer+FG1YgDnBtkcwGXaNpqCg=;
        b=QFBgWS8btzTGNB2HvowHC+IPuUZnMa6qZRub2a90HMNs60v8t5O4eGlwHc++CDF6oj
         VaxC+HIjASEh5XDbKlwB3qXmPFf08vVIk3BKZl+lIu5O6jfwdopDczRltXBbK1vAC6m2
         aR0ZhNFRkChcpRuFW1kLo6Gu6Bo68Us0uIxFePnfL1DIylrBKYKTbxYv1LTWLTTPa6mp
         yfgAhCcCAtACn3OhoRVXrnAW2RHvdIGg0Wy3scEbeT8xlyCWKXtrEycddL18x89Hhju0
         3zcdyAqmPOeJUlUJLQaAW3xXrbK6yjZ+51Ta7DnW5vbW9qRsz2MZa8kYvnL+jyNInDHd
         /p2g==
X-Gm-Message-State: AOJu0YzIukpm4DGGt4rqi+qkuRUCg9iEHh7XO/Zee2AEGK4UIFF6+2Zk
	jjznHkKFvP+wwFVyB/Fa5/ae0bQtGCEqHxH6NiA=
X-Google-Smtp-Source: AGHT+IHFD5QMqt48WnJcM5v9ATrujDAv6UdG+cNTIrAbo04pm7N+SpvDE9bGDxHQlncmyK4TgKfO0Q==
X-Received: by 2002:a0c:aada:0:b0:635:e113:a0fd with SMTP id g26-20020a0caada000000b00635e113a0fdmr13372380qvb.33.1693942449740;
        Tue, 05 Sep 2023 12:34:09 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id k17-20020a0cf591000000b0063d4c39b3dbsm4764315qvm.112.2023.09.05.12.34.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 12:34:09 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] python3-pytest: upgrade 7.4.0 -> 7.4.1
Date: Tue,  5 Sep 2023 15:34:07 -0400
Message-ID: <20230905193408.2602331-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 19:34:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187253

Changelog: https://docs.pytest.org/en/7.4.x/changelog.html

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3-pytest_7.4.0.bb => python3-pytest_7.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_7.4.0.bb => python3-pytest_7.4.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.4.0.bb b/meta/recipes-devtools/python/python3-pytest_7.4.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pytest_7.4.0.bb
rename to meta/recipes-devtools/python/python3-pytest_7.4.1.bb
index 323dfebe38..e9ded985cb 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.4.0.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.4.1.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "b4bf8c45bd59934ed84001ad51e11b4ee40d40a1229d2c79f9c592b0a3f6bd8a"
+SRC_URI[sha256sum] = "2f2301e797521b23e4d2585a0a3d7b5e50fdddaaf7e7d6773ea26ddb17c213ab"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.41.0



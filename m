Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF34C433F5
	for <webhook@archiver.kernel.org>; Sat, 27 Nov 2021 09:54:13 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.34455.1638006852473726761
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 01:54:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I7apxW+d;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id a9so24064613wrr.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 01:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wq5RFMEpVJpmHMtjmVEZAyjN34GmGxoJGpKlkeDJ/KM=;
        b=I7apxW+d6TxApma9TBnrJtGuCuBrhk5iZK7YVnLGdaIaudXEsZ6KW6YycuY7UsZu5t
         YG5s+AXpXVBtFcOXOryBJSzdF1YQTwg/6SSAF3WjurfXyEG7tKuDqksU/FLaXb8HPCGz
         /71Xq2ydSOf2JCqVXQ8I+ESIg+trDCZRYrFrKUxlIopmSGnc+oxDDakwNvsKsCysH3fG
         IE1xuzC1SAFg+yOf6ektPR7CAiL9WOU3Ah2pPPHuvyeypq0+6y80YcRKPXXUAHBJX09W
         IPoa6XnZOx2U22GLtuHiU6ro0YI5d3OJxlhpnM5Clf2rpZVRbLgI6lAudAhQuBqK7MDK
         Q5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wq5RFMEpVJpmHMtjmVEZAyjN34GmGxoJGpKlkeDJ/KM=;
        b=muLIr56ZqtHnAy6d0vpeDIs+mJQfiT1FQo+7QLC5YcwkmjGu5gR6nsBFhII7kD58US
         mT74zQKVzq9LLqu3UthwxcYOFwh/kea71xAYuN1sMWP5YkFasxO0k2YPlOFkpdoFysAj
         AFv/xTTSJtciFRjceP9recnAZbyEWaM299HTTTkoyvopEYl6yr4hxdB16KoiFloX4PTG
         quA08tcIoHYDQNjjyrE6GqgvjxwXOsxHtDDcD0ocwTNuKdzUzAKGtowcxeJPXj4P8jdr
         Cj6bocZMUUoht+VNFddhi/OEQV9/BG7OrmJzfxDUHacjS6HNP0QQsCz8I6UQ/OFkg450
         y3Jw==
X-Gm-Message-State: AOAM530Q2qF4mko/atadCtFASFYckwTVa5H+7OCkMF9cP/jiDqd0v+EV
	2I8na0w0Cd0e68URPo+yblK/yKpENaBq+g==
X-Google-Smtp-Source: 
 ABdhPJz1IKjax9638wmqxBNpFy2WpoWWCxClqTAN7TQZ3F0EJcEyYTYdYavOFABmTxJEvh3e+Jaydg==
X-Received: by 2002:adf:d22e:: with SMTP id
 k14mr20029912wrh.446.1638006851098;
        Sat, 27 Nov 2021 01:54:11 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 w4sm8484302wrs.88.2021.11.27.01.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 01:54:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/13] libdnf: submit patches upstream
Date: Sat, 27 Nov 2021 10:53:49 +0100
Message-Id: <20211127095357.1748429-5-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211127095357.1748429-1-alex@linutronix.de>
References: <20211127095357.1748429-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Nov 2021 09:54:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158854

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libdnf/libdnf/0001-Add-WITH_TESTS-option.patch              | 2 +-
 ...1-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Add-WITH_TESTS-option.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Add-WITH_TESTS-option.patch
index 384add5e12..607995a394 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Add-WITH_TESTS-option.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Add-WITH_TESTS-option.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] Add WITH_TESTS option
 
 This makes a dependency on cppunit optional.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/1382]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch
index 6dd7c71aae..2d8213cc87 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch
@@ -3,7 +3,7 @@ From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 19 Nov 2019 13:46:09 +0100
 Subject: [PATCH] Look fo sphinx only if documentation is actually enabled
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/1383]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  docs/hawkey/CMakeLists.txt | 20 +++++++++++---------
-- 
2.20.1



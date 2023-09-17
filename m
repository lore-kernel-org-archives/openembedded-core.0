Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B73ECD13DF
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:39:16 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.27410.1694943552326687925
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:39:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MhZWZDTb;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-991c786369cso472569366b.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943551; x=1695548351; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWVD+caor+omBFjRU+15zTZw4sdEj/UVOScD5hWNfP8=;
        b=MhZWZDTbfSUTbp2hgsuaMfLyswNptUxh1PUN4p2602bI4CleCLarxtgg15AFoOjOeE
         LvsYHun9IZhaWS9Q6m14uRUsB3SIjgn9KqAvO5mZjPzkkZBnY6fRw17fRnW/y6uASj8a
         cFna7xvt0+ccjAZ2/2PDku+vt53U8xNeVv7P1pQMZ14+LVvkbVBzWOHmtfJVPVtsrbxE
         t6IjaEjnV44Kup9Yjv4UO8UWsXbwLYrn/rEBWfGKF4GGjszhFjxB3Z4mF8Eh0AaXxYr+
         ul5IOh3GPMqkcbjFp29SS6lMBTYamuZssQOj1b5lw3yBBunBlVOOSnLQ7hFGSpeKUjf4
         rR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943551; x=1695548351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWVD+caor+omBFjRU+15zTZw4sdEj/UVOScD5hWNfP8=;
        b=NsIRKmNylDPbEitHG94c+a66dFwfMEBrOXd0n6s/xADacm2CWc637eJwrbyDNKQnLy
         gfgdO8gJJT9In2FCj92brJSc2lhYYwiyCnSjWlYVW1D3/ftoE1m5szsx26ogDItHA09Q
         22T4defpxiJ9xALwqKoDLX1Ke3wwbxnlGGAPL6wqaHlIR4dtQxISW4N+yOTcFGsRGYSI
         q8lQJ0Q1jvFecCb2c/1f1kkVeMuE1L9Pm+chcSicuQAwBb8f74Wv+3Y4j7mncWAbe5I5
         xhTcON98S9nubK8voRJ0rWGvnG0lR45Yndf+ILd3vWwNNa/HDIpAEzTwpY4mpyylpgsu
         H9iQ==
X-Gm-Message-State: AOJu0Yy85LBGCcIiBVVItsa3DTdfhgrG03w/ygoKxbFWqsWPJdytoY5b
	sJrS55YJFq5/l/PtwMKXNhczfZNN4uQ=
X-Google-Smtp-Source: AGHT+IFpIhSkZp22/bgJJ7PS9RcZ3S349c5aI+jSFc/1fvUzH7fd0w4M6kA4opX4gploaNZ25dueMg==
X-Received: by 2002:a17:906:20ce:b0:99c:3b4:940f with SMTP id c14-20020a17090620ce00b0099c03b4940fmr6635589ejc.27.1694943550823;
        Sun, 17 Sep 2023 02:39:10 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm4779683ejy.3.2023.09.17.02.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:39:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/29] busybox: enable 64 bit shell arithmetic (via long long type)
Date: Sun, 17 Sep 2023 11:38:42 +0200
Message-Id: <20230917093901.428214-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230917093901.428214-1-alex@linutronix.de>
References: <20230917093901.428214-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187783

This matters on 32 bit systems where otherwise timestamp manipulation
in shell scripts would overflow after 2038. One of the scripts in
strace test suite exposed the issue.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/busybox/busybox/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 3d36447c63e..f3d545dc3fb 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -1190,7 +1190,7 @@ CONFIG_ASH_CMDCMD=y
 # Options common to all shells
 #
 CONFIG_FEATURE_SH_MATH=y
-# CONFIG_FEATURE_SH_MATH_64 is not set
+CONFIG_FEATURE_SH_MATH_64=y
 CONFIG_FEATURE_SH_MATH_BASE=y
 CONFIG_FEATURE_SH_EXTRA_QUIET=y
 # CONFIG_FEATURE_SH_STANDALONE is not set
-- 
2.30.2



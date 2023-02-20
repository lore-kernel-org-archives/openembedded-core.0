Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A68C05027
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 14:19:10 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.14047.1676902721487967580
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 06:19:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Qx27OLrL;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 132so638167pgh.13
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 06:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o4+LzvaBUyQ/MsWlx0Esk4hYgorGZ1Z+O1ByXrEAzV8=;
        b=Qx27OLrLbU9Zcq3CmBf0utRSiJErnR1r2DKNhGeY/JxN14DbaZWl4fakvlNBCwyGYp
         9Q9p+dw9PF8pO/XkSy7bAHzH2DxLicfgZi+xDQwd7RLccYPYLROJRZsSlwG0oiIy+5X/
         qNjOCK/5d6FheDyBFdELVVcgPsymrmM8xdMIeuU1x9unPS6R9UQMXDe9i3UxPasHha7a
         m/y67j1sh9ruIZvZ7ffXtBQQxMwjfAy0giE/oFemp6F00MqAaH2n1FroS+/A3ztyHioy
         qnXFvzwb3dTx3l9dzPcDAdwBtulRG/4vhpP+axsXoSyJiILpBJISjW6OKyzR7BXJ3qwS
         JYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4+LzvaBUyQ/MsWlx0Esk4hYgorGZ1Z+O1ByXrEAzV8=;
        b=UQ9f2cuMtxMn97zwlgIlG5hPQ5Jcv1mN9MQYTRotdmcG7UEbkium7EevX2jeosIcua
         rG+fell+qtMCXIxTI8FhoRST6o3X9pTIs5RXcUzoAYlqG2JNmzNY8Gqkfs9qUmmvqNEK
         Q0nbhm0u0bU3swnmlehNRE7TPBSgvr96UIR8rYlUsBu3Auff228rVTYVyZx0clza62Oc
         yiM9sTZkmGKJo0c875ojblnB5//jA7EKlmT67YCmjQFl54bbxIgP41AZGVZ6rii2YIrB
         JkjgXHjZwaZgxQVJKpbVUzsJoYiVNJJHf5z6C45tFJU/YIRyFWeOamkkIszW8BjuUUgB
         0I2Q==
X-Gm-Message-State: AO0yUKUGiQQnzcRghTDN/kO7oWV2MUGGzpSxrSmGnYlD2rYyjaoIU9zb
	HHjnsStNyMhYQyL6dikZyrViMzMOjG0GshbyYYc=
X-Google-Smtp-Source: AK7set8m9CvcTAYg+4IOT8g7MZ1v0YzDT3hQr+r11+XnteiGVYEbAqOQP5zJuFL5ssjCkdVSr8qmiw==
X-Received: by 2002:aa7:952d:0:b0:5a8:a0df:a624 with SMTP id c13-20020aa7952d000000b005a8a0dfa624mr985807pfp.22.1676902746934;
        Mon, 20 Feb 2023 06:19:06 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id q19-20020a62e113000000b0058baf8694e1sm7789297pfh.71.2023.02.20.06.19.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 06:19:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 16/22] devshell: Do not add scripts/git-intercept to PATH
Date: Mon, 20 Feb 2023 04:18:23 -1000
Message-Id: <54dfb8bf6836013ac7fc6112fce9daaf6e719515.1676902605.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676902605.git.steve@sakoman.com>
References: <cover.1676902605.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:19:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177422

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The use of scripts/git-intercept was introduced in commit 3266c327df
(install/devshell: Introduce git intercept script due to fakeroot
issues) and later reverted in commit af27c81eaf (scripts: Make git
intercept global).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit f6c260c8e2a33e282a35afc99de4ef8cc1791b08)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/devshell.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes-global/devshell.bbclass b/meta/classes-global/devshell.bbclass
index 03af56b7a2..4c23049cf0 100644
--- a/meta/classes-global/devshell.bbclass
+++ b/meta/classes-global/devshell.bbclass
@@ -8,8 +8,6 @@ inherit terminal
 
 DEVSHELL = "${SHELL}"
 
-PATH:prepend:task-devshell = "${COREBASE}/scripts/git-intercept:"
-
 python do_devshell () {
     if d.getVarFlag("do_devshell", "manualfakeroot"):
        d.prependVar("DEVSHELL", "pseudo ")
-- 
2.34.1



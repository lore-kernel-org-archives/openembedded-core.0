Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48828C6FD1C
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 15:22:52 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.11826.1678807363873940269
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 08:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=q3c5LaYn;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id cn6so3150737pjb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 08:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678807363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYPvd7+UjBFUrkyiif4kk33Q5SM1uxL9AWTJm6JE8qg=;
        b=q3c5LaYne1uebofI1QAQ6pqPOgXH95RyJqYlEkW3uRoq0imicowDDOO+QjzU2CIqLE
         xXi0rv3ZHcf5isOQQ8/4vqmUV4BQamPbpSLza8Jya6MqhY7aP4j7dP4bhZCtscmZQjeo
         VzwE+U49rdJ8uSBATwgw4fGWvL+eR15/vbkjlQPqf92uPZB5kod7GxLJZva+CB3NWagU
         EpPzLuPFBk5w1DVPgPNZ40gC8YYTitBRSAoESSgu1gYHMnggkb5mhVyJLoI9X9r9Qe4H
         sBe/z8ZlTUKkim6xaJnDhlmT04HbqkQWIRVZZnkkKnrTGa/7unduIJLniguiJhLqw680
         ZMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678807363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYPvd7+UjBFUrkyiif4kk33Q5SM1uxL9AWTJm6JE8qg=;
        b=3OF3EPwCm8fnL2mqCoqwjWfmoGha/bUTT4xEd5C4/VKkp8RLI684djFDgIBUaEl1hw
         xtyADOMswt4Y+BI9IyteGarh7S/+kzsixojY86d0VeJk/brnXpPKbHu9ok5a1hWgzvtN
         wnwWiqwjCtPXKRHlPGuqgJe/v21yHaKRR0yr//h2Rg39prWb2m/rtY5Xz1W9Gqa18Qqm
         BlbLjP3S4Zx1zYh47cEqVduZu/EtEDYQjBP3dGkDR0xQVE1Ykx5Cxmq/zF9hUacO9OeO
         zom8f4N+IQzSs2YycE7QE9QwQ9ZgTAhN5DQUJeJ6Dtm4iNd/xlcUaI15gGy7geWsGFjk
         qc1w==
X-Gm-Message-State: AO0yUKUv+w2m1mZhp7MZDxhVw71MM8Od6N8NLngQlbfYI47zNIYNFHJk
	/VX+MGN3l2ZtkHF3Le9lsJX86hH+iA9NZymuFnw=
X-Google-Smtp-Source: AK7set/G/gmKsim8AEPSOnomwti9nClZP+LTVerjdSbjaM5q4A4tCxNYlnKsExilUAcgNosyduIUHA==
X-Received: by 2002:a17:90b:4d83:b0:23d:3264:16bf with SMTP id oj3-20020a17090b4d8300b0023d326416bfmr3447031pjb.0.1678807362906;
        Tue, 14 Mar 2023 08:22:42 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id p13-20020a17090a284d00b0023d0e743ff6sm1871977pjf.3.2023.03.14.08.22.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 08:22:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/6] linux: inherit pkgconfig in kernel.bbclass
Date: Tue, 14 Mar 2023 05:21:55 -1000
Message-Id: <a5e62888768be641d5da00fd847e0cac96820c75.1678807105.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678807105.git.steve@sakoman.com>
References: <cover.1678807105.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 15:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178507

From: Ming Liu <liu.ming50@gmail.com>

pkgconfig is being required to find dependencies for building kernel
native tools, move "inherit pkgconfig" to kernel.bbclass so BSP kernel
recipes can also benefit from it.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 8a84bd98e3fbc16c782f83064801e469d086911e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass                  | 2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 8b89360991..c6310d8de7 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -595,7 +595,7 @@ do_savedefconfig() {
 do_savedefconfig[nostamp] = "1"
 addtask savedefconfig after do_configure
 
-inherit cml1
+inherit cml1 pkgconfig
 
 KCONFIG_CONFIG_COMMAND_append = " LD='${KERNEL_LD}' HOSTLDFLAGS='${BUILD_LDFLAGS}'"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 06a9108fab..a1c0de9981 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -10,8 +10,6 @@
 
 inherit kernel
 require recipes-kernel/linux/linux-yocto.inc
-# for ncurses tests
-inherit pkgconfig
 
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
-- 
2.34.1



Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D59AEC4829E
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 20:53:45 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.4291.1707252824803827244
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 12:53:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G7+mrSIe;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7810827e54eso362091585a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 12:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707252824; x=1707857624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UuBCBXCP84gXIir40P9/Gea06IOEFFZdb0HGV8dJfw=;
        b=G7+mrSIe2BQr+fSscrDcXqUY8DLc/XhEZi2ayAHa/ZnTfuFvI1Dg5qDzyxOE9gW7sI
         RnP9Uue4/CTbEbPeM6LCtUFP6kCbO6kHGUegEtaRh3JnIQLvTgZ+hndo4c6JxXN0YuQK
         4uXUwgBXxKRxuG58BUc/pua1eVCFMaSLdzQXGRQsJ5ijRqWNY3QU27x+pp0cOJ2TfVv+
         tmYIQoGFMSzHO323JCcqfCQTTA4Q5QsOkpxq3HaTjZFJ6r5TcMMrhl/AIKxE5PzhV9cO
         uZqG8ZxSmme+y+u19kooLmZxqiKaUusOBWXE0jmZrq6qWe9lwjWF5ioA5DWZ4iF5UEZT
         0apA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707252824; x=1707857624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7UuBCBXCP84gXIir40P9/Gea06IOEFFZdb0HGV8dJfw=;
        b=JEq6Non9l8+1ZIFlTgZVWGZuFERn2qqouZwR8MqBtIe5rv45SeN6sgekbswtKG4E2L
         prURsRapuPR06XiLJj31xoSSz9fCuaHSO1fL7Z3GSAJZJ3f1Avd5Fqpu1trR5UIFj8rL
         7ex4hxDwDlUNzrjgKWQjXYDG5UpgvdGTw9R2Pzw619nxS32OOzbQyGvh4EkHG62LGybg
         jfleDvZzjYiOaINR5lM3qgwDSC8hJ13Y8cRLB6JLG1adjTJXcWMCgYvL0yX4ynixWqEO
         HRKNDNAe0NkUOWczNhGMDxD3fiCpfWHb8HzFz9WNViR+CsOWulf0gIBpFAZi7fKJIL9h
         e07Q==
X-Gm-Message-State: AOJu0YxubRHSOxDEPXTr/foYaBp4PB+sCsFtdN7N87UERE6wAbu4FJZh
	6wHelDojZKAzmNAAx37yrxeGgpykprdCbXF0DJbF/mYDx9c92w63ID9JPLjJcXKNKQ==
X-Google-Smtp-Source: AGHT+IEtSXLHZKV9a6mlrkxSVZHCROD71lW+Y+qa/nc6K0lh6xjS0Liw8Jog7uZscknT5XtLvw8Ntw==
X-Received: by 2002:a05:620a:34f:b0:785:4dea:d529 with SMTP id t15-20020a05620a034f00b007854dead529mr3772039qkm.18.1707252823809;
        Tue, 06 Feb 2024 12:53:43 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id y13-20020a05620a0e0d00b00783de6b5ccfsm1253506qkm.88.2024.02.06.12.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 12:53:42 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] linux-yocto/6.6:  can: drop obsolete CONFIG_PCH_CAN
Date: Tue,  6 Feb 2024 15:53:32 -0500
Message-Id: <532616c57384f8ed2b7aeb5f7d285f905ff7936c.1707252636.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1707252636.git.bruce.ashfield@gmail.com>
References: <cover.1707252636.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 20:53:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195031

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Anuj Mittal
    Email: anuj.mittal@intel.com
    Subject: can: drop obsolete CONFIG_PCH_CAN
    Date: Fri, 26 Jan 2024 09:45:25 +0800

    The driver was removed in v6.2.

    https://github.com/torvalds/linux/commit/1dd1b521be85417ec409062319520ca26c1c589e

    Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 80bb901924..374fd80318 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "55f4682a75d1673cd78504a7342918c1b5dc4d16"
-SRCREV_meta ?= "b45c991cb442e78a307565783e14d31048ad3ee6"
+SRCREV_meta ?= "c32ab927d38291b1d2003ff491aa2ad4b60e1241"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index fed7220116..d391292488 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "43f7233f561431ae4c0e745985921bc84095a39e"
-SRCREV_meta ?= "b45c991cb442e78a307565783e14d31048ad3ee6"
+SRCREV_meta ?= "c32ab927d38291b1d2003ff491aa2ad4b60e1241"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 513a55dfa4..9f2fd64b34 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "43f7233f561431ae4c0e745985921bc84095a39e"
 SRCREV_machine:qemux86-64 ?= "43f7233f561431ae4c0e745985921bc84095a39e"
 SRCREV_machine:qemumips64 ?= "5915b5fa9b827e29cf1946dc0f92ab2b481de011"
 SRCREV_machine ?= "43f7233f561431ae4c0e745985921bc84095a39e"
-SRCREV_meta ?= "b45c991cb442e78a307565783e14d31048ad3ee6"
+SRCREV_meta ?= "c32ab927d38291b1d2003ff491aa2ad4b60e1241"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2



Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B3CC636CC
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:25 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.3149.1675840921798244239
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LFjicjqs;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so737748wma.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cojt7w185Rxn7YNQ9HZ64ZXKanbzp2ZFtqteY8U8/zk=;
        b=LFjicjqsQfyl+DAAFsITN9/ew4nY8E0/PBhpE3BDvW7HfLgJz0CJiMhvWqCNv265PD
         A/oTTOxfMvboKT/3rnmmscUAcIS7r/Tt2D6dclgWiGdAUCQwNM9Qi8sp06hslvv93F6m
         3vpXpiaV/IMMER5Ap/u57A/DaiSlWHcZBUJ0ySejp8uzY99EmSx3Vnax2v93W3F0cnbK
         VsKV5R4RXT5yserMiXJzfqlyhpuSlUat/+uD4ZMPHEEgN8w6DX1qIV8Eg9FB1o5MaBbw
         0qkn0YiRiDWRL2MgFM2JhfFJlRxZkAX2f9uUfDxODeKUn0/t9zT/pT0DrsuMPFVW8nc3
         uMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cojt7w185Rxn7YNQ9HZ64ZXKanbzp2ZFtqteY8U8/zk=;
        b=7PLQqTBY1xl0qmYck5HTrRq2A6AFh1wsA7q6SHXu1MjArP9dVah4EMqLlh6eHkWsOo
         16m05mAG1yJsL4ct/u/vWzozEx2sZAE/bvGZFu3buS6x22EfqreleUcI5YJAorz+2a06
         fsTFUir5MX2VV9du37tXktKw5SSKw+EL5VFVrIV/58PUfSVbS8GVcaLVpHyjbY4NpdwK
         UNu1JIWCrkbK7M2rdc6wcKoEhcAq5sj2licwP189Cqmn+uAKZY0jQoQXn3VnjGnVOAFO
         7x0agRMf0MPc0GIc+6/8NaacmQQoCGCOJCxo6rgZ0HCjcPlyADPNEFhX1HWozqPdPjM5
         b3RQ==
X-Gm-Message-State: AO0yUKVjvX1bCl/K72Kmf/tHrTrD7PnV5fT9/EJaO9uwJSJU1vB7Gv0c
	PirINOn5nyCHDOOgSsfqwipm+FBWvHw=
X-Google-Smtp-Source: AK7set/5oaODDvB5wxn3C5IXkSeD0tyCph6KlhigjijjptqjnSVauRJcbBq22gNy2Nfm4IdWmnZMgQ==
X-Received: by 2002:a05:600c:4b1b:b0:3dc:98a4:787d with SMTP id i27-20020a05600c4b1b00b003dc98a4787dmr5698363wmp.3.1675840934261;
        Tue, 07 Feb 2023 23:22:14 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 46/52] libinput: upgrade 1.22.0 -> 1.22.1
Date: Wed,  8 Feb 2023 08:21:37 +0100
Message-Id: <20230208072143.2930292-46-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176886

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../wayland/{libinput_1.22.0.bb => libinput_1.22.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.22.0.bb => libinput_1.22.1.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.22.0.bb b/meta/recipes-graphics/wayland/libinput_1.22.1.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/libinput_1.22.0.bb
rename to meta/recipes-graphics/wayland/libinput_1.22.1.bb
index 5a5fc9f35d..f86885d3e3 100644
--- a/meta/recipes-graphics/wayland/libinput_1.22.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.22.1.bb
@@ -12,11 +12,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bab4ac7dc1c10bc0fb037dc76c46ef8a"
 
 DEPENDS = "libevdev udev mtdev libcheck"
 
-SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main \
+SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=1.22-branch \
            file://run-ptest \
            file://determinism.patch \
            "
-SRCREV = "fc59e574e050c502c9a3adefacf97babf3d09c7a"
+SRCREV = "d9f45fd1261da85b4eb44f8aa82e1500b99f303b"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.30.2



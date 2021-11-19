Return-Path: <a1ba.omarov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A84C8C433EF
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 15:01:48 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.9980.1637334107679456322
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 07:01:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=niTG5tKQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.45,
 mailfrom: a1ba.omarov@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id b1so44331577lfs.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 07:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ds4Ogoa9BLluhro7fUbZ2CTOuuWCu+9QW2ekRF0Idn8=;
        b=niTG5tKQHVjIZ0Lxc7LH0+tpFbFSQW8UQo6FZk2gS4EPDqebuWIuu9pGTGMJyk2IIu
         Y5ON8r07yCu3q5/H4GQgr5Fxgfr5UXy4es8RiZ7sb95OehhOMN/g3LiAwMJt8B6aAY33
         lhMxfdGcsmqoQ1QupTj93piab+Gf75+qer6F5N6ZXh2BCA7fMkdf8wDfq9xxj5YbMDK0
         Dtx9N7CaoLKF5vMNhlxmn9k/7zGWC3iW0NJQqqjAJF3xggSO+XX0PUdPSp9iAz+DdRk8
         9qVpoZ256M1zk9SjVjkBY8bUT+eEhHnXOIybH0aSGDupN2oVimMGD8DahKOMgiohjVdM
         WmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ds4Ogoa9BLluhro7fUbZ2CTOuuWCu+9QW2ekRF0Idn8=;
        b=UfGCI6B+nA8X9EOzoziBu80d5hAKK/w8ThDIhlhaPNsMCv20ATd/8pa2ggeXjHxVVs
         it/xnIWqWCc5w2H6GjSNVoL8B/XrJDVPu1vilchQj18e6RjHROtwfuIXZK0TxFknfQKC
         TpVmNev/jUSqId3MORB654dI7NiNuayB24pZTdQfZzmL5W4c1CpNSYOE+dUlNtEIDesM
         PZus3UFB3PwkAjDZHPNokshswko+G5GRaDTob6RTXWrlZ62Bcc5exBp6Q9YnlB/Cep4u
         ereAwjCq19qTMTzBPaMaMuAntCFOqYX77BwKrezcUUkmDsgQppNOR4rJQsA8YYQE2QZU
         +JqQ==
X-Gm-Message-State: AOAM5325ZSMBaoTGdwd8Jch/LdKNE8/z5Wiom24bk0eFiRQMSee/LMBf
	OX66FXQLf5jWSL/6PVgU1ljyf8KGhn03AA==
X-Google-Smtp-Source: 
 ABdhPJw3VoAMUUfocMiEmAJRkmZYEKLjLj4tMjPEIeWNhL7tr7qkT/7lKqn2Vong23uuwtA2PX239Q==
X-Received: by 2002:ac2:54ba:: with SMTP id
 w26mr34247772lfk.548.1637334104833;
        Fri, 19 Nov 2021 07:01:44 -0800 (PST)
Received: from U19.ag.local ([135.181.76.187])
        by smtp.gmail.com with ESMTPSA id j20sm6930lfu.84.2021.11.19.07.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 07:01:43 -0800 (PST)
From: Alibek Omarov <a1ba.omarov@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alibek Omarov <a1ba.omarov@gmail.com>
Subject: [PATCH] ncurses: disable big core only for target
Date: Fri, 19 Nov 2021 18:01:39 +0300
Message-Id: <20211119150139.1120348-1-a1ba.omarov@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 15:01:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158522

Building some terminal emulators(foot, for example) may require
tic to be built with enabled big core.

It's highly likely that tic will be used as native or in SDK,
so we can lift memory restriction.

Signed-off-by: Alibek Omarov <a1ba.omarov@gmail.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index a0ecd8a80b8..793056c8901 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -38,7 +38,6 @@ base_libdir:class-native = "${libdir}"
 # Display corruption occurs on 64 bit hosts without these settings
 # This was derrived from the upstream debian ncurses which uses
 # these settings for 32 and 64 bit hosts.
-EXCONFIG_ARGS = ""
 EXCONFIG_ARGS:class-native = " \
 		--disable-lp64 \
 		--with-chtype='long' \
@@ -47,6 +46,8 @@ EXCONFIG_ARGS:class-nativesdk = " \
 		--disable-lp64 \
 		--with-chtype='long' \
 		--with-mmask-t='long'"
+# Assume target system has little memory but native has enough
+EXCONFIG_ARGS = "--disable-big-core"
 
 PACKAGES_DYNAMIC = "^${PN}-lib.*"
 
@@ -80,7 +81,6 @@ ncurses_configure() {
 	        --with-termpath='${sysconfdir}/termcap:${datadir}/misc/termcap${EX_TERMCAP}' \
 	        --with-terminfo-dirs='${sysconfdir}/terminfo:${datadir}/terminfo${EX_TERMINFO}' \
 	        --with-shared \
-	        --disable-big-core \
 	        --program-prefix= \
 	        --with-ticlib \
 	        --with-termlib=${EX_TERMLIB} \
-- 
2.25.1



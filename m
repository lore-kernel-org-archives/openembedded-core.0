Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED1EC6FA99
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 22:49:05 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.8713.1678229340136585423
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 14:49:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=07Og1NQ/;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id s17so8574380pgv.4
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 14:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678229339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/mTkJNhyoS6XT8aTqjMXoFS52gzoAAunZL3zbh3PPVI=;
        b=07Og1NQ/a5SorCSeC6b+4bVvMwo/Y4DvzpyGyTou0vMOS4ZX1klr4zNtSJ8Ko5/fTH
         E/K66uNmh08lsgGQ1amAd/Q+rQDOIYiEvCEIFnDW0PTSH4KeKCsFz/N0J9OcSa99sAGR
         FGI1YmvA8CucMkcRUBJeXBjFORcXunLxmgJ0i2/lKbG+csNu0JB4eRBeEqd4xn7XU4oo
         K2SVth3tVDQe9dHu0Fps1/CdQqacR/d03tzCtb2buBdU81FKYtND4miXEb5sGsLRaRVP
         yib+VaAKqBvpBR0/4Kn8iigZOAz6/UAmCZLGsSjGDS8TLzVhvOXD7uUhjZ/Ar9o0vHax
         y59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678229339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/mTkJNhyoS6XT8aTqjMXoFS52gzoAAunZL3zbh3PPVI=;
        b=DbS0THNUHkFaoqGTjuEoI1FHQMGA1HU4TsXAutxGNRxDp7/XGl0tLcwJOh/fzmKG5j
         hJmgF0LWhx2N7hNl6JJwT3rHnfVs8FH07OOlnpehFq+a3N8OsbUPH8TQXiDc40xHZAjZ
         zZOo9eYc628R14wOgzxIZVRVj3J775J/gKQaEpXj8eGZ0Iw12xKTPEhSB4wNfmntsB6X
         pP8XaVCKLF2l7B+BtT7+hIYqSaDYasT/kDTjOf4Qz4PBnq/bxDadXku9zNIA6q0xS6r1
         x7TVDTpJoiJIqyEku3H4TC1BuhPPgKQJJBKaTW/wwQsKT9NUT0o92esWwXAymXtGZdOM
         r/og==
X-Gm-Message-State: AO0yUKVWqI+opV4vdAjocSTaqfYtYsxeqJgqVDPwNmZ0F0XBrkoCd72s
	YkeddZRwVKP69NBRbYQ2hTdt3MwEii91DuvD4hM=
X-Google-Smtp-Source: AK7set9fcq+RO+ID+sNROCfwM6BHZkspstAcR4+VdbDr+ilzwxy+k8i96CAgSVPZ1k74ENq06/uZ7g==
X-Received: by 2002:aa7:9537:0:b0:5a8:abd2:2beb with SMTP id c23-20020aa79537000000b005a8abd22bebmr12931183pfp.30.1678229339200;
        Tue, 07 Mar 2023 14:48:59 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id k1-20020aa78201000000b005cdbd9c8825sm8388958pfi.195.2023.03.07.14.48.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:48:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 23/23] devshell: Do not add scripts/git-intercept to PATH
Date: Tue,  7 Mar 2023 12:47:57 -1000
Message-Id: <51424b9955374196307aaf73cf4b6c184ce4fb6d.1678228988.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678228988.git.steve@sakoman.com>
References: <cover.1678228988.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 22:49:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178145

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
 meta/classes/devshell.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index b6212ebd89..76dd0b42ee 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -2,8 +2,6 @@ inherit terminal
 
 DEVSHELL = "${SHELL}"
 
-PATH:prepend:task-devshell = "${COREBASE}/scripts/git-intercept:"
-
 python do_devshell () {
     if d.getVarFlag("do_devshell", "manualfakeroot"):
        d.prependVar("DEVSHELL", "pseudo ")
-- 
2.34.1



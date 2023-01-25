Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D9AC54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 14:42:37 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.46700.1674657730495147498
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 06:42:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=kwaxgbjm;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 36so13504618pgp.10
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 06:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3hOiD74BldmN405RufQryjuMCtfru5NghY/Y0bC0jHo=;
        b=kwaxgbjmyDe+GjhKc9Bg8clDhXo9DVfkkQlGEbahN7m2b5SoxGDYV3GOETd+omFOj3
         Xf25Iob3Z67gtWQ5IYJAIcuym0JDeF8RXhXy+odU70U81iowPKoePPsI6xZ8CoTpJ0Js
         3rkAsqhUogUZX91dEBGt00eqNi+9hEHehOPbWL7XAh+9v31oInH2vgkUKzcQOm9HFdM5
         VlNhMmlWtcwdomKj96+xEvrpUmyUD5ZMZUfoGggxLN/L4MILiU+AbIYb2+mBpnWgAw7T
         Y8NvquwjRTRS+uCnTABgtS0brju2UrVazIP77o7XllhRj/9mPb1vnSQjh6DP2Svt6x8S
         wjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3hOiD74BldmN405RufQryjuMCtfru5NghY/Y0bC0jHo=;
        b=T5MoVJfLU1CPhWSFqrMC0B+DI/z1lKUTl5pxlxcaZcHsqN5kEqDmG/y0OHg4qHNvD4
         gF6Yoi41eBVNMFfjyzorLjJm0jApLwo5r3kYpzzZXNASqkaznfXOK6vD/zLSeFHPTZ1B
         MUvbeMsQR1KEwK1G8OMwcLCzy6DKParUwkXTdubqeIgf0OJzX5UWiBQIjFODOuNAKdoM
         puOzDkrLJuv5oYrIEK4+iKT3C31yCSUfyWhOOGtZLt6PK20kN6k5epBCnDz3mEuQ/M3f
         pmirG8M9paJS/6uTWEQbj+WYqNnGUqfSUgBVgSWZP/K88nuVzr2rNwQbMYHwOv+SulrE
         y/CA==
X-Gm-Message-State: AFqh2krZpeju5SfrpTO8blGxNLSZoEtuZOMq05g4V0NMyTxKPYv55jqn
	D8ENDKbE2k+J8PPFEi3oCIx77xI6w8v/1vkqbU0=
X-Google-Smtp-Source: AMrXdXviJe67z8IsFaI1NgYJSzzS4JxQHaL+M8rW3pt/r0zhn5C1rUyvTQph0XndY7WTQQH+5dQeCw==
X-Received: by 2002:a05:6a00:2ba:b0:576:7fb9:85cc with SMTP id q26-20020a056a0002ba00b005767fb985ccmr30204159pfs.14.1674657752530;
        Wed, 25 Jan 2023 06:42:32 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d2-20020aa78142000000b005810c4286d6sm3723703pfn.0.2023.01.25.06.42.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:42:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/16] systemd: Consider PACKAGECONFIG in RRECOMMENDS
Date: Wed, 25 Jan 2023 04:41:55 -1000
Message-Id: <5a2522c7dd74350d0554e550bc5764794c289422.1674657501.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674657501.git.steve@sakoman.com>
References: <cover.1674657501.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 14:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176363

From: Niko Mauno <niko.mauno@vaisala.com>

Since RRECOMMENDS declaration implictly induces building the recipes
that provide the runtime recommended packages, conditionalize adding
such values according to associated PACKAGECONFIG settings in order
to avoid redundant building.

(From OE-Core rev: a1989add927f7805378fe4d5afbde780b747ba77)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd_244.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_244.5.bb b/meta/recipes-core/systemd/systemd_244.5.bb
index 77ef2bc42f..2bca1fbc82 100644
--- a/meta/recipes-core/systemd/systemd_244.5.bb
+++ b/meta/recipes-core/systemd/systemd_244.5.bb
@@ -404,9 +404,9 @@ FILES_${PN}-binfmt = "${sysconfdir}/binfmt.d/ \
                       ${rootlibexecdir}/systemd/systemd-binfmt \
                       ${systemd_unitdir}/system/proc-sys-fs-binfmt_misc.* \
                       ${systemd_unitdir}/system/systemd-binfmt.service"
-RRECOMMENDS_${PN}-binfmt = "kernel-module-binfmt-misc"
+RRECOMMENDS_${PN}-binfmt = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', 'kernel-module-binfmt-misc', '', d)}"
 
-RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts kbd-keymaps"
+RRECOMMENDS_${PN}-vconsole-setup = "${@bb.utils.contains('PACKAGECONFIG', 'vconsole', 'kbd kbd-consolefonts kbd-keymaps', '', d)}"
 
 
 FILES_${PN}-journal-gatewayd = "${rootlibexecdir}/systemd/systemd-journal-gatewayd \
-- 
2.25.1



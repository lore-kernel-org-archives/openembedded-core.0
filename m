Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFAD9C04A94
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:01:41 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.78398.1690740091755346194
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=sXak2zXD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-686f94328a4so2015805b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740091; x=1691344891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y08XIkyb1jAbGrEw8DjcPOjmBHgy3Q3Qun1UILMY9nQ=;
        b=sXak2zXDvos+O562AXK5w1iAJrKqgU+Dm+SwEq+rYwjLBWCSzDQc8dqwyJPC9H7e2F
         HOSyUBNSG+rniI0ZF266AdCxJvsrMJ6Dd+nfvVl3ElbW3A3/9AcI90iYp4D7RbRgGysh
         3/G7wccQsd020iJ5LgmP+qh8TM2E09y9nHFfqqFII1qhKVFvaFLwPI0fBktQtdUKw2gX
         NDdOsTHjECEmVu18yI7wxoEk7bHsfwz3MruyrqGPNma91Pr7wtdpTR/PPz1s56pXSyxU
         mrVqWn5b3Qzs4ItL16xNxG1OQh6butRvZ73IazCIgW/b7GTWQ00JRVllQqA2GGxeV/G5
         hpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740091; x=1691344891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y08XIkyb1jAbGrEw8DjcPOjmBHgy3Q3Qun1UILMY9nQ=;
        b=Fl5hTT4E0o0aQpoGejZFE9Byum51BclA9IJ384XNgGIiZPZDjFIv7vN7bKgZTP3pf3
         BfLAV1JmrP+WgDGHBDeZekRmhfbXj0bugcNaonWlKLiQJo6QjQ6g19cNDLjyXTI8Ii34
         vKFpC03kixIdAOlD+gHFd5blat+67cIBNYdjgGQgEnyo0QxXDqlCn0GpQ12ifZycyf/N
         F0yn7t6lPuaZnr5lwXtcS8MGaLmil83hFUYbR6K2ep1PnqBfcsyGZIElSEp5ld7cvuH4
         SD8GPy07iKm9ZYUOajAZ4SSrbH23FTOjRTDB0AoHwURZvnGxfyq5DSgeeRkR2kZY+dwg
         DrLw==
X-Gm-Message-State: ABy/qLYd0SvZKv68ePi+sI5Fb4tD8wLSfODx8Ex9Lsj1NyD1HmHb/aRO
	zByV6C9uSXO/AZsgOUOxFlwTVPeleH7oX5gh3aoBUg==
X-Google-Smtp-Source: APBJJlEA+Sh0ThwaO3T/fsFSOOp7Q3+f93pAdg+4hokzUJugAZcJuoMdciTiBdRidBfeOWWEmLtTBw==
X-Received: by 2002:a05:6a00:2d0f:b0:668:8ad5:778f with SMTP id fa15-20020a056a002d0f00b006688ad5778fmr9529223pfb.17.1690740090913;
        Sun, 30 Jul 2023 11:01:30 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.01.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:01:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/30] recipetool: Fix inherit in created -native* recipes
Date: Sun, 30 Jul 2023 08:00:40 -1000
Message-Id: <30c0469c57bd0c57ad4a3d0e8306defc8192d3d3.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690739937.git.steve@sakoman.com>
References: <cover.1690739937.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185095

From: Yoann Congal <yoann.congal@smile.fr>

native and nativesdk classes are special and must be inherited last :
put them at the end of the gathered classes to inherit.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a6614fd800cbe791264aeb102d379ba79bd145c2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/recipetool/create.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 220465ed2f..67894fb4d0 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -745,6 +745,10 @@ def create_recipe(args):
     for handler in handlers:
         handler.process(srctree_use, classes, lines_before, lines_after, handled, extravalues)
 
+    # native and nativesdk classes are special and must be inherited last
+    # If present, put them at the end of the classes list
+    classes.sort(key=lambda c: c in ("native", "nativesdk"))
+
     extrafiles = extravalues.pop('extrafiles', {})
     extra_pn = extravalues.pop('PN', None)
     extra_pv = extravalues.pop('PV', None)
-- 
2.34.1



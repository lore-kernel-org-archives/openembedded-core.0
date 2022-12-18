Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8213FC10F1E
	for <webhook@archiver.kernel.org>; Sun, 18 Dec 2022 16:13:39 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.32114.1671380018284281254
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Dec 2022 08:13:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=xc9YgTx6;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id u5so6870628pjy.5
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 08:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=46kAtnQvJU2cXrcnWdDG810eqn8ng7hlCnF4S/Eu0Zo=;
        b=xc9YgTx6rW9lwKBAcS9mY96tI18YG3NdmaTHA89NdsEFLOxh/czFpcRn+CSfc7BT6m
         JkiOF7qYVdp7lEpvhvbNSxLod2Yk3uQJKtd3aWRuzankFO6nMvb5ATanPAnZDHhcQCmh
         YV6BqVvyGWDEx9xYG8EnJbJc6OQDJd2hSjXHDt+TP2I+F+QzFgNCIUDPjb1Wr+HpjAOP
         DxEX+snnHrr4i9K7IDf7d7bUEiWqIW05iZc0etDsFHrEi8KmsGJPoPwD5EqnGdFuahC4
         ot5j6Su+swmH4RS8elDqBy4rfJM8qV0/i01huL7A0jumkQ7rTIJKJWyBJ70MVbS1WCb/
         YB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46kAtnQvJU2cXrcnWdDG810eqn8ng7hlCnF4S/Eu0Zo=;
        b=OQHcjMYBkzqBc52zCzKFcIeC1CGclIqHCYe++NCbtaUsqDjWqyhcD5JKwKfZIGcJ/z
         QuNvXn7TwRhzLpUhtC3fJCqCSjeCDRuk9A+RPY2lGvpOUmOZO3vEO39kW9YeUPr/pSxR
         dd1fwTj8uOUs7pDhlMfFl48gu0YLYJyu5OqiCvyhIT23HXnK2H4bfC+NZ97CQ+VqnwTA
         FWPVA7CE2Eacc8qvZb8yjALm7mMhxePpHi5LfGyGlm2sK/nKn4wyVHdqQj2/f7usCwuv
         dnzPWBJaHyuDbDmjhs7an+B4SbbfrRLjES5CxZFdNPofg2IyJ5K/Q2JRdUW7SySm/GpK
         GHVA==
X-Gm-Message-State: AFqh2kqj9G8H0ih2uEKOad17/Sj0ocPYMy94t0eAqVRckO4X0gjpkAp6
	bH1QYgrMBEoXqLUjur2KmibFUbFDy1aylfP1DEQ=
X-Google-Smtp-Source: AMrXdXuAjZ/yKFLsGAh+BzsAJuEE1PLnuDpXBRKmP/ED8kMTQpqOyK0usp186r+qCQ12VbF+vJrmkQ==
X-Received: by 2002:a17:902:e949:b0:190:cb4a:47ed with SMTP id b9-20020a170902e94900b00190cb4a47edmr6075899pll.47.1671380017326;
        Sun, 18 Dec 2022 08:13:37 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c7-20020a170902d48700b001896522a23bsm5278763plg.39.2022.12.18.08.13.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 08:13:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/19] lib/buildstats: fix parsing of trees with reduced_proc_pressure directories
Date: Sun, 18 Dec 2022 06:12:56 -1000
Message-Id: <96cf8b322f4cdec31175cc2c1082e9e3bc488118.1671379841.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671379841.git.steve@sakoman.com>
References: <cover.1671379841.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 16:13:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174799

From: Ross Burton <ross.burton@arm.com>

The /proc/pressure support in buildstats is creating directories in the
buildstats tree called reduced_proc_pressure, which confuses the parsing
logic as that cannot be parsed as a name-epoc-version-revision tuple.

Explicitly skip this directory to solve the problem.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 24f0331f0b7e51161b1fa43d4592b491d2037fe9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/buildstats.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/buildstats.py b/scripts/lib/buildstats.py
index c69b5bf4d7..3b76286ba5 100644
--- a/scripts/lib/buildstats.py
+++ b/scripts/lib/buildstats.py
@@ -8,7 +8,7 @@ import json
 import logging
 import os
 import re
-from collections import namedtuple,OrderedDict
+from collections import namedtuple
 from statistics import mean
 
 
@@ -238,7 +238,7 @@ class BuildStats(dict):
         subdirs = os.listdir(path)
         for dirname in subdirs:
             recipe_dir = os.path.join(path, dirname)
-            if not os.path.isdir(recipe_dir):
+            if dirname == "reduced_proc_pressure" or not os.path.isdir(recipe_dir):
                 continue
             name, epoch, version, revision = cls.split_nevr(dirname)
             bsrecipe = BSRecipe(name, epoch, version, revision)
-- 
2.25.1



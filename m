Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE5B7C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:21:43 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.143577.1671132093450204625
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=NKy7VPq9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id g10so7866710plo.11
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=46kAtnQvJU2cXrcnWdDG810eqn8ng7hlCnF4S/Eu0Zo=;
        b=NKy7VPq9swfXGiEEoOA43163emhbQDcUA3AvQIBam8gj5kGR4nErHK0HDZtdnEah5h
         8JWoa4uEgO8IBPVRVvjRNOpRNUZPEMhnN9K+e1exCqf+8AQlJBG3KPeQUVuyE6x8t3MH
         WLFJWGZx59bC7Mw69BcP5C5dxJRblyPnSY+0A0dKKhTcBkvbNLFLt0wW11ojhaA/hPpG
         B5dJkI3zQx/VQgpdgX13iuQyHsdQkAKkLObEXdRARG3CFL+LR7+kFb5nPSIwsDqhFeI8
         BlK0a5Pplg0hgp4Ynv3m5iAOqh80xiIC68BrOWLTYy0ZWQMNSFBKsW5IKunJ8CeEhxmH
         XaJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46kAtnQvJU2cXrcnWdDG810eqn8ng7hlCnF4S/Eu0Zo=;
        b=CDkazABqTNuEcjG0Xh3H0eTKMtjxevnKALLl5TAdy+6BmCABvs8rWHyilIW+GW/fIl
         fqc7Xm5TShAE1RSwoomy1vR4iWdVqUO5VM/UYkF7echiGZvt6atX0bTg4dg4FH86JgJG
         FWxNdHIe5lF12+OY60MnKuj40cs09KfNXn6qPoTjgqPgZp06xGmZPip1XsBCsS+yAXmP
         p0fO7EYm8frnZntRddblJoQDXYOkWZJokJuYu8sCw4lPNfxrib6eXZhLCgcOP+NBpZwY
         TUF6E5NA5lewmfuz/jlGDZNUnz6vD88UQn08Re5xsaNLXgjZ8QFMyQBMIwflAEpk1pdW
         vueQ==
X-Gm-Message-State: ANoB5pkThbQHh0oyaGBMEDxMvh3NihPAaHy8N69Kri6zojA1Svv3wCP5
	FzevTYGJCzcfrhZZ+fszk/vJ1qmpm41EbdqtYT0=
X-Google-Smtp-Source: AA0mqf4kOrviOCkjc+Ru+UDXmKhqLyBeSrKq8mcHvQyPvS7rAOzy/iXFaVV3UU4d2CPQveMq9Y6KIw==
X-Received: by 2002:a17:902:d4c3:b0:189:c322:df3a with SMTP id o3-20020a170902d4c300b00189c322df3amr41555102plg.43.1671132102608;
        Thu, 15 Dec 2022 11:21:42 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 24/30] lib/buildstats: fix parsing of trees with reduced_proc_pressure directories
Date: Thu, 15 Dec 2022 09:20:48 -1000
Message-Id: <abe4e7b79042419ab436c03cecebbbeef4991604.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671122751.git.steve@sakoman.com>
References: <cover.1671122751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:21:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174616

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



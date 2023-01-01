Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B72EC5479D
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:43:26 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.16620.1672594997936005944
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:43:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=oZpN2dtC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id 17so27219420pll.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=46kAtnQvJU2cXrcnWdDG810eqn8ng7hlCnF4S/Eu0Zo=;
        b=oZpN2dtCdVEsmWVknh4ZvThy9BCUkpRHkR5iDoke2qpLne1sHHW0etoQMCLagcOu+Q
         IHOMMkKdwn3uh5gCRldDt0Rg5RBrv5PXk/mt6xjj2J97aDh6q3GDanrRgx1pj71OscFv
         3Xp6IjeqjWsmDpnkgIhhxeFnWfSm6ZazJH1m6B7eRQmtrGdF2XeB2KyCSLQfqb2GdsW3
         BoKvCa/nTchYR8ts++3huOCrBa7GX4dYTgfTYiTY6rTclokrPF8XdtJBBy9PHr9gLpk8
         q691XnXjcfj8mR0cyrCiFeIgqwUWrtqy2n6/WW7wLUS7vREW9ZFqp3fwpoznl6vwixpx
         mxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46kAtnQvJU2cXrcnWdDG810eqn8ng7hlCnF4S/Eu0Zo=;
        b=lci9nAvknJY9UCUUrzNgcuubZWkWuGyjB++XZQVaCRsDwjVOkY0Iv4g7R7DirMTFwE
         A5vmfxmxGgDVrYM3p+InJBNPP8dzq39b/VF6y7pneSey0wUETpWQ/F2evQ7596Er1Ukr
         s4OUI4Q3+HzeNXNxY/J9t8KMoWXrlC9bHRdXD8LWRuXDRqKACc+YHLWjZV4wbrdOqAEP
         5U9Hj2g03it3VL0/y0UqpcmgsLJc+rZwB/nI7vZVlpVx7+Zmoilv/2c2HJ61uqDG29Yj
         oimC+U6feqPLRrZQdjog8d+hqxWKH4Jg4qoP4DPyVxhbhzjrK3TfBCP3DJjnrWM92f3I
         yU9w==
X-Gm-Message-State: AFqh2krEJCVDsWDtH0octqODq8KkV1NCQkNgkFs/EftOrM9MpCQ+8oxK
	oTgGSHGTCyOxWs7FKG29Tnvi0bYlwjJMv5CXp08=
X-Google-Smtp-Source: AMrXdXsLMYPqLhtdtT6Nnxa6HEb/srLpX8U1HgO1HgmP5TbWAGz0q/SXP281M4tT3eWeteA/IZVwXQ==
X-Received: by 2002:a17:902:848d:b0:189:5f5c:da1d with SMTP id c13-20020a170902848d00b001895f5cda1dmr38203132plo.18.1672594996968;
        Sun, 01 Jan 2023 09:43:16 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id c4-20020a170902d48400b001894881842dsm18467004plg.151.2023.01.01.09.43.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:43:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/18] lib/buildstats: fix parsing of trees with reduced_proc_pressure directories
Date: Sun,  1 Jan 2023 07:42:31 -1000
Message-Id: <57ed38d7164165eecec19f85c08399b9b20928bc.1672594796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594796.git.steve@sakoman.com>
References: <cover.1672594796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175233

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



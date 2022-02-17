Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A99C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 20:24:53 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web09.2069.1645129492738361050
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 12:24:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BdhA5Ti6;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id p15so9923649ejc.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 12:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xVTHx/yAkp4sPcI33DEDjuKa91Y2/oT0Ez4Pmsa8o+k=;
        b=BdhA5Ti6bB0GI1yc4m/pUEmBVMHAjMQ4i4AQ8HYbJbOTKuAyYU4uxp58T5MaM/1O82
         5W9ZxUt0Txbe2uaj2FlXZe22063d9bO3DshZUO/oy4hcAV0U15Y92wIKeTef8L5OdNLG
         IOudYqJGrPKtryq0LCjOYB4Dk7D7wMvkyRjc098Jq1rfCjaIqD/ZVdsgct9iImtqah1p
         0c3w97456cUAhVRR7O8aYsZE9ZkxuiW5YEyUGjrb8eXcIGkpR4uFW0fCZFVJU/J6MePa
         kzwm/0Bkgpfp52fFWOCwvU20231qrJGzn7kdgA0Jxb2SWGBOFNa1KrVbbcYB12N/OGIr
         fryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xVTHx/yAkp4sPcI33DEDjuKa91Y2/oT0Ez4Pmsa8o+k=;
        b=E7tcXIQttqIXEqzW2lspAg27LYAyaurCkJSeOIeJ+b7JbX6is3KM4HBuY9loGJusuV
         raAdxnWhF0ekjlosZF7TLjLq/4sxQ9LpfNkqbwvMXzlnqX8/ORphJYU+YZY6gPPLj7nc
         BrFtKnBh8fKVS9rWBQoyNpm1Ag3Uk4HoVxywtGNPfIY71Tjr/0yv7tWYevuL6tcj/dbj
         lGrlHF69qZ+Dko5wLArHWyxSRryGTpAwMJHAkCL7X5plUqSstqaK6nbs07AKbaYUhixw
         WDcvXN9kHJbJvBFtruwTAvmR6l0QMaL7wzKZV1HQJ2w1dT3uoaZz82xGdNqYckSbFltM
         Wzpg==
X-Gm-Message-State: AOAM532U36lQty+4t9NxbBme7E++bt7SWgzxg1l/3/mW1jgc0K8r1i0l
	FNf6PGCcuZIiAYkSQFYtISLt5QdcrPM=
X-Google-Smtp-Source: 
 ABdhPJzI7Rs4zucP/JTy7gV6HviHpumdVvcbQ4O2rLH2fX9vIRIf0dvEg6YFXULWIcqfal23l6EtbA==
X-Received: by 2002:a17:906:3fc3:b0:6ce:3eda:95a4 with SMTP id
 k3-20020a1709063fc300b006ce3eda95a4mr3734567ejj.271.1645129491134;
        Thu, 17 Feb 2022 12:24:51 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 b6sm1515239ejb.80.2022.02.17.12.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 12:24:50 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] devtool: explicitly set main or master branches in upgrades
 when available
Date: Thu, 17 Feb 2022 21:24:39 +0100
Message-Id: <20220217202439.1956125-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 20:24:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161861

In particular this resolves devtool's inability to pick a branch
when the same tagged commit is avaiable in main and in a release maintenance
branch.

Thanks to Peter Kjellerstedt for the suggestion.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/lib/devtool/upgrade.py | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 826a3f955f..0357ec07bf 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -192,14 +192,15 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
             get_branch = [x.strip() for x in check_branch.splitlines()]
             # Remove HEAD reference point and drop remote prefix
             get_branch = [x.split('/', 1)[1] for x in get_branch if not x.startswith('origin/HEAD')]
-            if 'master' in get_branch:
-                # If it is master, we do not need to append 'branch=master' as this is default.
-                # Even with the case where get_branch has multiple objects, if 'master' is one
-                # of them, we should default take from 'master'
-                srcbranch = ''
-            elif len(get_branch) == 1:
-                # If 'master' isn't in get_branch and get_branch contains only ONE object, then store result into 'srcbranch'
+            if len(get_branch) == 1:
+                # If srcrev is on only ONE branch, then use that branch
                 srcbranch = get_branch[0]
+            elif 'main' in get_branch:
+                # If srcrev is on multiple branches, then choose 'main' if it is one of them
+                srcbranch = 'main'
+            elif 'master' in get_branch:
+                # Otherwise choose 'master' if it is one of the branches
+                srcbranch = 'master'
             else:
                 # If get_branch contains more than one objects, then display error and exit.
                 mbrch = '\n  ' + '\n  '.join(get_branch)
-- 
2.20.1



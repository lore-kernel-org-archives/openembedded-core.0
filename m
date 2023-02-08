Return-Path: <mateuszmar2@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F84C636D4
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 23:51:27 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.1442.1675900281342782456
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Feb 2023 15:51:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HnnaUM6Q;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: mateuszmar2@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id u22so1604154ejj.10
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 15:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eje98vDQxESf9dH6wBHu/SPqb5eA8q2Z9A8NBH6YvZE=;
        b=HnnaUM6Qf185cjamUfiANardDtLKFqvtMSCdwnRq1nmF/cVFtPfLIJzDEmwVctd2Wl
         Vl9h6PbQzUvFcXZOlYfalZk/bfMC0Ry4h/uvZicncBoUuB4fExLsy10kXMrCoHXTq3g+
         ecU/wnS0AcI6+ZxpsmTur7yJ55PpZQXSOZ8HkNW0VZIb9FhtU9i6hIfC/WST4j+Eb+5D
         NSwcPg/jOfS6VQBJZiRH4+GpkxOlru9wEWWxI/cRybR1CTorU1KyLq0wpYjFjugyGbUI
         ExNcOG6u+6OLS2VarJVlwi9Uz5rQfHsROByyef1aF0chAcTd1iNooBjTq6tEMJEY/gTH
         xLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eje98vDQxESf9dH6wBHu/SPqb5eA8q2Z9A8NBH6YvZE=;
        b=8CPEMHI937Uhubabqsm8mgZEUz/XsNhO21/wKI3lCPE8KV71bHvN3vBddGgdx+tQuv
         MjeDWRUA1/UAnfVJiMaLf4x9TrNItR8jnXMjQHf3zNgQ2n1hyeICP16jbhXX/nM/y+Am
         pFUlM9qdXHmDXmvdAKijO9dJ/l/9oGyOIPLdbu6VEtABse3eh1xnwTbySffswwrfXEoF
         XigWTzy4oaeYTIJgdqdzNdCdNN2SlSPKiQrqHtmBwy5kqnti2H1j3K30h7assZwfK5r2
         CtFJyiGxmWsDyzIOqnTPnN8qETQ/0iz4X1pyK0wh6r+Ym+La8uNqcDadeiYxYZIogSAp
         JT8A==
X-Gm-Message-State: AO0yUKWCLL8QpJvr8lJDbDRDec2b3cC4p/YQ15zdFsPtNin5o3HnABlp
	gw3jYFCYDCiLxI8FQX7FfcfZhc8z+Zg=
X-Google-Smtp-Source: AK7set+aVn4K0IYUb9KpcAkKc7tI3KF7cjq2WJrAfyvhh0kbu6nDNL45gHhhqVhXbDtOilbR3d0kfg==
X-Received: by 2002:a17:907:9709:b0:888:1613:49d4 with SMTP id jg9-20020a170907970900b00888161349d4mr12861254ejc.0.1675900279411;
        Wed, 08 Feb 2023 15:51:19 -0800 (PST)
Received: from mateusz-gf75thin8rd.NAT.wroclaw_krzyki.vectranet.pl (178235146058.dynamic-3-poz-k-0-0-0.vectranet.pl. [178.235.146.58])
        by smtp.gmail.com with ESMTPSA id ci4-20020a170906c34400b0087873afb1b4sm113772ejb.41.2023.02.08.15.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 15:51:18 -0800 (PST)
From: mateuszmar2@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Mateusz Marciniec <mateuszmar2@gmail.com>,
	Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [OE-core][PATCH] sstatesig: Improve output hash calculation
Date: Thu,  9 Feb 2023 00:50:11 +0100
Message-Id: <20230208235011.40486-1-mateuszmar2@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 23:51:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176914

From: Mateusz Marciniec <mateuszmar2@gmail.com>

Symbolic links to the files are included during the output hash
calculation but symlinks to the directories are missed.
So if the new symlink to a directory was the only change made,
then the output hash won't change,
and the Hash Equivalence server may change unihash.
In the next run bitbake may use an older package from sstate-cache.

To fix this followlinks=True flag could be set for os.walk
but it can lead to infinite recursion if link points
to a parent directory of itself.
Also, all files from a directory to which symlink points
would be included in depsig file.
Therefore another solution was applied, I added code that will loop
through directories and process those that are symlinks.

Signed-off-by: Mateusz Marciniec <mateuszmar2@gmail.com>
Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/lib/oe/sstatesig.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index f0224454c9..a5bc030f58 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -652,6 +652,11 @@ def OEOuthashBasic(path, sigfile, task, d):
                 if f == 'fixmepath':
                     continue
                 process(os.path.join(root, f))
+
+            for d in dirs:
+                if not os.path.islink(os.path.join(root, d)):
+                    continue
+                process(os.path.join(root, d))
     finally:
         os.chdir(prev_dir)
 
-- 
2.39.1



Return-Path: <mateuszmar2@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211B4C05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 23:19:56 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.9501.1676071185730174428
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Feb 2023 15:19:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f5gDDh0t;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: mateuszmar2@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id c26so14846103ejz.10
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 15:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=14aplbWQeiPxqakperjbJDRwWyh2XB17ISktDt+dpsg=;
        b=f5gDDh0teLCwmB+LrOZvNW2h4VTWtp47D7t0Z5NQDbdbkOhjq4ozTKyQeBzl2l82ML
         GglrchHR/PRJLqZi4Naf4k9CJjfDhHUYYJ9W5zn+RN4BD/DjrvPS6EHVfxoeu/1Jz09R
         iLEFLj2LaYp2Lc8K8GsHjp7Tn2Y/4MV7S6nrLFO2WbFU9JFFwGhJKV/jVpcekn7Hljw9
         KGW1k0BZaB5jRaJyAxbwZ5iES/DriQvbl3WuzqXshJm9OnyMmLvTnqKFitxMKIBrY1DF
         l1B61xFLNOpGyHwHJ2tcZQ+c4he2wDRfo/iGhXa95fesT4hglKCFZ1MrB2BIxYIBVJ8p
         3L0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=14aplbWQeiPxqakperjbJDRwWyh2XB17ISktDt+dpsg=;
        b=kMmvk4nFGeGsGwLivxAqO7/6FsDtkLwyJUr1JC42EW8Rfa2QqwjzwZ1N0mVFnbKps1
         Yo+4Z+HqZnpPOGCBoYFb+3aJQf7agu5uy7QD4k8nGfrVNwd96E93Yz3BoxhI4skBZY/8
         FEBefKaTg/gm6dTukuumKof4n5zmm+HBVzPpX3KcKiSbOFqU/UPKtgresYjYmFDHS3Em
         KCkccZMemclIGjgKAjVWsLsSK9EXKpQzpUG7iqfnVqyelts/XfH0CRdi/WXUijHx+p4z
         8UPYt6iJpXaPD+QQ9hWcUBIdfZ6Pvn5B+fVwLm6qOPC+aBgKlNKbHQGTu7ag1wQTz/WD
         XVng==
X-Gm-Message-State: AO0yUKVIdTzAE0eIe/W8sj74AXcPlYJx5f3YExmhZVAHu4mRSb2utkTx
	wTL2Q0SmQJTHYJRMH/eJPI9CYsbPedlDUQ==
X-Google-Smtp-Source: AK7set/f2bIYMXEv/Kl9zqZOn+At40cc7ilzYiVS/dx1DMKmvE4OjOBCtEHL3wktzfgcrsGVysktlA==
X-Received: by 2002:a17:906:fa02:b0:88d:d304:3433 with SMTP id lo2-20020a170906fa0200b0088dd3043433mr15122618ejb.67.1676071183775;
        Fri, 10 Feb 2023 15:19:43 -0800 (PST)
Received: from mateusz-gf75thin8rd.NAT.wroclaw_krzyki.vectranet.pl (178235146058.dynamic-3-poz-k-0-0-0.vectranet.pl. [178.235.146.58])
        by smtp.gmail.com with ESMTPSA id y25-20020a1709064b1900b008b05b21e8aesm16223eju.172.2023.02.10.15.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 15:19:43 -0800 (PST)
From: mateuszmar2@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Mateusz Marciniec <mateuszmar2@gmail.com>,
	Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [OE-core][PATCH v3] sstatesig: Improve output hash calculation
Date: Sat, 11 Feb 2023 00:18:34 +0100
Message-Id: <20230210231834.161101-1-mateuszmar2@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 23:19:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176999

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
 meta/lib/oe/sstatesig.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index f0224454c9..ae7ef14453 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -652,6 +652,10 @@ def OEOuthashBasic(path, sigfile, task, d):
                 if f == 'fixmepath':
                     continue
                 process(os.path.join(root, f))
+
+            for dir in dirs:
+                if os.path.islink(os.path.join(root, dir)):
+                    process(os.path.join(root, dir))
     finally:
         os.chdir(prev_dir)
 
-- 
2.39.1



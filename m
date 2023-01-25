Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34CB6C61D9D
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 14:42:47 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.46712.1674657740409012310
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 06:42:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=7lzHhGle;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id 200so13553392pfx.7
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 06:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEoxtM+DdNEbqLV2r2OZpnUDzIT/junHs1NigHp0pFI=;
        b=7lzHhGle3XXJBkiF0yRjQG0UcYKPh3tz+831+ASdZzUOwc6FVemPM+ZMomJXdV+Tra
         BKLNwJJWqNqMlvW3t/uFKWW+nVuv/LVMIYn39bTf8d5B5fyzoKJmcyIjgDKomJhW4mJ5
         K3qG/PIOuCt8HpIZk5gTSf9U63d2x14JZY68G6QoSeYCDER+wFPRUuIZDNuQEhfuV/ie
         cn6/t3C1rNFpjMEYnnAM66/RXBQfoWZBLutp+GhoqCbLI8jc3azVeUu77OOE3alMI4/0
         ZEqmruTolNO2prqhSuUYPgoInQoLn90Q7oVSlzIJXzcKpI1y/IeoxIzFuSwp7E8yDPBv
         njQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zEoxtM+DdNEbqLV2r2OZpnUDzIT/junHs1NigHp0pFI=;
        b=wCno/nCT1dpFRE9KN7y/TEP4V9iliMAXovgFrRf5q9GOCqceSXLNrjcPxb2WROkcsz
         21aJj6OqiaBYW6rZhpBiJLIxJPfJ5bkkdrTC00KBvUqvSh7s4/cKmCXmAsDblQSdVwmm
         v28A/N+VrBFB2s96242ut8HU8qydzzQdKT3kYB+9hqXQDntJN7VuOaVY6cek7D0CSt11
         5xSGVrDfVg+CHQWryoj2zHhcidHnl6lOMa8fPZR7HvtJ4JWnnO76wbJ2g8Lsql/dSdJs
         awUo4MxCHGYtk7Wq/nEdJP+EMcvn6u/7q1VgvmNpwo15KjjuKNORo+LfmRBUSb0o5/t5
         uZLw==
X-Gm-Message-State: AO0yUKVM7tkCvK/CAPi+dvK9ug3qv0azM6LYYhjCkunG+Wg1XmCF3uvC
	SeLFUJHkvUi5susWXwI6BCHTwX2Rj2FMd7EKeC0=
X-Google-Smtp-Source: AK7set9xoVbv6b5G+QCWDR+pdiDL7pPm0GNeYi3zyBuTs+im5PKI5nXy4rbVetEc+jSot+X88Kx3Sw==
X-Received: by 2002:a05:6a00:1942:b0:590:64f1:8873 with SMTP id s2-20020a056a00194200b0059064f18873mr1791696pfk.5.1674657756687;
        Wed, 25 Jan 2023 06:42:36 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d2-20020aa78142000000b005810c4286d6sm3723703pfn.0.2023.01.25.06.42.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:42:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/16] lib/oe/reproducible: Use git log without gpg signature
Date: Wed, 25 Jan 2023 04:41:57 -1000
Message-Id: <76272a00cb16b22f7dd942592cdc37ec3439b234.1674657501.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674657501.git.steve@sakoman.com>
References: <cover.1674657501.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 14:42:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176365

From: Benoît Mauduit <bmauduit@beneth.fr>

Previously, if "showSignature" is present in user gitconfig, parsing
of the timestamp will fail.

Ideally we should replace this command with a git plumbing command.

Signed-off-by: Benoît Mauduit <bmauduit@beneth.fr>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 3bd6f78f79b3d3e87d8db1e11f58d8021f929843)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/reproducible.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index 0938e4cb39..1ed79b18ca 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -62,7 +62,8 @@ def get_source_date_epoch_from_git(d, sourcedir):
         return None
 
     bb.debug(1, "git repository: %s" % gitpath)
-    p = subprocess.run(['git', '--git-dir', gitpath, 'log', '-1', '--pretty=%ct'], check=True, stdout=subprocess.PIPE)
+    p = subprocess.run(['git', '-c', 'log.showSignature=false', '--git-dir', gitpath, 'log', '-1', '--pretty=%ct'],
+                       check=True, stdout=subprocess.PIPE)
     return int(p.stdout.decode('utf-8'))
 
 def get_source_date_epoch_from_youngest_file(d, sourcedir):
-- 
2.25.1



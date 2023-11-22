Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F03C61DF6
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:45:28 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.18527.1700657121658054104
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 04:45:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JdGs/1M2;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a02d12a2444so221728266b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 04:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700657120; x=1701261920; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EClhXYBp3Mwo3FIl2rDYyu5lmiKrjJ1XWTabrQxTO4Q=;
        b=JdGs/1M2JY1w5Ywj0JzwuMG2SbYdu3S5wqnuWRs4SsrA3+g1Vw5EDfGq3EOa/OAGyU
         2Lqg9azFi2+uIBUrLxaU4NSqMzEsuI2tFg3KGquKbRA9xKMzvTdVw2zRJ3EWg4toqmUR
         PR2TZY7fiY9k8BJHvm/dhJfJtNzFLfDQMTrbySg/RllCNwOu8t//QJZcsZ1pfP7+U3pU
         1fpLn3fz8349ScRoSOncchOMR0HunIyMbRTE0Czn/Iokgt8v63krTMj5lUP7VLLljCoP
         2lFs+rjWy/0KdjLo1pWnUNvcYmb3O/GmTQCHchP4ET6BM7S+J8jwQmz/L4LOFlHsl12J
         dACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700657120; x=1701261920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EClhXYBp3Mwo3FIl2rDYyu5lmiKrjJ1XWTabrQxTO4Q=;
        b=ZCzNTYz10pT9BwCJQC9SndJfYHNnMIsVtbCyEfVy7h3Gmc53ff0Ej/YFxGzwlw7xLG
         EXYHG9Zk8AmMWuQHkhdT7EzpTHwNwnZpZU6qsqXBmrU1NO+3fApu36zeAFVt4Nmpg6bS
         42GcjrD1uXBHP4+zNYKW0i9gQ3ZBW22H5oLgdmt5WgJf/Lxa13cCzgzgeCcrpAWyK7GS
         XclQhsxzbLQ621cgFZdRbxm8wv9d7Cr9Nt4JSXVQFVyd13fyU6+HHujSKdl8xzqNVLWr
         2svml5gGB468WKhGndp7pBd2mHbJwjoRzEaIeaavyfBd1YNdsgsuoJje+IW/BAWS98DV
         7s/g==
X-Gm-Message-State: AOJu0Yyp7vhf50KaCYTw8eoMLl3jhxc/wIYd7/ZGvKtoWVyZA0eXz08i
	6xrZ3cHa7N6RJT8BDMrOJtKqqfLWtiQ=
X-Google-Smtp-Source: AGHT+IE5AQMzLBWa4zjVf54kbaFUfaHwfY8Z6UwEEnCaii+vbh/0YGO2jpC/K5kHSVtMdoCYaLWx9w==
X-Received: by 2002:a17:907:9382:b0:9e5:2710:6ba with SMTP id cm2-20020a170907938200b009e5271006bamr1303801ejc.70.1700657119865;
        Wed, 22 Nov 2023 04:45:19 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id k23-20020a1709063fd700b009e689685196sm6609900ejj.142.2023.11.22.04.45.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 04:45:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/21] oeqa: imagefeatures: append -dbg suffix at the end of IMAGE_NAME not IMAGE_LINK_NAME
Date: Wed, 22 Nov 2023 13:44:45 +0100
Message-ID: <b83eab78fae8f7cff5fbc3c2d00c3a831e9b3ef4.1700600804.git.martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1700600804.git.martin.jansa@gmail.com>
References: <cover.1700600804.git.martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 12:45:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191092

* the filename is constructed as:
  meta/classes-recipe/image.bbclass:    d.appendVar('IMAGE_NAME','-dbg')
  and IMAGE_LINK_NAME adds ${IMAGE_VERSION_SUFFIX} _after_ this

[YOCTO #12937]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index dc88c222bd..da510f0e8e 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -288,9 +288,9 @@ SKIP_RECIPE[busybox] = "Don't build this"
         self.write_config(features)
 
         bitbake(image)
-        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'], image)
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_NAME'], image)
 
-        dbg_tar_file = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s-dbg.%s" % (bb_vars['IMAGE_LINK_NAME'], image_fstypes_debugfs))
+        dbg_tar_file = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s-dbg.%s" % (bb_vars['IMAGE_NAME'], image_fstypes_debugfs))
         self.assertTrue(os.path.exists(dbg_tar_file), 'debug filesystem not generated at %s' % dbg_tar_file)
         result = runCmd('cd %s; tar xvf %s' % (bb_vars['DEPLOY_DIR_IMAGE'], dbg_tar_file))
         self.assertEqual(result.status, 0, msg='Failed to extract %s: %s' % (dbg_tar_file, result.output))
-- 
2.43.0



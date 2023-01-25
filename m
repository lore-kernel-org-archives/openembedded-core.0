Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3467EC54EAA
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 14:42:47 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.46705.1674657734301697325
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 06:42:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=2bmU4Lwm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id c26so13549202pfp.10
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 06:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OWB/7vFiM+PggXop25Qk6A3cSApST0HCf+YjOHXV+VI=;
        b=2bmU4LwmR9MIfUBIx2jDo0dUVTE89Jof3rJTRqOYnbG6HSMHvNtiBSG8ITMtQtXtHe
         XivYvjZEP9PNWidsH6DgD+SNZQ0cz/sU5mfJJLHp0gt+K6ejPNkiHb6mn0msSSi2NO8z
         foyVUv+P5hKdgfqd1E2iRtOqR4p8i3vON4Dsfct4tc/uvm3pVT1pNdQzdd0xIMq2MESD
         XbGMayoKn3e13mx5bRz8pmMNdpfOdSIbzY1QvBf1kG/rH9BJGdCgTMyR0WwkLAaNfGtq
         84zfAsJDIVfrBhWtYkWvt+4sQT+PPsf4PGw6RT3yCwGCQYwx/CzAobRPbcusm0eLg3oV
         cZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OWB/7vFiM+PggXop25Qk6A3cSApST0HCf+YjOHXV+VI=;
        b=47lANZEMCdyXQVTkvmNqCRFLdg+GvqkmNud2WlDA8/PhtJ3ciia+UtiKlY7qA5foME
         PFmXcG/dmyGD+va2E00++Lah3MvkEX2b7zIwJJT7eVbo5ENnxvvqIqvG7tMyi9zwssv5
         18YzntUTT3Z4IJkiNtnLcf9zNP010VYpQrnGMJhZqmwAP+v2zxTEBgHrH+TWqoZlbfgn
         r0YYNNqqYAMNUBzIbKeePm3zuf4sdTPmzbkQ8ixzE6YyJAxJqD5dF2Yl7fueEk4hqMd5
         xSQaRwnYoyd/R/CkuNHDfEHFLj/A4WAGAs25sFrGBc9PRhoB6q/UbVwR9MR147cDMmCr
         nVdg==
X-Gm-Message-State: AFqh2koZ5RMaaeWuvUSNn9d6fBKxoQRICMCl1X53RlKuGRpJZ9Y3+KsO
	elCNlWrIoapl4fTwN5NGbBBRUHiBlwFWlOj3cxs=
X-Google-Smtp-Source: AMrXdXvtBLAG+RoKW8eFSwwYCUxfgpAYI7VTKQCX7Wa0sWbyFFdb/asRQ4pDWT5AYf+TyytYo2jndQ==
X-Received: by 2002:a05:6a00:2a04:b0:575:fd73:fc94 with SMTP id ce4-20020a056a002a0400b00575fd73fc94mr36151115pfb.23.1674657760929;
        Wed, 25 Jan 2023 06:42:40 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d2-20020aa78142000000b005810c4286d6sm3723703pfn.0.2023.01.25.06.42.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:42:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/16] python3: fix packaging of Windows distutils installer stubs
Date: Wed, 25 Jan 2023 04:41:59 -1000
Message-Id: <951b511b05d59867433c0c8e40162322a75be10a.1674657501.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674657501.git.steve@sakoman.com>
References: <cover.1674657501.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 14:42:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176367

The python3 Windows distutils installer stubs were split into a separate package
in poky commit dc1ab6482cfb30c714e7cbb421920943439a3fd6. This has regressed
during the upgrade to Python 3.8.2 in yocto-3.1

[YOCTO #13889]

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13889

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 3bcc9b8662..0e87f91dd8 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -531,7 +531,9 @@
         "rdepends": [
             "core"
         ],
-        "files": [],
+        "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/distutils/command/wininst-*.exe"
+        ],
         "cached": []
     },
     "distutils": {
-- 
2.25.1



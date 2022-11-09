Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 356CDC43219
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 20:21:30 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.2167.1668025281396467004
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 12:21:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G6jVgytQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id a14so27614072wru.5
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 12:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=60PZmhRwxsxsvjtukroFkqf5OvXSoqM/GHb0R1bueHo=;
        b=G6jVgytQ6I8gOGDiznf2qvRHKjKX9D5CKaBmbSSK+cAoKFAQDBTL3yxKZ1APefllWR
         TO8/GsyO8ncosWbsIrXdN66HNERlE8iWlyJVnqlKkr1H4qDf85Qgzf6+wwb5Ot6Aw44h
         RkCy7asY90vBgI9Wblhx71QTLRKWebZh7eccDo7UqS6zVBqp1PI7XXvML3qDh0eI/nZu
         3UjdUq0OjChs3BxHQoOiju8hKu+JSrONS4DUU1t2agF7TeA6RsC/lpOiYp70EyetRFpa
         Wmiorbe0Tv9ie/cXWLDHubeZLngMAWozbsaQfIrJAKZCeVG17oZxn4RnjmScYC2iHIOW
         RzuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60PZmhRwxsxsvjtukroFkqf5OvXSoqM/GHb0R1bueHo=;
        b=8I/tucqqBcJu8Uxp9ZcY4ulxxr2dGHEXZdvM4J+YPW3ofQTYmnsjOk+pAKs95OZDG1
         Udd63V2yZd7IzNhxUv0WlWrZw2eKR+6BJVMje1xJicYGC3MWdRY0jTQ8t+USD+UVBsGx
         x/Gp8YlqiUhf5X1sonomVnQOTtBxXzGHI8GRoS6jMSfQxqtDdq1z4A9TVy5MNzvDRwYl
         AwAtQVTKXuOu+wfDYCfeI0UU+TXqkYH3fsL+uVcdISNUydBZN7tz4da0KDZahgwB5Q+R
         DmKVk2HnFI6PpCsXaHL2sRwZzcDQ+3gGjHGSuSSTnBqI3oXbZ+Ufpj474FUhqySQfBsx
         Kf3Q==
X-Gm-Message-State: ACrzQf1ZCcImYKAPPteBsweo2sj6guwtgJ/zpNdzM9NscnBh6tSaOMvH
	oR4izrHtyRcvso0na8ljWQDbKWXJGOw=
X-Google-Smtp-Source: AMsMyM5i2toHcX5ivdwmPRM9XuF9WQRIrBkv46pWKyHHpRK965q3KY3g9pIAlJH4P+fNOktRX/A2iA==
X-Received: by 2002:a5d:6dca:0:b0:22c:c6f9:57d2 with SMTP id d10-20020a5d6dca000000b0022cc6f957d2mr39768770wrz.474.1668025279641;
        Wed, 09 Nov 2022 12:21:19 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m3-20020a05600c3b0300b003b4ff30e566sm4168055wms.3.2022.11.09.12.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 12:21:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 1/5] python3: correctly adjust include paths in sysconfigdata
Date: Wed,  9 Nov 2022 21:21:08 +0100
Message-Id: <20221109202112.2035727-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 20:21:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173051

This was replacing /usr/include regardless of whether it
was at the beginning of the full path (correct, when building target
python3), or in the middle of it (not correct, when building
native or nativesdk python).

Through various reasons we haven't been bitten by this until now,
but latest setuptools does expose the problem with for example
nativesdk-python3-cffi and nativesdk-python3-cryptography which both
fail without this fix.

I am not aware of anything using INCLDIRSTOMAKE, and it is harder
to adjust correctly due to the value being a list; if something
is using it, we can look at it specifically.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3_3.11.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.11.0.bb b/meta/recipes-devtools/python/python3_3.11.0.bb
index 6b6c983abf..92a1f69320 100644
--- a/meta/recipes-devtools/python/python3_3.11.0.bb
+++ b/meta/recipes-devtools/python/python3_3.11.0.bb
@@ -186,8 +186,8 @@ do_install:append() {
                 -e "s,^ 'LIBDIR'.*, 'LIBDIR': '${STAGING_LIBDIR}'\,,g" \
                 -e "s,^ 'INCLUDEDIR'.*, 'INCLUDEDIR': '${STAGING_INCDIR}'\,,g" \
                 -e "s,^ 'CONFINCLUDEDIR'.*, 'CONFINCLUDEDIR': '${STAGING_INCDIR}'\,,g" \
-                -e "/^ 'INCLDIRSTOMAKE'/{N; s,/usr/include,${STAGING_INCDIR},g}" \
-                -e "/^ 'INCLUDEPY'/s,/usr/include,${STAGING_INCDIR},g" \
+                -e "s,^ 'INCLUDEPY'.*, 'INCLUDEPY': '${STAGING_INCDIR}/python${PYTHON_MAJMIN}'\,,g" \
+                -e "s,^ 'CONFINCLUDEPY'.*, 'CONFINCLUDEPY': '${STAGING_INCDIR}/python${PYTHON_MAJMIN}'\,,g" \
                 -e "s,${B},/build/path/unavailable/,g" \
                 $sysconfigfile
         cp $sysconfigfile ${D}${libdir}/python-sysconfigdata/_sysconfigdata.py
-- 
2.30.2



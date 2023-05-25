Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26271C77B7A
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 14:57:10 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.11493.1685020968135580248
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 06:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@snap.com header.s=google header.b=AlKnzb/r;
 spf=pass (domain: snapchat.com, ip: 209.85.128.49, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f606912ebaso6316205e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 06:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1685020966; x=1687612966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=boK4AYkCGQ7sQL3dLo5OUkrX3AfJKm4F+YrozMzMMIE=;
        b=AlKnzb/rMiB42cBiJBZB5oIKyeNJ1jqjfMRjCtWz1XH91sNWmUyUxN0rb493hINovx
         tOrUPfCWm7Ruvw7dhtKIEs1NuyIK/ff88ptbmgbfrAGY+zS3atCeSWmTWy8B/7Jy2P53
         rovxnoMmJgZ6kUipVj+aWra1qMogVMESXTmfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685020966; x=1687612966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=boK4AYkCGQ7sQL3dLo5OUkrX3AfJKm4F+YrozMzMMIE=;
        b=c/cbgWzZmWSu7mw59IoSyHb5iLqCljzQThlBzPyabS6TpzbNJD4xKkss/EWeDL/wqC
         71jOMT6CCn5+E02ReaITePe3nmwsfVYkxNS3RLCpemnc4QsbAFHGOOdZVxxbfJJNoTPP
         kv+FoadvGvB8qaCjsWHY8DfHMUaaf0yhsDvAmqPe+ohdunrRY79cYMFmoZA2NUHoJ0PA
         VTD0WTeC+pF6mxMFAsOsVt8J5wHTAE2uolw6APerXWSv4T5CCNyrD46OikWWS26h6ZBy
         ynvmkCX7Bgqo2Br6l4BvGx2zCf51hY8d1e1nmuJXMCHLPLR40D/OiyKDtpBd0ACQlx0i
         4V2w==
X-Gm-Message-State: AC+VfDxodj+Gu2OzcdW2LlnUSLCMp/PidHvgOGUw/gIDuiQTztxASNUu
	8kcr5yiMz2OOr4UMFVdVsStCB/6O8ffHDJA/mI0=
X-Google-Smtp-Source: ACHHUZ4ZxnaORcQBeJK+MR57lNbgxUSvmYKCfNGpDOVtWQ6P+Mk+3/HYpTMLweq8TPflQkOloAku0g==
X-Received: by 2002:a7b:c7cc:0:b0:3f6:89a:94c8 with SMTP id z12-20020a7bc7cc000000b003f6089a94c8mr2008610wmk.24.1685020966099;
        Thu, 25 May 2023 06:22:46 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id 24-20020a05600c021800b003f080b2f9f4sm5693412wmi.27.2023.05.25.06.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 06:22:45 -0700 (PDT)
From: "Etienne Cordonnier" <ecordonnier@snap.com>
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] fix hard-coded .so file extension
Date: Thu, 25 May 2023 15:22:35 +0200
Message-Id: <20230525132235.1022441-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 14:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181712

From: Etienne Cordonnier <ecordonnier@snap.com>

E.g. Darwin uses .dylib instead.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-core/libxcrypt/libxcrypt.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 61b0381076..7b484d86bc 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -17,10 +17,10 @@ SRC_URI += "file://fix_cflags_handling.patch"
 
 PROVIDES = "virtual/crypt"
 
-FILES:${PN} = "${libdir}/libcrypt*.so.* \
-               ${libdir}/libcrypt-*.so \
-               ${libdir}/libowcrypt*.so.* \
-               ${libdir}/libowcrypt-*.so \
+FILES:${PN} = "${libdir}/libcrypt*${SOLIBS} \
+               ${libdir}/libcrypt-*${SOLIBSDEV} \
+               ${libdir}/libowcrypt*${SOLIBS} \
+               ${libdir}/libowcrypt-*${SOLIBSDEV} \
 "
 
 S = "${WORKDIR}/git"
-- 
2.36.1.vfs.0.0



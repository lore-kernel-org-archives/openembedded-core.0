Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B918EC433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 04:43:50 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.30209.1644813829338462821
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Feb 2022 20:43:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T/F/c3uc;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id c10so1592571pfv.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Feb 2022 20:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u17wCgBnYB9T1JxqomQqDkrCeAGf2yrFBRN4HpeRIyU=;
        b=T/F/c3uctKET/noZ2I+urbYwhoMiT/qORSzxahToc0Is9DJsgAIveJGh2ID7MTN6Py
         Wz1pB7IJlLa00u6lzbOSrpyzdlGr3x/jkgHxDo0i1zw/NWRDh0WMUN6gmbnY4t9TI3+c
         gZkyRBJhJsmqylwYgmfhdmSD/OIL/MHJ1xWzM+Sjav8VxoFgN727nQwpUpGJFDFw/UsV
         V+ueGrfGeJUmDFIBwgYYc3arr8V+xGaYuKIqJEEh+fmqGZ9oaKNNrycoDqdGZ0afhFFa
         PIfUhn6ssoQDldp0LjgyPoFuDo/p3OI2/W0QyP+KxqdQEV2BYQ6BPjxIHJax+KR2OVhV
         2lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u17wCgBnYB9T1JxqomQqDkrCeAGf2yrFBRN4HpeRIyU=;
        b=F2HMYF0LfDihyhNji41v6HQeZkPVqJ1uW/HS0hW4ZOZlXVfKvyJ16L59T2e1KQBKpO
         7385Bah+aYqXB6S0yPB0ewcFQLX/JJIX3zb0vkz3QCeNwv3ZSY++d42Z+tq1iMpsc3Xk
         AZ9JQ9aIfF0katOuj/Cbkr0IlYQITPOAKd/MYzyxg9zbEz4pAyjbINarPpAA8BGbBVey
         ltMX2jm7VlOmszwdIQQWcNXatOo47wIxeS/L06SLZwVQaPz9+cvDN9O3zqqILR9xChq+
         vLDEe+apPEm4XxBhIPrfWtKa8I5EUOQHmn5+FJvcwAZ7o/5WzcDFclGYxGLXzWf2VDxq
         xUag==
X-Gm-Message-State: AOAM533wSWZnag3l0chrFRIZ9HBwlr6MMRw5u82V4zZfh+VIN2XUTooV
	YifntmO03lTeZdvmmuqdirW2vMhbg+x4Zg==
X-Google-Smtp-Source: 
 ABdhPJydpQKj1uM1JSiXGRdpt5njtRwC+MqYTVo2qT21B6163KMYxTtuOdZdd/A3l1n0pFPYn2yVxg==
X-Received: by 2002:a63:d815:: with SMTP id
 b21mr10243440pgh.237.1644813828384;
        Sun, 13 Feb 2022 20:43:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 u16sm6164998pfk.220.2022.02.13.20.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Feb 2022 20:43:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] diffutils: Link with libbcrypt on mingw
Date: Sun, 13 Feb 2022 20:43:45 -0800
Message-Id: <20220214044345.13843-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 04:43:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161694

This ensures that symbol is found in the library which is providing it
in mingw runtime >= 9.0.0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/diffutils/diffutils_3.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/diffutils/diffutils_3.8.bb b/meta/recipes-extended/diffutils/diffutils_3.8.bb
index a6522967d47..12df1598e8a 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.8.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.8.bb
@@ -18,6 +18,7 @@ CFLAGS:mingw32 = " -DSA_RESTART=0"
 # Fix "Argument list too long" error when len(TMPDIR) = 410
 acpaths = "-I ./m4"
 
+EXTRA_OEMAKE:append:mingw32 = " LIBS='-lbcrypt'"
 inherit ptest
 
 RDEPENDS:${PN}-ptest += "make perl"
-- 
2.35.1



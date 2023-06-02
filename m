Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CC9C7EE2E
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 02:22:49 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.3379.1685672562755047695
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 19:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=YcAINkJ1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-652426346bbso644799b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 19:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685672562; x=1688264562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lEJkKN43c4CnyJ8IfM7JcrGTP64DBaua1C4NevSmKTI=;
        b=YcAINkJ1KCSj9gzenqoVxkl5k6xhYEV5C3JP/J3kGDE6xtLtCUEppWophc60yhGwQe
         /aFx+R8Ymc2v46m4X21/fDbicW5/ADqWoYj69PTD/u72qaDMObFMYumpqimyUrwEH0LD
         9I4Tixk357UKgDZjLq2LEb687+fvPg6pKRuyCi0wydT1LrK5XStiNIf+HNogNG0nMiCu
         uBWftgfYk4Gom/HipaqMBI1f3/JMn5fDO3M3raeLWFTnjGdd4G1sDLoMdY1q1f3ToGMg
         X7RU4nPNiV3r+bhva897DVx92o+nYxvZSWIwA9zGejDcUiBO/VQXQBp/KL1KQle7cJfd
         RQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685672562; x=1688264562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lEJkKN43c4CnyJ8IfM7JcrGTP64DBaua1C4NevSmKTI=;
        b=DH/kxygJGDwW6Blx4cFsYV7rNLJMS3GVmOP5JSrF0GQZjRc55UAVfCMzMHr5Ujkogp
         SNCuhB7Tt7cWaU0CyNpF8Mog1FdvgZHA6jcngCSPUuHuBDdlsPsesuZW/VQe0GCGj25L
         lNWvMjkvzbLAjQHxU+Hm2tSoHq8QL71LNJUgYWds3SZyEi5k7o7+wH0b/XVoq9QNgXD/
         Bt+VhdeiEbAKmbbViCAI+Bff5dyoMQeZ5XJ/xFNjB1Z427DYIDLS4UiDCPfkezgA1dgj
         C6pET2iSR8auWLprDXbDz5yrW0u4PzGCKRjApDhW3rRnUmLsbkohfUe3UmsqbLfMJXZU
         rc+w==
X-Gm-Message-State: AC+VfDwGohVmq1SqpA1DM+PqbZTN70UYkZb/MXAX/j//GGUvqpx17JNi
	mydaEklxpsrBRj6OrBKJyTBgFCQfPhcrtQ0VJ6I=
X-Google-Smtp-Source: ACHHUZ4X6gluTWnSQ+4/i/ro73qxQ5Jq6B9JeegWJWfMYvWWOGJW2zsH461NyZPwAnL+uiP3e4sR+Q==
X-Received: by 2002:a05:6a00:1888:b0:64d:68dc:b942 with SMTP id x8-20020a056a00188800b0064d68dcb942mr9834403pfh.7.1685672561821;
        Thu, 01 Jun 2023 19:22:41 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id z16-20020aa785d0000000b0064fc715b380sm5850234pfn.176.2023.06.01.19.22.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 19:22:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 11/13] qemurunner: avoid leaking server_socket
Date: Thu,  1 Jun 2023 16:22:10 -1000
Message-Id: <fb1de20b22119fd62b338ab69cd2b6a6c4e9dd8f.1685672395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685672395.git.steve@sakoman.com>
References: <cover.1685672395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 02:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182134

From: Mikko Rapeli <mikko.rapeli@linaro.org>

close() the server_socket before qemusock replaces
it.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit be7bbbeeb44158b181d1abc5a4d7871a9045fdd6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 6734cee48d..8bb35f5a8b 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -483,6 +483,7 @@ class QemuRunner:
 
                         decodedlog = self.decode_qemulog(bootlog)
                         if self.boot_patterns['search_reached_prompt'] in decodedlog:
+                            self.server_socket.close()
                             self.server_socket = qemusock
                             stopread = True
                             reachedlogin = True
-- 
2.34.1



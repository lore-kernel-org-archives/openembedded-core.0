Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF69FC3DA59
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 17:52:46 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.24399.1721411560696712370
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jul 2024 10:52:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wE4Yj2zD;
 spf=pass (domain: linaro.org, ip: 209.85.208.54, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-59589a9be92so1332081a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 10:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721411559; x=1722016359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QDZLd57rDjdxGMPlfD2DzTCUSaCgLUinX7umwHMHToI=;
        b=wE4Yj2zDcOfNZ+2DKqUePjS0grWl1SFsuqdlyAJXDbEgZX6xHKUb63m/ykDzz2xJNe
         jQjTIOxfm4kHfw25JX/Udi0EIiVijDKsM5ItFJf8QKxdqbFnuWWPt3VQKm0uZpTlHnOm
         xFWmqN8UQrs1UvdbhDhTardEgeHvigNQHR/875VSZBlvHdnkfn0huDtRhreKfIUaYu0O
         qVIPJyLIzQefjNe4ri4Ifi9JtfT5GBqpk0IxaIKBm7czoiJaerQRs/eYznR9lFM2qM9g
         e0OdruyyIS26hobvR5pE04/xV022Lzug+nCrAHyyFRrp48H/Fed1s8PfqM1UyvyElLu3
         f/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721411559; x=1722016359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QDZLd57rDjdxGMPlfD2DzTCUSaCgLUinX7umwHMHToI=;
        b=ccqAsjjYYz4H7C5Br4ESdS7U7cY/lZuSlsikv4FffSk2wlb4EYIhPkdeqeYgMCGdjN
         ugV41OjkGQp2VC31oMZDQIvNWAkCk1PcY6HD3Uz4skedXSjvyPxwxixeEZS/QMVeQDM9
         nbeIbcNUYKv2H+L+H3pZDC/Dk2F/MgqkqyfFGhH+SnVTnM6kzZvucw5YYAXRR/VUy3ue
         RP6cvufFs+9K1/ES/Xr4FdrPb1QKOfDAOQ8idyd/72DGu6VbNzzyBD+XkyW+ZeEF3qGq
         XOnNHJK62JXijighYhu21kgmTgWaujE+0TrgtyA+/t4qmNxbhjYEJY5tizfmNIGmouVm
         Pn8w==
X-Gm-Message-State: AOJu0YzFNSKZtwdU2m0xDveMmmM9sHHn4/hKAeor4Nn6KswR3R/vk8Tw
	8iZu7sn0NnQ9SXhFttxBbko6eDqCHAhoIKUb4GaxPslKdIvRBJtZ3ARsHkOp52lbj8xbiSXJMmP
	O
X-Google-Smtp-Source: AGHT+IFR4OsfHXgXc9RBPhXrQ8ytyShuQ39rkJBMZkRe+zUZJl2e7VUV30Rloq2MTEQxKBcK1CzBAQ==
X-Received: by 2002:a17:906:3b14:b0:a72:7f22:5f9e with SMTP id a640c23a62f3a-a7a01349bc5mr550632666b.57.1721411558903;
        Fri, 19 Jul 2024 10:52:38 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a3c92308dsm59278266b.170.2024.07.19.10.52.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 10:52:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lib/spdx30_tasks: improve error message
Date: Fri, 19 Jul 2024 20:52:37 +0300
Message-Id: <20240719175237.867713-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 17:52:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202270

Improve 'unknown status' error message by including the CVE id and by
quoting status field. Otherwise it might be troublesome to understand
messages like 'do_create_spdx: Unknown CVE status ' (the status was
empty).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/lib/oe/spdx30_tasks.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 59fd87507444..7baa6be70e3d 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -688,7 +688,7 @@ def create_spdx(d):
                         else:
                             bb.fatal(f"Unknown detail '{detail}' for ignored {cve}")
                     else:
-                        bb.fatal(f"Unknown CVE status {status}")
+                        bb.fatal(f"Unknown {cve} status '{status}'")
 
             if all_cves:
                 pkg_objset.new_relationship(
-- 
2.39.2



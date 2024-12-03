Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DD2E77168
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 22:38:58 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.811.1733265537013276330
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 14:38:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fk9hp5/f;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-29e70c9dc72so1576972fac.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 14:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733265536; x=1733870336; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sMV/3KPfcjx9bO7j5Zo47LCTesPZEABocpxqcD7Dus=;
        b=fk9hp5/fFgmmuIjgVRkfQ7JWlh6DKMQJJGsGi72dm/P+fUESNgSAuxHOA7aI6GsLtC
         /sPveLoadf6dT9xSQv1TQCwYJ4GyNW2Wl9J1rWg557Z/vY5lMrADrkdL2ZOQbmsuAiC3
         73FfolCfZes3bzuUkQAiMyegKuHEGnyXuT+As/36PyimIjIa9F06B3zqGDQ617Azf2x1
         ACu2AJzUYH1iNaJM5NHm1SdrQKQAJuh8b21XKknYpRfAi8rHbLcRo/s73KnKzOFMmzd+
         yMsU2ojv4UZDu7NdmqUvzj603rNy0OvOfz6r3cXHj9fHLVcJ1gK8fYsRNUgnNcj217k1
         Wgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733265536; x=1733870336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7sMV/3KPfcjx9bO7j5Zo47LCTesPZEABocpxqcD7Dus=;
        b=PApv4bv3ZzbRabYXw8ZUtumb5QszuTSF4lNZdsleWPu17m+Y05YuM76F6hiWLclrH0
         P6MObhMB3hSba/Vfm38OJJTREHzKa1R7rPDHo9M4HLu+dpDypqekU6mxm32phfyr2rpN
         C7lsQyEoVLXFsygOKox53+RAtF/Q788MFndwtqSp3xFqj2tTxiAZjfp1Yxra6e4jn06p
         TD4aMtu3GFeRMDlstUuHdmSQL13XnnrgUG9Fn0lYMKp6GS03ZLP/Ts8uh0+UwHb5SOU/
         XtjVKVYjEYIsLLbf9OyX+I8DA3yz15I3TpZOQxF4r0UhY0Uy689zzt8ZvzRwv6KzabPg
         85qw==
X-Gm-Message-State: AOJu0Yzi/WnLrpTsI8xfa3ChsTCmmQ6xQkb135FvYz9fPXiPRgKHXpPX
	oUx43iqH89Io2h0H84+ndKWPVHBxGuu8Nd3LNgcuWrm4iRWf73vYhaVSbg==
X-Gm-Gg: ASbGncsS9eCvbvVtJE9dLMmVtyE3HZVkkgl62if7M/Kdf32mXrOgloR0FdCgMx6a3in
	J1XGWmFAdLhis84wqwTngdGJLIr+dJdAgaOL+zAnMtrc9JdJCswE33etSjAVrwABNSls/17OXhc
	qm+7OXPh85qnkgLL+CDGPnHzxyi3fTNVB4HIrPTsiQSqQ63rauOId4qfP90V1bDdWqJOluFxNn6
	2p6HbG/ERfKOGDGMZhXnMBrHKESrtLiiMMOzTN1mZieOBx4
X-Google-Smtp-Source: AGHT+IHpdUfHQxvuX2LgFj0bRaJLnOVfn11IFvx1tV4oMXuhe2b2/SEpeOfaSbZAwpl1Ycr3sUvEow==
X-Received: by 2002:a05:6870:20d:b0:29e:703b:3fd2 with SMTP id 586e51a60fabf-29e88824b47mr4560654fac.28.1733265535720;
        Tue, 03 Dec 2024 14:38:55 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::dc1a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29de928c9b7sm4037836fac.22.2024.12.03.14.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 14:38:54 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 4/5] lib: spdx: Fix SPDX_BUILD_HOST
Date: Tue,  3 Dec 2024 15:37:09 -0700
Message-ID: <20241203223844.2689172-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203223844.2689172-1-JPEWhacker@gmail.com>
References: <20241203223844.2689172-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:38:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208225

The call to make a new import for the SPDX_BUILD_HOST was incorrect,
since it was asking for the key named "SPDX_BUILD_HOST", instead of the
key name contained in that variable

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/spdx30_tasks.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 30f1a3a1661..3d7035909f0 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -908,7 +908,7 @@ def write_bitbake_spdx(d):
                 [build],
                 oe.spdx30.RelationshipType.hasHost,
                 oe.spdx30.LifecycleScopeType.build,
-                [objset.new_import("SPDX_BUILD_HOST")],
+                [objset.new_import(host_import_key)],
             )
 
         if invoked_by:
-- 
2.47.1



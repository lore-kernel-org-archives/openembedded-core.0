Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A73EB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 18:00:35 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.2695.1689703225303242473
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 11:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=4RjdZ379;
 spf=pass (domain: baylibre.com, ip: 209.85.219.46, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-635de03a85bso24359826d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 11:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689703224; x=1690308024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ari4McQ3aIgG5UF0+SMXcaW1fo9Rg219gK0dq9mQlHI=;
        b=4RjdZ3794Wr5Rvv6f3wfsc+m/86NJLaSw27eV/+yEpXfngAgTO7apOtjCVfaYpLtgy
         8hE1Sh2uCwbrX8gQL7oJ6AP5ICSkxCw9dmD0108Ff3FPf7aeGUypyLFKDeoc4zzeiTyJ
         dGirOCyFxB3+1+oWpjLsgUyQrRt03sz0Cx65hRx+AKWuYx7F68b5h4Q3CVsE9aihSyR7
         sYL7x8W0dj0TeIEz0L4N98yKgYbUdouP3Qw7utJBuShwWqH+y6c2YejVLNd1go0toVXf
         3NF6RkPsHp2QHV83zLYrxsUD5s+lTPXIfOszVoXcItgGIBzBW8GzrNjY3klpYWIA4jfy
         Ru5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689703224; x=1690308024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ari4McQ3aIgG5UF0+SMXcaW1fo9Rg219gK0dq9mQlHI=;
        b=OclAX+X+ehzQr98DrBTKGkM0CpcgsLR95KNmcdVEXAXaGHyYw0G3W0DTH+ysgPet+6
         aKAwwAi7QmtsCDi2hNew7zG+QtcSomaaEC7TVLqEJ4oRfzkj/5VXoKI+88ppqWy7lO8k
         4OAY5tGlEOnG7fhTtP1a0Dt/dol68awuvPH/8eeO03sNha49+vveoiVYAbHYxk6Syqp7
         7GJ47MFcyXcQ+xh2j/FClIuAkpYZpz7wbas1N2QS7kAlZ3cgzT49f7BUpI0ZJDdJq0wH
         /elaIc6kLZvT53id6sBAEfoiZarWkWSEVqs6BLjPBWZfECSJVs19roy4p5gjdr5KfpbM
         8jiw==
X-Gm-Message-State: ABy/qLYtdXeFTzpxUNkvl5pAdOSShA3TnCa8FBnMXCcA6yMvQ+k2HW+2
	EMuZ0YOPwiazawEGelSM5r7qoToorwYezCS/tXA=
X-Google-Smtp-Source: APBJJlFgtjpAFhciV/bDPpHC8pG7bLwrQ97fRbMg0qkMyJbLZ8Yejebl1Q4WQ5tJk79wjJFHY9JLDw==
X-Received: by 2002:a0c:b702:0:b0:636:24ca:88e1 with SMTP id t2-20020a0cb702000000b0063624ca88e1mr237493qvd.52.1689703224262;
        Tue, 18 Jul 2023 11:00:24 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id a21-20020a05620a125500b00767303dc070sm777277qkl.8.2023.07.18.11.00.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 11:00:23 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/3] python3-editables: add python3-io to RDEPENDS
Date: Tue, 18 Jul 2023 14:00:21 -0400
Message-ID: <20230718180021.2934900-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230718180021.2934900-1-tgamblin@baylibre.com>
References: <20230718180021.2934900-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 18:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184555

editables needs the ipaddress module to function, so add python3-io to
the RDEPENDS list.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-devtools/python/python3-editables_0.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-editables_0.3.bb b/meta/recipes-devtools/python/python3-editables_0.3.bb
index b42ff06872..79d7fcaaf0 100644
--- a/meta/recipes-devtools/python/python3-editables_0.3.bb
+++ b/meta/recipes-devtools/python/python3-editables_0.3.bb
@@ -8,4 +8,8 @@ SRC_URI[sha256sum] = "167524e377358ed1f1374e61c268f0d7a4bf7dbd046c656f7b410cde16
 
 inherit pypi python_setuptools_build_meta
 
+RDEPENDS:${PN} = "\
+        python3-io \
+"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.41.0



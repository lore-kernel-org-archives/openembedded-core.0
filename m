Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C39D9EF48D2
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 17:46:04 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.77804.1771004763904221084
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 09:46:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z6wBwq1J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4362d4050c1so1265322f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 09:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771004762; x=1771609562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vt2M68ijNYpPZB87arhKat2ceT38ORWKyCiKOR2x/WM=;
        b=Z6wBwq1J04NB9PUUHS7XgKR0tY0d5zjQ7qopzayjDyLZoN2aahpmF/9yZ8ytNbmoRt
         b6xxegRf7gQPPsKDdB5bWnaNY1dWOMK+LehmGWbwMNdSZuJBDzXmxedo7Cf7usYZTWEL
         Dz4gzpI4eZeVmbsfuUjJKuhqWea9vEwJoryrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771004762; x=1771609562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vt2M68ijNYpPZB87arhKat2ceT38ORWKyCiKOR2x/WM=;
        b=o9PJ1nO/6Z2Wix3PYHWYM+F+pWKh+Kh1FyZZZc/EZGzSq04pgECgT5s9F70OOiGLc7
         UMW6JZMMvE0O/sfIbEhMFEhiMhqElhgM019ONe+qN3a66fwsVy/uI4lyAICrL+FPXrNY
         MzVeTPyDyvGhdGHyyahI6YZoJSM0l9dNN/gmO/Os9d51NK3mQnYbfJAG3z/aBuwW6ahP
         i0Y9kOrNT56OzGUuE4vXyM5aeWX+m381twC7I88Cx4apzEuVJ6UiIvG2OR28oB5HpHlJ
         ZG4p52XFx/FC9R4L+PcS+PgFe/sw1EEyoI1flPTmOvrwcTK0scXZrnW9nuYJssU37BK8
         kb0Q==
X-Gm-Message-State: AOJu0YwCQZQqrlM+rLPcIR5BwTuuPaQ+9Fj/H0yRtLpiCr216SMTDrk5
	FhtV1aIotEkh5rZpyihKMHrbeeVYvrdDaGet4rWtNl/Xk1/0oS+DPrn5qDoVY1yR4/GoXfr+tPL
	TNkp6GCI=
X-Gm-Gg: AZuq6aJwGpf39ZnEpUR6HRD8m1hh6rI2hCPghDPLJ6+7Cim5QpescSiFa3JFhAOY+X1
	ACKfM+JMH1+a1zHtP9meew2MSE5PkdXMA0uA83zcAR2ZW+GHnGt50+FOKIa4jbupYUCPaN5kQc0
	52FEj0aFtYZeRz3XdNe6AUvvAYQffYIaA2mAp+Wop8HGjtplRleV9oVu4w/Sm94dO2LM6rIZd2j
	7YGWXBX8d4fcu9yZrn46Nk2VSSXD6oZcUoqXM90P1LkvhlRGO+Nl+Y4EL2gyzgvAsHf1MutP5e7
	koB67ixhoU3o/GR48GUH8w5aCLXeGSDmZOs+LZ834njKSJ3SsUj7bxHN2jNCwYCck9f+hXL1Zch
	PgG2zz+0oai3Dz02pfrJbxluEY2lb289zYJsgWJPKOGjyBe+Gawlkvp+5TeATFOuYH/MJwI1U+P
	aMm4o3QOdCgVJLYMqJBXS3+KeyXU84jvRZf5sMEyA/dRZhCcpGxnc=
X-Received: by 2002:a05:600c:450d:b0:482:eec4:758 with SMTP id 5b1f17b1804b1-48373a4f05bmr47820885e9.26.1771004761870;
        Fri, 13 Feb 2026 09:46:01 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e20e:afdc:37ec:38d1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483709f6935sm36502655e9.0.2026.02.13.09.46.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 09:46:00 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] lib/oe/recipeutils: Drop obsolete FETCHCMD
Date: Fri, 13 Feb 2026 17:45:57 +0000
Message-ID: <20260213174558.1799136-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260213174558.1799136-1-richard.purdie@linuxfoundation.org>
References: <20260213174558.1799136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 17:46:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231131

These fetcher variables are being removed, drop the references.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/recipeutils.py | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 54bc3d76662..c6604f536db 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1139,13 +1139,10 @@ def get_recipe_upgrade_status(recipes=None):
                  'RECIPE_UPSTREAM_VERSION',
                  'RECIPE_UPSTREAM_DATE',
                  'CHECK_DATE',
-                 'FETCHCMD_bzr',
                  'FETCHCMD_ccrc',
-                 'FETCHCMD_cvs',
                  'FETCHCMD_git',
                  'FETCHCMD_hg',
                  'FETCHCMD_npm',
-                 'FETCHCMD_osc',
                  'FETCHCMD_p4',
                  'FETCHCMD_repo',
                  'FETCHCMD_s3',


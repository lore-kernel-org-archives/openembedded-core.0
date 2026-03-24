Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A710E9A76D
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 11:17:26 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17139.1774351036746954192
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 04:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NCWeVrLq;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43b7ff8fe92so708054f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 04:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774351035; x=1774955835; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ShRusG0+5XEhO9Uq40OQZabV+61qfNlYEbihF01x+E=;
        b=NCWeVrLqm1PDjJoH93OsuqGhSRA0JaavewY80ilPcEqrdr1zjojRBEiZD9yt4mxGao
         3eA3aKpqnqSSp4kEpgrJ2dCu9mp+9ZDHo2iDZCIHA/bur0No6H9paUlPlra9uyw1gJ+8
         DsKaauaUNJOHRL31kpxxXS58G5OYTWTifPex9hdtv85ZrACvHN+9Feb6tZInZ2uUtAk+
         seRP6wG3QgKbwjf1UgJRv9Rgb6OJ6ao9gCmTVidWsOD40IsG6lj5sOdz97VAvtAXOI0c
         8mlAV/Xt05az4BqqEG+3YjR/ccc+FmuAu6gGerSt67ixKbkEPLeeNqKu7CbaQeCmhXj6
         gfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774351035; x=1774955835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ShRusG0+5XEhO9Uq40OQZabV+61qfNlYEbihF01x+E=;
        b=Unyujv1rwDLz0ZtZwvDep00ctzeXbpqbEYxrgE5lXEBG/gkUU7kJMUBNz/a7XeB/xs
         bbjJpdVvNuyAUm2xOf+WJRZMgYOo6UoSd5bZR87oMQ4I+VwSeya38rYSUaLdAQ11Vt5p
         d85UyRsI6UIqYSGdPWBUzPyEjJmaq5++xsPNc/WFMwWN871wkInd+DBXo+KtralCssa0
         4QaFZ6m+gOmF+0QJa5DC/5XVUazO1qh/NyjBHkSx31Ot+pPrMvvUS3w3tjBwfYSLkJ4a
         ZQHpYo/u2Q5lS1+nu9ha+SQNB4enjJ3am3qBz62jjOXCH4dCPy98sAtR5OiJOGoqKXlS
         NsXA==
X-Gm-Message-State: AOJu0YxkgC7SWPun8ec6aSM4OUdXiG0Js6rwyN/PBRZLuV43bkHQM6tl
	QdKYS1KHyMzOGO8VaLHO38gsAnAjiCInRbL8eulJYVX+vxXYPgy7xg5rjw1dmw==
X-Gm-Gg: ATEYQzztk5tuPoywVnPByM8Np09+22hQ/MIbGcw/3oJ8z6sqZlZbsPuSs/aa6itpZBf
	+BGdzSO07EAgVbkrv2OI7+44CbS+u1DJ40rTEst8mYVFrXmWkF6m1JZYMI5Y02IC5uMIzjPkTjS
	i/lXx7w6WVk6UCYcKgvocOgSjRbVm0pMkh+7KxwbIE/cOpQBLxrylKUJ2sUGJrXo8Dphs550jDQ
	u+5558bmtama01iUdKSLapFQoD7hTL6jKwqymkOvD1iD45inXt0uAEyt6OSKHez0qERG3p0GJ1q
	ljgWG935XU6rttUyiF0U3ypB+QES1ZeYgAVqB0vfZ0tu4Y3wWe22o0qSwf9IzfBi0fIVpbUkO7k
	ZStDWb6VEscQ992KIfV7J7Ds6kkLrWqqHp/HRbr4bggdUp3jw171nCyByag3pSzJZLjFldzt5aU
	qhj76hJsEO/MFdxQ==
X-Received: by 2002:a5d:5d02:0:b0:43b:45d1:f44f with SMTP id ffacd0b85a97d-43b64281799mr26897799f8f.41.1774351034591;
        Tue, 24 Mar 2026 04:17:14 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b646b0d3dsm35050975f8f.16.2026.03.24.04.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:17:14 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2] mesa: Upgrade to 26.0.3
Date: Tue, 24 Mar 2026 12:17:11 +0100
Message-ID: <20260324111711.2929939-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 11:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233792

Release notes:
https://lists.freedesktop.org/archives/mesa-dev/2026-March/226616.html

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a95adfc960..6ee8d87c4a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,8 +19,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
 "
 
-SRC_URI[sha256sum] = "973f535221be211c6363842b4cce9ef8e9b3e1d5ea86c5450ca86060163c7346"
-PV = "26.0.2"
+SRC_URI[sha256sum] = "ddb7443d328e89aa45b4b6b80f077bf937f099daeca8ba48cabe32aab769e134"
+PV = "26.0.3"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.53.0



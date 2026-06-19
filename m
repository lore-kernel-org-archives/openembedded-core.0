Return-Path: <hfranco@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D95CD98F2
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 18:34:43 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49109.1781894081169929417
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 11:34:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=TV185JkY;
 spf=pass (domain: baylibre.com, ip: 209.85.222.178, mailfrom: hfranco@baylibre.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-91563abd6a9so125944685a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 11:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781894080; x=1782498880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+xxrsjHWWsFCLy8Vsn+00aaxzcyrgJzr1Y7gd81oYbk=;
        b=TV185JkYtjlMJEDGwxN6MxlVu7hMH+wTVUNw5ZuEnSkEb3locouCm8VRR7jvCyINAS
         2y5ff6K/gDYYOrlo5zEp0nRzNMH6QtwUgv8PSYFEThrer0wlTxA9XVOy3zOe9iBGVot2
         NIq/p0AScPLYFk/atf+JM6OmzX4JBGeNnwFyOet0zJ+LtjVq0KN6zsKFqPAIJWNttC5z
         tt3F2VK0CXaRDSJr2lsD3Jz8mXClUjk586Mmei6RB7PEyhINp6ScCXqM5qorWFrDk+i5
         anK/NDTzxxmpkHvoqn7Ka4z+ZPPV2d4vsIwb4jHRK1X8rrWrUG1j5Jr1rkYdntvH8M9/
         c8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781894080; x=1782498880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+xxrsjHWWsFCLy8Vsn+00aaxzcyrgJzr1Y7gd81oYbk=;
        b=AtUzglF52ZPSdSYIuUpLiT/S9dlzkPZrI9Cz4mhKdL5MD01VSkTngiqGXvZkU6DYi/
         nlh/PF40uOqs9uy2vcGzMptleZvpBn5YrbLII0uWgJsWpILE4vK86vFllEtRitasyzj4
         VMsKwIxa66iy4WfAXc6UmGG1dlY8qcZ9OTtydWmKmN+XhRxi6hZEHvBse0NVMZUFuN5b
         J3ghpLHk24Rec1p5dmEiEaAKpejnT+67p4026Vkx8xLw/pCanYdXH7oB+ud9Uc74NNfu
         IBCwkUYTuEAT6LB3HTbeQB3zITpISi+7TBS5z/MApPwaQcMp3A34p2QOjMZMuoIM6voc
         CyBw==
X-Gm-Message-State: AOJu0YzL43yw7ypHLLudHtPvofjUM05He9Nl54Ag2v6mbeYJCYterz7w
	FftzvOMaWuBbl7nKT176DiodT9egL2J1jr/xNOl6UslOQ98yAoMxh9Q6so+MTiCAXrBu6tlm/Wt
	Y+Wdm
X-Gm-Gg: AfdE7ckTXVi+gfp7RcOTESJgKW32hypykelt5H/7MLFjW624aY2Y/RpgyolgfuvqJm4
	sWjwwP8vLEqblh1zwGvGBLw1QO7wUStZLoEq9kvrHYdG3OuAWqNi9JblTH2B6+jgA25CitFE5Q3
	YgEXVIq98N+YN+Ws+wp8IovNKPQ8PX16ZVqNLJKYdU2cBdw891/AlqHCCPpapzom51VOw3jSDgQ
	xeK8i/I3hub/NslbuVUyf7uLlrcR9EJEWK/7udDR2zghpfvbNKjXQiWKSHZ0wfBwvyQAixuAGP4
	tu2QRA9X+mVAq3RjpEW/S74LQOlOCEKghVXwmP67LwCq3Kqy0HamkZ2yB+GPHIQFiGWDXOxeKDp
	pIBvZb/BniGBI0cIdjvSONLgffMKMQXjaAVsJG8V/UR9Z9/yE0kf+qKySP1B/ZVDqADFBuXcyQC
	GQgT2Mq7W0qIMuMQBggSmvRLFbP7SidjtVZ1mLhtHmBq0hXt7g8w==
X-Received: by 2002:a05:620a:84c5:b0:8d1:d0db:392e with SMTP id af79cd13be357-9208cdf3274mr703963585a.32.1781894079942;
        Fri, 19 Jun 2026 11:34:39 -0700 (PDT)
Received: from hfranconb ([2804:14c:4c5:9534::5a52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df82692405sm7008996d6.39.2026.06.19.11.34.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 11:34:39 -0700 (PDT)
From: Hiago De Franco <hfranco@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] nospdx: also drop do_create_recipe_sbom
Date: Fri, 19 Jun 2026 15:34:06 -0300
Message-ID: <20260619183406.239931-1-hfranco@baylibre.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 18:34:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239190

create-spdx-3.0 adds do_create_recipe_sbom, which assembles the recipe
SBOM from the SPDX document produced by do_create_recipe_spdx.

nospdx deletes do_create_recipe_spdx but leaves do_create_recipe_sbom
in, so on a recipe that inherits nospdx it has no SPDX document to read
and, if executed, fails with:

  ERROR: meta-world-pkgdata-1.0-r0 do_create_recipe_sbom: Could not find
  a static SPDX document named static-meta-world-pkgdata

do_create_recipe_sbom is reachable via sbom-cve-check-recipe.bbclass or
explicit "bitbake -c create_recipe_sbom". In those cases nospdx recipes
such as meta-world-pkgdata break. Delete it alongside the other recipe
SPDX task.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
 meta/classes-recipe/nospdx.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/nospdx.bbclass b/meta/classes-recipe/nospdx.bbclass
index 7c99fcd1ec..925dc7c5b7 100644
--- a/meta/classes-recipe/nospdx.bbclass
+++ b/meta/classes-recipe/nospdx.bbclass
@@ -5,6 +5,7 @@
 #
 
 deltask do_create_recipe_spdx
+deltask do_create_recipe_sbom
 deltask do_create_spdx
 deltask do_create_spdx_runtime
 deltask do_create_package_spdx
-- 
2.53.0



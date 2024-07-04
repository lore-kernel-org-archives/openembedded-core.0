Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0776C30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 16:23:57 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.14231.1720110232529119401
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 09:23:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BsJDT0ln;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.170, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ee90f56e31so5051871fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 09:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720110230; x=1720715030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qeNfyZkVuss+eHBcZLJ7gCmxRJMmcdL83kp/XG8nd8M=;
        b=BsJDT0lnRyGTPJthEJ8/AUPtCb+HNl7zMaLSuD8QLYa9MZEYaoQFRLuCwZsXGbixOa
         9EqKAyqiywE+lu2y/c72MeuthSNEBhdv1l0dWQKumPaaAkI08ta3EHXxDLiSa069v1Xz
         Ddp/tBIqj9GpWaNbVP3k0PMKawHyO+PV46MUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720110230; x=1720715030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qeNfyZkVuss+eHBcZLJ7gCmxRJMmcdL83kp/XG8nd8M=;
        b=s2UYAh9VZe5dsCQNvJ4Zk61AOcLWc39Bv0LnKO1Clszq6GMLhPADdg8QULbI+ltAvF
         RuFQTIQGaXumflpoQ5oKBTb6OXPv81fapuTJ+umrdMALJnDfupF/a+UvMIsuyQjF18xx
         MJFdSpl9rw2FiwVfrR6G0uladuQcpCA6RLkwkLRsAk8GlCU4Y6zOc1wZ5sSipeYGrRbO
         qAeZGkwKw/z9RL0XbCOBRsJRLDLmYJUwed9FMjMbEwVzKvbFKGIB8iY6uxWTvpnYByN6
         JC2TZ5jyWpy2qSjbrUbnjui55BMQqf9+x2/kXFwp1Gg4dDPEzf5zr4v+enRcumkHgv21
         AzJw==
X-Gm-Message-State: AOJu0YzIF7Qm1gsrabIKQ4cPxiy/tuXMrUySeKKXNd3FJoV8f18P0qZw
	TAchXM5K/60p/UGqEA+eofeGWQPjP5TcVoEjVe1xgOrRe3iX3QTVnyo/4DA9+q5drogW59Tsana
	6
X-Google-Smtp-Source: AGHT+IGavuFbfx0YsNtuWww1unmgy0iYFU7SSl4e5FP3zNExhy5dLVIQ3dWEI+U7KpBVDdWGOWBYLQ==
X-Received: by 2002:a2e:98c6:0:b0:2ec:5518:9550 with SMTP id 38308e7fff4ca-2ee8ed22bf7mr16831581fa.10.1720110230041;
        Thu, 04 Jul 2024 09:23:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:be20:56c3:ce73:d7de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a2fca8bsm30416575e9.47.2024.07.04.09.23.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 09:23:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/reproducibile: Explicitly list virtual targets
Date: Thu,  4 Jul 2024 17:23:48 +0100
Message-ID: <20240704162348.3286315-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 16:23:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201581

We're seeing reproducibility failures where some packages don't appear
in the "from sstate" builds. The common factor is these are all recipes
with PROVIDES = "virtual/XXX".

In a full build from scratch, these are build but in a build from sstate,
there are situations where they aren't. For now, to try and keep builds
working, work around the problem until we can better look into the problem.
It is likely recent taskhash imrovements have caused this to occur more
regularly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 97a9c3da908..7c6cf3eb1ff 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -135,7 +135,8 @@ class ReproducibleTests(OESelftestTestCase):
     max_report_size = 250 * 1024 * 1024
 
     # targets are the things we want to test the reproducibility of
-    targets = ['core-image-minimal', 'core-image-sato', 'core-image-full-cmdline', 'core-image-weston', 'world']
+    # Have to add the virtual targets manually for now as builds may or may not include them as they're exclude from world
+    targets = ['core-image-minimal', 'core-image-sato', 'core-image-full-cmdline', 'core-image-weston', 'world', 'virtual/librpc', 'virtual/libsdl2', 'virtual/crypt']
 
     # sstate targets are things to pull from sstate to potentially cut build/debugging time
     sstate_targets = []


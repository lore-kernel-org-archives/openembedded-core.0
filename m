Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01428EE0AFC
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 00:49:25 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16801.1770509649721053961
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Feb 2026 16:14:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IyB73wdb;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: logan.gallois@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-65940221f7eso5549493a12.0
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Feb 2026 16:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770509648; x=1771114448; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0+SLoF5u/LeZWQtQT480daj75UQXDhRmIVUHie5fmpY=;
        b=IyB73wdbcIyDOiw1S0biKba4JZnN+yQ4a7cIvns2z2d1SrZWNtlI+MiXH2EB6Au/mR
         3G4uFOByQKRJIbEV3bnCfpXrCDwWhf0GoCc5S9nnpdJ/Y7fEbvUmmIxEWhNEMwWdNQQp
         cJB/tbkYK+WzKrdCwW6dX8XrlCuPPZeqTof/JSr4amE+JV+I5qkhOulQgFyoKQ4GvpIy
         ugwytJEQSJTUVbrPaPe7evUSTpLbHGuPFUHAL9aIYFpaQ/MlWIUNCZczIUcK9v7qaCUL
         F1tcDczNO4DWFqIOBljTeYZiX+TopSr8OwRGQSQ7T/3JOTC+BxSn83cheX9erEYp9Q04
         sIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770509648; x=1771114448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+SLoF5u/LeZWQtQT480daj75UQXDhRmIVUHie5fmpY=;
        b=lE52s0o0wwYGa3UrewjntlOJ6Tx+OLLXPCwprKgmuJUQndgIKIgqtlXmtvQ6LBW1rE
         BLVLoKPvS0CCpMo8NDVfc8nOrt8jO7nLzehE6QF2gUMwfYoWd4UYWLogwCkzzqRfsW0J
         /wTIVxkie/rL/tR5aqotznvbh+qgwJnwNKpqph+bRote6fqgVLvz9fV2gYFpZsVR5/n7
         m6zCIdeRATe8LvFYZs5JTNwOjzTxsVcvXBH97m2JJo2d9m0NXnU01LEA6nnUXMpWbe3I
         Vxxw0KAE4ODMU4DIuVDKT8XF1Juf37xI2rGuIF6Mw/CIogdGHbtQ3TjKQ7OLFVw2FsCU
         dRFQ==
X-Gm-Message-State: AOJu0YyR2LIaj3grOyozAmT2j2KgbLFHx4GaXxKK21gImO6l42tM1Iiu
	Px4Jsev3LREcfKfPExpAQ+QPdMbujbfSOzBw4Jf6wlEZzpSVN0kD9WnF7yGYFg==
X-Gm-Gg: AZuq6aLLiYIehhgcezZ6hf3OwMcs4uoKtbTFfAjwdI5Sll/p2YqOOiqCUT1K5x6ZHo8
	5HqAyWi6N2UI0wJTxJ5ubONkHrXXDS3bRe1PyUtf5CfRHgXQXeEcbTRnm1SC8eDNzkzsnELbTNf
	ekdLmS2rTZx64HitUqRWu6fiSSEfc6yIsU0D54ntoYS1G1yp+oj81c7t/kNd5Xm14PV6FNHNros
	2xo0m1JJrJE6HXBITB74JEgQ/oJdXN1Fx4GHwAuinHJ74BTiK8S/p8a5wVOX+g45Y6u/8Wghelp
	HPg2G7+O7qPop+/8o9fhc4+RIIgmGl/lDEpDLJzGkwCrppI7ajMu0xi3/+iyiweBlOaGpQEa/2/
	OeQaEdpHIik//9oJETI1sf+epo3Y0ypAiS00/i+hFWYMdBFaJR1e3Gd2zqXQH4ZHNX7gwloJfYS
	kpWYnXXKWlTrLe6fzhrqjUlRT/Pi1gDUhkyu4nivO01JHAPJD1TTClbDI6XXsZGFcR8w==
X-Received: by 2002:a05:600c:5489:b0:475:de12:d3b5 with SMTP id 5b1f17b1804b1-483202280fcmr104807135e9.34.1770509320379;
        Sat, 07 Feb 2026 16:08:40 -0800 (PST)
Received: from Minicarpet.home (lfbn-orl-1-620-177.w86-196.abo.wanadoo.fr. [86.196.80.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483206b8bbbsm239945925e9.3.2026.02.07.16.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 16:08:39 -0800 (PST)
From: Logan Gallois <logan.gallois@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Logan Gallois <logan.gallois@hexagon.com>
Subject: [PATCH] oe-setup-build: fix TEMPLATECONF not being applied
Date: Sun,  8 Feb 2026 01:08:29 +0100
Message-ID: <20260208000829.343627-1-logan.gallois@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 00:49:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230676

From: Logan Gallois <logan.gallois@hexagon.com>

When using the new bitbake-setup tool, an oe-template created in a
custom layer was ignored because the TEMPLATECONF variable was not
exported to the environment.

Export TEMPLATECONF so that bitbake-setup correctly picks up templates
provided by external layers.
---
 scripts/oe-setup-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
index b391f3b9254..0a3146fd503 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -101,7 +101,7 @@ def setup_build_env(args):
             f.write(cmd_base)
     print("\nRun '. {}' to initialize the build in a current shell session.\n".format(initbuild))
 
-    cmd = "TEMPLATECONF={} {}".format(template["templatepath"], cmd_base)
+    cmd = "export TEMPLATECONF={}\n{}".format(template["templatepath"], cmd_base)
     if not no_shell:
         cmd = cmd + " && {}".format(os.environ.get('SHELL','bash'))
     print("Running:", cmd)
-- 
2.43.0



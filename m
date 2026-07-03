Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF1FC44501
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 08:30:08 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88749.1783067407165113613
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 01:30:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AQcc2PwV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47362928f65so301207f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 01:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783067405; x=1783672205; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Z3bbUaJejIWyqpiLEXgw7/5iqq0uPleWkLRpwu5OmY=;
        b=AQcc2PwVL9oQux/8Wjy5X9itiDtxn2+0tpA+E0Neox92Zyy3qO3jrUquK8l5iFDfbV
         qqp0MeWhzNdsVkPKEmqJOvIeKME2f2TXNd0vPYrATg7NXP2UJc12lfXyq4CTLgRV9u98
         dWi7coLo2FS3QzvoJ4qnqLO00PNeywclzJNGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067405; x=1783672205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8Z3bbUaJejIWyqpiLEXgw7/5iqq0uPleWkLRpwu5OmY=;
        b=WuySeBJyFEZmTeYjEP4lNeU7J7kUIsdAQfOIAtAz000uB0h6cdz39LV5LxlwkN2CFh
         riPC9r7Un3c7gR5RoeqQJXYn/SUkYGINn6R1+WAlBKl5gGCScP2XvjlpS5EUOw8zHIN9
         0R2Zs17svKT5jYbEbLgYuA+22z0ocN9ZDnEWJ8r5Tawqp8YTaCrgC82zrsuO8HZC2a0c
         6QxUmdlYX4wUHUMac3dZ5eitirfNzX+FyGYvlpo3wD+IiPjZrLzy3/GC3EMpHMhbpisk
         /pE3IK38iO08+LIeEU1ata9hFPZd6W/vK86FCO5cQQYHAJj36c86vWX7F3db6tgPZ9lC
         EeuQ==
X-Gm-Message-State: AOJu0YxKRlEPDUW672jN0lW1lxhCE1wpWZmqmZR1Yq6c3LQAkbDs+kJ5
	C9hKPjDzA+owizP2o1+oKALNGwI9ASpiW3ZJnjsbydoqHRtH2S/TT8pDyxLtdnDp0O15sQ9+BmN
	+OU8KHhI=
X-Gm-Gg: AfdE7cl4RlZI+jMPun0tPv/tJe7RSCNuMP083hsQJ/iQ/5Xb47sCdRnrMkmY4FANh4a
	46lvQCsthRLMchfd6xWmBO0mjxUYkZrm5j5LUAYxEcMLwchZ3npuhYbNPkyDA20wpIY4BgxXRKV
	3OoSxB2m+CZGr5sMdaCj9hrDeo8+tLA+TGizrBgISVE6Sgo5Ko2CpXdMt9V2yYqNKUviQvUA3HE
	ORnP5AUGJ8kqJbNuUUH0WeLQ6WMohIblaCCgDak/Lg4zG4HoRhfMVP6VET0N3pkOOv1q/bzIjXO
	1HcyssAx7BkqT1mpEVHMJsmSRSjU3QZX8EXs/nr3M5fLqPFjDySVLj7v3asYp0cuOA9iBWE8RMc
	Qrx+eMBLdB6499b0rrHYwZxlJJqoyxkVEDWXdR4Ra8FoGpqZ8//mA7yzxFx5e8zVMptjURtJtiA
	icfuDh4mtS0TcH4m3i29FXkAN9hRhTdMe57aOD6MHcljgFKlRxBt8u
X-Received: by 2002:a05:6000:29ca:b0:474:fb6:b049 with SMTP id ffacd0b85a97d-4775be0312fmr9909735f8f.38.1783067405265;
        Fri, 03 Jul 2026 01:30:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ad8d:cf49:9149:eae0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbb79sm15684554f8f.2.2026.07.03.01.30.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:30:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/15] igt-gpu-tools: upgrade 2.4 -> 2.5
Date: Fri,  3 Jul 2026 09:29:48 +0100
Message-ID: <20260703082955.1585712-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
References: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 08:30:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240090

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...b-meson.build-do-not-hardcode-the-build-directory-.patch | 6 +++---
 .../{igt-gpu-tools_2.4.bb => igt-gpu-tools_2.5.bb}          | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/igt-gpu-tools/{igt-gpu-tools_2.4.bb => igt-gpu-tools_2.5.bb} (97%)

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch
index d8422633cc3..3cf62632903 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch
@@ -1,4 +1,4 @@
-From ebafc97afab5bcd71ca1d2013aed3b09b12e1c35 Mon Sep 17 00:00:00 2001
+From 5681532ed4e1b656219bf887bbeadbe3ee6d277d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 18 Dec 2025 15:45:11 +0100
 Subject: [PATCH] lib/meson.build: do not hardcode the build directory into the
@@ -32,10 +32,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/lib/meson.build b/lib/meson.build
-index 5c4829345..d28c95d99 100644
+index d1289a5e0..a8c15be8e 100644
 --- a/lib/meson.build
 +++ b/lib/meson.build
-@@ -301,7 +301,7 @@ foreach f: lib_sources
+@@ -309,7 +309,7 @@ foreach f: lib_sources
  	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
  	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
  	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.5.bb
similarity index 97%
rename from meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb
rename to meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.5.bb
index f5f5b3b8731..1f4353292ff 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.5.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 
 inherit meson pkgconfig
 
-SRCREV = "e6b603e4984e4ce30fe1cc2705734d0f130e0550"
+SRCREV = "a8e2cbd2854d7980a9eccecc6e0c801d0824b88f"
 
 SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;branch=master;tag=v${PV} \
            file://0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch \


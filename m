Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC7BCD98DE
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:03:50 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105039.1781424222549941904
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PUIkN4YL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490c1915793so19610745e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424221; x=1782029021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NeVxNoC/VoVRdnP42ptsG4iazmzwYCfRWfw7h2WbCcM=;
        b=PUIkN4YL7cK9EXu5NXijrguWLVt+cN9D8Q46gTcjBn8SkY80Gnd4ccFFgmkVppk/zm
         YyDDdcZlfrEH0Wpz5PH7oWWypq4Z0jjHsmPEeBQYjXtCNxz92mZTYaRAaNf8PXRRev+X
         IDdxdRGuC0hwvSbqUFN9EvPF+t+GkN4lJCWq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424221; x=1782029021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NeVxNoC/VoVRdnP42ptsG4iazmzwYCfRWfw7h2WbCcM=;
        b=PTqKPVewPEZYCdv3B6RF4PigYNyMwD5cF6l2uOa4t5GsGlxHY1o7nX7fkOgJIcE5L2
         n6VTgqasBhd7vVIbOmkILAoSyEZUzGcAIyh4tb4AKQCBuzC1NyCamD88NG2D0PEEIIaT
         0N6RZo/wHLYTjAYGunmdret9FWvFJKuaOcHaV8whIs6R6pb1B8lhEJYc/nij9e4JdJPF
         jmjExpKDZv0CM6sV8Bjb4t0qOzz15OoA4H2kheapJIO4+bo4ZFWKUCsDaJLC4n18Jeal
         6Iw3A1ypSdhuY364cdDisvhimRFucQrXLvMpKplRodzFoNTfyfFRZy9Txen0OSB0iG+n
         I47g==
X-Gm-Message-State: AOJu0YyEkuab4sZm5a/IKabMWcYUgBtWank/Y5slrgQJL3y4T6koIrDC
	PEaIgPA/toWFlLISk9wLEMzT+xpOqk4CYSqc5Tbsi2lWQO92K7XjrnG510QoCPMTFv36b90d/h7
	dr9dw
X-Gm-Gg: Acq92OERoc5GWV8rj4HQOiV+NlJMhaK4xBUOORZXenvVHXp8aSHcr2dnsOafgkf2T0y
	FWoSEpUY293/QrecxggVqh5c1WIk6APoPUENbZ84G0IySyPtqlXsfYQHXA9uZ++FCM/MKarQQH+
	TSZJFm+NOGXeAMburTL5ibg1DpFn6GsY865nqg+P025geUwbT1jgk6yTzxf7C2iFMn9GcUDnOr+
	lIQgsflyHUZ+ZOzdAsUTfEHjtNBX+cqRbu6Zt4Xyt1mJEBknjY8F0b7FFfokZN1kSG4Z/7g1X99
	VYYL17SvT0C9B5zUs3JdqeDu+MFW5M6SqaQ4ivhDbN9Y6Lo9Tr9RLQ2paShZQ2zJJYnr4ELXjS9
	Qu7MhDXgSypHU0JALlnwksiHXSyyzfjlqpbbJ3oxnfQi2whXhHHEEMZ2ydNuH75wYRKuB/1BoiF
	NIseKDE3tyyepMV98sW2oqPCLeO6QPEqnwNVaHep4QtV6jtxKRlx6b
X-Received: by 2002:a05:600c:8b56:b0:490:e60b:5fb5 with SMTP id 5b1f17b1804b1-490ec527e4emr110921535e9.34.1781424220803;
        Sun, 14 Jun 2026 01:03:40 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:38 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 19/56] libgpg-error: upgrade 1.60 -> 1.61
Date: Sun, 14 Jun 2026 09:02:30 +0100
Message-ID: <20260614080307.4017177-19-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238703

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-Do-not-fail-when-testing-config-scripts.patch          | 2 +-
 meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch  | 2 +-
 .../libgpg-error/{libgpg-error_1.60.bb => libgpg-error_1.61.bb} | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.60.bb => libgpg-error_1.61.bb} (95%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch b/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
index 3484af63b3d..8dd1d46fed5 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
@@ -1,4 +1,4 @@
-From 48d457a819d1bf4171c6cc7fe161cdfc66770be2 Mon Sep 17 00:00:00 2001
+From 31c996b40ab91ef3ba26faab642560c42e666f10 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 28 Feb 2020 09:19:56 +0000
 Subject: [PATCH] Do not fail when testing config scripts
diff --git a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
index 485c079a2bb..b563751e362 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
@@ -1,4 +1,4 @@
-From 3648accd954d86b14f7a4eb72b9ffa4fe57b72d5 Mon Sep 17 00:00:00 2001
+From 9e0af7a9a4c6712ba14c93ee069fbec3a7edc97a Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 21 Aug 2024 20:03:29 -0700
 Subject: [PATCH] support pkgconfig
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb
similarity index 95%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.60.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.61.bb
index 622827c2ca5..de3918a9985 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "11b2a738e212f3eab0fe8637bc341d3181ca964e97bb2654de91aab7dae4ce09"
+SRC_URI[sha256sum] = "7a85413f2bc354f4f8aa832b718af122e48965e9e0eb9012ee659c13c6385c93"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 


Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D8DC64ED9
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:04 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.3149.1675840921798244239
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IwVXzz+u;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so737342wma.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhzPwID3fQPR/rcGdBIRtp5qNouBKUe4ksK+64QPRHs=;
        b=IwVXzz+u04K+7JGD9u/jEX1YtUDVjeMmzBBawRl5y4+GIOWfqt2IROJanMcFvJMla4
         c1AjD97TTpQg0bNMtgPDmn09VcLfPtd2m4F4YtuezTxvQkBOSSnqL3gfRX2zsU4i+BF/
         iVvoGUoebh/Jn35LecH3030quStfTh8DTrHDrDZdy66GBu6hHQWz7xL3H/ubfVtd2DV+
         z5nqPjPGDBb2IJ2gLSChWkz6YP0qB+ZKrI2dcrULi4WPgz9c1gnH/kVioyTlxieJ7R/m
         c0U8Ti9nFaq+OzW/Q8I6a0xpNAvuFe/h6VSE9bBopAx6DUab5dOc9TNnDTDbcRBYxlcO
         eYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lhzPwID3fQPR/rcGdBIRtp5qNouBKUe4ksK+64QPRHs=;
        b=XYyAF8KZhj9jY4OJJGdh3mgtB6QUaqomG7ljPXpI8Pd0PAljhthIz28Vu3naRpLDtl
         NXxdCvAuEPO/pGb34uU+UEIAoooioB1KvgyngCsTy7oQuS/PfhJGVtoBSbGwVNchruTT
         LzT9lCXJoZE7U4C7CFGfGeZdE2hLza6lIk7rOoKYRbP8g1UYyfR4vgO6F9gCExXq+SbH
         CpqsaDAT642LBUSbgiLNVYsKN/a2hnzOfdrxAp4j5Q5fHR52Mh+3SzuSXRoWQZF4Wwkw
         4T55wBNus2c9yt6qkXzJno072yvejRGq20VBGmOt/pKksF8MRAQMvDPmVJdvUAYN5NVF
         2vKA==
X-Gm-Message-State: AO0yUKUETh2heeaYm31+WEp214+A7/cA1GYEs1jKvSr7MoFnbK3VlFf6
	v+c6dFiLWiuF0fUhcdLJi7KbpKUcGx4=
X-Google-Smtp-Source: AK7set81U3XWyIHvRuvDHTX0mX5PcNvYlYf251oPnFcYPpS18tDJEWnL5ZN9luHy5JQP/U2Mo7KrVQ==
X-Received: by 2002:a05:600c:319d:b0:3dc:5950:b358 with SMTP id s29-20020a05600c319d00b003dc5950b358mr6101807wmp.14.1675840920305;
        Tue, 07 Feb 2023 23:22:00 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/52] spirv-headers: upgrade 1.3.236.0 -> 1.3.239.0
Date: Wed,  8 Feb 2023 08:21:13 +0100
Message-Id: <20230208072143.2930292-22-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176863

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{spirv-headers_1.3.236.0.bb => spirv-headers_1.3.239.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.236.0.bb => spirv-headers_1.3.239.0.bb} (88%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.239.0.bb
similarity index 88%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.239.0.bb
index 5b4e15756e..afd59cbcb1 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.239.0.bb
@@ -7,8 +7,8 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
 
-SRCREV = "1d31a100405cf8783ca7a31e31cdd727c9fc54c3"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=sdk-1.3.236"
+SRCREV = "d13b52222c39a7e9a401b44646f0ca3a640fbd47"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
 S = "${WORKDIR}/git"
-- 
2.30.2



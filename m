Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA91EC7618B
	for <webhook@archiver.kernel.org>; Sun, 12 Mar 2023 14:51:03 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.67839.1678632660069006938
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Mar 2023 07:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PNWSQlKo;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id x3so38951710edb.10
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 07:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678632660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ix4xDkUMEdaP7t5WBA/nR/Iy4wBgyGFTH5POQhQ/njo=;
        b=PNWSQlKojt05iNwHPwuCHU3sKm//R0RKZwu5DGPTseBFeB8hKAt/gPAOR5sziakrLA
         Ze1GBE2gqc+icpJWPKYigBN9AgkYNMaeOYs9JVGq8GqTf0s4csYVcgx+TG9P95q46gZW
         OU2nG0GN6OQ4fwSQpv9XcM3MzJ7PF1HxKghXCiaAOorJu9d/D1FRgQHK+HEG81FtW7CM
         Wy0qbbFhRYfgWREg1+CI5H/O5BLx4jO9AzALiudtybWG8AX6/otMgAXsYViByl5THdrW
         UHl57CP8doQEYMH3AQhBXAuF9EF7h9ncTCaRcjhFehcCuhWGXP04i1LJg+IQW7t85Kk7
         EcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678632660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ix4xDkUMEdaP7t5WBA/nR/Iy4wBgyGFTH5POQhQ/njo=;
        b=Wcj6Jj4F+iA81vUqCi02UcxOSVwrEF1OcfyckuqT2E1D68ihaM7RhGFwXMfusAaoXn
         Y0Ij6kVlV7AIQJLpjC4XPmQz4itVKYJtbmkAyMp1dE7qT8Z2Q2ebKBwd1UGXQ8/Jkkiq
         iCSQvp5fxxqnlPBGEGQWL9xeYMH/TZ9W57ssCdFEsDgfR/OL68XjIajOxCoqAjGC0G9c
         XI1MmtslmuauW1cztJsvKTyxJc/GGKEdVVkeUVfkDVI3+5DaEhJ/gZZeG/k5jbVxnCHl
         MJenfp0ADECnpireD+vuvHNV6vB2EhMbX4MuAKlwa5vqA6JBbLRuaSG2ups+uIJPaU58
         wzTQ==
X-Gm-Message-State: AO0yUKUxjRn/HCAm8juw24m0M6d0D+y3H+TVyEWxxQFYEqtwDtp249A8
	xXvhZEgN8yhk+yhwkViCAWsmQSbpet0=
X-Google-Smtp-Source: AK7set8klAmqNzUTqAs+nQkdOVjjeBuI8eQy6M1nJmJvSzHxVrhbglaNx8MZrjUvJoJDXXWoQdmJ7g==
X-Received: by 2002:a17:906:bc58:b0:928:a2:904e with SMTP id s24-20020a170906bc5800b0092800a2904emr1343071ejv.54.1678632660672;
        Sun, 12 Mar 2023 07:51:00 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l22-20020a50d6d6000000b004fa19f5ba99sm2012255edj.79.2023.03.12.07.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 07:51:00 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 6/7] mesa: do not strip rpaths from dri drivers
Date: Sun, 12 Mar 2023 15:50:52 +0100
Message-Id: <20230312145053.1427377-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230312145053.1427377-1-alex@linutronix.de>
References: <20230312145053.1427377-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 14:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178396

This was needed back when we used upstream llvm-config which
would add bogus rpaths into the drivers; nowadays it is replaced
with a oe-specific wrapper.

The particular reason is that mesa-native relies on having rpaths
to work correctly (i.e. find other native libraries in the
same sysroot location).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index f06c1a31da..370b54ca6b 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -241,9 +241,6 @@ do_install:append () {
     rm -f ${D}${libdir}/gallium-pipe/*.la
     rm -f ${D}${libdir}/gbm/*.la
 
-    # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used
-    chrpath --delete ${D}${libdir}/dri/*_dri.so || true
-
     # libwayland-egl has been moved to wayland 1.15+
     rm -f ${D}${libdir}/libwayland-egl*
     rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
-- 
2.30.2



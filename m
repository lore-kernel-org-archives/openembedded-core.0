Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F995C43334
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 19:15:10 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web12.289.1657826101116735702
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 12:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V8xNCWqZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.54,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id l2so2196133qvt.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 12:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EPbICpEVqCVTBiuj5T9+2fIzNY68mhXqZTeY5gNBhR0=;
        b=V8xNCWqZ6EjYM+TPBRxhP7bkSpglPFlRBLj0dYr/WIN4kdeoJPAc0fj5dFzwz0Gtvm
         6lqOolmZ/qRD2tNNdli/JZi0CrEu7zEFWy0yN55OE+gHK/z3HVsgg3e74jy4NMwPC1+b
         BscyIvaY2VAAadkTskAu0GWKBSIBFGC+f6kQrmCXOgdmPsoKFgtLrQiMOlIi8y/lGo1Q
         w9a3JXk+/QA68Tu8YvUfCH1g53ql+mWNQPwuXsKXFB1UQPWMwZ8xLwSXp5ccDJWpt39p
         7ljsZU/hdBh9RUDIy/MZ9GsEg0yP8oCF5GjRaCw4f08cREMlfaNAUv2sYwdGyy45I83N
         H1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EPbICpEVqCVTBiuj5T9+2fIzNY68mhXqZTeY5gNBhR0=;
        b=jMH6gsxcggsSbOceil+hhnQ5PUyfbdIYAt1/EfTc5JWJQh2wLBD0t1a/r7QHpb5+Jy
         kiLib7oAkno6j1N92RoA848Sw9JL8I/oc8DjgJyrOpX2ia7k4k9wZUlV/K+0et6O3Mj3
         O3rMerqGJjGryZzVSHw6Rv6bZRY7ds+u0HolnUKrXzVmPBTE6VK8mU2F2dpBPTDPrWeP
         jS154MVLLg8DmzE8J/gITlbETUbAKXHKbM5DKBoS0ILbqZgTWvSj5zzWlzpW+J44Plk4
         A9qDPFO2Io0jx8GdJ7u9gm7AvYwi+FxqG1026dBGD3A2Zd7F2gIp7XMZdY5FgE4OgVrP
         fDvA==
X-Gm-Message-State: AJIora+qVJusQN/n9jv+CZ+M7mOIjYvD2b03M48QHE8iz/MINMuFreuk
	QVtQ5hHcTOcBdcyaD3JaMz4FOkKJKH9vrg==
X-Google-Smtp-Source: 
 AGRyM1sGChpahvOi7EXKOyDf9GgqWOtDwL9I/a9o7k0kruZ+k+NSAEDAReoOw342x1b7CXcjbjoZPQ==
X-Received: by 2002:a05:6214:1c4d:b0:473:67a4:14de with SMTP id
 if13-20020a0562141c4d00b0047367a414demr9244318qvb.69.1657826100185;
        Thu, 14 Jul 2022 12:15:00 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 d11-20020a05620a240b00b006b253a6dd1fsm1966022qkn.125.2022.07.14.12.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 12:14:58 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/10] yocto-bsps/5.10: fix buildpaths issue with
 gen-mach-types
Date: Thu, 14 Jul 2022 15:14:46 -0400
Message-Id: 
 <73d79320adbd9eb106a73ade6866b62b379f9687.1657825809.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1657825809.git.bruce.ashfield@gmail.com>
References: <cover.1657825809.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 19:15:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168043

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    80f5207b5abd tools: use basename to identify file in gen-mach-types

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto_5.10.bbappend        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.10.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.10.bbappend
index 975d6c6565..bfb36e173a 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.10.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.10.bbappend
@@ -7,10 +7,10 @@ KMACHINE:genericx86 ?= "common-pc"
 KMACHINE:genericx86-64 ?= "common-pc-64"
 KMACHINE:beaglebone-yocto ?= "beaglebone"
 
-SRCREV_machine:genericx86 ?= "4d201ec392f149ecce321186ea5494a6e25e28f4"
-SRCREV_machine:genericx86-64 ?= "4d201ec392f149ecce321186ea5494a6e25e28f4"
-SRCREV_machine:edgerouter ?= "58eb61187e8c78dc0241b2b85cb7d2c958f0e1fd"
-SRCREV_machine:beaglebone-yocto ?= "aab4d3436476d643c68ac2efccb887a4386a35bb"
+SRCREV_machine:genericx86 ?= "80f5207b5abddf0dae8eeaa5e3bcfe0e23538e62"
+SRCREV_machine:genericx86-64 ?= "80f5207b5abddf0dae8eeaa5e3bcfe0e23538e62"
+SRCREV_machine:edgerouter ?= "43a7a15cfe433584b6065c2492b2a7f9be7954c5"
+SRCREV_machine:beaglebone-yocto ?= "3651cd48f159c3b2a3a60d645baccc9d34baed54"
 
 COMPATIBLE_MACHINE:genericx86 = "genericx86"
 COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
-- 
2.19.1



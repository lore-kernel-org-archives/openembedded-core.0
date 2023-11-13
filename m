Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91101C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 12:57:39 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.35986.1699880258415381080
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Nov 2023 04:57:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hpf5unXc;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-545ed16b137so6136852a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 04:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699880256; x=1700485056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UjOXX8sm6F/u6BsuX4MM03/dUzquBeE+IaFISFd1lCY=;
        b=hpf5unXccyGkvFmSJWAiOSZdCz7R74o1nmSJa4GzPizFEYn1OTKSp89+LqRyzcJuMs
         m6IMLi/ZjlMf64zbDnYie14IyLp/BMWXEnEhGxYCgtSgyEnkIL79dU6OXxz9cb8Nh901
         om/KKcDOr4K+JLuUAkzzy27SBo+eUAq8Cp3JYzX90fxo5RYk3yS/tQIpTwcp+7/ToUYD
         0uP1j0MEOfTArPOU3WBKhdx9PuEFkLgjAsVGTtqOTN8LtKPU2RoiSLIHx1fEqGWFhmEY
         JHYRsAKoz4liBBN3yOKsI8xLEuBipElhn7/ddeNsk8pt74Pt7EIWoFuSaakEIQnjJ61x
         Em6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699880256; x=1700485056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UjOXX8sm6F/u6BsuX4MM03/dUzquBeE+IaFISFd1lCY=;
        b=wZFJ417EqPNClmGIbB8kIaDj6hhknH3jMG1n5qCRBElXd/Q8x2POm/6f/VTGRtNGa0
         blfSeKQ3Rn3gEaqQ0L+kE60j1DFWYBOHT1Ezh5x0urtAvCeHxKnzhBNhd3WT/z7atWQV
         yMndioX2dKhhCF9n705cTkVFgEk3bWMvpvbzyJoSj8dniyBW6OxLrbddfVsILlGljDr3
         9zWvH3GqHk2QkOpZUp3Q6NKXNnWnVHYojIm90Spx22suy98WYb/701aewXfrDEkPjq/F
         s1OyWIyLVM7QGeEpJcfcWGiJOUYU0vmliU1aPDggRjBSO2tlwTmda5DNuCp9RJBmOtfQ
         IGAg==
X-Gm-Message-State: AOJu0YzAFkwAzGY9+UaORaW4nYLjePOth0hbuCr48a5QxNlnvN8eSykf
	lLqWc/MV/ndT1M6EpMxypx0A0w8ZqGs=
X-Google-Smtp-Source: AGHT+IEhQk3aP5sPrn0bvkhlqVPwPSKIIlFqusudy41Bq4pJJrzNEGf9nHL8BBBDvo726nDtnSzsLA==
X-Received: by 2002:a05:6402:8d5:b0:540:118:e8f with SMTP id d21-20020a05640208d500b0054001180e8fmr4829891edz.24.1699880255879;
        Mon, 13 Nov 2023 04:57:35 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id l16-20020a056402125000b0053e5a1bf77dsm3647645edw.88.2023.11.13.04.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 04:57:35 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] mesa-demos: Split *info diagnostic tools from the main package
Date: Mon, 13 Nov 2023 13:57:32 +0100
Message-ID: <20231113125732.379010-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 12:57:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190467

This creates 3 new subpackages:
* glxinfo
* eglinfo
* esinfo (for es1_info and es2_info)

These diagnostic utilities are useful without the demos.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb
index 12f41d75a5..789e816f13 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb
@@ -41,3 +41,11 @@ do_install:append() {
 		mv ${D}${bindir}/clear ${D}${bindir}/clear.mesa-demos
 	fi
 }
+
+PACKAGES =+ "glxinfo eglinfo esinfo"
+
+FILES:glxinfo = "${bindir}/glxinfo"
+FILES:eglinfo = "${bindir}/eglinfo"
+FILES:esinfo = "${bindir}/es1_info ${bindir}/es2_info"
+
+RDEPENDS:${PN} += "glxinfo eglinfo esinfo"
-- 
2.41.0



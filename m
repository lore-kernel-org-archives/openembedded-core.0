Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7CB1EE4992
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 19:13:30 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.2909.1692386008123230617
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 12:13:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=IWSW7Frz;
 spf=pass (domain: baylibre.com, ip: 209.85.160.178, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-40ffa784eaeso8303931cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 12:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692386007; x=1692990807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FSwWet3EnO7Um19NZ/4F78JROU3BIibS5BqGtQQjFU=;
        b=IWSW7FrzS7loDixknSqD9RpB7yizYd/mTUIRSBgO+qw02Ja7ZJW2NIj8A/3DtWyLQE
         iPg7DA62/bBxoSU805lWwTU2cttb5NC9CwTIV0zRGS/dhNMrO2Iua0+/1HTA+nmzJavY
         9y50B9lgN5kqm5WKALZr3dRJVUPtAYeH6MPEtOZ0yg3AMm77TbSS+R0zpdfCVQF690aE
         ixlkRWQHfRW2Umd/p/oNjRk8hmv9zbNLwMuF/sbDi/AssO429cdNQEd/1As1jYAn8qho
         EKiKWD0inepG4zeyyXRYlMMoYnMi2gTWMo9mt/3W8D4Mxjt5F6mi0tq3aF7JbXp/g7A+
         dR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692386007; x=1692990807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3FSwWet3EnO7Um19NZ/4F78JROU3BIibS5BqGtQQjFU=;
        b=cNN1GqJ87BGPN4l87kqAkddL0yg+kzcQgn459MoDOx3OjmHw5sc08RgQBAXcgzds2E
         b23f+zrvt6i9qjNGuTiNPSjVLETM00Ow2JR/InAzux9hmoV9KHV3XAF9n1O3ELLE1Z+D
         R2pqtSC75vhCBi31b/uP7AgoTHHhGRehcS2X5Y5QRjSgrqlbhiv414Br55lrNhjY63Up
         labIkfIG3c/pc0Ox8cHpLoyVCtikBRXXcGJ9nUVSQyDwpCwdlwGaBKXELInrU1CIfxso
         5xiCzHocgmn+y6H5d0RqvFggMADyn+NCX3IOtTG0RxkFi4F52DvL1wts7BlpwqMUoiiS
         4ikA==
X-Gm-Message-State: AOJu0YxAb+P7KpRpCuOwQcqmwbXFVrvahadW5Ve7eg+T1a9jnP9Bl3d9
	B8AC7oG62oSgSUeQjrDZvQl37ZhZOcx/EeoMZ9M=
X-Google-Smtp-Source: AGHT+IE5FIpwiWTKQD9h8ZabavdaRIynknayVGhvqEfw372LmkcmyAcu8t8PoPodGNaru5y0zNskww==
X-Received: by 2002:a05:622a:15cf:b0:3ff:2fae:b4bb with SMTP id d15-20020a05622a15cf00b003ff2faeb4bbmr142603qty.37.1692386006597;
        Fri, 18 Aug 2023 12:13:26 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id cx18-20020a05620a51d200b0076cb0ed2d7asm720732qkb.24.2023.08.18.12.13.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 12:13:26 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/5] python3-more-itertools: upgrade 10.0.0 -> 10.1.0
Date: Fri, 18 Aug 2023 15:13:21 -0400
Message-ID: <20230818191324.1959527-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230818191324.1959527-1-tgamblin@baylibre.com>
References: <20230818191324.1959527-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 19:13:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186394

Changelog: https://github.com/more-itertools/more-itertools/blob/master/docs/versions.rst

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...ore-itertools_10.0.0.bb => python3-more-itertools_10.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_10.0.0.bb => python3-more-itertools_10.1.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb b/meta/recipes-devtools/python/python3-more-itertools_10.1.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_10.1.0.bb
index e07d4b7860..be2a73c369 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_10.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "cd65437d7c4b615ab81c0640c0480bc29a550ea032891977681efd28344d51e1"
+SRC_URI[sha256sum] = "626c369fa0eb37bac0291bce8259b332fd59ac792fa5497b59837309cd5b114a"
 
 inherit pypi python_flit_core ptest
 
-- 
2.41.0



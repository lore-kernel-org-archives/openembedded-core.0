Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC30DEE4993
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 15:06:51 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.1828.1692630404541200409
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 08:06:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ROQxn+vi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3fe9c20f449so33300075e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 08:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692630402; x=1693235202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lxO9xQ/qoNJK4MVwZ7ej+0Mit7HOnKwD80rxQNO7FT0=;
        b=ROQxn+vi+oiiCdK/nFPPjeRTM+eUoZKBVIybuEhtX/VJ4o0lariTx2X+9HxpnT9yEx
         d8PtPUKXe1hkWYMBUv2xMpau9jvKko//cKsduxmtib5J/Nk3QbPKECWfyyUZZsLhevoF
         LyZjhA+Px8SFtl/Yx+2y0IUC4SHWh6VqdLm6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692630402; x=1693235202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lxO9xQ/qoNJK4MVwZ7ej+0Mit7HOnKwD80rxQNO7FT0=;
        b=gPFls+qwm2R5h+6QqgBtxS8xV0GiJdGVEPga5msZIKpPC4OUS9ixvNRXSazL7xkUck
         Th4BnbrzGXuZ15LbERTudcsNWrEW0QePxwYy62SrTz6/OuwQqXqBbQvTLkGnsU9IZeT6
         vNpUGo2v8IkBkLEUpneDEjVRRVsXO5C2sH+d60aFsvPHlB7mQbKyl+NYKZrsTqy+7d2W
         /9gDLezkGUzr2ZAHA6ADP6ZwCzjuZ0fiVydqAVg9wHZdwWWtyxZgO1HctrJ5nfovhouC
         56ukGuBQIlkC/dRSkBEaYtmXQPoDbqobPa5tm1OaSA0VCig/m/tbo1e6SFPUtsFzWJzC
         OVfA==
X-Gm-Message-State: AOJu0YxmVx8yG1JewXj6YC6ZdFNxxXUCKo7FUyNvkhQ8enp/6+q5esqJ
	hvuvFJpxQzX83v8F++00UL8ClFa6dEdTHphmfk4=
X-Google-Smtp-Source: AGHT+IH1JBBYChq5hYbuGt8oVE0sP4rjLjgBH0lAMhh/4JD+4OtJZoVLNeFJJ/KR7qsBeYRXFbOXFQ==
X-Received: by 2002:a7b:cb49:0:b0:3fb:a506:5656 with SMTP id v9-20020a7bcb49000000b003fba5065656mr5768850wmj.32.1692630402138;
        Mon, 21 Aug 2023 08:06:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d0e2:cd7d:2223:a8d7])
        by smtp.gmail.com with ESMTPSA id u10-20020a05600c210a00b003fed70fb09dsm11258561wml.26.2023.08.21.08.06.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 08:06:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] build-sysroots: Ensure dependency chains are minimal
Date: Mon, 21 Aug 2023 16:06:40 +0100
Message-Id: <20230821150640.1072927-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 15:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186449

We need to ensure this recipe doesn't have dependencies on others. The SPDX
classes/tasks introduce dependenies quilt-native and patch-native which can
introduce races on files in the sysroots. Avoid the races by removing the
tasks we don't need.

[YOCTO #15186]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/build-sysroots.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/meta/build-sysroots.bb b/meta/recipes-core/meta/build-sysroots.bb
index 72da88921af..1a3b692a1b1 100644
--- a/meta/recipes-core/meta/build-sysroots.bb
+++ b/meta/recipes-core/meta/build-sysroots.bb
@@ -17,6 +17,10 @@ deltask configure
 deltask compile
 deltask install
 deltask populate_sysroot
+deltask create_spdx
+deltask collect_spdx_deps
+deltask create_runtime_spdx
+deltask recipe_qa
 
 python do_build_native_sysroot () {
     targetsysroot = d.getVar("STANDALONE_SYSROOT")
-- 
2.39.2



Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAFA4C742A7
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 19:07:48 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.1882.1678302459548423979
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 11:07:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lfhXHNP4;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id d41-20020a05600c4c2900b003e9e066550fso1780409wmp.4
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 11:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678302458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0sUQ15/wOxOZunNFmL2ne7nwqLojjgaXHnrEqk23Zo=;
        b=lfhXHNP4Oi+1/Gzc93i7XojRKyq2w3qi1ZLefnF6GbyifluIWsrM5f9yiL81KBaB1Q
         GBlkDKnFIzHUMKO3/0I57eA8W7vN5Bhvm6mOGqJqdXuOIYHJZ31JdbV14TlsZF887q6R
         LCBfiAqu1KRtHkWI2c6CfNqXLWAp4CKYxmjN0+vOR/k+FOTOpgTtHilQtTqCGU/97jdk
         XYDdt8Ip7uuZHVsIGE/286TAzXL8vpi3UQO5EffM1YqT5nR16yij0XDoWqauMfAg5Q9A
         IDVV83H0Q7yeUqJnXumU1FwKPrSSRH6BLPbbY27zfZyLDumG76TCM38PfQZNTO9sA0jj
         cd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678302458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0sUQ15/wOxOZunNFmL2ne7nwqLojjgaXHnrEqk23Zo=;
        b=C9S8YRuQ2lOdTa1xjrFRWSuZbn9V0avblFbdFO9ebOLSE7tL+/mW+xGMAvOjfNhuTs
         lrg7uiolTRc+2mdPfLlIzfqQE78BSJa8ddkFj9GjJenu2rFNVUtPH7LD5HxseRppfMej
         vaTxm8Uy1unq+azz11UAzpWVETni4H3N5nrmLvptPDk2sv2LBGEiwxggiCsJH6OSLB7a
         bgBz9GbFZXUxmLHdsySz+TC2Gs85MilGE3Ez109aU9GMqCb6w3p2CARI8BEOYhlSdiBk
         +NdjXfKujkywksHWTrD4uklIGIbwh1k1AohKaBef0icWlJDbpX7ndG+KmmV2nzJhoLx+
         C75A==
X-Gm-Message-State: AO0yUKVC6WQKWpDB77+ZujqzBLsUoysffrUMcCapD9FQP/GknRV6yruq
	HB2N6XoKdsq1a7Fk/FO7S9Aw/E6s4q0=
X-Google-Smtp-Source: AK7set+Ru6GEj4K/5rQSwMz+zVF7gJFU3uSZYS+DxA3fYIcwp3Aa0Yjc7AgiNvPqBQh5+nfYu5moDQ==
X-Received: by 2002:a05:600c:1d95:b0:3eb:376e:2b9c with SMTP id p21-20020a05600c1d9500b003eb376e2b9cmr17105840wms.36.1678302457985;
        Wed, 08 Mar 2023 11:07:37 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id v9-20020a05600c470900b003db03725e86sm356177wmo.8.2023.03.08.11.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 11:07:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 3/5] mesa: allow mesa-native/nativesdk only subject to opengl/vulkan DISTRO_FEATURE
Date: Wed,  8 Mar 2023 20:07:21 +0100
Message-Id: <20230308190723.2570522-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308190723.2570522-1-alex@linutronix.de>
References: <20230308190723.2570522-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 19:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178192

This prevents accidental builds of it when native/nativesdk opengl
is not actually enabled (which may cause undesirable lengthening
of dependency chains or build failures because those dependencies
don't enable options required for mesa).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 8a8a057c6b..8690df0bc2 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -50,7 +50,7 @@ inherit meson pkgconfig python3native gettext features_check
 
 BBCLASSEXTEND = "native nativesdk"
 
-ANY_OF_DISTRO_FEATURES:class-target = "opengl vulkan"
+ANY_OF_DISTRO_FEATURES = "opengl vulkan"
 
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"
 
-- 
2.30.2



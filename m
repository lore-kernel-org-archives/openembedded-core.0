Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F01EED612
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 15:22:15 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.23127.1694791334986640556
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 08:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1z586tuD;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-26f6b2c8e80so1796864a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 08:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694791334; x=1695396134; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1QGQzwK2IQc1va+HjgkntCvUpJeru5/7B6EBMaxOuOc=;
        b=1z586tuDcLA0+FydqvcQWRYX+ca9oV1R+r3tQdTdG4WlX9r6BE0G2yYswB0G4+MXla
         uwx5dhYpGC42Rw20q5jF7uzEi1CIUbKL9Irs6lbDDPwTsrDNgPnoMA+mraa6Kd6z1j8S
         I6z2X1BP4j7as2iFDHoB1oLE1LfcALBXv8fAehnkF46YLip/nGsidtoAKLfWlPIcBtM4
         T13PMb9Ci62nxMjBkSELPeac52KVGywWykqOCFCalxjQzhmWS9kFVifeU+zd1uuik2Tr
         7ZjweXI6brMHvHZ+n46G0jHh33hINoIZZ8WL6AXx+NlRFH3fpKp0VOTuFvbnzGmYZ2Jz
         ehlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694791334; x=1695396134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1QGQzwK2IQc1va+HjgkntCvUpJeru5/7B6EBMaxOuOc=;
        b=cwWs0lT49W37PZQ7RdMZSKZjcLTRA+v8hk9MF/2ptZymDYYcXTYsa8wE0kaNr1aFRU
         KLk7aD0D747S0NWMd5uifCkNY2Xr7G4VlRGUMzveLrL/JBA7UiT4WjBqqQ+RbPnKia1Y
         SwiqVsJBl9fETB9PtNVWGq6s1UMCMQwi5I0EVlYdpPylI1bveswOJTXHL1eUttIJiQED
         iL37OkCPbuCl6SgA9+O/4/BhCnwfePrgrl+SfyxjsyhpswH/FtPPyvHFhQiXfCMkHxCo
         PiD9lefUlo0QMfxdMG8apQBkfDPAxza71UOIP4s7TTVqMRw3+jmZlKlpavwhC3y2JNmF
         K7hQ==
X-Gm-Message-State: AOJu0YzwpZ4btKSzsWVZUVEIhVZR0BmHDeh6fTnYj/rERyt8rfB+rcfj
	PLgL+XAnDr9StGoqK8UunAOE8IFVx0r5sfkay6w=
X-Google-Smtp-Source: AGHT+IHtwcTR36mpHufTs/G5rURbIMB6jwPOVc0k5SleQ9DWklt3OK3R/Npyhn7Lk+C6r6Bv820lQw==
X-Received: by 2002:a17:90a:17cd:b0:268:e43a:dbfd with SMTP id q71-20020a17090a17cd00b00268e43adbfdmr1903971pja.1.1694791334148;
        Fri, 15 Sep 2023 08:22:14 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id d21-20020a17090ae29500b002749ae93778sm1375398pjz.23.2023.09.15.08.22.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 08:22:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 8/8] cmake.bbclass: fix allarch override syntax
Date: Fri, 15 Sep 2023 05:21:46 -1000
Message-Id: <f3bd4120a53f25f02a5c843308c3d8c491caf1e5.1694790288.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694790288.git.steve@sakoman.com>
References: <cover.1694790288.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 15:22:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187676

From: Chen Qi <Qi.Chen@windriver.com>

The override syntax should be ":allarch" instead of "_allarch".

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bea74c9942a3bb4f71aca0f722b4a7306ae52fb4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/cmake.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index 2f5114b6b5..2153efe5c0 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -51,10 +51,10 @@ OECMAKE_CXX_COMPILER ?= "${@oecmake_map_compiler('CXX', d)[0]}"
 OECMAKE_CXX_COMPILER_LAUNCHER ?= "${@oecmake_map_compiler('CXX', d)[1]}"
 
 # clear compiler vars for allarch to avoid sig hash difference
-OECMAKE_C_COMPILER_allarch = ""
-OECMAKE_C_COMPILER_LAUNCHER_allarch = ""
-OECMAKE_CXX_COMPILER_allarch = ""
-OECMAKE_CXX_COMPILER_LAUNCHER_allarch = ""
+OECMAKE_C_COMPILER:allarch = ""
+OECMAKE_C_COMPILER_LAUNCHER:allarch = ""
+OECMAKE_CXX_COMPILER:allarch = ""
+OECMAKE_CXX_COMPILER_LAUNCHER:allarch = ""
 
 OECMAKE_RPATH ?= ""
 OECMAKE_PERLNATIVE_DIR ??= ""
-- 
2.34.1



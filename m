Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B2BBC7619A
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 09:41:16 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.8410.1678959670646066844
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 02:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RY05wDHn;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id cn21so5256777edb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 02:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678959669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0h/ycjSNTtNFiA8KIvGnLEj5WGEOZbfDQa3ZO+PLDg=;
        b=RY05wDHnPwqMg54oDcboaMpq7TQhaSeLNyaEg+A1s4vxaGN1bhD8vut6frq0JeZAWp
         XN5P6ILgy7LvxU9ECyjeW9hSaLkyVkhIggWBO5NNtzshVSME4bFgjwFcaLSJwjlwsphC
         8i3gXSlrTJlLhtG8uVSYOQmQkePId7S5ZR8grG39R2KNEFXOy5t/fd6cF3ilN9FAANNH
         bGy4IUox9xVaC9p28tmZ8JkN/hATwJwtuSTe+4GJyQNKHeWW00E8kqOIEkYT7fTVaBZO
         HuFdFr9cNgT9Spz/qLNv5WXsYj1ee/VteH+6fL9whfQxIgUekXb0kA5BPwupa5MRgXpB
         3SeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678959669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0h/ycjSNTtNFiA8KIvGnLEj5WGEOZbfDQa3ZO+PLDg=;
        b=5Dt9G2j4078iTHSB0X+4DHGWO/JgIQjSTzLE6SCU1aG97y3y2cHxFy17nSJMhztt1j
         1n1Nma2qsUbgwxwqEOiT8HV13fNLJ1ofW29qozXgu7z1YpKzdsNGnQiJrzhb4UM1eo4h
         sGLg4hwA1ONbmNqP0+VHKkVponPY1pdlXGBuupVFRgJN2NjFqn62OzBIkHLcXtMp9Ce9
         ecZal3wmUewEu4axDN5KD7tu7KX3xNdoGFdPahwDMZKBbFD4CwldjrO5WwlDaWYx6Mwv
         GMsJJ6LpPO8QIfutls5bVq/t5xmjcc2FBiqKT4ep6PCO15S/fdIpLTZ6nHyt8eXldwdK
         kDSg==
X-Gm-Message-State: AO0yUKXPifBwugckeo5q1s5cBQlozhFH4MGQ16DeXopVv+ANuLfMNGqV
	xD1T5XgJljfxSTQCtzYlQpWKKT0haRI=
X-Google-Smtp-Source: AK7set8aN9XLVgibNnrsD+IdteCJ9Qn5cD+ZF+ykR6ygjL/sl3n2aU2u1GTdMJlq48FzOb1f9BBTJg==
X-Received: by 2002:a17:906:1999:b0:930:18f5:d016 with SMTP id g25-20020a170906199900b0093018f5d016mr2213060ejd.15.1678959669000;
        Thu, 16 Mar 2023 02:41:09 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id lf28-20020a170907175c00b00923221f4062sm3621661ejc.112.2023.03.16.02.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 02:41:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/6] mesa: do not strip rpaths from dri drivers
Date: Thu, 16 Mar 2023 10:41:01 +0100
Message-Id: <20230316094102.2628727-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316094102.2628727-1-alex@linutronix.de>
References: <20230316094102.2628727-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 09:41:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178695

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
index dd15046438..b082b49400 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -247,9 +247,6 @@ do_install:append () {
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



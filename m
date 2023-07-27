Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961C7C05052
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 14:36:40 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.9066.1690468595469785427
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 07:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=iHMYHshP;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2b9540031acso16390611fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 07:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690468593; x=1691073393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4/4fLl8ens+z0gq4ROwzkVI6VIhMlQW66lrUlvPHbk=;
        b=iHMYHshPoLPTC2nnmAKb5hBhbwnO77474eowR9zC/1ICwhxsNUqfzxVl50lExkzGfk
         IWYv/nlU7xG5bckmxfcft7lKNs1SUYDWnML7iWhMFTxIklc/Jk+lqGZuHefiRkZZMhdy
         dn1mWDE3p5of7vysTGWiGG6Lzt77uPgoOVo2HsxuyhZFkr2x2TV5aY4Rz3b7oGnFCUXR
         cQwIEOT9++6SlRv7HmIE7SEuWMPsHvpim+/5miAhDxZ/I8KAtNg0jdai24I+9RxJvMmM
         V6EA4Eb2o6RwMsSHAt7FEoaaBLA8k3Pwjb6Hm8QzX528yE3eLO6gGUzh9eTKVSqqb2JH
         tVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690468593; x=1691073393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4/4fLl8ens+z0gq4ROwzkVI6VIhMlQW66lrUlvPHbk=;
        b=D+zg+h/PskmgDiudRogdBuY4xSHa0X5eG3b5hgdiZpCLkNfL0t6pTht7VvMH4NJtyD
         e+fjbEd7Y/LEDCHdr5H24N2AOzzaVXZKTD3IakkzhQQr5BOZ8z+ysk4iFGJJaND2m66O
         fS3qzvemw9RJwuBicgXSm6CVKImohBqEjgYBzD4xXE9mOfYnZAVI9FQpQwcVhscjTvxR
         t694zC2Sr9TNRJYnZUqNozmrFnGgTcEQI2nPAxJiKeWiCKoC/iG1Tj3oBsMfOHKuwDno
         1gWgl2+ubctlloT5Eyp5+4h+clq2cFlz2rtXU8USLU5yqmvVX4SZYWbKsterXrrjWikF
         ujAA==
X-Gm-Message-State: ABy/qLbNWHXVlI773RkTYKaY5pISydbdUlG5VM0fMI1Ih1SM0UYXH6C+
	7sz8cKCH67Vhp6dYzp3Dc1zUc4ZYT3I=
X-Google-Smtp-Source: APBJJlEfV6Ht55NovSYIvjNGexWyRefVVf7UuFLrikHHKtfOgmkLDKeUQAtmtDY1cTZ0P6FfEGjpCw==
X-Received: by 2002:a2e:9982:0:b0:2b6:a08d:e142 with SMTP id w2-20020a2e9982000000b002b6a08de142mr1870928lji.7.1690468593074;
        Thu, 27 Jul 2023 07:36:33 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m10-20020a17090607ca00b0099bcf9c2ec6sm846725ejc.75.2023.07.27.07.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:36:32 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/21] librsvg: fix upstream version check
Date: Thu, 27 Jul 2023 16:36:12 +0200
Message-Id: <20230727143627.3718496-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230727143627.3718496-1-alex@linutronix.de>
References: <20230727143627.3718496-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 14:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184946

- upstream no longer uses odd-even scheme
https://gitlab.gnome.org/GNOME/librsvg/-/releases/2.55.1

- x.y.9z versions are pre-releases and need to be excluded

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-gnome/librsvg/librsvg_2.56.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.56.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.56.1.bb
index edd7ad38fd6..76fd5ae2d51 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.56.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.56.1.bb
@@ -14,7 +14,7 @@ SECTION = "x11/utils"
 DEPENDS = "cairo gdk-pixbuf glib-2.0 libxml2 pango python3-docutils-native"
 BBCLASSEXTEND = "native nativesdk"
 
-inherit cargo_common gnomebase pixbufcache upstream-version-is-even gobject-introspection rust vala gi-docgen cargo-update-recipe-crates
+inherit cargo_common gnomebase pixbufcache gobject-introspection rust vala gi-docgen cargo-update-recipe-crates
 
 require ${BPN}-crates.inc
 
@@ -23,6 +23,8 @@ SRC_URI += "file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.pat
 
 SRC_URI[archive.sha256sum] = "1685aeacae9a441dcb12c0c3ec63706172a2f52705dafbefb8e7311d4d5e430b"
 
+UPSTREAM_CHECK_REGEX = "librsvg-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
+
 # librsvg is still autotools-based, but is calling cargo from its automake-driven makefiles
 # so we cannot use cargo class directly, but still need bits and pieces from it 
 # for cargo to be happy
-- 
2.30.2



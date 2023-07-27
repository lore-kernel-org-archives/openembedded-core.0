Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B89B7C3DA40
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 14:36:50 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.8993.1690468602430952476
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 07:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=n8HVhjBP;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-99bcfe28909so135974466b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 07:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690468601; x=1691073401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DftNgqTdSEYede+VPTw38jUod0Mk47cpgRMcepJqFN0=;
        b=n8HVhjBPsPjLra17hNMHWc+hLW3/h2LrA7kcir7ezRsv1JqZAHTJR+kO4aGzpU1an3
         uURLEbaZ3jRm814hbCufW0Fu8LFnp4mt+DMi99mWBndeNF3uoOcr1ZlOqvflmgKbgCT4
         M0HR9tvlH4zUywPq/HhjzuOg76eNMCx6UcNadSyzTXA6OyihttO0yPAlGGWQEDES6l02
         T7z1FdPVTysBCLwA93MdETwni+C2M0LxAwUYzcHGzY4n5fh6n1yRAq2jrMQX4JuAd3yy
         an0/jx9XgheDwGbApdWJ0ifgZm9sqqSlhb97B0H1JEUZXluWUTQMPzrjSMpjvoQ2SIck
         VNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690468601; x=1691073401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DftNgqTdSEYede+VPTw38jUod0Mk47cpgRMcepJqFN0=;
        b=FV72+hkolqgJs3aXpQIc1JnSprnxxvqfssPDrJok5QUpg0o7hlpgOFK8yWMYduLedU
         Kwccl/wLdz8f2+ElRfg7KkqGujAVrP4lbkyV78qwf0uyuxlHs+a14HM+1D3r03OtIGfz
         xVhCc6tmyzVrwIPwYAZX2iVBs9TPsjVPf4fMntwnflvtgUPVzxQjjM20dCwpNxbwgGz1
         v6Aw354jMKbFWIjtkZ2cvntPe6ugX2tl3dCTIPMueYy91AiEp7/kUjvAHs4SMMXeRMRu
         z0SwhN4xCfLBcfrVI03laoaYDkWltomyx6bdzuo2GJASsoZd5voJdSdpwGfMnOQW+6BS
         iNcg==
X-Gm-Message-State: ABy/qLZ+euXcvP45m0pHB98e5DgvNigZ+N47TZEBnx4TebeQPP6wE8z7
	QvzVxTudwrsHySjDY3l6r5pdUiPNvE8=
X-Google-Smtp-Source: APBJJlFbAwxFgmzSzWnPa/WW2ZrjPVM2q7yCXydOgE/B9dZ0/IXtdHziJ0uEW6Te+RIW0GHB548XRw==
X-Received: by 2002:a17:907:1dd8:b0:993:d7ff:afe7 with SMTP id og24-20020a1709071dd800b00993d7ffafe7mr2091084ejc.13.1690468600669;
        Thu, 27 Jul 2023 07:36:40 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m10-20020a17090607ca00b0099bcf9c2ec6sm846725ejc.75.2023.07.27.07.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:36:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/21] uninative-tarball: install the full set of gconv modules
Date: Thu, 27 Jul 2023 16:36:25 +0200
Message-Id: <20230727143627.3718496-19-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230727143627.3718496-1-alex@linutronix.de>
References: <20230727143627.3718496-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 14:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184959

msgfmt from gettext-native 0.22 is using iconv() to convert data to utf-8
from arbitrary source encodings (previous versions of gettext did not
do this conversion):
https://git.savannah.gnu.org/gitweb/?p=gettext.git;a=commit;h=5412a4f79929004cb6db15d545e07dc953330e8d

As this is happening at build time, and the source encodings are specified by upstream projects
 in translation files, we need the full set to cover all of them.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/meta/uninative-tarball.bb | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
index 4aecf39b890..7eebcaf11a4 100644
--- a/meta/recipes-core/meta/uninative-tarball.bb
+++ b/meta/recipes-core/meta/uninative-tarball.bb
@@ -3,18 +3,10 @@ LICENSE = "MIT"
 
 TOOLCHAIN_TARGET_TASK = ""
 
-# ibm850 - mcopy from mtools
-# iso8859-1 - guile
-# utf-16, cp1252 - binutils-windres
 TOOLCHAIN_HOST_TASK = "\
     nativesdk-glibc \
     nativesdk-glibc-dbg \
-    nativesdk-glibc-gconv-ibm850 \
-    nativesdk-glibc-gconv-iso8859-1 \
-    nativesdk-glibc-gconv-utf-16 \
-    nativesdk-glibc-gconv-cp1252 \
-    nativesdk-glibc-gconv-euc-jp \
-    nativesdk-glibc-gconv-libjis \
+    nativesdk-glibc-gconvs \
     nativesdk-patchelf \
     nativesdk-libxcrypt \
     nativesdk-libxcrypt-compat \
-- 
2.30.2



Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A23FA3744
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 20:16:30 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web09.2176.1666901786417403665
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 13:16:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aIXsSdMn;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id l11so3582322edb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 13:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Lley6NC407TtT3Ju+u4rORDzFSyui9SuFIJ/337aGM=;
        b=aIXsSdMnybrXWs7zgD47b4+4GUB0O6xi2kmN3DHj/Jr+WN9WLuoUCWaQoK9Rz1FmDl
         yFjOihdLIKr2F2HDjzf9jNuGW9B61bjzYDtd3fq2uPwGSpAV+0voYyU91fWuhgW/r4lF
         m4Bak7yqolYd/16v3qzxZJIueGi0rXehbZe+7/iKGi4/VqE4BTrvbAgBXVQXSMyZxVu3
         mHIIco9J9r0FOpy9Y7RHq5YLyy5RoUynqASQZKsv92f7AdKfgpvG2oo4ysvliMjcxjXF
         fUglo6aLCjNvz+BwBEVRwb8rT/FUyFgd/mN+tawT1Vptl7bkEmkvnM4ZS7WUeEitZRqc
         gKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Lley6NC407TtT3Ju+u4rORDzFSyui9SuFIJ/337aGM=;
        b=m9LqlvtYKHIHHIDEGBmZRYnMgLqt1ORFazcevZMsZEoRwizhNjyhwWIerxzK8eb8ZK
         4iRSKzy2f7kCNV8No7yM6p1AaSRwC1nP8moFUDH6/ZQ4xKMbEwBVk4JA3uuZuzn1gwbR
         bXdNC2M9w2fPZcZqJ6aE3UyaZXVlNbP9WmO307yjaIiyywR3IFabliSPoFLIRW5OqXlC
         hMofziZmzyRIeO2vDv2JObxdNI/CgKv+WVF5l/371gLCLRiIpwwVgVoH4Hxx3vEKneND
         6xORtwIo2rkQ3dY1IZuMy9blnzo9jUoJHdOiIRMNV3O99McYveHZv5YJsnSVX1zErFCL
         9pyg==
X-Gm-Message-State: ACrzQf05rR+2klAT0ntWmMR4Mv0G1udnBi7yCk2eLiorFJwbpuivfbWl
	HTTW5fmAdWK1WCwQpJfeRHdU1rPpdaO4UA==
X-Google-Smtp-Source: AMsMyM4ACqPEurFmNMTIdxMCeNM8IPB42F4nFSkUPXO61+GlSFr9gW1y5467t5P83M7kTOXd5NkwYw==
X-Received: by 2002:a05:6402:e9b:b0:454:351c:c222 with SMTP id h27-20020a0564020e9b00b00454351cc222mr47742863eda.216.1666901784842;
        Thu, 27 Oct 2022 13:16:24 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id la19-20020a170907781300b0077b2b0563f4sm1267225ejc.173.2022.10.27.13.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 13:16:24 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/23] gnu-config: update to latest revision
Date: Thu, 27 Oct 2022 22:15:50 +0200
Message-Id: <20221027201611.3644334-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221027201611.3644334-1-alex@linutronix.de>
References: <20221027201611.3644334-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 20:16:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172206

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index faeb5fce94..e298e31714 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -9,8 +9,8 @@ DEPENDS:class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "02ba26b218d3d3db6c56e014655faf463cefa983"
-PV = "20220525+git${SRCPV}"
+SRCREV = "20403c5701973a4cbd7e0b4bbeb627fcd424a0f1"
+PV = "20220927+git${SRCPV}"
 
 SRC_URI = "git://git.savannah.gnu.org/git/config.git;protocol=https;branch=master \
            file://gnu-configize.in"
-- 
2.30.2



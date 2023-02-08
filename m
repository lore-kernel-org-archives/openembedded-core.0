Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F989C64ED8
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:04 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.3145.1675840917714604858
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:21:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mzvL2FGE;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id u10so9596535wmj.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBLgmgbCE3SakmPnq01Fo0l+0WPjOnkGAoqoYBueydM=;
        b=mzvL2FGEAiCiRhv269YsURpPIN5NZ9Ti9B7+Z0CeNTGQ6ZZjPqSPrpXREOuBaLUty4
         4YOaCFnjrPoEK7MNBWSXpE0Wp6N2gnpo/WXJh9dTEIkw0+42OHENiS5MPZLSnpQnlQWe
         PaW8aunDpncOKW23eJ4/G01K1SLgOk6G79UAR6rm2Bw7rRLa9gZvmYZ/iymWZDD/DaL8
         MPeBDpEu9R22yWpARmOeMSMKexLMuoxPUluaLFzsYiEuiO29gErAaykTu7uh8fbQ6mzi
         pJGnGkaykAcIXB2bEE15YLQ0lGPJz5RnkOhzGDyQfcEUhGsuqb3iyi06/b7AFnVcRrBb
         vqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XBLgmgbCE3SakmPnq01Fo0l+0WPjOnkGAoqoYBueydM=;
        b=MpiLUVZUEtA107rdYUrJ/JkRs1HJZ/B3t8vdqeSk+zcUyOIGUf4dekpfaFDpzp7UFr
         4eSQ9zWcqQ+Sge1rKsJzrfh/bjBJBw8jkpxttXp2gD4sduq1kI29X7vE47SLYb/xeGpJ
         uzY1BITcZnYcwMFC4VJ/frBQokfKnTEQ+YS3/tZ+UV2WeyMB6CyeCvmNO4W7PAtOgJdH
         b0is54qbxYKgOcT2KvDI4r7ZOV/7GGUqf4MT8/1Ol5lmSsq02BuyiSWQZ1/qceVbX3rv
         6qjDKFRR5CgXEOl4zBkfNWMjvhauucasm3t6WPvO7HT1RU2pQVS2zwg7IeCZczLDPTYZ
         Db9w==
X-Gm-Message-State: AO0yUKW7K8weu/Gn5q2Ts1XSjN5DDp+kHNK9VdeuEXVsu1gZ0+Y6VcbD
	x/uv2i2iBX2LttxYWkZMUb7FTKgbMQE=
X-Google-Smtp-Source: AK7set+LtiCCD47U4qnWfWo12sk5LRclUZilLDpjAOaJWZDhA9hkxp/2O1vx3yTCNHt1xCP2LvgPWw==
X-Received: by 2002:a05:600c:3d8b:b0:3df:fd8c:8f2f with SMTP id bi11-20020a05600c3d8b00b003dffd8c8f2fmr5541231wmb.40.1675840916262;
        Tue, 07 Feb 2023 23:21:56 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:21:55 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/52] lsof: upgrade 4.96.5 -> 4.98.0
Date: Wed,  8 Feb 2023 08:21:06 +0100
Message-Id: <20230208072143.2930292-15-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176855

License-update: switch to a dedicated license file; the license terms are the same.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../lsof/{lsof_4.96.5.bb => lsof_4.98.0.bb}                 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/lsof/{lsof_4.96.5.bb => lsof_4.98.0.bb} (87%)

diff --git a/meta/recipes-extended/lsof/lsof_4.96.5.bb b/meta/recipes-extended/lsof/lsof_4.98.0.bb
similarity index 87%
rename from meta/recipes-extended/lsof/lsof_4.96.5.bb
rename to meta/recipes-extended/lsof/lsof_4.98.0.bb
index 9f80176ee1..2f234cc5b4 100644
--- a/meta/recipes-extended/lsof/lsof_4.96.5.bb
+++ b/meta/recipes-extended/lsof/lsof_4.98.0.bb
@@ -4,11 +4,11 @@ Its name stands for LiSt Open Files, and it does just that."
 HOMEPAGE = "http://people.freebsd.org/~abe/"
 SECTION = "devel"
 LICENSE = "Spencer-94"
-LIC_FILES_CHKSUM = "file://00README;beginline=645;endline=679;md5=964df275d26429ba3b39dbb9f205172a"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a48ac97a8550eff12395a2c0d6151510"
 
 SRC_URI = "git://github.com/lsof-org/lsof;branch=master;protocol=https \
            file://remove-host-information.patch"
-SRCREV = "898916d4c7c390ea4610aebaf1d32b8a3c49f26b"
+SRCREV = "546eb1c9910e7c137fdff551683c35a736021e05"
 
 S = "${WORKDIR}/git"
 
@@ -38,7 +38,7 @@ export I = "${STAGING_INCDIR}"
 export L = "${STAGING_INCDIR}"
 
 do_compile () {
-	oe_runmake 'CC=${CC}' 'CFGL=${LDFLAGS} -L./lib -llsof' 'DEBUG=' 'INCL=${CFLAGS}'
+	oe_runmake 'CC=${CC}' 'CFGL=${LDFLAGS} -L./lib -llsof' 'DEBUG=' 'INCL=${CFLAGS} -I..'
 }
 
 do_install () {
-- 
2.30.2



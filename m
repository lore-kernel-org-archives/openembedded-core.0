Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 286FCC4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:16:19 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.30683.1668892577955540849
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:16:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=DyfHB6Jx;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so11216379pjc.3
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XpppwvY6m1UPN3NxOdNNvUb2eaByha3isTBX5c4V5og=;
        b=DyfHB6JxHV8Dc38kJVUa4eNRa85G/L2Z8F5aCY2QVPSIDnkgxkGtsEblWOKJY4Lduu
         Io6n+9c1Pgpx2ztHU5rh805a5/E/51/bH7I1Q/nxT7BwA4DgloSEIoYCwcc/lDybpNqU
         imuUIR51FOElP3xZiPuVrevD8pgLxrhEl67XENnbTKUGcdtl2yM98LZ9FT+9lbQSoyri
         p0OcJNxO4GwABk9vaEejUOiqyU7LM4O9uhpsELYSCkX/SUh4zdy27HfY7dt+f5tx+yzt
         zCwWJJgflcTpDGLKjRKZCOnuegjftTL+0kzsWjVXrMdLOJ5o4jlRehGwlBe/8VkEnwvP
         0UVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XpppwvY6m1UPN3NxOdNNvUb2eaByha3isTBX5c4V5og=;
        b=LDkcOphExJ3adlu85XezqhYoZa0tYULtKJKTfnAVdmwh98S38EzBzZqiVIoMTKM7ZP
         uCcDyY09wp3pzbvxdEBiWDqb3BaMsObXCXJ3EkhHrVlaa0UJm/dkBTEeIoNWeD4DuTbc
         wEC49BR+xyW2ojuIOb8j7ojAp2Lc4EE2PS261t271ZOUWCFh8KrT/lSfNWODUKvev+CJ
         XriOOH7EMAxgT90Ajk8V8Vqfzp5o1z2U6VSAx1YfKB8DBXmKdz+Pk6FgByTDq6JrNTl5
         D1aEIlejnEe3FkcZ1eAAz5g+6XXy826DRILGL1w9Dw/GXqfBvLGnff+Ur8Ku9+Q18ROA
         J5+w==
X-Gm-Message-State: ANoB5pnKEProJ1RXqsjvPru1txpPdP0ZM165VjrzRHLlJgT+2vVga5SC
	w00zjdNvWfUhhxqwkE06rdqI1maW1MTwHtxkKj0=
X-Google-Smtp-Source: AA0mqf4HAgPzbKbsfXiafOIuQw4WgsnPvZZzcrm0VNV9MTN2KJYw+AH3kb3Tyf4OaNtWs8Tp/cBcFw==
X-Received: by 2002:a17:90a:7402:b0:209:853d:ec6 with SMTP id a2-20020a17090a740200b00209853d0ec6mr14212290pjg.29.1668892576849;
        Sat, 19 Nov 2022 13:16:16 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.16.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:16:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 29/35] kernel.bbclass: Include randstruct seed assets in STAGING_KERNEL_BUILDDIR
Date: Sat, 19 Nov 2022 11:15:08 -1000
Message-Id: <69db1b345725af88088b57b0c696eddca5ca2d96.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:16:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173569

From: Diego Sueiro <diego.sueiro@arm.com>

When building with CONFIG_MODVERSIONS=y and CONFIG_RANDSTRUCT=y we need
to copy the build assets generated for the randstrutc seed to
STAGING_KERNEL_BUILDDIR, otherwise the out-of-tree modules build will
generate those assets which will result in a different
RANDSTRUCT_HASHED_SEED.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit b36303158b2e0273ff415bdedefb379f680b30fc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 7bb3449223..3834a42fb9 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -591,6 +591,22 @@ do_shared_workdir () {
 			cp tools/objtool/objtool ${kerneldir}/tools/objtool/
 		fi
 	fi
+
+	# When building with CONFIG_MODVERSIONS=y and CONFIG_RANDSTRUCT=y we need
+	# to copy the build assets generated for the randstruct seed to
+	# STAGING_KERNEL_BUILDDIR, otherwise the out-of-tree modules build will
+	# generate those assets which will result in a different
+	# RANDSTRUCT_HASHED_SEED
+	if [ -d scripts/basic ]; then
+		mkdir -p ${kerneldir}/scripts
+		cp -r scripts/basic ${kerneldir}/scripts
+	fi
+
+	if [ -d scripts/gcc-plugins ]; then
+		mkdir -p ${kerneldir}/scripts
+		cp -r scripts/gcc-plugins ${kerneldir}/scripts
+	fi
+
 }
 
 # We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
-- 
2.25.1



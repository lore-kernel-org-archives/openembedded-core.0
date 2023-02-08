Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E19BC64ED6
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:04 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.3125.1675840909917555521
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ImSEkNee;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso717222wms.5
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcJDrNa9R2GfZ5zlKBV0CWBBdruioM8s6sKeGP2EMA0=;
        b=ImSEkNeeroO1CfKgdsc2QPLV3HEa/88dlhXtzOJi5xL/M5uqf2JsuOknjrxOtaPJ1r
         HiZ7jgBB9Gmn/ldLcSZPeIuf9mawPE0NBpHOwMpvlScMywr5b1K0M/bDFwq9K65JiqGf
         AMQf+hr9Pf5L93R0toPcGnp5z1tz7aSx9hsEMvokNBBdSJ1oUJWqoIJDy64CHD2TwVRm
         3JDUR0rOB9NifK/zx4RBHiewXqmsl4vawLY0cbZANSMlf0w25gL4SZXVCGmq4PXPvr1K
         DzkzgikDMX469ABOCcaTyaVtMf2xS7OcE2jSIQ3DyWsCw6zA6p/8Hx6KOaRL4+tzdgxQ
         HfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TcJDrNa9R2GfZ5zlKBV0CWBBdruioM8s6sKeGP2EMA0=;
        b=aPEBznGt44EDa6R2S3exmxfo5Weow6IW9EKuqrVzKTbQf6EDSFMhqp5HDbUXtp7nT/
         rqgvVmNDlJpaZNp/o//EhnawpAplhrYV2AMnbLgNKXQhxPPjUl7hc0ZK/kxadKgywL6U
         kE+JjIun7bRXgUSihnjAs65FrX74eTeGwEFE6Sv3FmgYb3MWgnFnw0caM4yDyZycutwM
         uWiyuTueL/sZysckLIb0+0/x4eTg+15OSW4D7FBAr++Zm/13shqtxe6/+albitRjKpWg
         4RT33pb4Qmk+WYvhnLap3ySiAGqCbTNhP8psoN4erIogmoXwPqiFXR1yHk9e8Y/iT+oK
         IIug==
X-Gm-Message-State: AO0yUKWq54yXOKXGFYLmylf8k0l0F8XO0HMdaVrdlIdgoUlTnl8hvR2X
	/oFaKqMhABk2dPnNQhp9Go62SwW4+CQ=
X-Google-Smtp-Source: AK7set9hdrAipqOT6kGX5DxhOn+dFh3UJN2ftP7xom2zqA0+jGJ+hP66CT3Y7PMXeHTDAx1+SmRdrg==
X-Received: by 2002:a05:600c:4b1b:b0:3dc:5987:fe9 with SMTP id i27-20020a05600c4b1b00b003dc59870fe9mr6229167wmp.2.1675840920884;
        Tue, 07 Feb 2023 23:22:00 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 23/52] libxpm: upgrade 3.5.14 -> 3.5.15
Date: Wed,  8 Feb 2023 08:21:14 +0100
Message-Id: <20230208072143.2930292-23-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176862

License-update: additional copyright holders

Disable reading compressed files as that requires compress/uncompress executables.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/{libxpm_3.5.14.bb => libxpm_3.5.15.bb}          | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.14.bb => libxpm_3.5.15.bb} (73%)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.14.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.15.bb
similarity index 73%
rename from meta/recipes-graphics/xorg-lib/libxpm_3.5.14.bb
rename to meta/recipes-graphics/xorg-lib/libxpm_3.5.15.bb
index 2740341807..32a2b35356 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.14.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.15.bb
@@ -11,16 +11,17 @@ an extension of the monochrome XBM bitmap specificied in the X \
 protocol."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=51f4270b012ecd4ab1a164f5f4ed6cf7"
+LIC_FILES_CHKSUM = "file://COPYING;md5=903942ebc9d807dfb68540f40bae5aff"
 DEPENDS += "libxext libsm libxt gettext-native"
 PE = "1"
 
 XORG_PN = "libXpm"
+EXTRA_OECONF += "--disable-open-zfile"
 
 PACKAGES =+ "sxpm cxpm"
 FILES:cxpm = "${bindir}/cxpm"
 FILES:sxpm = "${bindir}/sxpm"
 
-SRC_URI[sha256sum] = "f7eb8f69c039281def8258ae6859adb5f050fbe161ab3d6a2d6ef109a603eac2"
+SRC_URI[sha256sum] = "60bb906c5c317a6db863e39b69c4a83fdbd2ae2154fcf47640f8fefc9fdfd1c1"
 
 BBCLASSEXTEND = "native"
-- 
2.30.2



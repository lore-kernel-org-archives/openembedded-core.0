Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93AB3C4167D
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:13 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.7353.1651727168043759264
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PeJCaXmM;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id g6so6577031ejw.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BbpGblxMs2gsJAKGf5a2oBFLGtEFUvMDhB35plX1dYA=;
        b=PeJCaXmMkAh8Ut90uqIM4W6TAKqrqi94kZJvQpewUDXppXyRWX99wzGd5yyRZq9uAK
         OzRO1pvAKniWeXfEGKeQBXc36cBHeussAYlsPvEBpGpxVBpYkYkfyOwF33Dd83w2TwI3
         GnhdAzJU33nbrWGvNeNcIh+OtGjGHiTCD438l7IzffT2ogq1jTsPgv1W1oCqYKnJYUxv
         lclPSyeIyJzVz2CUkukpaJHU30t8RnO8qOxuJhrpTxxQ2op8NcQGwzw1cPuvhlR7zj4x
         GbLDnz6EZUYxD1tIbYhwf1eSYzOuPu+fLE/cHDUARQrwgJ9VztVbDgVhM7Ac4vvOQXdw
         Yl8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BbpGblxMs2gsJAKGf5a2oBFLGtEFUvMDhB35plX1dYA=;
        b=Jo08VmpGzfjV6vxHmM9zC9CR13hcif3uJmmVSR2QYIMauydStafHRWswL4WybH/Aol
         pfrBmJprdMx7q/M7H9n50mjPI13hTQDUdRHTyJNrZNd51z+07kLGHyQDB102t8OKJjMQ
         K3KpTPkU+kyegEfXrl33tLL85tEmUGpJRpVERJPFYCOKrW7wPfdsqel/RMn6+xsPWeOM
         yUMMmrckf2i0Uw+pO7BdFJeWyYOLnTBxb8fy/+epzv2iGplxsontc0LcEoM0aaGBKhHN
         low1ykweWcsxnRK9VJ9pUg174m/cJP5/d9vguleCKnSK0CUjFXKZZquFCWGwhaerHP+t
         oGKw==
X-Gm-Message-State: AOAM532mMquJsZ0tH9LEPGYoWATswPBSeCT57PrEntxtfmsNR2KJ11Kw
	2JaIyUe/+MbwfxhJXoiO/KGB1bxpkf4=
X-Google-Smtp-Source: 
 ABdhPJymu4jl3XBCvv/sGyocp7J6PpnRzDqdjr9xRNLQX2fElyLYf9MAmTXOlsUva060+Evf0HIieQ==
X-Received: by 2002:a17:907:3e21:b0:6f4:6c7c:c781 with SMTP id
 hp33-20020a1709073e2100b006f46c7cc781mr13951125ejc.735.1651727166621;
        Wed, 04 May 2022 22:06:06 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 25/61] libnotify: upgrade 0.7.9 -> 0.7.11
Date: Thu,  5 May 2022 07:05:08 +0200
Message-Id: <20220505050544.651895-25-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165255

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libnotify/{libnotify_0.7.9.bb => libnotify_0.7.11.bb}      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-gnome/libnotify/{libnotify_0.7.9.bb => libnotify_0.7.11.bb} (89%)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.11.bb
similarity index 89%
rename from meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
rename to meta/recipes-gnome/libnotify/libnotify_0.7.11.bb
index fa3253b616..54f3e2c9ba 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.7.11.bb
@@ -22,8 +22,7 @@ inherit gnomebase gtk-doc features_check gobject-introspection
 # depends on gtk+3 if tests are enabled
 ANY_OF_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'tests', '${GTK3DISTROFEATURES}', '', d)}"
 
-SRC_URI[archive.md5sum] = "ccd9c53364174cc8d13e18a1988faa76"
-SRC_URI[archive.sha256sum] = "66c0517ed16df7af258e83208faaf5069727dfd66995c4bbc51c16954d674761"
+SRC_URI[archive.sha256sum] = "dd5682ec68220339e11c5159b7e012204a318dd1b3683a09c482ca421ab07375"
 
 EXTRA_OEMESON = "-Dman=false"
 
-- 
2.30.2



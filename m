Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5339CCA480
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:44:54 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.51637.1658306688917300151
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:44:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hjuXBBNO;
 spf=pass (domain: gmail.com, ip: 209.85.218.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id bp15so31836712ejb.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2LZbh2n6wJewd1qHzRKe1C1vfxdEwO49MSUBoSRo/J8=;
        b=hjuXBBNO82SXo9sndKIVloJoXdemyUIkLjJOLJ3Zs2BjGOCIisHSEb4ErkDw2Hv4qS
         uWf8DZrErPLJ9cCo5qpD2sLMhT9fMskmy9hMWRp6iE19WYc5amRikQ05mks90PZw4mAU
         mvyDUJR0+144jZKNJ9Q713PpfxLxEkfK+6dwIVbIUQ9MaBIu+5fDXk4yj1ft1UNnXvL0
         W3+rKiXSu7h10/GNd2awq8INeErVY42Ur4PSmkrUfrb3UY1zvX+I2pveDYHFvjeT2zxj
         7/bEc6b+Au30tTNjunnNuSEgFiAKqunkJwS3dnJ9McjqYuJKCBEhd26ybygHUa99az4Q
         3lCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2LZbh2n6wJewd1qHzRKe1C1vfxdEwO49MSUBoSRo/J8=;
        b=FvEZhaujRx6rUSwKKCyYoSoFwkfxJaHo19d1PsK4cp39HV5nDn7vsM/JpacHzf5/S3
         /zCzFXDLq9yd6lVCRswFmtZCmHBpAcUgU1hr1Fv8yXRaLpGsyBJPjBVgUUg/eOaRehKT
         MHqByrp6FuXrAGW73NiWmbcuHzdcOizWEOM2U+KKBmUYb1ReG54LrDtfUqCAwSqaqtWi
         MZnTAPgXXhTmckkG1N3CK6E57NsupSmk0vkkp4hh6EeydD846I7AEx3/7+A3SYGNGVh7
         Nes37WtGUE2iHRVVtOdJxVwwbuMRDcsorV9YxQzmAN04fUml/j1BXcaTx6SycsXKaDDS
         8miw==
X-Gm-Message-State: AJIora/M27b2aeXOv2WZ23Ul3DBstLIxNTEQrNWUg2KiskV9MR9qrsPM
	8LNnKGPwMpaXXkxV/b9EUsHHARFX0uI=
X-Google-Smtp-Source: 
 AGRyM1vHCXxN8LSCZURlsRrNmDhKPlmLv4+TBxiuRDfMy2P1d9bppdW4heVwH9ordLd0cTk95wS9rA==
X-Received: by 2002:a17:907:8690:b0:72b:552e:67c0 with SMTP id
 qa16-20020a170907869000b0072b552e67c0mr33486024ejc.600.1658306687339;
        Wed, 20 Jul 2022 01:44:47 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:44:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/51] gcr: exclude x.9y versions from upstream version check
Date: Wed, 20 Jul 2022 10:43:53 +0200
Message-Id: <20220720084442.2940187-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:44:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168296

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-gnome/gcr/gcr_3.40.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gcr/gcr_3.40.0.bb b/meta/recipes-gnome/gcr/gcr_3.40.0.bb
index b6e591fb6e..0c2af42f06 100644
--- a/meta/recipes-gnome/gcr/gcr_3.40.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.40.0.bb
@@ -16,6 +16,7 @@ CACHED_CONFIGUREVARS += "ac_cv_path_GPG='gpg2'"
 GNOMEBASEBUILDCLASS = "meson"
 GTKDOC_MESON_OPTION = "gtk_doc"
 inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
+UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>\d+\.(?!9\d+)(\d*[02468])+(\.\d+)+)\.tar"
 
 SRC_URI += "file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch \ 
             file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch"
-- 
2.30.2



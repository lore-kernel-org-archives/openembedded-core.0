Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39999C3F2D4
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:25 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.51383.1658306706167762581
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kuqBEYS0;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id t3so22903969edd.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XZkR8Ci9CBIl2ED+zAXrVp1vpgbj7KqzKJCZPOE8EoU=;
        b=kuqBEYS0+wI40BPMZUSA6SRPB6m2HGEWyDiJoIl1Tvx/G+0ij1d5VaHnkKeQN6fykI
         0rKNdNruhaCWj2xOw/W9ZimgKaa/A/Y3p04C6kgQUAccarBbAsp66n/dKvp2wpYF5V1P
         G3wnX0Ge/ZeZstg52xkB0qSbJ+t9GAm/8wLXrYYYIUU75Atw3R/hMNkW2aYjVR+ntYSu
         9AAb54rpXW+RZjpj+pketM4TnbaiOnQPdBVJwPWQsBbXDg8KBe2vT/cXtQIjEkDEI6zE
         dgmv7m8Q2ud7HKQtXXBNfPbrPb7reN3pf10R6CvyCCH/87ahlXLTS+CN9aB2QM4Yq7jD
         w4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XZkR8Ci9CBIl2ED+zAXrVp1vpgbj7KqzKJCZPOE8EoU=;
        b=KO02SIdW7EpV/mkH0f1NThoQ+vbG7gO1+mkzqM6RMgGrTy+FsQ65CyJ7r3vsG7kV4T
         fBSSU0D9nngf8hGn6QdFl9yg+Gd3Ka+5ZMjCG/LpVobGvd8fVOJa6mrlyfb1EitZgF64
         dvLywvGpnZ4qhL/KxqbXAtUkiK663TXgN71nJyYJ/flj3EeTAGgB17LTDMiDWfd6Etjm
         9o6lRWfPdX+EKv6A5de+nONyZ3XmxX0Yk8lNH3GNDs1tI2BknrQ8h/TrI+LZDpvGd4b/
         wzwidORxHvEy72mpYRnO4sJ3xni3QFekBcBBe/0vtrGqfMNn0ZU77QHjgs1w1wOu2Jf7
         aSrA==
X-Gm-Message-State: AJIora/nId65k1lWPXEo4Ur0rlfp3MlkeRJEphCbF+EG69+NdmbaQlLt
	4fxMvOYEFL96+CHVMvN429pRpiqRr2Y=
X-Google-Smtp-Source: 
 AGRyM1tbdLigP1BvqKFArERCRIYYKkqYRdRxnAypF78afAxQVt+goOSu0GQSpFzlirWFiCId83/nAg==
X-Received: by 2002:a05:6402:e93:b0:43b:6a49:7e88 with SMTP id
 h19-20020a0564020e9300b0043b6a497e88mr16817020eda.132.1658306717928;
        Wed, 20 Jul 2022 01:45:17 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 29/51] libhandy: upgrade 1.6.2 -> 1.6.3
Date: Wed, 20 Jul 2022 10:44:20 +0200
Message-Id: <20220720084442.2940187-29-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168323

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libhandy/{libhandy_1.6.2.bb => libhandy_1.6.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libhandy/{libhandy_1.6.2.bb => libhandy_1.6.3.bb} (95%)

diff --git a/meta/recipes-gnome/libhandy/libhandy_1.6.2.bb b/meta/recipes-gnome/libhandy/libhandy_1.6.3.bb
similarity index 95%
rename from meta/recipes-gnome/libhandy/libhandy_1.6.2.bb
rename to meta/recipes-gnome/libhandy/libhandy_1.6.3.bb
index 8d9904637f..01ca699d04 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.6.2.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.6.3.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=libhandy-1-6"
-SRCREV = "f050453109db05621b9a47b9931fe1b571905e67"
+SRCREV = "2885c314c9c84037b6fe55ead6a232e60ebfc9c5"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+))"
-- 
2.30.2



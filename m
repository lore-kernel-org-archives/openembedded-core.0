Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09ACCE79A8
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:24:41 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.16343.1695367479946535968
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gd6wXAwK;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-991c786369cso229303866b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367478; x=1695972278; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/FsUHPH1jeDeoPCTPP6Hz8Wu2lqcTKPHqA7PTMwiQY=;
        b=gd6wXAwK4EGAbL91E25cIA+DmK2rrxlGrvVvV4qDCcPVXOAuG4oXU5RgZVp6XDtW7O
         GrkLq8JbYfndHKf+/JXNAlIClRgTXJ8TvUrEAz3LZUE5Ec3oGdzOytjaqpl8NJgzsKaB
         FP63D4Gh7s7cfXRFKW7KrlW+lociJMn9pA0UxpSFJYru9GHhxSUbY1IhIka7ZYih5LWU
         gRq6lfekYqy4u/+hwe4sIBlQMIm2VsjJgX8D6dxEl0NsY3WOFDhhkZtG/sRf7jAI8UiD
         LoDH/Ils4yFrkeUiSX9YLoz90UwwYHc2TcvjsMdKW0zIoHZvyGjB6UnBk46tis8q+XNI
         0slg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367478; x=1695972278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/FsUHPH1jeDeoPCTPP6Hz8Wu2lqcTKPHqA7PTMwiQY=;
        b=vo2doLivu+RclJxqOcQBVhxAOFD7C7SCT/CZG81VResSC6+LgLT/bH2XnQuwv4gF/B
         ySlBdLshAxeM5fY+qcwZZHJROQnTG4WYidz8Ydq8hXGiogneGv/+fmKxGdQgxjc98fQs
         lEmisgHhlrg5kzmcLAt7kYZ+94DHrRIAWNn/MWDcRcTjd8jEzx6u1GRMyO6FqFCYbaMy
         ejzLJq4HD3bZksmvJ8f+fZ84Ls3xBS+JpsX/8X8JcXaV4lVkmtNzGZ7UkoAtEskkO3nx
         mglAVxYJZOdMPE2Sj9BJayBOTyZX2ORk3MpKckXDLgntU7oRt6yFK4cn/RdGgFP/5T5/
         Y/mQ==
X-Gm-Message-State: AOJu0YzDBKjw802k2I3HlAJozWdTSqTE9CDsQD4Gpi5PZqJjLPK/uj/W
	ElBj2/7mhyjE7/wzeG0lZw4Y8FZM1lA=
X-Google-Smtp-Source: AGHT+IHxgMg/zCSz40rHFS45AuOvw8RokoGRV7i7QtF1S0v3bUUPKPspPFpvQPy6rZpxOzftf296NA==
X-Received: by 2002:a17:906:10a:b0:9ae:6355:afe9 with SMTP id 10-20020a170906010a00b009ae6355afe9mr3939721eje.52.1695367478375;
        Fri, 22 Sep 2023 00:24:38 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:38 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/40] libxcb: upgrade 1.15 -> 1.16
Date: Fri, 22 Sep 2023 09:23:58 +0200
Message-Id: <20230922072431.1481743-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188051

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/{libxcb_1.15.bb => libxcb_1.16.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxcb_1.15.bb => libxcb_1.16.bb} (93%)

diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb
similarity index 93%
rename from meta/recipes-graphics/xorg-lib/libxcb_1.15.bb
rename to meta/recipes-graphics/xorg-lib/libxcb_1.16.bb
index 411f51ac394..04b1eaa910e 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7"
 SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.xz \
            file://0001-use-_Alignof-to-avoid-UB-in-ALIGNOF.patch"
 
-SRC_URI[sha256sum] = "cc38744f817cf6814c847e2df37fcb8997357d72fa4bcbc228ae0fe47219a059"
+SRC_URI[sha256sum] = "4348566aa0fbf196db5e0a576321c65966189210cb51328ea2bb2be39c711d71"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.30.2



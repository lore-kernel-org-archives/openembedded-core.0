Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9876C6FA82
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 12:09:33 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.10194.1664280570245926539
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 05:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CsSjgLQp;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id bk15so6925851wrb.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 05:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=LWjAy8sJ3lWD+cz6gPrSXKb4t9V4Xhj7lTFH5yUoLFk=;
        b=CsSjgLQpe1ijYifdPCttQ2uAIzHd992UObAmoQKqB7NLkbhPS0Bm4W6Ky6X+sZhLpT
         8OsZ0HT792StfVyhcItUfC8WYUMLqtLDhJ/HzYfD/stJ+jzFCWsCuluxP0CMZwjnGAJb
         QfdCaehUkQsd4zgqdLc0XmNP0P4O/l3dqYivCya8sLZ+DhUhmUfBLxV1q10x0Vg2E8Wk
         6WcTDOeQvNzYKH3MtsuPLIlk+Gxng9EVQRiqwfX9Caf6wiwLw1iahRItDQI1jOROa7Kq
         Weusdgo8wyNzLxGiGDYa7Y5O6nJzqxlHuYq+NrQkhpmLxwylTu6jzwYQ0DALT20TFuoc
         AdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=LWjAy8sJ3lWD+cz6gPrSXKb4t9V4Xhj7lTFH5yUoLFk=;
        b=ECjyR9bu/Hq2mVhSLJv1ollnS33gMfoZIAp9x18YRxM20tEt98qC/0jqHcryDqoBv7
         fX8Il3776cgpAjWBKpmzmerFzu2zsnjaoZ4+zL9AJSDCgCrUl0Mk5mFKpv2G7HD55PJz
         fe1NrxX4GE9Fvedrven8LsEAcQ0+FPaNw4dfeiFUq2xCWIuH7aU+Crs3RZRwIQ5HbrUZ
         gR0e60lKVbA7fuNIefQzNCPNYzR/SfX1e1w5yE/txoBMJ9VYFBocq0QApZ1NDWZ4Hldt
         IJLP8ZDhLvrMUsFJRW6DsgVW2OEcmEf2sTYi+5VJ//DLFF21u7z97W8B95tCjOsY+sH5
         0HGw==
X-Gm-Message-State: ACrzQf37ubTajghbuDp52nAqMXfmozoGqJ10tr1dV/G4KL3VZOqqar+w
	VT+2Ai6EinbyW9oRBkn2Hu63YL5ZcfA=
X-Google-Smtp-Source: 
 AMsMyM4Gp2QescY7OXZLK6iJcMxz75ddH62dZ9tYn+9O5F3tVFcZBbJR/XQ0Vp52oJd0sKoHwwUQBg==
X-Received: by 2002:a5d:4e90:0:b0:22c:c1f2:40d7 with SMTP id
 e16-20020a5d4e90000000b0022cc1f240d7mr1126444wru.548.1664280568588;
        Tue, 27 Sep 2022 05:09:28 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 o3-20020a5d4743000000b00225307f43fbsm1608096wrs.44.2022.09.27.05.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 05:09:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/3] virglrenderer: use https for fetching from gitlab
Date: Tue, 27 Sep 2022 14:09:22 +0200
Message-Id: <20220927120922.137422-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220927120922.137422-1-alex@linutronix.de>
References: <20220927120922.137422-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 12:09:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171098

git:// does not respond.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/virglrenderer/virglrenderer_0.10.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.10.3.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.10.3.bb
index 567c62b570..3480eb954d 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.10.3.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.10.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm libepoxy virtual/egl virtual/libgbm"
 SRCREV = "0922041ec6730122e0fec11404e6859e2efc4bc0"
-SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=master \
+SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=master;protocol=https \
            file://0001-meson.build-use-python3-directly-for-python.patch \
            "
 
-- 
2.30.2



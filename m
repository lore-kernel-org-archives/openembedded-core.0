Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA9BC61DB3
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 07:37:43 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.177175.1672213053923962086
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 23:37:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fa1UvKkI;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id ay40so10746379wmb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 23:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tA5HuGeR2opoJ2IOySbFTggPoFRpDH3Q9Mnbj5ZtX+E=;
        b=Fa1UvKkIw2Exp81wwzkrYASIk0RUwsJ1Togb+PqleEm1qtd2wmXjhHN4d4AH9OOKgq
         3PnwKs8bfZ210G+Z0ySz3sYOFMx2Z9HQbhQ2fp6w6bDVbKPjdwKYFoOLvtdJZLEaOfEQ
         qohwmdaANRJco9Gwe+povlqSBi6OnNu/zGK9uzpBf/uABEJblg2YQYIclpdvNEZNF73A
         8rCoV+gJux4Io1p/17kiIuQ0WieenAUf2mqHex3cexQAt0a7MnP0w7Q+ns2d+mYU8+ET
         X/yrwXUOe9uAEXYlqr1FitzQvCWiT6QOpZNkJ3CCAZ73jPN5wnYO7pzcNkSnVEdBY6To
         VeoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tA5HuGeR2opoJ2IOySbFTggPoFRpDH3Q9Mnbj5ZtX+E=;
        b=v1vFQfAM5Aw9yU6gsHhlEjU0oia28j7tdE70n9iCPIKJZCWn5PNYIaZoMHBS8nK/yZ
         ORqTaWcVdWBt9SXQK5N/DR/THSEAzG/04am80fXAu5cIOHg9PFaFpkb7XJdv4E+58spf
         2mMqOoWOnAibNRIqOmqDV4kSFE2SL0mJp/yYADp8duSP61rdXlwIVDfrLHztib/lbh7L
         4rmmpDiRqgKPxMFJ/JAQ22BNf3Il4r7glOudqXXOfDG7G05J3uF1BNWOxK8QziDzTetr
         Mb1iMwMsH5S7q009/d9GXlpOFd0mVd6TFmYvm3uUO/eaLAasSVuFuPMoxWrJ1zgVi8Hv
         wTdw==
X-Gm-Message-State: AFqh2kpLYjQmwnDYVX/iZEacjRBpBUbDBKXBOH3DXDOqn7JNGFlrOftO
	x6edjAHqdZ+6gITrI5KPbzsMBkZ1JvM=
X-Google-Smtp-Source: AMrXdXsoR7HD85pOhgsXE5STPoQzB71msmhhbIqZ6b4SWXcU0Ki/EA07dXfqBXaDAAr/4PYTAt2Hqg==
X-Received: by 2002:a05:600c:538b:b0:3d9:72c1:62b7 with SMTP id hg11-20020a05600c538b00b003d972c162b7mr9457673wmb.7.1672213052321;
        Tue, 27 Dec 2022 23:37:32 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d534f000000b002365254ea42sm14802040wrv.1.2022.12.27.23.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 23:37:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/25] weston: update 11.0.0 -> 11.0.1
Date: Wed, 28 Dec 2022 08:37:01 +0100
Message-Id: <20221228073721.3454255-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221228073721.3454255-1-alex@linutronix.de>
References: <20221228073721.3454255-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175044

Upstream has published the tarball in a non-standard location. If
this persists, we might want to switch to git.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../wayland/{weston_11.0.0.bb => weston_11.0.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_11.0.0.bb => weston_11.0.1.bb} (96%)

diff --git a/meta/recipes-graphics/wayland/weston_11.0.0.bb b/meta/recipes-graphics/wayland/weston_11.0.1.bb
similarity index 96%
rename from meta/recipes-graphics/wayland/weston_11.0.0.bb
rename to meta/recipes-graphics/wayland/weston_11.0.1.bb
index ba4f4062d0..b943842bc4 100644
--- a/meta/recipes-graphics/wayland/weston_11.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_11.0.1.bb
@@ -6,14 +6,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
                     file://libweston/compositor.c;endline=27;md5=eb6d5297798cabe2ddc65e2af519bcf0 \
                     "
 
-SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
+SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/uploads/f5648c818fba5432edc3ea63c4db4813/${BPN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop \
            file://xwayland.weston-start \
            file://systemd-notify.weston-start \
            "
 
-SRC_URI[sha256sum] = "a6138d4dc9554560ac304312df456019f4be025ec79130f05fb5f2e41c091e1d"
+SRC_URI[sha256sum] = "a413f68c252957fc3191c3650823ec356ae8c124ccc0cb440da5cdc4e2cb9e57"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 UPSTREAM_CHECK_REGEX = "weston-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.30.2



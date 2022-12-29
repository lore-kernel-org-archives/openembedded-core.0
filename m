Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE86C53210
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 16:01:32 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.208340.1672329683727307369
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 08:01:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Tixf1AzK;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id z8-20020a05600c220800b003d33b0bda11so11688649wml.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 08:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=baskWA8xIsudurczt3e8eDTdSMhEY4IPA/0/MTbLU5A=;
        b=Tixf1AzKl++1mPED6JMNQgDfaOJd1eus4JjCm8qxYe+wFEfNupT2xHz6hqiMTsxQvc
         gsUNw3762OQm1BoMpK10YAmvC2i5wKSb7lalVHUnbeLw0tHHn4Eh4S42BJKAiakvx0sE
         7QglyU3hh9cbZX2jY9peJ6sxzAhwoWYJtDi+RTuO8x1Qubqxy3tZI647J8bfIihimJTt
         jN9f0fDiPB0SPrZBidWPuENz7z4dxHn3A2GvBN+8miy7OA6+E1T3s1X/BbYfQx+yHh+H
         Z5wnFL7WGmDnl+7qjP+EYfPZKZDrkK2RiWYcgKnoy/eOY72Kw61sYOHFWU7eTojUezrO
         /0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=baskWA8xIsudurczt3e8eDTdSMhEY4IPA/0/MTbLU5A=;
        b=iVyveAxBUpjXXt55ZeVV+Wewiklx+xaEZ55UfdemiO/uP+nOqyB4kVKf/GavMflPro
         xJJ/oDsWmVTdAPP1y7crMg3WnCKrIulIKrAj5tSK3/5QHxDfo5KDJZ5WiuloY35dKPAv
         yPnPF4IP7tLkrKXlBzGtk9qPvNuZuQZhzlsgaBQn2T1xXZxotrd1Su5xX3ATsH1nigfs
         /yYeyb9RSbslCFmq6yCGqmKx/UDiHINZ0IfPLRmyP/36zEZfRxjap0u90LXyPry/AoQA
         AyyDuF9g3O/CH23i/EBIK1Sic19sgXA7OlTe+r7g9aJdMY00ihNgnvep65qX8eGvUW/5
         7jLQ==
X-Gm-Message-State: AFqh2kqvpPij+tFkd4UhxddOgusddur2fDchoFwGY5yBIt//bR+aBKIZ
	k/ewWuKks71LtRJq3RTkMQu27pP7BXk=
X-Google-Smtp-Source: AMrXdXs6MwxNGGyMcPo2UYV5dSGULpqBYLgFur18bEs8GajXt/ZqAl556fyPUsSk0jmDpjJNbQ6kfg==
X-Received: by 2002:a05:600c:1d16:b0:3d1:fe93:f1d3 with SMTP id l22-20020a05600c1d1600b003d1fe93f1d3mr21069466wms.36.1672329682169;
        Thu, 29 Dec 2022 08:01:22 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id bg12-20020a05600c3c8c00b003d1e34bcbb2sm28161735wmb.13.2022.12.29.08.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 08:01:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/10] libportal: convert from gtk-doc to gi-docgen
Date: Thu, 29 Dec 2022 17:01:07 +0100
Message-Id: <20221229160110.255775-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221229160110.255775-1-alex@linutronix.de>
References: <20221229160110.255775-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 16:01:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175113

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-gnome/libportal/libportal_0.6.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/libportal/libportal_0.6.bb b/meta/recipes-gnome/libportal/libportal_0.6.bb
index 9784f04818..7d4ab758a7 100644
--- a/meta/recipes-gnome/libportal/libportal_0.6.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.6.bb
@@ -10,7 +10,8 @@ SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=main"
 SRCREV = "13df0b887a7eb7b0f9b14069561a41f62e813155"
 S = "${WORKDIR}/git"
 
-inherit meson gtk-doc gobject-introspection features_check
+inherit meson gi-docgen gobject-introspection features_check pkgconfig
+GIDOCGEN_MESON_OPTION = 'docs'
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.30.2



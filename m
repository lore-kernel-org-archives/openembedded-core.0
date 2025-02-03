Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC5F2C02199
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:41:50 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.92654.1738600908995352289
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MI8BXzuy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4362f61757fso47851585e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600907; x=1739205707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxA9+bB++s6QNsqa+04EgEOiL9xxrrz7usPuJZRH694=;
        b=MI8BXzuy4lxDTYJQpGtMcWmWZRJ9hNNr2n8VknZUf8adYvxBaBS34Dilv/KalhEjv3
         j5g5AYdUNmWctq2xfVM9CmT2f1r4kUas2gkn2h/MNLoYSgxvul/IRTFJKK2Phy+38E/D
         0bO6/99JsAZCAeuLma4tXeyl3lhyR0tbh/P+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600907; x=1739205707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxA9+bB++s6QNsqa+04EgEOiL9xxrrz7usPuJZRH694=;
        b=Rhbn4kQN+SqZWIKiVhoXkfkR2bqRHivDsMW+yb10x0oUIZcqlhGhYh1w8INspERs6e
         BG3h6Ah06GUNUwoshSm7VKn+RgnWs6iVW2VQnY0pKR/xQQd3tcVjvnP/NU1kwzqR7LHL
         I8+QYPTeKU8L6/H7eG0Xhs5Qs/rc+UKdlIQnZbAKOzn7ArunziOpI3QsHfqEU5FLYwyE
         y8+NASed7LzIR5o85KWgpI0tTN56fBsQMuVc+ZbmfBOvKzeKEPKItWR74OnI7nye/3EF
         OowlJYtQmy1tVO9werUnuAINIC+91SwR/3XmZgNpP9E14B5+zdbO1PKZSBrbT1HaXfNP
         BKcw==
X-Gm-Message-State: AOJu0YzpFmNGQKXLwXO3SWqWV2ikcLi66YNF/oA10UchZx92PrbmISLV
	tW/BRTEJg+kuX6IquTLhvFFkOHGKUpUdF9b2NP19Dmr/4jNLTZz7SO7LNbvXE8HDyRW0CqEN+yP
	y
X-Gm-Gg: ASbGncuPq/P2aGcWKzmAtY3okbvx7xqIUD0ncCJbXX/o4P+T2TTStxO7FQ9ybANONFi
	qRYpOL7pDwC4EJ6YFOzbY/3rkpZiNrt8VWwW5x/8UxXbiy4X4t/qwxtL6Yy9JrVmj534JvH0M4U
	B9+zVL8AF9O0rgcTuPdYqZxDF1cnivxncu86w9vwFmfzXsHFqHkdQXydnmOUJXPCxtQa3lZ9EJ3
	nnBlpUMbkdbpglv4KVG/Dz+Mrdh4Tes7119nINfqz1+DG5GZ+bmXbLDYKFkk+pvyv19NtnSAo3P
	6+Dlsmv5tPh0Td2sAmHwokz2UOLVSgSOdIh0SU4ztMwR
X-Google-Smtp-Source: AGHT+IHA9z4/gu+2+WCaCO/rIMhx4PaIrlu2O+MJ0TOlslDxRdOCddGJTeECxLHUGm+jo84KGCw2sw==
X-Received: by 2002:a05:600c:35d1:b0:436:fb9e:26c with SMTP id 5b1f17b1804b1-438dc3cb50fmr198730915e9.17.1738600907041;
        Mon, 03 Feb 2025 08:41:47 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.41.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:46 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/46] libinput: upgrade 1.27.0 -> 1.27.1
Date: Mon,  3 Feb 2025 16:41:00 +0000
Message-ID: <20250203164130.3403325-16-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210689

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../wayland/{libinput_1.27.0.bb => libinput_1.27.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.27.0.bb => libinput_1.27.1.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.27.0.bb b/meta/recipes-graphics/wayland/libinput_1.27.1.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/libinput_1.27.0.bb
rename to meta/recipes-graphics/wayland/libinput_1.27.1.bb
index 74705fa35fb..04a03f08074 100644
--- a/meta/recipes-graphics/wayland/libinput_1.27.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.27.1.bb
@@ -15,7 +15,7 @@ DEPENDS = "libevdev udev mtdev"
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main \
            file://run-ptest \
            "
-SRCREV = "64d1f198fb2764dfb852a19becaf6f7f097fce2c"
+SRCREV = "3aa004b96488bf0b2446c11b97a7f8a75ff37c23"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"


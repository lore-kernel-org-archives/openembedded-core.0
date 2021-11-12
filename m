Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E9AC4332F
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 21:03:52 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.1810.1636751032405767614
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 13:03:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=coDFUYpi;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id
 fv9-20020a17090b0e8900b001a6a5ab1392so8617447pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 13:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G3hncAxfiodtvC+I0EhBUcM/vLLjuilW7mxOVywCN8I=;
        b=coDFUYpim7+E+tgIyatjtzavAlVbv4NhKKHmiEzPnflScpPYtuQqzlT7HUTMul5+QF
         +q0+OPm4lDOwMHM1jxgTra1yQGsQJAmYvNwQ9M1niw1/xlTakr6rLghs6XD7TMXEGlmE
         rdafm0tA9dlC4dDQectyMjFvoUDpB2nDPphWfbXY07cN+ZEK2LwKqdQb89fCc1hfEeyG
         +aL/AFUEKQyhvrXmDjFUR3A/A4ogsRMmiPQWaGPkD73AJBHafSYIJ1GtX/wIw5HYvjvq
         JUIh9Hqaxy2ds8PURgRaCZV2naoKMUvhQ7oh8UKee6hplOJiKzeuOOh0/IKMvYDNoAoG
         hhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G3hncAxfiodtvC+I0EhBUcM/vLLjuilW7mxOVywCN8I=;
        b=EcSGEbk0n2Ki+RobXGOP/DT33wCN7RieMa0GgvHEXLAwl8+XuZavbYnMmwVtyl4Y4P
         eJRwWsOu8S865hWywSxwUlzgoRY9COd1J1YObUQgyyGu+nZ/QnU/HagxDPLjPDf16OFa
         iQsjfWOlAKfHiCaj1Y7OPJCnBWV3AlRku/TSVlvsYQnHUYSmXXKsmT/hyw2DcbHDTbYR
         H1BUFdjrRlMP7h5fWamOS6WOHFEO+QpbdbI6ObnCLfzIHXYOo4G+3JgUfT9j+iCVuDJn
         HhDHOpZgehii38T6XoPKQBChzJlP/HHtlXPNKlkVnlAydkvunig9rulCpxROLH6+6Dar
         Y+iQ==
X-Gm-Message-State: AOAM5312hWc+VovAn+V65w6Aa5zaGu1vdU0mrviBrpdERanylUKFu9Y9
	ecQgRzne1MsR/N0WP0TLjvGsnVr2+qo=
X-Google-Smtp-Source: 
 ABdhPJyilZM7EvA9HpPxg1N+yhCMjm+tjO1HNlU5eOhpKDW/9HYfuhDqDRFFSzA9Lt6WdN7EKtDmyA==
X-Received: by 2002:a17:90a:fe14:: with SMTP id
 ck20mr21396541pjb.72.1636751031765;
        Fri, 12 Nov 2021 13:03:51 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 w24sm5705310pgi.81.2021.11.12.13.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 13:03:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/4] gstreamer1.0-python: Do not add -Dintrospection
Date: Fri, 12 Nov 2021 13:03:47 -0800
Message-Id: <20211112210347.2004455-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112210347.2004455-1-raj.khem@gmail.com>
References: <20211112210347.2004455-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 21:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158235

meson 0.60 turns unknown options into them hard errors

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
index 74dd15b3eb0..045aea44099 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
@@ -21,6 +21,6 @@ EXTRA_OEMESON += "-Dlibpython-dir=${libdir}"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-UNKNOWN_CONFIGURE_WHITELIST:append = " introspection"
+GIR_MESON_OPTION = ""
 
 inherit meson pkgconfig distutils3-base upstream-version-is-even gobject-introspection features_check
-- 
2.33.1



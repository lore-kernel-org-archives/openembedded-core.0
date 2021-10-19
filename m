Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9FDC433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:35:01 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.11517.1634657699877022834
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nUF4ZrcU;
 spf=pass (domain: gmail.com, ip: 209.85.128.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id
 l38-20020a05600c1d2600b0030d80c3667aso3621380wms.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u+YuMuNxoZ10p2lWILpzQhn68DoQozkxS5h0Y+g8wS0=;
        b=nUF4ZrcULiZ63roJMWu4DLpccrHP6bys93Y+S8uc0ujlHffVSWHtUbDywrb9QfEgI6
         8uK+z28RvV9P9Fd2uoO89gzjDcwfBy2qDODWihYQYY2QmUbfZfJCXaXZoUVCJfGoH/Ur
         QiONx6ZWuBv9e32DbICOIjm1SMEdRkwWrivqRuK1zhOv0/nmIJB8/CRxKnoCu/XDZ7IV
         XJkE6JyY+/qS5f5CugIemG4KPDLJBPpA6LEBsCsCKT7IRCLJwDjnkoVF1AfJSC57xeQc
         4r9H9KdNcxTjbmKcJqiWnZkkO8F6SKSrG/qtidFHbwtDpZFd+L2xfNIdvXj0QX7IbyGU
         OL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u+YuMuNxoZ10p2lWILpzQhn68DoQozkxS5h0Y+g8wS0=;
        b=m4yiOjctn/2gRUPHU9hZ94sTAdTNfedMXuh0IQx2VrPABt5osw7L8YR1GgCjjFUin6
         sZAINTKCtxvVyFZZYVAuO5bvZuV2cu4bnuektcsBlNSdy3BrzFsHSh5MDDMegN6egjN0
         fKrSggbAOX4KUGMEb5R/T2oomxtYZL8TyX0G5GQYFbIgcojO9zzLpucApe51BAZt+8Di
         leoFAyPkNMJHMg4zsVSAXXcuuAABq/xv07XK5Sys9rZu+Bg1pk94JVZvUz2fEPvY/cgE
         jrHxP9dBa+wLgI5yPrUrniAYYmLVbp7MG+tdaq9S6/jfM1aZv0dDIzS8lgklpcQ6xr1s
         JCPg==
X-Gm-Message-State: AOAM531JEJf2JzwTWFl+PH3FopOvOKg2ehDN3SPn+kI1JwGc123kyyfK
	v8l8yhvaCPjGOPofyUn6W9UB60xE8/o=
X-Google-Smtp-Source: 
 ABdhPJw3WSHSmSXbLU56IP4khFYyNxaCkG70dpRIU+a93PUvN1SpILIGZe95sbRLunMA9YrwoWd6fA==
X-Received: by 2002:a05:600c:4108:: with SMTP id
 j8mr7023718wmi.15.1634657698505;
        Tue, 19 Oct 2021 08:34:58 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 47/65] harfbuzz: upgrade 2.9.1 -> 3.0.0
Date: Tue, 19 Oct 2021 17:34:01 +0200
Message-Id: <20211019153419.3319802-47-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:35:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157166

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../harfbuzz/{harfbuzz_2.9.1.bb => harfbuzz_3.0.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_2.9.1.bb => harfbuzz_3.0.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.9.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_3.0.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_2.9.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_3.0.0.bb
index 694553beef..fef9453187 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.9.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_3.0.0.bb
@@ -12,7 +12,7 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "0edcc980f526a338452180e701d6aba6323aef457b6686976a7d17ccbddc51cf"
+SRC_URI[sha256sum] = "036b0ee118451539783ec7864148bb4106be42a2eb964df4e83e6703ec46f3d9"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
 
-- 
2.20.1



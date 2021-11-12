Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A8DC433EF
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 17:14:49 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.20.1636737288011302233
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 09:14:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KJsPwVUb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id
 o4-20020a1c7504000000b0032cab7473caso7630847wmc.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 09:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0kQTeh101ioQTryYzmiWBlUCjk/uF5gZfddRWlGV+PI=;
        b=KJsPwVUbFUq3P07mK34KpKqjJgUye2v1l3mGVToeB6hxXnpzUpeGX6ixm8tlKpixrU
         rF1D4AiXMeRkkaq9S7xxwqGoVHl6xdb5G9YGRmOAGeYNBfsGHVi/lEUSdyryOjPTDiek
         BTmpxr2Yis7Ml1EJIsmzClWdprqSsI+f/DBwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0kQTeh101ioQTryYzmiWBlUCjk/uF5gZfddRWlGV+PI=;
        b=zhofBcKgiAZFWkqKTN77ntgvZd5QwWYu1AIs9DRQdwLDyIVz4WfP7sAa1LDEL8/UT/
         CqPl+TaVb7D/tO+kdGPIKhEafMvYwEjbPBnk4u/YDx6v95ro5nre0WpDyAVdJGXeX72i
         jgFf920WJBpC6y0BGYSOEqfrbQD7HmkbRZRUlsBfWCeXD7FmioVGUdNKpzLb0Qj1DGHf
         wtW+nJdlzm71oeQx4yUaMWdg0JsSaN91rjnAndOfcGmEoMoKA7ai++5R5lwYvbslF7mn
         sJJU5qJYj32If+BJuvuQpAZb9LPBUhSXcc33BOtoJbrt4x/eBG5wVOTUMeglwBQqzk6j
         qlUA==
X-Gm-Message-State: AOAM532M28+MiVrxJOMVm13RPiCT9vKEPliXVEOpm7fZ4xCGGXa9lrzu
	QDguaDfXfG84Hj8L9e4alfSWUH5OqLFDow==
X-Google-Smtp-Source: 
 ABdhPJzaU/SqJWu2hJA8KQXFwgLC0VA2O0Nz8xgUw0FuW0naOpu2uTIddhiZ3/6JDDPMTeJ6OzVi/w==
X-Received: by 2002:a1c:7313:: with SMTP id
 d19mr35621781wmb.183.1636737286492;
        Fri, 12 Nov 2021 09:14:46 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c0bd:72b4:105a:2914])
        by smtp.gmail.com with ESMTPSA id e3sm6263833wrp.8.2021.11.12.09.14.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 09:14:46 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] packagegroups-core-full-cmdline: Drop libraries
 packagegroup and gmp
Date: Fri, 12 Nov 2021 17:14:42 +0000
Message-Id: <20211112171444.3898562-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211112171444.3898562-1-richard.purdie@linuxfoundation.org>
References: <20211112171444.3898562-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 17:14:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158228

We pull in libraries as/where needed as dependencies so there is no need
to have them as specific packagegroups. This change removes glib-2.0 and gmp.

This also has the advantage of meaning debian renaming now isn't used anywhere
and the packagegroup can remain allarch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../packagegroups/packagegroup-core-full-cmdline.bb       | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
index 14a7bded953..c0647b21883 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
@@ -10,7 +10,6 @@ inherit packagegroup
 
 PACKAGES = "\
     packagegroup-core-full-cmdline \
-    packagegroup-core-full-cmdline-libs \
     packagegroup-core-full-cmdline-utils \
     packagegroup-core-full-cmdline-extended \
     packagegroup-core-full-cmdline-dev-utils \
@@ -23,7 +22,6 @@ python __anonymous () {
     # For backwards compatibility after rename
     namemap = {}
     namemap["packagegroup-core-full-cmdline"] = "packagegroup-core-basic"
-    namemap["packagegroup-core-full-cmdline-libs"] = "packagegroup-core-basic-libs"
     namemap["packagegroup-core-full-cmdline-utils"] = "packagegroup-core-basic-utils"
     namemap["packagegroup-core-full-cmdline-extended"] = "packagegroup-core-basic-extended"
     namemap["packagegroup-core-full-cmdline-dev-utils"] = "packagegroup-core-dev-utils"
@@ -56,7 +54,6 @@ python __anonymous () {
 
 
 RDEPENDS:packagegroup-core-full-cmdline = "\
-    packagegroup-core-full-cmdline-libs \
     packagegroup-core-full-cmdline-utils \
     packagegroup-core-full-cmdline-extended \
     packagegroup-core-full-cmdline-dev-utils \
@@ -65,10 +62,6 @@ RDEPENDS:packagegroup-core-full-cmdline = "\
     packagegroup-core-full-cmdline-sys-services \
     "
 
-RDEPENDS:packagegroup-core-full-cmdline-libs = "\
-    glib-2.0 \
-    "
-
 RDEPENDS:packagegroup-core-full-cmdline-utils = "\
     bash \
     acl \
@@ -81,7 +74,6 @@ RDEPENDS:packagegroup-core-full-cmdline-utils = "\
     file \
     findutils \
     gawk \
-    gmp \
     grep \
     less \
     makedevs \
-- 
2.32.0



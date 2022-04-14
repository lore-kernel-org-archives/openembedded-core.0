Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF05AC48BE5
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.7396.1649904758885170952
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 19:52:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B+0vG8fy;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id y6so3587739plg.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 19:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rYQ1Fx1UOzKi3vHLxEM/FYjP5Ixw5g5XZbkgZUpkJ38=;
        b=B+0vG8fyTlCOKRs4ZaMxmbUhlWWTupZebpPIew4Dycd7ijr2dTcs5fYynL4N86CBgq
         BEs707ve63yc4jzdv+f83FEzTImv2lyS/Ynj18kmWRvNdKSCQSBz0DyBArfUPoscFgrg
         fMth6j5ijMq/2Y6JZCFzm7QY6n0Oan+RcijHsRlmDqXK0qKvqC87jYEyveNU51LaYQ0x
         JOv7fyGCuylP4zgKh8KQTiqduKYWY0R7NjGkeOK9MLi9sVfs2gjpjIQEcIfNWGUw1i1j
         GUdWTsiXHQgFXRgzCaYBvvkg4Q4lKFi4ZKyAUGXhXZhkkptRZ6mvI4dPppJ44UUrFdHC
         9X/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rYQ1Fx1UOzKi3vHLxEM/FYjP5Ixw5g5XZbkgZUpkJ38=;
        b=IC18g/v+OyLJizgJGEzskTMxFWwfc2w7smlf6XgSOoL6XJFWarmzREXO0IK1YYkR49
         UQuh5kZ4gxXcpMa2fe33hmWeA0g9urAgJz6toRuuiaU0tSeQjikaFCq99Zv4OE1uy2Y3
         6XVOgi6yL2ZEjKAJXBYr7LrxAu6qvgWLFn25HqCnD0y2HTYjlBAW/r5R4cusPuMse3ra
         f2SZDRDOWXVDOlneLbyYBIuIdlxmWNuD0X5r92TBpNq/OBiduev7o6iRX5UnJgB41QIw
         bS8/y5e10OhGGfCQWcUz4jVYI0/OsL1FVm+KBWGsHXTqrIEbQDpoTJtp8noMQuSHJvzG
         JyFg==
X-Gm-Message-State: AOAM532ssjLdMLOtKeEfK6DwS8wVnmNy+3mHE8bHsEgCtX1N50pb0ovc
	0uksPFkWzAN5TnHGqPrHkop5HoLNlqrmwg==
X-Google-Smtp-Source: 
 ABdhPJzovcyA1gjhqeyXhLx4/24VWjCy+0fuwGXQiPebRc3KRfkLdBwxzhBhWloa3+BlsAMxFcj95A==
X-Received: by 2002:a17:90a:930b:b0:1bf:ac1f:6585 with SMTP id
 p11-20020a17090a930b00b001bfac1f6585mr1339632pjo.88.1649904758104;
        Wed, 13 Apr 2022 19:52:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::4307])
        by smtp.gmail.com with ESMTPSA id
 81-20020a621754000000b005082073f62dsm453735pfx.12.2022.04.13.19.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 19:52:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/6] pango: Drop using additional cflags with clang
Date: Wed, 13 Apr 2022 19:52:29 -0700
Message-Id: <20220414025230.1166825-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220414025230.1166825-1-raj.khem@gmail.com>
References: <20220414025230.1166825-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164382

This is no longer needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/pango/pango_1.50.6.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango_1.50.6.bb b/meta/recipes-graphics/pango/pango_1.50.6.bb
index b1b9054234d..cd04801db10 100644
--- a/meta/recipes-graphics/pango/pango_1.50.6.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.6.bb
@@ -37,10 +37,6 @@ do_configure:prepend() {
     chmod +x ${S}/tests/*.py
 }
 
-do_configure:prepend:toolchain-clang() {
-    sed -i -e "/Werror=implicit-fallthrough/d" ${S}/meson.build
-}
-
 LEAD_SONAME = "libpango-1.0*"
 
 FILES:${PN} = "${bindir}/* ${libdir}/libpango*${SOLIBS}"
-- 
2.35.2



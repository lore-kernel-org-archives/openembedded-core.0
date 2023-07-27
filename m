Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B82E8C04FE0
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 14:36:50 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.8992.1690468601794274725
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 07:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=X6CGoCY8;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-99bdf08860dso96916766b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 07:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690468600; x=1691073400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOmMVEFba720c7tV7lgYB04rf5ofnA2gTFzSTAlzdFU=;
        b=X6CGoCY8z0J59/fVmHntGA5pShqVWToDocKJDPQlF9Vb0O24ftw2n636+8q1k0RKHd
         XN5reiJFzuYL7u/iptJ1vxeIMMrrbx1AmvL4BWniborJvsocso58zmYoDZEfemQaSBrm
         Lg8s22WghlRPDuBp6TcZsO2SqGKZ2B6iwXXve0y169jiSwPexIcdd9va1phC7mGVhV69
         k6oCm+T6AivGulaUwJ8a2oNYD5n3G4qF5wrMa1HyYRZ007cGuPbE6YqVZtZ8bqPYslt8
         JsUkjBq8lK/CBw4wyuC+r2yOxoni8emCXFDdvRsCE1fE1VmsbuqDadUWNLL7u3KqI3oB
         wT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690468600; x=1691073400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cOmMVEFba720c7tV7lgYB04rf5ofnA2gTFzSTAlzdFU=;
        b=f7mpBgJTGUz1hwsYaAGFtJpqiiokVEiejeIm37QF2IzuSLc0X2F3DUGIhemK1spBwo
         0DqKD0GUvX3uqFORH3LZM3Y+gxIetbhArUx4vLwb0PwSkOuEayJMASIjXXkum1PDhIs6
         73KZ/UmLuPB6J7jwDiG+2mrRuyIlUIVUKCbquDKSywF5/u5j3kFyv/Qb2M3obme5PbBS
         VI8L4EhG/teKhPJT9hU2qbOIvwcSGZq6yv+n+PxtUG7bDRFNoYquW1qCRtvikSJ5aqAD
         bKLYmUMDNHkd2Z408ktLH9gdxgRNesjEK2ZDQAO8pNijCD3cIsh0MkWVnpI8z2xepFNV
         QHNQ==
X-Gm-Message-State: ABy/qLYz5DmeWgrI3aq4+5ZRFUgDyeh9zhm9FnZcE60S4OBO9e8uUA4v
	a+tWNCKe9bJG0b59ypJb+DYDcoYW2QM=
X-Google-Smtp-Source: APBJJlFJsVYDlInfAP8maOENomCSHoUVS42nNe8ygc4oid59ERAJgSVMHQDBziP3/vigfI6uk1ukoA==
X-Received: by 2002:a17:907:1def:b0:99b:4d3d:c9b7 with SMTP id og47-20020a1709071def00b0099b4d3dc9b7mr2849535ejc.31.1690468600191;
        Thu, 27 Jul 2023 07:36:40 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m10-20020a17090607ca00b0099bcf9c2ec6sm846725ejc.75.2023.07.27.07.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:36:39 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/21] glibc-locale: use stricter matching for metapackages' runtime dependencies
Date: Thu, 27 Jul 2023 16:36:24 +0200
Message-Id: <20230727143627.3718496-18-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230727143627.3718496-1-alex@linutronix.de>
References: <20230727143627.3718496-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 14:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184958

This resolves two issues:

1. metapackages were depending on themselves (except -binaries which wouldn't match against 'glibc-binary').

2. for the nativesdk variant, due to a non-empty dependency list at parsing time caused by
issue 1, map_depends_variable() from meta/lib/oe/classextend.py was forcibly setting PACKAGES
to the initial parse-time value (e.g. missing the dynamically created packages). This meant that
three out of four nativesdk- metapackages were entireyly missing the dependencies on the
respective dynamic package sets.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/glibc/glibc-locale.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index 760de9437b5..289f58d4df9 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -37,22 +37,22 @@ PACKAGES_DYNAMIC = "^locale-base-.* \
 # Create a glibc-binaries package
 ALLOW_EMPTY:${BPN}-binaries = "1"
 PACKAGES += "${BPN}-binaries"
-RRECOMMENDS:${BPN}-binaries =  "${@" ".join([p for p in d.getVar('PACKAGES').split() if p.find("glibc-binary") != -1])}"
+RRECOMMENDS:${BPN}-binaries =  "${@" ".join([p for p in d.getVar('PACKAGES').split() if p.find("glibc-binary-") != -1])}"
 
 # Create a glibc-charmaps package
 ALLOW_EMPTY:${BPN}-charmaps = "1"
 PACKAGES += "${BPN}-charmaps"
-RRECOMMENDS:${BPN}-charmaps =  "${@" ".join([p for p in d.getVar('PACKAGES').split() if p.find("glibc-charmap") != -1])}"
+RRECOMMENDS:${BPN}-charmaps =  "${@" ".join([p for p in d.getVar('PACKAGES').split() if p.find("glibc-charmap-") != -1])}"
 
 # Create a glibc-gconvs package
 ALLOW_EMPTY:${BPN}-gconvs = "1"
 PACKAGES += "${BPN}-gconvs"
-RRECOMMENDS:${BPN}-gconvs =  "${@" ".join([p for p in d.getVar('PACKAGES').split() if p.find("glibc-gconv") != -1])}"
+RRECOMMENDS:${BPN}-gconvs =  "${@" ".join([p for p in d.getVar('PACKAGES').split() if p.find("glibc-gconv-") != -1])}"
 
 # Create a glibc-localedatas package
 ALLOW_EMPTY:${BPN}-localedatas = "1"
 PACKAGES += "${BPN}-localedatas"
-RRECOMMENDS:${BPN}-localedatas =  "${@" ".join([p for p in d.getVar('PACKAGES').split() if p.find("glibc-localedata") != -1])}"
+RRECOMMENDS:${BPN}-localedatas =  "${@" ".join([p for p in d.getVar('PACKAGES').split() if p.find("glibc-localedata-") != -1])}"
 
 DESCRIPTION:localedef = "glibc: compile locale definition files"
 
-- 
2.30.2



Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D59B1062889
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 12:29:34 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19811.1773232170855837411
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 05:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IQZdmj89;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48535a0ef86so30682695e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 05:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773232169; x=1773836969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PxL+n+tHYM9Pj2927TYPzhYZ7WJ2gBjvtQoeTaTRFEU=;
        b=IQZdmj89R4uf9yeCWfw0nqyrU7+yrg4wxFIpZJEBoD1I4eSiitu0TD/pSWtJcxSAey
         eLuvY2NCIYrGIxG43orJYKY5hRZ3r/kLT6/s948jR+mlmzKxxOv9CewKbmvPoMUTyM/q
         x8ycwDblgWMhqY++BCGq9AM9s1j4gDx3qzNQcYl7P2hTIkawZ9jaG8v78c5UtCrwRXgy
         wmIyt/14luIOSRf6MFUk/2hXMYw4Zs3c1TQma+AaJDvuKEKernCLl6wHlmGu3Rsqnjvp
         M93sKX+AI0yFAb/iWC2yMOgHuvWybkZ5hUVq9/DPXPeLBWJHwBfSO5g0l6kiXGVZhKE9
         wpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773232169; x=1773836969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PxL+n+tHYM9Pj2927TYPzhYZ7WJ2gBjvtQoeTaTRFEU=;
        b=e22BajtimKck2qJoDuIgTqOnx+ka+Pdxu6uXHZzK5Vw+aHCUEdSTevgJ8wvf08k9sN
         YjfnGaCBaAtuh27p6KXnx8Mfura/Bex2ajs+soNIXsOLoibUwhfqc0+c8hkF/mb8MPnR
         Yj81vjJtAwv/uIOSKPdHCY9eZ+wQYFUSM8rWDTh+5LPB8IVzaNhugikbbGgyojuXKhvt
         rtmx+xOjllSP8GBo7gmG/SGUcYeN6owNU0hO18F8+EhJ3NQWdZN9gweyaWXJOFNdXMHN
         Y/ZpX00v0H3hetEkeARVY0o0qVEDJBOPzlLo4Sq06Jo6/uOTdW0lz+e4LeI3fVx/UBJN
         KPpA==
X-Gm-Message-State: AOJu0Yzoep+CJKX80ZGNtG8RGmxP5cZKWIMzsYZ1F/QYbrlmNvBTsHh6
	gUWqEAM1oYuDGJ81fNzekSTDkRDEyQ5ADtikDw2HqR75of2hKcxXDvJlY3wUGQ==
X-Gm-Gg: ATEYQzz8OZRCbVnyAbajB0X/c9Kn2y6HTyLm5Q72PFLAXMvr/mw5JMT00SoqBP/kcTh
	E2Qz9t9cHRXchv7NZpvD3oJcbdiEQ5mRLvAmupxjdhJLKEdAuGxZ4NYr+JHyoefI7I+0xLIwr8W
	vioul2Kpb7fZP/tly/k3L4YtvGAlcFnhV1GHeJbOlvzTc5DgOUn3fdJpAc2bmrT/gMbYLNCbUhz
	GwO8NDTCOJPtfvuI9mRA5c0LsGXYZZGr4+gBSNTW6rgJGUk/YPit+VSKEs0W9dvlfFaOQrPel84
	zvQb0hGl0lm+veN/oOSnuJnzN/UcTYj3yo0bcBNPabUiw8tZe4iYRYYhPlr2CDd9HbGJ3o6Xdfn
	Q/v3RCRhUykJ3Dx4PbHXHjFU3lDj+l1YnGkEh9IOhTJu80YsIpz2Xw1lKiIcZXL/ggLfnMRqK7L
	lmICuHpKmHJvjdyCcYpz17prXAww6diJqtYRwZvEPJO88=
X-Received: by 2002:a05:600c:4fd6:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-4854b0a555dmr39642435e9.5.1773232168893;
        Wed, 11 Mar 2026 05:29:28 -0700 (PDT)
Received: from fedora (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854ad5ee37sm39671515e9.2.2026.03.11.05.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 05:29:28 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 3/4] glib-2.0: Add INSANE_SKIP=build-deps to ptest subpackage
Date: Wed, 11 Mar 2026 13:29:21 +0100
Message-ID: <20260311122922.4160133-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311122922.4160133-1-zboszor@gmail.com>
References: <20260311122922.4160133-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 12:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232874

This fixes a QA error:

ERROR: QA Issue: glib-2.0-ptest rdepends on locale-base-ja-jp.euc-jp,
but it isn't a build dependency? [build-deps]

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index d1f25ef8f2..35293dd610 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -194,7 +194,7 @@ RDEPENDS:${PN}-ptest += "\
             locale-base-fr-fr \
             locale-base-ru-ru \
            "
-INSANE_SKIP:${PN}-ptest = "dev-deps"
+INSANE_SKIP:${PN}-ptest = "dev-deps build-deps"
 
 RDEPENDS:${PN}-ptest:append:libc-glibc = "\
             glibc-gconv-utf-16 \
-- 
2.53.0



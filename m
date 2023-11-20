Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB5CC5AD4C
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:39:33 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.608.1700498365943990463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:39:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nvnKsCP2;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.182, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3b6ce6fac81so2886369b6e.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498364; x=1701103164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAj+hM8omCUFRNuZtSyUlLiSqS5S0mwgZJ3MykmAx24=;
        b=nvnKsCP2KcP+MD5h+Z8K74svdnyl0Lxz020hGM7C+nXuGmFoBMkIPkRVmKO7oNIkMM
         DPOxUPujVjSJ7oNWwKOYlUVOKCH3ym11SA0K+WUziE5dtFU/rKVDhNBwRGtapDT7B1hi
         vsKb+1up7kzjgS8JJZBz3XTbfBvSNlWSmGhIav9vWQV2LHuf3cs9LZzwXDBIkBZcl5qZ
         KDF1tBAkrp43e5W6mjK3AK+wYMOX5R/FPP8tXrWVAD7rTAGhpFTbVrKDXyPlX2X6HI3f
         nVV4PabzKKmtbwKbtz7oYtRNqlRvutFAtMO6OOawehSV2U2R4sWKBDgIYT2FFBkR1kN9
         JNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498364; x=1701103164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RAj+hM8omCUFRNuZtSyUlLiSqS5S0mwgZJ3MykmAx24=;
        b=uN5Qv4CjFS1RmnUYXz+v4GkmP3dkCo1TiqTnBZiQURwBy0PLt5o2fDNSbUCR8Jx+L7
         klof0qMpE2VEyFewudTqsypqKkiN3r8USSPrqOemo/XFyCQDVkpMwW/38oJa0va8PHAC
         2b3mIjklKbniiB3Gf7ovjEqTjQgnpdq/gSD4XLAPcjSx3ULxw30skYoHjDCu8//PovSe
         GLH77H6JhBvODvwS4fZtJE2HckEjJC5u7mbZYyUU4pq1YjXtahb0uR9vYry+9zghiz1k
         Nnw29sfBOks5penzAcfwNwcJtgHWVqCgx7kiGhHkd1N9g/nECUHhJ3RkPH50lOmHPRm0
         1/zg==
X-Gm-Message-State: AOJu0YyJl/tVninX0MOgz7ZNN4ck4FWFIunZNzdFciTzeSlfAdEd94o3
	S2WgupaI1ACg+ZAEUL3g4G6MwEANXp4v73fSBvxDLw==
X-Google-Smtp-Source: AGHT+IHkV/iklqCLbypnYDd/85LOHFWmgsAh4iHFe4/U+vU+klwU8rO6SJ+7aqQCxpy2+xnllkFTvg==
X-Received: by 2002:a05:6808:188c:b0:3a7:215c:e34 with SMTP id bi12-20020a056808188c00b003a7215c0e34mr11736672oib.15.1700498364644;
        Mon, 20 Nov 2023 08:39:24 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.39.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 15/33] glib-2.0: Remove unnecessary assignement
Date: Mon, 20 Nov 2023 06:38:29 -1000
Message-Id: <06423508e2b67bfe9871ba833ab6ea89ee2796bb.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190904

From: Rouven Czerwinski <r.czerwinski@pengutronix.de>

FILES:${PN}-utils is += extended and than replaced completely later,
remove the first extension.

Signed-off-by: Rouven Czerwinski <r.czerwinski@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d9d61c5217938749e3edc5f8a5c987f46bbab3d7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index b946e798bb..cec06b2f88 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -57,11 +57,6 @@ FILES:${PN} = "${libdir}/lib*${SOLIBS} \
                ${datadir}/glib-2.0/dtds \
                ${datadir}/glib-2.0/schemas"
 
-FILES:${PN}-utils += "${bindir}/glib-genmarshal \
-                      ${bindir}/glib-gettextize \
-                      ${bindir}/glib-mkenums \
-                      ${bindir}/glib-compile-resources"
-
 FILES:${PN}-dev += "${libdir}/glib-2.0/include \
                     ${libdir}/gio/modules/lib*${SOLIBSDEV} \
                     ${libdir}/gio/modules/*.la \
-- 
2.34.1



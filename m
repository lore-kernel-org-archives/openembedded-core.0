Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E91CE64A98
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 13:37:34 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.19380.1733233053411846330
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 05:37:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ASdIa/oB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21561af95c3so26040205ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 05:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733233053; x=1733837853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKa42mTULD2X58YVxSxYhuBT7yAZ/1wCbUi5zcZw2AM=;
        b=ASdIa/oBrMtTEkYVlTnu+o62dwx8oOD+LqmiSUR2rvrCIGmmPPqgdJrUYyA6YZulby
         Thr7XXforKm0hbjYLNxrS2A572CHQRpkkraLloI+1UzlFOQlJCtz0WmKJDdOEHkkm476
         /uaJmsmQkmiobpMSokYbtKGy81Pwh6sxhX+VqMLcQcv0qkISbsAEL8nRaT8FcP+5eahA
         BtEfBiwA95M71wcODYB9x3ceq7y1uZkOj1XduBtao/NoRS4G2CC8SHctvdvkj1Tt47cr
         f/qWc+s9fcSMl8Ji1uygshwCnYjCOmMnIJUswESTxJ2Esy2TBkHSR9VEz2HTVTG0hkXR
         hrlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733233053; x=1733837853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKa42mTULD2X58YVxSxYhuBT7yAZ/1wCbUi5zcZw2AM=;
        b=dZmuMHV80AeT8LD1tEaWWNKcQAA14khB4oQZk8E1LlTfYpUHjJF+vJY9EFWX5RStbq
         bZz6wI+tK/qGzCd5UWPi+xz/Y3xtHPZTgQAPavWznoIXyE0YsiHxCFerLI0vkxBglHA1
         6L/meCfW8PXPGLjS/Mo3eKCAFuTCI0MesPpj/5jJbsg4oo9M5hHiDz+W9R8GBL5l3iB/
         lBL0d8ChN0ShJ4i5H1dX4m/AdvbQeUvBnzCCoXnGlz4rNwbeWGTHnIcHDysCRdqp5A7C
         k3crrzTycUqAK4GFGsV3muDKT6Ppwdaftm4rQQiPfUAT8/MKrVEifsThVkT3bhs+QDZ+
         ZPFA==
X-Gm-Message-State: AOJu0YxCCHZzn8fMknoIHFkRxjknvKmC2kZhQ2tVJAlRqYPxpTANKLOd
	mv7bvYF44vBIy/Y/m1AOEC3pBXgCGy2jTq9szj/Rb+RFvKhKMy1XrdF/XShHCiRGXoZz8so5a9I
	G
X-Gm-Gg: ASbGncsDfMeP40UH20kJwKoL77GKvUEPB35R+nf2bedKCvMdWCckhR8eTLHLPnvX4qT
	V45/4ZW0WCV0Bk5HPl+BPn4ppCM6roYZQsVo+PrNdKHbM9AqaLaA7ZUzk8ZpaBFrrICZgh5Cb1l
	bk1R8Z9OP8vFI6DzOh3f+SPWcqBss/LSfNKOH1266LSYeoMtbNbZUFVWS96WFWSHPzhZGJkTMai
	gB0L03+pqE4rckcnKMxPS+L4mTlEmHffZjGMZ0=
X-Google-Smtp-Source: AGHT+IG6FT/qI8eu5/7aZZyhZkwMeh47t44EPGIcn+azisoGfXdysIM7NIz2m8WOu23lVFBk+FPcpA==
X-Received: by 2002:a17:902:e849:b0:215:6426:30a5 with SMTP id d9443c01a7336-215bd11caa6mr29351495ad.40.1733233052688;
        Tue, 03 Dec 2024 05:37:32 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2153540d792sm84560225ad.66.2024.12.03.05.37.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:37:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/16] builder: set CVE_PRODUCT
Date: Tue,  3 Dec 2024 05:37:07 -0800
Message-Id: <408c987e9134180616f27ae5df3f59166eeaa6d9.1733232895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733232895.git.steve@sakoman.com>
References: <cover.1733232895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 13:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208192

From: Peter Marko <peter.marko@siemens.com>

Builder is a common word and there are many other builder components
which makes us to ignore CVEs for all of them.
There is already 1 ignored and currently 3 new ones.

Instead, set product to yocto to filter them.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/builder/builder_0.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
index 52c9351f93..709a0b4608 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -28,4 +28,5 @@ do_install () {
 	chown  builder.builder ${D}${sysconfdir}/mini_x/session.d/builder_session.sh
 }
 
-CVE_STATUS[CVE-2008-4178] = "cpe-incorrect: This CVE is for an unrelated builder"
+# do not report CVEs for other builder apps
+CVE_PRODUCT = "yoctoproject:builder"
-- 
2.34.1



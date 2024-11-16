Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2137D68BF0
	for <webhook@archiver.kernel.org>; Sat, 16 Nov 2024 14:01:55 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.13134.1731765713511732539
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Nov 2024 06:01:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YR/CtppR;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4316cce103dso8147235e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Nov 2024 06:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731765711; x=1732370511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6kFsusWK3wYr9nKvsV5ZFOVcNDwfam2IkmlRctzDYIs=;
        b=YR/CtppRkIyBl34jSx6sz8q6vEiB0VchfGdATKAvDZ5CLtPMW/Ph4ntDIQl5k4vBVL
         j5C6D2clI2wXs471OYbgxWhgrDfBOlEd/tUs+NYwjyD933ufBcPcxssxfcIo/HtZxuJX
         mw+TUfGk4vysXZeWoOD3vC+d3LPdP16p+cBZmdiQ9RJqdJcx5FU/99CYx1t+N121RK7u
         fuwk0canuH3nF5IgU5deJeCaLfou7OJ576FKJUg/UiDJOYOVlU/9aWbi5KdzSf5omGrY
         sFGA70kv02e1DEYYcfoFRoum0bAkWYInOOyFHYUIqPH58velHFNCJsNBb1qQd26gj2i5
         8RKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731765711; x=1732370511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6kFsusWK3wYr9nKvsV5ZFOVcNDwfam2IkmlRctzDYIs=;
        b=KVAagFyDEiC/9sA/cXURlEXGzrjtlBTIrg0OOmLtgsxSkLQB2oJulvIlTYqgX8ac9a
         6dU1BzwnTmnWLpvCbw95ORXAZMPdrdn6//y1BKLRecjP2fnD6ZgqwFxQRUEc16DN47k3
         DWve+Fs3X3ugctgIHUadu0Ioh3CoAIyxow1eOlydYNGjYPYALfGe4MgwaQaPVh490Nm7
         LWfNpFh6ejRwjktXU8xAxDcQuZGkGs69qeBn81FSJSb0SP1bA/axufEq7Agc9io0OmOg
         XNPkoSKDtxQHUM3Tm7hru/JZG2Q0I6EQd84Aw5iEBhcrTfTcd71bs9KovDmAC5bgEK1I
         Evvw==
X-Gm-Message-State: AOJu0Yyffr5gWc43rFWuMSLWKufaXWPtE95zOhtgs1iDukX5O5NVIxJI
	NRgnaLoe2lxW5H3daBRtUxACJKKseH5iCAwULmvVX3DBLnDjRL18x9070g==
X-Google-Smtp-Source: AGHT+IH9ydqqDbSib73f2pzWoiDB0MT2B48Y4ZoMikDLsrHi8JRbijQ7RVlSWXlPFlAyiHbt8yZtfQ==
X-Received: by 2002:a05:600c:1387:b0:42c:b508:750e with SMTP id 5b1f17b1804b1-432df742662mr64858115e9.11.1731765711161;
        Sat, 16 Nov 2024 06:01:51 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dac1f409sm88365025e9.37.2024.11.16.06.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 06:01:49 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] shared-mime-info: drop itstool-native from DEPENDS
Date: Sat, 16 Nov 2024 14:01:29 +0000
Message-ID: <20241116140129.133912-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Nov 2024 14:01:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207192

itstool was dropped as a dependency in shared-mime-info
release v2.2 (2022-03-27)

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
index ef5df44ad6..b8a377e2b2 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "libxml2 itstool-native glib-2.0 shared-mime-info-native xmlto-native"
+DEPENDS = "libxml2 glib-2.0 shared-mime-info-native xmlto-native"
 
 SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https;branch=master \
            file://0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch \
-- 
2.43.0



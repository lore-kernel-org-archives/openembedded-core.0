Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B73D5AE73
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:01:39 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3001.1765620095742559423
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:01:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iH//LaHh;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0ac29fca1so319495ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620095; x=1766224895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GXpJH+EPK7C3TTLdlDrDYbPzRJGwf18CmPi8X/C79wA=;
        b=iH//LaHhplkTUcEIaTIS7Z3pKn8ETkQswSc6e1fw6vTuEmEnVi7XhLNPtkDQJDLz6D
         zb/W/QcD2V9jyKBEg3c97lg7mudLFvR4yUHlm0v9iAsZpuE5UgmH8zin+Ib/k5ye+C+6
         nJ8sFtl+oVL2yt6zA7B9ACahu4uoDStA8z7R1Z+12t9qX6mX2KSSM6XimVGl2QBYMaFa
         KIQuQgF7SvSviIsdB9v5BYlahwzOrr6w1mTVBe5UtOnXIZB9X+PPusp7PDAXRKH/OO1A
         T/7St1bz/W66oejuREcbL3kw7tn0APLZwwT0mMqb/IEWgPHaKrGmpZc7bsR3nmYJizfV
         zS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620095; x=1766224895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GXpJH+EPK7C3TTLdlDrDYbPzRJGwf18CmPi8X/C79wA=;
        b=aXp4sdl46ZqlpRLROeJ3XJGgJ/YrFlQ9Q1GAtPFwNwE6bB05rbiuUcri6ytuTKbT8Q
         ZRDME97UFinxnVqZ+QUYiEbyab49onqnqEEk+LxTzUkmnsx89BLkWtYWmuA1q2Ayzlfm
         WdX2rJbgF4Rf7H2f+Q2cTHUiGty6gjPR6mdnGED/1Ca/XPKPmjxooUfBnCwIqBfW1YgQ
         zB4ejlPrZG9m7WGwTUQ5D12bWW6f7bcNGCMbR0jNbF3Ha393rxNIufmfaHYzITAIZ0kL
         F6HVLwjXDojTHJy9LzN0h5VMm/ibzwjzxrh+YIXyqAoVCY8PSft5HeyST++Jm+ramSos
         hQuA==
X-Gm-Message-State: AOJu0YwttOzzXi06ZvNoixZwYSBl3mldKMLQUFnUXMQ0I02K1uMubH8t
	Y+8xubcUNvgiuK2ug0zjePwxyfuyPrFVto89WIEEB3M6sHRw4PijxeMmaAwgXXI6
X-Gm-Gg: AY/fxX5wHYH7ztRa9RZMPihoJEbQNXCXkyC/UAkPo1A3jNPbOKlg/STYcY/REnyVz53
	n/09xcvOvjPosxS2o51TW3/22MCjxZZSFSLPadXVpSWlk8mJ+9lsUszSU4lQv6uGESXs4duVIO3
	UjFUkJ+11yw6esCGvK5l8Cje9pxPCfskUUJpAzRbp+gYNy4EpKbJydxADRBtlpWVdeBCGjIWOAZ
	OJza5zUjQEYqkSENb0IYCxXrPou2DSQ7FfVtRyQAsJMIyj9lqS+beBaI/kwihaT5oYD/FULZ9bG
	qsJaFkXzHo020k0cGtZC4y/abS/VFHHdvalUriLkWwMCBDiozCYodW31kQXL8qhHa2yc7bwgBhR
	VzDlkBMLlZGze/SEW1rk6z2mKCiGstOYtJF++HmwvW9+MmGH5IOtcBmf2VgMQ2Uy09HTy4eOMEt
	y234V3aM4N13WRHrJ7bObeHnfv
X-Google-Smtp-Source: AGHT+IEKGGoJ5gdJCpfCdRz+nFtd9xWcLN9VeWaV2VwumaFqyuYQhZAG6ML/vrfQpXT4OFMSgUMI5g==
X-Received: by 2002:a17:902:ef12:b0:28d:18fb:bb93 with SMTP id d9443c01a7336-29f23b1ecabmr49032465ad.7.1765620094891;
        Sat, 13 Dec 2025 02:01:34 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:01:34 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [OE-core][whinlatter][PATCH 42/67] libproxy: upgrade 0.5.10 -> 0.5.11
Date: Sat, 13 Dec 2025 15:29:06 +0530
Message-ID: <20251213095931.2571498-42-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:01:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227660

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/libproxy/libproxy/releases/tag/0.5.11

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 743c71314476964581df971f1a8073e14006f9c6)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libproxy/{libproxy_0.5.10.bb => libproxy_0.5.11.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libproxy/{libproxy_0.5.10.bb => libproxy_0.5.11.bb} (95%)

diff --git a/meta/recipes-support/libproxy/libproxy_0.5.10.bb b/meta/recipes-support/libproxy/libproxy_0.5.11.bb
similarity index 95%
rename from meta/recipes-support/libproxy/libproxy_0.5.10.bb
rename to meta/recipes-support/libproxy/libproxy_0.5.11.bb
index 21930ada00..1efa3cdc0e 100644
--- a/meta/recipes-support/libproxy/libproxy_0.5.10.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.5.11.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "glib-2.0"
 
 SRC_URI = "git://github.com/libproxy/libproxy;protocol=https;branch=main;tag=${PV}"
-SRCREV = "7e4852f9658084c61a95973b8a1d720b1763437a"
+SRCREV = "3fd3a6e845c0386d91abc742453d0f29bf28c404"
 
 inherit meson pkgconfig gobject-introspection vala gi-docgen
 GIDOCGEN_MESON_OPTION = 'docs'


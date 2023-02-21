Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C28A3C636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 18:15:38 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.50312.1677003330380097203
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 10:15:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lowDSRGa;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id v17-20020a0568301bd100b0068dc615ee44so965007ota.10
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IXMbMVXsdIl5T6mS4Bt2JUuiKXa/QSUENCfQ9hccdaU=;
        b=lowDSRGaKKpKvlBeeMscQNDzyYJrDelBQS7Yw81tW8TY7JwOs8w1wggEaUwzK1o28e
         ziw0l30nXVWe0qS69T7MIAneiWNBFfj8SiUqwfIrsudkieHpLWPreaIcNJTt+Rlo9P4N
         +5vRFbjhKu3EK05mhWoMt+vM/GRxqdrXLQ4XNcBEOpOt39oRHtSjBlGSrSeAQ24Fa5MO
         gA1GDg5EDSfhvuflKcHUVwv/21b0QrA/oVPg4SBh1C6f7/etN56Bv7AaD5A2FNB6Z1yU
         f/ZKFALzAemvOqIWVGTvXPg4WYWHAUHv8WRAyeFcgOTUJM7VwPZvCrYxvydyXDhsM2C3
         JlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXMbMVXsdIl5T6mS4Bt2JUuiKXa/QSUENCfQ9hccdaU=;
        b=GXqv+DRIVe8P4ggu4DirbQeZ+0f4kTkI0HphnTm8yMXPh9pCpRUnQTq9QU1lE9Df9G
         ixsDO7tmFq1zWSiEmjkcr7tu0o35mfFtorDihf/Ks/5WZdpPof765VzVO4hm498kvseB
         dfInLTMIOYIj8b9gdehMdwbMIc8t9m+Yj2zeuVZSTkOPttitk4kFqZnOex/ta6B0dRiF
         j/6dU8KqPYPC83136RgB6iow7LnoOUWp4PPYXi0BYen9l3WVAqNHaMye90+W1F4yFygA
         sSm63w/YrZwTMsEclGj46Ada9ZmVucMCikgsTgkxugshoYZviI0rm00G7UefqNac9DoE
         XINw==
X-Gm-Message-State: AO0yUKWQIVfNCuLsT+i9w0C4/iejJ2IavVIZhy0z/VYXjMLMVG9lQJjQ
	oTr1HGe6CL7Xzl0sHtJjN9Mz1NSU4Yw=
X-Google-Smtp-Source: AK7set83/beTccgR0Ih1g3ujGcux8la9tgTvDyxcNXwKvoyTGICpjQC/HGRfiNgTWvttkxqxGfZrbQ==
X-Received: by 2002:a05:6830:638c:b0:68d:3fc8:7c0f with SMTP id ch12-20020a056830638c00b0068d3fc87c0fmr2195485otb.10.1677003328836;
        Tue, 21 Feb 2023 10:15:28 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id e64-20020a4a5543000000b0051d198cf30asm1296529oob.48.2023.02.21.10.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:15:28 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] weston: Add kiosk shell
Date: Tue, 21 Feb 2023 12:15:22 -0600
Message-Id: <20230221181522.1002234-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 18:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177533

Adds support for the kiosk shell to weston. The Kiosk shell is designed
to run a fullscreen application in a "kiosk" mode, but unlike the
fullscreen shell the kiosk mode still provides traditional desktop
protocols.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-graphics/wayland/weston_11.0.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_11.0.1.bb b/meta/recipes-graphics/wayland/weston_11.0.1.bb
index b943842bc4..2daecc9856 100644
--- a/meta/recipes-graphics/wayland/weston_11.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_11.0.1.bb
@@ -42,7 +42,9 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms wayla
                    screenshare \
                    shell-desktop \
                    shell-fullscreen \
-                   shell-ivi"
+                   shell-ivi \
+                   shell-kiosk \
+                   "
 
 # Can be 'damage', 'im', 'egl', 'shm', 'touch', 'dmabuf-feedback', 'dmabuf-v4l', 'dmabuf-egl' or 'all'
 SIMPLECLIENTS ?= "all"
@@ -86,6 +88,8 @@ PACKAGECONFIG[shell-desktop] = "-Dshell-desktop=true,-Dshell-desktop=false"
 PACKAGECONFIG[shell-fullscreen] = "-Dshell-fullscreen=true,-Dshell-fullscreen=false"
 # In-Vehicle Infotainment (IVI) shell
 PACKAGECONFIG[shell-ivi] = "-Dshell-ivi=true,-Dshell-ivi=false"
+# Kiosk shell
+PACKAGECONFIG[shell-kiosk] = "-Dshell-kiosk=true,-Dshell-kiosk=false"
 # JPEG image loading support
 PACKAGECONFIG[image-jpeg] = "-Dimage-jpeg=true,-Dimage-jpeg=false, jpeg"
 # support libseat based launch
-- 
2.33.0



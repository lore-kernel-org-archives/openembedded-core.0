Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C88C77B7F
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 09:33:39 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.14838.1683106417299598365
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 02:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=lmPVSnE/;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f4000ec71dso1195565e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 02:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683106415; x=1685698415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v38ciO8KRsDl+aDSOlONf5nSu9kH5l6nVGwizMA+fI4=;
        b=lmPVSnE/lLATM8aLx3syhmV/qy+AiDgr64fcXYIhzJqDAM8L/GhmetrNIQn5zKJk6u
         vWA92+nqTvIxS+tU9dimAcwbQJmcTEPwCuz5toEaQwyGm8wwkgd+hTjLVfkTDi/cvq6h
         45IOxnXktt/MkTSp1ZbDqU11VdXffhbrEU0Rqji7CgKsMs2H2gyZUQbnJJqBJ7RqJpQ2
         xF3W/FN+QT/iYzXMgLRRUkXmKVcusWmyvkUG+6sGBt5kzU0S2udXD+vNt3ctlxFc5hOO
         GsE4vNb9t19Tgd1bhxw1XYV7EIWdgcyTdg/2NXoT1Fpr/geJIJtSnoaDlaZPcCiXYJrA
         DuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683106415; x=1685698415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v38ciO8KRsDl+aDSOlONf5nSu9kH5l6nVGwizMA+fI4=;
        b=DTQi2LTmGOWLiviRFkTl+uXsDKuRFhvEcAdk4EvBzmOeGNzvPELYuGqE76Twte501Q
         pKbRJMbnyyLUsHrIdpRNcCw409rS6FfhUa89j92iT51+u37bGXfbQ9MFLK51KBOPIXx5
         JvfBJG3JHGLkt3OHTspoP+cMErVu3YDfZnaP61bbD7JQq508gDnh6TB8y8KwhyD79TbW
         Pn2hpLVMnVTlZG4M0/gt3TUlp4jg3YD93kTipMOWOv8NQ0WjwtjsAhG580iPrYW9RE5V
         yQ1ILrrujlOTPzAvCCg30cyKiffSYf5UeygNncwb45ui1kgksyfiv54AQeK4AnxQIqjs
         m85g==
X-Gm-Message-State: AC+VfDwYwq08mzyFMp+aIHp/jVjKoEVzATAsN1+N7YMhoTuBgQymvqKC
	kDV2ItviWa4ZiwUASROSI1H494Q6SAA=
X-Google-Smtp-Source: ACHHUZ4iNnX+PFFjiexcksrdU1KumF5FDIQnv6+n60nAbQ+bilqnp3xTsUbgeRY0CEMXMRfVnQlWKw==
X-Received: by 2002:a1c:7502:0:b0:3ed:88f5:160a with SMTP id o2-20020a1c7502000000b003ed88f5160amr14186647wmc.11.1683106415439;
        Wed, 03 May 2023 02:33:35 -0700 (PDT)
Received: from debian.office.codethink.co.uk ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id q7-20020a1ce907000000b003f180d5b145sm1303413wmc.40.2023.05.03.02.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 02:33:35 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] xwininfo: upgrade to v1.1.6
Date: Wed,  3 May 2023 10:33:32 +0100
Message-Id: <20230503093332.7017-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 09:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180795

Changes:
Use xz: upstream has not released bz2.
Update license checksum: change in copyright year.
Update sha256sum and md5sum for new version.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 .../xorg-app/{xwininfo_1.1.5.bb => xwininfo_1.1.6.bb}      | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xwininfo_1.1.5.bb => xwininfo_1.1.6.bb} (56%)

diff --git a/meta/recipes-graphics/xorg-app/xwininfo_1.1.5.bb b/meta/recipes-graphics/xorg-app/xwininfo_1.1.6.bb
similarity index 56%
rename from meta/recipes-graphics/xorg-app/xwininfo_1.1.5.bb
rename to meta/recipes-graphics/xorg-app/xwininfo_1.1.6.bb
index ec9f08268e..39ec76724c 100644
--- a/meta/recipes-graphics/xorg-app/xwininfo_1.1.5.bb
+++ b/meta/recipes-graphics/xorg-app/xwininfo_1.1.6.bb
@@ -6,10 +6,11 @@ DESCRIPTION = "Xwininfo is a utility for displaying information about \
 windows.  Information may include window position, size, color depth, \
 and a number of other items."
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=78976cd3115f6faf615accc4e094d90e"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a1b9559d7b7997a6e9588012ebf8769a"
 DEPENDS += "libxext libxmu gettext-native"
 
 PE = "0"
 
-SRC_URI[md5sum] = "26d46f7ef0588d3392da3ad5802be420"
-SRC_URI[sha256sum] = "7a405441dfc476666c744f5fcd1bc8a75abf8b5b1d85db7b88b370982365080e"
+SRC_URI_EXT = "xz"
+SRC_URI[md5sum] = "c91201bc1eb5e7b38933be8d0f7f16a8"
+SRC_URI[sha256sum] = "3518897c17448df9ba99ad6d9bb1ca0f17bc0ed7c0fd61281b34ceed29a9253f"
-- 
2.30.2



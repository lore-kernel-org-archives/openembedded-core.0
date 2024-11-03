Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE42D11189
	for <webhook@archiver.kernel.org>; Sun,  3 Nov 2024 18:21:07 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.40955.1730658063964418506
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Nov 2024 10:21:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gmIi1waQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20cbca51687so32545845ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Nov 2024 10:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730658063; x=1731262863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3DEbfWnbSJnQBKnSMW+vpudOvXfZ0l3G2OsqtlCsVL4=;
        b=gmIi1waQb5ETi1/0nTRmwMKY4oMB9KOwSo3hBgJJTIdmbmPUwlw/q+R0M1XdM36wvF
         r6GWeSQFUnygwIHFNqvYm9Af0obuGONATjrv4/Nz/C+nBrCTLlxiVFbjS90Teb+fNWQz
         sb4sWegXG5xVg/bvNEhsUCDFh4xPGlm6btbhd0u4zHxmLQAS4fccOgr03UPuwDIn4Za7
         SU3o3FSb/T2PArafjiWeCGhlOOCPt8jCsbhgtoC0AXFoKDyfEDEgYMdz9IyfbZ4kkRef
         yLx4ZQyhOE877n9lblc6JndHEvAKa8FubR7P9VDV6rtriUb8J57TSppXM88fFeq5+px0
         AI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730658063; x=1731262863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3DEbfWnbSJnQBKnSMW+vpudOvXfZ0l3G2OsqtlCsVL4=;
        b=fgY4QoziJ//Kimmdva+liNsSWjmkUrA5iJ06X9LVfzKzCzVs6Ucm/6mEx4kTUotOc+
         PZhPHw89Btfflyd4wC4igAtovAjrKhNmfdArUp/FdYVCXJI778OEBFxEhN2H1+ay3mtS
         VH3bxAH/FmFOHC5gZqaGgKHTtdom3u3DbrraJsSSl/ZDAZL2op5w0UiZdjQSPKHLQrMc
         voq3TzI6NrGBF4JrGiwwLyBwvlspY48EbB49gmX7BdOoQu9VihIKN3cRQDoN/KP+PaZu
         pvK6TjgSphmUuLGmyg8HaEhErtQqCRxgKDlkrwSiFpZfPbGV4zKk0oUY3V5mlbiKwQuV
         m+bA==
X-Gm-Message-State: AOJu0YySPKg2hpwlnYlz/2pRqp8cbcNo/T+027gb5rdahA+hknPMYzsV
	Daajvl4+C0ii58Ux2JnXN/CLMRmnw2DUX/p8xu108rDUMHioHHe2jTJM2w==
X-Google-Smtp-Source: AGHT+IGuqSQSHZP8xk0RSITMTLkJ/crchFol0SZwuVLMqEdx4+9LsIIyCGiMCZ7lXO1a/EhyAGSMnA==
X-Received: by 2002:a17:902:ea01:b0:20c:e262:2568 with SMTP id d9443c01a7336-2111aec8299mr137934355ad.5.1730658063054;
        Sun, 03 Nov 2024 10:21:03 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a7c0:1be5:78d:7a64:653a:de2d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee459feb98sm5510853a12.62.2024.11.03.10.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 10:21:02 -0800 (PST)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [meta-oe][PATCH] drm-info: add recipe
Date: Sun,  3 Nov 2024 15:20:40 -0300
Message-Id: <20241103182040.25039-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Nov 2024 18:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206667

From: Hiago De Franco <hiago.franco@toradex.com>

This recipe provides information about DRM devices, useful for debugging
and checking information about DRM.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb

diff --git a/meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb b/meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb
new file mode 100644
index 000000000000..9f1cbb47fbfd
--- /dev/null
+++ b/meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Small utility to dump info about DRM devices"
+HOMEPAGE = "https://gitlab.freedesktop.org/emersion/drm_info"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=32fd56d355bd6a61017655d8da26b67c"
+
+SRC_URI = "git://gitlab.freedesktop.org/emersion/drm_info.git;branch=master;protocol=https"
+SRCREV = "c1f5ca4cf750b26eb26c1d9d5c2ef057acbcfefc"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig
+
+DEPENDS = "json-c libdrm"
-- 
2.39.5



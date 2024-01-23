Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7178C47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 14:08:48 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.13207.1706018919933190872
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 06:08:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EhpkG4Xc;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: festevam@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6dd7b2bc6bfso109065b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 06:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706018919; x=1706623719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C/6RWYiusWlwpJYhPBdvqhK/fqZKruj7DiU8jpZJ5Tk=;
        b=EhpkG4XcN8XFIG0vOzyl46f7o7ZCN7+ira3ls+usYvMbQy5KTNjMaoKucG9GeuQqb0
         eHYdiQB8ZBKYWQt9kCvg2fG67lXZWvrzwbqnb9lTOZQI4yu7zcIKyl0XflW3Kwjt6OS+
         GTbIJ+VkdXjCIsVow+mLhQrAsdQbDs5j6+D9tZ7kpnL6IVoHdzZtbeIHXQGilfTywB0Y
         Wv+rocEDn4ISKs+IkfdEEkj3hMVWpbUqRhM3BmNeAy1G4zRyc44fXliFQj1zJWY9CU1S
         XPXEtqn4plEEuCiEaRXOx+80xBeu60Esvj98f8D/uBasy9f6azIDTW+BByMBb0LD37cq
         mYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706018919; x=1706623719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/6RWYiusWlwpJYhPBdvqhK/fqZKruj7DiU8jpZJ5Tk=;
        b=BRwoECwwAD2TLhiZVD5MhEOWPo6wj8feruanHG3YloFl72sNbZdmFQx1/D7DSHSQ0/
         LSlLtsA/Q3xJHAH3BrZJvSCBvl0m897XkGhwWSiuQWBAsx5/+G2r1i6MKPj2S49C5Jeb
         eW6/nH0t3bcAvB8qdKe7QkbtoAL943O0rYddhtur8Y3K22E288tFtUX1vBIEwRL2pmef
         MSHQ9lG8g7zrj4pL/PYTooJD1DGeNOFNl6Je1zBZoc3y/hEnCW70lWzTOKlQOWHYZQa5
         epZDTHmBiMXWYkDeE3tjQHoZeFVhGk7KaoFjugkW9c2k5me56twHn79FmWNP/XFCb1Qz
         dB9g==
X-Gm-Message-State: AOJu0YzmJkYvAOGCEIwPZh+Fi/d2IIcmQLDXXaw9QSciTQHybeISz9JZ
	RQBGPsFD/Ab15z/bAplbYldsdzCgU8pDMVptnEnBYrkt8lRzA6zIr1mmbBN+
X-Google-Smtp-Source: AGHT+IEjIZmjT012HG6xbE3AsG6Po4dIhu2l3eMzgLnXhCVnpXeFxnD/jzykghs+IQ2MBYRHI3/xCg==
X-Received: by 2002:a05:6a00:6596:b0:6dd:7ae5:9dca with SMTP id hd22-20020a056a00659600b006dd7ae59dcamr1420639pfb.1.1706018918858;
        Tue, 23 Jan 2024 06:08:38 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:4739:3f89:fff4:a7a7])
        by smtp.gmail.com with ESMTPSA id 10-20020a056a00070a00b006dbe1d91426sm3669261pfl.84.2024.01.23.06.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 06:08:38 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] pulseaudio: Update to 17.0
Date: Tue, 23 Jan 2024 11:08:33 -0300
Message-Id: <20240123140833.1372704-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 14:08:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194241

From: Fabio Estevam <festevam@denx.de>

Update to pulseaudio 17.0 version.

Since pulseaudio commit e96d278bfc51 ("daemon/meson.build: Install
dbus policy in /usr, not /etc"), ${datadir} needs to be passed
in FILES, otherwise the following QA error is seen:

ERROR: pulseaudio-17.0-r0 do_package: QA Issue: pulseaudio: Files/directories were installed but not shipped in any package:
  /usr/share/dbus-1
  /usr/share/dbus-1/system.d
  /usr/share/dbus-1/system.d/pulseaudio-system.conf

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc               | 2 +-
 .../pulseaudio/{pulseaudio_16.1.bb => pulseaudio_17.0.bb}       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/pulseaudio/{pulseaudio_16.1.bb => pulseaudio_17.0.bb} (84%)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 2245a73392..a55b5d12eb 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -186,7 +186,7 @@ FILES:libpulse-mainloop-glib = "${libdir}/libpulse-mainloop-glib.so.*"
 FILES:${PN}-dev += "${libdir}/pulse-${PV}/modules/*.la ${datadir}/vala"
 FILES:${PN}-bin += "${sysconfdir}/default/volatiles/04_pulse"
 FILES:${PN}-pa-info = "${bindir}/pa-info"
-FILES:${PN}-server = "${bindir}/pulseaudio ${bindir}/start-* ${sysconfdir} ${bindir}/pactl */udev/rules.d/*.rules */*/udev/rules.d/*.rules ${systemd_user_unitdir}/*"
+FILES:${PN}-server = "${bindir}/pulseaudio ${bindir}/start-* ${datadir} ${sysconfdir} ${bindir}/pactl */udev/rules.d/*.rules */*/udev/rules.d/*.rules ${systemd_user_unitdir}/*"
 
 #SYSTEMD_PACKAGES = "${PN}-server"
 SYSTEMD_SERVICE:${PN}-server = "pulseaudio.service"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb
similarity index 84%
rename from meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb
rename to meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb
index 64002cd1cc..54c79b4097 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb
@@ -6,5 +6,5 @@ SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://volatiles.04_pulse \
            file://0001-doxygen-meson.build-remove-dependency-on-doxygen-bin.patch \
            "
-SRC_URI[sha256sum] = "8eef32ce91d47979f95fd9a935e738cd7eb7463430dabc72863251751e504ae4"
+SRC_URI[sha256sum] = "053794d6671a3e397d849e478a80b82a63cb9d8ca296bd35b73317bb5ceb87b5"
 UPSTREAM_CHECK_REGEX = "pulseaudio-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
-- 
2.37.3



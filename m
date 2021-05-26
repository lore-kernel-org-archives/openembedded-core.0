Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web08.3176.1622061639934551877
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 13:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DqZnRBS5;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id df21so3118810edb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 13:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LVVhuCCRVvClkulPOXhCA6sI4U5fg/FtDUrZWGdHRjk=;
        b=DqZnRBS5WGUk6wZ4BuOl07/KmAms4nk6f0EASW3zhHb99pTwnHl5dWNtutDP8LYiys
         APUbyLHe1kCWA1+coaRGgU4lV5qCPdX4BgzFEUiJETu57Te17kbFk86LIvVDBZy6x+cn
         Im627vVZyOLqWYP4NYilRBalS4LPuhXEBVCzLv4e3UNCQ6F8DJE2pLbosZA0MlpXXQKr
         2Gv4bOFmUbLRxIWNQxTKJnbkfAcvjRz2e4XAYXmNJcrA4/+NxDo1BFk9DcjsZRr6Emjy
         24pZmxtyH1UO+cs3TM22HEfFTDmP3vzRT5cR9iptyEiYVIL5rDuqJ+cHoSgU7pwRRD4b
         JAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LVVhuCCRVvClkulPOXhCA6sI4U5fg/FtDUrZWGdHRjk=;
        b=Gv1mAyGp76wyMWz7rAhkbu6X3K4rs8RiSZRbyhCxPEyanWuTG48/4NVKVQEISFVwPz
         ckBVid1GSk6OSx2UGmh+8ZEWmVWVLYFcCNqMLkR5ILosec53oklgPTjKR716Wv0r5ke2
         DLeg0/+Cl4w6ijo41DF4S7f9DGK7yPskyfhU0Ex3qe+Pq+sG6WkSZGTVmpRC0nZzWroN
         KPxyhIToXrbwGl5u+7ABsPgXaYgg/G+6692Sh3DyamhjalyO9W1uHrdFp4QUExWN1A8H
         q/gVnhENlF1nFRR43J2FEKLCYonI5maYGuOqCWoiZAPaplSDo3drxgu0jC4q+z6dk03c
         /atA==
X-Gm-Message-State: AOAM530+dqf2anIdazynpkjiRiz4DjBaO8LW0m7S3nX+e9/3bTfaK66w
	PV7NM//prdy1v/BrJCb27Yogi4F7ozI=
X-Google-Smtp-Source: ABdhPJybC2a0tx3pxC7xe1W7+jJUzCMeeg+F7sJcy+lm3Rm+bkEeTYD2IfQ1XCsUM2jPiQfcX9RefA==
X-Received: by 2002:a50:8e44:: with SMTP id 4mr104107edx.244.1622061638342;
        Wed, 26 May 2021 13:40:38 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id hb14sm70184ejb.118.2021.05.26.13.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 13:40:37 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/4] wayland: package target binaries into -tools, not into -dev
Date: Wed, 26 May 2021 22:40:15 +0200
Message-Id: <20210526204018.496352-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/wayland/wayland_1.19.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/wayland_1.19.0.bb b/meta/recipes-graphics/wayland/wayland_1.19.0.bb
index 8f121601c4..7e8a2884fe 100644
--- a/meta/recipes-graphics/wayland/wayland_1.19.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.19.0.bb
@@ -52,8 +52,10 @@ sysroot_stage_all_append_class-target () {
 	cp ${STAGING_DATADIR_NATIVE}/aclocal/wayland-scanner.m4 ${SYSROOT_DESTDIR}/${datadir}/aclocal/
 }
 
+PACKAGES += "${PN}-tools"
+
 FILES_${PN} = "${libdir}/*${SOLIBS}"
-FILES_${PN}-dev += "${bindir} ${datadir}/wayland"
+FILES_${PN}-tools += "${bindir} ${datadir}/wayland"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.31.1


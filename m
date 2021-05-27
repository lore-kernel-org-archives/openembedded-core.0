Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web12.5213.1622112872637167785
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 May 2021 03:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tLBdrTOz;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id lz27so7305786ejb.11
        for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 03:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LVVhuCCRVvClkulPOXhCA6sI4U5fg/FtDUrZWGdHRjk=;
        b=tLBdrTOzQCLcbruYoFsot+/TucJV31Lpl152IfRSGNb8xwW9ABSR+ydAohi9s70S2V
         u0YyRHsuUGOO1AJ4wfWpSWrCP07A81hvUrv07MFSjyIcjCoiy9C7yp4oEKj8dVeIHSEz
         Buozb6x+oCLuyRZVXA79YE5yKTPnd5mX3rzh4K07JZVQDuJU2ZApyLeJnVaOV7M13GPF
         iz6HFpGtTKlUUzJrCcXd7ZZ9qnMX3+qkbobeZfknfyEUTW6h4e4ZeR71fsuPh3mjzqQM
         d06pf2AYPxnPXTjc/jGyMW8dMplJqQg6ur99ii/rxI2MQ0WWD3uTx86S9LyRTxXw6RD3
         pAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LVVhuCCRVvClkulPOXhCA6sI4U5fg/FtDUrZWGdHRjk=;
        b=QnAqR+GRkmuZ3T0yusnDUj/SLWmvd4F11vhn+DDZAY1KPy3DdnkwpasLxstcfsKlwB
         CVPqmTpD1Q2OSkn80N5UIB7FFTr58D01TiJOL/GKFkA3bcUY6iQ7LydoE2xs6kAnk+6z
         59S/FzpVSSdDvAwocpPMblPStHrrfB02TUmHufgJAZwNo3Wlr4rz5gB1m8isWlmccSuo
         AalNmvXz2GAFMzFh4GGksHoOSuP7XXqvwxNyhLqkiJ5vwYZQLJZW6BWfWUnl+UIlzt76
         TyFDHmpuqUvtsfOB1CkdW4B6r7VoPH25PBbAVLsqmff+wcNZ3WZp8Vci8pgRBOg5zZkZ
         YvBA==
X-Gm-Message-State: AOAM530eHmcvFELzfkrjyT7MYs2Z5hDpn9INjWDrRiynnLVSVWyW7dqK
	H7Sksn/Lc/l+rok5xUL9/FiHAWTeX5c=
X-Google-Smtp-Source: ABdhPJxTwoleFnjAy/DN42EIPC+LP3eeuNqsDOI1c3WNp9/tjIY85B4/xnj/bvmcHf2WLjW3IlwmZw==
X-Received: by 2002:a17:906:44c:: with SMTP id e12mr3098367eja.57.1622112871154;
        Thu, 27 May 2021 03:54:31 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n13sm803037ejk.97.2021.05.27.03.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 03:54:30 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/4] wayland: package target binaries into -tools, not into -dev
Date: Thu, 27 May 2021 12:54:23 +0200
Message-Id: <20210527105426.515519-1-alex.kanavin@gmail.com>
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


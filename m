Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web09.6320.1623744767155543865
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vLkcyDIS;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id dj8so49872676edb.6
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fOjDW6Gf+y+AJtvKSHuQ9AFw1B5bftZF33Rh1iFU/Yk=;
        b=vLkcyDISt55vkGEO/49HUMXLPz/3gzASWCTpelMrG0/4BefQ9QVpEIj/dvN/pLGVE6
         5zlVxVSV1sz0uNdp0GqmpWpK7pgnpqfL+abP/Lr3sPnbMRCv0ODyhr4Pjx6T1QdAjP+a
         fMFMwdao4m9X+lkDKQ+v7CyqKr9LcpcSsNLzqozZPd0em26sCIOy9DhUO6eVCxcNiYF1
         eBji5PiWXxc0L2H3Nw/5LlM2fL+0BwmT5AOwVfzFYtTC/9J7zJcyIX8T39MurdVQYmeZ
         4Vt6fCC8LNnKvflRo21sTJr2WorFJFAlHSsBP6zqrxDYP0CdazBphJw+UZeNO+hQfBZm
         mRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fOjDW6Gf+y+AJtvKSHuQ9AFw1B5bftZF33Rh1iFU/Yk=;
        b=pv/u2QbCInpAyfkJb2aE6ZpUbhZ08lixrQaxSmD43FhWzO0xCQirKs6rUB38RP/OAK
         qDH6TnKz5MU0OswH04eKZC5z/Dxp+CBfdryupaUdhFJ1G6BpNY/5uy+gHBtlApQVOhLB
         A70QxE1CjzAqMdr/GoFABGUh4dSTC6jXjwRwThicjO0gnTPv6u+0XjM4N3+rWcv8jkzM
         rBxHvNRHiEccW6r8Gi5AwpCO15aVMfGcm9W4rpQraFDvypJidVImbxDZnz8X/mlKG51J
         iGvUkS9sFSyJbAUF5tiCP4IqneffcNPAtd5SNmWo3DoTKw4MpI5pMyj0eBpIk0/ug+By
         kLbQ==
X-Gm-Message-State: AOAM531KRQtbaLj5dy/7UgpIi5jufO+r/KzAWjrjLrM1tybKcpaIKs+x
	iPraUStrEYkySoWXH04xHjtKqGOAbvqnxQ==
X-Google-Smtp-Source: ABdhPJwIPIIHe0orqOh/6khmYEMSXB58SyLKokmHBhkAn7im7CtRa+IKPLjMlFPr7sGjx2m71SB+4A==
X-Received: by 2002:a05:6402:54f:: with SMTP id i15mr21430048edx.339.1623744765640;
        Tue, 15 Jun 2021 01:12:45 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:12:45 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/31] core-image-weston: bump QB_MEM to 1G in qemuarm64
Date: Tue, 15 Jun 2021 10:12:10 +0200
Message-Id: <20210615081240.1734087-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

weston tests start additional compositors, other tests are also
heavy on RAM, weston itself takes 256M with opengl enabled,
so 512M causes OOM errors on arm64.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/images/core-image-weston.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/images/core-image-weston.bb b/meta/recipes-graphics/images/core-image-weston.bb
index 62305cc1ce..e332e19368 100644
--- a/meta/recipes-graphics/images/core-image-weston.bb
+++ b/meta/recipes-graphics/images/core-image-weston.bb
@@ -10,3 +10,4 @@ CORE_IMAGE_BASE_INSTALL += "gtk+3-demo"
 CORE_IMAGE_BASE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'weston-xwayland matchbox-terminal', '', d)}"
 
 QB_MEM = "-m 512"
+QB_MEM_qemuarm64 = "-m 1024"
-- 
2.31.1


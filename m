Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.58512.1622557129058417820
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 07:18:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=H6nAZpzw;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id g6-20020a17090adac6b029015d1a9a6f1aso1610646pjx.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 07:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XK1llHXNaa5QN90hJ0vg4DppS2jBBlg5NKJtDo8p8dY=;
        b=H6nAZpzwGwuSDs2pewMDf6CIVH78tA3oL+eURuGNLnvpJGhsFErxasyRXfHV3zHhee
         Jkbj/Nj8WXMtBINt4pWhY1xafDhztYzwSWD5QGeY8s5X49qr94hi9k6fSpPm6wMbgjAu
         JbNqRaTRydNcbTcaSuXzBcsLukrWKAa1RGKGpc+EBNIDdv87PG0QSdONbqTckiqbVg2O
         Y71JQpixCFfR8/dL2G9Vp3P8KHwzNvffDHdy0yB6sRvMBFM45QNAam/oquUBwamBetTY
         igduPD0pFxR8+8HjjNSFUAzcd8QcPFVRieeA5SdOibeKneNGn5DCJGDZdMhBNKtCVBM3
         cA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XK1llHXNaa5QN90hJ0vg4DppS2jBBlg5NKJtDo8p8dY=;
        b=kaypjpUyyLQZfQb9Q9n1tU4/uQD9WkizwEgpwv3ZXgY2wZG8EkT8/0pRYd34xZkCHg
         MXvGpQhfj4PDRUi6tWk5uv+cSn/IjUSqEfjuKrvAvKGAF/BZPierFzYi1Czovl6DqOEv
         vfO9BIu4Vo1Cwi1d+gBkPB4Uy0O9AxFvmq7HWyYxNPpMgrE0rp/DFUHY31pfWTu4agS4
         6kwi/c18QASSnxbnNe0feBfAjK6i/soxIWAt9zPkhh9s8xTqSiitqaB3chLsangvYGZ0
         drpZj41RaLyMIj8PeH+A9yDGyrGyojFbcMcrymyTZcUklcOYW2X2I5YJCy2+YDnD0S4j
         cpsQ==
X-Gm-Message-State: AOAM533KtHdTjThX73rHSP6TcwdmzoQn+9hOxa/j+o3CxiRLzWSFewPv
	wnOi1ZBMsgYXlSRiwewp8SHv+couLvJu6idCJAI=
X-Google-Smtp-Source: ABdhPJxUAImwoxZPw3MVl32OQ2j7+7fC+i+RBju6rsckIlY0ZoGIFssuJTsIv+LyHelOOrZef/J1fw==
X-Received: by 2002:a17:90a:7f85:: with SMTP id m5mr25500187pjl.128.1622557128142;
        Tue, 01 Jun 2021 07:18:48 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id bb18sm2307875pjb.44.2021.06.01.07.18.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 07:18:47 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/26] busybox: make busybox's syslog.cfg depend on VIRTUAL-RUNTIME_base-utils-syslog
Date: Tue,  1 Jun 2021 04:17:56 -1000
Message-Id: <e990a9ec5d6eaf2c328d61c4de73ea6c270cfa15.1622556919.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622556919.git.steve@sakoman.com>
References: <cover.1622556919.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Volker Vogelhuber <v.vogelhuber@digitalendoscopy.de>

syslog.cfg is added to the list of sources for busybox
independent of the VIRTUAL-RUNTIME_base-utils-syslog variable. So even
if VIRTUAL-RUNTIME_base-utils-syslog being set e.g. to empty, syslogd will
be enabled. So only include syslog.cfg in SRC_URI if
VIRTUAL-RUNTIME_base-utils-syslog is set to busybox-syslog.

Signed-off-by: Volker Vogelhuber <v.vogelhuber@digitalendoscopy.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/busybox/busybox_1.31.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox_1.31.1.bb b/meta/recipes-core/busybox/busybox_1.31.1.bb
index 7563368287..93a1613df2 100644
--- a/meta/recipes-core/busybox/busybox_1.31.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.1.bb
@@ -34,7 +34,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://resize.cfg \
            ${@["", "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox')]} \
            ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager') == 'busybox-mdev')]} \
-           file://syslog.cfg \
+           ${@["", "file://syslog.cfg"][(d.getVar('VIRTUAL-RUNTIME_base-utils-syslog') == 'busybox-syslog')]} \
            file://unicode.cfg \
            file://rcS \
            file://rcK \
-- 
2.25.1


Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.36418.1629791538135099005
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 00:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Vs0oh7cf;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id v20-20020a1cf714000000b002e71f4d2026so1259910wmh.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 00:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mgBm98hP98NX7ZiSJ3WA2ez/MRo62Zt2XIOEx0E5X4M=;
        b=Vs0oh7cffkyZhMA7s1dz010P54embEyU5nmfB82568OanOqvCtzcZplLZWLiAggx5/
         MAjVMaTgKD9wyThmr1jQ/qouzT7eaS6ArKe7BLXBYMzmp3hCVXruwYOKrAg213DWkrQL
         HuHugsKxWAmatcEf5NFTkz5tnWHGNBmRKCltW8TRHkKAfz6DhqlOEf5LuFtexERXUWih
         fSWw+ilaOI+lu5feLnrQtJ1kbltR8yeMv8tgQh3wRBCzpypeQjjdVySTP8nJubutKe57
         tYO67S01F3xMEpTRt7GmDrKNrI7oeIhGt8isGK0rG6YMe1Kn2EQlZMyXrrQpXdZ64lR+
         qenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mgBm98hP98NX7ZiSJ3WA2ez/MRo62Zt2XIOEx0E5X4M=;
        b=E5MsIk7b8Gaz0AJm206F14rq4dTFjnsfiQSTvHHl8eRCvoED5FWNVcGy/hQu6tHM55
         QFm5SqeTUT9VKwJy6l2GNzotC89D6T5wFKcVuU7C24jArky3gLlXhblk8POwjJOJ4A8P
         4V5UuHkQ417J6huB2TIcMN9FuI6gDKppnp+0Tm3zUHPAR1dpYNgfrQu4EIetlgDHsdNn
         y8nH7+86G9MaO3LCSVCcWlgsi/+7WpkdBFlQSCMYK0PaRDwGef/G3m5zFPpSBDDszApf
         e7ugPc0+DVeNnsjOIKsXKvqf08ioYvlZC21LBAZcRUa4KT/+C9eHq/tgu6wcLJaKEoHL
         vCgA==
X-Gm-Message-State: AOAM530H2UuMuAP/lwVYMqufuQFkxOesT24XY/0ZcwHpA3NwjTcCrFBK
	Uf7wGbTVpCCULTtaQnq8iFgHtEjb+6+U6g==
X-Google-Smtp-Source: ABdhPJzdzdS8JgbzqTnsXsoTO2Lv7u6WK7w3QPkEuwXFDwj2N9pVrExoxQXK1rsHB4r6aM7vNg59PA==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr2762562wmc.150.1629791536637;
        Tue, 24 Aug 2021 00:52:16 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id n14sm6993891wrx.10.2021.08.24.00.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 00:52:16 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] mc: fix reproducibility
Date: Tue, 24 Aug 2021 09:52:10 +0200
Message-Id: <20210824075211.752307-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex@linutronix.de>

It is probing into what options the /usr/bin/file executable does
and does not support and bakes that into target binaries, so we
need to use a deterministic one we build ourselves.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/mc/mc_4.8.27.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mc/mc_4.8.27.bb b/meta/recipes-extended/mc/mc_4.8.27.bb
index bc2348432b..546e615d1d 100644
--- a/meta/recipes-extended/mc/mc_4.8.27.bb
+++ b/meta/recipes-extended/mc/mc_4.8.27.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "GNU Midnight Commander is a visual file manager, licensed under G
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=270bbafe360e73f9840bd7981621f9c2"
 SECTION = "console/utils"
-DEPENDS = "ncurses glib-2.0 util-linux"
+DEPENDS = "ncurses glib-2.0 util-linux file-replacement-native"
 RDEPENDS:${PN} = "ncurses-terminfo-base"
 RRECOMMENDS:${PN} = "ncurses-terminfo"
 
@@ -14,6 +14,10 @@ SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            "
 SRC_URI[sha256sum] = "2f52dd9c75c20d8eac7701bd3a8c6c125aaf8cdd9cf12b78ca50a0102b543407"
 
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".2"
+
 inherit autotools gettext pkgconfig
 
 #
@@ -25,6 +29,7 @@ PACKAGECONFIG[sftp] = "--enable-vfs-sftp,--disable-vfs-sftp,libssh2,"
 
 CFLAGS:append:libc-musl = ' -DNCURSES_WIDECHAR=1 '
 EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x --disable-configure-args"
+EXTRANATIVEPATH += "file-native"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
 CACHED_CONFIGUREVARS += "ac_cv_path_PYTHON='/usr/bin/env python'"
-- 
2.31.1


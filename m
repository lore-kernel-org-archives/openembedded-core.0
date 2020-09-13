Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.48352.1600033969214385488
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2020 14:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NVaH0N0f;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d9so10883737pfd.3
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2020 14:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HpApyJY5OtK07GcgF1lzZlixjoU9EodccAHGfc3FTWM=;
        b=NVaH0N0fkhfgoWdPIAfGj4+o5iHrayLV14HVGNUx5+S3vor6jvuKprTH71uhwcd7If
         zlVVH+/3YtJaNehxnK7xZu5FeckxDowkKgohFK1X6ZZSoYY6Vy52ThSIIWgg8G3mhyE9
         rfvcmhImDqau8TtIqOTB4FRNMOhIlgj3XjgxRBr7kywAvMTBoCq74yY509qzRYrX/nGn
         fy6vp2Tu3QYXF6lpn4y4rrlBOpzJoMakRZPfYJVFibxACNrVDCIvz1TA9kwKDwDH48R4
         McKJBA4MRzwb054jsiDsfbSXABTnrHbopvuP+kq1dD/dINCPqq18GVU2RUJpQHR6wYrC
         0yuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HpApyJY5OtK07GcgF1lzZlixjoU9EodccAHGfc3FTWM=;
        b=s4ztNxkICu5rf2gLFh3vqCwlCpaV48CTy1nNqN8sImI5+2105d5JY9sPU2NCqOIv/w
         KM1u0Z+5mszM4nwTMQSNBvfhfDGZdTUfve3zTgSj4Op3YUH2YfHj9RfX4JLULy4OuBAk
         NeNH0a3RXCmB3qBvrck5znRNsx/wVzKKmN1mqHSgtcI7+ypKXJ5TgdpeIfwN40Kvx9iO
         OLVVDAKkJs/FNGkSxE0x17+Z2UwI98Bf5ok9CHywOth1lGb+07RbN/ZXnVCT4M+6YSr5
         5391gbDht2GjU4rs5U6wBF+3jhKrKH6qeqg/f45nQekPxHSDD3bfSuoL4qrIZXNEXwmw
         8MYg==
X-Gm-Message-State: AOAM533vUjSjvoC/g4AHFp9N859K2hhafNJbPBKvvSRmAl1B48rrt58y
	lSvIA6vqRLMa++6Xu8IySLvM1jzV0zsv3w==
X-Google-Smtp-Source: ABdhPJyY1l/FboyfX9I7qB0B2z+W0j6IbxwTh23wOESX92tqUJy2ET4Y/D1g9adqUu5QidNsO2YGcQ==
X-Received: by 2002:a05:6a00:f:b029:13e:d13d:a089 with SMTP id h15-20020a056a00000fb029013ed13da089mr10532252pfk.32.1600033968211;
        Sun, 13 Sep 2020 14:52:48 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1759])
        by smtp.gmail.com with ESMTPSA id n7sm7997364pfq.114.2020.09.13.14.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 14:52:47 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/4] weston-init: Select drm/fbdev backends for qemu machines
Date: Sun, 13 Sep 2020 14:52:42 -0700
Message-Id: <20200913215244.3825034-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200913215244.3825034-1-raj.khem@gmail.com>
References: <20200913215244.3825034-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qemux86/x86_64/aarch64 supports drm backend well, therefore enable it on
these qemu machines, other qemu machines should be defaulting to fbdev,
if its not qemu then leave it empty

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: No change

 meta/recipes-graphics/wayland/weston-init.bb             | 9 +++++++++
 .../wayland/weston-init/qemux86-64/weston.ini            | 0
 .../wayland/weston-init/qemux86/weston.ini               | 0
 3 files changed, 9 insertions(+)
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/qemux86-64/weston.ini
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/qemux86/weston.ini

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 113f0ff599..07cec75fb3 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -15,6 +15,12 @@ SRC_URI = "file://init \
 
 S = "${WORKDIR}"
 
+DEFAULTBACKEND ??= ""
+DEFAULTBACKEND_qemuall ?= "fbdev"
+DEFAULTBACKEND_qemuarm64 = "drm"
+DEFAULTBACKEND_qemux86 = "drm"
+DEFAULTBACKEND_qemux86-64 = "drm"
+
 do_install() {
 	install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
 	install -D -p -m0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
@@ -36,6 +42,9 @@ do_install() {
 	install -Dm755 ${WORKDIR}/weston-start ${D}${bindir}/weston-start
 	sed -i 's,@DATADIR@,${datadir},g' ${D}${bindir}/weston-start
 	sed -i 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${bindir}/weston-start
+        if [ -n "${DEFAULTBACKEND}" ]; then
+		sed -i -e "/^\[core\]/a backend=${DEFAULTBACKEND}-backend.so" ${D}${sysconfdir}/xdg/weston/weston.ini
+	fi
 }
 
 inherit update-rc.d features_check systemd
diff --git a/meta/recipes-graphics/wayland/weston-init/qemux86-64/weston.ini b/meta/recipes-graphics/wayland/weston-init/qemux86-64/weston.ini
deleted file mode 100644
index e69de29bb2..0000000000
diff --git a/meta/recipes-graphics/wayland/weston-init/qemux86/weston.ini b/meta/recipes-graphics/wayland/weston-init/qemux86/weston.ini
deleted file mode 100644
index e69de29bb2..0000000000
-- 
2.28.0


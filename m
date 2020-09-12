Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.26488.1599944652382234053
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2020 14:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f9CStTEr;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id g21so1272288plq.1
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2020 14:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QnlzJJ6iwFGQLXu7WcY5dBsiei71Bgd2UoFCOW+W+xg=;
        b=f9CStTErnK1Z7RDEQ8Q/pY+g7ZztKWoC3SFi+0/oBB1bGpYMh7rU3dIaC8lc9JhNSI
         +iZ5kPv9kBttlvUekqt5+NCvnkYJIfnJUnGPn6MkW1rgiAhseaLuytBdllz25lRhZsjJ
         cxteG76I0iITY3pC6TzL2FJNxGOvTGxpxIG5ycvV4FLBKdpHHYUIYD4oJKenWE0tvZQL
         tFOLUi72mBbMGezICJLY0Rfeo4mj9lcxqn3zCquQ0cqE7cL9wRYb0PSy2BYFwdOg9CN8
         xtUoWETuorQNYrgtkILighpAgZqmKTkLSi8Y4QBuNdkXlI9Ao29LwQV8d2qiX+HVSLE3
         GHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QnlzJJ6iwFGQLXu7WcY5dBsiei71Bgd2UoFCOW+W+xg=;
        b=Dc/Kps2WLFGwK5tZmYhQX/Gxf1tcGu7O6/ySpDo1pv/dgtGq8aR6kM2jDQa9UJ3hJA
         31Mlcjy3PvJfCmUaultJuliGH3zVGtoPhhAuJvtORN2bS21nrl4ox1dTz4QNaM4Ejpe1
         UiwPhSBrkATGxfTsMq9JpRF+OWMTuOzc3qd/jASon/dIzlH1Yzks7QbcA/0F6gBLrbMX
         w4brD3rlJ6K6d0LirbvaCHWtyJKA/mM7P2mHEfjmG2+tQMYZG4bn1PzL2piWSskCx0yj
         /BztSOdF/JShuXAW7oNvxm5OHf0SXyC0Uq7LVgqEY5orAtMfwCXRftqe51fredT09O2o
         9YAw==
X-Gm-Message-State: AOAM531k4VucpdjvK9fZVPZnhlWeGpAWjn1lGidvvvykE1WHrWULXBtk
	Jev2wkQhLpNK0kcXqYIa6ewWU4lrzLrlkg==
X-Google-Smtp-Source: ABdhPJzQIICqThEpMwRYBq0eSrMwDcCqr+49GDx0w9AWmBljRlhQLjaY1Rywp4oDVNPysMRx608WKA==
X-Received: by 2002:a17:90a:528a:: with SMTP id w10mr7418196pjh.107.1599944651638;
        Sat, 12 Sep 2020 14:04:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d92c])
        by smtp.gmail.com with ESMTPSA id 64sm6271787pfz.204.2020.09.12.14.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 14:04:11 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/4] weston-init: Select drm/fbdev backends for qemu machines
Date: Sat, 12 Sep 2020 14:04:06 -0700
Message-Id: <20200912210406.3328090-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200912210406.3328090-1-raj.khem@gmail.com>
References: <20200912210406.3328090-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qemux86/x86_64/aarch64 supports drm backend well, therefore enable it on
these qemu machines, other qemu machines should be defaulting to fbdev,
if its not qemu then leave it empty

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
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


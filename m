Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 285A5CCA47F
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 17:04:00 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.86662.1657040634924250955
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 10:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Te//lbOR;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id li14so809735ejb.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 10:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y188UD/SyUEGwh0BODmT+vhE+eTFi8/ffxr2j2p7q4E=;
        b=Te//lbORYUvpj65k9Q7Gf1zdmjFFCvrQoxyiw7ES99sichvkGEGUMm/4iJL3wrSe3A
         +hexDJnqw9BBJBIoCZGribS2u1xpZGXvEo0WZwV3q6d5T/EYcjOBty7qDbItvnyDDQ9+
         stmPqe9lhhq65obw8BUteoqhYbS+qhO7hpwS21GpD2jC4l3lqwNmlsoxGYcnKmxcFK0v
         dGSKD3vZ77zkENDjl3JW6JQKMNvLDzx7NQEPT7BHd0ZiwL8b+hC53s9yVDxUApfPAH2p
         AYOdHL8Wy0gfCFJcIONtxVGah/PnhuA0yj52hLxIxISlnQNgxBT7y8M/eAyxA4+U7n8q
         SFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y188UD/SyUEGwh0BODmT+vhE+eTFi8/ffxr2j2p7q4E=;
        b=PHImbt1jeJqLWE6AmrXT4jtcPMv/TaJR73+N0QhBos9Co9LLjtCwPmCCnpoSOge5gG
         7kmjX8J8s1Ca0ecWOiAzjuRF9EppwqDvuWOiBZ/lNENtr6WA9vg+5ClE/JBBNcmRNoEk
         dfAOF3/igohkGvF4PeTMU/fKn1xaGpsKio7qwioPKpjN8vFP4KrGzghxuJ1i9J+jolah
         zq+VfXUXCOjKqYCZghTO/qVb69dYCtihnmGnLbV5EO17VyvYHGt+lPDYkIEm/RL5dESQ
         Yr2vidyBWP7zYoXcnprs9gcOzECMgEqMjnvgAd/zBqR5oja4XVDFW5m6g1Ng/YgJjqIZ
         GqDg==
X-Gm-Message-State: AJIora+xBPD4rPRVqlvP10lVAlKpbb/dHuc1lGlKWictChRVsXm+eC0u
	Lu8ciHeGF8Poq/ekHHCVzdghjbByAlAn6w==
X-Google-Smtp-Source: 
 AGRyM1vRaE7nk5DBHvRpSfarHoA8muLX6P94hjz+DzSMU1v09SFeko3XUr4XTj5Yd3JYhMqJ/7si9g==
X-Received: by 2002:a17:907:7dac:b0:722:3352:ac05 with SMTP id
 oz44-20020a1709077dac00b007223352ac05mr34448677ejc.421.1657040633472;
        Tue, 05 Jul 2022 10:03:53 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 x2-20020a05640225c200b00435651c4a01sm23999886edb.56.2022.07.05.10.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 10:03:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 7/7] waffle: correctly request wayland-scanner executable
Date: Tue,  5 Jul 2022 19:03:39 +0200
Message-Id: <20220705170339.771017-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220705170339.771017-1-alex@linutronix.de>
References: <20220705170339.771017-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 17:04:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167676

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...build-request-native-wayland-scanner.patch | 27 +++++++++++++++++++
 meta/recipes-graphics/waffle/waffle_1.7.0.bb  |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-graphics/waffle/waffle/0001-meson.build-request-native-wayland-scanner.patch

diff --git a/meta/recipes-graphics/waffle/waffle/0001-meson.build-request-native-wayland-scanner.patch b/meta/recipes-graphics/waffle/waffle/0001-meson.build-request-native-wayland-scanner.patch
new file mode 100644
index 0000000000..1b62db92e9
--- /dev/null
+++ b/meta/recipes-graphics/waffle/waffle/0001-meson.build-request-native-wayland-scanner.patch
@@ -0,0 +1,27 @@
+From 2195cec1e5bc66128d72049c11ff381ca4516a4b Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 5 Jul 2022 11:51:39 +0200
+Subject: [PATCH] meson.build: request native wayland-scanner
+
+This matters in cross compilation, as otherwise meson will
+try to use a cross-binary, and fail.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/waffle/-/merge_requests/110]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 0bb6128..0b6da1f 100644
+--- a/meson.build
++++ b/meson.build
+@@ -108,7 +108,7 @@ else
+     'wayland-egl', version : '>= 9.1', required : get_option('wayland'),
+   )
+   dep_wayland_scanner = dependency(
+-    'wayland-scanner', version : '>= 1.15', required : get_option('wayland'),
++    'wayland-scanner', version : '>= 1.15', required : get_option('wayland'), native: true,
+   )
+   if dep_wayland_scanner.found()
+     prog_wayland_scanner = find_program(dep_wayland_scanner.get_pkgconfig_variable('wayland_scanner'))
diff --git a/meta/recipes-graphics/waffle/waffle_1.7.0.bb b/meta/recipes-graphics/waffle/waffle_1.7.0.bb
index f1fd9e7630..dc475908d0 100644
--- a/meta/recipes-graphics/waffle/waffle_1.7.0.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.7.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
 
 SRC_URI = "git://gitlab.freedesktop.org/mesa/waffle.git;protocol=https;branch=master \
            file://0001-waffle-do-not-make-core-protocol-into-the-library.patch \
+           file://0001-meson.build-request-native-wayland-scanner.patch \
            "
 SRCREV = "905c6c10f2483adf0cbfa024e2d3c2ed541fb300"
 S = "${WORKDIR}/git"
-- 
2.30.2



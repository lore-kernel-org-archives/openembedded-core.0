Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79E8C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:50:12 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web12.28242.1658155804930223279
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=iJm/8y8h;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id y9so10804933pff.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wWZmYtNUCrDRdeA7O8i5eqXhv5Ib9cCZmKEcxaVULEg=;
        b=iJm/8y8hTpMPDeWsTQVJHt/oymoLi3YdrEMW8V2RY8trFNdnocorlWTI/YJT7/qGNK
         K6MjWwFzNgbJisSUsSfMqDPQNYl66UqBVKZwORHZYLXoedtMM628TbXLC0VYf3lNbWfg
         oKn/bVbqFkp+1CehndJjv88PVoSvcLEtNCQqc5064XII8jeOhDgvR3yI6JQNISwFUMBF
         dpaYXoHdOICtyZ0C1U5RUpfiZOFZdmoitxIcnCVVVUwzr3SJkC/KuqwsynaraEwxERQg
         HtI6ja+dKwVkxrBaiEgJJWP4S5eGnluakc2f+AliIEZoTGepqrz+DlfWB+/XUWkJu3lw
         YmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wWZmYtNUCrDRdeA7O8i5eqXhv5Ib9cCZmKEcxaVULEg=;
        b=nOjda7ITFxJj8xXHsuqZ8WttznbHKckpbGPGXXUSVVK83ce8+MvZ/UQEVIJc+5BTXh
         Mb/Je4fuQqbqQQE3pAhXJhrT5A46qQhk4Wj04p72KzxiTEClu1m8vtEUiIBLYyyHi/ZB
         TdYFyAKuFDLboHVT++gz8wF0RTifnFs6FybBzb6LabJ7krVWTdGOU9v1ayhspo/vsyve
         zPTd3oL0Eha6mPnDqPxF328Ebm9p5qXAwiMDl5aF7fIpsS8meZmJHIzGq5dEC9+KULEp
         AYBXHfKYkgCzDDzxaXayfWIZlSN/33H3nNO6wIauboN+zcsWVH4Nk2w30qi0h/zA/EaI
         ZNuA==
X-Gm-Message-State: AJIora8As8pDnN1sZ3Dk5RnrHznrFK7uOlzj5t9S+E0tsB9mc91z1H4Y
	eW8gUfu8ykbPu1OZS1k698LW1JQxlWz3LHcL
X-Google-Smtp-Source: 
 AGRyM1u32ChlNLq1dn6xT6s8TKVuwXeiWcqEM2M5s5MjgIqD/8yvC77EYiyfB0NInXEQWGmoPYjQVQ==
X-Received: by 2002:a63:484d:0:b0:419:cde7:a912 with SMTP id
 x13-20020a63484d000000b00419cde7a912mr17845454pgk.621.1658155803658;
        Mon, 18 Jul 2022 07:50:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.50.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:50:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/35] waffle: correctly request wayland-scanner
 executable
Date: Mon, 18 Jul 2022 04:48:42 -1000
Message-Id: 
 <05457e7f2a4c379082f8f39480f16b90141dc54f.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:50:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168217

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cd05e2543bde4175da67781ec6f3eebc143d95d0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1



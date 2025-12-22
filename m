Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24008E69172
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:05 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87780.1766434081463840649
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f2w2dJjF;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b7cee045187so777554266b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434080; x=1767038880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvCkJOHxq1EQQyBGrqy/+n+TGkIWRCHlNDzuOrweczc=;
        b=f2w2dJjFF4946ueL+ljO8LPTKj/f+y9i9qIv7b7Da4gAY3szP2g46ron7tV6n3XbpF
         uDyi7E208xfZq/BA8TRGPIoi0OzknuWKlS1UzbJxWBK5U2gwgX9ZC5osw/bDwpPoPUmh
         z1WW5yI3vOjS+axPOJTD0tEgqWOmkuXA8d9aVzOUe0YOW0yTLsxQ5bRDSsidUjn78HHY
         Hy3EvpzyZ8IjQbvaFRVVFpmE949Hpnx+fmp0pv4ZOjX/2ChJeCLCJHn8ybeEsie/Nvfw
         6YUfChRsq33h4qFxZi+6ObImAyZAReOpg+1DfuEKDJbnOa7QyAKuhSWcsnD+t7AxABDR
         rO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434080; x=1767038880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FvCkJOHxq1EQQyBGrqy/+n+TGkIWRCHlNDzuOrweczc=;
        b=SEZDfI5re9pM1f14hSkCZ1BYn+59rQFwUCledfs1ZCISYZN94wyIp9H6zhyAHTg4yL
         tdipBlaKeL5C8XlqX/RtqucjeF9Z7n7NyYpf4NvZNu59jSxNBWOpmHnvEG3SmyS4icGg
         5dWtkaFqjUVtsP4/loHe/Hc6LAu+gzFqoK7uDCK3xqGyJP+Fus3EipJ30YsGv40+/pWN
         AAIPRlki8SI3Iwo/puu7xIz/xkaez7FarLQObdqgXyvBWs5ZdwyiPDdp+ulKXR9fH/AS
         19zDH0mHaqqfEfukHSMxx0eRgFrzsV7LS55GQCLIsXB3C3YcYEyJ44vOe8XGy1uMXtRz
         mIxQ==
X-Gm-Message-State: AOJu0YwKQ4ZMFwZzVC9yyxZB4+Rg3x6o80gmHoZ3pZI9w1kZB/gREHbm
	7l8tjpgpaLOY5E4+Kedp1d9Puj0ziQtHJHVYY6w9r0Xg8TUvWQ0x23Phdphh3A==
X-Gm-Gg: AY/fxX77dXoa0cW+2Ngre49NSV23d8RYwfFKWGRfXFGbo6Tgh6ef2F5GSh1XCxpnQcR
	9MQd4wqYUEgRswtHI8XVuJbMkij5YIh2tvhQVH1ywy8jjd5n/pVWjOCH0phPRX2OfZNHcCG0jl3
	2R9Sn0zam22HA1b0aX2yn/QUJsI7Vw49G4Fc+XDk80p6fHzHtCrH5f0PDNGj+4Rc1M1dVRjDYRM
	hcvwXOh+iHmN8N/FaeLU395XDqPp/yIYpoFXyw1FDwswyHpOnZ1TK3Ws5vUCc+n95f4VaDmm6Pr
	BjccHzbewnkGG/VxXSZaUWSpEyMw9xn4DfF4+j22uTUeKHt0U9co3HLvHACgU6JdpZjOIYkP+nx
	H6x4+MYi1gG3L4M4LiXaCLCuEKQlQIN7rmuo9q3S06D8P+BPbxXjSlXwgYQ5tlduJydxuI8e0qI
	M3uPVbujHaDlhNSsdZkbxTJY3Xjl2lrafrR2p4uyZZG06w2Gk=
X-Google-Smtp-Source: AGHT+IENK8X7U486u8wTxtCupEbNOD2myoIoNe7Lnw/EtplMifn4Lbg5ywg1jM/D+/jyjCB8ElrJrg==
X-Received: by 2002:a17:907:3a51:b0:b73:9892:7f46 with SMTP id a640c23a62f3a-b8020632951mr1279206366b.29.1766434079781;
        Mon, 22 Dec 2025 12:07:59 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:07:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 021/114] igt-gpu-tools: upgrade 2.1 -> 2.3
Date: Mon, 22 Dec 2025 21:06:03 +0100
Message-ID: <20251222200739.2278706-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228346

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...do-not-hardcode-the-build-directory-.patch | 30 +++++++++++++++++++
 ...-gpu-tools_2.1.bb => igt-gpu-tools_2.3.bb} |  3 +-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch
 rename meta/recipes-graphics/igt-gpu-tools/{igt-gpu-tools_2.1.bb => igt-gpu-tools_2.3.bb} (93%)

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch
new file mode 100644
index 0000000000..22b9b6e30c
--- /dev/null
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch
@@ -0,0 +1,30 @@
+From 27fd94beadfc29ea4ad82f660dbdb2540d0b6b97 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Thu, 18 Dec 2025 15:45:11 +0100
+Subject: [PATCH] lib/meson.build: do not hardcode the build directory into the
+ installable library
+
+This breaks reproducibility, and is not otherwise appropriate, as the
+original directory may not exist. If there's a use case for referring to
+it, the location should be passed in with a command line switch or
+environment variable.
+
+Upstream-Status: Inappropriate [hack patching in a bogus dir; issue reported at https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/190]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ lib/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/meson.build b/lib/meson.build
+index d0487fb3c..f6452e970 100644
+--- a/lib/meson.build
++++ b/lib/meson.build
+@@ -292,7 +292,7 @@ foreach f: lib_sources
+ 	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
+ 	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
+ 	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
+-            '-DIGT_IMGDIR="@0@"'.format(imgdir),
++            '-DIGT_IMGDIR="/this/is/a/bogus/dir"',
+ 	])
+ 
+     lib_intermediates += lib
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.1.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb
similarity index 93%
rename from meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.1.bb
rename to meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb
index 96f3530436..c92d10c617 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.1.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb
@@ -9,9 +9,10 @@ LICENSE = "MIT"
 
 inherit meson pkgconfig
 
-SRCREV = "4871829d8b7117553eb2dc1bdb9a0d18de428a98"
+SRCREV = "2d7ec9a36c550c48af4bdd6e748f6753369ab8ff"
 
 SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;branch=master;tag=v${PV} \
+           file://0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch \
            "
 
 DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind kmod openssl elfutils alsa-lib json-c bison-native"
-- 
2.47.3



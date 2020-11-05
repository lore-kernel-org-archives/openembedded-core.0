Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
 by mx.groups.io with SMTP id smtpd.web12.139.1604599492397687607
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 10:04:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=C76gKVuZ;
 spf=pass (domain: linaro.org, ip: 209.85.167.196, mailfrom: anibal.limon@linaro.org)
Received: by mail-oi1-f196.google.com with SMTP id k26so2616273oiw.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2020 10:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h8nXA9KqCg8VdMlWjnfAEnKy+gpa0HpPYI57gVfy59o=;
        b=C76gKVuZ1yb/LQ+OCO3Y1ycBiG8Dye5+zk5clvxmpEEO2Ck82Daj75njKd7JVBaEVp
         H8jjSRK/1UmSKIdY0myClJZStubWVcelZ6TwHCQzFs9t+oOM57DSzdRLO8Kv7lTjdgmW
         +zlmONHaJdYPKNoCDmVyfAarlk2hIMuJtY9CRnj2vX0uSKzUaELve1ApvjfqwQjn+Xdb
         IJqPXdKdPL0G7NQzqcvD7HAzQeL806GXtPPsySBGOz6+cJfoT/79KESQvRnIHy7m8n7z
         XoD1DJnq+7Fc2QpL0X/Gf5uZWsd6XbB0CvHdXdTpoHi8zLTaQji7CXgD5/ujXeH5Dvny
         OSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h8nXA9KqCg8VdMlWjnfAEnKy+gpa0HpPYI57gVfy59o=;
        b=rm8wsD85Nbivg4jqEyCvOhNvw7nObSa7dAmhP7SD+l9/tUePHhwSWcZ4dx6ISoYtIT
         oX8jHYryRypYXJYw2aPCbbiGrHpDnm6nqzjCa4aR122klYDZwQxxO9DeuQ/r2I6avv2K
         AY5Gj0QySshrgfGVLQ6s6nMvbB9sQpTgPC9aOKqluNaAxFB4R2djSwsaDco7IL6ESLDc
         zEOPpsP9DnXtf72sxWVx+vLrNxjjvHJ5dOthbpqPzJIN9p5spXVkuMrKEzoL0cdxI4nl
         XXFlF8UETP3VwyHaREdZZmZxSf3GiokNLE0lwZVR5ZxbWmpt7QWVGL7qDVwmsPYz3uaY
         2hEQ==
X-Gm-Message-State: AOAM531LJvJY2wmYz6I+2O8c4gq1LhZkfyMuYaav2EiLVIDvhJX4hEnh
	30m6j+0H4KMdRRO7FSRtIWjaTwvpiKhV2Q==
X-Google-Smtp-Source: ABdhPJwnnuJrEp5Z+Pyj74v7feZKk8hqTc5LzvO7aqY/+s7pbHDDE5noZPhKpsWrpxytWu6hb6NBMw==
X-Received: by 2002:aca:5558:: with SMTP id j85mr399510oib.175.1604599491337;
        Thu, 05 Nov 2020 10:04:51 -0800 (PST)
Return-Path: <anibal.limon@linaro.org>
Received: from blackbox.rga.ip ([2806:109f:4:18d1:908a:c7ff:fe6a:e9f5])
        by smtp.gmail.com with ESMTPSA id a22sm512622oib.52.2020.11.05.10.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 10:04:50 -0800 (PST)
From: "Anibal Limon" <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	Martin.Jansa@gmail.com,
	nicolas.dechesne@linaro.org,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCH] recipes-graphics: libxkbcommon disable build of libxkbregistry
Date: Thu,  5 Nov 2020 12:04:47 -0600
Message-Id: <20201105180447.9553-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This library depends on libxml2 causing a build failure,

...
07:50:36 Run-time dependency xcb-xkb found: YES 1.14
07:50:36 Found CMake: NO
07:50:36 Run-time dependency libxml-2.0 found: NO (tried pkgconfig)
07:50:36
07:50:36 ../libxkbcommon-1.0.1/meson.build:329:4: ERROR: Dependency "libxml-2.0" not found, tried pkgconfig
07:50:36
07:50:36 A full log can be found at /srv/oe/build/tmp-rpb-glibc/work/cortexa53-linaro-linux/libxkbcommon/1.0.1-r0/build/meson-logs/meson-log.txt
07:50:36 WARNING: exit code 1 from a shell command.
...

According libxkbcommon PACKAGING file the libxkbregistry is suggested to
be packaged separately, users of libxkbcommon dosen't require
libxkbregistry and vice-versa, see:

https://github.com/xkbcommon/libxkbcommon/blob/master/PACKAGING

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb
index 4ef20b0721..fc35bc613b 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb
@@ -15,7 +15,7 @@ UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
 inherit meson pkgconfig
 
-EXTRA_OEMESON = "-Denable-docs=false"
+EXTRA_OEMESON = "-Denable-docs=false -Denable-xkbregistry=false"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d)}"
 PACKAGECONFIG[x11] = "-Denable-x11=true,-Denable-x11=false,libxcb xkeyboard-config,"
-- 
2.29.2


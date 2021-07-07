Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.4169.1625695533075644155
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 15:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qxgMPtr2;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id oj10-20020a17090b4d8ab0290172f77377ebso2559753pjb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jul 2021 15:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5tB0HLRDOP1m0sgqRG0yxN9DVO2gH2UrC4SlSdStpjU=;
        b=qxgMPtr20rfScQW6k8QfFWr+hkVDiLYWi2FCcb0n5hKjZVfqW8z09FKPdf16WnCcJm
         K8/K7LJOpkkk5IfHz3mAuns3DhoF0NKNau3rn2tqWa7QdOJYSh+Ae/d4dmc5pAfrmEAx
         D+5UADkG0/Ei42iLTdjjejdgFIwXd1rrwjz0BCaYlCh0oi3P4PZw0LEGdjqnzw92eJQS
         zJB2O1wRaAush0DJBRHZRU+b3jxUYS2Fti8jkEMn19AsEEiRbboOUJr9kmYaxwvPGSzc
         hY5ZcSECiAJ8CVV9p6wFD3PmdxrJzkZIQAzkzJDAHECAc2g9GNiMZYjzjDPidAQMTXwC
         2sjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5tB0HLRDOP1m0sgqRG0yxN9DVO2gH2UrC4SlSdStpjU=;
        b=BEGCjTUOOAQuSpstmvdPyyVfhYwGOEuM4gQGLA+TUfKhac8rMEOS2YUBbw96QYjl/w
         tIVim8FBaAQFJr5ahikSlLUI8j2OMeDDRtEGYUtvCUhUj9z7E7D+PhQVZ4RZyirxVP7t
         c5Gel+818jmIdaHU4ArwpYW71zoWzFR3jQ8sHDqwNGd2QgPRcnayW0OAwMsftQV5vw7m
         bn0qC/HMxjsBlvYrvh/GQamHJ3KaI195Wyln+HLZj/foRZe9Tz2+QxozQZeTaD0dAHI5
         fIz/CIW0Ja+cY9/WqEGsDI4yOo+GEz7u9lUOPKay88AgtY3/wY+wHFhPB9ERkAIs6z1I
         kq/w==
X-Gm-Message-State: AOAM532X6daN4Ypay/VQl/HJ1M90XFyehjEbmnToFL/6qqQKtoIl/2aA
	jRmQ+BwJcyW4RmrK/+IQwBXJYWsk/JClNA==
X-Google-Smtp-Source: ABdhPJxV/u9iTAQEU7X5KXezrJZu1lCxi8bUe24KNLNZhn+4ThklW25wpJszfZhHyRYa0gtHoEfp4Q==
X-Received: by 2002:a17:90b:3142:: with SMTP id ip2mr1184935pjb.63.1625695532334;
        Wed, 07 Jul 2021 15:05:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1c2d])
        by smtp.gmail.com with ESMTPSA id c20sm189828pfd.64.2021.07.07.15.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 15:05:31 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH] util-linux: Disable chfn-chsh on non-target builds
Date: Wed,  7 Jul 2021 15:05:30 -0700
Message-Id: <20210707220530.2494245-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They are also provided by shadow-native e.g. when building native
recipes and packages where they depend on both shadow-native and
util-linux-native, this can conflict

Fixes
ERROR: systemd-1_248.3-r0 do_prepare_recipe_sysroot: The file /usr/bin/chsh is installed by both util-linux-native and shadow-native, aborting

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/util-linux/util-linux_2.37.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.37.bb b/meta/recipes-core/util-linux/util-linux_2.37.bb
index 399f66d6a0..285e182e0f 100644
--- a/meta/recipes-core/util-linux/util-linux_2.37.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.37.bb
@@ -91,7 +91,7 @@ EXTRA_OECONF_append = " --disable-hwclock-gplv3"
 # build host versions during development
 #
 PACKAGECONFIG ?= "pcre2"
-PACKAGECONFIG_class-target ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
+PACKAGECONFIG_class-target ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} chfn-chsh"
 PACKAGECONFIG[pam] = "--enable-su --enable-runuser,--disable-su --disable-runuser, libpam,"
 # Respect the systemd feature for uuidd
 PACKAGECONFIG[systemd] = "--with-systemd --with-systemdsystemunitdir=${systemd_system_unitdir}, --without-systemd --without-systemdsystemunitdir,systemd"
@@ -102,6 +102,7 @@ PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 # PCRE support in hardlink
 PACKAGECONFIG[pcre2] = ",,libpcre2"
 PACKAGECONFIG[cryptsetup] = "--with-cryptsetup,--without-cryptsetup,cryptsetup"
+PACKAGECONFIG[chfn-chsh] = "--enable-chfn-chsh,--disable-chfn-chsh,"
 
 EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'"
 
-- 
2.32.0


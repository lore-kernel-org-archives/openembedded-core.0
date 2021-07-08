Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web08.480.1625770005699023709
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jul 2021 11:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hgVNg69M;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id d12so7147088pgd.9
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jul 2021 11:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X8mNds62vDmUAhDS3ivk72GHcNj2fSrfGWTdmzUqOzg=;
        b=hgVNg69MvO2kwUIadn57YkEEuzM6bloGnDyGVk0/x/LDqYW5K1eBXrIJtgCNAuu+79
         4wfVgeAQKYWBrG70+tanWkrj8YC7jdwArVpYHYY6O9mb2Cn/cm5eMFsy8IzuxvHlVeyG
         eHPYHSRbQYLsJ7PdrxDAENrMNddb3Ps6Hc2PE343dHavonPo2IIaMiIJRU9hUIqfHFbp
         NT0JGyil2ecD0q8w3Lc+TO7Xtik5BoOll2kKTeE2R5KjeTuc0cSkZjfyJ1eqw7aILi5J
         Bcv8VLkW61wINU4//yjbTeKiZUHQlSKefaVdMohl/z2tKVSipYrBwrvUbxW81PvxUc2R
         g1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X8mNds62vDmUAhDS3ivk72GHcNj2fSrfGWTdmzUqOzg=;
        b=M73/8iHDM7tcweq8RfFlfyW2aLJ2vBKWyqEafLQZlBW/WnXwGSGt6iJPk7OV3ANFU5
         F8cyWM5Kok12zw94wV3EI34Ym1JI4MhcWi60BcHRTqhpsrGEAyPvSMuKUe6DgAk8Kpjy
         nsqcXzyI9oURGCYm+MvqdmnJXE+CxWSc8HFYCUrQMgBFQ9J+szTRzi9O8YLtJ+udG09K
         acNq2TMaTPOv8Rp4C/VnQRilKBg49752Al5KfSAVLm770EpZbwG/dfatgyRHT2UQuN+j
         Gx/CH5vopsvp1VK/TgoUjLv+A/dBuumYxd6RDmhd+ZNUm3agGlT9QK6G9LJMizbMMvNi
         iZiQ==
X-Gm-Message-State: AOAM531tvIEVoFyiWZdydrvCtNKAaAE5KLGlpeTTMkwxh+6WXtkTKMRy
	WuVsG3AKykmzf08kXN1K9Ykxt6usB9XbIA==
X-Google-Smtp-Source: ABdhPJxgeMpB35iG39rAlQ1VdOMZos0OrHf9qaIl8KenUyCLFfPhwOvvBfNIP+idfVZhJjuVG9GGZw==
X-Received: by 2002:a63:4719:: with SMTP id u25mr33790557pga.193.1625770004803;
        Thu, 08 Jul 2021 11:46:44 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1c2d])
        by smtp.gmail.com with ESMTPSA id q3sm3780897pfb.184.2021.07.08.11.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 11:46:44 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH v2] util-linux: Disable chfn-chsh on non-target builds
Date: Thu,  8 Jul 2021 11:46:41 -0700
Message-Id: <20210708184641.3770350-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They are also provided by shadow-native e.g. when building native
recipes and packages where they depend on both shadow-native and
util-linux-native, this can conflict

Enable it only when pam is enabled in distro

Fixes
ERROR: systemd-1_248.3-r0 do_prepare_recipe_sysroot: The file /usr/bin/chsh is installed by both util-linux-native and shadow-native, aborting

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
---
v2: Enable chfn-chsh when pam is enabled

 meta/recipes-core/util-linux/util-linux_2.37.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.37.bb b/meta/recipes-core/util-linux/util-linux_2.37.bb
index 399f66d6a0..2548b7210b 100644
--- a/meta/recipes-core/util-linux/util-linux_2.37.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.37.bb
@@ -91,7 +91,7 @@ EXTRA_OECONF_append = " --disable-hwclock-gplv3"
 # build host versions during development
 #
 PACKAGECONFIG ?= "pcre2"
-PACKAGECONFIG_class-target ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
+PACKAGECONFIG_class-target ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'chfn-chsh pam', '', d)}"
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

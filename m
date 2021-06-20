Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web08.38856.1624225595793957936
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jun 2021 14:46:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hV5BOktw;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id y4so5146704pfi.9
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Jun 2021 14:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y7G6oeYEsYBgdj6uivcJhfXSsUDNnzvg9zEIsd5rEBA=;
        b=hV5BOktwW1ivVlVbMu2diYoGRFnqfx8keRgz1lpSQQQeLLtaMTodqfjZETwW9DRXcK
         uvUG7AZGnbxegcKyMeHSoHYOMgtNPXg3QNSMhNJaJbSG8udn3XG8vZcch+zQfS92f7s3
         WT/SHqsQdI8NFrOgIZlRZqFnMLxvdiIS+xjjLQXVO0lOxgGkOlE0fpl6QJrHwmgp/0pZ
         riVSIC+NgFBYW6E1xRKRnGju8bdC42mwf/TxibLeTd+n7cmIXy258IVqe+gG7dk8T4ey
         LpudAGUEVHbF+v1/0zgecmSQc9SXCrWkaJoqOeLWMblFdbRFZWVnifn9fAHiJhCLjMA/
         Vrgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y7G6oeYEsYBgdj6uivcJhfXSsUDNnzvg9zEIsd5rEBA=;
        b=q/Dcu7CKg6aGbrVqm0MaKNMiRHCUIc9qbgv8+C2hvOZuhdaZNVejC5zxxLOwCo1iCQ
         f9RjviTL7rtPqxBxmNLXszHE4ZerhMZ6azwSo8phy+SgXa4vT6T4wqwOCyW9tdAEQXU6
         byDf3VyeEP0h7nWuOl2pf1uI83tFu9HXu7NyJwykNz/SWBTnhah/Ou1vwOjrx1V5SKp+
         JM5Ea31HXNUpKMhA6xHuYXMuN8cpJoTgK38b1fde2UFeJ7XvJBuyetFuksP/ExhQvYbh
         sYK5Rovng8VQjsPnvsKlS6ebSV/4kT3MJijHI7FQhC6bi3RzbUrVWlpw57RrepIdWbRn
         R/Jw==
X-Gm-Message-State: AOAM532enIGG5Kael7cwJZh7su8FeVuPlL63sqVEO0lpUVzz9Tk2LRiK
	fpzZgMONiyBXU6besR/5AHYiBc4g1DdIkg==
X-Google-Smtp-Source: ABdhPJxqxraC1JX4eAsobtWaxX+lPjy2kKhm1qeIUlsh6m6si/vrGFHt6C7jxD3PHa3UFVxJVWoFqA==
X-Received: by 2002:a63:d410:: with SMTP id a16mr21185606pgh.298.1624225595221;
        Sun, 20 Jun 2021 14:46:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bfd0])
        by smtp.gmail.com with ESMTPSA id 11sm13344045pfh.182.2021.06.20.14.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jun 2021 14:46:34 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] sdk: Enable do_populate_sdk with multilibs
Date: Sun, 20 Jun 2021 14:46:32 -0700
Message-Id: <20210620214632.174567-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch enables building image based SDKs for multi-libbed images
e.g. lib32-core-image-minimal and so on. Change the path to nativesdk
tools to use recipe-sysroot since thats where the nativesdk components
are installed and it will need access to qemu wrappers during build for
processing intercepts

[YOCTO #14444]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/multilib.bbclass          | 1 -
 meta/classes/populate_sdk_base.bbclass | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 9f726e4537..2ef75c0d16 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -105,7 +105,6 @@ python __anonymous () {
         d.setVar("LINGUAS_INSTALL", "")
         # FIXME, we need to map this to something, not delete it!
         d.setVar("PACKAGE_INSTALL_ATTEMPTONLY", "")
-        bb.build.deltask('do_populate_sdk', d)
         bb.build.deltask('do_populate_sdk_ext', d)
         return
 }
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 33ba3fc3c1..f8072a9d37 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -66,7 +66,7 @@ python () {
 
 SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
 SDK_DEPENDS = "virtual/fakeroot-native ${SDK_ARCHIVE_DEPENDS} cross-localedef-native nativesdk-qemuwrapper-cross ${@' '.join(["%s-qemuwrapper-cross" % m for m in d.getVar("MULTILIB_VARIANTS").split()])} qemuwrapper-cross"
-PATH_prepend = "${STAGING_DIR_HOST}${SDKPATHNATIVE}${bindir}/crossscripts:${@":".join(all_multilib_tune_values(d, 'STAGING_BINDIR_CROSS').split())}:"
+PATH_prepend = "${WORKDIR}/recipe-sysroot/${SDKPATHNATIVE}${bindir}/crossscripts:${@":".join(all_multilib_tune_values(d, 'STAGING_BINDIR_CROSS').split())}:"
 SDK_DEPENDS += "nativesdk-glibc-locale"
 
 # We want the MULTIARCH_TARGET_SYS to point to the TUNE_PKGARCH, not PACKAGE_ARCH as it
-- 
2.32.0


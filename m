Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 988BDC83F21
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 16:23:33 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.82373.1752510210500208270
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 09:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=h/2LSL+P;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-74931666cbcso3568744b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 09:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752510210; x=1753115010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NiuSn/HFFPm1LAcFT9IbwHAzz9dbosGLLY+dTc2iJNc=;
        b=h/2LSL+PcvaCXnCJkuuuOQB4R72XhapNxM+N9DBDHh65TrNKhjAkkhzL75P7Kxtukh
         28nNmcnC0mM9ZG14q03V9ydIxpufKhZ7gC1iBvQ+QDxmEx4b6fyUmmYdtUSU+haiKhMA
         vB68H5LGBgruWeOE7sCPeMZiEr7xm95vLO+1temXUQv4dtipz0auITm3MO4tx3lGxXRR
         ftUT7T8t7mcw1ljOvuJu5iJAl7JbEXMfdz+Q3Ve5OyQvh76nTYi429HHdlEPYp6vkCmi
         hiqRonyvjtKsrb/qgAi4eryuBiYGj9wXRmccKOUcFlGpZI8smysqE8teENG36sDlD49V
         dDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752510210; x=1753115010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NiuSn/HFFPm1LAcFT9IbwHAzz9dbosGLLY+dTc2iJNc=;
        b=bHa1b6LUZvVwQ0JxCO7VRw6+nw8AvTEjlfiPqA4wsQ9kUbMUDAcK20oMoR7I6Zw+1R
         7d+K6LIXgDhvFX4EQ9SdknoPx24KftLih23Ljh4PW0N1c/EHp8wPrtBnLgGWyCxcbox0
         7xds4cs8za8riFPjocJbzVh8Jgmg/g9Nj064SponhhR3ukDBB6VQ+a3eFxFV5h73vGjQ
         s7DhIghrv+dey3v0Yv/z+zBpliqJLKPuWAfvfcA3YnIFFBhdvzdzwKSLxpcGMf1KZueU
         TEgH/NepC5usm+5A83HNUFinogwQ9L+Ly2fmK7s1jxxdjnh1h3QESGLPAGMzWIUx2w7u
         SiAA==
X-Gm-Message-State: AOJu0YwIOYLHHb/F6gc/1FUWPMP2IBw4TZCEFe8xN8w0bi05Gj41gwY7
	NstNZuafmdCqE2cxpnbRzCPqz+xgSwbBj21Ld8Mz79ntVJRgjO8iOdWu4vJWWVm99ZmsALnlg5E
	ySlnI
X-Gm-Gg: ASbGncsibs5/AaS/Tx83Duyq8qGjjuG7TUL5v4chIuZSl4tTVKlwxCA5imtPytG23cV
	SqO2YZ5gDE+Rgbb3Aabw40qHZgn9lxzRGM23pWns5L6zDjdTCM0AVdwNjMncMxT7RvwLiMs1rPr
	sKFKdZKU3LdIKn4Yrkpb23B1OI2ni+BC1dCc1oXHhPQi4//OA1aX9ja43tjg7+8ViEtykpVCwSW
	45KHQoNwFprfA+AszKB0lq+HkyhNR8fJpzF7YukRIQvcJY0BukggNKZ7anU9tZ308JtwYvt1o4E
	NNfHuPpBAHfkq9q+7eZ3UNZuAg31vJJUkN6jNd9/qfmVkLsNtJ59/p1pDmEFgwAGga5XAk0k2Al
	PGGMCNkVo9AUo
X-Google-Smtp-Source: AGHT+IHHV1K+rASb06ZgZmHuSrET9NYu2t40jOsw3/T6WBxZxwd25TgQHABX56v3Z+v4X4IiJaTWVg==
X-Received: by 2002:a05:6a00:4603:b0:748:ff39:a0ed with SMTP id d2e1a72fcca58-74ee37292e9mr18274269b3a.20.1752510209470;
        Mon, 14 Jul 2025 09:23:29 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4aa7:6b72:b465:3a4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5e8fsm10456053b3a.29.2025.07.14.09.23.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 09:23:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 09/15] sudo: upgrade 1.9.16p2 -> 1.9.17
Date: Mon, 14 Jul 2025 09:23:03 -0700
Message-ID: <1956a330b1c880da1fefe9934d28f12393fd9c71.1752509862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752509862.git.steve@sakoman.com>
References: <cover.1752509862.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 16:23:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220247

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright updated to 2025

0001-sudo.conf.in-fix-conflict-with-multilib.patch
refreshed for 1.9.17

(From OE-Core rev: c21ed3c8f4ca76ff7c65cf71a93759fad8846386)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9d41127b241133267449d81c92eb89123e8a6f48)

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-sudo.conf.in-fix-conflict-with-multilib.patch      | 6 +++---
 meta/recipes-extended/sudo/sudo.inc                         | 2 +-
 .../sudo/{sudo_1.9.16p2.bb => sudo_1.9.17.bb}               | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.16p2.bb => sudo_1.9.17.bb} (96%)

diff --git a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
index ec0384e257..1989c5abd7 100644
--- a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
+++ b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
@@ -1,4 +1,4 @@
-From 61ae82a2ba502492b6a78f248258abb71daeb227 Mon Sep 17 00:00:00 2001
+From 8c69192754ba73dd6e3273728a21aa73988f4bfb Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 17 Nov 2020 11:13:40 +0800
 Subject: [PATCH] sudo.conf.in: fix conflict with multilib
@@ -20,7 +20,7 @@ Upstream-Status: Inappropriate [OE configuration specific]
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/examples/sudo.conf.in b/examples/sudo.conf.in
-index 2187457..0908d24 100644
+index bdd676c..094341c 100644
 --- a/examples/sudo.conf.in
 +++ b/examples/sudo.conf.in
 @@ -4,7 +4,7 @@
@@ -52,7 +52,7 @@ index 2187457..0908d24 100644
  # Sudo plugin directory:
 @@ -74,7 +74,7 @@
  # The default directory to use when searching for plugins that are
- # specified without a fully qualified path name.
+ # specified without a fully-qualified path name.
  #
 -#Path plugin_dir @plugindir@
 +#Path plugin_dir $plugindir
diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 0afbf669f0..a23de1fcf7 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=0a6876cbeb2aa51837935ba3fd82ee87 \
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2841c822e587db145364ca95e9be2ffa \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
diff --git a/meta/recipes-extended/sudo/sudo_1.9.16p2.bb b/meta/recipes-extended/sudo/sudo_1.9.17.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.16p2.bb
rename to meta/recipes-extended/sudo/sudo_1.9.17.bb
index fbe507ad32..71d48f448d 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.16p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "976aa56d3e3b2a75593307864288addb748c9c136e25d95a9cc699aafa77239c"
+SRC_URI[sha256sum] = "3f212c69d534d5822b492d099abb02a593f91ca99f5afde5cb9bd3e1dcdad069"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.43.0



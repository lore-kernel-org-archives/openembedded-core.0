Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C3A7C6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:01:40 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.8788.1678888898914724162
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Qj+vYijX;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id nn12so18912165pjb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 07:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678888898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqA07mksHH2CWyX/ga6qa4nHjydLrM5Wfjo9sKoW8e4=;
        b=Qj+vYijXzCRtcl8m1t834S4hAWsV1z5d8T0BOkveLyUrRSXBen36FQKbNoP9ulHGHd
         pvFf074IP1wOo3MjvGlGTrLL8wmOG+T7Ij1KLkefLeXnj8HJwVlPj46FlGtBYgGpKRvq
         mrgoGd55nc3UAqftFcFCk09AWb816gUlNhQxyqmYYPKWXXc5OgQCbm7pWpxfveYBSj2L
         b5RgTpYblNjCpSDari7qhFFsliFTxJEyAfsapkrUmvLQYQS0hr9xkqFng385dpPAhg2D
         vupIn64dtGVkR+uqctZe5XXYTL21RrdXxv6EnKiL6SpkduMY+4HEjjutNZN4Myiiyq0U
         Tw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678888898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqA07mksHH2CWyX/ga6qa4nHjydLrM5Wfjo9sKoW8e4=;
        b=gAEqJ8idndFU+gjMaNA7ZOvQ/NYeTFXOrWLlzJoqx36o20it4Bqi+3wNWhZ5x1dvsI
         WeV03399rqhYz9wzQ6grHLu3hpaKqdTTAcToUCl4SD2SbIyi946h0GXMV0g3B+Bc+rrc
         5U5wgE4+47HZmNf8NRh98bjD1bG5axXoizNtJ1yfb4INcyQzi0bN+Inyv72DkHEt/yM0
         gJOKgSMFetUL75AtOUPcPpA+PzlIp6y9FRtRvYS8pznAoVcxaqs4yU51nmMFuIVWsXyO
         ORLv5s7v2eVawvH8mW+PGogYDSo0wqQtFHSX7QdyspYLU+uXV5b+lg+GGG1T8U4RPDLr
         D2nQ==
X-Gm-Message-State: AO0yUKVN2JcS94P4esQILaDU1Q0K0Py1Xp3q2VKBwHK7JXLxJ4jFs1je
	qcf8+F0Q+Cy1eAoRP7xTceMpkqIjReASJS+Lt4k=
X-Google-Smtp-Source: AK7set9hLUynJ1zgCMkB/zr8ZN2XxwRYmcivaUoqQM6kBeZ5RKtExoxZeMZuu+urNNCidH3rqADjsg==
X-Received: by 2002:a17:90b:390f:b0:23d:44c6:745a with SMTP id ob15-20020a17090b390f00b0023d44c6745amr10890pjb.2.1678888897870;
        Wed, 15 Mar 2023 07:01:37 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f54600b001a0432ca99csm3663755plf.269.2023.03.15.07.01.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:01:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/22] sudo: update 1.9.12p2 -> 1.9.13p3
Date: Wed, 15 Mar 2023 04:00:59 -1000
Message-Id: <b307a79caff34c0b23c72a5349f6800c48527635.1678888649.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678888649.git.steve@sakoman.com>
References: <cover.1678888649.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 14:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178559

From: Xiangyu Chen <xiangyu.chen@windriver.com>

License-update: copyright years, formatting.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...o.conf.in-fix-conflict-with-multilib.patch | 21 ++++++++++---------
 meta/recipes-extended/sudo/sudo.inc           |  2 +-
 .../{sudo_1.9.12p2.bb => sudo_1.9.13p3.bb}    |  2 +-
 3 files changed, 13 insertions(+), 12 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.12p2.bb => sudo_1.9.13p3.bb} (96%)

diff --git a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
index f4fc376bb8..041c717e00 100644
--- a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
+++ b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
@@ -1,4 +1,7 @@
-sudo.conf.in: fix conflict with multilib
+From 6e835350b7413210c410d3578cfab804186b7a4f Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Tue, 17 Nov 2020 11:13:40 +0800
+Subject: [PATCH] sudo.conf.in: fix conflict with multilib
 
 When pass ${libdir} to --libexecdir of sudo, it fails to install sudo
 and lib32-sudo at same time:
@@ -12,12 +15,13 @@ Update the comments in sudo.conf.in to avoid the conflict.
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 
 Upstream-Status: Inappropriate [OE configuration specific]
+
 ---
  examples/sudo.conf.in | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/examples/sudo.conf.in b/examples/sudo.conf.in
-index 6535d3a..50afc8f 100644
+index 2187457..0908d24 100644
 --- a/examples/sudo.conf.in
 +++ b/examples/sudo.conf.in
 @@ -4,7 +4,7 @@
@@ -33,8 +37,8 @@ index 6535d3a..50afc8f 100644
  # The compiled-in value is usually sufficient and should only be changed
  # if you rename or move the sudo_intercept.so file.
  #
--#Path intercept @plugindir@/sudo_intercept.so
-+#Path intercept $plugindir/sudo_intercept.so
+-#Path intercept @intercept_file@
++#Path intercept $intercept_file
  
  #
  # Sudo noexec:
@@ -42,8 +46,8 @@ index 6535d3a..50afc8f 100644
  # The compiled-in value is usually sufficient and should only be changed
  # if you rename or move the sudo_noexec.so file.
  #
--#Path noexec @plugindir@/sudo_noexec.so
-+#Path noexec $plugindir/sudo_noexec.so
+-#Path noexec @noexec_file@
++#Path noexec $noexec_file
  
  #
  # Sudo plugin directory:
@@ -55,7 +59,4 @@ index 6535d3a..50afc8f 100644
 +#Path plugin_dir $plugindir
  
  #
- # Sudo developer mode:
---
-2.17.1
-
+ # Core dumps:
diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index fd5bbf103d..f22b3eab99 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7aacba499777b719416b293d16f29c8c \
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5100e20d35f9015f9eef6bdb27ba194f \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
diff --git a/meta/recipes-extended/sudo/sudo_1.9.12p2.bb b/meta/recipes-extended/sudo/sudo_1.9.13p3.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.12p2.bb
rename to meta/recipes-extended/sudo/sudo_1.9.13p3.bb
index ae7207c081..2e11739470 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.12p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.13p3.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "b9a0b1ae0f1ddd9be7f3eafe70be05ee81f572f6f536632c44cd4101bb2a8539"
+SRC_URI[sha256sum] = "92334a12bb93e0c056b09f53e255ccb7d6f67c6350e2813cd9593ceeca78560b"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.34.1



Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F18C4708E
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:11 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.9357.1672830362235773377
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EPcjuyCX;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id t15so23699964wro.9
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6CZyD+fn7ikVrjsvD65V9PSnlfgrNqa1GRzM1VO5H0=;
        b=EPcjuyCX1otjqkjtPnU5wa6RelkwlhtvRxF4fWi3bPsql3niJgQdcF3zqI8Qt4IXGM
         /CtBI5+y1jLYY2fpnCaHSe+Fl7MxMG4o/TFsuzD+BrxIkjKdIMD/Q/y7Sp3mgaRq/byg
         c+m/uyB8dimd7ZYUdwJxGm0gSrV/M2zVJp5Co/JFp+Ua/dRqGGN7sW+XOo/poG61aAUh
         UO17JdaXWujqjiw3jbR0ZshJiqm3VqfOfRTOkogqLUKFRXGTDJ4kPFvQJQ/vufKUrc6R
         tYcs8JxfuAUkhagzD49rrUhbv9jYofCNc5EkUGvLB9KexbvT+g8UNH8UpVh00/OIpjLb
         l4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X6CZyD+fn7ikVrjsvD65V9PSnlfgrNqa1GRzM1VO5H0=;
        b=8QYlUxkEq/RD1Z1gcAIxME/KlGqLUNra8E2FyzDdB79xC9SBYPOgEdb4vTHDFL/CQv
         K/qCpCk9p+Ab28X0EZqJ5MoQ9O/3m/VPCvpJ6AjYEwfDZ6y4KMCPnlh+cfelS6GMKPyv
         yb8Wfd3d/gQvtMPfTRHD9gfB/SKBzRL2e4TTImeA0ShyvomH/HzkaA+BJ34/Y/llZqWI
         KNjoZDGSCTK1XGVOM5w1jQuXkqi/vJaHMBRLqXfomgQdvWGarAr77sFOKwnMV05M+AhN
         FqjYDzgWLCxX0AEv9QO+zDGShf4vAm9kHbRa4bEsBtDZe6iuU/Jku0CC7PP3wVA8rc7A
         GMPg==
X-Gm-Message-State: AFqh2kpdH4yFwPgNjDJX+MZxULZtSnYiQURhCrsmnQoeux+Ya9WMbZYk
	9gEw3rEPzhvR0/Aol1nz4m4l9vB94sk=
X-Google-Smtp-Source: AMrXdXtYSkpVTEVTgRhUYH0v1udYBLAz/UcXHCVg8qePPWOb/oWm51xRZFNsvRV6mFoDz0UgbtBN4w==
X-Received: by 2002:adf:db91:0:b0:242:ce7:ca6f with SMTP id u17-20020adfdb91000000b002420ce7ca6fmr28195867wri.26.1672830360715;
        Wed, 04 Jan 2023 03:06:00 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/77] gnupg: update 2.3.8 -> 2.4.0
Date: Wed,  4 Jan 2023 12:04:41 +0100
Message-Id: <20230104110548.2537259-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175394

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-a-custom-value-for-the-location-of-.patch |  6 ++--
 ...use-pkgconfig-instead-of-npth-config.patch |  6 ++--
 .../gnupg/gnupg/fix-ldap.patch                | 35 -------------------
 .../gnupg/gnupg/relocate.patch                |  2 +-
 .../gnupg/{gnupg_2.3.8.bb => gnupg_2.4.0.bb}  |  3 +-
 5 files changed, 8 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-support/gnupg/gnupg/fix-ldap.patch
 rename meta/recipes-support/gnupg/{gnupg_2.3.8.bb => gnupg_2.4.0.bb} (95%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index eb2e47f035..0cd4c45907 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From b0c42c8273c5fa1e31094567122be24ba28a965d Mon Sep 17 00:00:00 2001
+From 346a6b17a07b658954db65f814461b59824d9fcd Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index b043386..dd839d0 100644
+index 099c6a8..e8cf408 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1955,7 +1955,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1935,7 +1935,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
index d3790ac782..0e58fd4c4d 100644
--- a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
@@ -1,4 +1,4 @@
-From 15668161c351aee5f29152db2972b1648da11210 Mon Sep 17 00:00:00 2001
+From d9048788d906774b1475c3bb1b17e22455c2add4 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:16:30 +0800
 Subject: [PATCH] use pkgconfig instead of npth config
@@ -15,7 +15,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 8 insertions(+), 45 deletions(-)
 
 diff --git a/m4/npth.m4 b/m4/npth.m4
-index 06cdaee..4adda01 100644
+index 619ed89..0cb354d 100644
 --- a/m4/npth.m4
 +++ b/m4/npth.m4
 @@ -19,25 +19,10 @@ AC_DEFUN([_AM_PATH_NPTH_CONFIG],
@@ -25,7 +25,7 @@ index 06cdaee..4adda01 100644
 +  AC_PATH_PROG(PKGCONFIG, pkg-config, no)
  
 -  use_gpgrt_config=""
--  if test x"$NPTH_CONFIG" = x -a x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
+-  if test x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
 -    if $GPGRT_CONFIG npth --exists; then
 -      NPTH_CONFIG="$GPGRT_CONFIG npth"
 -      AC_MSG_NOTICE([Use gpgrt-config as npth-config])
diff --git a/meta/recipes-support/gnupg/gnupg/fix-ldap.patch b/meta/recipes-support/gnupg/gnupg/fix-ldap.patch
deleted file mode 100644
index 24299e16fb..0000000000
--- a/meta/recipes-support/gnupg/gnupg/fix-ldap.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 7011286ce6e1fb56c2989fdafbd11b931c489faa Mon Sep 17 00:00:00 2001
-From: NIIBE Yutaka <gniibe@fsij.org>
-Date: Fri, 14 Oct 2022 09:58:41 +0900
-Subject: [PATCH] dirmngr: Fix build with no LDAP support.
-
-* dirmngr/server.c [USE_LDAP] (start_command_handler): Conditionalize.
-
---
-
-GnuPG-bug-id: 6239
-Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
-Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=patch;h=7011286ce6e1fb56c2989fdafbd11b931c489faa]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- dirmngr/server.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/dirmngr/server.c b/dirmngr/server.c
-index 04ebfd317..98f354300 100644
---- a/dirmngr/server.c
-+++ b/dirmngr/server.c
-@@ -3137,8 +3137,10 @@ start_command_handler (assuan_fd_t fd, unsigned int session_id)
-                ctrl->refcount);
-   else
-     {
-+#if USE_LDAP
-       ks_ldap_free_state (ctrl->ks_get_state);
-       ctrl->ks_get_state = NULL;
-+#endif
-       release_ctrl_ocsp_certs (ctrl);
-       xfree (ctrl->server_local);
-       dirmngr_deinit_default_ctrl (ctrl);
--- 
-2.11.0
-
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index ca0e46141d..071dd93ff5 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From 7c6f9724f53ed2c5237dad4e3f4ec44091ac683d Mon Sep 17 00:00:00 2001
+From b1117adeb476304ce2792814516a5b7cd44d0d38 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
diff --git a/meta/recipes-support/gnupg/gnupg_2.3.8.bb b/meta/recipes-support/gnupg/gnupg_2.4.0.bb
similarity index 95%
rename from meta/recipes-support/gnupg/gnupg_2.3.8.bb
rename to meta/recipes-support/gnupg/gnupg_2.4.0.bb
index aaa8d8fe99..900aa8ad73 100644
--- a/meta/recipes-support/gnupg/gnupg_2.3.8.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.0.bb
@@ -18,13 +18,12 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
-           file://fix-ldap.patch \
            "
 SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "540b7a40e57da261fb10ef521a282e0021532a80fd023e75fb71757e8a4969ed"
+SRC_URI[sha256sum] = "1d79158dd01d992431dd2e3facb89fdac97127f89784ea2cb610c600fb0c1483"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.30.2



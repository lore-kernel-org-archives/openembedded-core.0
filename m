Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA21CD98CC
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 00:01:56 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.5173.1696982512861583482
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 17:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MluNbbcr;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.54, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6c0b8f42409so4283968a34.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 17:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696982512; x=1697587312; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mtsub06EOwxvYk/K+zvjf8vbSTgGJcgX3N0cFDIC1rM=;
        b=MluNbbcrAjf1T158SWskOqxy3XkYzOIrAoVVRnfwJ8KoY0WuyR1WSbi4SDaU/KLnmo
         t7Qvs3nLtVGF7/JK5zf+szmzIkNTw1Np8UB5oU2L4/Qom50Ufb3PHhHSjRI+zt1NXZZg
         R4FuEIHYwXCUyd6HrL7Ja60eK3ZRjkv84EfwfyxRmqiWpiwEYr1V6nEfHPjpmTfN0GvX
         NdjMZ6kzdVSLmbMjT+Fu6mk4oUp2pu4M+H1ntrZLmawr7VslR8gSHCByvWgCZkkzcf+d
         z3iKDSf4FdP3nOhThA18U5mQ/9gD8PC0s9oxNy3md6mQqqxTzUfunS4zjF4bWLDx0GwW
         EPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696982512; x=1697587312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mtsub06EOwxvYk/K+zvjf8vbSTgGJcgX3N0cFDIC1rM=;
        b=h3KvxI2xGZK8uwtyAZL8lE+qQmrCiy7C8TSCs0iirSQ00kRFv2kSZeZXRF7fvpa+8B
         5xMAiGwd7Ue5A9vm7HCcyusDzTjk7TWa/JFW+XgvpyUHom2qsphXb2fO8+RxrCQmvrZU
         rtXGlf+lmRnKcfh+XKxTZ7VZMvevOOpxoBVBFTPd3S8jZhXcIIuVwU7DK/xtF2pf2isc
         K/irPxgn3HAWqGSS4m04zG56JFmbPRWjFzcCMCEf1C1dYFYqulNDIdumQnBQjnEJ7vXd
         2BmiHXYkZopSjxR/o/NItjpoVbHBSBzW3dU7K0oL0ZTxKjNE8//1xGSHUYIp/aFYd1NA
         E0uw==
X-Gm-Message-State: AOJu0YyHxTXHsVgciZYgbSeWlv503O7v6YFove0yi6goMuMB03vTr8oe
	QI6AM/o8OYaqqsrawch+g9Z8oBXFFeZTflyvcQY=
X-Google-Smtp-Source: AGHT+IEnZx+AfNoDW1hCRpffT3nhYUAgbQNOxl3yBBXX3a+/8RfEcnAY7MWXDaZUNCdtS3CunWX4tg==
X-Received: by 2002:a9d:7c99:0:b0:6b9:bf1e:c141 with SMTP id q25-20020a9d7c99000000b006b9bf1ec141mr23314785otn.23.1696982511842;
        Tue, 10 Oct 2023 17:01:51 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a9-20020a63bd09000000b005891f3af36asm10758222pgf.87.2023.10.10.17.01.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 17:01:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 02/20] gnupg: upgrade 2.4.2 -> 2.4.3
Date: Tue, 10 Oct 2023 14:01:15 -1000
Message-Id: <e0641f1ff96e7f3835bde0196ea8d4d3a734f0f2.1696982312.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696982312.git.steve@sakoman.com>
References: <cover.1696982312.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 00:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188920

From: Alexander Kanavin <alex.kanavin@gmail.com>

New stable GnuPG release: version 2.4.3.  This version fixes some minor bugs and
improves the performance on Windows.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0c2365540ae61fe6fab61fb076ddb976ca26ce47)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-a-custom-value-for-the-location-of-.patch |  4 +--
 .../gnupg/gnupg/fix-ldap.patch                | 34 +++++++++++++++++++
 .../gnupg/gnupg/relocate.patch                |  2 +-
 .../gnupg/{gnupg_2.4.2.bb => gnupg_2.4.3.bb}  |  3 +-
 4 files changed, 39 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-support/gnupg/gnupg/fix-ldap.patch
 rename meta/recipes-support/gnupg/{gnupg_2.4.2.bb => gnupg_2.4.3.bb} (96%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 81aeaf5d3a..561616584c 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From 8b9e3d286e87bc978ec6bb9cfd790d8d253b79c3 Mon Sep 17 00:00:00 2001
+From acdb7e1d2844cd4088f099617e25352b3dc5b075 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index a547401..60bc2c5 100644
+index e68b779..eec9f89 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1922,7 +1922,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
diff --git a/meta/recipes-support/gnupg/gnupg/fix-ldap.patch b/meta/recipes-support/gnupg/gnupg/fix-ldap.patch
new file mode 100644
index 0000000000..4754781565
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/fix-ldap.patch
@@ -0,0 +1,34 @@
+From dc13361524c1477b2106c7385f2059f9ea111b84 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Wed, 5 Jul 2023 09:29:54 +0900
+Subject: [PATCH] dirmngr: Enable the call of ks_ldap_help_variables when
+ USE_LDAP.
+
+* dirmngr/server.c [USE_LDAP] (cmd_ad_query): Conditionalize.
+
+--
+
+Upstream-Status: Backport
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ dirmngr/server.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/dirmngr/server.c b/dirmngr/server.c
+index 51a149cb2..ee61f63d6 100644
+--- a/dirmngr/server.c
++++ b/dirmngr/server.c
+@@ -2776,7 +2776,9 @@ cmd_ad_query (assuan_context_t ctx, char *line)
+ 
+   if (opt_help)
+     {
++#if USE_LDAP
+       ks_ldap_help_variables (ctrl);
++#endif
+       err = 0;
+       goto leave;
+     }
+-- 
+2.11.0
+
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index f7dd12fbcc..d540e9edbb 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From c4ddea8e6070d1df51058aac08088e27c37e7e73 Mon Sep 17 00:00:00 2001
+From 0e4b325c199354ce54cc4687532cced1440fd496 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
diff --git a/meta/recipes-support/gnupg/gnupg_2.4.2.bb b/meta/recipes-support/gnupg/gnupg_2.4.3.bb
similarity index 96%
rename from meta/recipes-support/gnupg/gnupg_2.4.2.bb
rename to meta/recipes-support/gnupg/gnupg_2.4.3.bb
index 631df8ac9d..e91ef34b7d 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.2.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.3.bb
@@ -18,12 +18,13 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
+           file://fix-ldap.patch \
            "
 SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "97eb47df8ae5a3ff744f868005a090da5ab45cb48ee9836dbf5ee739a4e5cf49"
+SRC_URI[sha256sum] = "a271ae6d732f6f4d80c258ad9ee88dd9c94c8fdc33c3e45328c4d7c126bd219d"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.34.1



Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627C5EE14C9
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 16:56:52 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.4184.1694019409082959909
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 09:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Z/IU7qgU;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-99bf3f59905so597963666b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 09:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694019407; x=1694624207; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SN76d1Ot+I5ck76kuB0u8LZXrLBUt959cg3uRd/Ldc=;
        b=Z/IU7qgUWusi80vwhCDwdSrkdHY2DnG0QEJdIUwJjvk316gzNar2BQ97zbtcGhxbXO
         XOBad8/5tcBRapmyylxcakMQHQ2Z0kg711QBirFJHQywPFBQKS9lIo1/hL1VYjL03eqL
         E9i3f52F5guayi0VcQqwwqyeY6uiJD/cCPMCZsKMvCPRklniLGwKd9q6jhlEwOcljUFY
         B/b8RdgYDQHmzHdgJ5owBst49iZSkwsub+IriEWDDqUMI/k45UZUNu8NWXfc3r3cqqeU
         ZhO8nUxlgph8Ki48rizj1dcZcIEJoPxUqDzHy7X1n/XUEMzmQL6SfpujqIs1NT8H37yf
         v95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694019407; x=1694624207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/SN76d1Ot+I5ck76kuB0u8LZXrLBUt959cg3uRd/Ldc=;
        b=Ku8AwW4neJGOa9kWAV63iui2XR5YlK2Sfd1GfC6pqN7NEhKjrMeXCsLIvmowNviuKj
         sI9/jYDjWO+tk5tUIn+3Qpt04YinVdRuQN/5SSHme+fYu1EQ/QfbCdjXHWqY1mNNpcMp
         wSUSzy68C8FfhWkDz6YxUhbRQL9AtbXN9ROjMwC4DE+EKzP8pDRPsziO/KLfK5l8i0nt
         yrN2nXVyM/lI9edTgUp9t0hVsifh4Mg02y2Rr8nq880tWq9mE/CwCmePa65I7rj0XFgW
         Lg2SDjPdq1BJKXrUWHmcUQpHcK3oWs8NMzLkGrgRH8lZBs4ljb2htbK7E8IWwkx1+dKf
         ggPA==
X-Gm-Message-State: AOJu0YzSSqFXSwfChngjN0kVZf79ouoZNpst2+jaTPg/8zcIfm67mVVs
	wtU1JvyKL7KjGeH8gMkB4uya139B9L8=
X-Google-Smtp-Source: AGHT+IF6sy3H/JEC8lZQjTdzEjNwI7gb7N/ETPVmIRnRcaAF59Ob8QKVZnIhrh3nlv7vaEV+hi0t1g==
X-Received: by 2002:a17:907:770c:b0:99b:ead0:2733 with SMTP id kw12-20020a170907770c00b0099bead02733mr2466037ejc.72.1694019407420;
        Wed, 06 Sep 2023 09:56:47 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id lh7-20020a170906f8c700b0098e34446464sm9284848ejb.25.2023.09.06.09.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 09:56:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/17] gnupg: upgrade 2.4.2 -> 2.4.3
Date: Wed,  6 Sep 2023 18:56:28 +0200
Message-Id: <20230906165633.2382629-12-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230906165633.2382629-1-alex@linutronix.de>
References: <20230906165633.2382629-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 16:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187334

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-a-custom-value-for-the-location-of-.patch |  4 +--
 .../gnupg/gnupg/fix-ldap.patch                | 34 +++++++++++++++++++
 .../gnupg/gnupg/relocate.patch                |  2 +-
 .../gnupg/{gnupg_2.4.2.bb => gnupg_2.4.3.bb}  |  3 +-
 4 files changed, 39 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-support/gnupg/gnupg/fix-ldap.patch
 rename meta/recipes-support/gnupg/{gnupg_2.4.2.bb => gnupg_2.4.3.bb} (96%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 81aeaf5d3a6..561616584c9 100644
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
index 00000000000..47547815656
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
index f7dd12fbcc1..d540e9edbb0 100644
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
index 631df8ac9d7..e91ef34b7d3 100644
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
2.30.2



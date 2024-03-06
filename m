Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 932A3C54E61
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:10 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.14862.1709739726708306023
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CyTtVlQ4;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-563d56ee65cso10480154a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739725; x=1710344525; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwhYCddNsmtfY9wBSwertTyDQk+AhqNQKkQ5+emfBzw=;
        b=CyTtVlQ48Yra6Xl7EM4Li0KgYogdq4U/TwT17xankyZiOWtkyfw9ID4pKw2OapNPZf
         M6n2/AnceIeNOEHKMqO0qBEwsWsWoO8Nf4OjoUuRcDeOT3WqiHG5qEC8Z41BI72hoMvh
         K5F76LT961t1F07dYWlh0cmtlpvTFn09a8pt9FtHM628j8wHytBY8W0ydHtPWqKFu+ru
         xt0D005GTfCS2YZMvCm+/5UZHo22YeYYeCkbRzggl46O67rO97G7Bi6r0HqIvNY5vdKE
         uPg233zzno1tqDTkjdCiNld6WauRL4tlWpEMaXvb4WVEL/DAyfD+d3SpsFQBBNPs2qIu
         70ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739725; x=1710344525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FwhYCddNsmtfY9wBSwertTyDQk+AhqNQKkQ5+emfBzw=;
        b=NUg7kYPA6QBYOG9CjzbH87PRFCZAA4j/XNeO95teiRAdk3PvxNh3M6jR3UjN3YSGew
         naeIR6saVu1farwIsVARdLaoE0Jg1oMsZ7ksLCpvWVp1eRa0VPwL2nHvdWGOcdhZW+MM
         cNdyQBmHG+ySYPFv7cWmXnpDY+qhdAxca69lxOD0R+8jfGiSRQo8GnZASUvygwiExleJ
         1WfwYnpd+y+Fygc8dWgi2s/gZpjuBsiUnINLWlp5HJzEcOupkXBpPrkY36TtDS6OGgEK
         d6Fc+ftlylGdnsFQy+zEW728LYQZT48HPJ8MshEMMKrIJcrsmAtmCgfaJx04idCIy362
         H8nw==
X-Gm-Message-State: AOJu0Yz3W7KkuODtX91bxJkpzDygGjxA+7jewvX2VOgMn+LTTwxUCeGR
	UKGq5iWJasl9SaaTXwB43EWBnW1Zc+0Go8kyWKUje1p91XPutPfihoXsYuGa
X-Google-Smtp-Source: AGHT+IGg0RYZQ2m/nhIxDSbboNOWfzznFK202wJp78pWfqT4cEuxfAMuYuxIlfp9sXESCZwEkdFipw==
X-Received: by 2002:a17:906:b154:b0:a45:da1:9364 with SMTP id bt20-20020a170906b15400b00a450da19364mr7143669ejb.19.1709739725078;
        Wed, 06 Mar 2024 07:42:05 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/47] epiphany: upgrade 45.1 -> 45.3
Date: Wed,  6 Mar 2024 16:41:14 +0100
Message-Id: <20240306154151.3741709-10-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196693

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{epiphany_45.1.bb => epiphany_45.3.bb}     |  2 +-
 ...p-meson.build-disable-the-use-of-yelp.patch |  3 +--
 .../epiphany/files/distributor.patch           | 17 ++++++++++++-----
 .../epiphany/files/migrator.patch              | 18 +++++++++++++-----
 4 files changed, 27 insertions(+), 13 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_45.1.bb => epiphany_45.3.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_45.1.bb b/meta/recipes-gnome/epiphany/epiphany_45.3.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_45.1.bb
rename to meta/recipes-gnome/epiphany/epiphany_45.3.bb
index c8631e05e97..eec52e321a0 100644
--- a/meta/recipes-gnome/epiphany/epiphany_45.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_45.3.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "7c994ef34ecd60e915de331ee123c08938f9623cefada6d50b99e3c9c5ad8135"
+SRC_URI[archive.sha256sum] = "6c302e9bdd66290cb0e26f62843cd4c435a4955abdbb4f151f07dc80495d6730"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index a6c4f92c868..e5054667649 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From 77c9f87dc2b3ad0854a678e234e22dfb31902b82 Mon Sep 17 00:00:00 2001
+From bd45c75fe691e275d7a7d7e641ac66b153369a1c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
@@ -7,7 +7,6 @@ In particular this avoids calling itstool which oe-core doesn't provide.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  help/meson.build | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index b09c9b38d2e..a2800eb62d6 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,12 +1,19 @@
-Don't encode the distro from /etc/os-release into the binaries.
+From c297f5b89d7c8e98ac98e1d9a7506df6db6fc025 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Fri, 26 Feb 2021 10:17:52 +0000
+Subject: [PATCH] Don't encode the distro from /etc/os-release into the
+ binaries.
 
 Upstream-Status: Pending
 RP 2021/2/26
+---
+ meson.build | 1 +
+ 1 file changed, 1 insertion(+)
 
-Index: epiphany-3.38.2/meson.build
-===================================================================
---- epiphany-3.38.2.orig/meson.build
-+++ epiphany-3.38.2/meson.build
+diff --git a/meson.build b/meson.build
+index e416cc7..ee5f7b1 100644
+--- a/meson.build
++++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() == 0
  else
    distributor_name = 'GNOME Web'
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
index a9a650a64ad..1b4404c8cad 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,15 +1,23 @@
+From b38a4ceaeec05efb1b822d52c43590e7fd518113 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Thu, 25 Feb 2021 14:52:32 +0000
+Subject: [PATCH] epiphany: Fix reproducibility issue
+
 We don't want to encide BUILD_ROOT into target packages. This is used
 for build time tests but in our case those would be on target anyway
 do use the target paths.
 
 Upstream-Status: Pending
 RP 2021/2/25
+---
+ lib/ephy-profile-utils.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
-Index: epiphany-3.38.2/lib/ephy-profile-utils.c
-===================================================================
---- epiphany-3.38.2.orig/lib/ephy-profile-utils.c
-+++ epiphany-3.38.2/lib/ephy-profile-utils.c
-@@ -130,10 +130,10 @@ ephy_profile_utils_do_migration (const c
+diff --git a/lib/ephy-profile-utils.c b/lib/ephy-profile-utils.c
+index a2f6181..5218077 100644
+--- a/lib/ephy-profile-utils.c
++++ b/lib/ephy-profile-utils.c
+@@ -130,10 +130,10 @@ ephy_profile_utils_do_migration (const char *profile_directory,
    argv[i++] = NULL;
  
  #if DEVELOPER_MODE
-- 
2.39.2



Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77A3C352A1
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web09.1092.1649350855510444616
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pxYJNTXF;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id l26so12210283ejx.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cc+uaUo/XFUGwva25LWhoiQYLtheq1ieHtajHCHidNI=;
        b=pxYJNTXFA9iqj85cyq53R13NtcvVgLiizp0xJOUqfynvcL3fYfyRH2XSI6UXQK1kWa
         SH3Vwj6usjN2TrfmqX4e/CBi6MaUy+fQesKygZpYOgHkpaJh4dpZ1IM0cBhBOVM+00sI
         7u6AYtZnG98e1Ce5YZBivvbeQk9KfZD9rntDtdtnD/yiWaMQbr9gKLC+3nK+hPVvqfox
         btJcY59M9XZVphSEQ6vKlYnz0HENMa2SMoG9oNjjjEzPSNlQySG3Dme80uEiMIZCJ+qw
         cCThje89Fh1L1+Jw5mYn2OaTRKB6CV052QQpchkec5tGkjMiTiXnqLR8dtNTB6kJrfAH
         VjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cc+uaUo/XFUGwva25LWhoiQYLtheq1ieHtajHCHidNI=;
        b=BUK3MyFZWv8wwuvrGvXXkNxIbMPgJyh8EjL7Ut0h/Ik4nfCgWaIQbfceQCHXT+V42C
         IeyUREMzIxQUkmaACCozxGo03vcc6a+7uuYq/go6BHNdxQBquR5Z4zgTqmDh+ahzrelx
         FgpNhH4W6OrkRBmpmpjDU+pReSNIf8dWPj8OURRFIdrg/1csLwz5GNGpZQY4vo4aoMlD
         4qZBW4HjXiFpmOUybgB7GBDhuREZIcPKVGW5jZaKcek7ZU3p4JOWxTvYZNHnTQmk0B6X
         RXvK1fiIqlGPG/Zh5K7KacnGOw7q+qkDeI44YPP0wm3D2jyDGykwbfMMoc7GbmgJ6GSB
         qjQQ==
X-Gm-Message-State: AOAM532tQeATAHbFPCo2cTALLGgNXczB5UPjnrtB23I/zoLJMwFCF4VK
	IBJDeZv6HMoojCM9ud6/esvoGXMc+Yk=
X-Google-Smtp-Source: 
 ABdhPJwyKB5+SEYmeCdndg672VrJGFgfcHGmBb2kn3epvNyNXKNpf0FxS45D7k3svjLvQSj1VEEu+A==
X-Received: by 2002:a17:907:728b:b0:6df:8f3b:28ae with SMTP id
 dt11-20020a170907728b00b006df8f3b28aemr14308228ejc.336.1649350854065;
        Thu, 07 Apr 2022 10:00:54 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gt34-20020a1709072da200b006df6bb3db69sm7796879ejc.158.2022.04.07.10.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 10:00:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/17] epiphany: upgrade 41.3 -> 42.0
Date: Thu,  7 Apr 2022 19:00:25 +0200
Message-Id: <20220407170029.3500874-13-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220407170029.3500874-1-alex@linutronix.de>
References: <20220407170029.3500874-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164129

The new version uses printenv from coreutils during builds.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{epiphany_41.3.bb => epiphany_42.0.bb}    |  4 +--
 ...5f7bab38301d8a4a444173acdae8d9692146.patch | 35 -------------------
 2 files changed, 2 insertions(+), 37 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_41.3.bb => epiphany_42.0.bb} (90%)
 delete mode 100644 meta/recipes-gnome/epiphany/files/bfbb5f7bab38301d8a4a444173acdae8d9692146.patch

diff --git a/meta/recipes-gnome/epiphany/epiphany_41.3.bb b/meta/recipes-gnome/epiphany/epiphany_42.0.bb
similarity index 90%
rename from meta/recipes-gnome/epiphany/epiphany_41.3.bb
rename to meta/recipes-gnome/epiphany/epiphany_42.0.bb
index 6dca6a7305..1cf731c7d6 100644
--- a/meta/recipes-gnome/epiphany/epiphany_41.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_42.0.bb
@@ -16,6 +16,7 @@ DEPENDS = " \
           libdazzle \
           libhandy \
           glib-2.0-native \
+          coreutils-native \
           "
 
 GNOMEBASEBUILDCLASS = "meson"
@@ -24,11 +25,10 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
-           file://bfbb5f7bab38301d8a4a444173acdae8d9692146.patch \
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "ba01268ee54f318dfdac2e01eba38a3fc96940c1cbf640ed2613ae29f8bcb9ad"
+SRC_URI[archive.sha256sum] = "3dbfa8c00e45b7f44e1824d01f0febe83707b5fb9330c261173f68b7f03cd5e3"
 
 PACKAGECONFIG_SOUP ?= "soup2"
 PACKAGECONFIG ??= "${PACKAGECONFIG_SOUP}"
diff --git a/meta/recipes-gnome/epiphany/files/bfbb5f7bab38301d8a4a444173acdae8d9692146.patch b/meta/recipes-gnome/epiphany/files/bfbb5f7bab38301d8a4a444173acdae8d9692146.patch
deleted file mode 100644
index f20975c3bd..0000000000
--- a/meta/recipes-gnome/epiphany/files/bfbb5f7bab38301d8a4a444173acdae8d9692146.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From bfbb5f7bab38301d8a4a444173acdae8d9692146 Mon Sep 17 00:00:00 2001
-From: rvalue <i@rvalue.moe>
-Date: Wed, 24 Nov 2021 04:52:42 +0000
-Subject: [PATCH] Remove incorrect args for i18n.merge_file
-
-Part-of: <https://gitlab.gnome.org/GNOME/epiphany/-/merge_requests/1031>
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- data/meson.build | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/data/meson.build b/data/meson.build
-index 46df3fd80..eac6b8224 100644
---- a/data/meson.build
-+++ b/data/meson.build
-@@ -16,7 +16,6 @@ install_data(
- desktop_conf = configuration_data()
- desktop_conf.set('icon', application_id)
- desktop = i18n.merge_file(
--  'desktop',
-   input: configure_file(
-     input: files('org.gnome.Epiphany.desktop.in.in'),
-     output: 'org.gnome.Epiphany.desktop.in',
-@@ -32,7 +31,6 @@ desktop = i18n.merge_file(
- appdata_conf = configuration_data()
- appdata_conf.set('appid', application_id)
- appdata = i18n.merge_file(
--  'appdata',
-   input: configure_file(
-     input: files('org.gnome.Epiphany.appdata.xml.in.in'),
-     output: 'org.gnome.Epiphany.appdata.xml.in',
--- 
-GitLab
-
-- 
2.30.2



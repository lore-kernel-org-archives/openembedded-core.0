Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614BBEE14C7
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 16:56:52 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.4107.1694019408340224590
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 09:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Cx9VfmVz;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-99c1d03e124so555146266b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 09:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694019407; x=1694624207; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKMnfSypAlFOjD5IAP5TD8gelh1ROIVvJNWIa+P150I=;
        b=Cx9VfmVztcB2h0/Rgevw6wzr3fR8EIAshpJ+ybVvofzR5Dk/gXIfJmQiPPHnyMXfCf
         FSSBqT4h2PAv45L2AshAt+gkU/ev+6YfRoK6OiF+w0hpsIGDlvzPloFjjwp7X418HCN8
         xn1ja06UqMgAORL+FhJqOU93KQbJ629GxSoHi6DgMY8l0xqAe4GEFkdrWjTTHViW3xrR
         4IzQ8uTKitE7/8WobsFethnvUlU+9UbKUTNOk2kfs7K2LPEeAPPnmFdss9LwaGdieuVf
         bZF082M160bXQx2AWkMqr5dmRK1cZj8qCxKmxCNC+QqHUD6MlLe4Ytk2K5H+viJEw4UU
         2zRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694019407; x=1694624207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XKMnfSypAlFOjD5IAP5TD8gelh1ROIVvJNWIa+P150I=;
        b=Srm8uaPXujdbVMGSpq5Z4zuMCV0B3LS56axjtefY8qJgipDaG9qkiU/rWlPy0fuOOb
         doMQYNwB4jQmBClIMLXF9NC7Fi44ZR9hbt/WSpSThXA3AY1GD5dl+0b/MkuixT5iTZSI
         hhWwj4xldiKRkpIdvuZRhBsqVtjb0b9fzYMgbhym54fCcNpj13doYdOb3mN42ihPX6Tt
         RUlmzq1Sh2GaxHX6AaU6JNbf8B43v7S71ytM000FcUv6gXk4E59QpbxA0wJ6kk91UQ61
         51IdMQRx+YmAHw6G+KrypA7yyCA+c7Quou3ezNiHeHJ0M2CmRLeaNfhZ3Ab2YyNZ5+4O
         lipg==
X-Gm-Message-State: AOJu0Ywx9ruDxYQ1zZe8TALkE9JMOQG8kwoU1IP2CtRVvgQHvc2f2m/T
	K/cUiKsKmun5Bd7XAbyu48RtqO39daQ=
X-Google-Smtp-Source: AGHT+IHMwjMDA8bt+68E/ovtT2ydz9Z15aFK15nf5Q1c2a11wQzjxxk3xN8v05Bc5vzmFw3uFFgyng==
X-Received: by 2002:a17:907:a069:b0:9a6:4fcd:380b with SMTP id ia9-20020a170907a06900b009a64fcd380bmr2525572ejc.73.1694019406641;
        Wed, 06 Sep 2023 09:56:46 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id lh7-20020a170906f8c700b0098e34446464sm9284848ejb.25.2023.09.06.09.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 09:56:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/17] libgudev: upgrade 237 -> 238
Date: Wed,  6 Sep 2023 18:56:27 +0200
Message-Id: <20230906165633.2382629-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230906165633.2382629-1-alex@linutronix.de>
References: <20230906165633.2382629-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 16:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187333

Add patches to eudev to ensure compatibility with this version.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../udev/eudev/0001-Export-dummies-for.patch  | 82 +++++++++++++++++++
 .../eudev/0002-Bump-udev-version-to-251.patch | 23 ++++++
 meta/recipes-core/udev/eudev_3.2.12.bb        |  4 +-
 .../{libgudev_237.bb => libgudev_238.bb}      |  2 +-
 4 files changed, 109 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/udev/eudev/0001-Export-dummies-for.patch
 create mode 100644 meta/recipes-core/udev/eudev/0002-Bump-udev-version-to-251.patch
 rename meta/recipes-gnome/libgudev/{libgudev_237.bb => libgudev_238.bb} (91%)

diff --git a/meta/recipes-core/udev/eudev/0001-Export-dummies-for.patch b/meta/recipes-core/udev/eudev/0001-Export-dummies-for.patch
new file mode 100644
index 00000000000..21fbf0f824a
--- /dev/null
+++ b/meta/recipes-core/udev/eudev/0001-Export-dummies-for.patch
@@ -0,0 +1,82 @@
+From 45634cc0f09ea354be7efce2ae3d3fa8ffc181ec Mon Sep 17 00:00:00 2001
+From: Boian Bonev <bbonev@ipacct.com>
+Date: Fri, 11 Aug 2023 23:14:02 +0000
+Subject: [PATCH] Export dummies for
+
+ - udev_device_has_current_tag
+ - udev_device_get_current_tags_list_entry
+
+since the current eudev device database does not support the concept of
+current tags
+
+Upstream-Status: Submitted [https://github.com/eudev-project/eudev/pull/253]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/libudev/libudev-device.c | 11 +++++++++++
+ src/libudev/libudev.h        |  2 ++
+ src/libudev/libudev.sym      |  6 ++++++
+ 3 files changed, 19 insertions(+)
+
+diff --git a/src/libudev/libudev-device.c b/src/libudev/libudev-device.c
+index ac67ce8..7d7a662 100644
+--- a/src/libudev/libudev-device.c
++++ b/src/libudev/libudev-device.c
+@@ -1819,6 +1819,12 @@ _public_ struct udev_list_entry *udev_device_get_tags_list_entry(struct udev_dev
+         return udev_list_get_entry(&udev_device->tags_list);
+ }
+ 
++_public_ struct udev_list_entry *udev_device_get_current_tags_list_entry(struct udev_device *udev_device)
++{
++        // TODO: eudev database does not support current tags
++        return udev_device_get_tags_list_entry(udev_device);
++}
++
+ /**
+  * udev_device_has_tag:
+  * @udev_device: udev device
+@@ -1842,6 +1848,11 @@ _public_ int udev_device_has_tag(struct udev_device *udev_device, const char *ta
+         return false;
+ }
+ 
++_public_ int udev_device_has_current_tag(struct udev_device *udev_device, const char *tag) {
++        // TODO: eudev database does not support current tags
++        return udev_device_has_tag(udev_device, tag);
++}
++
+ #define ENVP_SIZE                        128
+ #define MONITOR_BUF_SIZE                4096
+ static int update_envp_monitor_buf(struct udev_device *udev_device)
+diff --git a/src/libudev/libudev.h b/src/libudev/libudev.h
+index 8491d2b..0202964 100644
+--- a/src/libudev/libudev.h
++++ b/src/libudev/libudev.h
+@@ -100,6 +100,7 @@ int udev_device_get_is_initialized(struct udev_device *udev_device);
+ struct udev_list_entry *udev_device_get_devlinks_list_entry(struct udev_device *udev_device);
+ struct udev_list_entry *udev_device_get_properties_list_entry(struct udev_device *udev_device);
+ struct udev_list_entry *udev_device_get_tags_list_entry(struct udev_device *udev_device);
++struct udev_list_entry *udev_device_get_current_tags_list_entry(struct udev_device *udev_device);
+ struct udev_list_entry *udev_device_get_sysattr_list_entry(struct udev_device *udev_device);
+ const char *udev_device_get_property_value(struct udev_device *udev_device, const char *key);
+ const char *udev_device_get_driver(struct udev_device *udev_device);
+@@ -110,6 +111,7 @@ unsigned long long int udev_device_get_usec_since_initialized(struct udev_device
+ const char *udev_device_get_sysattr_value(struct udev_device *udev_device, const char *sysattr);
+ int udev_device_set_sysattr_value(struct udev_device *udev_device, const char *sysattr, char *value);
+ int udev_device_has_tag(struct udev_device *udev_device, const char *tag);
++int udev_device_has_current_tag(struct udev_device *udev_device, const char *tag);
+ 
+ /*
+  * udev_monitor
+diff --git a/src/libudev/libudev.sym b/src/libudev/libudev.sym
+index 76726fc..d56c2ae 100644
+--- a/src/libudev/libudev.sym
++++ b/src/libudev/libudev.sym
+@@ -118,3 +118,9 @@ global:
+         udev_queue_flush;
+         udev_queue_get_fd;
+ } LIBUDEV_199;
++
++LIBUDEV_247 {
++global:
++        udev_device_has_current_tag;
++        udev_device_get_current_tags_list_entry;
++} LIBUDEV_215;
diff --git a/meta/recipes-core/udev/eudev/0002-Bump-udev-version-to-251.patch b/meta/recipes-core/udev/eudev/0002-Bump-udev-version-to-251.patch
new file mode 100644
index 00000000000..520cc38cda5
--- /dev/null
+++ b/meta/recipes-core/udev/eudev/0002-Bump-udev-version-to-251.patch
@@ -0,0 +1,23 @@
+From 7a66d4fe8aac8c8697c3cecb0c189e22524fbc98 Mon Sep 17 00:00:00 2001
+From: Boian Bonev <bbonev@ipacct.com>
+Date: Fri, 11 Aug 2023 22:08:27 +0000
+Subject: [PATCH] Bump udev version to 251
+
+Upstream-Status: Submitted [https://github.com/eudev-project/eudev/pull/253]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3e31b0e..069fdfb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1,6 +1,6 @@
+ AC_PREREQ([2.68])
+ AC_INIT([eudev],[3.2.12],[https://github.com/gentoo/eudev/issues])
+-AC_SUBST(UDEV_VERSION, 243)
++AC_SUBST(UDEV_VERSION, 251)
+ AC_CONFIG_SRCDIR([src/udev/udevd.c])
+ 
+ AC_USE_SYSTEM_EXTENSIONS
diff --git a/meta/recipes-core/udev/eudev_3.2.12.bb b/meta/recipes-core/udev/eudev_3.2.12.bb
index 572ccecafd0..e19c6c0faa4 100644
--- a/meta/recipes-core/udev/eudev_3.2.12.bb
+++ b/meta/recipes-core/udev/eudev_3.2.12.bb
@@ -12,7 +12,9 @@ PROVIDES = "udev"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://init \
            file://local.rules \
-"
+           file://0001-Export-dummies-for.patch \
+           file://0002-Bump-udev-version-to-251.patch \
+           "
 
 SRC_URI[sha256sum] = "ccdd64ec3c381d3c3ed0e99d2e70d1f62988c7763de89ca7bdffafa5eacb9ad8"
 
diff --git a/meta/recipes-gnome/libgudev/libgudev_237.bb b/meta/recipes-gnome/libgudev/libgudev_238.bb
similarity index 91%
rename from meta/recipes-gnome/libgudev/libgudev_237.bb
rename to meta/recipes-gnome/libgudev/libgudev_238.bb
index 5aa94e58f5a..6d7bafd591e 100644
--- a/meta/recipes-gnome/libgudev/libgudev_237.bb
+++ b/meta/recipes-gnome/libgudev/libgudev_238.bb
@@ -5,7 +5,7 @@ other programming languages, such as Javascript, because of GObject \
 introspection support."
 HOMEPAGE = "https://wiki.gnome.org/Projects/libgudev"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/libgudev/issues"
-SRC_URI[archive.sha256sum] = "0d06b21170d20c93e4f0534dbb9b0a8b4f1119ffb00b4031aaeb5b9148b686aa"
+SRC_URI[archive.sha256sum] = "61266ab1afc9d73dbc60a8b2af73e99d2fdff47d99544d085760e4fa667b5dd1"
 
 DEPENDS = "glib-2.0 glib-2.0-native udev"
 
-- 
2.30.2



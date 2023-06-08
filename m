Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9A0C7EE29
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 09:53:48 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.5211.1686218024157919598
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 02:53:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ERDT4zSO;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: badganchipv@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-256712d65ceso196337a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 02:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686218023; x=1688810023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJol0amWzHu9hfH7MRrGk5PhI7LjNcWqwmyO6UaJi1w=;
        b=ERDT4zSOh/Ogk+hzyxjspvZJFt9+FbLsxZM1o+SMUTc3N4Xoz4eXCTXhHu5vfSJPFC
         jQwLrMDnwCkHzb4Q+ZxI74AM4d+wEcms4+WtTJwZKLQhJun5EVrgddjU5qPqThQ7S7FF
         UTMhivDu4rK4t+Ys2WZ163XvivXTONocIDiTBL5HUmZ2phaNwE2FeeiLKzv3izkgXohx
         OuWAiozyWp3lxzsqI9vrUIedsSt3n2ZfUNunT4qf3EkInA1hYRS3omBt2Xw7oa5zCgQv
         Bb7djFy9GOummwSEb/wuxgSDu8HdFHSvLLCaVWEiHep0JDW62HX2sk+j90z+2Nme6KIz
         hm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686218023; x=1688810023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJol0amWzHu9hfH7MRrGk5PhI7LjNcWqwmyO6UaJi1w=;
        b=EJjIvZB9LCUzEWX6NagfYSiIGhFxZ85Zp1EBhfwxltosk/d6LFF8ychV3XinjxYJTS
         mECxCZDPe6jpHU3NeUXZqSMNgPgvuk2HCW1flgOTWc0GAZqYh47lvXxJRbaMi3rzK5ZF
         Wasf9Tvxiz10ouS2pLeJN6fxMpAl/wntuTHzebDTLT0Y5bik2lcp9Jbx/RMi0DUIMwdC
         2yPe9WpM87bA9ZtfkL8SIAobFHD9C1IcxFNeDWfjnOB6aFwlIeX7DSHnvztTv6N6wPGQ
         HARgRnNkJBHrMB9eP9HOUBJYrBIU69T60N+EIyjpYvq3PViW/rfnCjH0roiLveLX3yk7
         H2Sw==
X-Gm-Message-State: AC+VfDyUn1piB86scSE4ed9g+AGVjU4shDfWgmdTD4dKj6AK3B4fQ2JC
	3adCzE9Kwu1X9DrdyNvsOKh9N3Snk8pwLg==
X-Google-Smtp-Source: ACHHUZ4/tNcneeG94i4R3zVjeN+nFKc7wZGMxyf0yDwilDqzRyyGe/klRZ2iFlBZtazxQmX82hV7bA==
X-Received: by 2002:a17:90b:38ca:b0:24b:2fc1:8a9c with SMTP id nn10-20020a17090b38ca00b0024b2fc18a9cmr3579228pjb.11.1686218023274;
        Thu, 08 Jun 2023 02:53:43 -0700 (PDT)
Received: from L-10146.. ([2401:4900:1c8f:1608:8a48:2239:9afa:7e73])
        by smtp.gmail.com with ESMTPSA id 15-20020a17090a01cf00b00252d960a8dfsm2885963pjd.16.2023.06.08.02.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 02:53:43 -0700 (PDT)
From: pawan <badganchipv@gmail.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][dunfell][PATCH 2/2] systemd: support to list only initialized/uninitialized devices
Date: Thu,  8 Jun 2023 15:22:27 +0530
Message-Id: <20230608095227.34548-2-badganchipv@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230608095227.34548-1-badganchipv@gmail.com>
References: <20230608095227.34548-1-badganchipv@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 09:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182501

This patch filter devices by properties and return a sorted list
only initialized/uninitialized devices.

Signed-off-by: Pawan Badganchi <badganchipv@gmail.com>
---
 ...initialized-or-uninitialized-devices.patch | 192 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_244.5.bb    |   1 +
 2 files changed, 193 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-sd-device-enumerator-support-to-list-only-initialized-or-uninitialized-devices.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-sd-device-enumerator-support-to-list-only-initialized-or-uninitialized-devices.patch b/meta/recipes-core/systemd/systemd/0001-sd-device-enumerator-support-to-list-only-initialized-or-uninitialized-devices.patch
new file mode 100644
index 0000000000..9ebd044343
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-sd-device-enumerator-support-to-list-only-initialized-or-uninitialized-devices.patch
@@ -0,0 +1,192 @@
+From d8b50e5df7e01983279e70c6d970fb60d053df97 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Tue, 8 Mar 2022 13:58:02 +0900
+Subject: [PATCH] sd-device-enumerator: support to list only initialized or
+ uninitialized devices
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/d8b50e5df7e01983279e70c6d970fb60d053df97.patch]
+Comment: Refreshed hunk from device-enumerator-private.h and device-enumerator.c
+Add "errno.h" header file to fix below compiler error.
+error: 'EINVAL' undeclared here (not in a function)
+12 _MATCH_INITIALIZED_INVALID = -EINVAL
+Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
+---
+ .../sd-device/device-enumerator-private.h     | 11 ++-
+ src/libsystemd/sd-device/device-enumerator.c  | 71 +++++++++++--------
+ src/libudev/libudev-enumerate.c               |  2 +-
+ 3 files changed, 54 insertions(+), 30 deletions(-)
+
+diff --git a/src/libsystemd/sd-device/device-enumerator-private.h b/src/libsystemd/sd-device/device-enumerator-private.h
+index d74198822ca3..54fc13c43b22 100644
+--- a/src/libsystemd/sd-device/device-enumerator-private.h
++++ b/src/libsystemd/sd-device/device-enumerator-private.h
+@@ -1,12 +1,23 @@
+ /* SPDX-License-Identifier: LGPL-2.1+ */
+ #pragma once
+ 
++#include <errno.h>
++
+ #include "sd-device.h"
+ 
++typedef enum MatchInitializedType {
++        MATCH_INITIALIZED_NO,     /* only devices without a db entry */
++        MATCH_INITIALIZED_YES,    /* only devices with a db entry */
++        MATCH_INITIALIZED_ALL,    /* all devices */
++        MATCH_INITIALIZED_COMPAT, /* only devices that have no devnode/ifindex or have a db entry */
++        _MATCH_INITIALIZED_MAX,
++        _MATCH_INITIALIZED_INVALID = -EINVAL,
++} MatchInitializedType;
++
+ int device_enumerator_scan_devices(sd_device_enumerator *enumeartor);
+ int device_enumerator_scan_subsystems(sd_device_enumerator *enumeartor);
+ int device_enumerator_add_device(sd_device_enumerator *enumerator, sd_device *device);
+-int device_enumerator_add_match_is_initialized(sd_device_enumerator *enumerator);
++int device_enumerator_add_match_is_initialized(sd_device_enumerator *enumerator, MatchInitializedType type);
+ int device_enumerator_add_match_parent_incremental(sd_device_enumerator *enumerator, sd_device *parent);
+ sd_device *device_enumerator_get_first(sd_device_enumerator *enumerator);
+ sd_device *device_enumerator_get_next(sd_device_enumerator *enumerator);
+diff --git a/src/libsystemd/sd-device/device-enumerator.c b/src/libsystemd/sd-device/device-enumerator.c
+index df8753dec9b4..1379764156ee 100644
+--- a/src/libsystemd/sd-device/device-enumerator.c
++++ b/src/libsystemd/sd-device/device-enumerator.c
+@@ -44,7 +44,7 @@ struct sd_device_enumerator {
+         Set *match_sysname;
+         Set *match_tag;
+         Set *match_parent;
+-        bool match_allow_uninitialized;
++        MatchInitializedType match_initialized;
+ };
+ 
+ _public_ int sd_device_enumerator_new(sd_device_enumerator **ret) {
+@@ -59,6 +59,7 @@ _public_ int sd_device_enumerator_new(sd_device_enumerator **ret) {
+         *enumerator = (sd_device_enumerator) {
+                 .n_ref = 1,
+                 .type = _DEVICE_ENUMERATION_TYPE_INVALID,
++                .match_initialized = MATCH_INITIALIZED_COMPAT,
+         };
+ 
+         *ret = TAKE_PTR(enumerator);
+@@ -259,17 +259,18 @@
+ _public_ int sd_device_enumerator_allow_uninitialized(sd_device_enumerator *enumerator) {
+         assert_return(enumerator, -EINVAL);
+ 
+-        enumerator->match_allow_uninitialized = true;
++        enumerator->match_initialized = MATCH_INITIALIZED_ALL;
+ 
+         enumerator->scan_uptodate = false;
+ 
+         return 0;
+ }
+ 
+-int device_enumerator_add_match_is_initialized(sd_device_enumerator *enumerator) {
++int device_enumerator_add_match_is_initialized(sd_device_enumerator *enumerator, MatchInitializedType type) {
+         assert_return(enumerator, -EINVAL);
++        assert_return(type >= 0 && type < _MATCH_INITIALIZED_MAX, -EINVAL);
+ 
+-        enumerator->match_allow_uninitialized = false;
++        enumerator->match_initialized = type;
+ 
+         enumerator->scan_uptodate = false;
+ 
+@@ -461,11 +461,44 @@
+         return false;
+ }
+ 
++static int match_initialized(sd_device_enumerator *enumerator, sd_device *device) {
++        int r;
++
++        assert(enumerator);
++        assert(device);
++
++        if (enumerator->match_initialized == MATCH_INITIALIZED_ALL)
++                return true;
++
++        r = sd_device_get_is_initialized(device);
++        if (r == -ENOENT) /* this is necessarily racey, so ignore missing devices */
++                return false;
++        if (r < 0)
++                return r;
++
++        if (enumerator->match_initialized == MATCH_INITIALIZED_COMPAT) {
++                /* only devices that have no devnode/ifindex or have a db entry are accepted. */
++                if (r > 0)
++                        return true;
++
++                if (sd_device_get_devnum(device, NULL) >= 0)
++                        return true;
++
++                if (sd_device_get_ifindex(device, NULL) >= 0)
++                        return true;
++
++                return false;
++        }
++
++        return (enumerator->match_initialized == MATCH_INITIALIZED_NO) == (r == 0);
++}
++
++
+ static int enumerator_scan_dir_and_add_devices(sd_device_enumerator *enumerator, const char *basedir, const char *subdir1, const char *subdir2) {
+         _cleanup_closedir_ DIR *dir = NULL;
+         char *path;
+         struct dirent *dent;
+-        int r = 0;
++        int k, r = 0;
+ 
+         assert(enumerator);
+         assert(basedir);
+@@ -485,7 +519,6 @@
+         FOREACH_DIRENT_ALL(dent, dir, return -errno) {
+                 _cleanup_(sd_device_unrefp) sd_device *device = NULL;
+                 char syspath[strlen(path) + 1 + strlen(dent->d_name) + 1];
+-                int initialized, k;
+ 
+                 if (dent->d_name[0] == '.')
+                         continue;
+@@ -504,31 +537,13 @@
+                         continue;
+                 }
+ 
+-                initialized = sd_device_get_is_initialized(device);
+-                if (initialized < 0) {
+-                        if (initialized != -ENOENT)
+-                                /* this is necessarily racey, so ignore missing devices */
+-                                r = initialized;
+-
++                k = match_initialized(enumerator, device);
++                if (k <= 0) {
++                        if (k < 0)
++                                r = k;
+                         continue;
+                 }
+ 
+-                /*
+-                 * All devices with a device node or network interfaces
+-                 * possibly need udev to adjust the device node permission
+-                 * or context, or rename the interface before it can be
+-                 * reliably used from other processes.
+-                 *
+-                 * For now, we can only check these types of devices, we
+-                 * might not store a database, and have no way to find out
+-                 * for all other types of devices.
+-                 */
+-                if (!enumerator->match_allow_uninitialized &&
+-                    !initialized &&
+-                    (sd_device_get_devnum(device, NULL) >= 0 ||
+-                     sd_device_get_ifindex(device, NULL) >= 0))
+-                        continue;
+-
+                 if (!match_parent(enumerator, device))
+                         continue;
+
+diff --git a/src/libudev/libudev-enumerate.c b/src/libudev/libudev-enumerate.c
+index 2dc695bd03f9..d71a31c566a7 100644
+--- a/src/libudev/libudev-enumerate.c
++++ b/src/libudev/libudev-enumerate.c
+@@ -365,7 +365,7 @@ _public_ int udev_enumerate_add_match_is_initialized(struct udev_enumerate *udev
+ 
+         assert_return(udev_enumerate, -EINVAL);
+ 
+-        r = device_enumerator_add_match_is_initialized(udev_enumerate->enumerator);
++        r = device_enumerator_add_match_is_initialized(udev_enumerate->enumerator, MATCH_INITIALIZED_COMPAT);
+         if (r < 0)
+                 return r;
diff --git a/meta/recipes-core/systemd/systemd_244.5.bb b/meta/recipes-core/systemd/systemd_244.5.bb
index a398043308..e393e46909 100644
--- a/meta/recipes-core/systemd/systemd_244.5.bb
+++ b/meta/recipes-core/systemd/systemd_244.5.bb
@@ -40,6 +40,7 @@ SRC_URI += "file://touchscreen.rules \
            file://CVE-2023-26604-3.patch \
            file://CVE-2023-26604-4.patch \
            file://0001-udevadm-trigger-implement-initialized-match-nomatch-arguments.patch \
+           file://0001-sd-device-enumerator-support-to-list-only-initialized-or-uninitialized-devices.patch \
            "
 
 # patches needed by musl
-- 
2.38.1



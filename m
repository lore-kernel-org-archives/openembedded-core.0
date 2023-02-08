Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E2CEC636CC
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:04 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.3141.1675840914807526308
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:21:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rk8SJ0RC;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id az4-20020a05600c600400b003dff767a1f1so741344wmb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CekaX5y3MHJFPsi8m9gQWlesnThNqRsmnWDUKXwhGFM=;
        b=Rk8SJ0RCePUpKILVEEaui9EJiXCXcB0J/Om7V2mwIbK205KK1Bqih1UA/45Hefk6AK
         u+KVQXYjnsGbjShexBqKXOwhiaTvyPIOuyOccAxUke6RiK2cxmwH/mV/Pnhh+ffP7YuZ
         8RUxz/MKbGI8iVBuq9LQ+L/zUUjz//QLnTl4lckZn2sOGXOrFm+T4ggUsQh94y+cHmh+
         gETOznHU1KEGm0mSahugzLH20JJ5LqHVWCCNNH/GR1nzSTQkh9/1CO/oKrLDPDcvcJSA
         wJIxkPksgKL0MvKycKXTYRuoBNvFwU8U5XCxi36sfYc0syxG4WmVfePwUkoMPnEeZeTY
         q3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CekaX5y3MHJFPsi8m9gQWlesnThNqRsmnWDUKXwhGFM=;
        b=4os8L30KjtecMjuxhSb5dPH583X7CWM1xBQz5KvNhjaSRQqWcXg4WccvMutjpJmfNX
         i4y0MVJm4J72clXoZ/HsVfWTNcUYdPCtT+eFXpuXKxLb0hjw4wt2jGjd6fpOP8WNl1Fj
         9gchmP3LutbioCripGU12mnM7BfwG1UYBHEw4WC59MpiX/eKNMJRnrJM8aC7Knpt8LIG
         /jTgqSNpODlbyj6SwDKsJX5Z+c52mehuM63HtRBRpYG1iJ2s/8CJc7r1h2ViH+PVlzjz
         32aWQZhMvxIraiJADoNY1Pymu1E6E9SW6ub+cs9nUaVvJCMfab499rvAeXAsiHPwbIIr
         VLIA==
X-Gm-Message-State: AO0yUKWw7/rs+/N/cUUZ2M0vKrzGCxZW1v2VTDiFVohWwT1UiZ8Uiskd
	cetAI0zGVZQcglGGoFWLFgTs3/xQvs0=
X-Google-Smtp-Source: AK7set/Ah9mcFSH/Z4rtWqrdkbGyqAsgwr6oQ3PZWBAbDxBFJfNKlAj13qQIllsBcKlwllAQIEt1Xw==
X-Received: by 2002:a05:600c:1684:b0:3dc:52fc:7f06 with SMTP id k4-20020a05600c168400b003dc52fc7f06mr5445401wmn.41.1675840913268;
        Tue, 07 Feb 2023 23:21:53 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:21:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/52] glib-2.0: upgrade 2.74.4 -> 2.74.5
Date: Wed,  8 Feb 2023 08:21:01 +0100
Message-Id: <20230208072143.2930292-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176850

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../glib-2.0/glib-2.0/fix-errno.patch         | 31 -------------------
 .../glib-2.0/glib-2.0/relocate-modules.patch  |  2 +-
 ...{glib-2.0_2.74.4.bb => glib-2.0_2.74.5.bb} |  3 +-
 3 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/fix-errno.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.74.4.bb => glib-2.0_2.74.5.bb} (95%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/fix-errno.patch b/meta/recipes-core/glib-2.0/glib-2.0/fix-errno.patch
deleted file mode 100644
index 144fe8bbd8..0000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/fix-errno.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 6626765a79f125cf0ec9cdaefa51ceef718d41e7 Mon Sep 17 00:00:00 2001
-From: Michael Catanzaro <mcatanzaro@redhat.com>
-Date: Tue, 20 Dec 2022 17:10:41 -0600
-Subject: [PATCH] gthread-posix: need to #include <errno.h>
-
-a79c6af23eff5ee978db62e048828c9a992a1261 uses errno without the required
-header.
-
-
-(cherry picked from commit 03cb4261e00cf505790f4fd4e69f97b2ef4fcccd)
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/6626765a79f125cf0ec9cdaefa51ceef718d41e7]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- glib/gthreadprivate.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/glib/gthreadprivate.h b/glib/gthreadprivate.h
-index 6eaf422753..f34368a7c2 100644
---- a/glib/gthreadprivate.h
-+++ b/glib/gthreadprivate.h
-@@ -41,6 +41,7 @@ struct  _GRealThread
- /* system thread implementation (gthread-posix.c, gthread-win32.c) */
- 
- #if defined(HAVE_FUTEX) || defined(HAVE_FUTEX_TIME64)
-+#include <errno.h>
- #include <linux/futex.h>
- #include <sys/syscall.h>
- #include <unistd.h>
--- 
-GitLab
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 168dc73290..ae6881b61e 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 2adfd458507c8c832955d6ffb9408d6c574b94f6 Mon Sep 17 00:00:00 2001
+From a3cdf17643bf33d532ec269913974195e136b7fc Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.74.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb
similarity index 95%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.74.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb
index e5279e946c..d54f077cb0 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.74.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb
@@ -18,11 +18,10 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch \
            file://cpp-null.patch \
            file://cpp-null2.patch \
-           file://fix-errno.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "0e82da5ea129b4444227c7e4a9e598f7288d1994bf63f129c44b90cfd2432172"
+SRC_URI[sha256sum] = "ceba83a5999ceb31a4c4fc9921207cb9ffffd2ab1d6ec03c162d3f608a5c14c8"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.30.2



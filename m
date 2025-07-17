Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D0FC83F38
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 02:59:31 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.40272.1752721167722551901
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 19:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=n5VAXlDq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3138b2f0249so435998a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 19:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752721167; x=1753325967; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bLr1sUVfeDcwLd6B26Ti6OhYs5ulJnVrilQZWbjwHvI=;
        b=n5VAXlDqMoK5bA6YbK5CGUlfOUvGSRbEbuVvh72H7/ArkSfQ+WxE+x5dJ3h7p3Lr7i
         M8ZuAoEnoJNCIKkXbMxqI00QE7WlSmL9ZH+vCFMEr1mS+t3bAxVtBxiPQbfLqlmx4kxY
         vgFf6NWPZzN3iGex2khCmmBBU2g1b/oBqTEBWd15wKqVhV9HJa295M+9QLNGZ7ealuaG
         VShdEC13rebtRhW1Tfn5zxtYhh/DM7uiRPSz5NiVHBTA3HyujZ8svmcVS6auwzonUX24
         RUiOhbWOuePoa7tKJwZZInenDXNsD/aJEhJlXeO0FdkjayiuHgAYPQVQ0XkN2rnOKUVc
         1IDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752721167; x=1753325967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLr1sUVfeDcwLd6B26Ti6OhYs5ulJnVrilQZWbjwHvI=;
        b=cvL1tKN5ht9gvl5inrZu5Xu/fm3syx6OtGD5ZZnGrePbwSYtj7UQRbfZln/+zO/SGu
         kMVa+VSLwfmvsE9NTQrRozkj0KaCpHGAeJFsBtrqTjeQfEfKY8Ena8geKQmhvSZF0b3O
         8j1ncB439G6BFfyd+ucnVNIq9CHWkwnBEMtN0eX8WSRi6jryNLm5rVIFj6VYlXJ2u7KZ
         zoITBILX4yFWAsxCqz1SVk2y/26AawchqbHgvaYZrxEDth0ERIPI60t/lhG00ePagnNH
         WE1uLIAuYv8OaN1lk7sFXNjDXbXQX89l3eGfepwKWxEpwcF0vbZtvNRevQnk3xHnxqPk
         H+lQ==
X-Gm-Message-State: AOJu0YzBx4BifdpbkgB1Nk60TbwOVeP5jbPVYw4GkTBSdhPT0FJ8/uPt
	i80c9gnqAE9ZSg8sdDOmHb5IW94hCet0R9MS42kMo1NxH5devKSX9sqZpEVQIuKTvusqmqb2TvE
	HpBed
X-Gm-Gg: ASbGncs9ME9GSdotCDHLlMKgNYgi+4F/JjUYTqCjtEfnH8GAGzMytaMF0dBn9rsKvSI
	cBJZnEHA1PGIEnWoeUxlDYBE1Mv1pA3/7RcQ5DpramP8/u2gzkkV6DAdbKWBvGls8odwhZ61tBi
	kztTZdIZTj+1ua3Ntt0o4sJiVOKQcgxSZiEsOeb32wh8ecG7qCf9lCTRXGJwNbv/rDeexsJfjiZ
	erjzh6ps0M6W+aPYon3UyMcVOTvaTfKHGxvY3ZTpd8f/1luV2Fi/U6Uva/wAUBT5vse1U1/2Jko
	dYSJT0Vw0A9K5Im3I9hPkmPjeQZS8IYZaIUlQpVry+9MXC8SlL/uR1FRt7jAIrBfYCRuOCYdynl
	mAAeBajsgzdoqfQ==
X-Google-Smtp-Source: AGHT+IHflXrvTkgPpCMZ7vHz/rwGwzJNDG2IYrg/JjlMR4RApA7M7Ml3ij07OZA0H8nnP4qCJtqyPg==
X-Received: by 2002:a17:90b:5247:b0:312:f263:954a with SMTP id 98e67ed59e1d1-31c9e6e833dmr6318353a91.5.1752721166520;
        Wed, 16 Jul 2025 19:59:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3bfc:8fec:7e35:e96a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f29e313sm2204547a91.35.2025.07.16.19.59.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 19:59:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/12] timedated: wait for jobs before SetNTP response
Date: Wed, 16 Jul 2025 19:58:59 -0700
Message-ID: <4db0483cfd14e31c3e7cc87d538d73275fd51bbf.1752721028.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752721028.git.steve@sakoman.com>
References: <cover.1752721028.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 02:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220511

From: Michal Seben <michal.seben@siemens.com>

Backport a fix to address the dbus SetNTP response timing issue.
Fix is already available since systemd v256-rc1.

Signed-off-by: Michal Seben <michal.seben@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...d-on-org.freedesktop.timedate1.SetNT.patch | 97 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_255.21.bb   |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0003-timedated-Respond-on-org.freedesktop.timedate1.SetNT.patch

diff --git a/meta/recipes-core/systemd/systemd/0003-timedated-Respond-on-org.freedesktop.timedate1.SetNT.patch b/meta/recipes-core/systemd/systemd/0003-timedated-Respond-on-org.freedesktop.timedate1.SetNT.patch
new file mode 100644
index 0000000000..c1d8a94bf7
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0003-timedated-Respond-on-org.freedesktop.timedate1.SetNT.patch
@@ -0,0 +1,97 @@
+From 3a51e31be9f626cf772733cb289ed64739fab0e4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
+Date: Tue, 20 Feb 2024 19:26:16 +0100
+Subject: [PATCH] timedated: Respond on org.freedesktop.timedate1.SetNTP only
+ when really finished
+
+The method returns prematurely (before jobs it triggers terminate). This
+is externally visible because other methods may fail if jobs did not
+finish.
+Postpone the DBus method response until we collect all signals for
+finished jobs.
+systemd-timedated keeps track of in-flight DBus requests and answers
+them all in unspecified order when jobs finish. The capacity of requests
+in systemd-timedated is limited.
+
+Fixes: #17739
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/3a51e31be9f626cf772733cb289ed64739fab0e4]
+Signed-off-by: Michal Seben <michal.seben@siemens.com>
+---
+ src/timedate/timedated.c | 21 ++++++++++++++++++---
+ 1 file changed, 18 insertions(+), 3 deletions(-)
+
+Index: git/src/timedate/timedated.c
+===================================================================
+--- git.orig/src/timedate/timedated.c
++++ git/src/timedate/timedated.c
+@@ -45,6 +45,7 @@
+ #define NULL_ADJTIME_LOCAL "0.0 0 0\n0\nLOCAL\n"
+ 
+ #define UNIT_LIST_DIRS (const char* const*) CONF_PATHS_STRV("systemd/ntp-units.d")
++#define SET_NTP_IN_FLIGHT_MAX 16
+ 
+ typedef struct UnitStatusInfo {
+         char *name;
+@@ -61,6 +62,7 @@ typedef struct Context {
+         bool local_rtc;
+         Hashmap *polkit_registry;
+         sd_bus_message *cache;
++        Set *set_ntp_calls;
+ 
+         sd_bus_slot *slot_job_removed;
+ 
+@@ -121,6 +123,7 @@ static void context_clear(Context *c) {
+         free(c->zone);
+         bus_verify_polkit_async_registry_free(c->polkit_registry);
+         sd_bus_message_unref(c->cache);
++        set_free(c->set_ntp_calls);
+ 
+         sd_bus_slot_unref(c->slot_job_removed);
+ 
+@@ -461,11 +464,19 @@ static int match_job_removed(sd_bus_mess
+                         n += !!u->path;
+ 
+         if (n == 0) {
++                sd_bus_message *cm;
++
+                 c->slot_job_removed = sd_bus_slot_unref(c->slot_job_removed);
+ 
+                 (void) sd_bus_emit_properties_changed(sd_bus_message_get_bus(m),
+                                                       "/org/freedesktop/timedate1", "org.freedesktop.timedate1", "NTP",
+                                                       NULL);
++                while ((cm = set_steal_first(c->set_ntp_calls))) {
++                        r = sd_bus_reply_method_return(cm, NULL);
++                        if (r < 0)
++                                log_debug_errno(r, "Failed to reply to SetNTP method call, ignoring: %m");
++                        sd_bus_message_unref(cm);
++                }
+         }
+ 
+         return 0;
+@@ -944,6 +955,9 @@ static int method_set_ntp(sd_bus_message
+         LIST_FOREACH(units, u, c->units)
+                 u->path = mfree(u->path);
+ 
++        if (set_size(c->set_ntp_calls) >= SET_NTP_IN_FLIGHT_MAX)
++                return sd_bus_error_set_errnof(error, EAGAIN, "Too many calls in flight.");
++
+         if (!c->slot_job_removed) {
+                 r = bus_match_signal_async(
+                                 bus,
+@@ -998,11 +1012,12 @@ static int method_set_ntp(sd_bus_message
+                 c->slot_job_removed = TAKE_PTR(slot);
+ 
+         if (selected)
+-                log_info("Set NTP to enabled (%s).", selected->name);
++                log_info("Set NTP to be enabled (%s).", selected->name);
+         else
+-                log_info("Set NTP to disabled.");
++                log_info("Set NTP to be disabled.");
+ 
+-        return sd_bus_reply_method_return(m, NULL);
++        /* Asynchrounous reply to m in match_job_removed() */
++        return set_ensure_consume(&c->set_ntp_calls, &bus_message_hash_ops, sd_bus_message_ref(m));
+ }
+ 
+ static int method_list_timezones(sd_bus_message *m, void *userdata, sd_bus_error *error) {
diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipes-core/systemd/systemd_255.21.bb
index bb9dc3da33..e866f9921b 100644
--- a/meta/recipes-core/systemd/systemd_255.21.bb
+++ b/meta/recipes-core/systemd/systemd_255.21.bb
@@ -27,6 +27,7 @@ SRC_URI += " \
            file://99-default.preset \
            file://systemd-pager.sh \
            file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
+           file://0003-timedated-Respond-on-org.freedesktop.timedate1.SetNT.patch \
            file://0008-implment-systemd-sysv-install-for-OE.patch \
            "
 
-- 
2.43.0



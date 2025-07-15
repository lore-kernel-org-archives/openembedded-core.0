Return-Path: <michal.seben@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3D0C83F21
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 12:50:57 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.7732.1752583856072403268
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 05:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=michal.seben@siemens.com header.s=fm1 header.b=jzWw8ahJ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1325011-20250715125052ea3b0c7ccd21653a4a-vz7_ys@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250715125052ea3b0c7ccd21653a4a
        for <openembedded-core@lists.openembedded.org>;
        Tue, 15 Jul 2025 14:50:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=michal.seben@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=oKsJHdEra/2Mi3hKnvMfm5Jb4RCF+f6sJ4XM7/0Fk7s=;
 b=jzWw8ahJD8XmEjHBm3j9t1+f+WApXP32oThrEyRHjQsP5PB5QP1Mjto0VHeE3DV6GSx4xY
 KywVsyukZn9Rws7bE2UwCYB+v3Jgy8ZCuGwc4HSJieAnAxmVHVqsuHhv5cqsmp1ir1GG7sWZ
 XZWPC/2z/Zk9AoF0jlP3aRqiiV+26LDytqstALxnZdM7cB6efKhnY3+e39XsvLZ/pNqvby7B
 cEobEKlhr90b3GALxlXaiAmImj15uvPpsW9ugQlcVNkMc6ZlB5PrZaG0RhZVFXEg1UiYNK5U
 wY6VorJ0SRG6jjkmVvyczaHjxBQos7+rszy84FqHSq0VjrAfCXW0plYQ==;
From: "M. Seben" <michal.seben@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Seben <michal.seben@siemens.com>
Subject: [OE-core][scarthgap][PATCH] timedated: wait for jobs before SetNTP response
Date: Tue, 15 Jul 2025 14:50:13 +0200
Message-ID: <20250715125013.14435-1-michal.seben@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1325011:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 12:50:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220294

From: Michal Seben <michal.seben@siemens.com>

Backport a fix to address the dbus SetNTP response timing issue.
Fix is already available since systemd v256-rc1.

Signed-off-by: Michal Seben <michal.seben@siemens.com>
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
 


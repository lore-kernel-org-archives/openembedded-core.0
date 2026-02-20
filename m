Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2A2C5AD4E
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 19:11:50 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5253.1771614703013798158
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 11:11:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Ypa0Ca3/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202602201911399203c0a43a000207a1-mthwry@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202602201911399203c0a43a000207a1
        for <openembedded-core@lists.openembedded.org>;
        Fri, 20 Feb 2026 20:11:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Zjoc6NSSkY22xZtpKBO0lTYOzvNfCrBedYDodx/fGDo=;
 b=Ypa0Ca3/UwnkbWgSYbZW1E6UvMmRhBBHzFqJBQV/riOEDbL0Y9zP1cAL2vEdOatO46VPm8
 g5shvmA2uBOxsQrbBvYPZl35vukmtJ7vFjE9t16RCH0N04D4kJnjir42cRnmv1+kXO5CK9AV
 crD5zr7PfoPf0Tgjz+DJkCVRYUUYaZ6ecsfyUyQpc/3d2q9vXyLk0YBmx8/Jr3ZNrT93WIWy
 mzh2nK1Zgk1R1Z+S5vNLb+Oj/lq/OAdreimhg9Fx/sJWf3pB4kQ2m4NjRsxDbldnIHN+Jm2y
 D6KciUurtzXjhBF+M97HSXjfz9UTmBgjJdwESeX1HUEafc3uuYA0G1Ow==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [OE-core][kirkstone][PATCH 1/4] avahi: patch CVE-2025-68276
Date: Fri, 20 Feb 2026 20:11:29 +0100
Message-Id: <20260220191132.19689-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 19:11:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231544

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport the patch[1] from the PR[2] mentioned in the nvd[3].

[1] https://github.com/avahi/avahi/commit/2d48e42d44a183f26a4d12d1f5d41abb9b7c6355
[2] https://github.com/avahi/avahi/pull/806
[3] https://nvd.nist.gov/vuln/detail/CVE-2025-68276

Dropped CI changes from the original PR during backport.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2025-68276.patch          | 65 +++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 20b2791ef32..b38fedb38bf 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -37,6 +37,7 @@ SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}
            file://CVE-2023-38473.patch \
            file://CVE-2024-52616.patch \
            file://CVE-2024-52615.patch \
+           file://CVE-2025-68276.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch b/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
new file mode 100644
index 00000000000..75169419f10
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
@@ -0,0 +1,65 @@
+From 8ec85459d8e6e59cc14457e16fb7ba171901f90e Mon Sep 17 00:00:00 2001
+From: Evgeny Vereshchagin <evvers@ya.ru>
+Date: Wed, 17 Dec 2025 08:11:23 +0000
+Subject: [PATCH] core: refuse to create wide-area record browsers when
+ wide-area is off
+
+It fixes a bug where it was possible for unprivileged local users to
+crash avahi-daemon (with wide-area disabled) by creating record browsers
+with the AVAHI_LOOKUP_USE_WIDE_AREA flag set via D-Bus (either by calling
+the RecordBrowserNew method directly or by creating hostname/address/service
+resolvers/browsers that create those browsers internally themselves).
+
+```
+$ gdbus call --system --dest org.freedesktop.Avahi --object-path / --method org.freedesktop.Avahi.Server.ResolveHostName -- -1 -1 yo.local -1 1
+Error: GDBus.Error:org.freedesktop.DBus.Error.NoReply: Message recipient disconnected from message bus without replying
+```
+```
+dbus-protocol.c: interface=org.freedesktop.Avahi.Server, path=/, member=ResolveHostName
+avahi-daemon: wide-area.c:725: avahi_wide_area_scan_cache: Assertion `e' failed.
+==307948==
+==307948== Process terminating with default action of signal 6 (SIGABRT)
+==307948==    at 0x4B3630C: __pthread_kill_implementation (pthread_kill.c:44)
+==307948==    by 0x4ADF921: raise (raise.c:26)
+==307948==    by 0x4AC74AB: abort (abort.c:77)
+==307948==    by 0x4AC741F: __assert_fail_base.cold (assert.c:118)
+==307948==    by 0x48D8B85: avahi_wide_area_scan_cache (wide-area.c:725)
+==307948==    by 0x48C8953: lookup_scan_cache (browse.c:351)
+==307948==    by 0x48C8B1B: lookup_go (browse.c:386)
+==307948==    by 0x48C9148: defer_callback (browse.c:516)
+==307948==    by 0x48AEA0E: expiration_event (timeeventq.c:94)
+==307948==    by 0x489D3AE: timeout_callback (simple-watch.c:447)
+==307948==    by 0x489D787: avahi_simple_poll_dispatch (simple-watch.c:563)
+==307948==    by 0x489D91E: avahi_simple_poll_iterate (simple-watch.c:605)
+==307948==
+```
+
+wide-area has been disabled by default since
+9c4214146738146e454f098264690e8e884c39bd (v0.9-rc2).
+
+https://github.com/avahi/avahi/security/advisories/GHSA-mhf3-865v-g5rc
+
+CVE: CVE-2025-68276
+Upstream-Status: Backport [https://github.com/avahi/avahi/commit/2d48e42d44a183f26a4d12d1f5d41abb9b7c6355]
+(cherry picked from commit 2d48e42d44a183f26a4d12d1f5d41abb9b7c6355)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ avahi-core/browse.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index e8a915e..59d53cb 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -541,6 +541,11 @@ AvahiSRecordBrowser *avahi_s_record_browser_prepare(
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, AVAHI_FLAGS_VALID(flags, AVAHI_LOOKUP_USE_WIDE_AREA|AVAHI_LOOKUP_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, !(flags & AVAHI_LOOKUP_USE_WIDE_AREA) || !(flags & AVAHI_LOOKUP_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+ 
++    if ((flags & AVAHI_LOOKUP_USE_WIDE_AREA) && !server->wide_area_lookup_engine) {
++        avahi_server_set_errno(server, AVAHI_ERR_NOT_SUPPORTED);
++        return NULL;
++    }
++
+     if (!(b = avahi_new(AvahiSRecordBrowser, 1))) {
+         avahi_server_set_errno(server, AVAHI_ERR_NO_MEMORY);
+         return NULL;


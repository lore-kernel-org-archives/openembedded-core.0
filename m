Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A702DF357B8
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:01 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21651.1771943567870690484
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:32:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uNbJ1RF3;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-483703e4b08so44747765e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943566; x=1772548366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U133zRJ3XrcmRgjdkXvGYIekbJqUWfgc35CMVU0Mi9k=;
        b=uNbJ1RF3ITJZmTh88c5/nXNYb6/Kr4eMiYPivtgaoxOMlP0NIn6LS/SzwHAmEgwUg8
         k53pRqptcUmNd9y8PPHpomDnA/fauFy/0yWKK8NuDyML0YGmdE+LWaDDXMGWrxvIf6d1
         o1I48AJ74VftPCraaXJ0vM3LfyHlcJsW/aobI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943566; x=1772548366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U133zRJ3XrcmRgjdkXvGYIekbJqUWfgc35CMVU0Mi9k=;
        b=to+MC1UwrpbbN2U9Vna4BS85NpVCvlJWpqE09YiSpuNx7iWBZ1Hya08VefGDtJauu6
         QkwbBdlbYi+p7O9PGf9p2vVqag27VnLq73dphzlB54u0oozH0K8fy+JlTAlsKRcEatpp
         NhQwCdjFG04VbONur2hHew6Fw5oQMEFR0rcvF7lEiKsVpGVX6FIa4eKiWX5tHlJ8lMoz
         sHUr3VFjJuDOal/G7jyD5eQ62pDgEziaNNSvnzhi2lmWwXRJmkmRvxgWFWzABsHlkzE+
         53bT8oKpTCCWKfoy9bVMY+ykOWbRedyvFn6E1WcoskVi+rrCki3oi9e5GCvzfYI0DKiD
         Lbzg==
X-Gm-Message-State: AOJu0YweDzHEFlTXq+AFURQkhkrPEu6L1Hzurfbi8ACGkFG/10ck8qxz
	g5SJQn/w+a0fLBBJcFMjK2bdJ+9r3qELYPFajN1Cr4XBoaaAf/n7+iGUnGtMSJsxIY5qYtJEwT5
	obzu8
X-Gm-Gg: AZuq6aLkYd94RI4rmdnCXAX1KSfUI1QnsTQFl25XZtLU5B50AQIcdV/z4BOLItE7vQt
	ltXG6bL3czHufrRTUcoNNz690sSQUBGfEDQ/Tq358nR268YJ8nciyhp3ObIEXVI+K2wU7PFOv0m
	OQT+Cp9TEbmWbqDf+Nrvb8nKXVskYn8hh9UQY+eMF0XnOmKjNNLAR3faHmJA2+la0lGaRIw/Og4
	poRaeCN1XYzkxg9UlVBendycateetLuMWIVX8wzWrtv8WvonA1dK9fme4oPn9Y+fTO0qzl5xfFR
	b7fNrBukAtikVwxDvdhprx+ArE2AH0BG+SOyPWZ5UwIJh25n4tiVXzlkxgUOWH7viW/JTysKNIm
	urBKIcKUww1hO/VAdRnzu5/CKK0nHrSwoQ/WXkbNtmbMNXmwmgXrQNKIUtvdVVvCZHQkNNkpCnR
	3ZcTcUtVdIYiTy+lJvKcvqwFfpyQVMkvwQ9tYAJy4YX9CoEB04jKN3HYnCjX485pmdCZbTmYloj
	3sWs+NgVYx/l8rq1ZfQnEZgY5FklPuLhg==
X-Received: by 2002:a05:600c:c172:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-483bd73cee3mr3195925e9.8.1771943565985;
        Tue, 24 Feb 2026 06:32:45 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.32.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:32:45 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/44] avahi: patch CVE-2025-68276
Date: Tue, 24 Feb 2026 15:31:30 +0100
Message-ID: <4fe5beba30f22636697522ab11c3218931df81d5.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231807

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport the patch[1] from the PR[2] mentioned in the nvd[3].

[1] https://github.com/avahi/avahi/commit/2d48e42d44a183f26a4d12d1f5d41abb9b7c6355
[2] https://github.com/avahi/avahi/pull/806
[3] https://nvd.nist.gov/vuln/detail/CVE-2025-68276

Dropped CI changes from the original PR during backport.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2025-68276.patch          | 65 +++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 7930bd3037b..bb20fd17ccd 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -37,6 +37,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
            file://CVE-2023-38473.patch \
            file://CVE-2024-52616.patch \
            file://CVE-2024-52615.patch \
+           file://CVE-2025-68276.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/avahi/avahi/releases/"
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


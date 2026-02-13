Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A968AEF48ED
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 08:10:30 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67226.1770970227625897669
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 00:10:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2GNYvQYb;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43770c94dfaso751905f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 00:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770970226; x=1771575026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3PaVFUo1k0jVnZH5vIrLgE/8ckqr4yPq0ufg/N0m0c8=;
        b=2GNYvQYbt/FhDqSoca3jJRlhaycyh6EQ1ui7GNRNc+PQuV39oI7KqLLrV4rg66rzo3
         1kJXT55PplKcyOx8qYo/Ka3JxmvsXtpSyNdkUAxdc5nNAp8QTGZhYM+NsV/2NeIYWDSg
         zIyE0Uk4VCenPIfxkc25ZDU7haZtZJxUSWnsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970226; x=1771575026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3PaVFUo1k0jVnZH5vIrLgE/8ckqr4yPq0ufg/N0m0c8=;
        b=ra5x/Vow6bE893eBeV+rJpBMdqb6aXuHeuE0faUvtPcC8hXAX3Ovj0grGP03xph/uO
         WvJ6dR+6yyk58mOlXTX3BbXCarL5COC7sMv1z5sHarDhxX6sjMJE4k8puuVYbBBgyRdn
         +rgzyUhAzu3VhcTCGdRE10ANIC2kbLBQVrVLpV1Owv0PaeSEVl+DYoQCImH+EVsNwe2w
         bdxZtxP+eLcqWd8gqXou5K/sXesfm8YcJqKnpa76MGAvbDjVcLXUKW3B+QVjlkaLhrJr
         HiLq/LLyfn8wnOd0tq4Lq2rO7RKruRfECbStm7U2PUM1i7mxeaAdL5YXKxvwqwZ9mqJ+
         pvBA==
X-Gm-Message-State: AOJu0YzHoeYNN2neGTGkSCPUUkCtSC3DKY/2DVNvmBPJLmZJwQJrLHlp
	jIe4KoJ62b7NWJTP3QBhm5xMz01aINLSVYY9Vd9RhPubu+w6jf3epxHGDEsE22jA0a3YKV0iZVB
	jliTM
X-Gm-Gg: AZuq6aIhOfe1+Ke/N6JF0wxpU1aAnh59KpvOFYTU6pi26djHa1htPHeHO5S3VXhpfrl
	n6QIDBctBaEwgIvENa3QE9TXnE74vEvilXfSnXoHbGOsXFlP200zF+04fwpjV352tVYtQvvsjox
	WZsUD371LWWKINSJeldJVW0dQ7+bNHt1BdNMWNG7CcVXARmpOtnTAAHo6znvm/e5FqS2NzwUgWt
	nO0splJiqHgNBvhfcjlG9PopwCgnrxZ/Al3as6rc9qgiVzMszrTgLZVyF7Tflx/UFz8tGYUw8rX
	jdX4ucloWKJC9Zml46KGte/ViyHk8NSlmFW8T/5C9ZLN30dT7+MIj+tzQ30/Mn+rKTg/EiwOkd7
	t8BVsYUCXUmwalo5DGeEDQMurRFw2/mwVSqISDL5PRY90ZfRf4EmJkD8omEtli/K0ud+tEcO6sS
	/uW2/fYjbH/HGO0HRjwMlpfgIUD8s+soMdVDVgI80PjLMFkgxsyHGnG2uKvAU3dur7i76t91ZzK
	cWKJ0lKLNW/yL0ANSh3jZD3Toc=
X-Received: by 2002:a05:6000:40ca:b0:437:8f37:887 with SMTP id ffacd0b85a97d-43797917e2emr1781138f8f.36.1770970225667;
        Fri, 13 Feb 2026 00:10:25 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00d6f202ec534aee64.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:d6f2:2ec:534a:ee64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-437969fd36dsm3590815f8f.0.2026.02.13.00.10.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:10:25 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 11/19] avahi: Backport fix CVE-2025-68276
Date: Fri, 13 Feb 2026 09:08:29 +0100
Message-ID: <2571c0515ae8670a11f8a1f3d48e22fa9e224bc5.1770968514.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770968514.git.yoann.congal@smile.fr>
References: <cover.1770968514.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 08:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231094

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Include the patch linked in the NVD report: https://github.com/avahi/avahi/pull/806/commits/0c013e2e819be3bda74cecf48b5f64956cf8a760

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 330160efaa755be1336dab62e502df307325c20c)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2025-68276.patch          | 68 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 4fe8ba4d286..bd61c39dbf3 100644
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
index 00000000000..b3e11f9597f
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
@@ -0,0 +1,68 @@
+From d5d18ced67e969d6a5052cacdbd7d4b2c97a1a3f Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/avahi/avahi/pull/806/commits/0c013e2e819be3bda74cecf48b5f64956cf8a760]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
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
+-- 
+2.34.1
+


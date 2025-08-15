Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B63ECA0EE9
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 16:45:16 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.16347.1755276307806942908
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 09:45:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DD6hAJiW;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-323266cdf64so1819353a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 09:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755276307; x=1755881107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kkIFkkdkEDRJZoyQyiUuFQevjuglI2pen6Gh27nd7vQ=;
        b=DD6hAJiWSNrTlYF+tP59q3WIWOQJT1T7b+HIxPLkxYUY9LupA29dAqp2hVQb8SA9K1
         sn+hw7tbfxDaSBQuTM9mOgG3qaIB+GaMRkF6VUTsx6zj11Lxygp3FoM043Mpb/S6Uipl
         qLVqWNX3Mg4dkWJoPOr+D9hAl2XLkL+A10rJCvLiyZwcTcO8wSZsyrXFN9mDX/dRRiSX
         lLaBvdWjj/opRnSrJpESR/VTA0Kt/hjare7z05uTAKzlmSflh10OBJHToEvcRtlqDLRd
         J2cbGkMXXeDl8qS3aKgPSIlbErDBVMe6Glmg3qGm7RVJUjhbNrS0AHYEcyhxQT6Y4aS7
         8DfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755276307; x=1755881107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkIFkkdkEDRJZoyQyiUuFQevjuglI2pen6Gh27nd7vQ=;
        b=iiNa+PA1mPUp6cULVX7Ca+rrDy8f/C/cxQOWQMAQP3i02Fzsb2FaXOmTa1WcqFO/BZ
         cO1wBVEeJhVN16z8GCC5sTTH+z+Fph48jaTvLv1PHHRJU4rqazzuXD5CUTkTzbdZfIE+
         SBioVXyKRMz1I8FUZYfAx9RmT1dlMg699ouiaePFVjZxOjWLPybKJv8E+UqNIh/gwS5V
         fPrtTuDaBW0fLQeP7mMJrPSFKAt7jkW5gIcYRUFwhKxlg1iYOGVLqlNNIsaZp4DL+puU
         +wZ6LkeEGOvNBdL56nwtL2QOAeWHQda+GfhRGrLinS7VxShAhaITf01GidocyjO7/pOa
         LKyg==
X-Gm-Message-State: AOJu0YwKcO7rnC1K2tIXYufTFlwsctSyfYW9dGbgFbD9KU2yx7V0t812
	w9Cj1u8O749ZgHrfWHOVHJy5dXD9j2pHw0yx511pYYmYUSo+JaRHGdeIHqUhhBlcwwlakexcGus
	5NG+e
X-Gm-Gg: ASbGncsImTOezE+5e7vCREgvSaQ7cRQQjFgSf36HYN9jY7kKhPMpy+se9D/nrCrQ/Ow
	tWqirV/2hq2ISoIbj27hzCZRzCzH/F76EaH8kVP0oOb6/n7DRkghXlatZPP4fNNM81POxO2fdBs
	Tboqy8PnAJ5w8/JUdYY1SVVrgEg5yzaai9Nuv6ziQAo02OW01ryk349JDaJZsSiiwcU2YU9rnUR
	BLDzqWq4sofBk7CxIyvYo1F7DRbQea+nom7sX/AL7jd9a/gmWUXuTVhlUIMHkFr42XtCSU8Gk9G
	gilrEQMXh8Floa4/s+cdWwws7i82nEZ4UkT6VQsBDXQbSjAGv6BG3ZUEFC6pJv0ZPm4HSHShAzN
	ChrWcrjrCGDVMfA==
X-Google-Smtp-Source: AGHT+IFH801jSOEkbGJ4py+ELQswktS+r7N5mXIe8Me1thMg9Q5BTp6TovgGTxvrOVBw1XUlXAm33A==
X-Received: by 2002:a17:90a:d44d:b0:321:c9e7:d9ef with SMTP id 98e67ed59e1d1-32341ee9181mr3937382a91.21.1755276306976;
        Fri, 15 Aug 2025 09:45:06 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3ec5:7840:3390:1caa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c9ab2asm1554476a91.30.2025.08.15.09.45.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 09:45:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/9] avahi: fix CVE-2024-52615
Date: Fri, 15 Aug 2025 09:44:52 -0700
Message-ID: <ec22ec26b3f40ed5e0d84d60c29d8c315cf72e23.1755276097.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755276097.git.steve@sakoman.com>
References: <cover.1755276097.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 16:45:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221981

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-52615:
A flaw was found in Avahi-daemon, which relies on fixed source ports for wide-area
DNS queries. This issue simplifies attacks where malicious DNS responses are injected.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-52615]
[https://github.com/avahi/avahi/security/advisories/GHSA-x6vp-f33h-h32g]

Upstream patches:
[https://github.com/avahi/avahi/commit/4e2e1ea0908d7e6ad7f38ae04fdcdf2411f8b942]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   1 +
 .../avahi/files/CVE-2024-52615.patch          | 228 ++++++++++++++++++
 2 files changed, 229 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2024-52615.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 1163c17e20..7930bd3037 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -36,6 +36,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
            file://CVE-2023-38472.patch \
            file://CVE-2023-38473.patch \
            file://CVE-2024-52616.patch \
+           file://CVE-2024-52615.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/avahi/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2024-52615.patch b/meta/recipes-connectivity/avahi/files/CVE-2024-52615.patch
new file mode 100644
index 0000000000..9737f52837
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2024-52615.patch
@@ -0,0 +1,228 @@
+From 4e2e1ea0908d7e6ad7f38ae04fdcdf2411f8b942 Mon Sep 17 00:00:00 2001
+From: Michal Sekletar <msekleta@redhat.com>
+Date: Wed, 27 Nov 2024 18:07:32 +0100
+Subject: [PATCH] core/wide-area: fix for CVE-2024-52615
+
+CVE: CVE-2024-52615
+Upstream-Status: Backport [https://github.com/avahi/avahi/commit/4e2e1ea0908d7e6ad7f38ae04fdcdf2411f8b942]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ avahi-core/wide-area.c | 128 ++++++++++++++++++++++-------------------
+ 1 file changed, 69 insertions(+), 59 deletions(-)
+
+diff --git a/avahi-core/wide-area.c b/avahi-core/wide-area.c
+index 00a15056e..06df7afc6 100644
+--- a/avahi-core/wide-area.c
++++ b/avahi-core/wide-area.c
+@@ -81,6 +81,10 @@ struct AvahiWideAreaLookup {
+ 
+     AvahiAddress dns_server_used;
+ 
++    int fd;
++    AvahiWatch *watch;
++    AvahiProtocol proto;
++
+     AVAHI_LLIST_FIELDS(AvahiWideAreaLookup, lookups);
+     AVAHI_LLIST_FIELDS(AvahiWideAreaLookup, by_key);
+ };
+@@ -88,9 +92,6 @@ struct AvahiWideAreaLookup {
+ struct AvahiWideAreaLookupEngine {
+     AvahiServer *server;
+ 
+-    int fd_ipv4, fd_ipv6;
+-    AvahiWatch *watch_ipv4, *watch_ipv6;
+-
+     /* Cache */
+     AVAHI_LLIST_HEAD(AvahiWideAreaCacheEntry, cache);
+     AvahiHashmap *cache_by_key;
+@@ -125,35 +126,67 @@ static AvahiWideAreaLookup* find_lookup(AvahiWideAreaLookupEngine *e, uint16_t i
+     return l;
+ }
+ 
++static void socket_event(AVAHI_GCC_UNUSED AvahiWatch *w, int fd, AVAHI_GCC_UNUSED AvahiWatchEvent events, void *userdata);
++
+ static int send_to_dns_server(AvahiWideAreaLookup *l, AvahiDnsPacket *p) {
++    AvahiWideAreaLookupEngine *e;
+     AvahiAddress *a;
++    AvahiServer *s;
++    AvahiWatch *w;
++    int r;
+ 
+     assert(l);
+     assert(p);
+ 
+-    if (l->engine->n_dns_servers <= 0)
++    e = l->engine;
++    assert(e);
++
++    s = e->server;
++    assert(s);
++
++    if (e->n_dns_servers <= 0)
+         return -1;
+ 
+-    assert(l->engine->current_dns_server < l->engine->n_dns_servers);
++    assert(e->current_dns_server < e->n_dns_servers);
+ 
+-    a = &l->engine->dns_servers[l->engine->current_dns_server];
++    a = &e->dns_servers[e->current_dns_server];
+     l->dns_server_used = *a;
+ 
+-    if (a->proto == AVAHI_PROTO_INET) {
++    if (l->fd >= 0) {
++        /* We are reusing lookup object and sending packet to another server so let's cleanup before we establish connection to new server. */
++        s->poll_api->watch_free(l->watch);
++        l->watch = NULL;
+ 
+-        if (l->engine->fd_ipv4 < 0)
+-            return -1;
++        close(l->fd);
++        l->fd = -EBADF;
++    }
+ 
+-        return avahi_send_dns_packet_ipv4(l->engine->fd_ipv4, AVAHI_IF_UNSPEC, p, NULL, &a->data.ipv4, AVAHI_DNS_PORT);
++    assert(a->proto == AVAHI_PROTO_INET || a->proto == AVAHI_PROTO_INET6);
+ 
+-    } else {
+-        assert(a->proto == AVAHI_PROTO_INET6);
++    if (a->proto == AVAHI_PROTO_INET)
++        r = s->config.use_ipv4 ? avahi_open_unicast_socket_ipv4() : -1;
++    else
++        r = s->config.use_ipv6 ? avahi_open_unicast_socket_ipv6() : -1;
+ 
+-        if (l->engine->fd_ipv6 < 0)
+-            return -1;
++    if (r < 0) {
++        avahi_log_error(__FILE__ ": Failed to create socket for wide area lookup");
++        return -1;
++    }
+ 
+-        return avahi_send_dns_packet_ipv6(l->engine->fd_ipv6, AVAHI_IF_UNSPEC, p, NULL, &a->data.ipv6, AVAHI_DNS_PORT);
++    w = s->poll_api->watch_new(s->poll_api, r, AVAHI_WATCH_IN, socket_event, l);
++    if (!w) {
++        close(r);
++        avahi_log_error(__FILE__ ": Failed to create socket watch for wide area lookup");
++        return -1;
+     }
++
++    l->fd = r;
++    l->watch = w;
++    l->proto = a->proto;
++
++    return a->proto == AVAHI_PROTO_INET ?
++                avahi_send_dns_packet_ipv4(l->fd, AVAHI_IF_UNSPEC, p, NULL, &a->data.ipv4, AVAHI_DNS_PORT):
++                avahi_send_dns_packet_ipv6(l->fd, AVAHI_IF_UNSPEC, p, NULL, &a->data.ipv6, AVAHI_DNS_PORT);
+ }
+ 
+ static void next_dns_server(AvahiWideAreaLookupEngine *e) {
+@@ -246,6 +279,9 @@ AvahiWideAreaLookup *avahi_wide_area_lookup_new(
+     l->dead = 0;
+     l->key = avahi_key_ref(key);
+     l->cname_key = avahi_key_new_cname(l->key);
++    l->fd = -EBADF;
++    l->watch = NULL;
++    l->proto = AVAHI_PROTO_UNSPEC;
+     l->callback = callback;
+     l->userdata = userdata;
+ 
+@@ -314,6 +350,12 @@ static void lookup_destroy(AvahiWideAreaLookup *l) {
+     if (l->cname_key)
+         avahi_key_unref(l->cname_key);
+ 
++    if (l->watch)
++            l->engine->server->poll_api->watch_free(l->watch);
++
++    if (l->fd >= 0)
++        close(l->fd);
++
+     avahi_free(l);
+ }
+ 
+@@ -572,14 +614,20 @@ static void handle_packet(AvahiWideAreaLookupEngine *e, AvahiDnsPacket *p) {
+ }
+ 
+ static void socket_event(AVAHI_GCC_UNUSED AvahiWatch *w, int fd, AVAHI_GCC_UNUSED AvahiWatchEvent events, void *userdata) {
+-    AvahiWideAreaLookupEngine *e = userdata;
++    AvahiWideAreaLookup *l = userdata;
++    AvahiWideAreaLookupEngine *e = l->engine;
+     AvahiDnsPacket *p = NULL;
+ 
+-    if (fd == e->fd_ipv4)
+-        p = avahi_recv_dns_packet_ipv4(e->fd_ipv4, NULL, NULL, NULL, NULL, NULL);
++    assert(l);
++    assert(e);
++    assert(l->fd == fd);
++
++    if (l->proto == AVAHI_PROTO_INET)
++        p = avahi_recv_dns_packet_ipv4(l->fd, NULL, NULL, NULL, NULL, NULL);
+     else {
+-        assert(fd == e->fd_ipv6);
+-        p = avahi_recv_dns_packet_ipv6(e->fd_ipv6, NULL, NULL, NULL, NULL, NULL);
++        assert(l->proto == AVAHI_PROTO_INET6);
++
++        p = avahi_recv_dns_packet_ipv6(l->fd, NULL, NULL, NULL, NULL, NULL);
+     }
+ 
+     if (p) {
+@@ -598,32 +646,6 @@ AvahiWideAreaLookupEngine *avahi_wide_area_engine_new(AvahiServer *s) {
+     e->server = s;
+     e->cleanup_dead = 0;
+ 
+-    /* Create sockets */
+-    e->fd_ipv4 = s->config.use_ipv4 ? avahi_open_unicast_socket_ipv4() : -1;
+-    e->fd_ipv6 = s->config.use_ipv6 ? avahi_open_unicast_socket_ipv6() : -1;
+-
+-    if (e->fd_ipv4 < 0 && e->fd_ipv6 < 0) {
+-        avahi_log_error(__FILE__": Failed to create wide area sockets: %s", strerror(errno));
+-
+-        if (e->fd_ipv6 >= 0)
+-            close(e->fd_ipv6);
+-
+-        if (e->fd_ipv4 >= 0)
+-            close(e->fd_ipv4);
+-
+-        avahi_free(e);
+-        return NULL;
+-    }
+-
+-    /* Create watches */
+-
+-    e->watch_ipv4 = e->watch_ipv6 = NULL;
+-
+-    if (e->fd_ipv4 >= 0)
+-        e->watch_ipv4 = s->poll_api->watch_new(e->server->poll_api, e->fd_ipv4, AVAHI_WATCH_IN, socket_event, e);
+-    if (e->fd_ipv6 >= 0)
+-        e->watch_ipv6 = s->poll_api->watch_new(e->server->poll_api, e->fd_ipv6, AVAHI_WATCH_IN, socket_event, e);
+-
+     e->n_dns_servers = e->current_dns_server = 0;
+ 
+     /* Initialize cache */
+@@ -651,18 +673,6 @@ void avahi_wide_area_engine_free(AvahiWideAreaLookupEngine *e) {
+     avahi_hashmap_free(e->lookups_by_id);
+     avahi_hashmap_free(e->lookups_by_key);
+ 
+-    if (e->watch_ipv4)
+-        e->server->poll_api->watch_free(e->watch_ipv4);
+-
+-    if (e->watch_ipv6)
+-        e->server->poll_api->watch_free(e->watch_ipv6);
+-
+-    if (e->fd_ipv6 >= 0)
+-        close(e->fd_ipv6);
+-
+-    if (e->fd_ipv4 >= 0)
+-        close(e->fd_ipv4);
+-
+     avahi_free(e);
+ }
+ 
+@@ -680,7 +690,7 @@ void avahi_wide_area_set_servers(AvahiWideAreaLookupEngine *e, const AvahiAddres
+ 
+     if (a) {
+         for (e->n_dns_servers = 0; n > 0 && e->n_dns_servers < AVAHI_WIDE_AREA_SERVERS_MAX; a++, n--)
+-            if ((a->proto == AVAHI_PROTO_INET && e->fd_ipv4 >= 0) || (a->proto == AVAHI_PROTO_INET6 && e->fd_ipv6 >= 0))
++            if (a->proto == AVAHI_PROTO_INET || a->proto == AVAHI_PROTO_INET6)
+                 e->dns_servers[e->n_dns_servers++] = *a;
+     } else {
+         assert(n == 0);
-- 
2.43.0



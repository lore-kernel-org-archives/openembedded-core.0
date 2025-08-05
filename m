Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2536AC87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 16:43:46 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.4078.1754412225017320463
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 09:43:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sQU99DOX;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b3aa2a0022cso5718413a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 09:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1754412224; x=1755017024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1u07H4P8xgxBzJ4szKuMVXnwX1kLLs1B+czWnFppxqY=;
        b=sQU99DOX/BWiOLp/IcHoK4oaM3MbSeDGnWd6WtKq8iFUesUAUoPJ/7em2++G+SIQca
         0GkVEASoOpfTmnhARTwNZ9kJerQBSvqWw1GDbYmYmU06F+U4VeLH1cbUXBH+Vs8t+GHA
         pHU41mHcuzB42mSzQSu9jV0OKWdxcTH2t9VJPhCQ+XkRXHU5aRz2NXaIFh8gIrZgISAw
         LwriQTTUcUgbvuFw34xxnv6W2CIiKCpaxmd+vk7iS+XpWu4uC8zbQ7BoXrrcJXCOLRUc
         8uFlqA7Peag/XtcgD04eTo/lMICAQKAwEqVQnLHZfiVP6nHFv1soaFxI3yvDRpRZbm3V
         oM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754412224; x=1755017024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1u07H4P8xgxBzJ4szKuMVXnwX1kLLs1B+czWnFppxqY=;
        b=p5METfwoXuisTe5Q61Ec/F/mLF3j/VnQGm6vbpxnMkvfOQzWOiGevXDNpPIQE8xTw2
         g7TmkIXqtZmEt5Sx6CLXqoqgHjD5mAr7pgZxGOMKVNfvjquPO/+RenNCjJUGc/CkRcEl
         Wne8KngTtBI4iVzq7nl8HpZShEkKrzYQTSRYKMDZTh/hFDKxH0tOsp8owuz2zEg/s3QH
         JHsVT7XDiy+GlHRDqTEQnLheVxJpaTAlfNNKq+JbIsgC7nClMDgDQI2zuNv0yOx0EPiK
         xwj4QneiOJXG4as0+HwqmPfjQT/qXKE8gkeVjIZ6D8/XFO0j/s1PXjX4LfUeJwGz53/x
         3/7w==
X-Gm-Message-State: AOJu0YyV2PW2/g/s3yxSmN8NMEZQO0H3pvNdnUIazgy589z4HLsztp5w
	OrIJzdlSrrnMdfMhnwT2HtQXszQsY1uyrZ2WGOZDKD6UxP9SCFiXEPED9bEVDFQkmnR6lrzYxZw
	ptAUv
X-Gm-Gg: ASbGncs0iFDmdJqXUUvuLBFZl1BxR6toYPXAppXt08x5dCwrzUaYkcVrnAZK6MM+ige
	iauGOqfbIMWV7wByg/VI+3ZQuVmZGBhWwZN8lXYEItP/0s6aW28TF0hvnguI70kPBXajZSHn8J7
	4Kj3Un4OvQn8b9PPCaoeeteGM0dW1oj56b7hnJNO9JpNZMPpicyLcwTMamKbkT5h363ubi9XaD2
	Rqs7Kxjx/i6G3aelgpCZZiSRalZwCnT4VoCqK94MVzZe2ZaNRjoO4a4IkUhbQvQ9AwuFpQwD5VI
	aaZC8lyEkcNWmn36Jd67/LHCyoQKjWT04jS528422FenJk8uDBbfWDFFkj1y+q0H49Wid9mQPmV
	h65jIBAz4WhCa
X-Google-Smtp-Source: AGHT+IGS9oP5lv3ZdqHTVXUqf96YhgmP+ZYyHo2yBk7HYSnhX4sutJxDPPOiit8PNTiHweepomSa7Q==
X-Received: by 2002:a17:902:cec4:b0:240:48f4:40d5 with SMTP id d9443c01a7336-24247023e9cmr176354945ad.39.1754412223955;
        Tue, 05 Aug 2025 09:43:43 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3554:164c:182:30f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f0e7d8sm137633135ad.42.2025.08.05.09.43.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 09:43:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/4] avahi: fix CVE-2024-52615
Date: Tue,  5 Aug 2025 09:43:33 -0700
Message-ID: <7bd9fee6d654326ea921b51113de99f793e11545.1754412086.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754412086.git.steve@sakoman.com>
References: <cover.1754412086.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 16:43:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221480

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
index b3739ad2c0..20b2791ef3 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -36,6 +36,7 @@ SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}
            file://CVE-2023-38472.patch \
            file://CVE-2023-38473.patch \
            file://CVE-2024-52616.patch \
+           file://CVE-2024-52615.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
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



Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9107C87FCF
	for <webhook@archiver.kernel.org>; Sat,  9 Aug 2025 14:44:31 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.7400.1754750669559101833
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Aug 2025 07:44:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iUSAEurX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76bee58e01cso3744936b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 07:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1754750669; x=1755355469; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3SMKilqYTtrASUL+scc0ehpVSeNjEVPqKwRaY79mVCk=;
        b=iUSAEurXkD3McbbgkkpuzEGmxK5sOgcNshxYfqjGWkcHPi2qHl9BdPzIaUXeUaTMTt
         evTS1dlDWaSPvr1msazVeP+ua//XC/okgcffCtgRYAFwmN/67z7fT/fc/CKv5A52pxkj
         i5sSkpfC+y1HadtZtuhbnO2KV8ilnoVgm9YNlFp49KkuCGrZuU8s/dAhML2WosGqe4GC
         gg0g7ZYJBnYcrROHTpLDGU/Vq5uuFV85a8uj9RVyEGhJy0+R1qcePKjrT6IgDQXKU3Ij
         Aol4I/RPXSTZljU13wAHXbmcYGqPO1IpE3OzaM058eV03YxWE05ytFTT4ImjtW45y62y
         Bc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754750669; x=1755355469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3SMKilqYTtrASUL+scc0ehpVSeNjEVPqKwRaY79mVCk=;
        b=GSjHyQiI9bqzJqDiCphtIwqNowp95lAkC3qhgtC7OkmIYul1uaRlLnRaURlUmMf6at
         E20NHTBYrYjmUEdljlFCUbLy65p9Gf0CMYOyhyqLkPWkyDqQ4DsCDqRLDm03gUNx92Py
         iyWnIiC8d9I48GAQaylVYy0mmG2XK2JaNFGCoAzhmndcsEgMyV4G7G0baESS0ZX/pqTm
         cBv2iW3xc0ORfVf5ECP2DryE1xLGCUqnAl86Te1SSK5hWYgdyFcmOGfC6zIqpoSzO3p/
         z2FzqyCXqy4vVMwnsaBlDWTxM8KXYeYaa1sII3yUZ/87wjeXWKVnRhRvUQIYY8sg9Xoa
         7gCA==
X-Gm-Message-State: AOJu0YyCNXzqzWWLHeb6bEK/JcincCKyPdcfpGs00gbOuvEvDuH8OQpH
	WeDeTCfGXKNZtDIu/LaOugNKDZS2mXNx1MhcTq8o+I8YDkjhaX5zdguGTvyOdVqPk0jl28R+bim
	OvRik
X-Gm-Gg: ASbGnctGbs+27jP0QnUId2zAxWnemPfxbaoT5/iyUH5vbKYsh/PkjQJ91VyLRG6U7uA
	9O6T4ecNhroNfi2fz/d0HLJsOTKInJ9Ylox6HZp9SwEcf/yDLNOtcVTxGNam7/UbvaheuLb2uO+
	oPOy9ilsLNMXbEGTzRVf/9jrb0pLwMnEza5YSZjnfOQskIbD3+PwSi+p2vYosvRjQ2PS8YDlFgY
	O8UGX63vRIeTrVDO+/455Lm7xbEghUJNnKotk5YMkl1bj7Qu5ZdyydpH9glj5+R8yDN+dTFR/u0
	s/9UGwXtlX8R05XijmrMyQDRJX3ZQ3e3H7s1szuZ9wBJyCWK0DmDUSLfc8FkXBlxXXlB76KUyaA
	E5m2Wnh40UbYDmQ==
X-Google-Smtp-Source: AGHT+IHzPeKLf8tgSu7SoUcMd0PMaJAOuBxpXuDqrfHIUPDihgergyoaeru30oF1wirCBMVmx0osDA==
X-Received: by 2002:a05:6a20:1611:b0:240:160b:81bf with SMTP id adf61e73a8af0-240550d16a7mr10923544637.19.1754750668676;
        Sat, 09 Aug 2025 07:44:28 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:e40b:779f:346e:b2b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b428f4c8639sm5736428a12.43.2025.08.09.07.44.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 07:44:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 1/6] avahi: fix CVE-2024-52615
Date: Sat,  9 Aug 2025 07:44:17 -0700
Message-ID: <455f3a936874e62b57d50cc1b84dc816e35312af.1754750560.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754750560.git.steve@sakoman.com>
References: <cover.1754750560.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 14:44:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221676

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
index 734a73541f..4fe8ba4d28 100644
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



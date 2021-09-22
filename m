Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.2008.1632325123647413910
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Sep 2021 08:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PjQ3jW+W;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id m21so3030969pgu.13
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Sep 2021 08:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=rZHgSjhj8JU7zkJTVKPy+BkvSQMhgwjm9K1JI9KcSXI=;
        b=PjQ3jW+WgKyqJRWsm1Ax6StEFC8WlGtEN0YHIcELndnIqCfVMEfOQ3rJEk3PE7uZBp
         cPReF01co6AsFae+PqNi05BO+J3TOXUdiGxspJegvaXWHSFACIHjQGkNhzDL1ANvd8IW
         ERX/0iWsyv2SFlE1WiAaiHVt6o5E5gEucH4C/KHm1b9z2t7bBrS0M/M8X+5BlEVTP+Wa
         DZ9QxLp9dQkJwRjyM0wTmxQ+KWqyW86Z+A64G7xrGQs1ljJ5xrZjTIOiYAb15L7mVcPS
         elj5c26R1/aUc+vY3f97HQkgdNqq9I53mb+ae9VyVnazJrIehjxjH2qb2H/emKJb3gn4
         KK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=rZHgSjhj8JU7zkJTVKPy+BkvSQMhgwjm9K1JI9KcSXI=;
        b=xv59gYgAjoIpK+I7mokSTYtFFGCAurAtlX8M7CNTqv0psjTgmjWDWOYNmuBctphouF
         tyqkScE6k6H2KsVz7Z6jrstoZt65F6zcHcrOiir7kOoGQap4kn3YgBdGZfMqLWabd7ZK
         k72rLkPZE77W53bUlbTLzPSQ1hWlGQGMHOEP16Mhb88Hj2o2r6KhhkR2hDP+0Gi6kbG0
         toSFRhGUTiiG3CRQC3TAvK6WwrwZ1g2evtEwHlYp13N9027teAWBkRex8LAnH4V/oZb+
         t6yGwcmAsWvvOL1pebdLPYPTOCvsg9Y92qoupoz/PL5wRsOMl9T6s9At2FsQTh5OwM1N
         39iQ==
X-Gm-Message-State: AOAM53014BWsAo00pNnREduRM4fV4iuhWj1OdCprR7RYbYuyWL0UYFE0
	oWmbSVXuyJikS3Zt1K0bjiw0Sky4bFo=
X-Google-Smtp-Source: ABdhPJyF63OKPKuFlK+TeMFceIe7xhRNcOBOMTi3qMhBqZxBDPjMTSgojM1CiBzYkiTuGI3Vg/HVdw==
X-Received: by 2002:aa7:82d0:0:b0:413:5e93:2f7a with SMTP id f16-20020aa782d0000000b004135e932f7amr59591pfn.16.1632325122023;
        Wed, 22 Sep 2021 08:38:42 -0700 (PDT)
Return-Path: <ranjitsinhrathod1991@gmail.com>
Received: from localhost.localdomain ([103.238.105.73])
        by smtp.gmail.com with ESMTPSA id z8sm2799433pfa.113.2021.09.22.08.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 08:38:41 -0700 (PDT)
From: "Ranjitsinh Rathod" <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [meta][dunfell][PATCH] systemd: Add fix for systemd-networkd crash during free
Date: Wed, 22 Sep 2021 21:08:08 +0530
Message-Id: <20210922153808.16309-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

We are observing systemd-network service crash during link down
while freeing link->ifname pointer

Backtrace:
(gdb) bt
0  __GI_abort () at abort.c:107
1  0x0000007f861d32b4 in __libc_message (action=action@entry=do_abort, fmt=fmt@entry=0x7f8628d500 "%s\n") at ../sysdeps/posix/libc_fatal.c:155
2  0x0000007f861da51c in malloc_printerr (str=str@entry=0x7f86289070 "free(): invalid next size (fast)") at malloc.c:5347
3  0x0000007f861dbd58 in _int_free (av=0x7f862c9a28 <main_arena>, p=0x558aa28eb0, have_lock=0) at malloc.c:4249
4  0x0000005569249cf0 in link_free (link=0x558aa1c0d0) at ../git/src/network/networkd-link.c:715
5  link_unref (p=0x558aa1c0d0) at ../git/src/network/networkd-link.c:734
6  0x000000556920f34c in manager_rtnl_process_link (rtnl=<optimized out>, message=0x558aa2a430, userdata=0x558a9fc630)

While checking upstream code change with regards to link->ifname
memory allocation and free, we found below PR which also fixes
random systemd-networkd crash:

https://github.com/systemd/systemd/pull/19631
https://github.com/systemd/systemd/issues/19629

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 ...-info-for-ordered-set-new-and-introd.patch |  78 +++++
 ...dered_set_clear-free-with-destructor.patch |  35 +++
 ...etwork-add-skeleton-of-request-queue.patch | 285 ++++++++++++++++++
 ...quests-when-link-enters-linger-state.patch |  50 +++
 ...ork-fix-Link-reference-counter-issue.patch | 278 +++++++++++++++++
 ...nk_drop-and-link_detach_from_manager.patch |  67 ++++
 meta/recipes-core/systemd/systemd_244.5.bb    |   6 +
 7 files changed, 799 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/basic-pass-allocation-info-for-ordered-set-new-and-introd.patch
 create mode 100644 meta/recipes-core/systemd/systemd/introduce-ordered_set_clear-free-with-destructor.patch
 create mode 100644 meta/recipes-core/systemd/systemd/network-add-skeleton-of-request-queue.patch
 create mode 100644 meta/recipes-core/systemd/systemd/network-also-drop-requests-when-link-enters-linger-state.patch
 create mode 100644 meta/recipes-core/systemd/systemd/network-fix-Link-reference-counter-issue.patch
 create mode 100644 meta/recipes-core/systemd/systemd/network-merge-link_drop-and-link_detach_from_manager.patch

diff --git a/meta/recipes-core/systemd/systemd/basic-pass-allocation-info-for-ordered-set-new-and-introd.patch b/meta/recipes-core/systemd/systemd/basic-pass-allocation-info-for-ordered-set-new-and-introd.patch
new file mode 100644
index 0000000000..86d9b0499a
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/basic-pass-allocation-info-for-ordered-set-new-and-introd.patch
@@ -0,0 +1,78 @@
+From 1f25c71d9d0b5fe6cf383c347dcebc2443a99fe1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Tue, 1 Sep 2020 12:42:35 +0200
+Subject: [PATCH] basic: pass allocation info for ordered_set_new() and
+ introduce ordered_set_ensure_put()
+
+Upstream-Status: Backport [https://github.com/systemd/systemd-stable/commit/1f25c71d9d0b5fe6cf383c347dcebc2443a99fe1]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ src/basic/ordered-set.c | 21 +++++++++++++++++++++
+ src/basic/ordered-set.h | 18 +++++++-----------
+ 2 files changed, 28 insertions(+), 11 deletions(-)
+
+diff --git a/src/basic/ordered-set.c b/src/basic/ordered-set.c
+index 7fdb47e064..fb82c17b5a 100644
+--- a/src/basic/ordered-set.c
++++ b/src/basic/ordered-set.c
+@@ -4,6 +4,27 @@
+ #include "ordered-set.h"
+ #include "strv.h"
+ 
++int _ordered_set_ensure_allocated(OrderedSet **s, const struct hash_ops *ops  HASHMAP_DEBUG_PARAMS) {
++        if (*s)
++                return 0;
++
++        *s = _ordered_set_new(ops  HASHMAP_DEBUG_PASS_ARGS);
++        if (!*s)
++                return -ENOMEM;
++
++        return 0;
++}
++
++int _ordered_set_ensure_put(OrderedSet **s, const struct hash_ops *ops, void *p  HASHMAP_DEBUG_PARAMS) {
++        int r;
++
++        r = _ordered_set_ensure_allocated(s, ops  HASHMAP_DEBUG_PASS_ARGS);
++        if (r < 0)
++                return r;
++
++        return ordered_set_put(*s, p);
++}
++
+ int ordered_set_consume(OrderedSet *s, void *p) {
+         int r;
+ 
+diff --git a/src/basic/ordered-set.h b/src/basic/ordered-set.h
+index a42a57eb49..2c241a808b 100644
+--- a/src/basic/ordered-set.h
++++ b/src/basic/ordered-set.h
+@@ -7,20 +7,16 @@
+ 
+ typedef struct OrderedSet OrderedSet;
+ 
+-static inline OrderedSet* ordered_set_new(const struct hash_ops *ops) {
+-        return (OrderedSet*) ordered_hashmap_new(ops);
++static inline OrderedSet* _ordered_set_new(const struct hash_ops *ops  HASHMAP_DEBUG_PARAMS) {
++        return (OrderedSet*) internal_ordered_hashmap_new(ops  HASHMAP_DEBUG_PASS_ARGS);
+ }
++#define ordered_set_new(ops) _ordered_set_new(ops  HASHMAP_DEBUG_SRC_ARGS)
+ 
+-static inline int ordered_set_ensure_allocated(OrderedSet **s, const struct hash_ops *ops) {
+-        if (*s)
+-                return 0;
++int _ordered_set_ensure_allocated(OrderedSet **s, const struct hash_ops *ops  HASHMAP_DEBUG_PARAMS);
++#define ordered_set_ensure_allocated(s, ops) _ordered_set_ensure_allocated(s, ops  HASHMAP_DEBUG_SRC_ARGS)
+ 
+-        *s = ordered_set_new(ops);
+-        if (!*s)
+-                return -ENOMEM;
+-
+-        return 0;
+-}
++int _ordered_set_ensure_put(OrderedSet **s, const struct hash_ops *ops, void *p  HASHMAP_DEBUG_PARAMS);
++#define ordered_set_ensure_put(s, hash_ops, key) _ordered_set_ensure_put(s, hash_ops, key  HASHMAP_DEBUG_SRC_ARGS)
+ 
+ static inline OrderedSet* ordered_set_free(OrderedSet *s) {
+         return (OrderedSet*) ordered_hashmap_free((OrderedHashmap*) s);
diff --git a/meta/recipes-core/systemd/systemd/introduce-ordered_set_clear-free-with-destructor.patch b/meta/recipes-core/systemd/systemd/introduce-ordered_set_clear-free-with-destructor.patch
new file mode 100644
index 0000000000..42b6e05b55
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/introduce-ordered_set_clear-free-with-destructor.patch
@@ -0,0 +1,35 @@
+From d38a6476aad3f2cc80a2a4bc11f3898cc06a70f5 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Mon, 26 Apr 2021 23:52:40 +0900
+Subject: [PATCH] ordered-set: introduce
+ ordered_set_clear/free_with_destructor()
+
+Upstream-Status: Backport [https://github.com/systemd/systemd-stable/commit/d38a6476aad3f2cc80a2a4bc11f3898cc06a70f5]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ src/basic/ordered-set.h | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/src/basic/ordered-set.h b/src/basic/ordered-set.h
+index a377f20b1f..64df41766f 100644
+--- a/src/basic/ordered-set.h
++++ b/src/basic/ordered-set.h
+@@ -63,6 +63,17 @@ void ordered_set_print(FILE *f, const char *field, OrderedSet *s);
+ #define ORDERED_SET_FOREACH(e, s, i)                                    \
+         for ((i) = ITERATOR_FIRST; ordered_set_iterate((s), &(i), (void**)&(e)); )
+ 
++#define ordered_set_clear_with_destructor(s, f)                 \
++        ({                                                      \
++                OrderedSet *_s = (s);                           \
++                void *_item;                                    \
++                while ((_item = ordered_set_steal_first(_s)))   \
++                        f(_item);                               \
++                _s;                                             \
++        })
++#define ordered_set_free_with_destructor(s, f)                  \
++        ordered_set_free(ordered_set_clear_with_destructor(s, f))
++
+ DEFINE_TRIVIAL_CLEANUP_FUNC(OrderedSet*, ordered_set_free);
+ DEFINE_TRIVIAL_CLEANUP_FUNC(OrderedSet*, ordered_set_free_free);
+ 
diff --git a/meta/recipes-core/systemd/systemd/network-add-skeleton-of-request-queue.patch b/meta/recipes-core/systemd/systemd/network-add-skeleton-of-request-queue.patch
new file mode 100644
index 0000000000..06c523834d
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/network-add-skeleton-of-request-queue.patch
@@ -0,0 +1,285 @@
+From 19d9a5adf0c1a6b5a243eea0390f6f6526d569de Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Fri, 7 May 2021 15:39:16 +0900
+Subject: [PATCH] network: add skeleton of request queue
+
+This will be used in later commits.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd-stable/commit/19d9a5adf0c1a6b5a243eea0390f6f6526d569de]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ src/network/meson.build        |   2 +
+ src/network/networkd-link.c    |  20 +++++-
+ src/network/networkd-manager.c |   7 ++
+ src/network/networkd-manager.h |   2 +
+ src/network/networkd-queue.c   | 121 +++++++++++++++++++++++++++++++++
+ src/network/networkd-queue.h   |  42 ++++++++++++
+ 6 files changed, 192 insertions(+), 2 deletions(-)
+ create mode 100644 src/network/networkd-queue.c
+ create mode 100644 src/network/networkd-queue.h
+
+diff --git a/src/network/meson.build b/src/network/meson.build
+index 4fca3106dc..a8b9232e64 100644
+--- a/src/network/meson.build
++++ b/src/network/meson.build
+@@ -105,6 +105,8 @@ sources = files('''
+         networkd-network.h
+         networkd-nexthop.c
+         networkd-nexthop.h
++        networkd-queue.c
++        networkd-queue.h
+         networkd-route.c
+         networkd-route.h
+         networkd-routing-policy-rule.c
+diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
+index 34359b2541..2f33305a27 100644
+--- a/src/network/networkd-link.c
++++ b/src/network/networkd-link.c
+@@ -30,6 +30,7 @@
+ #include "networkd-manager.h"
+ #include "networkd-ndisc.h"
+ #include "networkd-neighbor.h"
++#include "networkd-queue.h"
+ #include "networkd-radv.h"
+ #include "networkd-routing-policy-rule.h"
+ #include "networkd-wifi.h"
+
+@@ -2232,6 +2244,8 @@ static int link_reconfigure_internal(Link *link, sd_netlink_message *m, bool for
+         if (r < 0)
+                 return r;
+ 
++        link_drop_requests(link);
++
+         r = link_drop_config(link);
+         if (r < 0)
+                 return r;
+@@ -2664,6 +2678,8 @@ static int link_carrier_lost(Link *link) {
+                 return r;
+         }
+ 
++        link_drop_requests(link);
++
+         r = link_drop_config(link);
+         if (r < 0)
+                 return r;
+diff --git a/src/network/networkd-manager.c b/src/network/networkd-manager.c
+index 562ce5ca54..fd576169a9 100644
+--- a/src/network/networkd-manager.c
++++ b/src/network/networkd-manager.c
+@@ -34,6 +34,7 @@
+ #include "networkd-manager-bus.h"
+ #include "networkd-manager.h"
+ #include "networkd-network-bus.h"
++#include "networkd-queue.h"
+ #include "networkd-speed-meter.h"
+ #include "ordered-set.h"
+ #include "path-util.h"
+@@ -406,6 +407,10 @@ int manager_new(Manager **ret) {
+         if (r < 0)
+                 return r;
+ 
++        r = sd_event_add_post(m->event, NULL, manager_process_requests, m);
++        if (r < 0)
++                return r;
++
+         r = manager_connect_rtnl(m);
+         if (r < 0)
+                 return r;
+@@ -446,6 +451,8 @@ Manager* manager_free(Manager *m) {
+ 
+         free(m->state_file);
+ 
++        m->request_queue = ordered_set_free_with_destructor(m->request_queue, request_free);
++
+         while ((a = hashmap_first_key(m->dhcp6_prefixes)))
+                 (void) dhcp6_prefix_remove(m, a);
+         m->dhcp6_prefixes = hashmap_free(m->dhcp6_prefixes);
+diff --git a/src/network/networkd-manager.h b/src/network/networkd-manager.h
+index 301b97c1a1..26e8802871 100644
+--- a/src/network/networkd-manager.h
++++ b/src/network/networkd-manager.h
+@@ -91,6 +91,8 @@ struct Manager {
+         usec_t speed_meter_usec_old;
+ 
+         bool dhcp4_prefix_root_cannot_set_table;
++
++        OrderedSet *request_queue;
+ };
+ 
+ int manager_new(Manager **ret);
+diff --git a/src/network/networkd-queue.c b/src/network/networkd-queue.c
+new file mode 100644
+index 0000000000..24bb2c845d
+--- /dev/null
++++ b/src/network/networkd-queue.c
+@@ -0,0 +1,121 @@
++/* SPDX-License-Identifier: LGPL-2.1-or-later */
++
++#include "networkd-address.h"
++#include "networkd-manager.h"
++#include "networkd-neighbor.h"
++#include "networkd-nexthop.h"
++#include "networkd-route.h"
++#include "networkd-routing-policy-rule.h"
++#include "networkd-queue.h"
++
++static void request_free_object(RequestType type, void *object) {
++        switch(type) {
++        default:
++                assert_not_reached("invalid request type.");
++        }
++}
++
++Request *request_free(Request *req) {
++        if (!req)
++                return NULL;
++
++        if (req->on_free)
++                req->on_free(req);
++        if (req->consume_object)
++                request_free_object(req->type, req->object);
++        if (req->link && req->link->manager)
++                ordered_set_remove(req->link->manager->request_queue, req);
++        link_unref(req->link);
++
++        return mfree(req);
++}
++
++DEFINE_TRIVIAL_CLEANUP_FUNC(Request*, request_free);
++
++void request_drop(Request *req) {
++        if (req->message_counter)
++                (*req->message_counter)--;
++
++        request_free(req);
++}
++
++int link_queue_request(
++                Link *link,
++                RequestType type,
++                void *object,
++                bool consume_object,
++                unsigned *message_counter,
++                link_netlink_message_handler_t netlink_handler,
++                Request **ret) {
++
++        _cleanup_(request_freep) Request *req = NULL;
++        int r;
++
++        assert(link);
++        assert(link->manager);
++        assert(type >= 0 && type < _REQUEST_TYPE_MAX);
++        assert(object);
++        assert(netlink_handler);
++
++        req = new(Request, 1);
++        if (!req) {
++                if (consume_object)
++                        request_free_object(type, object);
++                return -ENOMEM;
++        }
++
++        *req = (Request) {
++                .link = link,
++                .type = type,
++                .object = object,
++                .consume_object = consume_object,
++                .message_counter = message_counter,
++                .netlink_handler = netlink_handler,
++        };
++
++        link_ref(link);
++
++        r = ordered_set_ensure_put(&link->manager->request_queue, NULL, req);
++        if (r < 0)
++                return r;
++
++        if (req->message_counter)
++                (*req->message_counter)++;
++
++        if (ret)
++                *ret = req;
++
++        TAKE_PTR(req);
++        return 0;
++}
++
++int manager_process_requests(sd_event_source *s, void *userdata) {
++        Manager *manager = userdata;
++        int r;
++
++        assert(manager);
++
++        for (;;) {
++                bool processed = false;
++                Request *req;
++                Iterator i;
++                ORDERED_SET_FOREACH(req, manager->request_queue, i) {
++                        switch(req->type) {
++                        default:
++                                return -EINVAL;
++                        }
++                        if (r < 0)
++                                link_enter_failed(req->link);
++                        if (r > 0) {
++                                ordered_set_remove(manager->request_queue, req);
++                                request_free(req);
++                                processed = true;
++                        }
++                }
++
++                if (!processed)
++                        break;
++        }
++
++        return 0;
++}
+diff --git a/src/network/networkd-queue.h b/src/network/networkd-queue.h
+new file mode 100644
+index 0000000000..4558ae548f
+--- /dev/null
++++ b/src/network/networkd-queue.h
+@@ -0,0 +1,42 @@
++/* SPDX-License-Identifier: LGPL-2.1-or-later */
++#pragma once
++
++#include "sd-event.h"
++
++#include "networkd-link.h"
++
++typedef struct Request Request;
++
++typedef int (*request_after_configure_handler_t)(Request*, void*);
++typedef void (*request_on_free_handler_t)(Request*);
++
++typedef enum RequestType {
++        _REQUEST_TYPE_MAX,
++        _REQUEST_TYPE_INVALID = -EINVAL,
++} RequestType;
++
++typedef struct Request {
++        Link *link;
++        RequestType type;
++        bool consume_object;
++        void *object;
++        void *userdata;
++        unsigned *message_counter;
++        link_netlink_message_handler_t netlink_handler;
++        request_after_configure_handler_t after_configure;
++        request_on_free_handler_t on_free;
++} Request;
++
++Request *request_free(Request *req);
++void request_drop(Request *req);
++
++int link_queue_request(
++                Link *link,
++                RequestType type,
++                void *object,
++                bool consume_object,
++                unsigned *message_counter,
++                link_netlink_message_handler_t netlink_handler,
++                Request **ret);
++
++int manager_process_requests(sd_event_source *s, void *userdata);
diff --git a/meta/recipes-core/systemd/systemd/network-also-drop-requests-when-link-enters-linger-state.patch b/meta/recipes-core/systemd/systemd/network-also-drop-requests-when-link-enters-linger-state.patch
new file mode 100644
index 0000000000..4c402e7e55
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/network-also-drop-requests-when-link-enters-linger-state.patch
@@ -0,0 +1,50 @@
+From 56001f023305ea99329e27141d6e6067596491a9 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Mon, 17 May 2021 15:32:57 +0900
+Subject: [PATCH] network: also drop requests when link enters linger state
+
+Otherwise, if link is removed, several references to the link in remain
+exist in requests.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd-stable/commit/56001f023305ea99329e27141d6e6067596491a9]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ src/network/networkd-link.c | 24 +++++++++++++-----------
+ 1 file changed, 13 insertions(+), 11 deletions(-)
+
+diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
+index 67d01ac44d..b56c232eca 100644
+--- a/src/network/networkd-link.c
++++ b/src/network/networkd-link.c
+@@ -1771,6 +1771,18 @@ static void link_drop_from_master(Link *link, NetDev *netdev) {
+         link_unref(set_remove(master->slaves, link));
+ }
+ 
++static void link_drop_requests(Link *link) {
++        Request *req;
++        Iterator i;
++
++        assert(link);
++        assert(link->manager);
++
++        ORDERED_SET_FOREACH(req, link->manager->request_queue, i)
++                if (req->link == link)
++                        request_drop(req);
++}
++
+ void link_drop(Link *link) {
+         if (!link)
+                 return;
+@@ -1782,6 +1793,8 @@ void link_drop(Link *link) {
+         /* Drop all references from other links and manager. Note that async netlink calls may have
+          * references to the link, and they will be dropped when we receive replies. */
+ 
++        link_drop_requests(link);
++
+         link_free_carrier_maps(link);
+ 
+         if (link->network) {
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/systemd/systemd/network-fix-Link-reference-counter-issue.patch b/meta/recipes-core/systemd/systemd/network-fix-Link-reference-counter-issue.patch
new file mode 100644
index 0000000000..a186bb4095
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/network-fix-Link-reference-counter-issue.patch
@@ -0,0 +1,278 @@
+From cc2d7efc5ca09a7de4bec55e80476986839a655c Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Fri, 14 May 2021 15:58:15 +0900
+Subject: [PATCH] network: fix Link reference counter issue
+
+Previously, when link_new() fails, `link_unref()` was called, so,
+`Manager::links` may become dirty.
+This introduces `link_drop_or_unref()` and it will be called on
+failure.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd-stable/commit/cc2d7efc5ca09a7de4bec55e80476986839a655c]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ src/network/networkd-link.c | 240 ++++++++++++++++++------------------
+ 1 file changed, 122 insertions(+), 118 deletions(-)
+
+diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
+index b56c232eca..d493afda4c 100644
+--- a/src/network/networkd-link.c
++++ b/src/network/networkd-link.c
+@@ -540,109 +540,6 @@ static int link_update_flags(Link *link,
+         return 0;
+ }
+ 
+-static int link_new(Manager *manager, sd_netlink_message *message, Link **ret) {
+-        _cleanup_(link_unrefp) Link *link = NULL;
+-        uint16_t type;
+-        const char *ifname, *kind = NULL;
+-        int r, ifindex;
+-        unsigned short iftype;
+-
+-        assert(manager);
+-        assert(message);
+-        assert(ret);
+-
+-        /* check for link kind */
+-        r = sd_netlink_message_enter_container(message, IFLA_LINKINFO);
+-        if (r == 0) {
+-                (void) sd_netlink_message_read_string(message, IFLA_INFO_KIND, &kind);
+-                r = sd_netlink_message_exit_container(message);
+-                if (r < 0)
+-                        return r;
+-        }
+-
+-        r = sd_netlink_message_get_type(message, &type);
+-        if (r < 0)
+-                return r;
+-        else if (type != RTM_NEWLINK)
+-                return -EINVAL;
+-
+-        r = sd_rtnl_message_link_get_ifindex(message, &ifindex);
+-        if (r < 0)
+-                return r;
+-        else if (ifindex <= 0)
+-                return -EINVAL;
+-
+-        r = sd_rtnl_message_link_get_type(message, &iftype);
+-        if (r < 0)
+-                return r;
+-
+-        r = sd_netlink_message_read_string(message, IFLA_IFNAME, &ifname);
+-        if (r < 0)
+-                return r;
+-
+-        link = new(Link, 1);
+-        if (!link)
+-                return -ENOMEM;
+-
+-        *link = (Link) {
+-                .n_ref = 1,
+-                .manager = manager,
+-                .state = LINK_STATE_PENDING,
+-                .ifindex = ifindex,
+-                .iftype = iftype,
+-
+-                .n_dns = (unsigned) -1,
+-                .dns_default_route = -1,
+-                .llmnr = _RESOLVE_SUPPORT_INVALID,
+-                .mdns = _RESOLVE_SUPPORT_INVALID,
+-                .dnssec_mode = _DNSSEC_MODE_INVALID,
+-                .dns_over_tls_mode = _DNS_OVER_TLS_MODE_INVALID,
+-        };
+-
+-        link->ifname = strdup(ifname);
+-        if (!link->ifname)
+-                return -ENOMEM;
+-
+-        if (kind) {
+-                link->kind = strdup(kind);
+-                if (!link->kind)
+-                        return -ENOMEM;
+-        }
+-
+-        r = sd_netlink_message_read_u32(message, IFLA_MASTER, (uint32_t *)&link->master_ifindex);
+-        if (r < 0)
+-                log_link_debug_errno(link, r, "New device has no master, continuing without");
+-
+-        r = sd_netlink_message_read_ether_addr(message, IFLA_ADDRESS, &link->mac);
+-        if (r < 0)
+-                log_link_debug_errno(link, r, "MAC address not found for new device, continuing without");
+-
+-        if (asprintf(&link->state_file, "/run/systemd/netif/links/%d", link->ifindex) < 0)
+-                return -ENOMEM;
+-
+-        if (asprintf(&link->lease_file, "/run/systemd/netif/leases/%d", link->ifindex) < 0)
+-                return -ENOMEM;
+-
+-        if (asprintf(&link->lldp_file, "/run/systemd/netif/lldp/%d", link->ifindex) < 0)
+-                return -ENOMEM;
+-
+-        r = hashmap_ensure_allocated(&manager->links, NULL);
+-        if (r < 0)
+-                return r;
+-
+-        r = hashmap_put(manager->links, INT_TO_PTR(link->ifindex), link);
+-        if (r < 0)
+-                return r;
+-
+-        r = link_update_flags(link, message, false);
+-        if (r < 0)
+-                return r;
+-
+-        *ret = TAKE_PTR(link);
+-
+-        return 0;
+-}
+-
+ void link_ntp_settings_clear(Link *link) {
+         link->ntp = strv_free(link->ntp);
+ }
+@@ -2030,9 +1927,9 @@ static void link_drop_requests(Link *lin
+                         request_drop(req);
+ }
+ 
+-void link_drop(Link *link) {
++Link *link_drop(Link *link) {
+         if (!link)
+-                return;
++                return NULL;
+ 
+         assert(link->manager);
+ 
+@@ -2057,7 +1954,7 @@ void link_drop(Link *link) {
+ 
+         /* The following must be called at last. */
+         assert_se(hashmap_remove(link->manager->links, INT_TO_PTR(link->ifindex)) == link);
+-        link_unref(link);
++        return link_unref(link);
+ }
+ 
+ static int link_joined(Link *link) {
+@@ -3295,6 +3192,112 @@ ipv4ll_address_fail:
+ 
+         return 0;
+ }
++
++static Link *link_drop_or_unref(Link *link) {
++        if (!link)
++                return NULL;
++        if (!link->manager)
++                return link_unref(link);
++        return link_drop(link);
++}
++
++DEFINE_TRIVIAL_CLEANUP_FUNC(Link*, link_drop_or_unref);
++
++static int link_new(Manager *manager, sd_netlink_message *message, Link **ret) {
++        _cleanup_(link_drop_or_unrefp) Link *link = NULL;
++        uint16_t type;
++        _cleanup_free_ char *ifname = NULL, *kind = NULL;
++        int r, ifindex;
++        unsigned short iftype;
++
++        assert(manager);
++        assert(message);
++        assert(ret);
++
++        r = sd_netlink_message_get_type(message, &type);
++        if (r < 0)
++                return r;
++        else if (type != RTM_NEWLINK)
++                return -EINVAL;
++
++        r = sd_rtnl_message_link_get_ifindex(message, &ifindex);
++        if (r < 0)
++                return r;
++        else if (ifindex <= 0)
++                return -EINVAL;
++
++        r = sd_rtnl_message_link_get_type(message, &iftype);
++        if (r < 0)
++                return r;
++
++        r = sd_netlink_message_read_string_strdup(message, IFLA_IFNAME, &ifname);
++        if (r < 0)
++                return r;
++
++        /* check for link kind */
++        r = sd_netlink_message_enter_container(message, IFLA_LINKINFO);
++        if (r >= 0) {
++                (void) sd_netlink_message_read_string_strdup(message, IFLA_INFO_KIND, &kind);
++                r = sd_netlink_message_exit_container(message);
++                if (r < 0)
++                        return r;
++        }
++
++        link = new(Link, 1);
++        if (!link)
++                return -ENOMEM;
++
++        *link = (Link) {
++                .n_ref = 1,
++                .state = LINK_STATE_PENDING,
++                .ifindex = ifindex,
++                .iftype = iftype,
++                .ifname = TAKE_PTR(ifname),
++                .kind = TAKE_PTR(kind),
++
++                .n_dns = (unsigned) -1,
++                .dns_default_route = -1,
++                .llmnr = _RESOLVE_SUPPORT_INVALID,
++                .mdns = _RESOLVE_SUPPORT_INVALID,
++                .dnssec_mode = _DNSSEC_MODE_INVALID,
++                .dns_over_tls_mode = _DNS_OVER_TLS_MODE_INVALID,
++        };
++
++        r = hashmap_ensure_allocated(&manager->links, NULL);
++        if (r < 0)
++                return r;
++
++        r = hashmap_put(manager->links, INT_TO_PTR(link->ifindex), link);
++        if (r < 0)
++                return r;
++
++        link->manager = manager;
++
++        r = sd_netlink_message_read_u32(message, IFLA_MASTER, (uint32_t*) &link->master_ifindex);
++        if (r < 0)
++                log_link_debug_errno(link, r, "New device has no master, continuing without");
++
++        r = sd_netlink_message_read_ether_addr(message, IFLA_ADDRESS, &link->mac);
++        if (r < 0)
++                log_link_debug_errno(link, r, "MAC address not found for new device, continuing without");
++
++        if (asprintf(&link->state_file, "/run/systemd/netif/links/%d", link->ifindex) < 0)
++                return -ENOMEM;
++
++        if (asprintf(&link->lease_file, "/run/systemd/netif/leases/%d", link->ifindex) < 0)
++                return -ENOMEM;
++
++        if (asprintf(&link->lldp_file, "/run/systemd/netif/lldp/%d", link->ifindex) < 0)
++                return -ENOMEM;
++
++        r = link_update_flags(link, message, false);
++        if (r < 0)
++                return r;
++
++        *ret = TAKE_PTR(link);
++
++        return 0;
++}
+ 
+ int link_add(Manager *m, sd_netlink_message *message, Link **ret) {
+         _cleanup_(sd_device_unrefp) sd_device *device = NULL;
+
+--- a/src/network/networkd-link.h	2021-09-02 18:04:16.900542857 +0530
++++ b/src/network/networkd-link.h	2021-09-02 18:18:56.776571563 +0530
+@@ -175,7 +175,7 @@ DEFINE_TRIVIAL_DESTRUCTOR(link_netlink_d
+ 
+ int link_get(Manager *m, int ifindex, Link **ret);
+ int link_add(Manager *manager, sd_netlink_message *message, Link **ret);
+-void link_drop(Link *link);
++Link *link_drop(Link *link);
+ 
+ int link_down(Link *link, link_netlink_message_handler_t callback);
+ 
+
diff --git a/meta/recipes-core/systemd/systemd/network-merge-link_drop-and-link_detach_from_manager.patch b/meta/recipes-core/systemd/systemd/network-merge-link_drop-and-link_detach_from_manager.patch
new file mode 100644
index 0000000000..65bdc611df
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/network-merge-link_drop-and-link_detach_from_manager.patch
@@ -0,0 +1,67 @@
+From 63130eb36dc51e4fd50716c585f98ebe456ca7cf Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Mon, 17 May 2021 15:40:15 +0900
+Subject: [PATCH] network: merge link_drop() and link_detach_from_manager()
+
+link_detach_from_manager() is only called by link_drop(). It is not
+necessary to split such tiny function.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd-stable/commit/63130eb36dc51e4fd50716c585f98ebe456ca7cf]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ src/network/networkd-link.c | 27 ++++++++++++---------------
+ 1 file changed, 12 insertions(+), 15 deletions(-)
+
+diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
+index 9d30e16b0a..67d01ac44d 100644
+--- a/src/network/networkd-link.c
++++ b/src/network/networkd-link.c
+@@ -2019,24 +2019,17 @@ static void link_drop_from_master(Link *link, NetDev *netdev) {
+         link_unref(set_remove(master->slaves, link));
+ }
+ 
+-static void link_detach_from_manager(Link *link) {
+-        if (!link || !link->manager)
+-                return;
+-
+-        link_unref(set_remove(link->manager->links_requesting_uuid, link));
+-        link_clean(link);
+-
+-        /* The following must be called at last. */
+-        assert_se(hashmap_remove(link->manager->links, INT_TO_PTR(link->ifindex)) == link);
+-        link_unref(link);
+-}
+-
+ void link_drop(Link *link) {
+-        if (!link || link->state == LINK_STATE_LINGER)
++        if (!link)
+                 return;
+ 
++        assert(link->manager);
++
+         link_set_state(link, LINK_STATE_LINGER);
+ 
++        /* Drop all references from other links and manager. Note that async netlink calls may have
++         * references to the link, and they will be dropped when we receive replies. */
++
+         link_free_carrier_maps(link);
+ 
+         if (link->network) {
+@@ -2044,10 +2037,14 @@ void link_drop(Link *link) {
+                 link_drop_from_master(link, link->network->bond);
+         }
+ 
+-        log_link_debug(link, "Link removed");
++        link_unref(set_remove(link->manager->links_requesting_uuid, link));
+ 
+         (void) unlink(link->state_file);
+-        link_detach_from_manager(link);
++        link_clean(link);
++
++        /* The following must be called at last. */
++        assert_se(hashmap_remove(link->manager->links, INT_TO_PTR(link->ifindex)) == link);
++        link_unref(link);
+ }
+ 
+ static int link_joined(Link *link) {
diff --git a/meta/recipes-core/systemd/systemd_244.5.bb b/meta/recipes-core/systemd/systemd_244.5.bb
index 7a7eddcd45..bf33b8d6a1 100644
--- a/meta/recipes-core/systemd/systemd_244.5.bb
+++ b/meta/recipes-core/systemd/systemd_244.5.bb
@@ -22,6 +22,12 @@ SRC_URI += "file://touchscreen.rules \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://CVE-2021-33910.patch \
            file://CVE-2020-13529.patch \
+           file://basic-pass-allocation-info-for-ordered-set-new-and-introd.patch \
+           file://introduce-ordered_set_clear-free-with-destructor.patch \
+           file://network-add-skeleton-of-request-queue.patch \
+           file://network-merge-link_drop-and-link_detach_from_manager.patch \
+           file://network-also-drop-requests-when-link-enters-linger-state.patch \
+           file://network-fix-Link-reference-counter-issue.patch \
            "
 
 # patches needed by musl
-- 
2.17.1


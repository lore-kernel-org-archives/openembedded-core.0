Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3B6C83005
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 16:03:17 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.39224.1686499388434253420
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 09:03:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=J+W7lAxr;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2553663f71eso1595397a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 09:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686499387; x=1689091387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhJI2ekU86xx3BRcMbIKJbNOrnGaa77mzAcpgIpgYOE=;
        b=J+W7lAxruPdAkNqKp4sqlDXGId8qzPSunDuSOolz7Tl3fCbGqWcY9Hrv/RMfvc1gsi
         JWK/Huk6S4MbT6hZPLvt300PKNp6mCaD8Mjs1EbdT9Pwvg6hBhiGQODhDVniVKy2hw7v
         kFKt1XZ6Njl/CLDHlHBh/+Y9M9jH+NmE/yG+3xD/skT6XtqYwC5KEK8BAONtqarIllCj
         /DZkb3ReCxKKjipEU09TFSWBSILqxnns6cz98NTqaPVa/zp6yOQe7jV/3g4NYkiiwiKB
         TcsGsz2EncUjAyJp1CxxFF/ozJ/pZuWkDt+2824kXRPSj9o1onbbIj7VwlkmWiDHNlJV
         oswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686499387; x=1689091387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhJI2ekU86xx3BRcMbIKJbNOrnGaa77mzAcpgIpgYOE=;
        b=cL1rmoA575KSqF47M99Do2nFyavcGLC72tuRTN5QaVLLPxhoQKduaAKuNq4hKFGWpv
         rUhopu60ftHargIzE/t53c15O2WpEIyyZDnC5ZtpqKKbzRe2mIljXx6Jgmq5qA5ozMpo
         X93MOZzOEJLu9/GCfJEbkydRl4Vqn1ClR2lmkTtMUd499uBOSN3OJIPYlh1YEwLYKCGz
         F8JUiSS2wYOrbMqko6Knorao+jOGV59XfGw2LR3VjHiNEmiHT3MNJtcLBMF6ukCLVFTW
         JeIQTdJw2UpiDhvvqMgieTAePDVKmBVmvmKpmEYg1Cy1QQh1LejTKbEB7oIjB+nv/aB8
         vHWg==
X-Gm-Message-State: AC+VfDyElLqg2uGvoegxpCx9qE0tK1DLUsbY2gy2CI6wCo/ffcJFUbxE
	uNG57OwjE1O8HtYmqFkhgs83asleTxcBimBpKlo=
X-Google-Smtp-Source: ACHHUZ4EVQnT98WMfPDaElDXC1xCbPCI1jQ8aemNH0zAp2xaFyCENssT05bD6PEQh4wbvWs0P4GuHg==
X-Received: by 2002:a17:90b:3143:b0:255:67fc:551a with SMTP id ip3-20020a17090b314300b0025567fc551amr6386659pjb.11.1686499387141;
        Sun, 11 Jun 2023 09:03:07 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id ix4-20020a170902f80400b001b3d20ef257sm113378plb.97.2023.06.11.09.03.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 09:03:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/11] systemd-networkd: backport fix for rm unmanaged wifi
Date: Sun, 11 Jun 2023 06:02:41 -1000
Message-Id: <56fdf57d99900b8dfb75bf915fcab45d4c1a458e.1686499221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686499221.git.steve@sakoman.com>
References: <cover.1686499221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 16:03:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182630

From: "C. Andy Martin" <cam@myfastmail.com>

Upstream v250 of systemd-newtorkd contains a race which will drop the
config of unmanaged wireless interfaces during reconfigure or carrier
loss. This bug is fixed in v251 by this commit:

commit a0e99a377a2f22c0ba460d3e7228214008714c14
Author: Yu Watanabe <watanabe.yu+github@gmail.com>
Date:   Mon Jan 31 19:08:27 2022 +0900

    network: remove only managed configs on reconfigure or carrier lost

    Otherwise, if the carrir of the non-managed interface is lost, the
    configs such as addresses or routes on the interface will be removed by
    networkd.

A bug was filed upstream on v250 to have upstream backport but was
rejected as "version-too-ancient", so backport this commit as a patch to
systemd-networkd for kirkstone.

Fixes: [YOCTO #15134]

Signed-off-by: C. Andy Martin <cam@myfastmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...nly-managed-configs-on-reconfigure-o.patch | 358 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_250.5.bb    |   1 +
 2 files changed, 359 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-network-remove-only-managed-configs-on-reconfigure-o.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-network-remove-only-managed-configs-on-reconfigure-o.patch b/meta/recipes-core/systemd/systemd/0001-network-remove-only-managed-configs-on-reconfigure-o.patch
new file mode 100644
index 0000000000..8950981d2e
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-network-remove-only-managed-configs-on-reconfigure-o.patch
@@ -0,0 +1,358 @@
+From 31b25c7d360a2ef2da1717aa39f190de5222d11a Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Mon, 31 Jan 2022 19:08:27 +0900
+Subject: [PATCH] network: remove only managed configs on reconfigure or
+ carrier lost
+
+Otherwise, if the carrir of the non-managed interface is lost, the
+configs such as addresses or routes on the interface will be removed by
+networkd.
+
+Upstream-Status: Backport [systemd v251 a0e99a377a2f22c0ba460d3e7228214008714c14]
+Signed-off-by: C. Andy Martin <cam@myfastmail.com>
+---
+ src/network/networkd-address.c              | 13 +++++--------
+ src/network/networkd-address.h              |  2 +-
+ src/network/networkd-link.c                 | 18 ++++++++++--------
+ src/network/networkd-neighbor.c             |  6 +++++-
+ src/network/networkd-neighbor.h             |  2 +-
+ src/network/networkd-nexthop.c              | 16 ++++++++++------
+ src/network/networkd-nexthop.h              |  2 +-
+ src/network/networkd-route.c                | 16 ++++++++++------
+ src/network/networkd-route.h                |  2 +-
+ src/network/networkd-routing-policy-rule.c  |  4 ++--
+ src/network/networkd-routing-policy-rule.h  |  2 +-
+ test/test-network/systemd-networkd-tests.py |  2 +-
+ 12 files changed, 48 insertions(+), 37 deletions(-)
+
+diff --git a/src/network/networkd-address.c b/src/network/networkd-address.c
+index 7df743efb5..01c1d88dec 100644
+--- a/src/network/networkd-address.c
++++ b/src/network/networkd-address.c
+@@ -891,22 +891,19 @@ int link_drop_foreign_addresses(Link *link) {
+         return r;
+ }
+ 
+-int link_drop_addresses(Link *link) {
++int link_drop_managed_addresses(Link *link) {
+         Address *address;
+         int k, r = 0;
+ 
+         assert(link);
+ 
+         SET_FOREACH(address, link->addresses) {
+-                /* Ignore addresses not assigned yet or already removing. */
+-                if (!address_exists(address))
++                /* Do not touch addresses managed by kernel or other tools. */
++                if (address->source == NETWORK_CONFIG_SOURCE_FOREIGN)
+                         continue;
+ 
+-                /* Do not drop IPv6LL addresses assigned by the kernel here. They will be dropped in
+-                 * link_drop_ipv6ll_addresses() if IPv6LL addressing is disabled. */
+-                if (address->source == NETWORK_CONFIG_SOURCE_FOREIGN &&
+-                    address->family == AF_INET6 &&
+-                    in6_addr_is_link_local(&address->in_addr.in6))
++                /* Ignore addresses not assigned yet or already removing. */
++                if (!address_exists(address))
+                         continue;
+ 
+                 k = address_remove(address);
+diff --git a/src/network/networkd-address.h b/src/network/networkd-address.h
+index 41c4ce6fa4..b2110d8d21 100644
+--- a/src/network/networkd-address.h
++++ b/src/network/networkd-address.h
+@@ -74,7 +74,7 @@ void address_set_broadcast(Address *a);
+ 
+ DEFINE_NETWORK_SECTION_FUNCTIONS(Address, address_free);
+ 
+-int link_drop_addresses(Link *link);
++int link_drop_managed_addresses(Link *link);
+ int link_drop_foreign_addresses(Link *link);
+ int link_drop_ipv6ll_addresses(Link *link);
+ void link_foreignize_addresses(Link *link);
+diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
+index b62a154828..12c592b257 100644
+--- a/src/network/networkd-link.c
++++ b/src/network/networkd-link.c
+@@ -1070,27 +1070,27 @@ static int link_drop_foreign_config(Link *link) {
+         return r;
+ }
+ 
+-static int link_drop_config(Link *link) {
++static int link_drop_managed_config(Link *link) {
+         int k, r;
+ 
+         assert(link);
+         assert(link->manager);
+ 
+-        r = link_drop_routes(link);
++        r = link_drop_managed_routes(link);
+ 
+-        k = link_drop_nexthops(link);
++        k = link_drop_managed_nexthops(link);
+         if (k < 0 && r >= 0)
+                 r = k;
+ 
+-        k = link_drop_addresses(link);
++        k = link_drop_managed_addresses(link);
+         if (k < 0 && r >= 0)
+                 r = k;
+ 
+-        k = link_drop_neighbors(link);
++        k = link_drop_managed_neighbors(link);
+         if (k < 0 && r >= 0)
+                 r = k;
+ 
+-        k = link_drop_routing_policy_rules(link);
++        k = link_drop_managed_routing_policy_rules(link);
+         if (k < 0 && r >= 0)
+                 r = k;
+ 
+@@ -1318,7 +1318,9 @@ static int link_reconfigure_impl(Link *link, bool force) {
+                  * link_drop_foreign_config() in link_configure(). */
+                 link_foreignize_config(link);
+         else {
+-                r = link_drop_config(link);
++                /* Remove all managed configs. Note, foreign configs are removed in later by
++                 * link_configure() -> link_drop_foreign_config() if the link is managed by us. */
++                r = link_drop_managed_config(link);
+                 if (r < 0)
+                         return r;
+         }
+@@ -1705,7 +1707,7 @@ static int link_carrier_lost_impl(Link *link) {
+         if (r < 0)
+                 ret = r;
+ 
+-        r = link_drop_config(link);
++        r = link_drop_managed_config(link);
+         if (r < 0 && ret >= 0)
+                 ret = r;
+ 
+diff --git a/src/network/networkd-neighbor.c b/src/network/networkd-neighbor.c
+index 1766095e53..b58898a6dc 100644
+--- a/src/network/networkd-neighbor.c
++++ b/src/network/networkd-neighbor.c
+@@ -406,13 +406,17 @@ int link_drop_foreign_neighbors(Link *link) {
+         return r;
+ }
+ 
+-int link_drop_neighbors(Link *link) {
++int link_drop_managed_neighbors(Link *link) {
+         Neighbor *neighbor;
+         int k, r = 0;
+ 
+         assert(link);
+ 
+         SET_FOREACH(neighbor, link->neighbors) {
++                /* Do not touch nexthops managed by kernel or other tools. */
++                if (neighbor->source == NETWORK_CONFIG_SOURCE_FOREIGN)
++                        continue;
++
+                 /* Ignore neighbors not assigned yet or already removing. */
+                 if (!neighbor_exists(neighbor))
+                         continue;
+diff --git a/src/network/networkd-neighbor.h b/src/network/networkd-neighbor.h
+index e9e1854110..8e3c510cd5 100644
+--- a/src/network/networkd-neighbor.h
++++ b/src/network/networkd-neighbor.h
+@@ -34,7 +34,7 @@ int neighbor_compare_func(const Neighbor *a, const Neighbor *b);
+ 
+ void network_drop_invalid_neighbors(Network *network);
+ 
+-int link_drop_neighbors(Link *link);
++int link_drop_managed_neighbors(Link *link);
+ int link_drop_foreign_neighbors(Link *link);
+ void link_foreignize_neighbors(Link *link);
+ 
+diff --git a/src/network/networkd-nexthop.c b/src/network/networkd-nexthop.c
+index b829aaab90..42aa8c4c59 100644
+--- a/src/network/networkd-nexthop.c
++++ b/src/network/networkd-nexthop.c
+@@ -613,8 +613,8 @@ static void manager_mark_nexthops(Manager *manager, bool foreign, const Link *ex
+                 if (nexthop->protocol == RTPROT_KERNEL)
+                         continue;
+ 
+-                /* When 'foreign' is true, do not remove nexthops we configured. */
+-                if (foreign && nexthop->source != NETWORK_CONFIG_SOURCE_FOREIGN)
++                /* When 'foreign' is true, mark only foreign nexthops, and vice versa. */
++                if (foreign != (nexthop->source == NETWORK_CONFIG_SOURCE_FOREIGN))
+                         continue;
+ 
+                 /* Ignore nexthops not assigned yet or already removed. */
+@@ -641,7 +641,7 @@ static void manager_mark_nexthops(Manager *manager, bool foreign, const Link *ex
+         }
+ }
+ 
+-static int manager_drop_nexthops(Manager *manager) {
++static int manager_drop_marked_nexthops(Manager *manager) {
+         NextHop *nexthop;
+         int k, r = 0;
+ 
+@@ -704,14 +704,14 @@ int link_drop_foreign_nexthops(Link *link) {
+ 
+         manager_mark_nexthops(link->manager, /* foreign = */ true, NULL);
+ 
+-        k = manager_drop_nexthops(link->manager);
++        k = manager_drop_marked_nexthops(link->manager);
+         if (k < 0 && r >= 0)
+                 r = k;
+ 
+         return r;
+ }
+ 
+-int link_drop_nexthops(Link *link) {
++int link_drop_managed_nexthops(Link *link) {
+         NextHop *nexthop;
+         int k, r = 0;
+ 
+@@ -723,6 +723,10 @@ int link_drop_nexthops(Link *link) {
+                 if (nexthop->protocol == RTPROT_KERNEL)
+                         continue;
+ 
++                /* Do not touch addresses managed by kernel or other tools. */
++                if (nexthop->source == NETWORK_CONFIG_SOURCE_FOREIGN)
++                        continue;
++
+                 /* Ignore nexthops not assigned yet or already removing. */
+                 if (!nexthop_exists(nexthop))
+                         continue;
+@@ -734,7 +738,7 @@ int link_drop_nexthops(Link *link) {
+ 
+         manager_mark_nexthops(link->manager, /* foreign = */ false, link);
+ 
+-        k = manager_drop_nexthops(link->manager);
++        k = manager_drop_marked_nexthops(link->manager);
+         if (k < 0 && r >= 0)
+                 r = k;
+ 
+diff --git a/src/network/networkd-nexthop.h b/src/network/networkd-nexthop.h
+index 7a8920238c..1e54e9f211 100644
+--- a/src/network/networkd-nexthop.h
++++ b/src/network/networkd-nexthop.h
+@@ -44,7 +44,7 @@ int nexthop_compare_func(const NextHop *a, const NextHop *b);
+ 
+ void network_drop_invalid_nexthops(Network *network);
+ 
+-int link_drop_nexthops(Link *link);
++int link_drop_managed_nexthops(Link *link);
+ int link_drop_foreign_nexthops(Link *link);
+ void link_foreignize_nexthops(Link *link);
+ 
+diff --git a/src/network/networkd-route.c b/src/network/networkd-route.c
+index ee7a535075..7e6fe8bc11 100644
+--- a/src/network/networkd-route.c
++++ b/src/network/networkd-route.c
+@@ -788,8 +788,8 @@ static void manager_mark_routes(Manager *manager, bool foreign, const Link *exce
+                 if (route->protocol == RTPROT_KERNEL)
+                         continue;
+ 
+-                /* When 'foreign' is true, do not remove routes we configured. */
+-                if (foreign && route->source != NETWORK_CONFIG_SOURCE_FOREIGN)
++                /* When 'foreign' is true, mark only foreign routes, and vice versa. */
++                if (foreign != (route->source == NETWORK_CONFIG_SOURCE_FOREIGN))
+                         continue;
+ 
+                 /* Do not touch dynamic routes. They will removed by dhcp_pd_prefix_lost() */
+@@ -834,7 +834,7 @@ static void manager_mark_routes(Manager *manager, bool foreign, const Link *exce
+         }
+ }
+ 
+-static int manager_drop_routes(Manager *manager) {
++static int manager_drop_marked_routes(Manager *manager) {
+         Route *route;
+         int k, r = 0;
+ 
+@@ -955,14 +955,14 @@ int link_drop_foreign_routes(Link *link) {
+ 
+         manager_mark_routes(link->manager, /* foreign = */ true, NULL);
+ 
+-        k = manager_drop_routes(link->manager);
++        k = manager_drop_marked_routes(link->manager);
+         if (k < 0 && r >= 0)
+                 r = k;
+ 
+         return r;
+ }
+ 
+-int link_drop_routes(Link *link) {
++int link_drop_managed_routes(Link *link) {
+         Route *route;
+         int k, r = 0;
+ 
+@@ -973,6 +973,10 @@ int link_drop_routes(Link *link) {
+                 if (route_by_kernel(route))
+                         continue;
+ 
++                /* Do not touch routes managed by kernel or other tools. */
++                if (route->source == NETWORK_CONFIG_SOURCE_FOREIGN)
++                        continue;
++
+                 if (!route_exists(route))
+                         continue;
+ 
+@@ -983,7 +987,7 @@ int link_drop_routes(Link *link) {
+ 
+         manager_mark_routes(link->manager, /* foreign = */ false, link);
+ 
+-        k = manager_drop_routes(link->manager);
++        k = manager_drop_marked_routes(link->manager);
+         if (k < 0 && r >= 0)
+                 r = k;
+ 
+diff --git a/src/network/networkd-route.h b/src/network/networkd-route.h
+index e3e22a5985..2180a196fc 100644
+--- a/src/network/networkd-route.h
++++ b/src/network/networkd-route.h
+@@ -82,7 +82,7 @@ int route_remove(Route *route);
+ 
+ int route_get(Manager *manager, Link *link, const Route *in, Route **ret);
+ 
+-int link_drop_routes(Link *link);
++int link_drop_managed_routes(Link *link);
+ int link_drop_foreign_routes(Link *link);
+ void link_foreignize_routes(Link *link);
+ 
+diff --git a/src/network/networkd-routing-policy-rule.c b/src/network/networkd-routing-policy-rule.c
+index 90086f35a7..d4363060d8 100644
+--- a/src/network/networkd-routing-policy-rule.c
++++ b/src/network/networkd-routing-policy-rule.c
+@@ -653,8 +653,8 @@ static void manager_mark_routing_policy_rules(Manager *m, bool foreign, const Li
+                 if (rule->protocol == RTPROT_KERNEL)
+                         continue;
+ 
+-                /* When 'foreign' is true, do not remove rules we configured. */
+-                if (foreign && rule->source != NETWORK_CONFIG_SOURCE_FOREIGN)
++                /* When 'foreign' is true, mark only foreign rules, and vice versa. */
++                if (foreign != (rule->source == NETWORK_CONFIG_SOURCE_FOREIGN))
+                         continue;
+ 
+                 /* Ignore rules not assigned yet or already removing. */
+diff --git a/src/network/networkd-routing-policy-rule.h b/src/network/networkd-routing-policy-rule.h
+index f52943bd2e..7cc6f55c8d 100644
+--- a/src/network/networkd-routing-policy-rule.h
++++ b/src/network/networkd-routing-policy-rule.h
+@@ -71,7 +71,7 @@ int manager_drop_routing_policy_rules_internal(Manager *m, bool foreign, const L
+ static inline int manager_drop_foreign_routing_policy_rules(Manager *m) {
+         return manager_drop_routing_policy_rules_internal(m, true, NULL);
+ }
+-static inline int link_drop_routing_policy_rules(Link *link) {
++static inline int link_drop_managed_routing_policy_rules(Link *link) {
+         assert(link);
+         return manager_drop_routing_policy_rules_internal(link->manager, false, link);
+ }
+diff --git a/test/test-network/systemd-networkd-tests.py b/test/test-network/systemd-networkd-tests.py
+index ac2c1ba034..ed4d4992b1 100755
+--- a/test/test-network/systemd-networkd-tests.py
++++ b/test/test-network/systemd-networkd-tests.py
+@@ -3876,7 +3876,7 @@ class NetworkdBridgeTests(unittest.TestCase, Utilities):
+         print(output)
+         self.assertRegex(output, 'NO-CARRIER')
+         self.assertNotRegex(output, '192.168.0.15/24')
+-        self.assertNotRegex(output, '192.168.0.16/24')
++        self.assertRegex(output, '192.168.0.16/24') # foreign address is kept
+ 
+         print('### ip -6 route list table all dev bridge99')
+         output = check_output('ip -6 route list table all dev bridge99')
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index 784a7af271..21a09d8594 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -30,6 +30,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-shared-json-allow-json_variant_dump-to-return-an-err.patch \
            file://CVE-2022-4415-1.patch \
            file://CVE-2022-4415-2.patch \
+           file://0001-network-remove-only-managed-configs-on-reconfigure-o.patch \
            "
 
 # patches needed by musl
-- 
2.34.1



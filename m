Return-Path: <cam@myfastmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36412C7EE25
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 16:33:20 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web11.14232.1686241992082204235
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 09:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@myfastmail.com header.s=fm1 header.b=TWbzWXme;
 spf=pass (domain: myfastmail.com, ip: 66.111.4.28, mailfrom: cam@myfastmail.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id B04F75C0066;
	Thu,  8 Jun 2023 12:33:10 -0400 (EDT)
Received: from imap42 ([10.202.2.92])
  by compute3.internal (MEProxy); Thu, 08 Jun 2023 12:33:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=myfastmail.com;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1686241990; x=1686328390; bh=eezBzQULWt
	F1TLPtmpTOZ2Fm5BFBDOCBjxkERm4vyCc=; b=TWbzWXmekARnlDq80KHLWmPyqL
	+fXUepUALSio8Z7TK5t9Yb3FXZj58STH988Tb2fT5E6UNPsISxOiDM+P1GdN3yoL
	wqdbnMNYJaIAcVuEsoq57vJpmFhm6GgngAR/VldpBnHmF8vAnCrnt4WBXf571Dnt
	CMUKBzYMGvQ00157/cIab/p0iQdx5QgsaaPfeFZht5mffpNZw0QqEXCLdAgacgs6
	x/kkPXxZmUpIfZZZ4OqzSPXGB4m+vAsUUb2vInQ02qTuMjlKTCQR/ChOwo2pFi2M
	jQ0M0douVXBvoIJLKQwGV58Oo0Jp4id321/IXFsu7QqJrmMajenhk9gunwqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1686241990; x=1686328390; bh=eezBzQULWtF1TLPtmpTOZ2Fm5BFBDOCBjxk
	ERm4vyCc=; b=xv5TFeYD3HiYdkh5RdJKp/mhmzPr3wVmTWugoJM12uHTyvZaoPB
	oPJuvFXvIcgBk0vtTwv1hkoUdGbncaEP//zdZOILzdCOUkTOi9q7ruHQJzDz4Lmz
	y8JKfbvKOx8CQxt27/o30q0EdLzXjd2SnE8NQnxJC/fOCMwUbcyTavG0kWD4ZCLP
	txSgFEJTNAub1ddknMcY2mnQlH75FTPP6B/2otGHa/WD8F4BKupYHFPoVYcjy2Mt
	Ap+9FdZDYLY9etYbe23LplNYhnnzkVvYRwbMyR/ti1fAB9n/vM2fLcO6gh3dNVdc
	oFVJpcqI0Cpi1uH3lDcXZ6jbkDmKDZH4ecA==
X-ME-Sender: <xms:xgKCZFffkF9fzf1Fp-pHu5gwTnjvLwrY5RnVxsnIa9xsYA8ckHaOuw>
    <xme:xgKCZDNegXctDq71QCn0JIDikfFk4uXhTwv-joRfYMA4t__FUhnfDwLfoqoa2ZFPG
    4-m0urrexVQJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedtiedguddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvfevufgtsehttd
    ertderredtnecuhfhrohhmpedfvedrucetnhguhicuofgrrhhtihhnfdcuoegtrghmsehm
    hihfrghsthhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepkeejhfegleehveejvd
    ehueeivdetffefheegieetudelhfetffelueekffehvdelnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomheptggrmhesmhihfhgrshhtmhgrihhlrd
    gtohhm
X-ME-Proxy: <xmx:xgKCZOhFGyWPuwNcmNwUbBDa6LDEo2jwZs5og1PWeNCDPvA3uJP7dQ>
    <xmx:xgKCZO-fLjQtZp8YpFfuS-C644ECQ8354woNhYMUly96jtiDm5STAQ>
    <xmx:xgKCZBuXIgqG5NcCdUZqm_p_Mzfl5ixn4vRlaJsxZwKf3f1p8ypRlA>
    <xmx:xgKCZG4EUns0eru1s3t0hk_nmvc_KX7cbKeiSbgzV26sO9NxHmR3Vw>
Feedback-ID: i38fa41ad:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6EBC8BC0078; Thu,  8 Jun 2023 12:33:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-447-ge2460e13b3-fm-20230525.001-ge2460e13
Mime-Version: 1.0
Message-Id: <c2877eab-f166-4932-ba20-70f70e65fd1a@app.fastmail.com>
Date: Thu, 08 Jun 2023 12:32:49 -0400
From: "C. Andy Martin" <cam@myfastmail.com>
To: openembedded-core@lists.openembedded.org
Cc: "C. Andy Martin" <cam@myfastmail.com>
Subject: [kirkstone][PATCH] systemd-networkd: backport fix for rm unmanaged wifi
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 16:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182516

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


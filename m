Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 941B772498
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 19:59:28 +0000 (UTC)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 412052E2037;
	Thu,  8 Jan 2015 20:59:28 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org, Chen Qi <Qi.Chen@windriver.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Ross Burton <ross.burton@intel.com>, "Peter A. Bigot" <pab@pabigot.com>
Date: Thu,  8 Jan 2015 20:59:04 +0100
Message-Id: <1420747144-11925-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1420706622-31273-2-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1420706622-31273-2-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH] systemd: cherry-pick patch fixing networkd gateway route handling
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Jan 2015 19:59:32 -0000

Cherry-picking a patch that fixes gateway route handling in systemd-networkd.
The patch adds a source IP to the automatically added gateway static route,
thus allowing for proper IP communication in a scenario when a static or
IPv4-LL address is used alongside a dynamically obtained one.

(From systemd rev: 46b0c76e2c355c0d0cc4792abb98cde07b28bc5)

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
---
 ...d-preferred-source-to-dhcp4-gateway-route.patch | 114 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_216.bb           |   1 +
 2 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-networkd-add-preferred-source-to-dhcp4-gateway-route.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-networkd-add-preferred-source-to-dhcp4-gateway-route.patch b/meta/recipes-core/systemd/systemd/0001-networkd-add-preferred-source-to-dhcp4-gateway-route.patch
new file mode 100644
index 0000000..9d1802f
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-networkd-add-preferred-source-to-dhcp4-gateway-route.patch
@@ -0,0 +1,114 @@
+From 46b0c76e2c355c0d0cc4792abb98cde07b28bc53 Mon Sep 17 00:00:00 2001
+From: Emil Renner Berthing <systemd@esmil.dk>
+Date: Fri, 5 Sep 2014 11:56:02 +0200
+Subject: [PATCH] networkd: add preferred source to dhcp4 gateway route
+
+This makes DHCPv4 and IPv4LL coexist peacefully.
+
+[tomegun: apply to both the dhcp routes, use in_addr_is_null() rather than a
+separate variable to indicate when prefsrc should be applied]
+
+[MB: there was no Author SOB]
+Upstream-Status: Backport [ v216-190-g46b0c76 ]
+Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
+Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
+---
+ src/network/networkd-dhcp4.c | 11 +++++++++++
+ src/network/networkd-route.c | 22 ++++++++++++++++++++++
+ src/network/networkd.h       |  1 +
+ 3 files changed, 34 insertions(+)
+
+diff --git a/src/network/networkd-dhcp4.c b/src/network/networkd-dhcp4.c
+index 5e4ff2b80b796ea33de24b9c80076f408f6db63d..b87fa730826daba3650477c430495523ab09054d 100644
+--- a/src/network/networkd-dhcp4.c
++++ b/src/network/networkd-dhcp4.c
+@@ -67,9 +67,18 @@ static int link_set_dhcp_routes(Link *link) {
+                 return r;
+         }
+         if (r >= 0) {
++                struct in_addr address;
+                 _cleanup_route_free_ Route *route = NULL;
+                 _cleanup_route_free_ Route *route_gw = NULL;
+ 
++                r = sd_dhcp_lease_get_address(link->dhcp_lease, &address);
++                if (r < 0) {
++                        log_warning_link(link,
++                                         "DHCP error: could not get address: %s",
++                                         strerror(-r));
++                        return r;
++                }
++
+                 r = route_new_dynamic(&route, RTPROT_DHCP);
+                 if (r < 0) {
+                         log_error_link(link,
+@@ -92,6 +101,7 @@ static int link_set_dhcp_routes(Link *link) {
+                 route_gw->family = AF_INET;
+                 route_gw->dst_addr.in = gateway;
+                 route_gw->dst_prefixlen = 32;
++                route_gw->prefsrc_addr.in = address;
+                 route_gw->scope = RT_SCOPE_LINK;
+                 route_gw->metrics = DHCP_ROUTE_METRIC;
+ 
+@@ -107,6 +117,7 @@ static int link_set_dhcp_routes(Link *link) {
+ 
+                 route->family = AF_INET;
+                 route->in_addr.in = gateway;
++                route->prefsrc_addr.in = address;
+                 route->metrics = DHCP_ROUTE_METRIC;
+ 
+                 r = route_configure(route, link, &dhcp4_route_handler);
+diff --git a/src/network/networkd-route.c b/src/network/networkd-route.c
+index aead4fbb9e8d47df66c2c892132d9c78e5650a68..10d8cd902a8c16147eb52bb4aa0d01781054ed1b 100644
+--- a/src/network/networkd-route.c
++++ b/src/network/networkd-route.c
+@@ -144,6 +144,17 @@ int route_drop(Route *route, Link *link,
+                 }
+         }
+ 
++        if (!in_addr_is_null(route->family, &route->prefsrc_addr)) {
++                if (route->family == AF_INET)
++                        r = sd_rtnl_message_append_in_addr(req, RTA_PREFSRC, &route->prefsrc_addr.in);
++                else if (route->family == AF_INET6)
++                        r = sd_rtnl_message_append_in6_addr(req, RTA_PREFSRC, &route->prefsrc_addr.in6);
++                if (r < 0) {
++                        log_error("Could not append RTA_PREFSRC attribute: %s", strerror(-r));
++                        return r;
++                }
++        }
++
+         r = sd_rtnl_message_route_set_scope(req, route->scope);
+         if (r < 0) {
+                 log_error("Could not set scope: %s", strerror(-r));
+@@ -218,6 +229,17 @@ int route_configure(Route *route, Link *link,
+                 }
+         }
+ 
++        if (!in_addr_is_null(route->family, &route->prefsrc_addr)) {
++                if (route->family == AF_INET)
++                        r = sd_rtnl_message_append_in_addr(req, RTA_PREFSRC, &route->prefsrc_addr.in);
++                else if (route->family == AF_INET6)
++                        r = sd_rtnl_message_append_in6_addr(req, RTA_PREFSRC, &route->prefsrc_addr.in6);
++                if (r < 0) {
++                        log_error("Could not append RTA_PREFSRC attribute: %s", strerror(-r));
++                        return r;
++                }
++        }
++
+         r = sd_rtnl_message_route_set_scope(req, route->scope);
+         if (r < 0) {
+                 log_error("Could not set scope: %s", strerror(-r));
+diff --git a/src/network/networkd.h b/src/network/networkd.h
+index ab5df1aa3c57952dc9549f2da85332dd966771f4..c6e6b22c383e04413fffed24031410c2695dc190 100644
+--- a/src/network/networkd.h
++++ b/src/network/networkd.h
+@@ -150,6 +150,7 @@ struct Route {
+ 
+         union in_addr_union in_addr;
+         union in_addr_union dst_addr;
++        union in_addr_union prefsrc_addr;
+ 
+         LIST_FIELDS(Route, routes);
+ };
+-- 
+1.9.3
+
diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index 536b7be..d82fd7c 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -34,6 +34,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://0001-missing.h-add-fake-__NR_memfd_create-for-MIPS.patch \
            file://0001-Make-root-s-home-directory-configurable.patch \
            file://0001-systemd-user-avoid-using-system-auth.patch \
+           file://0001-networkd-add-preferred-source-to-dhcp4-gateway-route.patch \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://init \
-- 
1.9.3



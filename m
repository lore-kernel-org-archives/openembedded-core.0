Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id DE8C1787ED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 14:42:23 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r78so4034802wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 06:42:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tl0l3cSmSwTcumE+mAYUCirNfVC2YBXXGy3BIJBGRn0=;
	b=kGf99xdq3N3u2xlf1o5RcUBDuVs75AUc6tBm+1A09RBcjwt3xvG79TkJAW72N97b1p
	XHpJodWWK5Kibddd1SCXzaBCAhzVkH8d7g1fP7Wcv+aEtIffPOQ6KQTzMWc5bH8GkiuR
	vXETTRevBUFVwR9C4SysDjkG7Z1M604oaGD2OLulE6cWcuqVwA/XQTkHrWAcw8KFHQRR
	CCBqlrZXrjij5RycqGInag4lU+YXicclh8Sh8gyhMhS3Wj9dLYjq9JAiDMkYjV62Ko6R
	bMZEQu8fUkTgGOXSfdczfXR0g6b1yZY12v4CFup0gtyYCSYJc8NV2DeHyK6snDbkhsss
	nSIw==
X-Gm-Message-State: AKwxytfvgT65zSR+g1zK3f6Nibq7Dzfo+nenAg/tCvasSWJifMDqNWQT
	kepjKKHAOyGnpuLiFvBY7qVnjSzie4M=
X-Google-Smtp-Source: ACJfBovqwIN55yxgFvxSVadbvI9ZlkJIBmOaZPZidrEJHAOQfmOFKpY2DvH8RQZk2QQjXwowhFkqtA==
X-Received: by 10.80.191.6 with SMTP id f6mr3604388edk.281.1516372944253;
	Fri, 19 Jan 2018 06:42:24 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id x25sm6749148eda.8.2018.01.19.06.42.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Jan 2018 06:42:23 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jan 2018 14:42:13 +0000
Message-Id: <20180119144213.7364-4-git@andred.net>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180119144213.7364-1-git@andred.net>
References: <20180119144213.7364-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 3/3] connman: Implement subnet route in session
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
X-List-Received-Date: Fri, 19 Jan 2018 14:42:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jian Liang <jianliang@tycoint.com>

Implement subnet route creation/deletion in session, e.g.

default via 192.168.100.1 dev eth0
192.168.100.0/24 dev eth0

Signed-off-by: Jian Liang <jianliang@tycoint.com>
Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 ...Add-prefixlen-to-iproute_default_function.patch | 63 ++++++++++++++++++
 ...ent-subnet-route-creation-deletion-in-ipr.patch | 69 +++++++++++++++++++
 ...ent-APIs-for-creating-and-deleting-subnet.patch | 68 +++++++++++++++++++
 ...e-subnet-route-creation-and-deletion-APIs.patch | 77 ++++++++++++++++++++++
 meta/recipes-connectivity/connman/connman_1.35.bb  |  4 ++
 5 files changed, 281 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-inet-Add-prefixlen-to-iproute_default_function.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0002-inet-Implement-subnet-route-creation-deletion-in-ipr.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0003-inet-Implement-APIs-for-creating-and-deleting-subnet.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0004-session-Use-subnet-route-creation-and-deletion-APIs.patch

diff --git a/meta/recipes-connectivity/connman/connman/0001-inet-Add-prefixlen-to-iproute_default_function.patch b/meta/recipes-connectivity/connman/connman/0001-inet-Add-prefixlen-to-iproute_default_function.patch
new file mode 100644
index 0000000000..dd7b356741
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0001-inet-Add-prefixlen-to-iproute_default_function.patch
@@ -0,0 +1,63 @@
+From 508dc60a1f0758ebc586b6b086478a176d493086 Mon Sep 17 00:00:00 2001
+From: Jian Liang <jianliang@tycoint.com>
+Date: Thu, 5 Oct 2017 09:34:41 +0100
+Subject: [PATCH 1/4] inet: Add prefixlen to iproute_default_function
+To: connman@lists.01.org
+Cc: wagi@monom.org
+
+Add prefixlen parameter to this function in preparation for using
+it also in creating subnet route later, e.g.
+
+default via 192.168.100.1 dev eth0
+192.168.100.0/24 dev eth0
+
+Signed-off-by: Jian Liang <jianliang@tycoint.com>
+
+---
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=edda5b695de2ee79f02314abc9b46fdd46b388e1]
+Signed-off-by: André Draszik <andre.draszik@jci.com>
+ src/inet.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/src/inet.c b/src/inet.c
+index b887aa0..ab8aec8 100644
+--- a/src/inet.c
++++ b/src/inet.c
+@@ -2796,7 +2796,7 @@ int __connman_inet_del_fwmark_rule(uint32_t table_id, int family, uint32_t fwmar
+ }
+ 
+ static int iproute_default_modify(int cmd, uint32_t table_id, int ifindex,
+-			const char *gateway)
++			const char *gateway, unsigned char prefixlen)
+ {
+ 	struct __connman_inet_rtnl_handle rth;
+ 	unsigned char buf[sizeof(struct in6_addr)];
+@@ -2829,6 +2829,7 @@ static int iproute_default_modify(int cmd, uint32_t table_id, int ifindex,
+ 	rth.req.u.r.rt.rtm_protocol = RTPROT_BOOT;
+ 	rth.req.u.r.rt.rtm_scope = RT_SCOPE_UNIVERSE;
+ 	rth.req.u.r.rt.rtm_type = RTN_UNICAST;
++	rth.req.u.r.rt.rtm_dst_len = prefixlen;
+ 
+ 	__connman_inet_rtnl_addattr_l(&rth.req.n, sizeof(rth.req), RTA_GATEWAY,
+ 								buf, len);
+@@ -2860,7 +2861,7 @@ int __connman_inet_add_default_to_table(uint32_t table_id, int ifindex,
+ {
+ 	/* ip route add default via 1.2.3.4 dev wlan0 table 1234 */
+ 
+-	return iproute_default_modify(RTM_NEWROUTE, table_id, ifindex, gateway);
++	return iproute_default_modify(RTM_NEWROUTE, table_id, ifindex, gateway, 0);
+ }
+ 
+ int __connman_inet_del_default_from_table(uint32_t table_id, int ifindex,
+@@ -2868,7 +2869,7 @@ int __connman_inet_del_default_from_table(uint32_t table_id, int ifindex,
+ {
+ 	/* ip route del default via 1.2.3.4 dev wlan0 table 1234 */
+ 
+-	return iproute_default_modify(RTM_DELROUTE, table_id, ifindex, gateway);
++	return iproute_default_modify(RTM_DELROUTE, table_id, ifindex, gateway, 0);
+ }
+ 
+ int __connman_inet_get_interface_ll_address(int index, int family,
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/connman/connman/0002-inet-Implement-subnet-route-creation-deletion-in-ipr.patch b/meta/recipes-connectivity/connman/connman/0002-inet-Implement-subnet-route-creation-deletion-in-ipr.patch
new file mode 100644
index 0000000000..9c953e5d51
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0002-inet-Implement-subnet-route-creation-deletion-in-ipr.patch
@@ -0,0 +1,69 @@
+From 08cda4004491d3971a8b9df937426c43800d15b1 Mon Sep 17 00:00:00 2001
+From: Jian Liang <jianliang@tycoint.com>
+Date: Thu, 5 Oct 2017 09:37:06 +0100
+Subject: [PATCH 2/4] inet: Implement subnet route creation/deletion in
+ iproute_default_modify
+To: connman@lists.01.org
+Cc: wagi@monom.org
+
+- Calculate subnet address base on gateway address and prefixlen
+- Differentiate creation of routes to gateway and subnet
+
+Signed-off-by: Jian Liang <jianliang@tycoint.com>
+
+---
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=ff7dcf91f12a2a237feebc6e606d0a8e92975528]
+Signed-off-by: André Draszik <andre.draszik@jci.com>
+ src/inet.c | 22 +++++++++++++++++++---
+ 1 file changed, 19 insertions(+), 3 deletions(-)
+
+diff --git a/src/inet.c b/src/inet.c
+index ab8aec8..0ddb030 100644
+--- a/src/inet.c
++++ b/src/inet.c
+@@ -2802,6 +2802,9 @@ static int iproute_default_modify(int cmd, uint32_t table_id, int ifindex,
+ 	unsigned char buf[sizeof(struct in6_addr)];
+ 	int ret, len;
+ 	int family = connman_inet_check_ipaddress(gateway);
++	char *dst = NULL;
++
++	DBG("gateway %s/%u table %u", gateway, prefixlen, table_id);
+ 
+ 	switch (family) {
+ 	case AF_INET:
+@@ -2814,7 +2817,19 @@ static int iproute_default_modify(int cmd, uint32_t table_id, int ifindex,
+ 		return -EINVAL;
+ 	}
+ 
+-	ret = inet_pton(family, gateway, buf);
++	if (prefixlen) {
++		struct in_addr ipv4_subnet_addr, ipv4_mask;
++
++		memset(&ipv4_subnet_addr, 0, sizeof(ipv4_subnet_addr));
++		ipv4_mask.s_addr = htonl((0xffffffff << (32 - prefixlen)) & 0xffffffff);
++		ipv4_subnet_addr.s_addr = inet_addr(gateway);
++		ipv4_subnet_addr.s_addr &= ipv4_mask.s_addr;
++
++		dst = g_strdup(inet_ntoa(ipv4_subnet_addr));
++	}
++
++	ret = inet_pton(family, dst ? dst : gateway, buf);
++	g_free(dst);
+ 	if (ret <= 0)
+ 		return -EINVAL;
+ 
+@@ -2831,8 +2846,9 @@ static int iproute_default_modify(int cmd, uint32_t table_id, int ifindex,
+ 	rth.req.u.r.rt.rtm_type = RTN_UNICAST;
+ 	rth.req.u.r.rt.rtm_dst_len = prefixlen;
+ 
+-	__connman_inet_rtnl_addattr_l(&rth.req.n, sizeof(rth.req), RTA_GATEWAY,
+-								buf, len);
++	__connman_inet_rtnl_addattr_l(&rth.req.n, sizeof(rth.req),
++		prefixlen > 0 ? RTA_DST : RTA_GATEWAY, buf, len);
++
+ 	if (table_id < 256) {
+ 		rth.req.u.r.rt.rtm_table = table_id;
+ 	} else {
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/connman/connman/0003-inet-Implement-APIs-for-creating-and-deleting-subnet.patch b/meta/recipes-connectivity/connman/connman/0003-inet-Implement-APIs-for-creating-and-deleting-subnet.patch
new file mode 100644
index 0000000000..56ba5c3f4b
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0003-inet-Implement-APIs-for-creating-and-deleting-subnet.patch
@@ -0,0 +1,68 @@
+From a9243f13d6e1aadd69bfcc27f75f69c38be51677 Mon Sep 17 00:00:00 2001
+From: Jian Liang <jianliang@tycoint.com>
+Date: Wed, 4 Oct 2017 17:30:17 +0100
+Subject: [PATCH 3/4] inet: Implement APIs for creating and deleting subnet
+ route
+To: connman@lists.01.org
+Cc: wagi@monom.org
+
+Signed-off-by: Jian Liang <jianliang@tycoint.com>
+
+---
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=3a15b0b7fccd053aff91da2cc68585509d0c509b]
+Signed-off-by: André Draszik <andre.draszik@jci.com>
+ src/connman.h |  4 ++++
+ src/inet.c    | 14 ++++++++++++++
+ 2 files changed, 18 insertions(+)
+
+diff --git a/src/connman.h b/src/connman.h
+index 21b7080..da4446a 100644
+--- a/src/connman.h
++++ b/src/connman.h
+@@ -240,7 +240,11 @@ int __connman_inet_rtnl_addattr32(struct nlmsghdr *n, size_t maxlen,
+ int __connman_inet_add_fwmark_rule(uint32_t table_id, int family, uint32_t fwmark);
+ int __connman_inet_del_fwmark_rule(uint32_t table_id, int family, uint32_t fwmark);
+ int __connman_inet_add_default_to_table(uint32_t table_id, int ifindex, const char *gateway);
++int __connman_inet_add_subnet_to_table(uint32_t table_id, int ifindex,
++			const char *gateway, unsigned char prefixlen);
+ int __connman_inet_del_default_from_table(uint32_t table_id, int ifindex, const char *gateway);
++int __connman_inet_del_subnet_from_table(uint32_t table_id, int ifindex,
++			const char *gateway, unsigned char prefixlen);
+ int __connman_inet_get_address_netmask(int ifindex,
+ 		struct sockaddr_in *address, struct sockaddr_in *netmask);
+ 
+diff --git a/src/inet.c b/src/inet.c
+index 0ddb030..dcd1ab2 100644
+--- a/src/inet.c
++++ b/src/inet.c
+@@ -2880,6 +2880,13 @@ int __connman_inet_add_default_to_table(uint32_t table_id, int ifindex,
+ 	return iproute_default_modify(RTM_NEWROUTE, table_id, ifindex, gateway, 0);
+ }
+ 
++int __connman_inet_add_subnet_to_table(uint32_t table_id, int ifindex,
++						const char *gateway, unsigned char prefixlen)
++{
++	/* ip route add 1.2.3.4/24 dev eth0 table 1234 */
++	return iproute_default_modify(RTM_NEWROUTE, table_id, ifindex, gateway, prefixlen);
++}
++
+ int __connman_inet_del_default_from_table(uint32_t table_id, int ifindex,
+ 						const char *gateway)
+ {
+@@ -2888,6 +2895,13 @@ int __connman_inet_del_default_from_table(uint32_t table_id, int ifindex,
+ 	return iproute_default_modify(RTM_DELROUTE, table_id, ifindex, gateway, 0);
+ }
+ 
++int __connman_inet_del_subnet_from_table(uint32_t table_id, int ifindex,
++						const char *gateway, unsigned char prefixlen)
++{
++	/* ip route del 1.2.3.4/24 dev eth0 table 1234 */
++	return iproute_default_modify(RTM_DELROUTE, table_id, ifindex, gateway, prefixlen);
++}
++
+ int __connman_inet_get_interface_ll_address(int index, int family,
+ 								void *address)
+ {
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/connman/connman/0004-session-Use-subnet-route-creation-and-deletion-APIs.patch b/meta/recipes-connectivity/connman/connman/0004-session-Use-subnet-route-creation-and-deletion-APIs.patch
new file mode 100644
index 0000000000..ca213eb18b
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0004-session-Use-subnet-route-creation-and-deletion-APIs.patch
@@ -0,0 +1,77 @@
+From deb9372db8396da4f7cd20555ce7c9a8b3ad96bd Mon Sep 17 00:00:00 2001
+From: Jian Liang <jianliang@tycoint.com>
+Date: Fri, 6 Oct 2017 11:40:16 +0100
+Subject: [PATCH 4/4] session: Use subnet route creation and deletion APIs
+To: connman@lists.01.org
+Cc: wagi@monom.org
+
+As subnet route is address and session specific in this case, so add
+prefixlen into struct connman_session, and update it along with ipconfig.
+Then use it in subnet route related APIs.
+
+Signed-off-by: Jian Liang <jianliang@tycoint.com>
+
+---
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=285f25ef6cc9e4a43dab83523f3e2eab4365ac26]
+Signed-off-by: André Draszik <andre.draszik@jci.com>
+ src/session.c | 20 ++++++++++++++++----
+ 1 file changed, 16 insertions(+), 4 deletions(-)
+
+diff --git a/src/session.c b/src/session.c
+index 965ac06..7b7a14b 100644
+--- a/src/session.c
++++ b/src/session.c
+@@ -67,6 +67,7 @@ struct connman_session {
+ 	int index;
+ 	char *addr;
+ 	char *gateway;
++	unsigned char prefixlen;
+ 	bool policy_routing;
+ 	bool snat_enabled;
+ };
+@@ -357,13 +358,17 @@ static void del_default_route(struct connman_session *session)
+ 	if (!session->gateway)
+ 		return;
+ 
+-	DBG("index %d routing table %d default gateway %s",
+-		session->index, session->mark, session->gateway);
++	DBG("index %d routing table %d default gateway %s/%u",
++		session->index, session->mark, session->gateway, session->prefixlen);
++
++		__connman_inet_del_subnet_from_table(session->mark,
++			session->index, session->gateway, session->prefixlen);
+ 
+ 	__connman_inet_del_default_from_table(session->mark,
+ 					session->index, session->gateway);
+ 	g_free(session->gateway);
+ 	session->gateway = NULL;
++	session->prefixlen = 0;
+ 	session->index = -1;
+ }
+ 
+@@ -383,13 +388,20 @@ static void add_default_route(struct connman_session *session)
+ 	if (!session->gateway)
+ 		session->gateway = g_strdup(inet_ntoa(addr));
+ 
+-	DBG("index %d routing table %d default gateway %s",
+-		session->index, session->mark, session->gateway);
++	session->prefixlen = __connman_ipconfig_get_prefixlen(ipconfig);
++
++	DBG("index %d routing table %d default gateway %s/%u",
++		session->index, session->mark, session->gateway, session->prefixlen);
+ 
+ 	err = __connman_inet_add_default_to_table(session->mark,
+ 					session->index, session->gateway);
+ 	if (err < 0)
+ 		DBG("session %p %s", session, strerror(-err));
++
++	err = __connman_inet_add_subnet_to_table(session->mark,
++					session->index, session->gateway, session->prefixlen);
++	if (err < 0)
++		DBG("session add subnet route %p %s", session, strerror(-err));
+ }
+ 
+ static void del_nat_rules(struct connman_session *session)
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/connman/connman_1.35.bb b/meta/recipes-connectivity/connman/connman_1.35.bb
index 4663a7e3e8..ff2118113f 100644
--- a/meta/recipes-connectivity/connman/connman_1.35.bb
+++ b/meta/recipes-connectivity/connman/connman_1.35.bb
@@ -8,6 +8,10 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://includes.patch \
             file://0001-session-Keep-track-of-addr-in-fw_snat-session.patch \
             file://0001-giognutls-Fix-a-crash-using-wispr-over-TLS.patch \
+            file://0001-inet-Add-prefixlen-to-iproute_default_function.patch \
+            file://0002-inet-Implement-subnet-route-creation-deletion-in-ipr.patch \
+            file://0003-inet-Implement-APIs-for-creating-and-deleting-subnet.patch \
+            file://0004-session-Use-subnet-route-creation-and-deletion-APIs.patch \
             "
 SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch \
                              "
-- 
2.15.1



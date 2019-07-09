Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1F4937E5E4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 08:43:40 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id e2so10219356edi.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2019 01:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lHtwpcX8HApSSFX7QH+YP76jo9oBKoFM6OhifD1HKoc=;
	b=E3n6yhRgvBktKOMAU8YpvCAV+LHWBI/QfJsqiTMXwkmvxhj4ts1sx3aa0gOjFBGs9V
	p9R8nFUaxqKV5ehSQtdcsxbrkwc8v9FoUZYRI3/LYALrAva/KWi0OXpyfRznJCoclyDk
	/2lBbcsa/BipC6lmN3w3Plgz7UTdNoPzSW3KAKcn6P9SnjIE43XG+7uwSdtKVddiS3Ll
	iPj0vVD8pwqBXo7TGYaIEj3Hm0TvT17VYj+6jOaDcktmF0CUJ6bfAt/MjT7Ux2vLIKTl
	MDibDzeaPC/5oN0HQ6F1EI7OZYeAp4/Sed+8ccPzH7FSokCwrrXi91i59yiFFooVz3t4
	2Ucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=lHtwpcX8HApSSFX7QH+YP76jo9oBKoFM6OhifD1HKoc=;
	b=TcCV/CVgDI0eO9UL3YfjLnD8PYLqcRdSzR/DTrGA8SplmBDLZiBOB2/MqE0HtNE3lu
	Vd45U5MmrqPUtNEBey/j7fmcLMx/Cg41wKI48xQ2mhl3OF4YoaX7dd3pz61CyUarvpVL
	pRXHTjByBgdmF5tf/thdEcFfqM/kJT9bBn5FYODwk1f7L2/f9hS25IGMt2oFk1M/x/0Y
	90RGAc8clm/VDV1T9DIQhXwMgc+cXEyMLU2zhdXYbHTE/66ICBOQpOo1wnBRSNmFQV3C
	NPdJDU0nlkOjrsJPVU3QG8+zal9ZW+cf+jFYM6qe05bXVLLM0EVwkbaR5HBYlcxb+org
	3qpQ==
X-Gm-Message-State: APjAAAXw+Old+cjCY0c3gp65Pz34MbnQBC9CBqqs+hVxlWQM+9Gvq/HN
	gME04CfTWkIEjHBCdz9Ai5NHBGo+l8E=
X-Google-Smtp-Source: APXvYqw4Xw/xXdvbpcNhJeBC4hirlmIdYoRgh5s+pa4HTq2ssuNOxhs+B6PvRMTzYgCKGOkjGVnimw==
X-Received: by 2002:aa7:cf90:: with SMTP id z16mr23774882edx.228.1562661821374;
	Tue, 09 Jul 2019 01:43:41 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	r10sm3358430edp.25.2019.07.09.01.43.40
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 09 Jul 2019 01:43:40 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jul 2019 10:43:34 +0200
Message-Id: <20190709084334.28399-1-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH] systemd: Fix interface bring-up on kernels >= 5.2
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
X-List-Received-Date: Tue, 09 Jul 2019 08:43:41 -0000
Content-Transfer-Encoding: 8bit

With kernels >=5.2  systemd-networkd is unable to bring up the link.

eth0: Could not bring up interface: Invalid argument

This is already reported upstream and fixed on master:

https://github.com/systemd/systemd/issues/12784

They recommend Debian to backport two patches.

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 .../systemd/0001-networkd-fix-link-up.patch   | 66 +++++++++++++
 .../0002-network-do-not-send-ipv6.patch       | 96 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_242.bb      |  2 +
 3 files changed, 164 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-networkd-fix-link-up.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-network-do-not-send-ipv6.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-networkd-fix-link-up.patch b/meta/recipes-core/systemd/systemd/0001-networkd-fix-link-up.patch
new file mode 100644
index 0000000000..7a3b3f172d
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-networkd-fix-link-up.patch
@@ -0,0 +1,66 @@
+From 6bd76d2d4ff130decd3aa13e0c2dbfd56ff8d7b7 Mon Sep 17 00:00:00 2001
+From: Susant Sahani <ssahani@gmail.com>
+Date: Thu, 9 May 2019 07:35:35 +0530
+Subject: [PATCH] networkd: fix link_up() (#12505)
+
+Fillup IFLA_INET6_ADDR_GEN_MODE while we do link_up.
+
+Fixes the following error:
+```
+dummy-test: Could not bring up interface: Invalid argument
+```
+
+After reading the kernel code when we do a link up
+```
+net/core/rtnetlink.c
+IFLA_AF_SPEC
+ af_ops->set_link_af(dev, af);
+  inet6_set_link_af
+   if (tb[IFLA_INET6_ADDR_GEN_MODE])
+             Here it looks for IFLA_INET6_ADDR_GEN_MODE
+```
+Since link up we didn't filling up that it's failing.
+
+Closes #12504.
+
+Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
+
+Upstream-Status: backport https://github.com/systemd/systemd/commit/4eb086a38712ea98faf41e075b84555b11b54362.patch
+
+---
+ src/network/networkd-link.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
+index e466b96792..042496173c 100644
+--- a/src/network/networkd-link.c
++++ b/src/network/networkd-link.c
+@@ -2034,6 +2034,8 @@ static int link_up(Link *link) {
+         }
+ 
+         if (link_ipv6_enabled(link)) {
++                uint8_t ipv6ll_mode;
++
+                 r = sd_netlink_message_open_container(req, IFLA_AF_SPEC);
+                 if (r < 0)
+                         return log_link_error_errno(link, r, "Could not open IFLA_AF_SPEC container: %m");
+@@ -2049,6 +2051,19 @@ static int link_up(Link *link) {
+                                 return log_link_error_errno(link, r, "Could not append IFLA_INET6_TOKEN: %m");
+                 }
+ 
++                if (!link_ipv6ll_enabled(link))
++                        ipv6ll_mode = IN6_ADDR_GEN_MODE_NONE;
++                else if (sysctl_read_ip_property(AF_INET6, link->ifname, "stable_secret", NULL) < 0)
++                        /* The file may not exist. And event if it exists, when stable_secret is unset,
++                         * reading the file fails with EIO. */
++                        ipv6ll_mode = IN6_ADDR_GEN_MODE_EUI64;
++                else
++                        ipv6ll_mode = IN6_ADDR_GEN_MODE_STABLE_PRIVACY;
++
++                r = sd_netlink_message_append_u8(req, IFLA_INET6_ADDR_GEN_MODE, ipv6ll_mode);
++                if (r < 0)
++                        return log_link_error_errno(link, r, "Could not append IFLA_INET6_ADDR_GEN_MODE: %m");
++
+                 r = sd_netlink_message_close_container(req);
+                 if (r < 0)
+                         return log_link_error_errno(link, r, "Could not close AF_INET6 container: %m");
diff --git a/meta/recipes-core/systemd/systemd/0002-network-do-not-send-ipv6.patch b/meta/recipes-core/systemd/systemd/0002-network-do-not-send-ipv6.patch
new file mode 100644
index 0000000000..6e6ace4c5f
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0002-network-do-not-send-ipv6.patch
@@ -0,0 +1,96 @@
+From b5c4eb818101127a606849e822937b15b8497c75 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Thu, 9 May 2019 14:39:46 +0900
+Subject: [PATCH] network: do not send ipv6 token to kernel
+
+We disabled kernel RA support. Then, we should not send
+IFLA_INET6_TOKEN.
+Thus, we do not need to send IFLA_INET6_ADDR_GEN_MODE twice.
+
+Follow-up for 0e2fdb83bb5e22047e0c7cc058b415d0e93f02cf and
+4eb086a38712ea98faf41e075b84555b11b54362.
+
+Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
+
+Upstream-Status: backport https://github.com/systemd/systemd/commit/9f6e82e6eb3b6e73d66d00d1d6eee60691fb702f
+
+---
+ src/network/networkd-link.c | 51 +++++--------------------------------
+ 1 file changed, 6 insertions(+), 45 deletions(-)
+
+diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
+index 042496173c..c49dba33da 100644
+--- a/src/network/networkd-link.c
++++ b/src/network/networkd-link.c
+@@ -1940,6 +1940,9 @@ static int link_configure_addrgen_mode(Link *link) {
+         assert(link->manager);
+         assert(link->manager->rtnl);
+ 
++        if (!socket_ipv6_is_supported())
++                return 0;
++
+         log_link_debug(link, "Setting address genmode for link");
+ 
+         r = sd_rtnl_message_new_link(link->manager->rtnl, &req, RTM_SETLINK, link->ifindex);
+@@ -2033,46 +2036,6 @@ static int link_up(Link *link) {
+                         return log_link_error_errno(link, r, "Could not set MAC address: %m");
+         }
+ 
+-        if (link_ipv6_enabled(link)) {
+-                uint8_t ipv6ll_mode;
+-
+-                r = sd_netlink_message_open_container(req, IFLA_AF_SPEC);
+-                if (r < 0)
+-                        return log_link_error_errno(link, r, "Could not open IFLA_AF_SPEC container: %m");
+-
+-                /* if the kernel lacks ipv6 support setting IFF_UP fails if any ipv6 options are passed */
+-                r = sd_netlink_message_open_container(req, AF_INET6);
+-                if (r < 0)
+-                        return log_link_error_errno(link, r, "Could not open AF_INET6 container: %m");
+-
+-                if (!in_addr_is_null(AF_INET6, &link->network->ipv6_token)) {
+-                        r = sd_netlink_message_append_in6_addr(req, IFLA_INET6_TOKEN, &link->network->ipv6_token.in6);
+-                        if (r < 0)
+-                                return log_link_error_errno(link, r, "Could not append IFLA_INET6_TOKEN: %m");
+-                }
+-
+-                if (!link_ipv6ll_enabled(link))
+-                        ipv6ll_mode = IN6_ADDR_GEN_MODE_NONE;
+-                else if (sysctl_read_ip_property(AF_INET6, link->ifname, "stable_secret", NULL) < 0)
+-                        /* The file may not exist. And event if it exists, when stable_secret is unset,
+-                         * reading the file fails with EIO. */
+-                        ipv6ll_mode = IN6_ADDR_GEN_MODE_EUI64;
+-                else
+-                        ipv6ll_mode = IN6_ADDR_GEN_MODE_STABLE_PRIVACY;
+-
+-                r = sd_netlink_message_append_u8(req, IFLA_INET6_ADDR_GEN_MODE, ipv6ll_mode);
+-                if (r < 0)
+-                        return log_link_error_errno(link, r, "Could not append IFLA_INET6_ADDR_GEN_MODE: %m");
+-
+-                r = sd_netlink_message_close_container(req);
+-                if (r < 0)
+-                        return log_link_error_errno(link, r, "Could not close AF_INET6 container: %m");
+-
+-                r = sd_netlink_message_close_container(req);
+-                if (r < 0)
+-                        return log_link_error_errno(link, r, "Could not close IFLA_AF_SPEC container: %m");
+-        }
+-
+         r = netlink_call_async(link->manager->rtnl, NULL, req, link_up_handler,
+                                link_netlink_destroy_callback, link);
+         if (r < 0)
+@@ -3208,11 +3171,9 @@ static int link_configure(Link *link) {
+         if (r < 0)
+                 return r;
+ 
+-        if (socket_ipv6_is_supported()) {
+-                r = link_configure_addrgen_mode(link);
+-                if (r < 0)
+-                        return r;
+-        }
++        r = link_configure_addrgen_mode(link);
++        if (r < 0)
++                return r;
+ 
+         return link_configure_after_setting_mtu(link);
+ }
diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
index 29f64b995a..5085eb515b 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -25,6 +25,8 @@ SRC_URI += "file://touchscreen.rules \
            file://0006-network-remove-redunant-link-name-in-message.patch \
            file://99-default.preset \
            file://0001-resolved-Fix-incorrect-use-of-OpenSSL-BUF_MEM.patch \
+           file://0001-networkd-fix-link-up.patch \
+           file://0002-network-do-not-send-ipv6.patch \
            "
 
 # patches needed by musl
-- 
2.20.1



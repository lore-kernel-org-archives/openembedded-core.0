Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 61A097828A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 13:37:51 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id v104so6887815wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 06:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AaduFoTcVBaTCvN2hMxU4mFbYk9TR23E/d1TBqA8KAU=;
	b=s8Jb8JLz9TEYknixkBCXrs3NopJYeZuecQfqikQZCpSqStG5x8pI2hBO5GuXcnbR/s
	JNLTXUrCwC9BzO5KE5X4zY99Y5enxx0tBRNQcBeMDomTxgYG2cyycDz/w741jXJj5OiF
	sCvEcrGaCQjn8JhZj4d5X6DspwgyvN5uZNdUlvXuccpMPThcbS6x78tg2yXUAG2Tbwwh
	HeKdHlzUx0x0PoDAwBg2ERR7b4/+a1HZTqEop1qq1oYM2khqQB+uqz+ZQQfgCck/3XsN
	xZL7qc41DAfdg+epV3aGwxEI7ZscJy0M6BwN7xtonvWDR5gwjM5nGNwrMWBNe+i5a02j
	/U+Q==
X-Gm-Message-State: AODbwcCLeoBDlgm1+Q/ytj3Jo99oEBmH9nJJed5VY2KFcbRGbh8n06IF
	TdJ7Ae9wHeqa9ezQRBM=
X-Received: by 10.28.113.142 with SMTP id d14mr7931398wmi.10.1497015472360;
	Fri, 09 Jun 2017 06:37:52 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 3sm1297722wru.50.2017.06.09.06.37.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Jun 2017 06:37:51 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jun 2017 14:37:50 +0100
Message-Id: <20170609133750.5931-1-git@andred.net>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] busybox: add backported patch to support iproute 'scope'
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
X-List-Received-Date: Fri, 09 Jun 2017 13:37:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

This is needed for avahi-autoipd, which attempts to
create a link-scope route as part of its work.

Without iproute scope support in busybox, the route is
not created due to an error message, and hence we
aren't accessible by, and can't access ourselves,
IP addresses outside the link-local scope
(169.254.0.0/16) unless we also have a proper
non link-local IP address, which somehow defeats the
purpose of zeroconf.

Signed-off-by: André Draszik <adraszik@tycoint.com>
Reviewed-by: Stephane Ayotte <sayotte@tycoint.com>
---
 ...mproper-optimization-req.r.rtm_scope-may-.patch |  33 ++++++
 .../0001-iproute-support-scope-.-Closes-8561.patch | 122 +++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.24.1.bb        |   2 +
 3 files changed, 157 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-ip-fix-an-improper-optimization-req.r.rtm_scope-may-.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-iproute-support-scope-.-Closes-8561.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-ip-fix-an-improper-optimization-req.r.rtm_scope-may-.patch b/meta/recipes-core/busybox/busybox/0001-ip-fix-an-improper-optimization-req.r.rtm_scope-may-.patch
new file mode 100644
index 0000000000..812a507489
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-ip-fix-an-improper-optimization-req.r.rtm_scope-may-.patch
@@ -0,0 +1,33 @@
+From 34ecc3b7aefdd6c31e8691bd5485037bbabedbd4 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Sun, 14 Aug 2016 01:30:34 +0200
+Subject: [PATCH] ip: fix an improper optimization: req.r.rtm_scope may be
+ nonzero here
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+Upstream-Status: Backport
+Signed-off-by: André Draszik <adraszik@tycoint.com>
+
+ networking/libiproute/iproute.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/networking/libiproute/iproute.c b/networking/libiproute/iproute.c
+index e674e9a0d..48dc6e3d9 100644
+--- a/networking/libiproute/iproute.c
++++ b/networking/libiproute/iproute.c
+@@ -362,10 +362,9 @@ IF_FEATURE_IP_RULE(ARG_table,)
+ 		req.r.rtm_scope = RT_SCOPE_NOWHERE;
+ 
+ 	if (cmd != RTM_DELROUTE) {
++		req.r.rtm_scope = RT_SCOPE_UNIVERSE;
+ 		if (RTPROT_BOOT != 0)
+ 			req.r.rtm_protocol = RTPROT_BOOT;
+-		if (RT_SCOPE_UNIVERSE != 0)
+-			req.r.rtm_scope = RT_SCOPE_UNIVERSE;
+ 		if (RTN_UNICAST != 0)
+ 			req.r.rtm_type = RTN_UNICAST;
+ 	}
+-- 
+2.11.0
+
diff --git a/meta/recipes-core/busybox/busybox/0001-iproute-support-scope-.-Closes-8561.patch b/meta/recipes-core/busybox/busybox/0001-iproute-support-scope-.-Closes-8561.patch
new file mode 100644
index 0000000000..66bc76e65e
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-iproute-support-scope-.-Closes-8561.patch
@@ -0,0 +1,122 @@
+From ce4bc1ed048233e89ee4cb95830bf6f01d523d1e Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Wed, 30 Dec 2015 17:32:51 +0100
+Subject: [PATCH] iproute: support "scope". Closes 8561
+
+function                                             old     new   delta
+iproute_modify                                      1051    1120     +69
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+Upstream-Status: Backport
+Modified patch to build against busybox 1.24.1:
+- s/invarg_1_to_2/invarg
+Signed-off-by: André Draszik <adraszik@tycoint.com>
+---
+ networking/libiproute/iproute.c | 52 ++++++++++++++++++++++++++---------------
+ 1 file changed, 33 insertions(+), 19 deletions(-)
+
+diff --git a/networking/libiproute/iproute.c b/networking/libiproute/iproute.c
+index d232ee6fd..82827488f 100644
+--- a/networking/libiproute/iproute.c
++++ b/networking/libiproute/iproute.c
+@@ -313,12 +313,13 @@ static int FAST_FUNC print_route(const struct sockaddr_nl *who UNUSED_PARAM,
+ static int iproute_modify(int cmd, unsigned flags, char **argv)
+ {
+ 	static const char keywords[] ALIGN1 =
+-		"src\0""via\0""mtu\0""lock\0""protocol\0"IF_FEATURE_IP_RULE("table\0")
++		"src\0""via\0""mtu\0""lock\0""scope\0""protocol\0"IF_FEATURE_IP_RULE("table\0")
+ 		"dev\0""oif\0""to\0""metric\0""onlink\0";
+ 	enum {
+ 		ARG_src,
+ 		ARG_via,
+ 		ARG_mtu, PARM_lock,
++		ARG_scope,
+ 		ARG_protocol,
+ IF_FEATURE_IP_RULE(ARG_table,)
+ 		ARG_dev,
+@@ -344,6 +345,7 @@ IF_FEATURE_IP_RULE(ARG_table,)
+ 	unsigned mxlock = 0;
+ 	char *d = NULL;
+ 	smalluint ok = 0;
++	smalluint scope_ok = 0;
+ 	int arg;
+ 
+ 	memset(&req, 0, sizeof(req));
+@@ -352,15 +354,18 @@ IF_FEATURE_IP_RULE(ARG_table,)
+ 	req.n.nlmsg_flags = NLM_F_REQUEST | flags;
+ 	req.n.nlmsg_type = cmd;
+ 	req.r.rtm_family = preferred_family;
+-	if (RT_TABLE_MAIN) /* if it is zero, memset already did it */
++	if (RT_TABLE_MAIN != 0) /* if it is zero, memset already did it */
+ 		req.r.rtm_table = RT_TABLE_MAIN;
+-	if (RT_SCOPE_NOWHERE)
++	if (RT_SCOPE_NOWHERE != 0)
+ 		req.r.rtm_scope = RT_SCOPE_NOWHERE;
+ 
+ 	if (cmd != RTM_DELROUTE) {
+-		req.r.rtm_protocol = RTPROT_BOOT;
+-		req.r.rtm_scope = RT_SCOPE_UNIVERSE;
+-		req.r.rtm_type = RTN_UNICAST;
++		if (RTPROT_BOOT != 0)
++			req.r.rtm_protocol = RTPROT_BOOT;
++		if (RT_SCOPE_UNIVERSE != 0)
++			req.r.rtm_scope = RT_SCOPE_UNIVERSE;
++		if (RTN_UNICAST != 0)
++			req.r.rtm_type = RTN_UNICAST;
+ 	}
+ 
+ 	mxrta->rta_type = RTA_METRICS;
+@@ -393,6 +398,13 @@ IF_FEATURE_IP_RULE(ARG_table,)
+ 			}
+ 			mtu = get_unsigned(*argv, "mtu");
+ 			rta_addattr32(mxrta, sizeof(mxbuf), RTAX_MTU, mtu);
++		} else if (arg == ARG_scope) {
++			uint32_t scope;
++			NEXT_ARG();
++			if (rtnl_rtscope_a2n(&scope, *argv))
++				invarg(*argv, "scope");
++			req.r.rtm_scope = scope;
++			scope_ok = 1;
+ 		} else if (arg == ARG_protocol) {
+ 			uint32_t prot;
+ 			NEXT_ARG();
+@@ -469,20 +481,22 @@ IF_FEATURE_IP_RULE(ARG_table,)
+ 		addattr_l(&req.n, sizeof(req), RTA_METRICS, RTA_DATA(mxrta), RTA_PAYLOAD(mxrta));
+ 	}
+ 
+-	if (req.r.rtm_type == RTN_LOCAL || req.r.rtm_type == RTN_NAT)
+-		req.r.rtm_scope = RT_SCOPE_HOST;
+-	else
+-	if (req.r.rtm_type == RTN_BROADCAST
+-	 || req.r.rtm_type == RTN_MULTICAST
+-	 || req.r.rtm_type == RTN_ANYCAST
+-	) {
+-		req.r.rtm_scope = RT_SCOPE_LINK;
+-	}
+-	else if (req.r.rtm_type == RTN_UNICAST || req.r.rtm_type == RTN_UNSPEC) {
+-		if (cmd == RTM_DELROUTE)
+-			req.r.rtm_scope = RT_SCOPE_NOWHERE;
+-		else if (!(ok & gw_ok))
++	if (!scope_ok) {
++		if (req.r.rtm_type == RTN_LOCAL || req.r.rtm_type == RTN_NAT)
++			req.r.rtm_scope = RT_SCOPE_HOST;
++		else
++		if (req.r.rtm_type == RTN_BROADCAST
++		 || req.r.rtm_type == RTN_MULTICAST
++		 || req.r.rtm_type == RTN_ANYCAST
++		) {
+ 			req.r.rtm_scope = RT_SCOPE_LINK;
++		}
++		else if (req.r.rtm_type == RTN_UNICAST || req.r.rtm_type == RTN_UNSPEC) {
++			if (cmd == RTM_DELROUTE)
++				req.r.rtm_scope = RT_SCOPE_NOWHERE;
++			else if (!(ok & gw_ok))
++				req.r.rtm_scope = RT_SCOPE_LINK;
++		}
+ 	}
+ 
+ 	if (req.r.rtm_family == AF_UNSPEC) {
+-- 
+2.11.0
+
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index 1baadeacd7..872ec7d31e 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -58,6 +58,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-libiproute-handle-table-ids-larger-than-255.patch \
            file://ifupdown-pass-interface-device-name-for-ipv6-route-c.patch \
            file://BUG9071_buffer_overflow_arp.patch \
+           file://0001-iproute-support-scope-.-Closes-8561.patch \
+           file://0001-ip-fix-an-improper-optimization-req.r.rtm_scope-may-.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.11.0



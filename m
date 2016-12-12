Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id C71BA71A90
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 15:40:17 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id m203so11995873wma.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 07:40:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=S3ANM5carZOpTHXvskjMJ0QUBLg3Dfbe7JmPkB/G2+U=;
	b=MPI+Uzj/xLFtqOomnCz9GZhKuGINQLuLMoClul9j+JjaRWEcK/8HbW3PAsbVlsshgZ
	H4H67ECVpOxMlG7OjEvfbgdqe9BwEKYa6Z+PG2R8nSjPyebyYnGS7f0M/vobHpPOTX+D
	MJ/0Y91deTmpi4tZSchUlUTT5EtdMD9cdXJ4fXHnDbANSO/9C3W9xeoUnKoqzONBhZVG
	jo/AaDWIY53RqWWIhu7kHUrHj8AAKnOKwpu+GcJVrbD6G9g1ynFFW2ewV9pY+Eo1wBQz
	2pD+HYAzZH+Wxw0vJDjFkxDQUVk2UyiNBMFRo5i9us2nfPfwGZgMNdjV+d3iCSlvNiRQ
	9gDA==
X-Gm-Message-State: AKaTC01zEdCBgVPsM7kP0KYW+Z2Egw2v6bJcXeqN1Eg0iZmwstpXn4+etvAq49CTIWf/Tg==
X-Received: by 10.28.137.81 with SMTP id l78mr9557132wmd.36.1481557218042;
	Mon, 12 Dec 2016 07:40:18 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	w197sm35949112wmd.11.2016.12.12.07.40.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Dec 2016 07:40:17 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Dec 2016 15:40:16 +0000
Message-Id: <20161212154016.1076-1-git@andred.net>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] busybox: allow libiproute to handle table ids larger than 255
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
X-List-Received-Date: Mon, 12 Dec 2016 15:40:18 -0000

From: Lukasz Nowak <lnowak@tycoint.com>

These changes are required for compatibility with ConnMan, which by default
uses table ids greater than 255.

Signed-off-by: Lukasz Nowak <lnowak@tycoint.com>
---
 ...biproute-handle-table-ids-larger-than-255.patch | 132 +++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.24.1.bb        |   1 +
 2 files changed, 133 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-libiproute-handle-table-ids-larger-than-255.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-libiproute-handle-table-ids-larger-than-255.patch b/meta/recipes-core/busybox/busybox/0001-libiproute-handle-table-ids-larger-than-255.patch
new file mode 100644
index 0000000..9ce720b
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-libiproute-handle-table-ids-larger-than-255.patch
@@ -0,0 +1,132 @@
+From 93952a29faae6ac90f3107f1833046a30fb9789c Mon Sep 17 00:00:00 2001
+From: Lukasz Nowak <lnowak@tycoint.com>
+Date: Wed, 23 Nov 2016 12:48:21 +0000
+Subject: [PATCH] libiproute: handle table ids larger than 255
+
+Linux kernel, starting from 2.6.19 allows ip table ids to have 32-bit values.
+In order to preserve compatibility, the old 8-bit field: rtm_table is still
+in use when table id is lower than 256.
+
+Add support for the 32-bit table id (RTA_TABLE attribute) in:
+- ip route print
+- ip route modify
+- ip rule print
+- ip rule modify
+
+Add printing of table ids to ip route.
+
+Changes are compatible with the mainline iproute2 utilities.
+
+These changes are required for compatibility with ConnMan, which by default
+uses table ids greater than 255.
+
+Upstream-Status: Submitted http://lists.busybox.net/pipermail/busybox/2016-November/084966.html
+
+Signed-off-by: Lukasz Nowak <lnowak@tycoint.com>
+---
+ networking/libiproute/iproute.c | 22 ++++++++++++++++++----
+ networking/libiproute/iprule.c  | 11 +++++++++--
+ 2 files changed, 27 insertions(+), 6 deletions(-)
+
+diff --git a/networking/libiproute/iproute.c b/networking/libiproute/iproute.c
+index 6ecd5f7..3add10b 100644
+--- a/networking/libiproute/iproute.c
++++ b/networking/libiproute/iproute.c
+@@ -87,6 +87,7 @@ static int FAST_FUNC print_route(const struct sockaddr_nl *who UNUSED_PARAM,
+ 	inet_prefix dst;
+ 	inet_prefix src;
+ 	int host_len = -1;
++	uint32_t tid;
+ 
+ 	if (n->nlmsg_type != RTM_NEWROUTE && n->nlmsg_type != RTM_DELROUTE) {
+ 		fprintf(stderr, "Not a route: %08x %08x %08x\n",
+@@ -99,6 +100,14 @@ static int FAST_FUNC print_route(const struct sockaddr_nl *who UNUSED_PARAM,
+ 	if (len < 0)
+ 		bb_error_msg_and_die("wrong nlmsg len %d", len);
+ 
++	memset(tb, 0, sizeof(tb));
++	parse_rtattr(tb, RTA_MAX, RTM_RTA(r), len);
++
++	if (tb[RTA_TABLE])
++		tid = *(uint32_t *)RTA_DATA(tb[RTA_TABLE]);
++	else
++		tid = r->rtm_table;
++
+ 	if (r->rtm_family == AF_INET6)
+ 		host_len = 128;
+ 	else if (r->rtm_family == AF_INET)
+@@ -128,7 +137,7 @@ static int FAST_FUNC print_route(const struct sockaddr_nl *who UNUSED_PARAM,
+ 			}
+ 		}
+ 	} else {
+-		if (G_filter.tb > 0 && G_filter.tb != r->rtm_table) {
++		if (G_filter.tb > 0 && G_filter.tb != tid) {
+ 			return 0;
+ 		}
+ 	}
+@@ -157,10 +166,8 @@ static int FAST_FUNC print_route(const struct sockaddr_nl *who UNUSED_PARAM,
+ 		return 0;
+ 	}
+ 
+-	memset(tb, 0, sizeof(tb));
+ 	memset(&src, 0, sizeof(src));
+ 	memset(&dst, 0, sizeof(dst));
+-	parse_rtattr(tb, RTA_MAX, RTM_RTA(r), len);
+ 
+ 	if (tb[RTA_SRC]) {
+ 		src.bitlen = r->rtm_src_len;
+@@ -283,6 +290,8 @@ static int FAST_FUNC print_route(const struct sockaddr_nl *who UNUSED_PARAM,
+ 	if (tb[RTA_OIF]) {
+ 		printf("dev %s ", ll_index_to_name(*(int*)RTA_DATA(tb[RTA_OIF])));
+ 	}
++	if (tid && tid != RT_TABLE_MAIN && !G_filter.tb)
++		printf("table %s ", rtnl_rttable_n2a(tid));
+ 
+ 	/* Todo: parse & show "proto kernel", "scope link" here */
+ 
+@@ -434,7 +443,12 @@ IF_FEATURE_IP_RULE(ARG_table,)
+ 			NEXT_ARG();
+ 			if (rtnl_rttable_a2n(&tid, *argv))
+ 				invarg(*argv, "table");
+-			req.r.rtm_table = tid;
++			if (tid < 256)
++				req.r.rtm_table = tid;
++			else {
++				req.r.rtm_table = RT_TABLE_UNSPEC;
++				addattr32(&req.n, sizeof(req), RTA_TABLE, tid);
++			}
+ #endif
+ 		} else if (arg == ARG_dev || arg == ARG_oif) {
+ 			NEXT_ARG();
+diff --git a/networking/libiproute/iprule.c b/networking/libiproute/iprule.c
+index 774a3e2..3fac7c5 100644
+--- a/networking/libiproute/iprule.c
++++ b/networking/libiproute/iprule.c
+@@ -119,7 +119,9 @@ static int FAST_FUNC print_rule(const struct sockaddr_nl *who UNUSED_PARAM,
+ 		printf("iif %s ", (char*)RTA_DATA(tb[RTA_IIF]));
+ 	}
+ 
+-	if (r->rtm_table)
++	if (tb[RTA_TABLE])
++		printf("lookup %s ", rtnl_rttable_n2a(*(uint32_t*)RTA_DATA(tb[RTA_TABLE])));
++	else if (r->rtm_table)
+ 		printf("lookup %s ", rtnl_rttable_n2a(r->rtm_table));
+ 
+ 	if (tb[RTA_FLOW]) {
+@@ -259,7 +261,12 @@ static int iprule_modify(int cmd, char **argv)
+ 			NEXT_ARG();
+ 			if (rtnl_rttable_a2n(&tid, *argv))
+ 				invarg(*argv, "table ID");
+-			req.r.rtm_table = tid;
++			if (tid < 256)
++				req.r.rtm_table = tid;
++			else {
++				req.r.rtm_table = RT_TABLE_UNSPEC;
++				addattr32(&req.n, sizeof(req), RTA_TABLE, tid);
++			}
+ 			table_ok = 1;
+ 		} else if (key == ARG_dev ||
+ 			   key == ARG_iif
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index df0e131..c35cba3 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -53,6 +53,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://busybox-kbuild-race-fix-commit-d8e61bb.patch \
            file://commit-applet_tables-fix-commit-0dddbc1.patch \
            file://makefile-libbb-race.patch \
+           file://0001-libiproute-handle-table-ids-larger-than-255.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.10.2



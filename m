Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 264ECE8FDB1
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 12:46:02 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42525.1767012345881454076
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 04:45:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HhyvmdtD;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so1863208666b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 04:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767012344; x=1767617144; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4vVxpJO7u80nVAVFaaw5Cz7F3JGbtYTqovZkv/k5zF8=;
        b=HhyvmdtDY0P82m46jqq1AfFxMQl19j4BIKw92SIBnt/QiJcuK4E2v22VhbC1kpLLdV
         DwF7gSjQqFdvyHC2B1e47igXR4afBHLD2/8ruff91bCsRy2Z3e5eGksNntwhS2TYpJD9
         JKWMxEAkb0kYO0blTXLnIEijrWvGI+oDsVeeapYQ2/X+7IvhvLmG0FZ8daWCnAz2Hkqz
         DXeZdSyD5FCJg2gYFMOIQX1QVReuKAl/ZCOSidpV5jzSbqihD+8/QiN2/GlVG996tCSo
         2xUIN137R5uSdlKLGVuipI9l7ti54YrKlTisznjqMMfLHm6CtUQNmcJkKCMBXmkEUGO1
         3twg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767012344; x=1767617144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vVxpJO7u80nVAVFaaw5Cz7F3JGbtYTqovZkv/k5zF8=;
        b=aq+nv4uIBKDqspiLV480/qcVFfI30vuyYRpyhU8FWcqaU3UNfT/CE5SVqBqMzdPJjO
         qybXwUfqTZ5Pymm/ghMPLhnueoYTUmK4yGYnoVeIHqDydUBdaotTwHutZRE+g1LG+w+f
         wAagTq+DMM4NXX8W0z+MBSb07gdrpR8onF2oKsSlo2taFBftTplq72UftVbuzQ0CLkI5
         qm4pwQ5R1VyXCVwEBPCkyJw9M3lrVNZajLdxPCwKOaZWi1HdO+4X4+dDso73lwcn9Jso
         nAiAd8a/AQnAt2KginqvQ4U88J0mM9PkP0HHdAAeNQ0mXPQR1e6qlXWNLKP3pw0RuGLZ
         Z5EQ==
X-Gm-Message-State: AOJu0Yz3kPzNVJQME4qgEgHslaRfgr+NBme5JfgvDo4b2v/sY94c9b/j
	ylPb+lCo9UEd0MPlXHS8GBPWZ6O+2ROQWgxgc4HbWGwxX1wymegFpl7KOLtPaA==
X-Gm-Gg: AY/fxX6e2tQbi/z8kK4tqaZBJtl0j+hai35cp2/9alWFggmWuYVTbeOOUCVO/cgT15O
	xKgqG1orbYFbMNCzGSz957hGX1Ik6oV2h7gTKKBQtzlJLL082+pzseE4bKYc5YNF4/mXAmnbF2v
	w/VG113hycUh3Y27NEfJmouy0ct+Puj0Gt9wZdR3jrXlCMO+uNZbhMFCJIyO8P+cO3iro1pJdQC
	8++/M+bU+ooj6/hQ7AWJ5wNinJIWlBPz94c5pjAHSy3+lWLgkQSd6JZeNZ54xJ6e5/6aeDewXZ6
	oz3o5qlq2Mf7+hUXtycV7AlDNpY/mhPiASeChmQSmCnnu3g+delHjX6SrZjqWacBcllvuDjRgBW
	LVG9d+XNSBVrp3fS4uYv29E55WWz5v/upVB0ITumlHk8tyxxVhFd0RO2XDFJX8ngxO0KcLglypS
	iA0XelIHWqZaDnPd0lTMwIyL+tz7aZEBtuWO9/wjiBD2u42eM=
X-Google-Smtp-Source: AGHT+IGrg7pccdtOXCzospIvb7l7t6xqFYTue4/hkZH0WO+3qLtbmPgJlYQa7P2YGx0uYxo8Byoq7Q==
X-Received: by 2002:a17:907:a4b:b0:b73:210a:44e with SMTP id a640c23a62f3a-b803717902bmr3397137066b.30.1767012343895;
        Mon, 29 Dec 2025 04:45:43 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm3364614966b.60.2025.12.29.04.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 04:45:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] libnl: upgrade 3.11.0 -> 3.12.0
Date: Mon, 29 Dec 2025 13:45:38 +0100
Message-ID: <20251229124538.1535197-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 12:46:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228601

From: Alexander Kanavin <alex@linutronix.de>

Remove a patch as the issue has been fixed upstream.

Backport a couple patches to address ptest issues due to missing
kernel modules (they're not built in standard linux-yocto):
https://github.com/thom311/libnl/issues/448

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...nd-use-_nltst_skip_eopnotsupp-helper.patch |  81 ++++++++++++
 ...-cksuite-all-netns.c-disable-route_1.patch |  31 -----
 ...us-tests-when-kernel-returns-EOPNOTS.patch | 120 ++++++++++++++++++
 .../{libnl_3.11.0.bb => libnl_3.12.0.bb}      |   5 +-
 4 files changed, 204 insertions(+), 33 deletions(-)
 create mode 100644 meta/recipes-support/libnl/files/0001-tests-add-and-use-_nltst_skip_eopnotsupp-helper.patch
 delete mode 100644 meta/recipes-support/libnl/files/0001-tests-cksuite-all-netns.c-disable-route_1.patch
 create mode 100644 meta/recipes-support/libnl/files/0002-tests-skip-various-tests-when-kernel-returns-EOPNOTS.patch
 rename meta/recipes-support/libnl/{libnl_3.11.0.bb => libnl_3.12.0.bb} (90%)

diff --git a/meta/recipes-support/libnl/files/0001-tests-add-and-use-_nltst_skip_eopnotsupp-helper.patch b/meta/recipes-support/libnl/files/0001-tests-add-and-use-_nltst_skip_eopnotsupp-helper.patch
new file mode 100644
index 0000000000..0f7ce5ba74
--- /dev/null
+++ b/meta/recipes-support/libnl/files/0001-tests-add-and-use-_nltst_skip_eopnotsupp-helper.patch
@@ -0,0 +1,81 @@
+From 193bd72d1ca66f7c97fdc78782617302b7724c52 Mon Sep 17 00:00:00 2001
+From: Thomas Haller <thom311@gmail.com>
+Date: Tue, 23 Dec 2025 21:31:06 +0100
+Subject: [PATCH] tests: add and use _nltst_skip_eopnotsupp() helper
+
+Upstream-Status: Backport [https://github.com/thom311/libnl/commit/f680f27]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ tests/cksuite-all-netns.c |  3 +--
+ tests/cksuite-route-nh.c  |  4 +---
+ tests/nl-test-util.c      | 11 +++++++++++
+ tests/nl-test-util.h      |  4 ++++
+ 4 files changed, 17 insertions(+), 5 deletions(-)
+
+diff --git a/tests/cksuite-all-netns.c b/tests/cksuite-all-netns.c
+index ff6fd65..4714db2 100644
+--- a/tests/cksuite-all-netns.c
++++ b/tests/cksuite-all-netns.c
+@@ -273,8 +273,7 @@ START_TEST(test_create_iface)
+ 	}
+ 
+ 	r = rtnl_link_add(sk, link, NLM_F_CREATE);
+-	if (r == -NLE_OPNOTSUPP) {
+-		/* Hm, no kernel module? Skip the test. */
++	if (_nltst_skip_eopnotsupp(r)) {
+ 		_nltst_assert_link_not_exists(IFNAME);
+ 		IFNAME = NULL;
+ 		return;
+diff --git a/tests/cksuite-route-nh.c b/tests/cksuite-route-nh.c
+index 07a7a83..8409e18 100644
+--- a/tests/cksuite-route-nh.c
++++ b/tests/cksuite-route-nh.c
+@@ -1054,10 +1054,8 @@ START_TEST(test_kernel_roundtrip_encap_ila)
+ 	ck_assert_int_eq(rtnl_nh_set_oif(nh, (uint32_t)ifindex_dummy), 0);
+ 	ck_assert_int_eq(rtnl_nh_set_family(nh, AF_INET6), 0);
+ 	ret = rtnl_nh_add(sk, nh, NLM_F_CREATE);
+-	if (ret == -NLE_OPNOTSUPP) {
+-		/* ila module is not loaded - skipping */
++	if (_nltst_skip_eopnotsupp(ret))
+ 		return;
+-	}
+ 	ck_assert_int_eq(ret, 0);
+ 
+ 	ck_assert_int_eq(rtnl_nh_alloc_cache(sk, AF_UNSPEC, &cache), 0);
+diff --git a/tests/nl-test-util.c b/tests/nl-test-util.c
+index 51c04c6..75bb540 100644
+--- a/tests/nl-test-util.c
++++ b/tests/nl-test-util.c
+@@ -838,6 +838,17 @@ bool _nltst_skip_no_iproute2(const char *msg)
+ 
+ /*****************************************************************************/
+ 
++bool _nltst_skip_eopnotsupp(int err)
++{
++	if (err != -NLE_OPNOTSUPP)
++		return false;
++
++	printf("skip test after operation failed with NLE_OPNOTSUPP. This indicates missing kernel support");
++	return true;
++}
++
++/*****************************************************************************/
++
+ void _nltst_add_dummy_and_up(struct nl_sock *sk, const char *ifname,
+ 			     int *out_ifindex)
+ {
+diff --git a/tests/nl-test-util.h b/tests/nl-test-util.h
+index ecae885..a2c0e3b 100644
+--- a/tests/nl-test-util.h
++++ b/tests/nl-test-util.h
+@@ -449,6 +449,10 @@ bool _nltst_skip_no_iproute2(const char *msg);
+ 
+ /*****************************************************************************/
+ 
++bool _nltst_skip_eopnotsupp(int err);
++
++/*****************************************************************************/
++
+ typedef struct {
+ 	int addr_family;
+ 	int ifindex;
diff --git a/meta/recipes-support/libnl/files/0001-tests-cksuite-all-netns.c-disable-route_1.patch b/meta/recipes-support/libnl/files/0001-tests-cksuite-all-netns.c-disable-route_1.patch
deleted file mode 100644
index cc5e3890a1..0000000000
--- a/meta/recipes-support/libnl/files/0001-tests-cksuite-all-netns.c-disable-route_1.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 9e45c8809fc4e0aa1dd2ec2ac3e57352049f1b92 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 20 Aug 2024 19:01:59 +0200
-Subject: [PATCH] tests/cksuite-all-netns.c: disable route_1
-
-This is a new test added in https://github.com/thom311/libnl/commit/49f7822961f5bc6b18cd2a2d3f3b8d2ab0896d3f
-and while it passes on host Debian, it doesn't inside poky.
-
-Investigation into why is proceeding slowly, and I'm simply
-not skilled enough in AF_NETLINK, so let's disable until the
-core reason for the fail is arrived at.
-
-Upstream-Status: Inappropriate [fail reported and investigated at https://github.com/thom311/libnl/issues/399]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- tests/cksuite-all-netns.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/cksuite-all-netns.c b/tests/cksuite-all-netns.c
-index 5b9d3a5..b2fc46a 100644
---- a/tests/cksuite-all-netns.c
-+++ b/tests/cksuite-all-netns.c
-@@ -341,7 +341,7 @@ Suite *make_nl_netns_suite(void)
- 				  nltst_netns_fixture_teardown);
- 	tcase_add_test(tc, cache_and_clone);
- 	tcase_add_loop_test(tc, test_create_iface, 0, 17);
--	tcase_add_test(tc, route_1);
-+	//tcase_add_test(tc, route_1);
- 	suite_add_tcase(suite, tc);
- 
- 	return suite;
diff --git a/meta/recipes-support/libnl/files/0002-tests-skip-various-tests-when-kernel-returns-EOPNOTS.patch b/meta/recipes-support/libnl/files/0002-tests-skip-various-tests-when-kernel-returns-EOPNOTS.patch
new file mode 100644
index 0000000000..e00ca9baaf
--- /dev/null
+++ b/meta/recipes-support/libnl/files/0002-tests-skip-various-tests-when-kernel-returns-EOPNOTS.patch
@@ -0,0 +1,120 @@
+From 09330c29d3322881d0215013962bff7549ca885c Mon Sep 17 00:00:00 2001
+From: Thomas Haller <thom311@gmail.com>
+Date: Tue, 23 Dec 2025 21:35:06 +0100
+Subject: [PATCH] tests: skip various tests when kernel returns EOPNOTSUPP
+ (NLE_OPNOTSUPP)
+
+https://github.com/thom311/libnl/issues/448
+
+Upstream-Status: Backport [https://github.com/thom311/libnl/commit/1ac4b32]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ tests/cksuite-link-ip6tnl.c   |  2 ++
+ tests/cksuite-route-nexthop.c |  6 +++++-
+ tests/cksuite-route-nh.c      | 21 ++++++++++++++++++---
+ 3 files changed, 25 insertions(+), 4 deletions(-)
+
+diff --git a/tests/cksuite-link-ip6tnl.c b/tests/cksuite-link-ip6tnl.c
+index ea785b8..c5dc353 100644
+--- a/tests/cksuite-link-ip6tnl.c
++++ b/tests/cksuite-link-ip6tnl.c
+@@ -97,6 +97,8 @@ START_TEST(test_kernel_roundtrip_all)
+ 	 * This tests the netlink-message construction.
+ 	 */
+ 	r = rtnl_link_add(sk, link, NLM_F_CREATE);
++	if (_nltst_skip_eopnotsupp(r))
++		return;
+ 	ck_assert_int_eq(r, 0);
+ 
+ 	/* Now, query it and check whether all the attributes passed.
+diff --git a/tests/cksuite-route-nexthop.c b/tests/cksuite-route-nexthop.c
+index 34fc1d3..971a580 100644
+--- a/tests/cksuite-route-nexthop.c
++++ b/tests/cksuite-route-nexthop.c
+@@ -416,6 +416,7 @@ START_TEST(test_kernel_route_roundtrip_nh_mpls_encap_v4)
+ 	struct rtnl_nh_encap *encap2;
+ 	struct rtnl_nexthop *nh = NULL;
+ 	int ifindex_dummy;
++	int r;
+ 
+ 	if (_nltst_skip_no_netns())
+ 		return;
+@@ -447,7 +448,10 @@ START_TEST(test_kernel_route_roundtrip_nh_mpls_encap_v4)
+ 	ck_assert_int_eq(rtnl_route_nh_set_encap(nh, encap2), 0);
+ 	rtnl_route_add_nexthop(route, nh);
+ 
+-	ck_assert_int_eq(rtnl_route_add(sk, route, NLM_F_CREATE), 0);
++	r = rtnl_route_add(sk, route, NLM_F_CREATE);
++	if (_nltst_skip_eopnotsupp(r))
++		return;
++	ck_assert_int_eq(r, 0);
+ 
+ 	/* Retrieve the route back by its prefix and validate MPLS encap on nexthop */
+ 	ck_assert_int_eq(nltst_route_get_by_dst(sk, dst, &got), 0);
+diff --git a/tests/cksuite-route-nh.c b/tests/cksuite-route-nh.c
+index 8409e18..500768b 100644
+--- a/tests/cksuite-route-nh.c
++++ b/tests/cksuite-route-nh.c
+@@ -91,6 +91,7 @@ START_TEST(test_kernel_roundtrip_encap_mpls)
+ 	_nl_auto_nl_addr struct nl_addr *labels = NULL;
+ 	struct rtnl_nh_encap *encap = NULL;
+ 	int ifindex_dummy;
++	int r;
+ 
+ 	if (_nltst_skip_no_netns())
+ 		return;
+@@ -127,7 +128,11 @@ START_TEST(test_kernel_roundtrip_encap_mpls)
+ 	ck_assert_int_eq(rtnl_nh_add(sk, nh, NLM_F_CREATE), -NLE_INVAL);
+ 
+ 	ck_assert_int_eq(rtnl_nh_set_family(nh, AF_INET), 0);
+-	ck_assert_int_eq(rtnl_nh_add(sk, nh, NLM_F_CREATE), 0);
++
++	r = rtnl_nh_add(sk, nh, NLM_F_CREATE);
++	if (_nltst_skip_eopnotsupp(r))
++		return;
++	ck_assert_int_eq(r, 0);
+ 
+ 	/* Query and verify */
+ 	ck_assert_int_eq(rtnl_nh_alloc_cache(sk, AF_UNSPEC, &cache), 0);
+@@ -944,6 +949,7 @@ START_TEST(test_kernel_roundtrip_encap_ip6)
+ 	_nl_auto_rtnl_nh_encap struct rtnl_nh_encap *encap = NULL;
+ 	uint16_t flags;
+ 	int ifindex_dummy;
++	int r;
+ 
+ 	if (_nltst_skip_no_netns())
+ 		return;
+@@ -980,7 +986,11 @@ START_TEST(test_kernel_roundtrip_encap_ip6)
+ 	/* Set required attributes and add */
+ 	ck_assert_int_eq(rtnl_nh_set_oif(nh, (uint32_t)ifindex_dummy), 0);
+ 	ck_assert_int_eq(rtnl_nh_set_family(nh, AF_INET6), 0);
+-	ck_assert_int_eq(rtnl_nh_add(sk, nh, NLM_F_CREATE), 0);
++
++	r = rtnl_nh_add(sk, nh, NLM_F_CREATE);
++	if (_nltst_skip_eopnotsupp(r))
++		return;
++	ck_assert_int_eq(r, 0);
+ 
+ 	/* Query and verify */
+ 	ck_assert_int_eq(rtnl_nh_alloc_cache(sk, AF_UNSPEC, &cache), 0);
+@@ -1097,6 +1107,7 @@ START_TEST(test_kernel_roundtrip_encap_ip)
+ 	_nl_auto_rtnl_nh_encap struct rtnl_nh_encap *encap = NULL;
+ 	int ifindex_dummy;
+ 	uint64_t id = 0;
++	int r;
+ 
+ 	if (_nltst_skip_no_netns())
+ 		return;
+@@ -1132,7 +1143,11 @@ START_TEST(test_kernel_roundtrip_encap_ip)
+ 	/* Set required attributes and add */
+ 	ck_assert_int_eq(rtnl_nh_set_oif(nh, (uint32_t)ifindex_dummy), 0);
+ 	ck_assert_int_eq(rtnl_nh_set_family(nh, AF_INET), 0);
+-	ck_assert_int_eq(rtnl_nh_add(sk, nh, NLM_F_CREATE), 0);
++
++	r = rtnl_nh_add(sk, nh, NLM_F_CREATE);
++	if (_nltst_skip_eopnotsupp(r))
++		return;
++	ck_assert_int_eq(r, 0);
+ 
+ 	/* Query and verify */
+ 	ck_assert_int_eq(rtnl_nh_alloc_cache(sk, AF_UNSPEC, &cache), 0);
diff --git a/meta/recipes-support/libnl/libnl_3.11.0.bb b/meta/recipes-support/libnl/libnl_3.12.0.bb
similarity index 90%
rename from meta/recipes-support/libnl/libnl_3.11.0.bb
rename to meta/recipes-support/libnl/libnl_3.12.0.bb
index 26c87dbb1c..f28687e695 100644
--- a/meta/recipes-support/libnl/libnl_3.11.0.bb
+++ b/meta/recipes-support/libnl/libnl_3.12.0.bb
@@ -16,10 +16,11 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}${@d.getVar('PV').replace('.','_')}/${BP}.tar.gz \
            file://run-ptest \
-           file://0001-tests-cksuite-all-netns.c-disable-route_1.patch \
+           file://0002-tests-skip-various-tests-when-kernel-returns-EOPNOTS.patch \
+           file://0001-tests-add-and-use-_nltst_skip_eopnotsupp-helper.patch \
            "
 
-SRC_URI[sha256sum] = "2a56e1edefa3e68a7c00879496736fdbf62fc94ed3232c0baba127ecfa76874d"
+SRC_URI[sha256sum] = "fc51ca7196f1a3f5fdf6ffd3864b50f4f9c02333be28be4eeca057e103c0dd18"
 
 GITHUB_BASE_URI = "https://github.com/thom311/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/libnl(?P<pver>.+)"
-- 
2.47.3



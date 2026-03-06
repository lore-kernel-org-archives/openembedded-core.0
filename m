Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65738EFCE5B
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 07:23:09 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64687.1772781786864947349
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 23:23:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NKgNJYZv;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso82307455e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 23:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772781785; x=1773386585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2QRGruo+PfcsOW5RigGNofW/qBNcrKkudy2e2IX8TWw=;
        b=NKgNJYZv6xMc+YPu3D+uuNFBNYtZLpKW+c/1poeUUcdDQO9uk6zDf1so1bt4wEXZQS
         HZ4j3DlOdNz2C1mzHZijSKD55Dke8eKs8zM1mFJCjb5auOsIrpgqcFYtcmc/+Jl5wDNz
         pBBxOQLLOI0AC+N0/eKCI4eTcLookovcaSXnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772781785; x=1773386585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2QRGruo+PfcsOW5RigGNofW/qBNcrKkudy2e2IX8TWw=;
        b=bCmbBz3pjEc851eJvsDNBeWdYQt5TOFEPOPySoF8QM9sXjbxtucf93ZLk70ZoCVGS7
         yIcEs/AzjYNT5KKp8lO4mYzgWAKwHllvQRdF8jo8cr0lGtjfTthOI4tC6xbWUCRXOr88
         dXARvIjP7PocD9lntUWWgzHl3ry73IOxni/dETE4Bh5SOQXEj9KsJuQsAyxBtWBeZsTL
         XJSySPSi10jT0jK2nhRf62Mdt1V33AX71RpFi+uIwUQ+h5s3+XW6NsV2OKT8QyKMtGbG
         aVxxs5GYWYw2jA6ZD9carHoM/FicqOoyzjDykapAqqZgfBx96Ym6h7QGo37fxIS6SlAK
         RVFQ==
X-Gm-Message-State: AOJu0YymTvwHYL8BjoNzxKMeO8BUlDTfB8mIZ5pg/k9DUdKivuqhqFWs
	LZ+bf0Xnjv6dOlxfOOrXOFcGfTHjvIfKAfax9PEfe8jjPHVcEt94dYsIjimlmkDoXGn1KGdo8FF
	jpx4G
X-Gm-Gg: ATEYQzxkcK8dOysBHauf5643GgG8dr4HJbXTVn3NGCW4GVnxqxdhmqwZnKBkAkc3wvY
	b/NzfdUZ1plYVmtPCj/8U8qU6wr5YNGYpe1+KE2x91Q4m0Obji3MzhaWjoYvEanwg6QnaLonQfp
	8VkG4Gr4qPUeGwB255apcajnhgWCyH5ViJNHTHfkobF7e6FdjZoM1L+PTzwaFMVkcnYa2dylU2m
	BVDQFiKvHcKhzPWidBnCLb/s0bb6/ATO68LHGxMQX1/12oKO+cy/y3GBsxAkbqKJqT4OhbGMA7c
	KaCSBwPeYmOfsG1Qkcl2hU3znAB+B6rB556uLzWXbasBXym9trXLq4VGSvUWkCvG9+3TunOwBDa
	pAZSDUug/YasQ+Op88y8ut40VB8boVYgEmNqnq7LnGSBg+bcdEt9tfvD0Jq54/C1PIsJsB1iugB
	jYRTW0u55ko0PK8RBKdFmZq+fGtI/PflJF7rkTsd6MK7t/p+Aom9X/GZW17NbqL73HygIOZPdHe
	DVUqQuiPdRM4nqpayTUmXMG5z282FnnIXb7drM=
X-Received: by 2002:a05:600c:1991:b0:482:eec4:772 with SMTP id 5b1f17b1804b1-48526977239mr14749075e9.32.1772781784022;
        Thu, 05 Mar 2026 23:23:04 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bdeac353f6fa5aa8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bdea:c353:f6fa:5aa8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276b09casm23106445e9.11.2026.03.05.23.23.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:23:03 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 09/16] gnutls: Fix CVE-2025-14831
Date: Fri,  6 Mar 2026 08:22:09 +0100
Message-ID: <12ed5b743db6658fb2b6784c82d8ddc9e46fdaec.1772780989.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772780989.git.yoann.congal@smile.fr>
References: <cover.1772780989.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 07:23:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232550

From: Vijay Anusuri <vanusuri@mvista.com>

Picked commits which mentions this CVE per [1].

[1] https://ubuntu.com/security/CVE-2025-14831
[2] https://security-tracker.debian.org/tracker/CVE-2025-14831
[3] https://gitlab.com/gnutls/gnutls/-/issues/1773

Backported
https://gitlab.com/gnutls/gnutls/-/commit/6e118a4dfe820ce62fc77130b89188bcd8fbcaad
to apply patches cleanly.

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnutls/gnutls/CVE-2025-14831-1.patch      | 119 +++++
 .../gnutls/gnutls/CVE-2025-14831-10.patch     | 424 +++++++++++++++
 .../gnutls/gnutls/CVE-2025-14831-2.patch      |  66 +++
 .../gnutls/gnutls/CVE-2025-14831-3.patch      |  30 ++
 .../gnutls/gnutls/CVE-2025-14831-4.patch      |  45 ++
 .../gnutls/gnutls/CVE-2025-14831-5.patch      | 205 +++++++
 .../gnutls/gnutls/CVE-2025-14831-6.patch      | 505 ++++++++++++++++++
 .../gnutls/gnutls/CVE-2025-14831-7.patch      | 124 +++++
 .../gnutls/gnutls/CVE-2025-14831-8.patch      | 155 ++++++
 .../gnutls/gnutls/CVE-2025-14831-9.patch      | 110 ++++
 meta/recipes-support/gnutls/gnutls_3.8.10.bb  |  10 +
 11 files changed, 1793 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-10.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-2.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-3.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-4.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-5.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-6.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-7.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-8.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-1.patch b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-1.patch
new file mode 100644
index 00000000000..1bfa771043c
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-1.patch
@@ -0,0 +1,119 @@
+From 6e118a4dfe820ce62fc77130b89188bcd8fbcaad Mon Sep 17 00:00:00 2001
+From: chenjianhu <chenjianhu@kylinos.cn>
+Date: Fri, 1 Aug 2025 17:18:23 +0800
+Subject: [PATCH] x509: fix incorrect handling in name constraints merging
+
+As mentioned in commit ca573d65 ("x509: Fix asymmetry in name
+constraints intersection", 2016-07-29), the
+_gnutls_name_constraints_intersect function exhibited an
+asymmetry in name constraints intersection behavior, specifically
+manifested as:
+1. Nodes of unique types in PERMITTED (absent in PERMITTED2) were
+   preserved
+2. Nodes of unique types in PERMITTED2 (absent in PERMITTED) were
+   discarded
+
+A 'used' flag was introduced, where if a node from PERMITTED2 was
+   not used for the intersection, it would be copied to PERMITTED.
+
+However,an unresolved edge case persisted:
+- When 'removed.size > 0', the 'used' flag was unconditionally set
+to 1
+- This prevented copying of PERMITTED2 nodes with unique types
+
+Signed-off-by: chenjianhu <chenjianhu@kylinos.cn>
+Modified-by: Daiki Ueno <ueno@gnu.org>
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/6e118a4dfe820ce62fc77130b89188bcd8fbcaad]
+CVE: CVE-2025-14831 #Backport to apply CVE patches cleanly
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/x509/name_constraints.c    |  5 +++-
+ tests/name-constraints-merge.c | 55 ++++++++++++++++++++++++++++++++++
+ 2 files changed, 59 insertions(+), 1 deletion(-)
+
+diff --git a/lib/x509/name_constraints.c b/lib/x509/name_constraints.c
+index 3c6e306303..2be6a2aaa6 100644
+--- a/lib/x509/name_constraints.c
++++ b/lib/x509/name_constraints.c
+@@ -414,7 +414,10 @@ static int name_constraints_node_list_intersect(
+ 				gnutls_assert();
+ 				goto cleanup;
+ 			}
+-			used = 1;
++
++			if (t->type == t2->type)
++				used = 1;
++
+ 			// if intersection is not empty
+ 			if (tmp !=
+ 			    NULL) { // intersection for this type is not empty
+diff --git a/tests/name-constraints-merge.c b/tests/name-constraints-merge.c
+index 03b3243cc7..70376aaa74 100644
+--- a/tests/name-constraints-merge.c
++++ b/tests/name-constraints-merge.c
+@@ -418,6 +418,61 @@ void doit(void)
+ 	gnutls_x509_name_constraints_deinit(nc1);
+ 	gnutls_x509_name_constraints_deinit(nc2);
+ 
++	/* 5: variant of suite 0: after moving rfc822Name (ccc.com)
++	 * from NC1 to NC2, dNSName (xxx.ccc.com) should still be
++	 * rejected.
++	 *
++	 * NC1: permitted DNS org
++	 *      permitted DNS ccc.com
++	 * NC2: permitted DNS org
++	 *      permitted email ccc.com
++	 *      permitted DNS aaa.bbb.ccc.com
++	 */
++	suite = 5;
++
++	ret = gnutls_x509_name_constraints_init(&nc1);
++	check_for_error(ret);
++
++	ret = gnutls_x509_name_constraints_init(&nc2);
++	check_for_error(ret);
++
++	set_name("org", &name);
++	ret = gnutls_x509_name_constraints_add_permitted(
++		nc1, GNUTLS_SAN_DNSNAME, &name);
++	check_for_error(ret);
++
++	set_name("ccc.com", &name);
++	ret = gnutls_x509_name_constraints_add_permitted(
++		nc1, GNUTLS_SAN_DNSNAME, &name);
++	check_for_error(ret);
++
++	set_name("org", &name);
++	ret = gnutls_x509_name_constraints_add_permitted(
++		nc2, GNUTLS_SAN_DNSNAME, &name);
++	check_for_error(ret);
++
++	set_name("ccc.com", &name);
++	ret = gnutls_x509_name_constraints_add_permitted(
++		nc2, GNUTLS_SAN_RFC822NAME, &name);
++	check_for_error(ret);
++
++	set_name("aaa.bbb.ccc.com", &name);
++	ret = gnutls_x509_name_constraints_add_permitted(
++		nc2, GNUTLS_SAN_DNSNAME, &name);
++	check_for_error(ret);
++
++	ret = _gnutls_x509_name_constraints_merge(nc1, nc2);
++	check_for_error(ret);
++
++	/* check intersection of permitted */
++	set_name("xxx.ccc.com", &name);
++	ret = gnutls_x509_name_constraints_check(nc1, GNUTLS_SAN_DNSNAME,
++						 &name);
++	check_test_result(suite, ret, NAME_REJECTED, &name);
++
++	gnutls_x509_name_constraints_deinit(nc1);
++	gnutls_x509_name_constraints_deinit(nc2);
++
+ 	/* Test footer */
+ 
+ 	if (debug)
+-- 
+GitLab
+
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-10.patch b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-10.patch
new file mode 100644
index 00000000000..5507719ac01
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-10.patch
@@ -0,0 +1,424 @@
+From d6054f0016db05fb5c82177ddbd0a4e8331059a1 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Wed, 4 Feb 2026 20:03:49 +0100
+Subject: [PATCH] x509/name_constraints: name_constraints_node_list_intersect
+ over sorted
+
+Fixes: #1773
+Fixes: GNUTLS-SA-2026-02-09-2
+Fixes: CVE-2025-14831
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/d6054f0016db05fb5c82177ddbd0a4e8331059a1]
+CVE: CVE-2025-14831
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/x509/name_constraints.c | 350 ++++++++++++++----------------------
+ 1 file changed, 135 insertions(+), 215 deletions(-)
+
+diff --git a/lib/x509/name_constraints.c b/lib/x509/name_constraints.c
+index 1d78d1b..04722bd 100644
+--- a/lib/x509/name_constraints.c
++++ b/lib/x509/name_constraints.c
+@@ -446,13 +446,6 @@ name_constraints_node_add_copy(gnutls_x509_name_constraints_t nc,
+ 					     src->name.data, src->name.size);
+ }
+ 
+-// for documentation see the implementation
+-static int name_constraints_intersect_nodes(
+-	gnutls_x509_name_constraints_t nc,
+-	const struct name_constraints_node_st *node1,
+-	const struct name_constraints_node_st *node2,
+-	struct name_constraints_node_st **intersection);
+-
+ /*-
+  * _gnutls_x509_name_constraints_is_empty:
+  * @nc: name constraints structure
+@@ -716,132 +709,143 @@ typedef char assert_ipaddr[(GNUTLS_SAN_IPADDRESS <= GNUTLS_SAN_MAX) ? 1 : -1];
+ static int name_constraints_node_list_intersect(
+ 	gnutls_x509_name_constraints_t nc,
+ 	struct name_constraints_node_list_st *permitted,
+-	const struct name_constraints_node_list_st *permitted2,
++	struct name_constraints_node_list_st *permitted2,
+ 	struct name_constraints_node_list_st *excluded)
+ {
+-	struct name_constraints_node_st *tmp;
+-	int ret, type, used;
+-	struct name_constraints_node_list_st removed = { .data = NULL,
+-							 .size = 0,
+-							 .capacity = 0 };
++	struct name_constraints_node_st *nc1, *nc2;
++	struct name_constraints_node_list_st result = { 0 };
++	struct name_constraints_node_list_st unsupp2 = { 0 };
++	enum name_constraint_relation rel;
++	unsigned type;
++	int ret = GNUTLS_E_SUCCESS;
++	size_t i, j, p1_unsupp = 0, p2_unsupp = 0;
++	type_bitmask_t universal_exclude_needed = 0;
++	type_bitmask_t types_in_p1 = 0, types_in_p2 = 0;
+ 	static const unsigned char universal_ip[32] = { 0 };
+ 
+-	/* bitmask to see if we need to add universal excluded constraints
+-	 * (see phase 3 for details) */
+-	type_bitmask_t types_with_empty_intersection = 0;
+-
+ 	if (permitted->size == 0 || permitted2->size == 0)
+-		return 0;
++		return GNUTLS_E_SUCCESS;
+ 
+-	/* Phase 1
+-	 * For each name in PERMITTED, if a PERMITTED2 does not contain a name
+-	 * with the same type, move the original name to REMOVED.
+-	 * Do this also for node of unknown type (not DNS, email, IP) */
+-	for (size_t i = 0; i < permitted->size;) {
+-		struct name_constraints_node_st *t = permitted->data[i];
+-		const struct name_constraints_node_st *found = NULL;
+-
+-		for (size_t j = 0; j < permitted2->size; j++) {
+-			const struct name_constraints_node_st *t2 =
+-				permitted2->data[j];
+-			if (t->type == t2->type) {
+-				// check bounds (we will use 't->type' as index)
+-				if (t->type > GNUTLS_SAN_MAX || t->type == 0) {
+-					gnutls_assert();
+-					ret = GNUTLS_E_INTERNAL_ERROR;
+-					goto cleanup;
+-				}
+-				// note the possibility of empty intersection for this type
+-				// if we add something to the intersection in phase 2,
+-				// we will reset this flag back to 0 then
+-				type_bitmask_set(types_with_empty_intersection,
+-						 t->type);
+-				found = t2;
+-				break;
+-			}
+-		}
++	/* make sorted views of the arrays */
++	ret = ensure_sorted(permitted);
++	if (ret < 0) {
++		gnutls_assert();
++		goto cleanup;
++	}
++	ret = ensure_sorted(permitted2);
++	if (ret < 0) {
++		gnutls_assert();
++		goto cleanup;
++	}
+ 
+-		if (found != NULL && is_supported_type(t->type)) {
+-			/* move node from PERMITTED to REMOVED */
+-			ret = name_constraints_node_list_add(&removed, t);
+-			if (ret < 0) {
+-				gnutls_assert();
+-				goto cleanup;
+-			}
+-			/* remove node by swapping */
+-			if (i < permitted->size - 1)
+-				permitted->data[i] =
+-					permitted->data[permitted->size - 1];
+-			permitted->size--;
+-			permitted->dirty = true;
+-			continue;
++	/* deal with the leading unsupported types first: count, then union */
++	while (p1_unsupp < permitted->size &&
++	       !is_supported_type(permitted->sorted_view[p1_unsupp]->type))
++		p1_unsupp++;
++	while (p2_unsupp < permitted2->size &&
++	       !is_supported_type(permitted2->sorted_view[p2_unsupp]->type))
++		p2_unsupp++;
++	if (p1_unsupp) { /* copy p1 unsupported type pointers into result */
++		result.data = gnutls_calloc(
++			p1_unsupp, sizeof(struct name_constraints_node_st *));
++		if (!result.data) {
++			ret = GNUTLS_E_MEMORY_ERROR;
++			gnutls_assert();
++			goto cleanup;
++		}
++		memcpy(result.data, permitted->sorted_view,
++		       p1_unsupp * sizeof(struct name_constraints_node_st *));
++		result.size = result.capacity = p1_unsupp;
++		result.dirty = true;
++	}
++	if (p2_unsupp) { /* union will make deep copies from p2 */
++		unsupp2.data = permitted2->sorted_view; /* so, just alias */
++		unsupp2.size = unsupp2.capacity = p2_unsupp;
++		unsupp2.dirty = false; /* we know it's sorted */
++		unsupp2.sorted_view = permitted2->sorted_view;
++		ret = name_constraints_node_list_union(nc, &result, &unsupp2);
++		if (ret < 0) {
++			gnutls_assert();
++			goto cleanup;
+ 		}
+-		i++;
+ 	}
+ 
+-	/* Phase 2
+-	 * iterate through all combinations from PERMITTED2 and PERMITTED
+-	 * and create intersections of nodes with same type */
+-	for (size_t i = 0; i < permitted2->size; i++) {
+-		const struct name_constraints_node_st *t2 = permitted2->data[i];
+-
+-		// current PERMITTED2 node has not yet been used for any intersection
+-		// (and is not in REMOVED either)
+-		used = 0;
+-		for (size_t j = 0; j < removed.size; j++) {
+-			const struct name_constraints_node_st *t =
+-				removed.data[j];
+-			// save intersection of name constraints into tmp
+-			ret = name_constraints_intersect_nodes(nc, t, t2, &tmp);
+-			if (ret < 0) {
+-				gnutls_assert();
+-				goto cleanup;
+-			}
++	/* with that out of the way, pre-compute the supported types we have */
++	for (i = p1_unsupp; i < permitted->size; i++) {
++		type = permitted->sorted_view[i]->type;
++		if (type < 1 || type > GNUTLS_SAN_MAX) {
++			ret = gnutls_assert_val(GNUTLS_E_INTERNAL_ERROR);
++			goto cleanup;
++		}
++		type_bitmask_set(types_in_p1, type);
++	}
++	for (j = p2_unsupp; j < permitted2->size; j++) {
++		type = permitted2->sorted_view[j]->type;
++		if (type < 1 || type > GNUTLS_SAN_MAX) {
++			ret = gnutls_assert_val(GNUTLS_E_INTERNAL_ERROR);
++			goto cleanup;
++		}
++		type_bitmask_set(types_in_p2, type);
++	}
++	/* universal excludes might be needed for types intersecting to empty */
++	universal_exclude_needed = types_in_p1 & types_in_p2;
++
++	/* go through supported type NCs and intersect in a single pass */
++	i = p1_unsupp;
++	j = p2_unsupp;
++	while (i < permitted->size || j < permitted2->size) {
++		nc1 = (i < permitted->size) ? permitted->sorted_view[i] : NULL;
++		nc2 = (j < permitted2->size) ? permitted2->sorted_view[j] :
++					       NULL;
++		rel = compare_name_constraint_nodes(nc1, nc2);
+ 
+-			if (t->type == t2->type)
+-				used = 1;
+-
+-			// if intersection is not empty
+-			if (tmp !=
+-			    NULL) { // intersection for this type is not empty
+-				// check bounds
+-				if (tmp->type > GNUTLS_SAN_MAX ||
+-				    tmp->type == 0) {
+-					gnutls_free(tmp);
+-					return gnutls_assert_val(
+-						GNUTLS_E_INTERNAL_ERROR);
+-				}
+-				// we will not add universal excluded constraint for this type
+-				type_bitmask_clr(types_with_empty_intersection,
+-						 tmp->type);
+-				// add intersection node to PERMITTED
+-				ret = name_constraints_node_list_add(permitted,
+-								     tmp);
+-				if (ret < 0) {
+-					gnutls_assert();
+-					goto cleanup;
+-				}
+-			}
++		switch (rel) {
++		case NC_SORTS_BEFORE:
++			assert(nc1 != NULL); /* comparator-guaranteed */
++			/* if nothing to intersect with, shallow-copy nc1 */
++			if (!type_bitmask_in(types_in_p2, nc1->type))
++				ret = name_constraints_node_list_add(&result,
++								     nc1);
++			i++; /* otherwise skip nc1 */
++			break;
++		case NC_SORTS_AFTER:
++			assert(nc2 != NULL); /* comparator-guaranteed */
++			/* if nothing to intersect with, deep-copy nc2 */
++			if (!type_bitmask_in(types_in_p1, nc2->type))
++				ret = name_constraints_node_add_copy(
++					nc, &result, nc2);
++			j++; /* otherwise skip nc2 */
++			break;
++		case NC_INCLUDED_BY: /* add nc1, shallow-copy */
++			assert(nc1 != NULL && nc2 != NULL); /* comparator */
++			type_bitmask_clr(universal_exclude_needed, nc1->type);
++			ret = name_constraints_node_list_add(&result, nc1);
++			i++;
++			break;
++		case NC_INCLUDES: /* pick nc2, deep-copy */
++			assert(nc1 != NULL && nc2 != NULL); /* comparator */
++			type_bitmask_clr(universal_exclude_needed, nc2->type);
++			ret = name_constraints_node_add_copy(nc, &result, nc2);
++			j++;
++			break;
++		case NC_EQUAL: /* pick whichever: nc1, shallow-copy */
++			assert(nc1 != NULL && nc2 != NULL); /* loop condition */
++			type_bitmask_clr(universal_exclude_needed, nc1->type);
++			ret = name_constraints_node_list_add(&result, nc1);
++			i++;
++			j++;
++			break;
+ 		}
+-		// if the node from PERMITTED2 was not used for intersection, copy it to DEST
+-		// Beware: also copies nodes other than DNS, email, IP,
+-		//       since their counterpart may have been moved in phase 1.
+-		if (!used) {
+-			ret = name_constraints_node_add_copy(nc, permitted, t2);
+-			if (ret < 0) {
+-				gnutls_assert();
+-				goto cleanup;
+-			}
++		if (ret < 0) {
++			gnutls_assert();
++			goto cleanup;
+ 		}
+ 	}
+ 
+-	/* Phase 3
+-	 * For each type: If we have empty permitted name constraints now
+-	 * and we didn't have at the beginning, we have to add a new
+-	 * excluded constraint with universal wildcard
+-	 * (since the intersection of permitted is now empty). */
++	/* finishing touch: add universal excluded constraints for types where
++	 * both lists had constraints, but all intersections ended up empty */
+ 	for (type = 1; type <= GNUTLS_SAN_MAX; type++) {
+-		if (!type_bitmask_in(types_with_empty_intersection, type))
++		if (!type_bitmask_in(universal_exclude_needed, type))
+ 			continue;
+ 		_gnutls_hard_log(
+ 			"Adding universal excluded name constraint for type %d.\n",
+@@ -874,14 +878,24 @@ static int name_constraints_node_list_intersect(
+ 				goto cleanup;
+ 			}
+ 			break;
+-		default: // do nothing, at least one node was already moved in phase 1
+-			break;
++		default: /* unsupported type; should be unreacheable */
++			ret = gnutls_assert_val(GNUTLS_E_INTERNAL_ERROR);
++			goto cleanup;
+ 		}
+ 	}
+-	ret = GNUTLS_E_SUCCESS;
+ 
++	gnutls_free(permitted->data);
++	gnutls_free(permitted->sorted_view);
++	permitted->data = result.data;
++	permitted->sorted_view = NULL;
++	permitted->size = result.size;
++	permitted->capacity = result.capacity;
++	permitted->dirty = true;
++
++	result.data = NULL;
++	ret = GNUTLS_E_SUCCESS;
+ cleanup:
+-	gnutls_free(removed.data);
++	name_constraints_node_list_clear(&result);
+ 	return ret;
+ }
+ 
+@@ -1257,100 +1271,6 @@ static unsigned email_matches(const gnutls_datum_t *name,
+ 	return rel == NC_EQUAL || rel == NC_INCLUDED_BY;
+ }
+ 
+-/*-
+- * name_constraints_intersect_nodes:
+- * @nc1: name constraints node 1
+- * @nc2: name constraints node 2
+- * @_intersection: newly allocated node with intersected constraints,
+- *		 NULL if the intersection is empty
+- *
+- * Inspect 2 name constraints nodes (of possibly different types) and allocate
+- * a new node with intersection of given constraints.
+- *
+- * Returns: On success, %GNUTLS_E_SUCCESS (0) is returned, otherwise a negative error value.
+- -*/
+-static int name_constraints_intersect_nodes(
+-	gnutls_x509_name_constraints_t nc,
+-	const struct name_constraints_node_st *node1,
+-	const struct name_constraints_node_st *node2,
+-	struct name_constraints_node_st **_intersection)
+-{
+-	// presume empty intersection
+-	struct name_constraints_node_st *intersection = NULL;
+-	const struct name_constraints_node_st *to_copy = NULL;
+-	enum name_constraint_relation rel;
+-
+-	*_intersection = NULL;
+-
+-	if (node1->type != node2->type) {
+-		return GNUTLS_E_SUCCESS;
+-	}
+-	switch (node1->type) {
+-	case GNUTLS_SAN_DNSNAME:
+-		rel = compare_dns_names(&node1->name, &node2->name);
+-		switch (rel) {
+-		case NC_EQUAL: // equal means doesn't matter which one
+-		case NC_INCLUDES: // node2 is more specific
+-			to_copy = node2;
+-			break;
+-		case NC_INCLUDED_BY: // node1 is more specific
+-			to_copy = node1;
+-			break;
+-		case NC_SORTS_BEFORE: // no intersection
+-		case NC_SORTS_AFTER: // no intersection
+-			return GNUTLS_E_SUCCESS;
+-		}
+-		break;
+-	case GNUTLS_SAN_RFC822NAME:
+-		rel = compare_emails(&node1->name, &node2->name);
+-		switch (rel) {
+-		case NC_EQUAL: // equal means doesn't matter which one
+-		case NC_INCLUDES: // node2 is more specific
+-			to_copy = node2;
+-			break;
+-		case NC_INCLUDED_BY: // node1 is more specific
+-			to_copy = node1;
+-			break;
+-		case NC_SORTS_BEFORE: // no intersection
+-		case NC_SORTS_AFTER: // no intersection
+-			return GNUTLS_E_SUCCESS;
+-		}
+-		break;
+-	case GNUTLS_SAN_IPADDRESS:
+-		rel = compare_ip_ncs(&node1->name, &node2->name);
+-		switch (rel) {
+-		case NC_EQUAL: // equal means doesn't matter which one
+-		case NC_INCLUDES: // node2 is more specific
+-			to_copy = node2;
+-			break;
+-		case NC_INCLUDED_BY: // node1 is more specific
+-			to_copy = node1;
+-			break;
+-		case NC_SORTS_BEFORE: // no intersection
+-		case NC_SORTS_AFTER: // no intersection
+-			return GNUTLS_E_SUCCESS;
+-		}
+-		break;
+-	default:
+-		// for other types, we don't know how to do the intersection, assume empty
+-		return GNUTLS_E_SUCCESS;
+-	}
+-
+-	// copy existing node if applicable
+-	if (to_copy != NULL) {
+-		*_intersection = name_constraints_node_new(nc, to_copy->type,
+-							   to_copy->name.data,
+-							   to_copy->name.size);
+-		if (*_intersection == NULL)
+-			return gnutls_assert_val(GNUTLS_E_MEMORY_ERROR);
+-		intersection = *_intersection;
+-
+-		assert(intersection->name.data != NULL);
+-	}
+-
+-	return GNUTLS_E_SUCCESS;
+-}
+-
+ /*
+  * Returns: true if the certification is acceptable, and false otherwise.
+  */
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-2.patch b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-2.patch
new file mode 100644
index 00000000000..9066098a01f
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-2.patch
@@ -0,0 +1,66 @@
+From 0b2377dfccd99be641bf3f1a0de9f0dc8dc0d4b1 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Mon, 26 Jan 2026 19:02:27 +0100
+Subject: [PATCH] x509/name_constraints: use actual zeroes in universal exclude
+ IP NC
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/0b2377dfccd99be641bf3f1a0de9f0dc8dc0d4b1]
+CVE: CVE-2025-14831
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/x509/name_constraints.c | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/lib/x509/name_constraints.c b/lib/x509/name_constraints.c
+index 2be6a2aaa6..d07482e3c9 100644
+--- a/lib/x509/name_constraints.c
++++ b/lib/x509/name_constraints.c
+@@ -61,7 +61,7 @@ struct gnutls_name_constraints_st {
+ 
+ static struct name_constraints_node_st *
+ name_constraints_node_new(gnutls_x509_name_constraints_t nc, unsigned type,
+-			  unsigned char *data, unsigned int size);
++			  const unsigned char *data, unsigned int size);
+ 
+ static int
+ name_constraints_node_list_add(struct name_constraints_node_list_st *list,
+@@ -285,7 +285,7 @@ static void name_constraints_node_free(struct name_constraints_node_st *node)
+  -*/
+ static struct name_constraints_node_st *
+ name_constraints_node_new(gnutls_x509_name_constraints_t nc, unsigned type,
+-			  unsigned char *data, unsigned int size)
++			  const unsigned char *data, unsigned int size)
+ {
+ 	struct name_constraints_node_st *tmp;
+ 	int ret;
+@@ -339,6 +339,7 @@ static int name_constraints_node_list_intersect(
+ 	struct name_constraints_node_list_st removed = { .data = NULL,
+ 							 .size = 0,
+ 							 .capacity = 0 };
++	static const unsigned char universal_ip[32] = { 0 };
+ 
+ 	/* temporary array to see, if we need to add universal excluded constraints
+ 	 * (see phase 3 for details)
+@@ -474,7 +475,7 @@ static int name_constraints_node_list_intersect(
+ 		case GNUTLS_SAN_IPADDRESS:
+ 			// add universal restricted range for IPv4
+ 			tmp = name_constraints_node_new(
+-				nc, GNUTLS_SAN_IPADDRESS, NULL, 8);
++				nc, GNUTLS_SAN_IPADDRESS, universal_ip, 8);
+ 			if (tmp == NULL) {
+ 				gnutls_assert();
+ 				ret = GNUTLS_E_MEMORY_ERROR;
+@@ -487,7 +488,7 @@ static int name_constraints_node_list_intersect(
+ 			}
+ 			// add universal restricted range for IPv6
+ 			tmp = name_constraints_node_new(
+-				nc, GNUTLS_SAN_IPADDRESS, NULL, 32);
++				nc, GNUTLS_SAN_IPADDRESS, universal_ip, 32);
+ 			if (tmp == NULL) {
+ 				gnutls_assert();
+ 				ret = GNUTLS_E_MEMORY_ERROR;
+-- 
+GitLab
+
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-3.patch b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-3.patch
new file mode 100644
index 00000000000..0d340325541
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-3.patch
@@ -0,0 +1,30 @@
+From 85d6348a30c74d4ee3710e0f4652f634eaad6914 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Mon, 26 Jan 2026 19:10:58 +0100
+Subject: [PATCH] tests/name-constraints-ip: stop swallowing errors...
+
+... now when it started to pass
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/85d6348a30c74d4ee3710e0f4652f634eaad6914]
+CVE: CVE-2025-14831
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ tests/name-constraints-ip.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/name-constraints-ip.c b/tests/name-constraints-ip.c
+index 7a196088dc..a0cf172b7f 100644
+--- a/tests/name-constraints-ip.c
++++ b/tests/name-constraints-ip.c
+@@ -772,5 +772,5 @@ int main(int argc, char **argv)
+ 		cmocka_unit_test_setup_teardown(
+ 			check_ipv4v6_single_constraint_each, setup, teardown)
+ 	};
+-	cmocka_run_group_tests(tests, NULL, NULL);
++	return cmocka_run_group_tests(tests, NULL, NULL);
+ }
+-- 
+GitLab
+
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-4.patch b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-4.patch
new file mode 100644
index 00000000000..ed4a7da3c7a
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-4.patch
@@ -0,0 +1,45 @@
+From c28475413f82e1f34295d5c039f0c0a4ca2ee526 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Mon, 26 Jan 2026 20:14:33 +0100
+Subject: [PATCH] x509/name_constraints: reject some malformed domain names
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/c28475413f82e1f34295d5c039f0c0a4ca2ee526]
+CVE: CVE-2025-14831
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/x509/name_constraints.c | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/lib/x509/name_constraints.c b/lib/x509/name_constraints.c
+index d07482e3c9..9783d92851 100644
+--- a/lib/x509/name_constraints.c
++++ b/lib/x509/name_constraints.c
+@@ -159,6 +159,23 @@ static int validate_name_constraints_node(gnutls_x509_subject_alt_name_t type,
+ 			return gnutls_assert_val(GNUTLS_E_MALFORMED_CIDR);
+ 	}
+ 
++	/* Validate DNS names and email addresses for malformed input */
++	if (type == GNUTLS_SAN_DNSNAME || type == GNUTLS_SAN_RFC822NAME) {
++		unsigned int i;
++		if (name->size == 0)
++			return GNUTLS_E_SUCCESS;
++
++		/* reject names with consecutive dots... */
++		for (i = 0; i + 1 < name->size; i++) {
++			if (name->data[i] == '.' && name->data[i + 1] == '.')
++				return gnutls_assert_val(
++					GNUTLS_E_ILLEGAL_PARAMETER);
++		}
++		/* ... or names consisting exclusively of dots */
++		if (name->size == 1 && name->data[0] == '.')
++			return gnutls_assert_val(GNUTLS_E_ILLEGAL_PARAMETER);
++	}
++
+ 	return GNUTLS_E_SUCCESS;
+ }
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-5.patch b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-5.patch
new file mode 100644
index 00000000000..514ee3c70fc
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-5.patch
@@ -0,0 +1,205 @@
+From 6db7da7fcfe230f445b1edbb56e2a8346120c891 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Thu, 5 Feb 2026 13:22:10 +0100
+Subject: [PATCH] x509/name_constraints: name_constraints_node_add_{new,copy}
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/6db7da7fcfe230f445b1edbb56e2a8346120c891]
+CVE: CVE-2025-14831
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/x509/name_constraints.c | 112 ++++++++++++++++--------------------
+ 1 file changed, 51 insertions(+), 61 deletions(-)
+
+diff --git a/lib/x509/name_constraints.c b/lib/x509/name_constraints.c
+index 9783d92851..81035eef8f 100644
+--- a/lib/x509/name_constraints.c
++++ b/lib/x509/name_constraints.c
+@@ -86,6 +86,38 @@ name_constraints_node_list_add(struct name_constraints_node_list_st *list,
+ 	return 0;
+ }
+ 
++static int
++name_constraints_node_add_new(gnutls_x509_name_constraints_t nc,
++			      struct name_constraints_node_list_st *list,
++			      unsigned type, const unsigned char *data,
++			      unsigned int size)
++{
++	struct name_constraints_node_st *node;
++	int ret;
++	node = name_constraints_node_new(nc, type, data, size);
++	if (node == NULL) {
++		gnutls_assert();
++		return GNUTLS_E_MEMORY_ERROR;
++	}
++	ret = name_constraints_node_list_add(list, node);
++	if (ret < 0) {
++		gnutls_assert();
++		return ret;
++	}
++	return GNUTLS_E_SUCCESS;
++}
++
++static int
++name_constraints_node_add_copy(gnutls_x509_name_constraints_t nc,
++			       struct name_constraints_node_list_st *dest,
++			       const struct name_constraints_node_st *src)
++{
++	if (!src)
++		return gnutls_assert_val(GNUTLS_E_INTERNAL_ERROR);
++	return name_constraints_node_add_new(nc, dest, src->type,
++					     src->name.data, src->name.size);
++}
++
+ // for documentation see the implementation
+ static int name_constraints_intersect_nodes(
+ 	gnutls_x509_name_constraints_t nc,
+@@ -188,7 +220,6 @@ static int extract_name_constraints(gnutls_x509_name_constraints_t nc,
+ 	unsigned indx;
+ 	gnutls_datum_t tmp = { NULL, 0 };
+ 	unsigned int type;
+-	struct name_constraints_node_st *node;
+ 
+ 	for (indx = 1;; indx++) {
+ 		snprintf(tmpstr, sizeof(tmpstr), "%s.?%u.base", vstr, indx);
+@@ -231,15 +262,9 @@ static int extract_name_constraints(gnutls_x509_name_constraints_t nc,
+ 			goto cleanup;
+ 		}
+ 
+-		node = name_constraints_node_new(nc, type, tmp.data, tmp.size);
++		ret = name_constraints_node_add_new(nc, nodes, type, tmp.data,
++						    tmp.size);
+ 		_gnutls_free_datum(&tmp);
+-		if (node == NULL) {
+-			gnutls_assert();
+-			ret = GNUTLS_E_MEMORY_ERROR;
+-			goto cleanup;
+-		}
+-
+-		ret = name_constraints_node_list_add(nodes, node);
+ 		if (ret < 0) {
+ 			gnutls_assert();
+ 			goto cleanup;
+@@ -462,14 +487,7 @@ static int name_constraints_node_list_intersect(
+ 		// Beware: also copies nodes other than DNS, email, IP,
+ 		//       since their counterpart may have been moved in phase 1.
+ 		if (!used) {
+-			tmp = name_constraints_node_new(
+-				nc, t2->type, t2->name.data, t2->name.size);
+-			if (tmp == NULL) {
+-				gnutls_assert();
+-				ret = GNUTLS_E_MEMORY_ERROR;
+-				goto cleanup;
+-			}
+-			ret = name_constraints_node_list_add(permitted, tmp);
++			ret = name_constraints_node_add_copy(nc, permitted, t2);
+ 			if (ret < 0) {
+ 				gnutls_assert();
+ 				goto cleanup;
+@@ -491,27 +509,17 @@ static int name_constraints_node_list_intersect(
+ 		switch (type) {
+ 		case GNUTLS_SAN_IPADDRESS:
+ 			// add universal restricted range for IPv4
+-			tmp = name_constraints_node_new(
+-				nc, GNUTLS_SAN_IPADDRESS, universal_ip, 8);
+-			if (tmp == NULL) {
+-				gnutls_assert();
+-				ret = GNUTLS_E_MEMORY_ERROR;
+-				goto cleanup;
+-			}
+-			ret = name_constraints_node_list_add(excluded, tmp);
++			ret = name_constraints_node_add_new(
++				nc, excluded, GNUTLS_SAN_IPADDRESS,
++				universal_ip, 8);
+ 			if (ret < 0) {
+ 				gnutls_assert();
+ 				goto cleanup;
+ 			}
+ 			// add universal restricted range for IPv6
+-			tmp = name_constraints_node_new(
+-				nc, GNUTLS_SAN_IPADDRESS, universal_ip, 32);
+-			if (tmp == NULL) {
+-				gnutls_assert();
+-				ret = GNUTLS_E_MEMORY_ERROR;
+-				goto cleanup;
+-			}
+-			ret = name_constraints_node_list_add(excluded, tmp);
++			ret = name_constraints_node_add_new(
++				nc, excluded, GNUTLS_SAN_IPADDRESS,
++				universal_ip, 32);
+ 			if (ret < 0) {
+ 				gnutls_assert();
+ 				goto cleanup;
+@@ -519,13 +527,8 @@ static int name_constraints_node_list_intersect(
+ 			break;
+ 		case GNUTLS_SAN_DNSNAME:
+ 		case GNUTLS_SAN_RFC822NAME:
+-			tmp = name_constraints_node_new(nc, type, NULL, 0);
+-			if (tmp == NULL) {
+-				gnutls_assert();
+-				ret = GNUTLS_E_MEMORY_ERROR;
+-				goto cleanup;
+-			}
+-			ret = name_constraints_node_list_add(excluded, tmp);
++			ret = name_constraints_node_add_new(nc, excluded, type,
++							    NULL, 0);
+ 			if (ret < 0) {
+ 				gnutls_assert();
+ 				goto cleanup;
+@@ -547,20 +550,13 @@ static int name_constraints_node_list_concat(
+ 	struct name_constraints_node_list_st *nodes,
+ 	const struct name_constraints_node_list_st *nodes2)
+ {
+-	for (size_t i = 0; i < nodes2->size; i++) {
+-		const struct name_constraints_node_st *node = nodes2->data[i];
+-		struct name_constraints_node_st *tmp;
+-		int ret;
++	int ret;
+ 
+-		tmp = name_constraints_node_new(nc, node->type, node->name.data,
+-						node->name.size);
+-		if (tmp == NULL) {
+-			return gnutls_assert_val(GNUTLS_E_MEMORY_ERROR);
+-		}
+-		ret = name_constraints_node_list_add(nodes, tmp);
++	for (size_t i = 0; i < nodes2->size; i++) {
++		ret = name_constraints_node_add_copy(nc, nodes,
++						     nodes2->data[i]);
+ 		if (ret < 0) {
+-			name_constraints_node_free(tmp);
+-			return gnutls_assert_val(GNUTLS_E_MEMORY_ERROR);
++			return gnutls_assert_val(ret);
+ 		}
+ 	}
+ 
+@@ -690,7 +686,6 @@ static int name_constraints_add(gnutls_x509_name_constraints_t nc,
+ 				gnutls_x509_subject_alt_name_t type,
+ 				const gnutls_datum_t *name, unsigned permitted)
+ {
+-	struct name_constraints_node_st *tmp;
+ 	struct name_constraints_node_list_st *nodes;
+ 	int ret;
+ 
+@@ -700,15 +695,10 @@ static int name_constraints_add(gnutls_x509_name_constraints_t nc,
+ 
+ 	nodes = permitted ? &nc->permitted : &nc->excluded;
+ 
+-	tmp = name_constraints_node_new(nc, type, name->data, name->size);
+-	if (tmp == NULL)
+-		return gnutls_assert_val(GNUTLS_E_MEMORY_ERROR);
+-
+-	ret = name_constraints_node_list_add(nodes, tmp);
+-	if (ret < 0) {
+-		name_constraints_node_free(tmp);
++	ret = name_constraints_node_add_new(nc, nodes, type, name->data,
++					    name->size);
++	if (ret < 0)
+ 		return gnutls_assert_val(ret);
+-	}
+ 
+ 	return 0;
+ }
+-- 
+GitLab
+
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-6.patch b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-6.patch
new file mode 100644
index 00000000000..6970c6ccfe4
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-6.patch
@@ -0,0 +1,505 @@
+From 094accd3ebec17ead6c391757eaa18763b72d83f Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Mon, 26 Jan 2026 20:16:36 +0100
+Subject: [PATCH] x509/name_constraints: introduce a rich comparator
+
+These are preparatory changes before implementing N * log N intersection
+over sorted lists of constraints.
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/094accd3ebec17ead6c391757eaa18763b72d83f]
+CVE: CVE-2025-14831
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/x509/name_constraints.c | 411 ++++++++++++++++++++++++++++--------
+ 1 file changed, 320 insertions(+), 91 deletions(-)
+
+diff --git a/lib/x509/name_constraints.c b/lib/x509/name_constraints.c
+index 81035eef8f..b5d732d0c5 100644
+--- a/lib/x509/name_constraints.c
++++ b/lib/x509/name_constraints.c
+@@ -39,6 +39,9 @@
+ #include "ip.h"
+ #include "ip-in-cidr.h"
+ #include "intprops.h"
++#include "minmax.h"
++
++#include <string.h>
+ 
+ #define MAX_NC_CHECKS (1 << 20)
+ 
+@@ -63,6 +66,282 @@ static struct name_constraints_node_st *
+ name_constraints_node_new(gnutls_x509_name_constraints_t nc, unsigned type,
+ 			  const unsigned char *data, unsigned int size);
+ 
++/* An enum for "rich" comparisons that not only let us sort name constraints,
++ * children-before-parent, but also subsume them during intersection. */
++enum name_constraint_relation {
++	NC_SORTS_BEFORE = -2, /* unrelated constraints */
++	NC_INCLUDED_BY = -1, /* nc1 is included by nc2 / children sort first */
++	NC_EQUAL = 0, /* exact match */
++	NC_INCLUDES = 1, /* nc1 includes nc2 / parents sort last */
++	NC_SORTS_AFTER = 2 /* unrelated constraints */
++};
++
++/* A helper to compare just a pair of strings with this rich comparison */
++static enum name_constraint_relation
++compare_strings(const void *n1, size_t n1_len, const void *n2, size_t n2_len)
++{
++	int r = memcmp(n1, n2, MIN(n1_len, n2_len));
++	if (r < 0)
++		return NC_SORTS_BEFORE;
++	if (r > 0)
++		return NC_SORTS_AFTER;
++	if (n1_len < n2_len)
++		return NC_SORTS_BEFORE;
++	if (n1_len > n2_len)
++		return NC_SORTS_AFTER;
++	return NC_EQUAL;
++}
++
++/* Rich-compare DNS names. Example order/relationships:
++ * z.x.a INCLUDED_BY x.a BEFORE y.a INCLUDED_BY a BEFORE x.b BEFORE y.b */
++static enum name_constraint_relation compare_dns_names(const gnutls_datum_t *n1,
++						       const gnutls_datum_t *n2)
++{
++	enum name_constraint_relation rel;
++	unsigned int i, j, i_end, j_end;
++
++	/* start from the end of each name */
++	i = i_end = n1->size;
++	j = j_end = n2->size;
++
++	/* skip the trailing dots for the comparison */
++	while (i && n1->data[i - 1] == '.')
++		i_end = i = i - 1;
++	while (j && n2->data[j - 1] == '.')
++		j_end = j = j - 1;
++
++	while (1) {
++		// rewind back to beginning or an after-dot position
++		while (i && n1->data[i - 1] != '.')
++			i--;
++		while (j && n2->data[j - 1] != '.')
++			j--;
++
++		rel = compare_strings(&n1->data[i], i_end - i, &n2->data[j],
++				      j_end - j);
++		if (rel == NC_SORTS_BEFORE) /* x.a BEFORE y.a */
++			return NC_SORTS_BEFORE;
++		if (rel == NC_SORTS_AFTER) /* y.a AFTER x.a */
++			return NC_SORTS_AFTER;
++		if (!i && j) /* x.a INCLUDES z.x.a */
++			return NC_INCLUDES;
++		if (i && !j) /* z.x.a INCLUDED_BY x.a */
++			return NC_INCLUDED_BY;
++
++		if (!i && !j) /* r == 0, we ran out of components to compare */
++			return NC_EQUAL;
++		/* r == 0, i && j: step back past a dot and keep comparing */
++		i_end = i = i - 1;
++		j_end = j = j - 1;
++
++		/* support for non-standard ".gr INCLUDES example.gr" [1] */
++		if (!i && j) /* .a INCLUDES x.a */
++			return NC_INCLUDES;
++		if (i && !j) /* x.a INCLUDED_BY .a */
++			return NC_INCLUDED_BY;
++	}
++}
++/* [1] https://mailarchive.ietf.org/arch/msg/saag/Bw6PtreW0G7aEG7SikfzKHES4VA */
++
++/* Rich-compare email name constraints. Example order/relationships:
++ * z@x.a INCLUDED_BY x.a BEFORE y.a INCLUDED_BY a BEFORE x@b BEFORE y@b */
++static enum name_constraint_relation compare_emails(const gnutls_datum_t *n1,
++						    const gnutls_datum_t *n2)
++{
++	enum name_constraint_relation domains_rel;
++	unsigned int i, j, i_end, j_end;
++	gnutls_datum_t d1, d2; /* borrow from n1 and n2 */
++
++	/* start from the end of each name */
++	i = i_end = n1->size;
++	j = j_end = n2->size;
++
++	/* rewind to @s to look for domains */
++	while (i && n1->data[i - 1] != '@')
++		i--;
++	d1.size = i_end - i;
++	d1.data = &n1->data[i];
++	while (j && n2->data[j - 1] != '@')
++		j--;
++	d2.size = j_end - j;
++	d2.data = &n2->data[j];
++
++	domains_rel = compare_dns_names(&d1, &d2);
++
++	/* email constraint semantics differ from DNS
++	 * DNS: x.a INCLUDED_BY a
++	 * Email: x.a INCLUDED_BY .a BEFORE a */
++	if (domains_rel == NC_INCLUDED_BY || domains_rel == NC_INCLUDES) {
++		bool d1_has_dot = (d1.size > 0 && d1.data[0] == '.');
++		bool d2_has_dot = (d2.size > 0 && d2.data[0] == '.');
++		/* a constraint without a dot is exact, excluding subdomains */
++		if (!d2_has_dot && domains_rel == NC_INCLUDED_BY)
++			domains_rel = NC_SORTS_BEFORE; /* x.a BEFORE a */
++		if (!d1_has_dot && domains_rel == NC_INCLUDES)
++			domains_rel = NC_SORTS_AFTER; /* a AFTER x.a */
++	}
++
++	if (!i && !j) { /* both are domains-only */
++		return domains_rel;
++	} else if (i && !j) { /* n1 is email, n2 is domain */
++		switch (domains_rel) {
++		case NC_SORTS_AFTER:
++			return NC_SORTS_AFTER;
++		case NC_SORTS_BEFORE:
++			return NC_SORTS_BEFORE;
++		case NC_INCLUDES: /* n2 is more specific, a@x.a AFTER z.x.a */
++			return NC_SORTS_AFTER;
++		case NC_EQUAL: /* subdomains match, z@x.a INCLUDED_BY x.a */
++		case NC_INCLUDED_BY: /* n1 is more specific */
++			return NC_INCLUDED_BY;
++		}
++	} else if (!i && j) { /* n1 is domain, n2 is email */
++		switch (domains_rel) {
++		case NC_SORTS_AFTER:
++			return NC_SORTS_AFTER;
++		case NC_SORTS_BEFORE:
++			return NC_SORTS_BEFORE;
++		case NC_INCLUDES: /* n2 is more specific, a AFTER z@x.a */
++			return NC_SORTS_AFTER;
++		case NC_EQUAL: /* subdomains match, x.a INCLUDES z@x.a */
++			return NC_INCLUDES;
++		case NC_INCLUDED_BY: /* n1 is more specific, x.a BEFORE z@a */
++			return NC_SORTS_BEFORE;
++		}
++	} else if (i && j) { /* both are emails */
++		switch (domains_rel) {
++		case NC_SORTS_AFTER:
++			return NC_SORTS_AFTER;
++		case NC_SORTS_BEFORE:
++			return NC_SORTS_BEFORE;
++		case NC_INCLUDES: // n2 is more specific
++			return NC_SORTS_AFTER;
++		case NC_INCLUDED_BY: // n1 is more specific
++			return NC_SORTS_BEFORE;
++		case NC_EQUAL: // only case when we need to look before the @
++			break; // see below for readability
++		}
++	}
++
++	/* i && j, both are emails, domain names match, compare up to @ */
++	return compare_strings(n1->data, i - 1, n2->data, j - 1);
++}
++
++/* Rich-compare IP address constraints. Example order/relationships:
++ * 10.0.0.0/24 INCLUDED_BY 10.0.0.0/16 BEFORE 1::1/128 INCLUDED_BY 1::1/127 */
++static enum name_constraint_relation compare_ip_ncs(const gnutls_datum_t *n1,
++						    const gnutls_datum_t *n2)
++{
++	unsigned int len, i;
++	int r;
++	const unsigned char *ip1, *ip2, *mask1, *mask2;
++	unsigned char masked11[16], masked22[16], masked12[16], masked21[16];
++
++	if (n1->size < n2->size)
++		return NC_SORTS_BEFORE;
++	if (n1->size > n2->size)
++		return NC_SORTS_AFTER;
++	len = n1->size / 2; /* 4 for IPv4, 16 for IPv6 */
++
++	/* data is a concatenation of prefix and mask */
++	ip1 = n1->data;
++	ip2 = n2->data;
++	mask1 = n1->data + len;
++	mask2 = n2->data + len;
++	for (i = 0; i < len; i++) {
++		masked11[i] = ip1[i] & mask1[i];
++		masked22[i] = ip2[i] & mask2[i];
++		masked12[i] = ip1[i] & mask2[i];
++		masked21[i] = ip2[i] & mask1[i];
++	}
++
++	r = memcmp(mask1, mask2, len);
++	if (r < 0 && !memcmp(masked11, masked21, len)) /* prefix1 < prefix2 */
++		return NC_INCLUDES; /* ip1 & mask1 == ip2 & mask1 */
++	if (r > 0 && !memcmp(masked12, masked22, len)) /* prefix1 > prefix2 */
++		return NC_INCLUDED_BY; /* ip1 & mask2 == ip2 & mask2 */
++
++	r = memcmp(masked11, masked22, len);
++	if (r < 0)
++		return NC_SORTS_BEFORE;
++	else if (r > 0)
++		return NC_SORTS_AFTER;
++	return NC_EQUAL;
++}
++
++static inline bool is_supported_type(unsigned type)
++{
++	return type == GNUTLS_SAN_DNSNAME || type == GNUTLS_SAN_RFC822NAME ||
++	       type == GNUTLS_SAN_IPADDRESS;
++}
++
++/* Universal comparison for name constraint nodes.
++ * Unsupported types sort before supported types to allow early handling.
++ * NULL represents end-of-list and sorts after everything else. */
++static enum name_constraint_relation
++compare_name_constraint_nodes(const struct name_constraints_node_st *n1,
++			      const struct name_constraints_node_st *n2)
++{
++	bool n1_supported, n2_supported;
++
++	if (!n1 && !n2)
++		return NC_EQUAL;
++	if (!n1)
++		return NC_SORTS_AFTER;
++	if (!n2)
++		return NC_SORTS_BEFORE;
++
++	n1_supported = is_supported_type(n1->type);
++	n2_supported = is_supported_type(n2->type);
++
++	/* unsupported types bubble up (sort first). intersect relies on this */
++	if (!n1_supported && n2_supported)
++		return NC_SORTS_BEFORE;
++	if (n1_supported && !n2_supported)
++		return NC_SORTS_AFTER;
++
++	/* next, sort by type */
++	if (n1->type < n2->type)
++		return NC_SORTS_BEFORE;
++	if (n1->type > n2->type)
++		return NC_SORTS_AFTER;
++
++	/* now look deeper */
++	switch (n1->type) {
++	case GNUTLS_SAN_DNSNAME:
++		return compare_dns_names(&n1->name, &n2->name);
++	case GNUTLS_SAN_RFC822NAME:
++		return compare_emails(&n1->name, &n2->name);
++	case GNUTLS_SAN_IPADDRESS:
++		return compare_ip_ncs(&n1->name, &n2->name);
++	default:
++		/* unsupported types: stable lexicographic order */
++		return compare_strings(n1->name.data, n1->name.size,
++				       n2->name.data, n2->name.size);
++	}
++}
++
++/* qsort-compatible wrapper */
++static int compare_name_constraint_nodes_qsort(const void *a, const void *b)
++{
++	const struct name_constraints_node_st *const *n1 = a;
++	const struct name_constraints_node_st *const *n2 = b;
++	enum name_constraint_relation rel;
++
++	rel = compare_name_constraint_nodes(*n1, *n2);
++	switch (rel) {
++	case NC_SORTS_BEFORE:
++	case NC_INCLUDED_BY:
++		return -1;
++	case NC_SORTS_AFTER:
++	case NC_INCLUDES:
++		return 1;
++	case NC_EQUAL:
++	default:
++		return 0;
++	}
++}
++
+ static int
+ name_constraints_node_list_add(struct name_constraints_node_list_st *list,
+ 			       struct name_constraints_node_st *node)
+@@ -420,9 +699,7 @@ static int name_constraints_node_list_intersect(
+ 			}
+ 		}
+ 
+-		if (found != NULL && (t->type == GNUTLS_SAN_DNSNAME ||
+-				      t->type == GNUTLS_SAN_RFC822NAME ||
+-				      t->type == GNUTLS_SAN_IPADDRESS)) {
++		if (found != NULL && is_supported_type(t->type)) {
+ 			/* move node from PERMITTED to REMOVED */
+ 			ret = name_constraints_node_list_add(&removed, t);
+ 			if (ret < 0) {
+@@ -827,61 +1104,14 @@ cleanup:
+ 	return ret;
+ }
+ 
+-static unsigned ends_with(const gnutls_datum_t *str,
+-			  const gnutls_datum_t *suffix)
+-{
+-	unsigned char *tree;
+-	unsigned int treelen;
+-
+-	if (suffix->size >= str->size)
+-		return 0;
+-
+-	tree = suffix->data;
+-	treelen = suffix->size;
+-	if ((treelen > 0) && (tree[0] == '.')) {
+-		tree++;
+-		treelen--;
+-	}
+-
+-	if (memcmp(str->data + str->size - treelen, tree, treelen) == 0 &&
+-	    str->data[str->size - treelen - 1] == '.')
+-		return 1; /* match */
+-
+-	return 0;
+-}
+-
+-static unsigned email_ends_with(const gnutls_datum_t *str,
+-				const gnutls_datum_t *suffix)
+-{
+-	if (suffix->size >= str->size) {
+-		return 0;
+-	}
+-
+-	if (suffix->size > 0 && memcmp(str->data + str->size - suffix->size,
+-				       suffix->data, suffix->size) != 0) {
+-		return 0;
+-	}
+-
+-	if (suffix->size > 1 && suffix->data[0] == '.') { /* .domain.com */
+-		return 1; /* match */
+-	} else if (str->data[str->size - suffix->size - 1] == '@') {
+-		return 1; /* match */
+-	}
+-
+-	return 0;
+-}
+-
+ static unsigned dnsname_matches(const gnutls_datum_t *name,
+ 				const gnutls_datum_t *suffix)
+ {
+ 	_gnutls_hard_log("matching %.*s with DNS constraint %.*s\n", name->size,
+ 			 name->data, suffix->size, suffix->data);
+ 
+-	if (suffix->size == name->size &&
+-	    memcmp(suffix->data, name->data, suffix->size) == 0)
+-		return 1; /* match */
+-
+-	return ends_with(name, suffix);
++	enum name_constraint_relation rel = compare_dns_names(name, suffix);
++	return rel == NC_EQUAL || rel == NC_INCLUDED_BY;
+ }
+ 
+ static unsigned email_matches(const gnutls_datum_t *name,
+@@ -890,11 +1120,8 @@ static unsigned email_matches(const gnutls_datum_t *name,
+ 	_gnutls_hard_log("matching %.*s with e-mail constraint %.*s\n",
+ 			 name->size, name->data, suffix->size, suffix->data);
+ 
+-	if (suffix->size == name->size &&
+-	    memcmp(suffix->data, name->data, suffix->size) == 0)
+-		return 1; /* match */
+-
+-	return email_ends_with(name, suffix);
++	enum name_constraint_relation rel = compare_emails(name, suffix);
++	return rel == NC_EQUAL || rel == NC_INCLUDED_BY;
+ }
+ 
+ /*-
+@@ -918,8 +1145,7 @@ static int name_constraints_intersect_nodes(
+ 	// presume empty intersection
+ 	struct name_constraints_node_st *intersection = NULL;
+ 	const struct name_constraints_node_st *to_copy = NULL;
+-	unsigned iplength = 0;
+-	unsigned byte;
++	enum name_constraint_relation rel;
+ 
+ 	*_intersection = NULL;
+ 
+@@ -928,32 +1154,49 @@ static int name_constraints_intersect_nodes(
+ 	}
+ 	switch (node1->type) {
+ 	case GNUTLS_SAN_DNSNAME:
+-		if (!dnsname_matches(&node2->name, &node1->name))
++		rel = compare_dns_names(&node1->name, &node2->name);
++		switch (rel) {
++		case NC_EQUAL: // equal means doesn't matter which one
++		case NC_INCLUDES: // node2 is more specific
++			to_copy = node2;
++			break;
++		case NC_INCLUDED_BY: // node1 is more specific
++			to_copy = node1;
++			break;
++		case NC_SORTS_BEFORE: // no intersection
++		case NC_SORTS_AFTER: // no intersection
+ 			return GNUTLS_E_SUCCESS;
+-		to_copy = node2;
++		}
+ 		break;
+ 	case GNUTLS_SAN_RFC822NAME:
+-		if (!email_matches(&node2->name, &node1->name))
++		rel = compare_emails(&node1->name, &node2->name);
++		switch (rel) {
++		case NC_EQUAL: // equal means doesn't matter which one
++		case NC_INCLUDES: // node2 is more specific
++			to_copy = node2;
++			break;
++		case NC_INCLUDED_BY: // node1 is more specific
++			to_copy = node1;
++			break;
++		case NC_SORTS_BEFORE: // no intersection
++		case NC_SORTS_AFTER: // no intersection
+ 			return GNUTLS_E_SUCCESS;
+-		to_copy = node2;
++		}
+ 		break;
+ 	case GNUTLS_SAN_IPADDRESS:
+-		if (node1->name.size != node2->name.size)
++		rel = compare_ip_ncs(&node1->name, &node2->name);
++		switch (rel) {
++		case NC_EQUAL: // equal means doesn't matter which one
++		case NC_INCLUDES: // node2 is more specific
++			to_copy = node2;
++			break;
++		case NC_INCLUDED_BY: // node1 is more specific
++			to_copy = node1;
++			break;
++		case NC_SORTS_BEFORE: // no intersection
++		case NC_SORTS_AFTER: // no intersection
+ 			return GNUTLS_E_SUCCESS;
+-		iplength = node1->name.size / 2;
+-		for (byte = 0; byte < iplength; byte++) {
+-			if (((node1->name.data[byte] ^
+-			      node2->name.data[byte]) // XOR of addresses
+-			     & node1->name.data[byte +
+-						iplength] // AND mask from nc1
+-			     & node2->name.data[byte +
+-						iplength]) // AND mask from nc2
+-			    != 0) {
+-				// CIDRS do not intersect
+-				return GNUTLS_E_SUCCESS;
+-			}
+ 		}
+-		to_copy = node2;
+ 		break;
+ 	default:
+ 		// for other types, we don't know how to do the intersection, assume empty
+@@ -970,20 +1213,6 @@ static int name_constraints_intersect_nodes(
+ 		intersection = *_intersection;
+ 
+ 		assert(intersection->name.data != NULL);
+-
+-		if (intersection->type == GNUTLS_SAN_IPADDRESS) {
+-			// make sure both IP addresses are correctly masked
+-			_gnutls_mask_ip(intersection->name.data,
+-					intersection->name.data + iplength,
+-					iplength);
+-			_gnutls_mask_ip(node1->name.data,
+-					node1->name.data + iplength, iplength);
+-			// update intersection, if necessary (we already know one is subset of other)
+-			for (byte = 0; byte < 2 * iplength; byte++) {
+-				intersection->name.data[byte] |=
+-					node1->name.data[byte];
+-			}
+-		}
+ 	}
+ 
+ 	return GNUTLS_E_SUCCESS;
+-- 
+GitLab
+
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-7.patch b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-7.patch
new file mode 100644
index 00000000000..8dfda528619
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-7.patch
@@ -0,0 +1,124 @@
+From bc62fbb946085527b4b1c02f337dd10c68c54690 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Wed, 4 Feb 2026 09:09:46 +0100
+Subject: [PATCH] x509/name_constraints: add sorted_view in preparation...
+
+... for actually using it later for performance gains.
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/bc62fbb946085527b4b1c02f337dd10c68c54690]
+CVE: CVE-2025-14831
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/x509/name_constraints.c | 62 ++++++++++++++++++++++++++++++-------
+ 1 file changed, 51 insertions(+), 11 deletions(-)
+
+diff --git a/lib/x509/name_constraints.c b/lib/x509/name_constraints.c
+index b5d732d0c5..41f30d13b9 100644
+--- a/lib/x509/name_constraints.c
++++ b/lib/x509/name_constraints.c
+@@ -54,6 +54,9 @@ struct name_constraints_node_list_st {
+ 	struct name_constraints_node_st **data;
+ 	size_t size;
+ 	size_t capacity;
++	/* sorted-on-demand view, valid only when dirty == false */
++	bool dirty;
++	struct name_constraints_node_st **sorted_view;
+ };
+ 
+ struct gnutls_name_constraints_st {
+@@ -342,6 +345,37 @@ static int compare_name_constraint_nodes_qsort(const void *a, const void *b)
+ 	}
+ }
+ 
++/* Bring the sorted view up to date with the list data; clear the dirty flag. */
++static int ensure_sorted(struct name_constraints_node_list_st *list)
++{
++	struct name_constraints_node_st **new_data;
++
++	if (!list->dirty)
++		return GNUTLS_E_SUCCESS;
++	if (!list->size) {
++		list->dirty = false;
++		return GNUTLS_E_SUCCESS;
++	}
++
++	/* reallocate sorted view to match current size */
++	new_data =
++		_gnutls_reallocarray(list->sorted_view, list->size,
++				     sizeof(struct name_constraints_node_st *));
++	if (!new_data)
++		return gnutls_assert_val(GNUTLS_E_MEMORY_ERROR);
++	list->sorted_view = new_data;
++
++	/* copy pointers and sort in-place */
++	memcpy(list->sorted_view, list->data,
++	       list->size * sizeof(struct name_constraints_node_st *));
++	qsort(list->sorted_view, list->size,
++	      sizeof(struct name_constraints_node_st *),
++	      compare_name_constraint_nodes_qsort);
++
++	list->dirty = false;
++	return GNUTLS_E_SUCCESS;
++}
++
+ static int
+ name_constraints_node_list_add(struct name_constraints_node_list_st *list,
+ 			       struct name_constraints_node_st *node)
+@@ -361,10 +395,23 @@ name_constraints_node_list_add(struct name_constraints_node_list_st *list,
+ 		list->capacity = new_capacity;
+ 		list->data = new_data;
+ 	}
++	list->dirty = true;
+ 	list->data[list->size++] = node;
+ 	return 0;
+ }
+ 
++static void
++name_constraints_node_list_clear(struct name_constraints_node_list_st *list)
++{
++	gnutls_free(list->data);
++	gnutls_free(list->sorted_view);
++	list->data = NULL;
++	list->sorted_view = NULL;
++	list->capacity = 0;
++	list->size = 0;
++	list->dirty = false;
++}
++
+ static int
+ name_constraints_node_add_new(gnutls_x509_name_constraints_t nc,
+ 			      struct name_constraints_node_list_st *list,
+@@ -711,6 +758,7 @@ static int name_constraints_node_list_intersect(
+ 				permitted->data[i] =
+ 					permitted->data[permitted->size - 1];
+ 			permitted->size--;
++			permitted->dirty = true;
+ 			continue;
+ 		}
+ 		i++;
+@@ -908,17 +956,9 @@ void _gnutls_x509_name_constraints_clear(gnutls_x509_name_constraints_t nc)
+ 		struct name_constraints_node_st *node = nc->nodes.data[i];
+ 		name_constraints_node_free(node);
+ 	}
+-	gnutls_free(nc->nodes.data);
+-	nc->nodes.capacity = 0;
+-	nc->nodes.size = 0;
+-
+-	gnutls_free(nc->permitted.data);
+-	nc->permitted.capacity = 0;
+-	nc->permitted.size = 0;
+-
+-	gnutls_free(nc->excluded.data);
+-	nc->excluded.capacity = 0;
+-	nc->excluded.size = 0;
++	name_constraints_node_list_clear(&nc->nodes);
++	name_constraints_node_list_clear(&nc->permitted);
++	name_constraints_node_list_clear(&nc->excluded);
+ }
+ 
+ /**
+-- 
+GitLab
+
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-8.patch b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-8.patch
new file mode 100644
index 00000000000..28d86ec6273
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-8.patch
@@ -0,0 +1,155 @@
+From 80db5e90fa18d3e34bb91dd027bdf76d31e93dcd Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Wed, 4 Feb 2026 13:30:08 +0100
+Subject: [PATCH] x509/name_constraints: implement
+ name_constraints_node_list_union
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/80db5e90fa18d3e34bb91dd027bdf76d31e93dcd]
+CVE: CVE-2025-14831
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/x509/name_constraints.c | 98 ++++++++++++++++++++++++++++++++-----
+ 1 file changed, 86 insertions(+), 12 deletions(-)
+
+diff --git a/lib/x509/name_constraints.c b/lib/x509/name_constraints.c
+index 41f30d13b9..de20dd8ef4 100644
+--- a/lib/x509/name_constraints.c
++++ b/lib/x509/name_constraints.c
+@@ -41,6 +41,7 @@
+ #include "intprops.h"
+ #include "minmax.h"
+ 
++#include <assert.h>
+ #include <string.h>
+ 
+ #define MAX_NC_CHECKS (1 << 20)
+@@ -870,22 +871,95 @@ cleanup:
+ 	return ret;
+ }
+ 
+-static int name_constraints_node_list_concat(
+-	gnutls_x509_name_constraints_t nc,
+-	struct name_constraints_node_list_st *nodes,
+-	const struct name_constraints_node_list_st *nodes2)
++static int
++name_constraints_node_list_union(gnutls_x509_name_constraints_t nc,
++				 struct name_constraints_node_list_st *nodes,
++				 struct name_constraints_node_list_st *nodes2)
+ {
+ 	int ret;
++	size_t i = 0, j = 0;
++	struct name_constraints_node_st *nc1;
++	const struct name_constraints_node_st *nc2;
++	enum name_constraint_relation rel;
++	struct name_constraints_node_list_st result = { 0 };
++
++	if (nodes2->size == 0) /* nothing to do */
++		return GNUTLS_E_SUCCESS;
++
++	ret = ensure_sorted(nodes);
++	if (ret < 0) {
++		gnutls_assert();
++		goto cleanup;
++	}
++	ret = ensure_sorted(nodes2);
++	if (ret < 0) {
++		gnutls_assert();
++		goto cleanup;
++	}
++
++	/* traverse both lists in a single pass and merge them w/o duplicates */
++	while (i < nodes->size || j < nodes2->size) {
++		nc1 = (i < nodes->size) ? nodes->sorted_view[i] : NULL;
++		nc2 = (j < nodes2->size) ? nodes2->sorted_view[j] : NULL;
+ 
+-	for (size_t i = 0; i < nodes2->size; i++) {
+-		ret = name_constraints_node_add_copy(nc, nodes,
+-						     nodes2->data[i]);
++		rel = compare_name_constraint_nodes(nc1, nc2);
++		switch (rel) {
++		case NC_SORTS_BEFORE:
++			assert(nc1 != NULL); /* comparator-guaranteed */
++			ret = name_constraints_node_list_add(&result, nc1);
++			i++;
++			break;
++		case NC_SORTS_AFTER:
++			assert(nc2 != NULL); /* comparator-guaranteed */
++			ret = name_constraints_node_add_copy(nc, &result, nc2);
++			j++;
++			break;
++		case NC_INCLUDES: /* nc1 is broader, shallow-copy it */
++			assert(nc1 != NULL && nc2 != NULL); /* comparator */
++			ret = name_constraints_node_list_add(&result, nc1);
++			i++;
++			j++;
++			break;
++		case NC_INCLUDED_BY: /* nc2 is broader, deep-copy it */
++			assert(nc1 != NULL && nc2 != NULL); /* comparator */
++			ret = name_constraints_node_add_copy(nc, &result, nc2);
++			i++;
++			j++;
++			break;
++		case NC_EQUAL:
++			assert(nc1 != NULL && nc2 != NULL); /* loop condition */
++			ret = name_constraints_node_list_add(&result, nc1);
++			i++;
++			j++;
++			break;
++		}
+ 		if (ret < 0) {
+-			return gnutls_assert_val(ret);
++			gnutls_assert();
++			goto cleanup;
+ 		}
+ 	}
+ 
+-	return 0;
++	gnutls_free(nodes->data);
++	gnutls_free(nodes->sorted_view);
++	nodes->data = result.data;
++	nodes->sorted_view = NULL;
++	nodes->size = result.size;
++	nodes->capacity = result.capacity;
++	nodes->dirty = true;
++	/* since we know it's sorted, populate sorted_view almost for free */
++	nodes->sorted_view = gnutls_calloc(
++		nodes->size, sizeof(struct name_constraints_node_st *));
++	if (!nodes->sorted_view)
++		return GNUTLS_E_SUCCESS; /* we tried, no harm done */
++	memcpy(nodes->sorted_view, nodes->data,
++	       nodes->size * sizeof(struct name_constraints_node_st *));
++	nodes->dirty = false;
++
++	result.data = NULL;
++	return GNUTLS_E_SUCCESS;
++cleanup:
++	name_constraints_node_list_clear(&result);
++	return gnutls_assert_val(ret);
+ }
+ 
+ /**
+@@ -1026,7 +1100,7 @@ static int name_constraints_add(gnutls_x509_name_constraints_t nc,
+  * @nc2: The name constraints to be merged with
+  *
+  * This function will merge the provided name constraints structures
+- * as per RFC5280 p6.1.4. That is, the excluded constraints will be appended,
++ * as per RFC5280 p6.1.4. That is, the excluded constraints will be unioned,
+  * and permitted will be intersected. The intersection assumes that @nc
+  * is the root CA constraints.
+  *
+@@ -1048,8 +1122,8 @@ int _gnutls_x509_name_constraints_merge(gnutls_x509_name_constraints_t nc,
+ 		return ret;
+ 	}
+ 
+-	ret = name_constraints_node_list_concat(nc, &nc->excluded,
+-						&nc2->excluded);
++	ret = name_constraints_node_list_union(nc, &nc->excluded,
++					       &nc2->excluded);
+ 	if (ret < 0) {
+ 		gnutls_assert();
+ 		return ret;
+-- 
+GitLab
+
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch
new file mode 100644
index 00000000000..ed6be93c54b
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch
@@ -0,0 +1,110 @@
+From d0ac999620c8c0aeb6939e1e92d884ca8e40b759 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Wed, 4 Feb 2026 18:31:37 +0100
+Subject: [PATCH] x509/name_constraints: make types_with_empty_intersection a
+ bitmask
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/d0ac999620c8c0aeb6939e1e92d884ca8e40b759]
+CVE: CVE-2025-14831
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/x509/name_constraints.c | 39 +++++++++++++++++++++++++++----------
+ 1 file changed, 29 insertions(+), 10 deletions(-)
+
+diff --git a/lib/x509/name_constraints.c b/lib/x509/name_constraints.c
+index de20dd8ef4..1d78d1bc50 100644
+--- a/lib/x509/name_constraints.c
++++ b/lib/x509/name_constraints.c
+@@ -275,6 +275,7 @@ static enum name_constraint_relation compare_ip_ncs(const gnutls_datum_t *n1,
+ 
+ static inline bool is_supported_type(unsigned type)
+ {
++	/* all of these should be under GNUTLS_SAN_MAX (intersect bitmasks) */
+ 	return type == GNUTLS_SAN_DNSNAME || type == GNUTLS_SAN_RFC822NAME ||
+ 	       type == GNUTLS_SAN_IPADDRESS;
+ }
+@@ -683,6 +684,21 @@ name_constraints_node_new(gnutls_x509_name_constraints_t nc, unsigned type,
+ 	return tmp;
+ }
+ 
++static int
++name_constraints_node_list_union(gnutls_x509_name_constraints_t nc,
++				 struct name_constraints_node_list_st *nodes,
++				 struct name_constraints_node_list_st *nodes2);
++
++#define type_bitmask_t uint8_t /* increase if GNUTLS_SAN_MAX grows */
++#define type_bitmask_set(mask, t) ((mask) |= (1u << (t)))
++#define type_bitmask_clr(mask, t) ((mask) &= ~(1u << (t)))
++#define type_bitmask_in(mask, t) ((mask) & (1u << (t)))
++/* C99-compatible compile-time assertions; gnutls_int.h undefines verify */
++typedef char assert_san_max[(GNUTLS_SAN_MAX < 8) ? 1 : -1];
++typedef char assert_dnsname[(GNUTLS_SAN_DNSNAME <= GNUTLS_SAN_MAX) ? 1 : -1];
++typedef char assert_rfc822[(GNUTLS_SAN_RFC822NAME <= GNUTLS_SAN_MAX) ? 1 : -1];
++typedef char assert_ipaddr[(GNUTLS_SAN_IPADDRESS <= GNUTLS_SAN_MAX) ? 1 : -1];
++
+ /*-
+  * @brief name_constraints_node_list_intersect:
+  * @nc: %gnutls_x509_name_constraints_t
+@@ -710,12 +726,9 @@ static int name_constraints_node_list_intersect(
+ 							 .capacity = 0 };
+ 	static const unsigned char universal_ip[32] = { 0 };
+ 
+-	/* temporary array to see, if we need to add universal excluded constraints
+-	 * (see phase 3 for details)
+-	 * indexed directly by (gnutls_x509_subject_alt_name_t enum - 1) */
+-	unsigned char types_with_empty_intersection[GNUTLS_SAN_MAX];
+-	memset(types_with_empty_intersection, 0,
+-	       sizeof(types_with_empty_intersection));
++	/* bitmask to see if we need to add universal excluded constraints
++	 * (see phase 3 for details) */
++	type_bitmask_t types_with_empty_intersection = 0;
+ 
+ 	if (permitted->size == 0 || permitted2->size == 0)
+ 		return 0;
+@@ -741,7 +754,8 @@ static int name_constraints_node_list_intersect(
+ 				// note the possibility of empty intersection for this type
+ 				// if we add something to the intersection in phase 2,
+ 				// we will reset this flag back to 0 then
+-				types_with_empty_intersection[t->type - 1] = 1;
++				type_bitmask_set(types_with_empty_intersection,
++						 t->type);
+ 				found = t2;
+ 				break;
+ 			}
+@@ -798,8 +812,8 @@ static int name_constraints_node_list_intersect(
+ 						GNUTLS_E_INTERNAL_ERROR);
+ 				}
+ 				// we will not add universal excluded constraint for this type
+-				types_with_empty_intersection[tmp->type - 1] =
+-					0;
++				type_bitmask_clr(types_with_empty_intersection,
++						 tmp->type);
+ 				// add intersection node to PERMITTED
+ 				ret = name_constraints_node_list_add(permitted,
+ 								     tmp);
+@@ -827,7 +841,7 @@ static int name_constraints_node_list_intersect(
+ 	 * excluded constraint with universal wildcard
+ 	 * (since the intersection of permitted is now empty). */
+ 	for (type = 1; type <= GNUTLS_SAN_MAX; type++) {
+-		if (types_with_empty_intersection[type - 1] == 0)
++		if (!type_bitmask_in(types_with_empty_intersection, type))
+ 			continue;
+ 		_gnutls_hard_log(
+ 			"Adding universal excluded name constraint for type %d.\n",
+@@ -871,6 +885,11 @@ cleanup:
+ 	return ret;
+ }
+ 
++#undef type_bitmask_t
++#undef type_bitmask_set
++#undef type_bitmask_clr
++#undef type_bitmask_in
++
+ static int
+ name_constraints_node_list_union(gnutls_x509_name_constraints_t nc,
+ 				 struct name_constraints_node_list_st *nodes,
+-- 
+GitLab
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.10.bb b/meta/recipes-support/gnutls/gnutls_3.8.10.bb
index 5430ee20856..ce9fdce3f46 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.10.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.10.bb
@@ -24,6 +24,16 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://run-ptest \
            file://Add-ptest-support.patch \
            file://CVE-2025-9820.patch \
+           file://CVE-2025-14831-1.patch \
+           file://CVE-2025-14831-2.patch \
+           file://CVE-2025-14831-3.patch \
+           file://CVE-2025-14831-4.patch \
+           file://CVE-2025-14831-5.patch \
+           file://CVE-2025-14831-6.patch \
+           file://CVE-2025-14831-7.patch \
+           file://CVE-2025-14831-8.patch \
+           file://CVE-2025-14831-9.patch \
+           file://CVE-2025-14831-10.patch \
            "
 
 SRC_URI[sha256sum] = "db7fab7cce791e7727ebbef2334301c821d79a550ec55c9ef096b610b03eb6b7"


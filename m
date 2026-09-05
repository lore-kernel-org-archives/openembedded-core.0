Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D1C7C79F9B
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:23 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2586.1788641121355697143
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qSiRKIVu;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48436216a98so1433556f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641119; x=1789245919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pEIEe5rFUG0SDi7UQoEiByOf15liZ28Guhsl3xnBVws=;
        b=qSiRKIVuZsjBCecpi97eh7LvRMCe+BxOYZpEsj1O8UkmWVFfmR358FYrOOsYPS9Bt6
         EewxARV1BcPuDyoWS2yAC31G/FCDikFotjW4RYvGlqp6vqRIzv3qWvizPGI0iUKH5DON
         z7KbvhUYagvW0grGFZv9POhqtOTbk1/V3kcik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641119; x=1789245919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pEIEe5rFUG0SDi7UQoEiByOf15liZ28Guhsl3xnBVws=;
        b=qFCQlgF1LLafBQdReT/BEigoVFhyDwfmrrXkDsQG7SRpNzQ0cm/U9/fGtRTXpVhj/v
         KXK956Sod21KMT8+Z8N9wufGgIZjtDioH9/oQG+V2qEyZejQjpsQd3loaa5m8bJSH5IL
         fnXdtQilIZqfZ/u6CFiacKHu8TGGnI8Gi3BqcT6aG9Enhyb1R0YLxh6wVhJJzM7PrWD7
         r4Zk4FqEgfiPEJaETyt+IS4WFya2s12ZSm/joHzrPHf3FG4rjXJGJiwzmqcLP46Pv4fs
         y3l02kX0+oRfikF7vq4xwYXX/GE1F+jmqPHjSuJ2GVBKnuOJ4g7+Rd4lGu4rD/erTaby
         5X1w==
X-Gm-Message-State: AFuF++nzsPUjUI69PkLQtiQ69pD4HGdxly5yWHUMIvQ6P+9XKfRp27Rc
	wNJ2U98b0qehLa2odA9+6FyoZtMaiJBhuw7pPuZ0hWk40k24p9HA5iMHscAlGhRcuKw+P36jvEJ
	ydmH5uCw=
X-Gm-Gg: AYBFou0/9q2hmhcxZ1v/KQijgASJu+5dn5ywBRNhnwFRpdhul6QZ/PcOSQo3L6j6awI
	8pimEEpd59FQE1aa0B7TRxQWSt1jpLGK72J9zhq1rGWH2bMZXOFwTlnmNL6h0QUeJB3EW6EkzoR
	EUOZGzVGoDsLtqYttj1G9eTW2+hV06ibG4YNcKvuzB88oif8+X9SBGWVumRh/y/IiNmKhpKLOXx
	1/dCy6+CdHA6W8554oOGiPx1Dz6NnSRKCK/LgzyrPIM+s5hq6lK9dejkLRow1lmPZ+IhsZFb/4N
	l+jy5eJ0j3y1ncEhLsMXKjjVOjWJ+H1u1+4CYk0SPt+km9BwLFxI08QEuVEwIr/q/dX7Vz1JhH6
	8F+F/mxlaO/c3gIfnl8OlAV8RwvoNfyPm1WPAjJfwqgERSQehvDkivsh6R2gX5YTtTDRcGL80WY
	u7lxRi/AxpVSirqJP/ewZMYNEWvIfnNYjX3WOwgJkaJ4jUw1MfCatxHhbxHszhOcsPvrsGqm2Ml
	Io6M32r369eJ38Zz9siv2/J5d2ka2I+YpDLik54fUvHQ+0t0gJANCkojFMYy3psWQ==
X-Received: by 2002:adf:e19c:0:b0:485:8c17:976b with SMTP id ffacd0b85a97d-4858c1799f6mr12347667f8f.45.1788641119454;
        Sat, 05 Sep 2026 13:45:19 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 16/40] gnutls: fix for CVE-2026-42011
Date: Sat,  5 Sep 2026 22:44:17 +0200
Message-ID: <292feb720935d42dab6729a1147c9d5ca9f65c7e.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245168

From: Jakub Szczudlo (Nokia) <jakub.szczudlo@nokia.com>

Backport patches to fix CVE-2026-42011 and extend test for it

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-42011

Upstream fix:
  https://gitlab.com/gnutls/gnutls/-/commit/1dead2faec6320aaba321eb56f20d442df192b83
  https://gitlab.com/gnutls/gnutls/-/commit/24713b8c63137ce0665b495d22ccce4f5ce05c84

Tested with ptest

Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnutls/gnutls/CVE-2026-42011_p1.patch     |  43 ++++++
 .../gnutls/gnutls/CVE-2026-42011_p2.patch     | 141 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   2 +
 3 files changed, 186 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42011_p1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42011_p2.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42011_p1.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42011_p1.patch
new file mode 100644
index 00000000000..62a9714c6c6
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42011_p1.patch
@@ -0,0 +1,43 @@
+From 1dead2faec6320aaba321eb56f20d442df192b83 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Tue, 14 Apr 2026 17:41:30 +0200
+Subject: [PATCH 1/2] x509/name_constraints: fix intersecting empty constraints
+
+Permitted name constraints were wrongfully ignored
+when prior CAs only had excluded name constraints,
+resulting in a name constraint bypass.
+
+With this change, they are taken into account and propagate.
+
+CVE: CVE-2026-42011
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/1dead2faec6320aaba321eb56f20d442df192b83]
+
+Reported-by: Haruto Kimura (Stella)
+Fixes: #1824
+Fixes: CVE-2026-42011
+Fixes: GNUTLS-SA-2026-04-29-6
+CVSS: 4.8 Medium CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:L/I:L/A:N
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
+---
+ lib/x509/name_constraints.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/lib/x509/name_constraints.c b/lib/x509/name_constraints.c
+index 04722bdf4..232d466c4 100644
+--- a/lib/x509/name_constraints.c
++++ b/lib/x509/name_constraints.c
+@@ -723,9 +723,6 @@ static int name_constraints_node_list_intersect(
+ 	type_bitmask_t types_in_p1 = 0, types_in_p2 = 0;
+ 	static const unsigned char universal_ip[32] = { 0 };
+ 
+-	if (permitted->size == 0 || permitted2->size == 0)
+-		return GNUTLS_E_SUCCESS;
+-
+ 	/* make sorted views of the arrays */
+ 	ret = ensure_sorted(permitted);
+ 	if (ret < 0) {
+-- 
+2.53.0
+
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42011_p2.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42011_p2.patch
new file mode 100644
index 00000000000..29eb6bda43a
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42011_p2.patch
@@ -0,0 +1,141 @@
+From 24713b8c63137ce0665b495d22ccce4f5ce05c84 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Tue, 14 Apr 2026 17:49:50 +0200
+Subject: [PATCH 2/2] tests/name-constraints-merge: extend to cover #1824
+
+CVE: CVE-2026-42011
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/24713b8c63137ce0665b495d22ccce4f5ce05c84]
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
+---
+ tests/name-constraints-merge.c | 113 +++++++++++++++++++++++++++++++++
+ 1 file changed, 113 insertions(+)
+
+diff --git a/tests/name-constraints-merge.c b/tests/name-constraints-merge.c
+index 70376aaa7..3ff8d6c60 100644
+--- a/tests/name-constraints-merge.c
++++ b/tests/name-constraints-merge.c
+@@ -473,6 +473,119 @@ void doit(void)
+ 	gnutls_x509_name_constraints_deinit(nc1);
+ 	gnutls_x509_name_constraints_deinit(nc2);
+ 
++	/* 6: test intersecting empty permitted with non-empty permitted
++	 * NC1: excluded DNS excluded.example.org  (empty permitted)
++	 * NC2: permitted DNS permitted.example.org
++	 * Expected result:
++	 *   permitted=[permitted.example.org], excluded=[excluded.example.org]
++	 *   unrelated.example.com is rejected
++	 */
++	suite = 6;
++
++	ret = gnutls_x509_name_constraints_init(&nc1);
++	check_for_error(ret);
++
++	ret = gnutls_x509_name_constraints_init(&nc2);
++	check_for_error(ret);
++
++	set_name("excluded.example.org", &name);
++	ret = gnutls_x509_name_constraints_add_excluded(nc1, GNUTLS_SAN_DNSNAME,
++							&name);
++	check_for_error(ret);
++
++	set_name("permitted.example.org", &name);
++	ret = gnutls_x509_name_constraints_add_permitted(
++		nc2, GNUTLS_SAN_DNSNAME, &name);
++	check_for_error(ret);
++
++	ret = _gnutls_x509_name_constraints_merge(nc1, nc2);
++	check_for_error(ret);
++
++	set_name("unrelated.example.com", &name); /* entirely unrelated */
++	ret = gnutls_x509_name_constraints_check(nc1, GNUTLS_SAN_DNSNAME,
++						 &name);
++	check_test_result(suite, ret, NAME_REJECTED, &name); /* #1814 */
++
++	set_name("permitted.example.org", &name); /* permitted, direct */
++	ret = gnutls_x509_name_constraints_check(nc1, GNUTLS_SAN_DNSNAME,
++						 &name);
++	check_test_result(suite, ret, NAME_ACCEPTED, &name); /* sanity */
++
++	set_name("sub.permitted.example.org", &name); /* permitted, subdomain */
++	ret = gnutls_x509_name_constraints_check(nc1, GNUTLS_SAN_DNSNAME,
++						 &name);
++	check_test_result(suite, ret, NAME_ACCEPTED, &name); /* sanity */
++
++	set_name("excluded.example.org", &name); /* excluded, direct */
++	ret = gnutls_x509_name_constraints_check(nc1, GNUTLS_SAN_DNSNAME,
++						 &name);
++	check_test_result(suite, ret, NAME_REJECTED, &name); /* sanity */
++
++	set_name("sub.excluded.example.org", &name); /* excluded, subdomain */
++	ret = gnutls_x509_name_constraints_check(nc1, GNUTLS_SAN_DNSNAME,
++						 &name);
++	check_test_result(suite, ret, NAME_REJECTED, &name); /* sanity */
++
++	gnutls_x509_name_constraints_deinit(nc1);
++	gnutls_x509_name_constraints_deinit(nc2);
++
++	/* 7: test intersecting non-empty permitted with empty permitted
++	 * (same as 6, but swapped to ensure order doesn't matter)
++	 * NC1: permitted DNS permitted.example.org
++	 * NC2: excluded DNS excluded.example.org  (empty permitted)
++	 * Expected result:
++	 *   permitted=[permitted.example.org], excluded=[excluded.example.org]
++	 *   unrelated.example.com is rejected
++	 */
++	suite = 7;
++
++	ret = gnutls_x509_name_constraints_init(&nc1);
++	check_for_error(ret);
++
++	ret = gnutls_x509_name_constraints_init(&nc2);
++	check_for_error(ret);
++
++	set_name("permitted.example.org", &name);
++	ret = gnutls_x509_name_constraints_add_permitted(
++		nc1, GNUTLS_SAN_DNSNAME, &name);
++	check_for_error(ret);
++
++	set_name("excluded.example.org", &name);
++	ret = gnutls_x509_name_constraints_add_excluded(nc2, GNUTLS_SAN_DNSNAME,
++							&name);
++	check_for_error(ret);
++
++	ret = _gnutls_x509_name_constraints_merge(nc1, nc2);
++	check_for_error(ret);
++
++	set_name("unrelated.example.com", &name); /* entirely unrelated */
++	ret = gnutls_x509_name_constraints_check(nc1, GNUTLS_SAN_DNSNAME,
++						 &name);
++	check_test_result(suite, ret, NAME_REJECTED, &name); /* #1814 */
++
++	set_name("permitted.example.org", &name); /* permitted, direct */
++	ret = gnutls_x509_name_constraints_check(nc1, GNUTLS_SAN_DNSNAME,
++						 &name);
++	check_test_result(suite, ret, NAME_ACCEPTED, &name); /* sanity */
++
++	set_name("sub.permitted.example.org", &name); /* permitted, subdomain */
++	ret = gnutls_x509_name_constraints_check(nc1, GNUTLS_SAN_DNSNAME,
++						 &name);
++	check_test_result(suite, ret, NAME_ACCEPTED, &name); /* sanity */
++
++	set_name("excluded.example.org", &name); /* excluded, direct */
++	ret = gnutls_x509_name_constraints_check(nc1, GNUTLS_SAN_DNSNAME,
++						 &name);
++	check_test_result(suite, ret, NAME_REJECTED, &name); /* sanity */
++
++	set_name("sub.excluded.example.org", &name); /* excluded, subdomain */
++	ret = gnutls_x509_name_constraints_check(nc1, GNUTLS_SAN_DNSNAME,
++						 &name);
++	check_test_result(suite, ret, NAME_REJECTED, &name); /* sanity */
++
++	gnutls_x509_name_constraints_deinit(nc1);
++	gnutls_x509_name_constraints_deinit(nc2);
++
+ 	/* Test footer */
+ 
+ 	if (debug)
+-- 
+2.53.0
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
index 3ad011742e4..e9059a4bc16 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -37,6 +37,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2026-42009_p1.patch \
            file://CVE-2026-42009_p2.patch \
            file://CVE-2026-3833.patch \
+           file://CVE-2026-42011_p1.patch \
+           file://CVE-2026-42011_p2.patch \
            "
 
 SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"


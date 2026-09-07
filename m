Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9DBC79FAF
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:04 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34925.1788788160395625091
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=K1AGwhyM;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4858595f997so2104456f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788159; x=1789392959; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sayaQ8+5O3bjEsThTrUTG7Lsaz49elY49FYMUVYRRUs=;
        b=K1AGwhyM9PfoebP+hvNTH/pbQO/Qhvemmt4o7NcMIfCT8LFnBo2fIRp94T2KRn2cq2
         bnqCTV0JRmrkXO7F+GHWKx/9FTj9v+rSdkRP3axi+d2IfaJGtDwFcwEWEKOQCHbowyRy
         cjuffi/a9vks1CFhtbuTY6JjCIiW5O7832PLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788159; x=1789392959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sayaQ8+5O3bjEsThTrUTG7Lsaz49elY49FYMUVYRRUs=;
        b=O7s91FZVdyb6kjIivraft3IMQrkDBQ8jwZxFGoXhklMZq2Im+6daOorXQeUCIYjE1I
         24J+6Xn6rtFwaXaj3HWehiRqnGz/LAICMcRDOcyMl5q8kDnDvpcdPgQsvbPRuFttnmpW
         HdymP4umMrNfeSGfYFi53e2+o31lVQ9LppDxnRUWTPszcqn+n7FfPiK/W5gTGPpODmCB
         QODzNWzFhlJ6jPOWq0QUxFlnqhxhWQSxKmBaPl/WsnCCJpZ0zRjU45sAq5AXhsLfRj9I
         5itVBVjDzc9gsjq8sG5tBjLfwZdqR3C4wKEzCIDpW2kNC1dbEUnu3s838IwCuIeNtYSw
         /Rkg==
X-Gm-Message-State: AFuF++mJiVTZT/0ceVn72SjuPsZ0MTjDRci62CdQuxPicgupc15npYOO
	UxSgKNpvauDb9424pXF0vTLQ01VEqMjyBcs7EDPgzKBAKh/nzH7rh5+VmL6f8gEpca3vgWorUDf
	WSi7UzwM=
X-Gm-Gg: AYBFou1PiEhgOUVecrV8SFcnXg677zDZomNvxa5/mjeiDy59YqPknW8rOSG2h5+gQng
	AbTddov+ZeHCJ8MaShuqAsCqgcIMJim3GlpYengyfz/ACi8dBUaPKO54G+dU81v/apUK43gne3Y
	fYImItDlw7tPlBiotvToj4PIda4FkBu/OzzzlhZEZE/bNKP1EAuA0foKkC13RBXBBAG9KIkuegG
	r6BdQ8tXzu58BRq5P6oKwWzfMwZsfHy8K/JIi9LyFPsiWDDAROvdFiBwEA1mMM/6Z1xN0rs1Hfm
	VUnzx1OQvLCIBzoxlzJzmRxp+6Y+m+G/CSspe4TO2CK1SGOa/1qUnXj7yFkCvP5f5cn6zZTeJcq
	Dv+TJu8/haYO73EZxIKTayayb1AVShbImoYQzyCFU1gmTMt6aPUlAGivZPh1jnS6Zk2B3DIr7va
	kDJqWWR1c/gJ5c3YGZu30qq7jryb8T/Xy45Sh/tQ9xFDnj0xcz/SfQewdluHZhckOqZTRzZAay4
	wceK8Y6rlyxMiRXRGA9GjD9hj9f3i2TE7VO+O/Z+Ax4RLdH6KJ9iouvtz7dckEm
X-Received: by 2002:a05:6000:420d:b0:485:8ebb:be1a with SMTP id ffacd0b85a97d-4858ebbbee4mr36055279f8f.4.1788788158624;
        Mon, 07 Sep 2026 06:35:58 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.35.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:35:58 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/35] gnutls: fix for CVE-2026-42011
Date: Mon,  7 Sep 2026 15:35:10 +0200
Message-ID: <81e15180ec6df4785d05c52d074fbad859eafb61.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245272

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
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   2 +
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
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index 6f1c2f21723..2d88bc181de 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -47,6 +47,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2026-42009_p2.patch \
            file://CVE-2026-3833.patch \
            file://CVE-2026-42010.patch \
+           file://CVE-2026-42011_p1.patch \
+           file://CVE-2026-42011_p2.patch \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"


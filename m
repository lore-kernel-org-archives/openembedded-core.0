Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24611CDE000
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 12:55:44 +0000 (UTC)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10865.1782392140116863812
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 05:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jPRmw8cs;
 spf=pass (domain: mvista.com, ip: 74.125.82.175, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30c03b09e02so4957891eec.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 05:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1782392139; x=1782996939; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MQ+penhS9gjX4uNPSkojmNSiNX1IcvXQ0+q5XB0gQjU=;
        b=jPRmw8csd8P5ye4AsUMkSmzALz0/IP46zhpFNihMfACVEMvpVWLDCLrU5c1yV48Jwk
         /WAIK4LEmhz3R6/3iqOZf8ghAUJOkcIXqO2DQX8jKe9hezgWJ4SLXUaF43m1AGV2Y9gh
         SUcdU7JDWPntibtqdFZ+Z6sqeFVcOWROjLoOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782392139; x=1782996939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQ+penhS9gjX4uNPSkojmNSiNX1IcvXQ0+q5XB0gQjU=;
        b=VbT5YbOOnwuWnUF7WuFPf3S0Fd/AZkeP2Ajdhdnwi2+fl11QdAm7PJi//gcVv+bM5t
         oof0WE/4p3/UQ6DMe2swUd+WA5r98r5vz3tJeJQapO9jkcnFdU6/Q2KDyIPixjMaIm4Y
         iJTCkVsIaEXMQPYZU/mJmkMNEwEBtRLvLDdGMYXs8Ad12bXUzpUGKNwwWcCDUQErBfAU
         PKFVBm3x2eMeLS3hkVKql0QCnweeQxicGxPe3A6iGR9JWCQDFkvcrbTBZ7P6yBzj1B64
         IFJr9HQkJLUn7OrCX5O7J7SYKEwlSKoX5lZ1NmyWHeEBccoonf5Lu3k2ddwojH7YKOSr
         XHAw==
X-Gm-Message-State: AOJu0Yz3SJRgDc1MQb8PhGPSiBiV/2JVhy6NAuO5vmk7xsAxUw/qP8Ef
	c6DZChuyC09o25IVlsdtYGW2RT8fLZfqgLkBRxgDZDIsDsPOOv6pdeGYcnqyFPriFq8MJeLLs4R
	JWgWi9dk=
X-Gm-Gg: AfdE7cnfctWtIoDt9DqJwsXPfgJGVv/QknCpfH0jHgqOyp0OP1iLC/VJuIxdKehO630
	HNiPhSq6XXUrrdi38/iniwUBDiDdTD0k44BV9yuV43fOKyUO6+Dl96W1gyxU0GULGWI+dJBDc9S
	X0AtKnYjqqGJLKR812kRIiM8oSgXkd4dqjedE/lXyvn9MFsU7HyLk4dBLxL78Iq6GzsfiBt6nYN
	tHubbCREQwMgLpcP7DoEcj9P6lCMShpSUpxr8STK09sSx8JFiNRHcqFttLJLlxylx4IyGMO5He8
	98iVxAPA2MIOWEIFPzQUsZCa60lu/8DCsPSH6bnZCbpvwww4AihwXI4MGdwB4RFernDIqvRhh6k
	Zb1ef+IWLgSww5ecdFliheeTHhBVQP3CNImDlHo0wMadf9prf/+WNV9B6PVHDnkUU737mYpmtJk
	OTWROWAQFwV7EBw9VM2IbF7xlEFQ==
X-Received: by 2002:a05:7300:3b0c:b0:2f5:3641:f126 with SMTP id 5a478bee46e88-30c84d6c7e1mr2404547eec.24.1782392139343;
        Thu, 25 Jun 2026 05:55:39 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.133])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4c691dsm8260273eec.5.2026.06.25.05.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 05:55:39 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] gnutls: fix for CVE-2026-42011
Date: Thu, 25 Jun 2026 18:25:32 +0530
Message-ID: <20260625125532.185380-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 12:55:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239561

Pick patch from [1] & [2] also mentioned at Debian report in [3]

[1] https://gitlab.com/gnutls/gnutls/-/commit/1dead2faec6320aaba321eb56f20d442df192b83
[2] https://gitlab.com/gnutls/gnutls/-/commit/24713b8c63137ce0665b495d22ccce4f5ce05c84
[3] https://security-tracker.debian.org/tracker/CVE-2026-42011
[4] https://gitlab.com/gnutls/gnutls/-/work_items/1824

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../gnutls/gnutls/CVE-2026-42011.patch        | 167 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   1 +
 2 files changed, 168 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42011.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42011.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42011.patch
new file mode 100644
index 0000000000..2fa14ef8b6
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42011.patch
@@ -0,0 +1,167 @@
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
+Reported-by: Haruto Kimura (Stella)
+Fixes: #1824
+Fixes: CVE-2026-42011
+Fixes: GNUTLS-SA-2026-04-29-6
+CVSS: 4.8 Medium CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:L/I:L/A:N
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+CVE: CVE-2026-42011
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/1dead2faec6320aaba321eb56f20d442df192b83 & https://gitlab.com/gnutls/gnutls/-/commit/24713b8c63137ce0665b495d22ccce4f5ce05c84]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/x509/name_constraints.c    |   3 -
+ tests/name-constraints-merge.c | 113 +++++++++++++++++++++++++++++++++
+ 2 files changed, 113 insertions(+), 3 deletions(-)
+
+diff --git a/lib/x509/name_constraints.c b/lib/x509/name_constraints.c
+index 04722bd..232d466 100644
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
+diff --git a/tests/name-constraints-merge.c b/tests/name-constraints-merge.c
+index 03b3243..1eac6de 100644
+--- a/tests/name-constraints-merge.c
++++ b/tests/name-constraints-merge.c
+@@ -418,6 +418,119 @@ void doit(void)
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
+2.50.1
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index ccb6a2b4b2..a9dd1e3ef9 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -43,6 +43,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2025-14831-7.patch \
            file://CVE-2025-14831-8.patch \
            file://CVE-2025-14831-9.patch \
+           file://CVE-2026-42011.patch \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"
-- 
2.50.1



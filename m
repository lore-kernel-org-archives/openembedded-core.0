Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57200C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 06:57:01 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3441.1784530615308993392
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 23:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=W+MSDflc;
 spf=pass (domain: mvista.com, ip: 209.85.216.53, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so4119877a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 23:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784530614; x=1785135414; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5dsEyJkofpYaxVGBu2vUrPKRKVkWFrge+jUA6g4MA+A=;
        b=W+MSDflcoBF6oPUkVpqT4q6p+lbuZv29RbX1Gbj34ppEcaxTC0v+mCvXLsYcpfzG4x
         w2PHHL5Ol+ncz3MzPIVIqwRcfVAjM3An5+NpzDa3vQoenIATN+yk5nrpeP0kID/zFiNG
         zWrxItUNYZS1C94tuGEEl2TaqOb4IrxUB+1Pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784530614; x=1785135414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5dsEyJkofpYaxVGBu2vUrPKRKVkWFrge+jUA6g4MA+A=;
        b=QiumiFG6qAGlJWiwECAHYvenCggSvvWeFW9hrBDnTl39/YNPh2uwLHDZHuUZupowDc
         wyaVxuVO+pRIvwLaaOnEeX+vX4qs41tYHmSITevy3Ys9AuRL0RJ5RpqsjmztAI5EKD3R
         QHXpKt+kxc8bCgs/A2l8BnM/i3i9SDYADYlvRv7vzYSWe9BZ8aKIqJ5KidWFWwughIrS
         EIHma0tzAf6v1/DriuLaOTrmCzHEhYH/Gk5A2jtEAFWAlVWbHvOeYvQWmAqXKsfusdIq
         VjKx1WXjJBoN3N8++sN5Gfw7TgOA2ITVJMJm0GU3oCcLEe9UJKoEsLksld7XENe685LJ
         zRiw==
X-Gm-Message-State: AOJu0YyTazW3VXVmz5hfwkycxbSxLp0D5FRNt1SYzy/x/QFh2NOVeGt/
	sLZypE5SGpilxnI1IvPDvsNCF+cj/LT9TRmy8lAftpPNFuxW1RUhgjjm+C8bkE9HmwOkH9UXD7X
	QGiq74E4=
X-Gm-Gg: AfdE7cmRuqxrVDdaWLpUMdjrzE1LQV5JJ1K5Zx4deEcKNmFNfT7R3UOcji9DFtrixFU
	FASlu82T0NeU1F2++/uLUNYINBrQuG4BBPHepD7nMMrkncnJ30e8eXdCe9uPI+3ngo6TXxIMeDv
	e1NIKw47HE9hoKYJyqFRjS0A1lFiaLd+yjcMN3UjWfGWlYj2YbQ2IGb9SNjAzcxw20NzFyTLIDu
	VEtL0BqjCEJJIGi7KEGpfZacg7ChmGGFed3n3XKT/HfI0/vRfxmkrYu7JeUSKZTLUDnRVXgLCdU
	k4hjXGlULujcaWBGM8iJq8AibO0QB0NAp50rvVRwqNx9R/frkIMuTCB24UMav0ydVD3cCg7+v1t
	+RGHgkDfmT4ysxhu4CUplHXYv2TpZogMZ/dYQ/hqIYHAn16j9njIAYmWLOX7PMwd1tQk3CiqvDd
	oiS8EjeRfh7A7SPpFPLvYaHcUW9w==
X-Received: by 2002:a17:90b:6cb:b0:37e:2005:6507 with SMTP id 98e67ed59e1d1-38e4b42355dmr13720612a91.15.1784530614370;
        Sun, 19 Jul 2026 23:56:54 -0700 (PDT)
Received: from MVIN00013.mvista.com ([150.129.170.168])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm28741738c88.8.2026.07.19.23.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:56:53 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [wrynose][PATCH] gnutls: fix for CVE-2026-42011
Date: Mon, 20 Jul 2026 12:26:44 +0530
Message-ID: <20260720065644.24395-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 06:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241327

Pick patch from [1] & [2] also mentioned at Debian report in [3]

[1] https://gitlab.com/gnutls/gnutls/-/commit/1dead2faec6320aaba321eb56f20d442df192b83
[2] https://gitlab.com/gnutls/gnutls/-/commit/24713b8c63137ce0665b495d22ccce4f5ce05c84
[3] https://security-tracker.debian.org/tracker/CVE-2026-42011
[4] https://gitlab.com/gnutls/gnutls/-/work_items/1824

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../gnutls/gnutls/CVE-2026-42011.patch        | 167 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   1 +
 2 files changed, 168 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42011.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42011.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42011.patch
new file mode 100644
index 0000000000..0c56b2805a
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42011.patch
@@ -0,0 +1,167 @@
+From 1dead2faec6320aaba321eb56f20d442df192b83 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Tue, 14 Apr 2026 17:41:30 +0200
+Subject: [PATCH] x509/name_constraints: fix intersecting empty constraints
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
+index 70376aa..3ff8d6c 100644
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
+2.34.1
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
index b92470768c..88c9aa2880 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -32,6 +32,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://0006-buffers-match-DTLS-datagrams-by-sequence-number.patch \
            file://0007-tests-mini-dtls-fragments-1839-mismatching-message_s.patch \
            file://0008-tests-mini-dtls-framents-link-to-gnulib.patch \
+           file://CVE-2026-42011.patch \
            "
 
 SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"
-- 
2.50.1



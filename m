Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D08FFC4453D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 09:54:37 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44327.1784714074750982364
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 02:54:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Vz904gyN;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3518; q=dns/txt;
  s=iport01; t=1784714074; x=1785923674;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MOX6YCQ++3hAcvaifcu6m9Z+IrNLVR+9XS3XTnhI15Q=;
  b=Vz904gyNbfBiR+sLH6i2xcUfUKKqh91y6XU0KpntZoozhqr0tDdMbHhd
   2okJv25mh1CC9S1P6U8xBDpo6mjybR551eMBoNIFHV9ZF+HvnPCt1HY35
   rjAlz2QU0WNVnQP0HcqQtknbqP7TgqrYor/XyI4bdOfVAKdnM2L2slRL4
   O5NhRFk3Zlli5ypc7/tTRyy8sMFe2rhzgVFFOiVR4NjItJ13X3Qr+HYX1
   zyo81/mlGQsHGAxbHtkNzb4bU3tpJC7+U/tflDpU6/uTKnrN3iQDmwxQW
   /za6odIMF0hJVhxsrTa7tPtpCMz/eM18PUfp1h5LiutrCx+y4gxE84Ksr
   A==;
X-CSE-ConnectionGUID: QXPl9LUITCaVqkvlImBZoA==
X-CSE-MsgGUID: q/v6bxNwRASb2rFvtjq6HQ==
X-IPAS-Result: =?us-ascii?q?A0BHAgA+kmBq/5X/Ja1aglmCV3ReQ0mEV5Fznh6Bfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBY1ZAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBAgEmBAsBGAEtLAMBAgMCJgItIyGDAgGCdAMRwHF6fzOBAYMoA?=
 =?us-ascii?q?T8CQ1DbLgELFAEFgQUuhT+DHQGFAlwYAYR8JxsbgXKBFYNpgQWBXAEDGIENh?=
 =?us-ascii?q?BSCagSCIoEMgVoYBpAiSIECHANZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPhc0W?=
 =?us-ascii?q?BsHBYEdgS6BAoRuIx8DOX+BL3VKdy1pARIXgSaCFIE6AoEDAwsYDUgRLDcUG?=
 =?us-ascii?q?QQ9AW4HjWkjgkAOSwE0ASuVWpJIgTWfWgoog3WMIZU6GjOEBJQXklELmH2OC?=
 =?us-ascii?q?pZQhGmBaDyBRwsHcBWDIglKGQ+OLQsLhV+DFMhzJzICAQEHMgEBBwIHAgwDC?=
 =?us-ascii?q?4FokACBfgEB?=
IronPort-Data: A9a23:Baashq22Vmx4l229ivbD5YJwkn2cJEfYwER7XKvMYLTBsI5bp2MAy
 2MeDTyHOfreZGvzL4giYY+38R5V6JLUnIRrGlZu3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g2EuaDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGNXEOOdw8x8dLKmhw7
 P8GLBEIRCKErrfjqF67YrEEasULNsLnOsYb/3pn1zycVKxgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiRC/FMEg9/5JYWkOSlgnD+YjRwo1OOrq1x6G/WpOB0+OW0aoWLJ4bbHq25mG6B4
 XyY9XTfHSszD9bF0xSb7nC12M/2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl/DQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:UNoA7qN6NPSPrMBcTuOjsMiBIKoaSvp037Dk7S9MoHtuA6ilfq
 GV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKhTbakrDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IHjJ7MHd3ATV0mmhD0JczqmLg==
X-Talos-CUID: 9a23:QQfBbW2FDLM2OhXj1+INMbxfI/Addiz58VbsCEaGEGV3TJyQY22X0fYx
X-Talos-MUID: =?us-ascii?q?9a23=3ABwocawz/vMJCOwPL6PeVv9JWKPSaqL3pFh4HgbM?=
 =?us-ascii?q?ZgeC/P3ZqFSmBji3pYrZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,178,1779148800"; 
   d="scan'208";a="512765293"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Jul 2026 09:54:33 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 9FAF118000326;
	Wed, 22 Jul 2026 09:54:33 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 45025CAEF79; Wed, 22 Jul 2026 02:54:33 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 1/4] gawk: Fix CVE-2026-40467
Date: Wed, 22 Jul 2026 02:54:27 -0700
Message-Id: <20260722095430.1416791-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 09:54:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241636

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using the commit shown in [1].

[1] https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=a2d18c74109e41bec29a23098eba2e00057286d8
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-40467

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../gawk/gawk/CVE-2026-40467.patch            | 62 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.4.0.bb      |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch b/meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch
new file mode 100644
index 0000000000..772172c373
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch
@@ -0,0 +1,62 @@
+From 194a2884f21a6fc02c446ca4e2dc9107298832db Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Fri, 3 Apr 2026 12:02:11 +0300
+Subject: [PATCH] Small memory management fix in io.c.
+
+CVE: CVE-2026-40467
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=a2d18c74109e41bec29a23098eba2e00057286d8]
+
+(cherry picked from commit a2d18c74109e41bec29a23098eba2e00057286d8)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ ChangeLog | 6 ++++++
+ io.c      | 5 ++++-
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index a714ca1a..517aba91 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,9 @@
++2026-04-03         Arnold D. Robbins     <arnold@skeeve.com>
++
++	* io.c (do_getline_redir): Don't DEREF redir_exp too early.
++	Thanks to Michał Majchrowicz <mmajchrowicz@afine.com>
++	for the report.
++
+ 2026-02-22         Arnold D. Robbins     <arnold@skeeve.com>
+ 
+ 	* 5.4.0: Release tar ball made.
+diff --git a/io.c b/io.c
+index a3b877c4..7a547aa1 100644
+--- a/io.c
++++ b/io.c
+@@ -2853,21 +2853,24 @@ do_getline_redir(int into_variable, enum redirval redirtype)
+ 	redir_exp = TOP();
+ 	redir_exp = elem_new_to_scalar(redir_exp);
+ 	rp = redirect(redir_exp, redirtype, & redir_error, false);
+-	DEREF(redir_exp);
+ 	decr_sp();
+ 	if (rp == NULL) {
+ 		if (redir_error) { /* failed redirect */
+ 			update_ERRNO_int(redir_error);
+ 		}
++		DEREF(redir_exp);
+ 		return make_number((AWKNUM) -1.0);
+ 	} else if ((rp->flag & RED_TWOWAY) != 0 && rp->iop == NULL) {
+ 		if (is_non_fatal_redirect(redir_exp->stptr, redir_exp->stlen)) {
+ 			update_ERRNO_int(EBADF);
++			DEREF(redir_exp);
+ 			return make_number((AWKNUM) -1.0);
+ 		}
+ 		(void) close_rp(rp, CLOSE_ALL);
++		DEREF(redir_exp);	// we're about to die, but what the heck, release it anyway
+ 		fatal(_("getline: attempt to read from closed read end of two-way pipe"));
+ 	}
++	DEREF(redir_exp);
+ 	iop = rp->iop;
+ 	if (iop == NULL)		/* end of input */
+ 		return make_number((AWKNUM) 0.0);
+-- 
+2.53.0
+
diff --git a/meta/recipes-extended/gawk/gawk_5.4.0.bb b/meta/recipes-extended/gawk/gawk_5.4.0.bb
index d7211f28f3..59c4cb2536 100644
--- a/meta/recipes-extended/gawk/gawk_5.4.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.4.0.bb
@@ -28,6 +28,7 @@ PACKAGECONFIG[pma-if-64bit] = "--enable-pma,--disable-pma, "
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.xz \
            file://run-ptest \
            file://0001-configure.ac-re-enable-disabled-printf-features.patch \
+           file://CVE-2026-40467.patch \
            "
 
 SRC_URI[sha256sum] = "3dd430f0cd3b4428c6c3f6afc021b9cd3c1f8c93f7a688dc268ca428a90b4ac1"
-- 
2.35.6



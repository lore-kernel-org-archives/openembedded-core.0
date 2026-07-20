Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC0C6C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 12:20:18 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7642.1784550013130748312
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 05:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ccBV+cO9;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2618; q=dns/txt;
  s=iport01; t=1784550013; x=1785759613;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=G1qhmPmaRkm09TGm3h/lnWyVMa+Vc6jzZlEAgbMMgVs=;
  b=ccBV+cO9uAzWfcAlTIySvfLPzjpoL/dpmDX4wsueh1vTrGXEg7WO0LKH
   pA83cZj/sbLtSthgJxW5NqfSRc/q39iNkKttc4CQmww/AJU20GsmhvQCl
   BWyIR/1LILWM7C9aOAnCQi57YDdV6ZQiJc/m2LAhFYcvqnmDLIaAbC1BP
   PF/8xG6ujet9S1QGnv1M2+Ad/T4LaKUE0fe1D2FkgdVNy8C5nV42GBdYo
   4qHFDdGtFEHqkSC/dJLzezgEJetjFpYffY8EUQP0vFaCU0mGG+yu+dq38
   Wehzzv+790dXZYenGZ87lVuNkKGxtJhtrIGR2ZzuxUBpQIo4jDoLpLfh+
   w==;
X-CSE-ConnectionGUID: RICkamqGT1uGu33c1MLTjA==
X-CSE-MsgGUID: nxUzwbvjSG++MoRPGI+71A==
X-IPAS-Result: =?us-ascii?q?A0BIAgAfEl5q/43/Ja1aHgEBCxIMggULgld0X0JJlCmCI?=
 =?us-ascii?q?QOLZJI3gX4PAQEBD0QNBAEBhD9GAo1TAiY0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQUBAQECAQcFgQ4Thk8NhloBAgEDMgEYAT0cAwECLyALIwgRCIMCAYI6A?=
 =?us-ascii?q?zcDEbxFGjeCLIEBgygBPwJDUNhJDYJYAQsUAYE4hT+CfYUjXBgBhHwnGxuBc?=
 =?us-ascii?q?oEUAYNpgQWBGkIBAYIGJ4V4BIIigQyBWh6PbkiBHgNZLAFVEw0KCwcFgWYDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBDBsHBYEdgTqBAoR0Ix8DOX+BL3VKdy1qEheBJoISAoE7A?=
 =?us-ascii?q?gcDCxgNSBEsNxQZBD5uB408I4I/gQ4BK4FDEaQtgh6gIXEKKIN1jCGPPoV8G?=
 =?us-ascii?q?jOqbAuYfY4KhAmSR4RpgWg8gSgfCwdwFYJuATMJShkPjjiDa4F/xkY8NQIJM?=
 =?us-ascii?q?gEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:L3oFQKzwVId/V2rzdwh6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUBy
 DAeUW6POPiKY2D1eogia9+2/E0EusWAztU2HABk+FhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYraDpMtspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJHsXFo4R//9YPThT2
 uFDcztUSzS/hcvjldpXSsE07igiBNPgMIVavjRryivUSK56B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cOnWjOX9PYH46tOuli2P2bz1fgFmUvqEwpWPUyWSd1ZCwaIaJJIHUG5w9ckCwo
 HL77XvzHBMhG5/c7D2/yl2NxbCWtHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:AAhsAKAqz601MCDlHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:z1J+Qmwzz+s9+BJaFJoZBgUuO+sme3jE40uJPmClUj1iEZixdV25rfY=
X-Talos-MUID: 9a23:0gT8QgYeJtlSzeBTsS/Rli5oKsVTzOftLUc3qbon+JbdHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208";a="504465661"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 12:20:12 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id E6C71180005CD
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:20:11 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 15E14CC037D; Mon, 20 Jul 2026 17:50:10 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH v2 04/10] expat: fix CVE-2026-56405
Date: Mon, 20 Jul 2026 17:46:09 +0530
Message-Id: <20260720121615.2520859-5-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720121615.2520859-1-deeratho@cisco.com>
References: <20260710130809.2817559-1-deeratho@cisco.com>
 <20260720121615.2520859-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:20:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241381

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/2c6c42d33689f6b266a5267b639e03cde17e53c0
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56405

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
- Changes from v1 to v2: Refresh the patch on top of
latest wrynose branch merged commits.
 .../expat/expat/CVE-2026-56405.patch          | 32 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.7.5.bb        |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56405.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56405.patch b/meta/recipes-core/expat/expat/CVE-2026-56405.patch
new file mode 100644
index 0000000000..c850801c1a
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56405.patch
@@ -0,0 +1,32 @@
+From 73209f445f0265b203829fa7873caa78ca83cefe Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Fri, 29 May 2026 11:45:17 +0530
+Subject: [PATCH] lib: Protect function getAttributeId from signed integer
+ overflow
+
+CVE: CVE-2026-56405
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/2c6c42d33689f6b266a5267b639e03cde17e53c0]
+
+(cherry picked from commit 2c6c42d33689f6b266a5267b639e03cde17e53c0)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 1b7e289f..ec707336 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -7324,6 +7324,10 @@ getAttributeId(XML_Parser parser, const ENCODING *enc, const char *start,
+     } else {
+       int i;
+       for (i = 0; name[i]; i++) {
++        /* Detect and prevent signed integer overflow */
++        if (i == INT_MAX) {
++          return NULL;
++        }
+         /* attributes without prefix are *not* in the default namespace */
+         if (name[i] == XML_T(ASCII_COLON)) {
+           int j;
+-- 
+2.43.7
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index d15e023207..789fd7e077 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -23,6 +23,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56403_p2.patch;striplevel=2 \
            file://CVE-2026-56408.patch;striplevel=2 \
            file://CVE-2026-56404.patch;striplevel=2 \
+           file://CVE-2026-56405.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6



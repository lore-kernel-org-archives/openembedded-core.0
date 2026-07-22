Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E63C4453D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 09:57:08 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44191.1784714192267936213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 02:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dnX5aa1C;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3511; q=dns/txt;
  s=iport01; t=1784714192; x=1785923792;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qjLeWjtkYGD7AEIFKcq6UNPZ2t82pbkR2E9AZz/8GvY=;
  b=dnX5aa1CqFvGPzBFSbXTpdWuLTRqYmg20o5exSY/u7jRwZgMrDQCXD4q
   W4jX34668uY6zlnb7CXkQ3olYKlGLDkJQya1hPolQA5seaHny113oXsDN
   iSWaXy7CI4F8IYnCmAv2HImlc2AIOaCgNqZOiif2Yz1X1+XunF4dEHhud
   CuDF9sjuRLd3UIQSLsq9WAmcko/GoqvxUu09tOcBbvNLp3Q1vaIj3BLK1
   9fGuC4IXjenYGHMWY7C6xN33k+ylUFfAKeX4o+jJ8yVI+L3xrZjT7kxqj
   sNEkvrKqawzEyXKNbcxBMdi4Y13/6T8j3Y+2GgyiEH8cN6rSojpkAMLaS
   A==;
X-CSE-ConnectionGUID: RAjmFFyEQgab2/oBe1JDeQ==
X-CSE-MsgGUID: TlXXRu/sSQG65a3Cb9woOA==
X-IPAS-Result: =?us-ascii?q?A0BHAgDCkmBq/43/Ja1aglmCV3ReQ0mEV5Fznh6Bfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBY1ZAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBAgEmBAsBGAEtLAMBAgMCJgItIyGDAgGCdAMRwHF6fzOBAYMoA?=
 =?us-ascii?q?T8CQ1DbLgELFAEFgQUuhT+DHQGFAlwYAYR8JxsbgXKBFYNpgQWBXAEDGIENh?=
 =?us-ascii?q?BSCagSCIoEMgVoYBpAiSIECHANZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPhc0W?=
 =?us-ascii?q?BsHBYEdgS6BAoRuIx8DOX+BL3VKdy1pARIXgSaCFIE6AoEDAwsYDUgRLDcUG?=
 =?us-ascii?q?QQ9AW4HjWkjgkAOgQABKyKVOJJIgTWfWgoog3WMIZU6GjOEBJQXklELmH2OC?=
 =?us-ascii?q?pVzXYRpgWg8gUcLB3AVgyIJShkPji0LC4VfgxTIcycyAgEBBzIBAQcCBwIMA?=
 =?us-ascii?q?wuBaJAAgX4BAQ?=
IronPort-Data: A9a23:AYlGgKxJISoN6gYVMB96t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkVWm
 GMZDWCHbPqONjbzLdgjO9+18BgP6sTQxtRnTwJrpVhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYraDhMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJHsfP4g21PdaOG5H/
 6ZfLxoANzKvitvjldpXSsE07igiBNPgMIVavjRryivUSK56B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cOnWjOX9PYH46tOuri332cixRgFmUvqEwpWPUyWSd1ZCwaYGLIIXbGJk9ckCwm
 mb2z17kRQohDfPBlDPe2Xj9mejotHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rGnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:FCpyOaG9h4hlj9kRpLqEyseALOsnbusQ8zAXPo5KJiC9Ffbo8/
 xG/c5rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIMheOkdK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqUuEiWpRGtldB8ATMHfjLnFL
X-Talos-CUID: 9a23:5EwRXWHRc1rTjAlEqmJd3UwRNO40X0TSxX2KZEiSBD9LZLCsHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AkM2xmgzHLeJF85CSGs1oatzJqoOaqJiqOHA3jNI?=
 =?us-ascii?q?dgPCra3F5YByX3SuwZaZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,178,1779148800"; 
   d="scan'208";a="513621954"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Jul 2026 09:56:31 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 40DAA180001BF;
	Wed, 22 Jul 2026 09:56:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id DADF6CAEF79; Wed, 22 Jul 2026 02:56:30 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH 1/4] gawk: Fix CVE-2026-40467
Date: Wed, 22 Jul 2026 02:56:24 -0700
Message-Id: <20260722095627.1424705-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 09:57:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241641

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using the commit shown in [1].

[1] https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=a2d18c74109e41bec29a23098eba2e00057286d8
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-40467

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../gawk/gawk/CVE-2026-40467.patch            | 63 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.3.0.bb      |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch b/meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch
new file mode 100644
index 0000000000..d813db5f8b
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch
@@ -0,0 +1,63 @@
+From 22fd9e360251f70b34e9b46635b6d75bce49202f Mon Sep 17 00:00:00 2001
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
+index 2fa8b2f0..6bc88ebb 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,9 @@
++2026-04-03         Arnold D. Robbins     <arnold@skeeve.com>
++
++	* io.c (do_getline_redir): Don't DEREF redir_exp too early.
++	Thanks to Michał Majchrowicz <mmajchrowicz@afine.com>
++	for the report.
++
+ 2023-11-02         Arnold D. Robbins     <arnold@skeeve.com>
+ 
+ 	* 5.3.0: Release tar ball made.
+diff --git a/io.c b/io.c
+index 44671ebd..4db4b21d 100644
+--- a/io.c
++++ b/io.c
+@@ -2836,22 +2836,25 @@ do_getline_redir(int into_variable, enum redirval redirtype)
+ 	assert(redirtype != redirect_none);
+ 	redir_exp = TOP();
+ 	rp = redirect(redir_exp, redirtype, & redir_error, false);
+-	DEREF(redir_exp);
+ 	decr_sp();
+ 	if (rp == NULL) {
+ 		if (redir_error) { /* failed redirect */
+ 			if (! do_traditional)
+ 				update_ERRNO_int(redir_error);
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
+2.44.4
+
diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extended/gawk/gawk_5.3.0.bb
index b1d1fe7ae4..56d7d7f76a 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://0001-m4-readline-add-missing-includes.patch \
            file://run-ptest \
            file://0001-Fix-some-C23-compilatio-issues.patch \
+           file://CVE-2026-40467.patch \
            "
 
 SRC_URI[sha256sum] = "378f8864ec21cfceaa048f7e1869ac9b4597b449087caf1eb55e440d30273336"
-- 
2.35.6



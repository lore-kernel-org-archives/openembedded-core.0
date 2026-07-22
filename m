Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BDE4C44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 09:57:08 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44190.1784714192214534638
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 02:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=S6H4qI1L;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3386; q=dns/txt;
  s=iport01; t=1784714192; x=1785923792;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DItjJ14WWnrO/SJYNmWdY3cZpoksSnSmfSgNFMjKsIM=;
  b=S6H4qI1Liv6ynHgM8/LXxRs42Ly+nvg/N/SC3Yw70UjD15cmbIdNW3V+
   T9SKUhnLyygr1akJ8RnxV5OIzYgsUVaqsbEsyVLB440qW5poXVCveiByN
   6zcVP7jmuHXHcpZiXR0JkopKJuS6QPr71GzABkQ9yDgcrXn5qACmzSI8c
   3nv8npvr/usDs7jeqY+J5bloDj3iR0FSaQdwkC8DDdvsOaN171WN6h25d
   X6ris+ZIrgrMWbEUMctguxNc8XHKHHwzmDJ/CtUddp/lV9Y6W5XH+Nsi/
   eYQqbNs5iWlAgy8TcPi3R4tZF8aQquU1n2wst9M5iyLmMLs1vcSgDHk/g
   g==;
X-CSE-ConnectionGUID: /VB+sEMITpyE7eix5fx+Gg==
X-CSE-MsgGUID: 9ti+FpVXTiqoISCA7cDw5g==
X-IPAS-Result: =?us-ascii?q?A0BJAgDCkmBq/5L/Ja1aglmCV3ReQ0mEV5FzA54bgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQUCjVcCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECAQMjDwEYAS0QHAMBAgMCJgICKyMIGYMCAYJ0AxHAcXqBM?=
 =?us-ascii?q?oEBgygBPwJDUNsuAQsUAQWBBS6FP4MdAYUCXBgBhHwnGxuBcoR+gQWBXAEDG?=
 =?us-ascii?q?IUhgmoEgiKBDIFaGAZQj1JIgQIcA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F?=
 =?us-ascii?q?zRYGwcFgR2BLoEChG4jHwM5f4EvdUp3LWkBEheBJoIUgToCgQMDCxgNSBEsN?=
 =?us-ascii?q?xQZBD0BbgeNaSOCPwGBDgErIpUbkmWhDwoog3WMIZU6GjOqbAuYfY4KllCEa?=
 =?us-ascii?q?YFoPIFHCwdwFYMiCUoZD444hWqDFMhzJzICAQEHMgEBBwIHAgwDC4FokX4BA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:hTFxHqOA0kkYA//vrR30lsFynXyQoLVcMsEvi/4bfWQNrUon1mcGm
 GUdUD/SbKmNZGrxLo9wOdzk8EhS7ZeEm9NgTnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf6gWQsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj67JQJgItEKg5xv5mLD5D9
 OxFJiBOQR/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmIS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzMnwsYDUXUrsTIJ49keOhh2j2WzZZs1mS46Ew5gA/ySQsieOzYICEJ4biqcN9z1qZ5
 UzewVTFAwgdFee04GWO3m3xibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MskCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:7QSxk67L1JhOr3dgEgPXwBbXdLJyesId70hD6qm+c3Nom6uj5q
 aTdZUgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4fTLfCFHZL7BkWqFOudl5sWb+6a1guqb5XJsQQZ2L5xE1W5Ce36m+okcfng9OXL/f6
 DsnfZ6mw==
X-Talos-CUID: 9a23:cPJAOG8AVww0XBH/LyaVvwkqMIM+X1j88G/BDhC1CHY0Rq3WZlDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AmXqvfw0G4pg3iIuu6NHbvUMRwjUjsrivS24Vr6U?=
 =?us-ascii?q?6utCDFBdbEmiWoCvqTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,178,1779148800"; 
   d="scan'208";a="513682952"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Jul 2026 09:56:31 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 43EAE18000202;
	Wed, 22 Jul 2026 09:56:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id DF4A3CAB20D; Wed, 22 Jul 2026 02:56:30 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH 2/4] gawk: Fix CVE-2026-40468
Date: Wed, 22 Jul 2026 02:56:25 -0700
Message-Id: <20260722095627.1424705-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260722095627.1424705-1-dkelaiya@cisco.com>
References: <20260722095627.1424705-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 09:57:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241640

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using the commit shown in [1].

[1] https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=062f2f2581b991362c046f7f2e238ffa34e6f8c7
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-40468

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../gawk/gawk/CVE-2026-40468.patch            | 65 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.3.0.bb      |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch b/meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch
new file mode 100644
index 0000000000..607f641615
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch
@@ -0,0 +1,65 @@
+From e281dfa04afc4660419ad69c9f24bc6b4067f8d8 Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Sat, 4 Apr 2026 21:45:58 +0300
+Subject: [PATCH] Minor integer overflow fixes.
+
+CVE: CVE-2026-40468
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=062f2f2581b991362c046f7f2e238ffa34e6f8c7]
+
+Backport Changes:
+- Adapt the parse_escape() type change for gawk 5.3.0, where i is
+  declared int instead of long.
+
+(cherry picked from commit 062f2f2581b991362c046f7f2e238ffa34e6f8c7)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ ChangeLog | 8 ++++++++
+ builtin.c | 2 +-
+ node.c    | 2 +-
+ 3 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 6bc88ebb..e691b241 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,11 @@
++2026-04-04         Arnold D. Robbins     <arnold@skeeve.com>
++
++	* builtin.c (do_sub): Make `sofar' be size_t to avoid
++	integer overflows.  Thanks to Michał Majchrowicz
++	<mmajchrowicz@afine.com> for the report.
++	* node.c (parse_escape): Change `i' to int64_t to avoid
++	overflows. Thanks to ASan with gcc -m32.
++
+ 2026-04-03         Arnold D. Robbins     <arnold@skeeve.com>
+ 
+ 	* io.c (do_getline_redir): Don't DEREF redir_exp too early.
+diff --git a/builtin.c b/builtin.c
+index ba3459db..80ab6069 100644
+--- a/builtin.c
++++ b/builtin.c
+@@ -2985,7 +2985,7 @@ do_sub(int nargs, unsigned int flags)
+ 	char *repl;
+ 	char *replend;
+ 	size_t repllen;
+-	int sofar;
++	size_t sofar;
+ 	int ampersands;
+ 	int matches = 0;
+ 	Regexp *rp;
+diff --git a/node.c b/node.c
+index f08a57d7..12a8fab4 100644
+--- a/node.c
++++ b/node.c
+@@ -571,7 +571,7 @@ parse_escape(const char **string_ptr, const char **result, size_t *nbytes)
+ 	static char buf[MB_LEN_MAX];
+ 	enum escape_results retval = ESCAPE_OK;
+ 	int c = *(*string_ptr)++;
+-	int i;
++	int64_t i;
+ 	int count;
+ 	int j;
+ 	const char *start;
+-- 
+2.44.4
+
diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extended/gawk/gawk_5.3.0.bb
index 56d7d7f76a..d79b0222a6 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
@@ -23,6 +23,7 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
            file://0001-Fix-some-C23-compilatio-issues.patch \
            file://CVE-2026-40467.patch \
+           file://CVE-2026-40468.patch \
            "
 
 SRC_URI[sha256sum] = "378f8864ec21cfceaa048f7e1869ac9b4597b449087caf1eb55e440d30273336"
-- 
2.35.6



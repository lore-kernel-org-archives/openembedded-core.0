Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE425C44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 09:54:57 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44172.1784714092209873700
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 02:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NAS7KR6x;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4756; q=dns/txt;
  s=iport01; t=1784714092; x=1785923692;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wIZfzRfTsZK7dzAl3tdePMlIldkppGSWq69TiQLNXws=;
  b=NAS7KR6xjx/ZVKsyMACH6/xWd5BEcht2kArzK4Rp2NG5E/9PrUU59fen
   ZuDuIZyuyiZmqgyMsg9w5E3QoDiUPICeTwQCyi5kuajD+k13TR2hJFuyJ
   6MdT4xzFzk5+UIrRHPrfxYc4tO61hVuUHeiqd/VT6z9TiATZrWlsihZuS
   9AuC69QrAwpODqCrQUYXxNaog+1fw/i9ou5iB/Rs07kKTFo1VfSAHBxJE
   qvvYFyfajPfzDMVZWzTFQdorM1KermnOTT4gjLN8A68gsqf0tyezjNayC
   xHzBYK2lJP+Ir7dzL/B1D71gguvYbaOWopd7UgYRawygKrg78uQsL8xqj
   w==;
X-CSE-ConnectionGUID: J8C7Or8US4qwgWJ3ofeR+g==
X-CSE-MsgGUID: pVkJyLSoRS+Mgi2NzKn22A==
X-IPAS-Result: =?us-ascii?q?A0BJAgDCkmBq/4//Ja1aglmCV3ReQ0mEV5FzA54bgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQUCjVcCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECAQMjDwEYAS0QHAMBAgMCJgICKyMIGYMCAYJ0AxHAcXqBM?=
 =?us-ascii?q?oEBgygBPwJDUNsuAQsUAQWBBS6FP4MdAYUCXBgBhHwnGxuBcoEVg2mBBYFcA?=
 =?us-ascii?q?QMYhSGCagSCIoEMgVoYBlCPUkiBAhwDWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XNFgbBwWBHYEugQKEbiMfAzl/gS91SnctaQESF4EmghSBOgKBAwMLGA1IE?=
 =?us-ascii?q?Sw3FBkEPQFuB41pI4I5BgEBWTQBK4FDgQWSdSSSQaEPCiiDdYwhlToaM6psC?=
 =?us-ascii?q?5h9jgqWUIRpgWg8gUcLB3AVgyIJShkPjjiFaoMUyHMnMgIBAQcyAQEHAgcCD?=
 =?us-ascii?q?AMLgWiRfgEB?=
IronPort-Data: A9a23:hS+A+qJC3cqW5XGiFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENSgTdTz
 zcZWmCCMveMNDD9f9AlYd++o05X6JXSndU3HAEd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGQuajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1MXGppGpdIx90rGH5By
 t5DLz4AVFOM0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBU7AtQIvIROPB4towMDUY358VW62BI
 ZBENHw2ME+ojx5nYj/7DLoyn+qsj3juehVTqUmeouw85G27IAlZjeG2YIqIJILQLSlTtl6mp
 UDX21/+OCpZEdOekxyX0XT23MaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1jfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9FRpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:PQHRGqEGvzLfeNPTpLqENseALOsnbusQ8zAXPo5KJiC9Ffbo8f
 xG/c5rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAdGSS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jcjpy1iZNNXN77V1TLu
 vm2vZ6
X-Talos-CUID: =?us-ascii?q?9a23=3Aw6mitGl+vGQmivzAcmz3HE+wvBTXOV+N5yj3OR+?=
 =?us-ascii?q?FMjpwV7KqawSX9q5e0MU7zg=3D=3D?=
X-Talos-MUID: 9a23:h91phwVpzZYRdtjq/CfShxNzEPxv2Z/tLU8My7MUmM/ebwUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,178,1779148800"; 
   d="scan'208";a="513885662"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Jul 2026 09:54:33 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id A88CD1800039A;
	Wed, 22 Jul 2026 09:54:33 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 5171CCAB20E; Wed, 22 Jul 2026 02:54:33 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 3/4] gawk: Fix CVE-2026-40469
Date: Wed, 22 Jul 2026 02:54:29 -0700
Message-Id: <20260722095430.1416791-3-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260722095430.1416791-1-dkelaiya@cisco.com>
References: <20260722095430.1416791-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 09:54:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241639

From: Darsh Kelaiya <dkelaiya@cisco.com>

NVD [3] identifies upstream merge commit [2] as the fix. The
CVE-specific change is its second parent [1], which adds 32-bit
overflow checking in do_sub().

[1] https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=aa7272a6e1184cdd21ab8f89200219abd8053eda
[2] https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=ae1b2d508f46913269a9e62aceda3636afe8147b
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-40469

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../gawk/gawk/CVE-2026-40469.patch            | 90 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.4.0.bb      |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch b/meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch
new file mode 100644
index 0000000000..73cda824a7
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch
@@ -0,0 +1,90 @@
+From 436584a4302b1c6da55080c0a0408a98e551ea7e Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Mon, 6 Apr 2026 10:56:38 +0300
+Subject: [PATCH] Add overflow checking in do_sub for 32 bit systems.
+
+CVE: CVE-2026-40469
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=aa7272a6e1184cdd21ab8f89200219abd8053eda]
+
+(cherry picked from commit aa7272a6e1184cdd21ab8f89200219abd8053eda)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ ChangeLog |  9 +++++++++
+ builtin.c | 25 ++++++++++++++++++++-----
+ 2 files changed, 29 insertions(+), 5 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 8cdf90f6..c1b2e7f4 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,12 @@
++2026-04-06         Arnold D. Robbins     <arnold@skeeve.com>
++
++	* builtin.c (do_sub): Check for overflow in calculation of size
++	of result buffer by doing the math in 64 bits. This provides
++	a fatal message on 32 bit systems if overflow happens instead
++	of letting dynamic memory get corrupted and likely causing
++	a core dump. Thanks to Michał Majchrowicz <mmajchrowicz@afine.com>
++	for the report and fix.
++
+ 2026-04-04         Arnold D. Robbins     <arnold@skeeve.com>
+ 
+ 	* builtin.c (do_sub): Make `sofar' be size_t to avoid
+diff --git a/builtin.c b/builtin.c
+index d0e083da..3906d507 100644
+--- a/builtin.c
++++ b/builtin.c
+@@ -1820,11 +1820,13 @@ do_sub(int nargs, unsigned int flags)
+ 	bool lastmatchnonzero;
+ 	char *mb_indices = NULL;
+ 	int searchflags = RE_NEED_START;
++	const char *fname = NULL;	// for fatal message, below
+ 
+ 	if ((flags & GENSUB) != 0) {
+ 		double d;
+ 		NODE *glob_flag;
+ 
++		fname = "gensub";
+ 		check_exact_args(nargs, "gensub", 4);
+ 
+ 		tmp = PEEK(3);
+@@ -1856,11 +1858,9 @@ do_sub(int nargs, unsigned int flags)
+ 		DEREF(glob_flag);
+ 		searchflags |= RE_NEED_SUB;
+ 	} else {
+-		if ((flags & GSUB) != 0) {
+-			check_exact_args(nargs, "gsub", 3);
+-		} else {
+-			check_exact_args(nargs, "sub", 3);
+-		}
++		fname = ((flags & GSUB) != 0) ? "gsub" : "sub";
++
++		check_exact_args(nargs, fname, 3);
+ 
+ 		/* take care of regexp early, in case re_update is fatal */
+ 
+@@ -1976,6 +1976,21 @@ do_sub(int nargs, unsigned int flags)
+ 		 * vary since ampersand is actual text of regexp match.
+ 		 */
+ 
++		// 4/2026: This overflow check simply provides a fatal
++		// message instead of letting realloc() die later after
++		// a buffer overrun.  It simply makes the user experience better,
++		// but does not prevent gawk from dying miserably.  I suppose
++		// it's worth the trouble, but just barely.
++
++		/* uint64_t so the product is 64-bit even on 32-bit ILP32 builds */
++		uint64_t repl_contribution =
++			(uint64_t)(unsigned int)ampersands
++			* (uint64_t)(uintptr_t)(matchend - matchstart);
++		if (repl_contribution > (uint64_t)SIZE_MAX
++		    || repl_contribution > (uint64_t)SIZE_MAX - (size_t)(matchend - text)
++						- repllen - 1)
++			fatal(_("%s: replacement expansion too large"), fname);
++
+ 		/*
+ 		 * add 1 to len to handle "empty" case where
+ 		 * matchend == matchstart and we force a match on a single
+-- 
+2.53.0
+
diff --git a/meta/recipes-extended/gawk/gawk_5.4.0.bb b/meta/recipes-extended/gawk/gawk_5.4.0.bb
index 345103a7f0..a7c88224dd 100644
--- a/meta/recipes-extended/gawk/gawk_5.4.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.4.0.bb
@@ -30,6 +30,7 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.xz \
            file://0001-configure.ac-re-enable-disabled-printf-features.patch \
            file://CVE-2026-40467.patch \
            file://CVE-2026-40468.patch \
+           file://CVE-2026-40469.patch \
            "
 
 SRC_URI[sha256sum] = "3dd430f0cd3b4428c6c3f6afc021b9cd3c1f8c93f7a688dc268ca428a90b4ac1"
-- 
2.35.6



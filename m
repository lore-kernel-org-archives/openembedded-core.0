Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 149C5C531C8
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 09:56:38 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44350.1784714192336252837
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 02:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gtH+jVt4;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4694; q=dns/txt;
  s=iport01; t=1784714192; x=1785923792;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vcc4UCCoYauYcdAgDRbuuj26N5RyKDAIs3JPBLlHBck=;
  b=gtH+jVt4X4fWlxazdzH5qyo8JwftMBJUglCoojUfyKQ++lwzGvOttAFn
   asgmun+t0zFtvBjm5SUqNCszKSn4754U6ggD75p35uXhnlI4lqoUXCIr/
   dcDgnudL8oLk6KEvYRDvKAW4tLyMYHsg8yjP05i5gwaZI6hTSFt4Z4HHM
   yyEtwAnkcMhd2msIkx0/n1SrMKuQ6yyUQvZ/uzQiuPd368DoNZXWag1fn
   E7YRRWTxfyxeC6W2+RONxhGPclnjLdMobArcW0zIm6HmITZDvOE4vHXsC
   /ElvtAhc8ClaLft+EBlD1T5Sewjphf/a1a4rjTjDxO7L93oPTiiYikwLW
   Q==;
X-CSE-ConnectionGUID: AFSif1O9RF2w6MhZee/A+A==
X-CSE-MsgGUID: A2cCdngORQGPdJgONejEdQ==
X-IPAS-Result: =?us-ascii?q?A0BJAgA+kmBq/5H/Ja1aglmCV3ReQ0mEV5FzA54bgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQUCjVcCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECAQMjDwEYAS0QHAMBAgMCJgICKyMIGYMCAYJ0AxHAcXqBM?=
 =?us-ascii?q?oEBgygBPwJDUNsuAQsUAQWBBS6FP4MdAYUCXBgBhHwnGxuBcoEVg2mBBYFcA?=
 =?us-ascii?q?QMYhSGCagSCIoEMgVoYBlCPUkiBAhwDWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XNFgbBwWBHYEugQKEbiMfAzl/gS91SnctaQESF4EmghSBOgKBAwMLGA1IE?=
 =?us-ascii?q?Sw3FBkEPQFuB41pI4I5BgEBPFEBKyKBIYEFknUkkkGhDwoog3WMIZU6GjOqb?=
 =?us-ascii?q?AuYfY4KllCEaYFoPIFHCwdwFYMiCUoZD444hWqDFMhzJzICAQEHMgEBBwIHA?=
 =?us-ascii?q?gwDC4FokX4BAQ?=
IronPort-Data: A9a23:pcgFcKIY1/IpM2cnFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS1WYOy
 WsXDD+Eb/aPYDanc9x3YY6z80NX6pfXxtZgGgAd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGQuajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1HIno3M9Q/q9xZW34Q0
 PwqJT1KR1Oq0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBXbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEmojx5nYj/7DLoyn+qsj3juehVTqUmeouw85G27IAlZjeG2a4GMJYzQLSlTtm/Cr
 UnK+WveOCg1DNC9xh2j/3CBitaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1bfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EhpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:Smer76mJfsMP4YGFdDf8EHwKULzpDfLy3DAbv31ZSRFFG/FwWf
 rAoB19726TtN9xYgBGpTnuAsi9qB/nmKKdpLNhX4tKPzOW3FdAUrsD0WKK+VSJcEfDH6xmpM
 JdmsNFZuEYY2IXsS/S2njALz9Z+qjlzImYwcHD0nxqUQZmL4tk7wt/F0KnN3cefng/OXL8f6
 DsnPauYFGbCA8qUvg=
X-Talos-CUID: 9a23:4rwfw25thIoUNkyp9Nss3WAvG858VSzn4i3PfWq4O2tkD5TWYArF
X-Talos-MUID: 9a23:1+MuBAYV1yA+iuBTnmXnrz1kO+BS2ouWBGICtrMLueSIDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,178,1779148800"; 
   d="scan'208";a="513331782"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Jul 2026 09:56:31 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 52523180001ED;
	Wed, 22 Jul 2026 09:56:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id EA239CAB20E; Wed, 22 Jul 2026 02:56:30 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH 3/4] gawk: Fix CVE-2026-40469
Date: Wed, 22 Jul 2026 02:56:26 -0700
Message-Id: <20260722095627.1424705-3-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260722095627.1424705-1-dkelaiya@cisco.com>
References: <20260722095627.1424705-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 09:56:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241642

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
 meta/recipes-extended/gawk/gawk_5.3.0.bb      |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch b/meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch
new file mode 100644
index 0000000000..49b6a23b01
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch
@@ -0,0 +1,90 @@
+From f907980a3e7a58006b796308021c8410a24e0f3c Mon Sep 17 00:00:00 2001
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
+index e691b241..74eea81f 100644
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
+index 80ab6069..d63cf47b 100644
+--- a/builtin.c
++++ b/builtin.c
+@@ -2998,11 +2998,13 @@ do_sub(int nargs, unsigned int flags)
+ 	long current;
+ 	bool lastmatchnonzero;
+ 	char *mb_indices = NULL;
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
+@@ -3033,11 +3035,9 @@ do_sub(int nargs, unsigned int flags)
+ 		}
+ 		DEREF(glob_flag);
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
+@@ -3153,6 +3153,21 @@ do_sub(int nargs, unsigned int flags)
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
+2.44.4
+
diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extended/gawk/gawk_5.3.0.bb
index d79b0222a6..7bd34a3ff8 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://0001-Fix-some-C23-compilatio-issues.patch \
            file://CVE-2026-40467.patch \
            file://CVE-2026-40468.patch \
+           file://CVE-2026-40469.patch \
            "
 
 SRC_URI[sha256sum] = "378f8864ec21cfceaa048f7e1869ac9b4597b449087caf1eb55e440d30273336"
-- 
2.35.6



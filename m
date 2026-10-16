Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30A1CCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:53:26 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16260.1792133603646271459
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:53:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=iDgoDGjr;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4184; q=dns/txt;
  s=iport01; t=1792133603; x=1793343203;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hy9VbCdvY9yqpTKMevwvcWc0qVZMpmqTb//EEHv+V2k=;
  b=iDgoDGjrd0QrYDjwotbKJB8ectVxog0L4l0G6JJdjrJHELm3s0RiWnmV
   XYobggdF25WvdBOv1dZA6o/hftVHeH1DnqPz+cwSPectn7Yks0ODm4dv7
   1pH4T2r7MKn+qUD/PaN2uaCc6OcvYqZAxdQHu4334MYuIByJb5HmhE2Ol
   SiZzjS3px68nHum5H2BDuHr8nvl3oewihErc+CO3h9EzD2ISwVo7XIvtj
   5Oxc3oDbfeoh0QXGHyvPIFSCcG9Q9WxZYwOeOdyGxQ1uZO1qVwvgPmzpT
   zwoMtHWh0MRydjiXXkcAz5uK//BVnB99wrPsQD17IhKllUDTtUw8j8IQU
   A==;
X-CSE-ConnectionGUID: saMwWxvgSlSqONcaPVPu3Q==
X-CSE-MsgGUID: 4ypEncSCSwKZPODm5epaFw==
X-IPAS-Result: =?us-ascii?q?A0BaAgDEyNFq/43/Ja1aHgEBCxIMggULgld1YENJlkqLa?=
 =?us-ascii?q?JI3gXQKDwEBAQ8uDxQEAQGFBY4XAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDZASAQIBBCYLARgBLSwDAQJPBwQjIYMCAYI6AzcDE?=
 =?us-ascii?q?Qa8ZIF5M4EBgykBPwJDUNhLDYJaAQsUAYE4hUCCf4UkXRgBhHwnGxuBcoEVg?=
 =?us-ascii?q?2mBBYEaQgECAoEqC4ZtBIIigQyBWh5llERIgR4DWSwBVRMNCgsHBYFoAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQcbBgWBHYEgghYjGTZ6gQlegSspYAEQF4EJggcCglSCAAIBS?=
 =?us-ascii?q?UEOB0VTCSVDEkcmIggSCQETGjALgRs4PAkoQRcMcwwdBXIIAg0JBykYDUgRL?=
 =?us-ascii?q?DcVGQQ+bgeSFB6CZXsTASkCF4E2pDOCIaAecQoog3aMIo0+ggCFfBozqm8Lm?=
 =?us-ascii?q?H2OCoQJkV5ohGmBaDyBKB8LB3AVSA6CTAlKGQ+OOYVqglnKAicyAjsBAQcCB?=
 =?us-ascii?q?w4DC4FokAGBfQEB?=
IronPort-Data: A9a23:MnPDoqICtgCVS5INFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS1TIAm
 mROXW6DPP2IMzOhe4pyPYjkoR8C6sTVnNcyHgcd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8g2cqajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN11BWQpAp0G9d1zOnhp0
 /cREA41c0u60rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBUbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2ME2ojx5nYj/7DLoyn+qsj3juehVTqUmeouw85G27IAlZjeOzbIuLKoHWLSlTthqJv
 k/A9F/SOQ45BuS45T/Y/2qlqPCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1rfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:rNQzcK9OFzrMtrtS6eFuk+DuI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WKb+UyCJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadF/DFCm5rY49s3CBxWPGZXV50=
X-Talos-CUID: =?us-ascii?q?9a23=3A+TVqRmnPj72rX/Tp1VLbYKV06H/XOWbU6WjvM1G?=
 =?us-ascii?q?3MmJSUZqzQlaoxpt5yPM7zg=3D=3D?=
X-Talos-MUID: 9a23:RlDZkgnJGFZEyTDZvqDadno+Jd9F5a+VI3sSsqc+nOWBaCFoMhmC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536496854"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:53:22 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 8BAAE180001A9;
	Fri, 16 Oct 2026 06:53:22 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 330FACC1611; Thu, 15 Oct 2026 23:53:22 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 1/3] busybox: fix CVE-2026-38752
Date: Thu, 15 Oct 2026 23:53:12 -0700
Message-Id: <20261016065314.3923094-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:53:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247997

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix shown in [1].
The advisory identifying the fix is referenced in [2].

[1] https://lists.busybox.net/pipermail/busybox/2026-June/092351.html
[2] https://nvd.nist.gov/vuln/detail/cve-2026-38752

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../busybox/busybox/CVE-2026-38752.patch      | 83 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-38752.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-38752.patch b/meta/recipes-core/busybox/busybox/CVE-2026-38752.patch
new file mode 100644
index 00000000000..52cba2417e7
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2026-38752.patch
@@ -0,0 +1,83 @@
+From e886726a2f0ad397666687a5fc65c4e80240f964 Mon Sep 17 00:00:00 2001
+From: Sanghyun Park <sanghyun.park.cnu@gmail.com>
+Date: Tue, 16 Jun 2026 12:16:05 +0900
+Subject: [PATCH] awk: fix stack overflow in evaluate()
+
+Recursive awk functions can keep re-entering evaluate() until the
+process stack is exhausted. Track active function-call depth and report a
+normal awk error once the limit is reached instead of overflowing the
+stack.
+
+CVE: CVE-2026-38752
+Upstream-Status: Submitted [https://lists.busybox.net/pipermail/busybox/2026-June/092351.html]
+
+Signed-off-by: Sanghyun Park <sanghyun.park.cnu@gmail.com>
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ editors/awk.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/editors/awk.c b/editors/awk.c
+index 64e752f..299e480 100644
+--- a/editors/awk.c
++++ b/editors/awk.c
+@@ -638,6 +638,7 @@ struct globals2 {
+ 	smalluint exitcode;
+ 
+ 	unsigned evaluate__seed;
++	unsigned evaluate__func_depth;
+ 	var *evaluate__fnargs;
+ 	regex_t evaluate__sreg;
+ 
+@@ -709,6 +710,7 @@ static const char EMSG_UNEXP_TOKEN[] ALIGN1 = "Unexpected token";
+ static const char EMSG_DIV_BY_ZERO[] ALIGN1 = "Division by zero";
+ static const char EMSG_INV_FMT[] ALIGN1 = "Invalid format specifier";
+ static const char EMSG_TOO_FEW_ARGS[] ALIGN1 = "Too few arguments";
++static const char EMSG_RECURSION[] ALIGN1 = "Recursion limit exceeded";
+ static const char EMSG_NOT_ARRAY[] ALIGN1 = "Not an array";
+ static const char EMSG_POSSIBLE_ERROR[] ALIGN1 = "Possible syntax error";
+ static const char EMSG_UNDEF_FUNC[] ALIGN1 = "Call to undefined function";
+@@ -2994,6 +2996,7 @@ static var *evaluate(node *op, var *res)
+ #define fnargs (G.evaluate__fnargs)
+ /* seed is initialized to 1 */
+ #define seed   (G.evaluate__seed)
++#define func_depth (G.evaluate__func_depth)
+ #define sreg   (G.evaluate__sreg)
+ 
+ 	var *tmpvars;
+@@ -3305,13 +3308,17 @@ static var *evaluate(node *op, var *res)
+ 			var *argvars, *sv_fnargs;
+ 			const char *sv_progname;
+ 			int nargs, i;
++			enum { MAX_AWK_FUNC_DEPTH = 1000 };
+ 
+ 			debug_printf_eval("FUNC\n");
+ 
+ 			if (!op->r.f->defined)
+ 				syntax_error(EMSG_UNDEF_FUNC);
++			if (func_depth >= MAX_AWK_FUNC_DEPTH)
++				syntax_error(EMSG_RECURSION);
+ 
+ 			/* The body might be empty, still has to eval the args */
++			func_depth++;
+ 			nargs = op->r.f->nargs;
+ 			argvars = nvalloc(nargs);
+ 			i = 0;
+@@ -3339,6 +3346,7 @@ static var *evaluate(node *op, var *res)
+ 
+ 			g_progname = sv_progname;
+ 			fnargs = sv_fnargs;
++			func_depth--;
+ 
+ 			break;
+ 		}
+@@ -3696,6 +3704,7 @@ static var *evaluate(node *op, var *res)
+ 	return res;
+ #undef fnargs
+ #undef seed
++#undef func_depth
+ #undef sreg
+ }
+ 
+-- 
+2.35.6
diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-core/busybox/busybox_1.37.0.bb
index b020c923be3..d4352fd4cbe 100644
--- a/meta/recipes-core/busybox/busybox_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
@@ -66,6 +66,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2024-58251.patch \
            file://CVE-2026-29004-01.patch \
            file://CVE-2026-29004-02.patch \
+           file://CVE-2026-38752.patch \
            file://CVE-2026-38754.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg"
-- 
2.35.6



Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC69C4453A
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 09:54:37 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44170.1784714074817948023
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 02:54:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=XbHFeHE2;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3280; q=dns/txt;
  s=iport01; t=1784714074; x=1785923674;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ElJ0dawxxg1pwR0FGqSM330uZmXmuIyZ0VQU3ihV4Yg=;
  b=XbHFeHE2QuWjqWXg6B/FyAAUdK97APZHsp9NpKyJFR+Civ2Bn8dac1yk
   iNNea7HTbFk5WQggUi88KSazcG+yUIH6jw4XTPRUIpJrN7a/XT4DkinRD
   wobJ8iow8Wo4DUPL1QHj7fonDgDTcmSfHkNCr7H/embaQ6tYJaWGdQp0F
   lJfdR+TnwD5j6ylZvH0LFRYA6yjQ3USi0xmgCoJT5/nPD3f5wRDNoDsAn
   SoxzsRI2N8esgNxSsKuNd63tf2Fb7apia05iGLKsy7HlT/GvijiomdqZN
   ErmmkvC/DTeY43yxIEdamQX7dED+Dz7pIr+T+bafG0SFLvL8wimLoapr8
   w==;
X-CSE-ConnectionGUID: upCNIK7eTX6RkpM6ofbKBw==
X-CSE-MsgGUID: 5L+PbMutQ5+vOeXGoAKutA==
X-IPAS-Result: =?us-ascii?q?A0BJAgA+kmBq/5P/Ja1aglmCV3ReQ0mEV5FzA54bgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQUCjVcCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECAQMjDwEYAS0QHAMBAgMCJgICKyMIGYMCAYJ0AxHAcXqBM?=
 =?us-ascii?q?oEBgygBPwJDUNsuAQsUAQWBBS6FP4MdAYUCXBgBhHwnGxuBcoR+gQWBXAEDG?=
 =?us-ascii?q?IUhgmoEgiKBDIFaGAZQj1JIgQIcA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F?=
 =?us-ascii?q?zRYGwcFgR2BLoEChG4jHwM5f4EvdUp3LWkBEheBJoIUgToCgQMDCxgNSBEsN?=
 =?us-ascii?q?xQZBD0BbgeNaSOCPwFaNAErlT2SZaEPCiiDdYwhlToaM6psC5h9jgqWUIRpg?=
 =?us-ascii?q?Wg8gUcLB3AVgyIJShkPjjiFaoMUyHMnMgIBAQcyAQEHAgcCDAMLgWiRfgEB?=
IronPort-Data: A9a23:eZj5JqncHLlzq1bwuoY3Rxjo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZCDuGb6yLYzOkLo8ibYmz8B5UvJXcyYM3S1Ns/C9nFFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpLsfjb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FZAA0cBWIj5Dy
 cxGEjMVS06EieiV6q3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMmbBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTZT/7C7pm9AusrnX8fjlRqUOcjaE2+GPUigd21dABNfKIIoHRHJsMxxnwS
 mTuokC6Ohs/KcCmlHmb1X+cqejmvj7ncddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1dFnhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:/Jdj/alW7jKEXJqoT8Invj5B5QTpDfLy3DAbv31ZSRFFG/FwWf
 rAoB19726TtN9xYgBGpTnuAsi9qB/nmKKdpLNhX4tKPzOW3FdAUrsD0WKK+VSJcEfDH6xmpM
 JdmsNFZuEYY2IXsS/S2njALz9Z+qjlzImYwcHD0nxqUQZmL4tk7wt/F0KnN3cefng/OXL8f6
 DsnPauYFGbCA8qUvg=
X-Talos-CUID: =?us-ascii?q?9a23=3AWSVseGr3yOOMTIzedX0mc6DmUd09WVv87yjdH3/?=
 =?us-ascii?q?mM2VxbeOSR1Wz0rwxxg=3D=3D?=
X-Talos-MUID: 9a23:cDRQDAlA9FQFOQrV6I1Ddno/EIRQ6YGzFHlQ0oshtvmrMgVTJiu02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,178,1779148800"; 
   d="scan'208";a="505316117"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Jul 2026 09:54:33 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id A249D18000899;
	Wed, 22 Jul 2026 09:54:33 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 4AB84CAB20D; Wed, 22 Jul 2026 02:54:33 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 2/4] gawk: Fix CVE-2026-40468
Date: Wed, 22 Jul 2026 02:54:28 -0700
Message-Id: <20260722095430.1416791-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260722095430.1416791-1-dkelaiya@cisco.com>
References: <20260722095430.1416791-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 09:54:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241637

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using the commit shown in [1].

[1] https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=062f2f2581b991362c046f7f2e238ffa34e6f8c7
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-40468

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../gawk/gawk/CVE-2026-40468.patch            | 61 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.4.0.bb      |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch b/meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch
new file mode 100644
index 0000000000..6b767c3bea
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch
@@ -0,0 +1,61 @@
+From 1e0b3ebeb4a39680dcd9c8eeadd8e3bf1c7c6200 Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Sat, 4 Apr 2026 21:45:58 +0300
+Subject: [PATCH] Minor integer overflow fixes.
+
+CVE: CVE-2026-40468
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=062f2f2581b991362c046f7f2e238ffa34e6f8c7]
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
+index 517aba91..8cdf90f6 100644
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
+index 6305b541..d0e083da 100644
+--- a/builtin.c
++++ b/builtin.c
+@@ -1806,7 +1806,7 @@ do_sub(int nargs, unsigned int flags)
+ 	char *repl;
+ 	char *replend;
+ 	size_t repllen;
+-	int sofar;
++	size_t sofar;
+ 	int ampersands;
+ 	int matches = 0;
+ 	Regexp *rp;
+diff --git a/node.c b/node.c
+index 0e2bfb0f..f1e14dff 100644
+--- a/node.c
++++ b/node.c
+@@ -584,7 +584,7 @@ parse_escape(const char **string_ptr, const char **result, size_t *nbytes)
+ 	static char buf[MB_LEN_MAX];
+ 	enum escape_results retval = ESCAPE_OK;
+ 	int c = *(*string_ptr)++;
+-	long i;
++	int64_t i;
+ 	int count;
+ 	int j;
+ 	const char *start;
+-- 
+2.53.0
+
diff --git a/meta/recipes-extended/gawk/gawk_5.4.0.bb b/meta/recipes-extended/gawk/gawk_5.4.0.bb
index 59c4cb2536..345103a7f0 100644
--- a/meta/recipes-extended/gawk/gawk_5.4.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.4.0.bb
@@ -29,6 +29,7 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.xz \
            file://run-ptest \
            file://0001-configure.ac-re-enable-disabled-printf-features.patch \
            file://CVE-2026-40467.patch \
+           file://CVE-2026-40468.patch \
            "
 
 SRC_URI[sha256sum] = "3dd430f0cd3b4428c6c3f6afc021b9cd3c1f8c93f7a688dc268ca428a90b4ac1"
-- 
2.35.6



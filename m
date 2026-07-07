Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6690DC44500
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 05:41:23 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.167320.1783402872875120323
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 22:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=eTnlghvi;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=94183; q=dns/txt;
  s=iport01; t=1783402872; x=1784612472;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EXRAfA9qiuKLvX1pUYxZUdNRu47n9xl8BszNAXE1qVo=;
  b=eTnlghvirQJlEmY2DYrmRIbKbVWbJ8fcM2cXyZ1qQzDjCI6y+HhqjqX8
   JLmXTsLwnzKHVicT/m645ZBuAG08jv0/wdDpn+q6d5ew2tIiTmJzZVZXO
   oEWbrBS72UkTtRREPpQTgUiyLIhIhTl+G9+mkgNf0kgRv7ISVJmEHCZZD
   bAuPy6Z3h4+UMTKTWEZbhykQfMBdvwXXQFUlJppozjamCjexigFhQMHRL
   WXwMKby1oa70jLV3GRM6g45b93zsOGiMIU2El+g/jdg2dkgKRbvZGPJYj
   rX1CMhO1WTwE9+e/PyLKjfeqESty5qD5SiPKrPB0Gf+hfeakmb7D1iJEU
   Q==;
X-CSE-ConnectionGUID: /+PD1nZgQUGY8bwFNOYaJw==
X-CSE-MsgGUID: xUywZvYDQa2T5r/9qtN3xA==
X-IPAS-Result: =?us-ascii?q?A0BOAgD5j0xq/43/Ja1aHgEBCxIMggULgld0X0JJA4RUk?=
 =?us-ascii?q?XQDgROQN4xRFIFqDwEBAQ9KBwQBAYUGAo1NAiY0CQ4BAgQDAgMBAQEBAQEBA?=
 =?us-ascii?q?QEBAQsBAQUBAQECAQcFgQ4Thk8NhloBAgEDGgEIBAsBGAEtEAkTAwECAwIRA?=
 =?us-ascii?q?xICAisjCBmDAgGCcwIBEQacHptEen8zgQGDKAExAwsCBQ8vUNssAQsUAQWBB?=
 =?us-ascii?q?S6FP4McAYUCWxgBRIMZgR8nGxuBcoEVgTuBOHaBBYE6IgECARh/DiFXEYMLg?=
 =?us-ascii?q?moEgiKBDIFaGAYyVYFFhFSIHEiBAhwDWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XNFgbBwWBHYFrgQKEeSMfAzl/gTB1SnktgQIBEh4KgVKBUQMLGA1IESw3F?=
 =?us-ascii?q?BsEPQFuB40NFw+BORNfCwcBLAQwGhMBKQIXZAobIw4PHRYBGBELAQWTAwkHC?=
 =?us-ascii?q?jiPXoIhgTWfWgoog3WMIZU6GjOFW6URmQiOCpU0ZTeEaIFoPIFZcBWDIgkJQ?=
 =?us-ascii?q?RkPVo1UAwsLg2CFE1HIdiQ1AgEBBwMvAQEHAgcBAQsBAwuBaJAAJndgAQE?=
IronPort-Data: A9a23:XnJFoqCqI68MMRVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApDlwhWRVy
 TRMC22BaancYmH9foxybdi3/EhVucDTzYc3OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYAD9hGYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEhLZWIBgwD4Ihx8lGUWtR2
 9o/GTkvcUXW7w626OrTpuhEnM8vKozveYgYoHwllW2fBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY2BPjDS0Un1lM/AYkmlf2tj2PXeDxDo1XTrq0yi4TW5FAgj+OxaIqFILRmQ+1Fo1eHl
 Hz3013wWC1HLpvO0CajqWKF07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KIpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:p/ZjrqqKn5sl5ItOB9zl2mAaV5r1eYIsimQD101hICG9vPb2qy
 nIpoV86faUskd3ZJhOo7G90cW7LE80sKQFg7X5Xo3SODUOxlHJEGgK1+KLqFfd8m/Fh4tgPM
 xbHZSWZuedMbFSt7eC3ODBKadC/PC3tIa1mOzZ03BhCStua61m8kNFLzzzKDwPeOGDbqBJbq
 Z1IaF81kGdRUg=
X-Talos-CUID: 9a23:uRKh9W5YTzcx+C/6bNsssw0sNpkjQHLk8Vjhc0WnJ0BOebS3VgrF
X-Talos-MUID: 9a23:Kug0fguvsPMigt7kVc2nlAxzK/V20oiXARoxzI9B6tCYE3dgEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,153,1779148800"; 
   d="scan'208";a="497340882"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 Jul 2026 05:41:10 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 72F27180004B6;
	Tue,  7 Jul 2026 05:41:10 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 1AE35CC1611; Mon,  6 Jul 2026 22:41:10 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [meta-oe][scarthgap][PATCH 2/2] samba: Fix CVE-2026-4408
Date: Mon,  6 Jul 2026 22:41:05 -0700
Message-Id: <20260707054105.2419361-2-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260707054105.2419361-1-asparmar@cisco.com>
References: <20260707054105.2419361-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 05:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240350

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream Samba security backport for
CVE-2026-4408. The upstream security bundle is referenced in [1],
and the public CVE advisory is referenced in [2]. The individual
backported commit links are recorded in the embedded patch headers.

Only the CVE-2026-4408-relevant commits from [1] are backported:
[PATCH 11/31] through [PATCH 21/31] and [PATCH 25/31] through
[PATCH 31/31]. The remaining bundle commits are intentionally omitted
because they fix separate CVEs: CVE-2026-1933, CVE-2026-2340,
CVE-2026-3012, CVE-2026-3238, and CVE-2026-4480-only changes.

[1] https://www.samba.org/samba/ftp/patches/security/samba-4.22.9-security-2026-05-25.patch
[2] https://www.samba.org/samba/security/CVE-2026-4408.html

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../samba/samba/CVE-2026-4408_p1.patch        |   75 ++
 .../samba/samba/CVE-2026-4408_p10.patch       |  339 +++++
 .../samba/samba/CVE-2026-4408_p11.patch       |   94 ++
 .../samba/samba/CVE-2026-4408_p12.patch       |   47 +
 .../samba/samba/CVE-2026-4408_p13.patch       |  174 +++
 .../samba/samba/CVE-2026-4408_p14.patch       |   59 +
 .../samba/samba/CVE-2026-4408_p15.patch       | 1108 +++++++++++++++++
 .../samba/samba/CVE-2026-4408_p16.patch       |  422 +++++++
 .../samba/samba/CVE-2026-4408_p17.patch       |   55 +
 .../samba/samba/CVE-2026-4408_p18.patch       |   52 +
 .../samba/samba/CVE-2026-4408_p2.patch        |  133 ++
 .../samba/samba/CVE-2026-4408_p3.patch        |  208 ++++
 .../samba/samba/CVE-2026-4408_p4.patch        |  179 +++
 .../samba/samba/CVE-2026-4408_p5.patch        |   46 +
 .../samba/samba/CVE-2026-4408_p6.patch        |  131 ++
 .../samba/samba/CVE-2026-4408_p7.patch        |   84 ++
 .../samba/samba/CVE-2026-4408_p8.patch        |   39 +
 .../samba/samba/CVE-2026-4408_p9.patch        |   61 +
 .../samba/samba_4.19.9.bb                     |   18 +
 19 files changed, 3324 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p1.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p10.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p11.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p12.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p13.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p14.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p15.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p16.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p17.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p18.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p2.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p3.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p4.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p5.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p6.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p7.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p8.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p9.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p1.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p1.patch
new file mode 100644
index 0000000000..2ca29b2f9e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p1.patch
@@ -0,0 +1,75 @@
+From 26b64ec55944b375ead223a214c5f4301329511f Mon Sep 17 00:00:00 2001
+From: Stefan Metzmacher <metze@samba.org>
+Date: Thu, 23 Apr 2026 18:20:15 +0200
+Subject: [PATCH] CVE-2026-4480/CVE-2026-4408: lib/util: inline
+ string_sub2() into string_sub() the only caller
+
+This will simplify further changes.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16033
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16034
+
+CVE: CVE-2026-4408
+Upstream-Status: Backport [https://gitlab.com/samba-team/samba/-/commit/26b64ec55944b375ead223a214c5f4301329511f]
+
+Signed-off-by: Stefan Metzmacher <metze@samba.org>
+Reviewed-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+(cherry picked from commit 26b64ec55944b375ead223a214c5f4301329511f)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ lib/util/substitute.c | 20 ++------------------
+ 1 file changed, 2 insertions(+), 18 deletions(-)
+
+diff --git a/lib/util/substitute.c b/lib/util/substitute.c
+index b7b5588da863..26362ca77b2c 100644
+--- a/lib/util/substitute.c
++++ b/lib/util/substitute.c
+@@ -47,10 +47,9 @@
+  use of len==0 which was for no length checks to be done.
+ **/
+ 
+-static void string_sub2(char *s,const char *pattern, const char *insert, size_t len,
+-			bool remove_unsafe_characters, bool replace_once,
+-			bool allow_trailing_dollar)
++void string_sub(char *s, const char *pattern, const char *insert, size_t len)
+ {
++	bool remove_unsafe_characters = true;
+ 	char *p;
+ 	size_t ls, lp, li, i;
+ 
+@@ -79,13 +78,6 @@ static void string_sub2(char *s,const char *pattern, const char *insert, size_t
+ 		for (i=0;i<li;i++) {
+ 			switch (insert[i]) {
+ 			case '$':
+-				/* allow a trailing $
+-				 * (as in machine accounts) */
+-				if (allow_trailing_dollar && (i == li - 1 )) {
+-					p[i] = insert[i];
+-					break;
+-				}
+-				FALL_THROUGH;
+ 			case '`':
+ 			case '"':
+ 			case '\'':
+@@ -107,17 +99,9 @@ static void string_sub2(char *s,const char *pattern, const char *insert, size_t
+ 		}
+ 		s = p + li;
+ 		ls = ls + li - lp;
+-
+-		if (replace_once)
+-			break;
+ 	}
+ }
+ 
+-void string_sub(char *s,const char *pattern, const char *insert, size_t len)
+-{
+-	string_sub2( s, pattern, insert, len, true, false, false );
+-}
+-
+ /**
+  Similar to string_sub() but allows for any character to be substituted. 
+  Use with caution!
+-- 
+2.43.0
+
+
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p10.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p10.patch
new file mode 100644
index 0000000000..a5a4d00801
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p10.patch
@@ -0,0 +1,339 @@
+From d291377ac1ea515ac064ac00d59e1787db5671d1 Mon Sep 17 00:00:00 2001
+From: Stefan Metzmacher <metze@samba.org>
+Date: Thu, 7 May 2026 18:10:50 +0200
+Subject: [PATCH] CVE-2026-4480/CVE-2026-4408: lib/util: add
+ talloc_string_sub_{mixed_quoting,unsafe}() helpers
+
+This is the basic helper function for the security problems.
+
+talloc_string_sub_mixed_quoting() checks for strange quoting
+in smb.conf options.
+
+And talloc_string_sub_unsafe() tries to autodetect how the unsafe
+(client controlled value) and masked and single quote it,
+as a fallback for strange quoting a fixed fallback string
+is used and the caller should warn the admin and give
+hints how to fix the configuration.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16033
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16034
+
+Pair-Programmed-With: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+
+CVE: CVE-2026-4408
+Upstream-Status: Backport [https://gitlab.com/samba-team/samba/-/commit/d291377ac1ea515ac064ac00d59e1787db5671d1]
+
+Signed-off-by: Stefan Metzmacher <metze@samba.org>
+Signed-off-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+(cherry picked from commit d291377ac1ea515ac064ac00d59e1787db5671d1)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ lib/util/substitute.c | 260 ++++++++++++++++++++++++++++++++++++++++++
+ lib/util/substitute.h |  17 +++
+ 2 files changed, 277 insertions(+)
+
+diff --git a/lib/util/substitute.c b/lib/util/substitute.c
+index 30989927da72..406d8424be1a 100644
+--- a/lib/util/substitute.c
++++ b/lib/util/substitute.c
+@@ -25,6 +25,8 @@
+ #include "system/locale.h"
+ #include "debug.h"
+ #ifndef SAMBA_UTIL_CORE_ONLY
++#include "lib/util/fault.h"
++#include "lib/util/talloc_stack.h"
+ #include "charset/charset.h"
+ #else
+ #include "charset_compat.h"
+@@ -297,3 +299,261 @@ char *talloc_all_string_sub(TALLOC_CTX *ctx,
+ 	return talloc_string_sub2(ctx, src, pattern, insert,
+ 			false, false, false);
+ }
++
++#ifndef SAMBA_UTIL_CORE_ONLY
++
++bool talloc_string_sub_mixed_quoting(const char *full_cmd, char variable_char)
++{
++	/*
++	 * Try to make sure talloc_string_sub_unsafe()
++	 * won't return NULL, instead talloc_stackframe_pool()
++	 * would panic
++	 */
++	size_t cmd_len = full_cmd != NULL ? strlen(full_cmd) : 0;
++	size_t pool_size = 512 + cmd_len;
++	TALLOC_CTX *frame = talloc_stackframe_pool(pool_size);
++	char *cmd = NULL;
++	bool modified = false;
++	bool masked = false;
++	bool mixed_fallback = false;
++
++	cmd = talloc_string_sub_unsafe(frame,
++				       full_cmd,
++				       variable_char,
++				       "U",  /* unsafe_value */
++				       "'\"%", /* unsafe_characters */
++				       '_',    /* safe_character */
++				       "F",  /* fallback_value */
++				       &modified,
++				       &masked,
++				       &mixed_fallback);
++	if (cmd == NULL) {
++		mixed_fallback = false;
++	}
++	TALLOC_FREE(frame);
++	return mixed_fallback;
++}
++
++char *talloc_string_sub_unsafe(TALLOC_CTX *mem_ctx,
++			       const char *orig_cmd,
++			       char variable_char,
++			       const char *unsafe_value,
++			       const char *unsafe_characters,
++			       char safe_character,
++			       const char *fallback_value,
++			       bool *_modified,
++			       bool *_masked,
++			       bool *_mixed_fallback)
++{
++	TALLOC_CTX *frame = talloc_stackframe();
++	const char variable[3] =
++		{ '%', variable_char, '\0' };
++	const char variable_s_quoted[5] =
++		{ '\'', '%', variable_char, '\'', '\0' };
++	const char variable_d_quoted[5] =
++		{ '"', '%', variable_char, '"', '\0' };
++	char *cmd = NULL;
++	char *masked_value = NULL;
++	char *quoted_value = NULL;
++	bool has_s_quotes;
++	bool has_d_quotes;
++	bool has_variable;
++	bool has_variable_s_quoted;
++	bool has_variable_d_quoted;
++	bool modified = false;
++	bool masked = false;
++	bool mixed_fallback = false;
++	bool ok;
++
++	/*
++	 * The unsafe_characters argument should contain
++	 * single and double quotes.
++	 * Otherwise We can't safely handle this.
++	 */
++	SMB_ASSERT(unsafe_characters != NULL);
++	SMB_ASSERT(strchr(unsafe_characters, '\'') != NULL);
++	SMB_ASSERT(strchr(unsafe_characters, '"') != NULL);
++	SMB_ASSERT(strchr(unsafe_characters, '%') != NULL);
++
++	cmd = talloc_strdup(mem_ctx, orig_cmd);
++	if (cmd == NULL) {
++		TALLOC_FREE(frame);
++		return NULL;
++	}
++	cmd = talloc_steal(frame, cmd);
++
++	has_variable = strstr(orig_cmd, variable) != NULL;
++	if (!has_variable) {
++		/*
++		 * Nothing to do...
++		 */
++		goto done;
++	}
++	modified = true;
++
++	/*
++	 * Replace all unsafe characters as well as control
++	 * characters.
++	 *
++	 * Note that we start with masked_value = "%u"
++	 * and then replace "%u" with unsafe_value,
++	 * as a result we have a masked version of
++	 * unsafe_value.
++	 *
++	 * And don't allow option injected like
++	 *
++	 * '-h value'
++	 * '--help value'
++	 *
++	 */
++	masked_value = talloc_strdup(frame, variable);
++	if (masked_value == NULL) {
++		goto nomem;
++	}
++	ok = realloc_string_sub_raw(&masked_value,
++				    variable,
++				    unsafe_value,
++				    false, /* replace_once */
++				    false, /* allow_trailing_dollar */
++				    unsafe_characters,
++				    safe_character);
++	if (!ok) {
++		goto nomem;
++	}
++	if (masked_value[0] == '-') {
++		masked_value[0] = safe_character;
++	}
++	masked = strcmp(masked_value, unsafe_value) != 0;
++
++retry:
++
++	has_s_quotes = strchr(cmd, '\'') != NULL;
++	has_d_quotes = strchr(cmd, '"') != NULL;
++	has_variable = strstr(cmd, variable) != NULL;
++	has_variable_s_quoted = strstr(cmd, variable_s_quoted) != NULL;
++	has_variable_d_quoted = strstr(cmd, variable_d_quoted) != NULL;
++
++	if (has_variable_s_quoted) {
++		/*
++		 * In smb.conf we have something like
++		 *
++		 * some script = /usr/bin/script '%u'
++		 *
++		 * It is safe to replace '%u' (or '%J' etc, depending
++		 * on variable_char) with '<masked_value>' if
++		 * masked_value does not contain single quotes. We
++		 * have checked that.
++		 */
++
++		if (quoted_value == NULL) {
++			quoted_value = talloc_asprintf(frame, "'%s'",
++						       masked_value);
++			if (quoted_value == NULL) {
++				goto nomem;
++			}
++		}
++
++		ok = realloc_string_sub_raw(&cmd,
++					    variable_s_quoted,
++					    quoted_value,
++					    false, /* replace_once */
++					    false, /* allow_trailing_dollar */
++					    NULL,  /* unsafe_characters */
++					    '\0'); /* safe_character */
++		if (!ok) {
++			goto nomem;
++		}
++
++		goto retry;
++	}
++
++	if (has_variable_d_quoted && !has_s_quotes) {
++		/*
++		 * replace the "%u"
++		 *
++		 * some script = /usr/bin/script "%u"
++		 *
++		 * with '%u' and try the '%u' -> 'variable' substitution
++		 * again.
++		 */
++
++		ok = realloc_string_sub_raw(&cmd,
++					    variable_d_quoted,
++					    variable_s_quoted,
++					    false, /* replace_once */
++					    false, /* allow_trailing_dollar */
++					    NULL,  /* unsafe_characters */
++					    '\0'); /* safe_character */
++		if (!ok) {
++			goto nomem;
++		}
++
++		goto retry;
++	}
++
++	if (has_variable && !has_s_quotes && !has_d_quotes) {
++		/*
++		 * In this case:
++		 *
++		 * some script = /usr/bin/script %u
++		 *
++		 * we can safely substitute %u -> '%u' and try the
++		 * single quote test again.
++		 */
++
++		ok = realloc_string_sub_raw(&cmd,
++					    variable,
++					    variable_s_quoted,
++					    false, /* replace_once */
++					    false, /* allow_trailing_dollar */
++					    NULL,  /* unsafe_characters */
++					    '\0'); /* safe_character */
++		if (!ok) {
++			goto nomem;
++		}
++
++		goto retry;
++	}
++
++	if (has_variable) {
++		/*
++		 * There are single or double quotes, but not tightly
++		 * bound around a %u.
++		 *
++		 * Or there's a mix of single and double quotes.
++		 *
++		 * We just use a generic fallback value.
++		 * and let the caller warn about this
++		 * and give the admin a hind to fix the smb.conf
++		 * option.
++		 */
++		mixed_fallback = true;
++
++		ok = realloc_string_sub_raw(&cmd,
++					    variable,
++					    fallback_value,
++					    false, /* replace_once */
++					    false, /* allow_trailing_dollar */
++					    NULL,  /* unsafe_characters */
++					    '\0'); /* safe_character */
++		if (!ok) {
++			goto nomem;
++		}
++	}
++
++done:
++	*_modified = modified;
++	*_masked = masked;
++	*_mixed_fallback = mixed_fallback;
++	cmd = talloc_steal(mem_ctx, cmd);
++	TALLOC_FREE(frame);
++	return cmd;
++
++nomem:
++	*_modified = false;
++	*_masked = false;
++	*_mixed_fallback = false;
++	TALLOC_FREE(frame);
++	return NULL;
++}
++#endif /* ! SAMBA_UTIL_CORE_ONLY */
+diff --git a/lib/util/substitute.h b/lib/util/substitute.h
+index 41f56c73ba2c..b8205055da1e 100644
+--- a/lib/util/substitute.h
++++ b/lib/util/substitute.h
+@@ -83,4 +83,21 @@ char *talloc_all_string_sub(TALLOC_CTX *ctx,
+ 				const char *src,
+ 				const char *pattern,
+ 				const char *insert);
++
++#ifndef SAMBA_UTIL_CORE_ONLY
++bool talloc_string_sub_mixed_quoting(const char *full_cmd, char variable_char);
++
++char *talloc_string_sub_unsafe(TALLOC_CTX *mem_ctx,
++			       const char *orig_cmd,
++			       char variable_char,
++			       const char *unsafe_value,
++			       const char *unsafe_characters,
++			       char safe_character,
++			       const char *fallback_value,
++			       bool *_modified,
++			       bool *_masked,
++			       bool *_mixed_fallback);
++
++#endif /* ! SAMBA_UTIL_CORE_ONLY */
++
+ #endif /* _SAMBA_SUBSTITUTE_H_ */
+-- 
+2.43.0
+
+
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p11.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p11.patch
new file mode 100644
index 0000000000..66df884afb
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p11.patch
@@ -0,0 +1,94 @@
+From 6dce1833a5d27f82a9b133601ce7f749f3be08ec Mon Sep 17 00:00:00 2001
+From: Stefan Metzmacher <metze@samba.org>
+Date: Thu, 23 Apr 2026 18:56:21 +0200
+Subject: [PATCH] CVE-2026-4408: lib/util: introduce
+ strstr_for_invalid_account_characters()
+
+This splits out the logic from samaccountname_bad_chars_check()
+in source4/dsdb/samdb/ldb_modules/samldb.c, this will be used
+in other places soon.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16034
+
+CVE: CVE-2026-4408
+Upstream-Status: Backport [https://gitlab.com/samba-team/samba/-/commit/6dce1833a5d27f82a9b133601ce7f749f3be08ec]
+
+Signed-off-by: Stefan Metzmacher <metze@samba.org>
+Reviewed-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+(cherry picked from commit 6dce1833a5d27f82a9b133601ce7f749f3be08ec)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ lib/util/samba_util.h |  9 +++++++++
+ lib/util/util_str.c   | 38 ++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 47 insertions(+)
+
+diff --git a/lib/util/samba_util.h b/lib/util/samba_util.h
+index 03dee5c61379..ea741b51c58f 100644
+--- a/lib/util/samba_util.h
++++ b/lib/util/samba_util.h
+@@ -303,6 +303,15 @@ _PUBLIC_ bool set_boolean(const char *boolean_string, bool *boolean);
+  */
+ _PUBLIC_ bool conv_str_bool(const char * str, bool * val);
+ 
++/**
++ * Returns a pointer to the first invalid character in name.
++ *
++ * Passing a NULL pointer as name is not allowed!
++ *
++ * This returns NULL for a valid account name.
++ **/
++_PUBLIC_ const char *strstr_for_invalid_account_characters(const char *name);
++
+ /**
+  * Convert a size specification like 16K into an integral number of bytes.
+  **/
+diff --git a/lib/util/util_str.c b/lib/util/util_str.c
+index 7c1d15dbeb0b..c4eda4f49f38 100644
+--- a/lib/util/util_str.c
++++ b/lib/util/util_str.c
+@@ -305,3 +305,41 @@ _PUBLIC_ bool set_boolean(const char *boolean_string, bool *boolean)
+ 	}
+ 	return false;
+ }
++
++_PUBLIC_ const char *strstr_for_invalid_account_characters(const char *name)
++{
++	/*
++	 * Return a pointer to the first invalid character in the
++	 * sAMAccountName, or NULL if the whole name is valid.
++	 *
++	 * The rules here are based on
++	 *
++	 * https://social.technet.microsoft.com/wiki/contents/articles/11216.active-directory-requirements-for-creating-objects.aspx
++	 */
++	size_t i;
++
++	for (i = 0; name[i] != '\0'; i++) {
++		uint8_t c = name[i];
++		const char *p = NULL;
++
++		if (iscntrl(c)) {
++			return &name[i];
++		}
++
++		p = strchr("\"[]:;|=+*?<>/\\,", c);
++		if (p != NULL) {
++			return &name[i];
++		}
++	}
++
++	if (i == 0) {
++		return &name[i];
++	}
++
++	if (name[i - 1] == '.') {
++		i -= 1;
++		return &name[i];
++	}
++
++	return NULL;
++}
+-- 
+2.43.0
+
+
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p12.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p12.patch
new file mode 100644
index 0000000000..f6ed00649c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p12.patch
@@ -0,0 +1,47 @@
+From 8f28ca0b8abccf30f479133cc78f9a72500ab366 Mon Sep 17 00:00:00 2001
+From: Stefan Metzmacher <metze@samba.org>
+Date: Mon, 11 May 2026 20:21:36 +0200
+Subject: [PATCH] CVE-2026-4408: s3:samr-server: only allow
+ _samr_ValidatePassword as DC
+
+This is only supported with 'rpc start on demand helpers = no',
+as it needs ncacn_ip_tcp, but we better also restrict it to DCs.
+
+Maybe only FreeIPA needs it as NT4 didn't support ncacn_ip_tcp.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16034
+
+CVE: CVE-2026-4408
+Upstream-Status: Backport [https://gitlab.com/samba-team/samba/-/commit/8f28ca0b8abccf30f479133cc78f9a72500ab366]
+
+Signed-off-by: Stefan Metzmacher <metze@samba.org>
+Reviewed-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+(cherry picked from commit 8f28ca0b8abccf30f479133cc78f9a72500ab366)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ source3/rpc_server/samr/srv_samr_nt.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/source3/rpc_server/samr/srv_samr_nt.c b/source3/rpc_server/samr/srv_samr_nt.c
+index e0d0875bd5da..3937dbe3f32e 100644
+--- a/source3/rpc_server/samr/srv_samr_nt.c
++++ b/source3/rpc_server/samr/srv_samr_nt.c
+@@ -7500,6 +7500,14 @@ NTSTATUS _samr_ValidatePassword(struct pipes_struct *p,
+ 		return NT_STATUS_ACCESS_DENIED;
+ 	}
+ 
++	if (lp_server_role() <= ROLE_DOMAIN_MEMBER) {
++		/*
++		 * We only want this on DCs
++		 */
++		p->fault_state = DCERPC_FAULT_ACCESS_DENIED;
++		return NT_STATUS_ACCESS_DENIED;
++	}
++
+ 	if (r->in.level < 1 || r->in.level > 3) {
+ 		return NT_STATUS_INVALID_INFO_CLASS;
+ 	}
+-- 
+2.43.0
+
+
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p13.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p13.patch
new file mode 100644
index 0000000000..bd5b24497d
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p13.patch
@@ -0,0 +1,174 @@
+From 1c5146ddfc736e9d790bd91f3124c6fba6847bb3 Mon Sep 17 00:00:00 2001
+From: Stefan Metzmacher <metze@samba.org>
+Date: Wed, 18 Mar 2026 12:24:47 +0100
+Subject: [PATCH] CVE-2026-4408: s3:samr-server: deny, mask and/or single
+ quote username to 'check password script'
+
+We pass this on to the check password script, prevent remote command
+execution.
+
+We now try to autodetect if we could implicitly use '%u' for the
+replacement and fallback to a fixed fallback username.
+
+Admins should make use of SAMBA_CPS_ACCOUNT_NAME
+instead of passing '%u' to 'check password script'
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16034
+
+Pair-Programmed-With: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+
+CVE: CVE-2026-4408
+Upstream-Status: Backport [https://gitlab.com/samba-team/samba/-/commit/1c5146ddfc736e9d790bd91f3124c6fba6847bb3]
+
+Signed-off-by: Stefan Metzmacher <metze@samba.org>
+Signed-off-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+(cherry picked from commit 1c5146ddfc736e9d790bd91f3124c6fba6847bb3)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ source3/rpc_server/samr/srv_samr_chgpasswd.c | 110 +++++++++++++++++--
+ 1 file changed, 101 insertions(+), 9 deletions(-)
+
+diff --git a/source3/rpc_server/samr/srv_samr_chgpasswd.c b/source3/rpc_server/samr/srv_samr_chgpasswd.c
+index 6c0c0da0cfc3..9afb8799aea0 100644
+--- a/source3/rpc_server/samr/srv_samr_chgpasswd.c
++++ b/source3/rpc_server/samr/srv_samr_chgpasswd.c
+@@ -54,6 +54,7 @@
+ #include "passdb.h"
+ #include "auth.h"
+ #include "lib/util/sys_rw.h"
++#include "lib/util/util_str_escape.h"
+ #include "librpc/rpc/dcerpc_samr.h"
+ 
+ #include "lib/crypto/gnutls_helpers.h"
+@@ -1008,27 +1009,118 @@ static bool check_passwd_history(struct samu *sampass, const char *plaintext)
+ /***********************************************************
+ ************************************************************/
+ 
++static NTSTATUS check_password_complexity_internal(TALLOC_CTX *tosctx,
++						   const char *orig_cmd,
++						   const char *username,
++						   char **cmd_out)
++{
++	const char *fallback_username = "__CVE-2026-4408_FallbackUsername__";
++	const char *inv = NULL;
++	char *cmd = NULL;
++	bool modified = false;
++	bool masked = false;
++	bool mixed_fallback = false;
++
++	*cmd_out = NULL;
++
++	if (username == NULL) {
++		return NT_STATUS_INVALID_USER_PRINCIPAL_NAME;
++	}
++
++	/*
++	 * This catches invalid characters in account names
++	 * which might be problematic passing to a shell script.
++	 */
++	inv = strstr_for_invalid_account_characters(username);
++	if (inv != NULL) {
++		char *le_username = log_escape(tosctx, username);
++
++		DBG_WARNING("username '%s' has invalid or dangerous characters\n",
++			    le_username);
++
++		TALLOC_FREE(le_username);
++
++		return NT_STATUS_INVALID_USER_PRINCIPAL_NAME;
++	}
++
++	/*
++	 * This masks the remaining unsafe characters which
++	 * are not already caught by strstr_for_invalid_account_characters()
++	 * with '_'.
++	 *
++	 * Then it replaces %u with an single quoted
++	 * and/or shell escaped version of the masked username.
++	 */
++	cmd = talloc_string_sub_unsafe(tosctx,
++				       orig_cmd,
++				       'u',
++				       username,
++				       STRING_SUB_UNSAFE_CHARACTERS,
++				       '_',
++				       fallback_username,
++				       &modified,
++				       &masked,
++				       &mixed_fallback);
++	if (cmd == NULL) {
++		return NT_STATUS_NO_MEMORY;
++	}
++
++	/*
++	 * Now warn about unexpected values
++	 */
++
++	if (mixed_fallback) {
++		D_WARNING("CVE-2026-4408: "
++			  "strange quoting in 'check password script', "
++			  "falling back to replace %%u with %s, "
++			  "use testparm to fix the configuration\n",
++			  fallback_username);
++		D_WARNING("CVE-2026-4408: "
++			  "You should use '%%u', or SAMBA_CPS_ACCOUNT_NAME "
++			  "inside of 'check password script'.\n");
++	} else if (masked) {
++		char *le_username = log_escape(tosctx, username);
++
++		D_WARNING("CVE-2026-4408: "
++			  "replaced %%u with masked value instead of: %s\n",
++			  le_username);
++		D_WARNING("CVE-2026-4408: "
++			  "You should use SAMBA_CPS_ACCOUNT_NAME inside "
++			  "'check password script' instead of %%u.\n");
++
++		TALLOC_FREE(le_username);
++	}
++
++	*cmd_out = cmd;
++	return NT_STATUS_OK;
++}
++
++
+ NTSTATUS check_password_complexity(const char *username,
+ 				   const char *fullname,
+ 				   const char *password,
+ 				   enum samPwdChangeReason *samr_reject_reason)
+ {
++	int check_ret;
++	NTSTATUS status;
+ 	TALLOC_CTX *tosctx = talloc_tos();
+ 	const struct loadparm_substitution *lp_sub =
+ 		loadparm_s3_global_substitution();
+-	int check_ret;
+-	char *cmd;
++	const char *orig_cmd = NULL;
++	char *cmd = NULL;
+ 
+-	/* Use external script to check password complexity */
+-	if ((lp_check_password_script(tosctx, lp_sub) == NULL)
+-	    || (*(lp_check_password_script(tosctx, lp_sub)) == '\0')){
++	orig_cmd = lp_check_password_script(tosctx, lp_sub);
++	if (orig_cmd == NULL || orig_cmd[0] == '\0') {
+ 		return NT_STATUS_OK;
+ 	}
+ 
+-	cmd = talloc_string_sub(tosctx, lp_check_password_script(tosctx, lp_sub), "%u",
+-				username);
+-	if (!cmd) {
+-		return NT_STATUS_PASSWORD_RESTRICTION;
++	/* note we don't use 'fullname' or 'password' here */
++	status = check_password_complexity_internal(tosctx,
++						    orig_cmd,
++						    username,
++						    &cmd);
++	if (!NT_STATUS_IS_OK(status)) {
++		return status;
+ 	}
+ 
+ 	check_ret = setenv("SAMBA_CPS_ACCOUNT_NAME", username, 1);
+-- 
+2.43.0
+
+
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p14.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p14.patch
new file mode 100644
index 0000000000..c9c19b9688
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p14.patch
@@ -0,0 +1,59 @@
+From 67ad724e22f3724d5e07eaa8f25eb527aa417599 Mon Sep 17 00:00:00 2001
+From: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+Date: Sat, 2 May 2026 22:12:38 +1200
+Subject: [PATCH] CVE-2026-4408: s3:samr-server: make
+ check_password_complexity_internal() non-static, for easier testing
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16034
+
+CVE: CVE-2026-4408
+Upstream-Status: Backport [https://gitlab.com/samba-team/samba/-/commit/67ad724e22f3724d5e07eaa8f25eb527aa417599]
+
+Signed-off-by: Stefan Metzmacher <metze@samba.org>
+Reviewed-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+(cherry picked from commit 67ad724e22f3724d5e07eaa8f25eb527aa417599)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ source3/rpc_server/samr/srv_samr_chgpasswd.c | 8 ++++----
+ source3/rpc_server/samr/srv_samr_util.h      | 5 +++++
+ 2 files changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/source3/rpc_server/samr/srv_samr_chgpasswd.c b/source3/rpc_server/samr/srv_samr_chgpasswd.c
+index 9afb8799aea0..3f48da47a5bd 100644
+--- a/source3/rpc_server/samr/srv_samr_chgpasswd.c
++++ b/source3/rpc_server/samr/srv_samr_chgpasswd.c
+@@ -1009,10 +1009,10 @@ static bool check_passwd_history(struct samu *sampass, const char *plaintext)
+ /***********************************************************
+ ************************************************************/
+ 
+-static NTSTATUS check_password_complexity_internal(TALLOC_CTX *tosctx,
+-						   const char *orig_cmd,
+-						   const char *username,
+-						   char **cmd_out)
++NTSTATUS check_password_complexity_internal(TALLOC_CTX *tosctx,
++					    const char *orig_cmd,
++					    const char *username,
++					    char **cmd_out)
+ {
+ 	const char *fallback_username = "__CVE-2026-4408_FallbackUsername__";
+ 	const char *inv = NULL;
+diff --git a/source3/rpc_server/samr/srv_samr_util.h b/source3/rpc_server/samr/srv_samr_util.h
+index 5e839ac77c01..a3a22012858b 100644
+--- a/source3/rpc_server/samr/srv_samr_util.h
++++ b/source3/rpc_server/samr/srv_samr_util.h
+@@ -79,6 +79,11 @@ NTSTATUS pass_oem_change(char *user, const char *rhost,
+ 			 uchar password_encrypted_with_nt_hash[516],
+ 			 const uchar old_nt_hash_encrypted[16],
+ 			 enum samPwdChangeReason *reject_reason);
++
++NTSTATUS check_password_complexity_internal(TALLOC_CTX *mem_ctx,
++					    const char *_orig_cmd,
++					    const char *username,
++					    char **cmd_out);
+ NTSTATUS check_password_complexity(const char *username,
+ 				   const char *fullname,
+ 				   const char *password,
+-- 
+2.43.0
+
+
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p15.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p15.patch
new file mode 100644
index 0000000000..4abaf3aeca
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p15.patch
@@ -0,0 +1,1108 @@
+From ebd4edda32d949e10e531939b7a4e19b2306ff64 Mon Sep 17 00:00:00 2001
+From: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+Date: Sat, 9 May 2026 22:02:47 +1200
+Subject: [PATCH] CVE-2026-4480/CVE-2026-4408: lib/util: add
+ test_string_sub unittests
+
+This demonstrates the logic of talloc_string_sub_{mixed_quoting,unsafe}()
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16033
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16034
+
+CVE: CVE-2026-4408
+Upstream-Status: Backport [https://gitlab.com/samba-team/samba/-/commit/ebd4edda32d949e10e531939b7a4e19b2306ff64]
+
+Pair-Programmed-With: Stefan Metzmacher <metze@samba.org>
+
+Signed-off-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+Signed-off-by: Stefan Metzmacher <metze@samba.org>
+(cherry picked from commit ebd4edda32d949e10e531939b7a4e19b2306ff64)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ lib/util/tests/test_string_sub.c | 1044 ++++++++++++++++++++++++++++++
+ lib/util/wscript_build           |    6 +
+ selftest/tests.py                |    2 +
+ 3 files changed, 1052 insertions(+)
+ create mode 100644 lib/util/tests/test_string_sub.c
+
+diff --git a/lib/util/tests/test_string_sub.c b/lib/util/tests/test_string_sub.c
+new file mode 100644
+index 000000000000..da97c1c936ca
+--- /dev/null
++++ b/lib/util/tests/test_string_sub.c
+@@ -0,0 +1,1044 @@
++
++#include <stdarg.h>
++#include <stddef.h>
++#include <stdint.h>
++#include <setjmp.h>
++#include <sys/stat.h>
++#include "replace.h"
++#include <cmocka.h>
++#include "talloc.h"
++
++#include "../substitute.h"
++
++/* set _DEBUG_VERBOSE to print more. */
++#define _DEBUG_VERBOSE
++
++#ifdef _DEBUG_VERBOSE
++#define debug_message(...) print_message(__VA_ARGS__)
++#else
++#define debug_message(...) /* debug_message */
++#endif
++
++
++static int setup_talloc_context(void **state)
++{
++	TALLOC_CTX *mem_ctx = talloc_new(NULL);
++	*state = mem_ctx;
++	return 0;
++}
++
++static int teardown_talloc_context(void **state)
++{
++	TALLOC_CTX *mem_ctx = *state;
++	TALLOC_FREE(mem_ctx);
++	return 0;
++}
++
++struct cmd_expansion {
++	const char *lp_cmd;
++	const char *username;
++	const char *result_cmd;
++	bool modified;
++	bool masked;
++	bool mixed_fallback;
++};
++
++static void _test_talloc_string_sub_unsafe(void **state,
++					   struct cmd_expansion expansions[],
++					   size_t n_expansions,
++					   const char *unsafe_characters)
++{
++	TALLOC_CTX *mem_ctx = *state;
++	size_t i;
++
++	for (i = 0; i < n_expansions; i++) {
++		struct cmd_expansion t = expansions[i];
++		char *result_cmd = NULL;
++		bool masked;
++		bool mixed_fallback;
++		bool modified;
++		bool flags_correct;
++		bool mixed;
++		int cmp;
++
++		mixed = talloc_string_sub_mixed_quoting(t.lp_cmd, 'u');
++
++		result_cmd = talloc_string_sub_unsafe(mem_ctx,
++						      t.lp_cmd,
++						      'u',
++						      t.username,
++						      unsafe_characters,
++						      '_',
++						      "FallbackUsername",
++						      &modified,
++						      &masked,
++						      &mixed_fallback);
++		assert_ptr_not_equal(result_cmd, NULL);
++		assert_ptr_not_equal(t.result_cmd, NULL);
++
++		cmp = strcmp(t.result_cmd, result_cmd);
++		flags_correct = (modified == t.modified &&
++				 masked == t.masked &&
++				 mixed_fallback == t.mixed_fallback);
++
++		if (cmp == 0) {
++			debug_message("[%zu] «%s» «%s»   ->   «%s»; AS EXPECTED\n",
++				      i, t.lp_cmd,
++				      t.username,
++				      result_cmd);
++		} else {
++			debug_message("[%zu] «%s» «%s»; "
++				      "expected   [%zu] «%s»   got  [%zu] «%s»\033[1;31m BAD! \033[0m\n",
++				      i, t.lp_cmd,
++				      t.username,
++				      strlen(t.result_cmd), t.result_cmd,
++				      strlen(result_cmd), result_cmd);
++		}
++		assert_int_equal(cmp, 0);
++		if (!flags_correct) {
++			debug_message("[%zu] ", i);
++#define _FLAG(x) debug_message((t. x  == x) ? "%s: %s √; ":		\
++			       "%s \033[1;31m expected %s \033[0m; ",	\
++			       #x, t.x ? "true": "false");
++			_FLAG(modified);
++			_FLAG(masked);
++			_FLAG(mixed_fallback);
++			debug_message("\n");
++		}
++		assert_int_equal(flags_correct, true);
++		if (mixed_fallback != mixed) {
++			debug_message("[%zu] %s mixed \033[1;31m expected %s \033[0m; ",
++				      i, t.lp_cmd,
++				      mixed_fallback ? "true": "false");
++		}
++		assert_int_equal(mixed_fallback, mixed);
++#undef _FLAG
++	}
++	debug_message("ALL correct\n");
++}
++
++static void test_talloc_string_sub_unsafe(void **state)
++{
++	const char *unsafe_characters = STRING_SUB_UNSAFE_CHARACTERS;
++
++	static struct cmd_expansion expansions[] = {
++		{
++			"/bin/echo \"bob'",
++			"bob",
++			"/bin/echo \"bob'",
++			false,
++			false,
++			false,
++		},
++		{
++			"/bin/echo '%u'",
++			"bob",
++			"/bin/echo 'bob'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo %u",
++			"bob",
++			"/bin/echo 'bob'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo %u",
++			"bob'",
++			"/bin/echo 'bob_'",
++			true,
++			true,
++			false,
++		},
++		{
++			"/bin/echo %u",
++			"bob'''",
++			"/bin/echo 'bob___'",
++			true,
++			true,
++			false,
++		},
++		{
++			"/bin/echo %u",
++			"bob\'",
++			"/bin/echo 'bob_'",
++			true,
++			true,
++			false,
++		},
++		{
++			"/bin/echo '%u",
++			"bob bob bob",
++			"/bin/echo 'FallbackUsername",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo \"%u\"",
++			" ",
++			"/bin/echo ' '",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo \"--uu=%u\"",
++			"bob",
++			"/bin/echo \"--uu=FallbackUsername\"",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo \"--uu=%u\"",
++			"bob !0",
++			"/bin/echo \"--uu=FallbackUsername\"",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo %u",
++			"!0",
++			"/bin/echo '!0'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo \"--uu=%u\"",
++			"bob \\",
++			"/bin/echo \"--uu=FallbackUsername\"",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo --uu='%u'",
++			"bob >> x",
++			"/bin/echo --uu='bob __ x'",
++			true,
++			true,
++			false,
++		},
++		{
++			"/bin/echo '--uu=%u\"",
++			"bob",
++			"/bin/echo '--uu=FallbackUsername\"",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo --uu='%u'",
++			"bob",
++			"/bin/echo --uu='bob'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo --uu'=%u'",
++			"bob",
++			"/bin/echo --uu'=FallbackUsername'",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo --uu'=%u'",
++			"`ls`",
++			"/bin/echo --uu'=FallbackUsername'",
++			true,
++			true,
++			true,
++		},
++		{
++			"/bin/echo --uu='%u'",
++			"u%u%u%u%u",
++			"/bin/echo --uu='u_u_u_u_u'",
++			true,
++			true,
++			false,
++		},
++		{
++			"/bin/echo --uu='%u'",
++			"$(ls)",
++			"/bin/echo --uu='_(ls)'",
++			true,
++			true,
++			false,
++		},
++		{
++			"/bin/echo --uu='%u'",
++			"`ls`",
++			"/bin/echo --uu='_ls_'",
++			true,
++			true,
++			false,
++		},
++		{
++			"/bin/echo --uu='1' %u",
++			"`ls`",
++			"/bin/echo --uu='1' FallbackUsername",
++			true,
++			true,
++			true,
++		},
++		{
++			"/bin/echo --uu=\"'%u'\"",
++			"bob",
++			"/bin/echo --uu=\"'bob'\"",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo --uu='%u' --yy='%u' '%u' %u",
++			"bob",
++			"/bin/echo --uu='bob' --yy='bob' 'bob' FallbackUsername",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo --uu=%u%u%u'' %user 50%u",
++			"bob",
++			"/bin/echo --uu=FallbackUsernameFallbackUsernameFallbackUsername'' FallbackUsernameser 50FallbackUsername",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo %u",
++			"!!",
++			"/bin/echo '!!'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo %u",
++			">xxx",
++			"/bin/echo '_xxx'",
++			true,
++			true,
++			false,
++		},
++		{
++			"/bin/echo %u",
++			"3",
++			"/bin/echo '3'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo '%u'",
++			"3$",
++			"/bin/echo '3_'",
++			true,
++			true,
++			false,
++		},
++		{
++			"/bin/echo '%u'",
++			"comp$",
++			"/bin/echo 'comp_'",
++			true,
++			true,
++			false,
++		},
++		{
++			"/bin/echo '%u'",
++			"3$3",
++			"/bin/echo '3_3'",
++			true,
++			true,
++			false,
++		},
++		{
++			"/bin/echo '%u'",
++			"q $3",
++			"/bin/echo 'q _3'",
++			true,
++			true,
++			false,
++		},
++		{
++			"/bin/echo '%u",
++			"q $3",
++			"/bin/echo 'FallbackUsername",
++			true,
++			true,
++			true,
++		},
++		{
++			"/bin/echo -s '%u' %u",
++			"āāā",
++			"/bin/echo -s 'āāā' FallbackUsername",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo -s '%u' %u",
++			"-āāā",
++			"/bin/echo -s '_āāā' FallbackUsername",
++			true,
++			true,
++			true,
++		},
++		{
++			"/bin/echo -s %u",
++			"āāā",
++			"/bin/echo -s 'āāā'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo -s %u",
++			"a -a",
++			"/bin/echo -s 'a -a'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo -s=%u %u",
++			"ā -a",
++			"/bin/echo -s='ā -a' 'ā -a'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo -s=\"%u %u\"",
++			"ā -a",
++			"/bin/echo -s=\"FallbackUsername FallbackUsername\"",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo -m='fridge' %u",
++			"ā  -ß",
++			"/bin/echo -m='fridge' FallbackUsername",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo -m='fridge' %u",
++			"-ā -a",
++			"/bin/echo -m='fridge' FallbackUsername",
++			true,
++			true,
++			true,
++		},
++		{
++			"/bin/echo %u",
++			"-n",
++			"/bin/echo '_n'",
++			true,
++			true,
++			false,
++		},
++		{
++			"/bin/echo %u",
++			"o'clock",
++			"/bin/echo 'o_clock'",
++			true,
++			true,
++			false,
++		},
++		{
++			"/bin/echo \"bob'",
++			"bob",
++			"/bin/echo \"bob'",
++			false,
++			false,
++			false,
++		},
++		{
++			"/bin/echo \"%u\"",
++			"%u",
++			"/bin/echo '_u'",
++			true,
++			true,
++			false,
++		},
++		{
++			"/bin/echo \"$(ls)\"",
++			"%u",
++			"/bin/echo \"$(ls)\"",
++			false,
++			false,
++			false,
++		},
++		{
++			"/bin/echo %u",
++			"\\",
++			"/bin/echo '\\'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo '%u'",
++			"\\",
++			"/bin/echo '\\'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo \"%u\"",
++			"\\",
++			"/bin/echo '\\'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo \"%u\" %u",
++			"\\",
++			"/bin/echo '\\' FallbackUsername",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo '%u' \"%u\" %u",
++			"\\",
++			"/bin/echo '\\' \"FallbackUsername\" FallbackUsername",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo '%u' \"%u\"",
++			"bob",
++			"/bin/echo 'bob' \"FallbackUsername\"",
++			true,
++			false,
++			true,
++		},
++	};
++
++	_test_talloc_string_sub_unsafe(state,
++				       expansions,
++				       ARRAY_SIZE(expansions),
++				       unsafe_characters);
++}
++
++static void test_talloc_string_sub_unsafe_minimal_unsafe_chars(void **state)
++{
++	const char *unsafe_characters = "\"'%";
++
++	static struct cmd_expansion expansions[] = {
++		{
++			"/bin/echo \"bob'",
++			"bob",
++			"/bin/echo \"bob'",
++			false,
++			false,
++			false,
++		},
++		{
++			"/bin/echo '%u'",
++			"bob",
++			"/bin/echo 'bob'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo %u",
++			"bob",
++			"/bin/echo 'bob'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo %u",
++			"bob'",
++			"/bin/echo 'bob_'",
++			true,
++			true,
++			false,
++		},
++		{
++			"/bin/echo %u",
++			"bob'''",
++			"/bin/echo 'bob___'",
++			true,
++			true,
++			false,
++		},
++		{
++			"/bin/echo %u",
++			"bob\'",
++			"/bin/echo 'bob_'",
++			true,
++			true,
++			false,
++		},
++		{
++			"/bin/echo '%u",
++			"bob bob bob",
++			"/bin/echo 'FallbackUsername",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo \"%u\"",
++			" ",
++			"/bin/echo ' '",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo \"--uu=%u\"",
++			"bob",
++			"/bin/echo \"--uu=FallbackUsername\"",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo \"--uu=%u\"",
++			"bob !0",
++			"/bin/echo \"--uu=FallbackUsername\"",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo %u",
++			"!0",
++			"/bin/echo '!0'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo \"--uu=%u\"",
++			"bob \\",
++			"/bin/echo \"--uu=FallbackUsername\"",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo --uu='%u'",
++			"bob >> x",
++			"/bin/echo --uu='bob >> x'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo '--uu=%u\"",
++			"bob",
++			"/bin/echo '--uu=FallbackUsername\"",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo --uu='%u'",
++			"bob",
++			"/bin/echo --uu='bob'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo --uu'=%u'",
++			"bob",
++			"/bin/echo --uu'=FallbackUsername'",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo --uu'=%u'",
++			"`ls`",
++			"/bin/echo --uu'=FallbackUsername'",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo --uu='%u'",
++			"u%u%u%u%u",
++			"/bin/echo --uu='u_u_u_u_u'",
++			true,
++			true,
++			false,
++		},
++		{
++			"/bin/echo --uu='%u'",
++			"$(ls)",
++			"/bin/echo --uu='$(ls)'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo --uu='%u'",
++			"`ls`",
++			"/bin/echo --uu='`ls`'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo --uu='1' %u",
++			"`ls`",
++			"/bin/echo --uu='1' FallbackUsername",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo --uu=\"'%u'\"",
++			"bob",
++			"/bin/echo --uu=\"'bob'\"",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo --uu='%u' --yy='%u' '%u' %u",
++			"bob",
++			"/bin/echo --uu='bob' --yy='bob' 'bob' FallbackUsername",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo --uu=%u%u%u'' %user 50%u",
++			"bob",
++			"/bin/echo --uu=FallbackUsernameFallbackUsernameFallbackUsername'' FallbackUsernameser 50FallbackUsername",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo %u",
++			"!!",
++			"/bin/echo '!!'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo %u",
++			">xxx",
++			"/bin/echo '>xxx'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo %u",
++			"3",
++			"/bin/echo '3'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo '%u'",
++			"3$",
++			"/bin/echo '3$'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo '%u'",
++			"comp$",
++			"/bin/echo 'comp$'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo '%u'",
++			"3$3",
++			"/bin/echo '3$3'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo '%u'",
++			"q $3",
++			"/bin/echo 'q $3'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo '%u",
++			"q $3",
++			"/bin/echo 'FallbackUsername",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo -s '%u' %u",
++			"āāā",
++			"/bin/echo -s 'āāā' FallbackUsername",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo -s '%u' %u",
++			"-āāā",
++			"/bin/echo -s '_āāā' FallbackUsername",
++			true,
++			true,
++			true,
++		},
++		{
++			"/bin/echo -s %u",
++			"āāā",
++			"/bin/echo -s 'āāā'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo -s %u",
++			"a -a",
++			"/bin/echo -s 'a -a'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo -s=%u %u",
++			"ā -a",
++			"/bin/echo -s='ā -a' 'ā -a'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo -s=\"%u %u\"",
++			"ā -a",
++			"/bin/echo -s=\"FallbackUsername FallbackUsername\"",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo -m='fridge' %u",
++			"ā  -ß",
++			"/bin/echo -m='fridge' FallbackUsername",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo -m='fridge' %u",
++			"-ā -a",
++			"/bin/echo -m='fridge' FallbackUsername",
++			true,
++			true,
++			true,
++		},
++		{
++			"/bin/echo %u",
++			"-n",
++			"/bin/echo '_n'",
++			true,
++			true,
++			false,
++		},
++		{
++			"/bin/echo %u",
++			"o'clock",
++			"/bin/echo 'o_clock'",
++			true,
++			true,
++			false,
++		},
++		{
++			"/bin/echo \"bob'",
++			"bob",
++			"/bin/echo \"bob'",
++			false,
++			false,
++			false,
++		},
++		{
++			"/bin/echo \"%u\"",
++			"%u",
++			"/bin/echo '_u'",
++			true,
++			true,
++			false,
++		},
++		{
++			"/bin/echo \"$(ls)\"",
++			"%u",
++			"/bin/echo \"$(ls)\"",
++			false,
++			false,
++			false,
++		},
++		{
++			"/bin/echo %u",
++			"\\",
++			"/bin/echo '\\'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo '%u'",
++			"\\",
++			"/bin/echo '\\'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo \"%u\"",
++			"\\",
++			"/bin/echo '\\'",
++			true,
++			false,
++			false,
++		},
++		{
++			"/bin/echo \"%u\" %u",
++			"\\",
++			"/bin/echo '\\' FallbackUsername",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo '%u' \"%u\" %u",
++			"\\",
++			"/bin/echo '\\' \"FallbackUsername\" FallbackUsername",
++			true,
++			false,
++			true,
++		},
++		{
++			"/bin/echo '%u' \"%u\"",
++			"bob",
++			"/bin/echo 'bob' \"FallbackUsername\"",
++			true,
++			false,
++			true,
++		},
++	};
++
++	_test_talloc_string_sub_unsafe(state,
++				       expansions,
++				       ARRAY_SIZE(expansions),
++				       unsafe_characters);
++}
++
++static void test_talloc_string_sub_unsafe_all_mixes(void **state)
++{
++	const char *unsafe_characters = STRING_SUB_UNSAFE_CHARACTERS;
++	size_t i;
++
++	for (i = 0; i < 32; i++) {
++		char in[100] = { 0, };
++		char out[100] = { 0, };
++		struct cmd_expansion expansions[] = {
++			{
++				in,
++				"bob",
++				out,
++				true,
++				false,
++				false,
++			},
++		};
++		bool vsq = i & 1;
++		bool vdq = i & 2;
++		bool v = i & 4;
++		bool sq = i & 8;
++		bool dq = i & 16;
++		char *inp = in;
++		char *outp = out;
++		if (vsq) {
++			inp = stpcpy(inp, "'%u' ");
++			outp = stpcpy(outp, "'bob' ");
++			debug_message("vsq ");
++		}
++		if (vdq) {
++			inp = stpcpy(inp, "\"%u\" ");
++			outp = stpcpy(outp, (vsq || sq) ? "\"FallbackUsername\" " : "'bob' ");
++			debug_message("vdq ");
++			if (vsq || sq) {
++				expansions[0].mixed_fallback = true;
++			}
++		}
++		if (v) {
++			inp = stpcpy(inp, "%u ");
++			outp = stpcpy(outp, (vsq || vdq || sq || dq) ? "FallbackUsername " : "'bob' ");
++			debug_message("v ");
++			if (vsq || vdq || sq || dq) {
++				expansions[0].mixed_fallback = true;
++			}
++		}
++		if (sq) {
++			inp = stpcpy(inp, "' ");
++			outp = stpcpy(outp, "' ");
++			debug_message("sq ");
++		}
++		if (dq) {
++			inp = stpcpy(inp, "\" ");
++			outp = stpcpy(outp, "\" ");
++			debug_message("dq ");
++		}
++		debug_message("(i: %zu)\n", i);
++		*inp = '\0';
++		*outp = '\0';
++		expansions[0].modified = strcmp(in, out) != 0;
++
++		_test_talloc_string_sub_unsafe(state,
++					       expansions,
++					       ARRAY_SIZE(expansions),
++					       unsafe_characters);
++	}
++}
++
++
++int main(void)
++{
++	const struct CMUnitTest tests[] = {
++		cmocka_unit_test(test_talloc_string_sub_unsafe),
++		cmocka_unit_test(test_talloc_string_sub_unsafe_minimal_unsafe_chars),
++		cmocka_unit_test(test_talloc_string_sub_unsafe_all_mixes),
++	};
++	if (!isatty(1)) {
++		cmocka_set_message_output(CM_OUTPUT_SUBUNIT);
++	}
++	return cmocka_run_group_tests(tests,
++				      setup_talloc_context,
++				      teardown_talloc_context);
++}
+diff --git a/lib/util/wscript_build b/lib/util/wscript_build
+index 9dff0e8925db..c9c04f1aaed3 100644
+--- a/lib/util/wscript_build
++++ b/lib/util/wscript_build
+@@ -420,3 +420,9 @@ else:
+                      deps='cmocka replace talloc stable_sort',
+                      local_include=False,
+                      for_selftest=True)
++
++    bld.SAMBA3_BINARY('test_string_sub',
++                      source='tests/test_string_sub.c',
++                      deps='''cmocka replace talloc samba-util
++                      ''',
++                      for_selftest=True)
+diff --git a/selftest/tests.py b/selftest/tests.py
+index 534612296449..71634191dd15 100644
+--- a/selftest/tests.py
++++ b/selftest/tests.py
+@@ -559,6 +559,8 @@ plantestsuite("samba.unittests.sys_rw", "none",
+               [os.path.join(bindir(), "default/lib/util/test_sys_rw")])
+ plantestsuite("samba.unittests.stable_sort", "none",
+               [os.path.join(bindir(), "default/lib/util/test_stable_sort")])
++plantestsuite("samba.unittests.test_string_sub", "none",
++              [os.path.join(bindir(), "test_string_sub")])
+ plantestsuite("samba.unittests.ntlm_check", "none",
+               [os.path.join(bindir(), "default/libcli/auth/test_ntlm_check")])
+ plantestsuite("samba.unittests.gnutls", "none",
+-- 
+2.43.0
+
+
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p16.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p16.patch
new file mode 100644
index 0000000000..f168941250
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p16.patch
@@ -0,0 +1,422 @@
+From 266cd3dc063fdb88a0d0468e8d6f85d6abdecc04 Mon Sep 17 00:00:00 2001
+From: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+Date: Sat, 2 May 2026 22:14:43 +1200
+Subject: [PATCH] CVE-2026-4408: s3:torture: tests for password
+ complexity scripts
+
+This tries to demonstrate the new logic for %u in
+'check password script'.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16034
+
+CVE: CVE-2026-4408
+Upstream-Status: Backport [https://gitlab.com/samba-team/samba/-/commit/266cd3dc063fdb88a0d0468e8d6f85d6abdecc04]
+
+Pair-Programmed-With: Stefan Metzmacher <metze@samba.org>
+
+Signed-off-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+Signed-off-by: Stefan Metzmacher <metze@samba.org>
+(cherry picked from commit 266cd3dc063fdb88a0d0468e8d6f85d6abdecc04)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ selftest/tests.py               |   2 +
+ source3/torture/test_rpc_samr.c | 358 ++++++++++++++++++++++++++++++++
+ source3/torture/wscript_build   |   6 +
+ 3 files changed, 366 insertions(+)
+ create mode 100644 source3/torture/test_rpc_samr.c
+
+diff --git a/selftest/tests.py b/selftest/tests.py
+index 71634191dd15..817c19aa1249 100644
+--- a/selftest/tests.py
++++ b/selftest/tests.py
+@@ -575,6 +575,8 @@ plantestsuite("samba.unittests.test_oLschema2ldif", "none",
+               [os.path.join(bindir(), "default/source4/utils/oLschema2ldif/test_oLschema2ldif")])
+ plantestsuite("samba.unittests.auth.sam", "none",
+               [os.path.join(bindir(), "test_auth_sam")])
++plantestsuite("samba.unittests.test_rpc_samr", "none",
++              [os.path.join(bindir(), "test_rpc_samr")])
+ if have_heimdal_support and not using_system_gssapi:
+     plantestsuite("samba.unittests.auth.heimdal_gensec_unwrap_des", "none",
+                   [valgrindify(os.path.join(bindir(), "test_heimdal_gensec_unwrap_des"))])
+diff --git a/source3/torture/test_rpc_samr.c b/source3/torture/test_rpc_samr.c
+new file mode 100644
+index 000000000000..8d4f39852462
+--- /dev/null
++++ b/source3/torture/test_rpc_samr.c
+@@ -0,0 +1,358 @@
++
++#include <stdarg.h>
++#include <stddef.h>
++#include <stdint.h>
++#include <setjmp.h>
++#include <sys/stat.h>
++#include <cmocka.h>
++#include "includes.h"
++#include "talloc.h"
++#include "libcli/util/ntstatus.h"
++#include "../librpc/gen_ndr/samr.h"
++#include "rpc_server/samr/srv_samr_util.h"
++
++/* set SAMR_DEBUG_VERBOSE to true to print more. */
++#define SAMR_DEBUG_VERBOSE true
++
++#if SAMR_DEBUG_VERBOSE
++#define debug_message(...) print_message(__VA_ARGS__)
++#else
++#define debug_message(...) /* debug_message */
++#endif
++
++static int setup_talloc_context(void **state)
++{
++	TALLOC_CTX *mem_ctx = talloc_new(NULL);
++	*state = mem_ctx;
++	return 0;
++}
++
++static int teardown_talloc_context(void **state)
++{
++	TALLOC_CTX *mem_ctx = *state;
++	TALLOC_FREE(mem_ctx);
++	return 0;
++}
++
++struct cmd_expansion {
++	const char *lp_cmd;
++	const char *username;
++	const char *result_cmd;
++	NTSTATUS result_code;
++};
++
++static struct cmd_expansion expansions[] = {
++	{
++		"/bin/echo '%u'",
++		"bob",
++		"/bin/echo 'bob'",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo %u",
++		"bob",
++		"/bin/echo 'bob'",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo %u",
++		"bob'",
++		"/bin/echo 'bob_'",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo %u",
++		"bob\'",
++		"/bin/echo 'bob_'",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo %u",
++		"bob'''",
++		"/bin/echo 'bob___'",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo %u",
++		"bob*",
++		NULL,
++		NT_STATUS_INVALID_USER_PRINCIPAL_NAME
++	},
++	{
++		"/bin/echo %u",
++		"bob\"",
++		NULL,
++		NT_STATUS_INVALID_USER_PRINCIPAL_NAME
++	},
++	{
++		"/bin/echo '%u",
++		"bob bob bob",
++		"/bin/echo '__CVE-2026-4408_FallbackUsername__",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo \"%u\"",
++		" ",
++		"/bin/echo ' '",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo \"--uu=%u\"",
++		"bob",
++		"/bin/echo \"--uu=__CVE-2026-4408_FallbackUsername__\"",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo \"--uu=%u\"",
++		"bob !0",
++		"/bin/echo \"--uu=__CVE-2026-4408_FallbackUsername__\"",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo %u",
++		"!0",
++		"/bin/echo '!0'",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo \"--uu=%u\"",
++		"bob \\",
++		NULL,
++		NT_STATUS_INVALID_USER_PRINCIPAL_NAME
++	},
++	{
++		"/bin/echo --uu='%u'",
++		"bob >> x",
++		NULL,
++		NT_STATUS_INVALID_USER_PRINCIPAL_NAME
++	},
++	{
++		"/bin/echo '--uu=%u\"",
++		"bob",
++		"/bin/echo '--uu=__CVE-2026-4408_FallbackUsername__\"",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo --uu='%u'",
++		"bob",
++		"/bin/echo --uu='bob'",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo --uu'=%u'",
++		"bob",
++		"/bin/echo --uu'=__CVE-2026-4408_FallbackUsername__'",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo --uu'=%u'",
++		"`ls`",
++		"/bin/echo --uu'=__CVE-2026-4408_FallbackUsername__'",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo --uu'=%u'",
++		"$(ls)",
++		"/bin/echo --uu'=__CVE-2026-4408_FallbackUsername__'",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo --uu='%u'",
++		"$(ls)",
++		"/bin/echo --uu='_(ls)'",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo --uu=\"'%u'\"",
++		"bob",
++		"/bin/echo --uu=\"'bob'\"",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo --uu='%u' --yy='%u' '%u' %u",
++		"bob",
++		"/bin/echo --uu='bob' --yy='bob' 'bob' __CVE-2026-4408_FallbackUsername__",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo --uu=%u%u'' %user 50%u",
++		"bob",
++		"/bin/echo --uu=__CVE-2026-4408_FallbackUsername____CVE-2026-4408_FallbackUsername__'' __CVE-2026-4408_FallbackUsername__ser 50__CVE-2026-4408_FallbackUsername__",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo %u",
++		"!!",
++		"/bin/echo '!!'",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo %u",
++		">xxx",
++		NULL,
++		NT_STATUS_INVALID_USER_PRINCIPAL_NAME
++	},
++	{
++		"/bin/echo %u",
++		"\\",
++		NULL,
++		NT_STATUS_INVALID_USER_PRINCIPAL_NAME
++	},
++	{
++		"/bin/echo %u",
++		"3",
++		"/bin/echo '3'",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo '%u'",
++		"3$",
++		"/bin/echo '3_'",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo '%u'",
++		"comp$",
++		"/bin/echo 'comp_'",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo '%u'",
++		"3$3",
++		"/bin/echo '3_3'",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo '%u'",
++		"q $3",
++		"/bin/echo 'q _3'",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo -s '%u' %u",
++		"āāā",
++		"/bin/echo -s 'āāā' __CVE-2026-4408_FallbackUsername__",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo -s '%u' %u",
++		"-āāā",
++		"/bin/echo -s '_āāā' __CVE-2026-4408_FallbackUsername__",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo -s %u",
++		"āāā",
++		"/bin/echo -s 'āāā'",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo -s %u",
++		"a -a",
++		"/bin/echo -s 'a -a'",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo -s=%u %u",
++		"ā -a",
++		"/bin/echo -s='ā -a' 'ā -a'",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo -s=\"%u %u\"",
++		"ā -a",
++		"/bin/echo -s=\"__CVE-2026-4408_FallbackUsername__ __CVE-2026-4408_FallbackUsername__\"",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo -m='fridge' %u",
++		"ā -x -ß",
++		"/bin/echo -m='fridge' __CVE-2026-4408_FallbackUsername__",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo -m='fridge' %u",
++		"-ā -a",
++		"/bin/echo -m='fridge' __CVE-2026-4408_FallbackUsername__",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo %u",
++		"-n",
++		"/bin/echo '_n'",
++		NT_STATUS_OK
++	},
++	{
++		"/bin/echo %u",
++		"o'clock",
++		"/bin/echo 'o_clock'",
++		NT_STATUS_OK
++	},
++};
++
++static void test_expansions(void **state)
++{
++	TALLOC_CTX *mem_ctx = *state;
++	size_t i;
++
++	for (i = 0; i < ARRAY_SIZE(expansions); i++) {
++		struct cmd_expansion t = expansions[i];
++		char *result_cmd = NULL;
++		NTSTATUS status;
++
++		status = check_password_complexity_internal(mem_ctx,
++							    t.lp_cmd,
++							    t.username,
++							    &result_cmd);
++		if (NT_STATUS_IS_OK(t.result_code) && NT_STATUS_IS_OK(status)) {
++			int cmp;
++
++			cmp = strcmp(t.result_cmd, result_cmd);
++			if (cmp == 0) {
++				debug_message("[%zu] «%s» «%s»   ->   «%s», nstatus %s; AS EXPECTED\n",
++					      i, t.lp_cmd,
++					      t.username,
++					      result_cmd,
++					      nt_errstr(status));
++			} else {
++				debug_message("[%zu] «%s» «%s», nstatus %s; "
++					      "expected   «%s»   got  «%s»\033[1;31m BAD! \033[0m\n",
++					      i, t.lp_cmd,
++					      t.username,
++					      nt_errstr(status),
++					      t.result_cmd,
++					      result_cmd);
++			}
++			assert_int_equal(cmp, 0);
++		} else if (NT_STATUS_EQUAL(status, t.result_code)) {
++			debug_message("[%zu] «%s» «%s», nstatus %s FAILED AS EXPECTED\n",
++				      i, t.lp_cmd,
++				      t.username,
++				      nt_errstr(status));
++		} else {
++			debug_message("[%zu] «%s» «%s» -> «%s», nstatus %s; "
++				      "EXPECTED result «%s»   ntstatus %s; \033[1;31m BAD! \033[0m\n",
++				      i, t.lp_cmd,
++				      t.username,
++				      result_cmd,
++				      nt_errstr(status),
++				      t.result_cmd,
++				      nt_errstr(t.result_code));
++			assert_int_equal(true, false);
++		}
++	}
++	debug_message("ALL correct\n");
++}
++
++int main(void)
++{
++	const struct CMUnitTest tests[] = {
++		cmocka_unit_test(test_expansions),
++	};
++	if (!isatty(1)) {
++		cmocka_set_message_output(CM_OUTPUT_SUBUNIT);
++	}
++	return cmocka_run_group_tests(tests,
++				      setup_talloc_context,
++				      teardown_talloc_context);
++}
+diff --git a/source3/torture/wscript_build b/source3/torture/wscript_build
+index 1d2520099e35..d04008b3df17 100644
+--- a/source3/torture/wscript_build
++++ b/source3/torture/wscript_build
+@@ -133,3 +133,9 @@ bld.SAMBA3_BINARY('vfstest',
+                       SMBREADLINE
+                       ''',
+                  for_selftest=True)
++
++bld.SAMBA3_BINARY('test_rpc_samr',
++                 source='test_rpc_samr.c',
++                 deps='''RPC_SERVICE cmocka
++                 ''',
++                 for_selftest=True)
+-- 
+2.43.0
+
+
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p17.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p17.patch
new file mode 100644
index 0000000000..4fe1194d41
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p17.patch
@@ -0,0 +1,55 @@
+From 65a9ac413b03eefc7a48d5536e54177319ca30e3 Mon Sep 17 00:00:00 2001
+From: Stefan Metzmacher <metze@samba.org>
+Date: Fri, 8 May 2026 23:27:35 +0200
+Subject: [PATCH] CVE-2026-4408: s3:testparm: warn about 'check password
+ script' %u usage
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16034
+
+CVE: CVE-2026-4408
+Upstream-Status: Backport [https://gitlab.com/samba-team/samba/-/commit/65a9ac413b03eefc7a48d5536e54177319ca30e3]
+
+Backport Changes:
+- Adjusted context for Samba 4.19.9 do_global_checks() because the
+  surrounding global-check order differs from the upstream 4.22 patch.
+
+Signed-off-by: Stefan Metzmacher <metze@samba.org>
+Reviewed-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+(cherry picked from commit 65a9ac413b03eefc7a48d5536e54177319ca30e3)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ source3/utils/testparm.c | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/source3/utils/testparm.c b/source3/utils/testparm.c
+index 02280595d2a0..1a6eb93a2e6d 100644
+--- a/source3/utils/testparm.c
++++ b/source3/utils/testparm.c
+@@ -277,6 +277,7 @@ static int do_global_checks(void)
+ 	const char *socket_options;
+ 	const struct loadparm_substitution *lp_sub =
+ 		loadparm_s3_global_substitution();
++	const char *check_pw_script = NULL;
+ 
+ 	fprintf(stderr, "\n");
+ 
+@@ -699,6 +700,17 @@ static int do_global_checks(void)
+ 			"CVE-2022-37966\n\n");
+ 	}
+ 
++	check_pw_script = lp_check_password_script(talloc_tos(), lp_sub);
++	if (talloc_string_sub_mixed_quoting(check_pw_script, 'u')) {
++		fprintf(stderr,
++			"WARNING: You are using 'check password script' "
++			"with mixed quoting and %%u.\n"
++			"CVE-2026-4408 changed the way %%u substitution works. \n"
++			"You should use the SAMBA_CPS_ACCOUNT_NAME "
++			"environment variable exported to the script, or\n"
++			"at least use single quotes (directly) around '%%u'.\n\n");
++	}
++
+ 	return ret;
+ }
+ 
+-- 
+2.43.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p18.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p18.patch
new file mode 100644
index 0000000000..012ac6d06e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p18.patch
@@ -0,0 +1,52 @@
+From 640f18d1a642264a9777f933dfaae78db6918a5f Mon Sep 17 00:00:00 2001
+From: Stefan Metzmacher <metze@samba.org>
+Date: Mon, 11 May 2026 13:52:52 +0200
+Subject: [PATCH] CVE-2026-4408: docs-xml/smbdotconf: clarify '%u' in
+ 'check password script'
+
+Admins should use SAMBA_CPS_ACCOUNT_NAME.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16034
+
+CVE: CVE-2026-4408
+Upstream-Status: Backport [https://gitlab.com/samba-team/samba/-/commit/640f18d1a642264a9777f933dfaae78db6918a5f]
+
+Signed-off-by: Stefan Metzmacher <metze@samba.org>
+Reviewed-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+(cherry picked from commit 640f18d1a642264a9777f933dfaae78db6918a5f)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ docs-xml/smbdotconf/security/checkpasswordscript.xml | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/docs-xml/smbdotconf/security/checkpasswordscript.xml b/docs-xml/smbdotconf/security/checkpasswordscript.xml
+index 18aa2c6d290e..dd162d89f08a 100644
+--- a/docs-xml/smbdotconf/security/checkpasswordscript.xml
++++ b/docs-xml/smbdotconf/security/checkpasswordscript.xml
+@@ -20,8 +20,8 @@
+ 
+     <itemizedlist>
+ 	<listitem><para>
+-	SAMBA_CPS_ACCOUNT_NAME is always present and contains the sAMAccountName of user,
+-	the is the same as the %u substitutions in the none AD DC case.
++	SAMBA_CPS_ACCOUNT_NAME is always present and contains the sAMAccountName of user.
++	It is the same as the '%u' substitutions in the non AD DC case.
+ 	</para></listitem>
+ 
+ 	<listitem><para>
+@@ -33,6 +33,12 @@
+ 	</para></listitem>
+     </itemizedlist>
+ 
++    <para>Even on a non AD DC SAMBA_CPS_ACCOUNT_NAME is the preferred way to access the
++    account name, as it contains the raw value provided by the client. If that's not
++    possible you should use single quotes (directly) around %u, e.g. /path/to/somescript '%u',
++    see CVE-2026-4408 for more details.
++    </para>
++
+     <para>Note: In the example directory is a sample program called <command moreinfo="none">crackcheck</command>
+     that uses cracklib to check the password quality.</para>
+ 
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p2.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p2.patch
new file mode 100644
index 0000000000..acfb0cce28
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p2.patch
@@ -0,0 +1,133 @@
+From 76dcb30911c22d92ca79e9034656b691a2d51df4 Mon Sep 17 00:00:00 2001
+From: Stefan Metzmacher <metze@samba.org>
+Date: Thu, 23 Apr 2026 18:20:15 +0200
+Subject: [PATCH] CVE-2026-4480/CVE-2026-4408: lib/util: remove unused
+ talloc_strdup(insert) from talloc_string_sub2()
+
+The insert string is not modified, so we do not need to copy it.
+
+This will simplify further changes.
+
+Review with: git show --patience
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16033
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16034
+
+CVE: CVE-2026-4408
+Upstream-Status: Backport [https://gitlab.com/samba-team/samba/-/commit/76dcb30911c22d92ca79e9034656b691a2d51df4]
+
+Signed-off-by: Stefan Metzmacher <metze@samba.org>
+Reviewed-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+(cherry picked from commit 76dcb30911c22d92ca79e9034656b691a2d51df4)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ lib/util/substitute.c | 57 +++++++++++++++++++------------------------
+ 1 file changed, 25 insertions(+), 32 deletions(-)
+
+diff --git a/lib/util/substitute.c b/lib/util/substitute.c
+index 26362ca77b2c..4a0c58ab3a7f 100644
+--- a/lib/util/substitute.c
++++ b/lib/util/substitute.c
+@@ -157,7 +157,7 @@ char *talloc_string_sub2(TALLOC_CTX *mem_ctx, const char *src,
+ 			bool replace_once,
+ 			bool allow_trailing_dollar)
+ {
+-	char *p, *in;
++	char *p;
+ 	char *s;
+ 	char *string;
+ 	ssize_t ls,lp,li,ld, i;
+@@ -175,22 +175,32 @@ char *talloc_string_sub2(TALLOC_CTX *mem_ctx, const char *src,
+ 
+ 	s = string;
+ 
+-	in = talloc_strdup(mem_ctx, insert);
+-	if (!in) {
+-		DEBUG(0, ("talloc_string_sub2: ENOMEM\n"));
+-		talloc_free(string);
+-		return NULL;
+-	}
+ 	ls = (ssize_t)strlen(s);
+ 	lp = (ssize_t)strlen(pattern);
+ 	li = (ssize_t)strlen(insert);
+ 	ld = li - lp;
+ 
+-	for (i=0;i<li;i++) {
+-		switch (in[i]) {
++	while ((p = strstr_m(s,pattern))) {
++		if (ld > 0) {
++			int offset = PTR_DIFF(s,string);
++			string = (char *)talloc_realloc_size(mem_ctx, string,
++							ls + ld + 1);
++			if (!string) {
++				DEBUG(0, ("talloc_string_sub: out of "
++					  "memory!\n"));
++				return NULL;
++			}
++			p = string + offset + (p - s);
++		}
++		if (li != lp) {
++			memmove(p+li,p+lp,strlen(p+lp)+1);
++		}
++		for (i=0; i<li; i++) {
++			switch (insert[i]) {
+ 			case '$':
+-				/* allow a trailing $
+-				 * (as in machine accounts) */
++				/*
++				 * allow a trailing $ (as in machine accounts)
++				 */
+ 				if (allow_trailing_dollar && (i == li - 1 )) {
+ 					break;
+ 				}
+@@ -204,34 +214,18 @@ char *talloc_string_sub2(TALLOC_CTX *mem_ctx, const char *src,
+ 			case '\r':
+ 			case '\n':
+ 				if (remove_unsafe_characters) {
+-					in[i] = '_';
+-					break;
++					p[i] = '_';
++					continue;
+ 				}
+ 
+ 				FALL_THROUGH;
+ 			default:
+ 				/* ok */
+ 				break;
+-		}
+-	}
+-
+-	while ((p = strstr_m(s,pattern))) {
+-		if (ld > 0) {
+-			int offset = PTR_DIFF(s,string);
+-			string = (char *)talloc_realloc_size(mem_ctx, string,
+-							ls + ld + 1);
+-			if (!string) {
+-				DEBUG(0, ("talloc_string_sub: out of "
+-					  "memory!\n"));
+-				TALLOC_FREE(in);
+-				return NULL;
+ 			}
+-			p = string + offset + (p - s);
+-		}
+-		if (li != lp) {
+-			memmove(p+li,p+lp,strlen(p+lp)+1);
++
++			p[i] = insert[i];
+ 		}
+-		memcpy(p, in, li);
+ 		s = p + li;
+ 		ls += ld;
+ 
+@@ -239,7 +233,6 @@ char *talloc_string_sub2(TALLOC_CTX *mem_ctx, const char *src,
+ 			break;
+ 		}
+ 	}
+-	TALLOC_FREE(in);
+ 	return string;
+ }
+ 
+-- 
+2.43.0
+
+
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p3.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p3.patch
new file mode 100644
index 0000000000..1a92409ce9
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p3.patch
@@ -0,0 +1,208 @@
+From 3032b7efe9d2fd35081ec33d575d01f9ebf6725c Mon Sep 17 00:00:00 2001
+From: Stefan Metzmacher <metze@samba.org>
+Date: Thu, 23 Apr 2026 18:20:15 +0200
+Subject: [PATCH] CVE-2026-4480/CVE-2026-4408: lib/util: factor out a
+ mask_unsafe_character() helper function
+
+This moves the logic into a single place and
+makes if more flexible to be used with more
+values than STRING_SUB_UNSAFE_CHARACTERS.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16033
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16034
+
+CVE: CVE-2026-4408
+Upstream-Status: Backport [https://gitlab.com/samba-team/samba/-/commit/3032b7efe9d2fd35081ec33d575d01f9ebf6725c]
+
+Signed-off-by: Stefan Metzmacher <metze@samba.org>
+Reviewed-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+(cherry picked from commit 3032b7efe9d2fd35081ec33d575d01f9ebf6725c)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ lib/util/substitute.c | 109 +++++++++++++++++++++---------------------
+ lib/util/substitute.h |   6 ++-
+ 2 files changed, 60 insertions(+), 55 deletions(-)
+
+diff --git a/lib/util/substitute.c b/lib/util/substitute.c
+index 4a0c58ab3a7f..b9fe32e993ec 100644
+--- a/lib/util/substitute.c
++++ b/lib/util/substitute.c
+@@ -35,6 +35,33 @@
+  * @brief Substitute utilities.
+  **/
+ 
++static inline
++char mask_unsafe_character(char in,
++			   bool is_last,
++			   bool allow_trailing_dollar,
++			   const char *unsafe_characters,
++			   char safe_out)
++{
++	const char *unsafe = NULL;
++
++	if (unsafe_characters == NULL) {
++		return in;
++	}
++
++	/* allow a trailing $ (as in machine accounts) */
++	if (allow_trailing_dollar && is_last && in == '$') {
++		return in;
++	}
++
++	unsafe = strchr(unsafe_characters, in);
++	if (unsafe != NULL) {
++		return safe_out;
++	}
++
++	/* ok */
++	return in;
++}
++
+ /**
+  Substitute a string for a pattern in another string. Make sure there is
+  enough room!
+@@ -42,14 +69,16 @@
+  This routine looks for pattern in s and replaces it with
+  insert. It may do multiple replacements or just one.
+ 
+- Any of " ; ' $ or ` in the insert string are replaced with _
++ Any of STRING_SUB_UNSAFE_CHARACTERS in the insert string are replaced with _
++
+  if len==0 then the string cannot be extended. This is different from the old
+  use of len==0 which was for no length checks to be done.
+ **/
+ 
+ void string_sub(char *s, const char *pattern, const char *insert, size_t len)
+ {
+-	bool remove_unsafe_characters = true;
++	const char *unsafe_characters = STRING_SUB_UNSAFE_CHARACTERS;
++	char safe_character = '_';
+ 	char *p;
+ 	size_t ls, lp, li, i;
+ 
+@@ -76,26 +105,18 @@ void string_sub(char *s, const char *pattern, const char *insert, size_t len)
+ 			memmove(p+li,p+lp,strlen(p+lp)+1);
+ 		}
+ 		for (i=0;i<li;i++) {
+-			switch (insert[i]) {
+-			case '$':
+-			case '`':
+-			case '"':
+-			case '\'':
+-			case ';':
+-			case '%':
+-			case '\r':
+-			case '\n':
+-				if ( remove_unsafe_characters ) {
+-					p[i] = '_';
+-					/* yes this break should be here
+-					 * since we want to fall throw if
+-					 * not replacing unsafe chars */
+-					break;
+-				}
+-				FALL_THROUGH;
+-			default:
+-				p[i] = insert[i];
+-			}
++			/*
++			 * Without allow_trailing_dollar we don't
++			 * need to calculate is_last...
++			 */
++			const bool is_last = false;
++			const bool allow_trailing_dollar = false;
++
++			p[i] = mask_unsafe_character(insert[i],
++						     is_last,
++						     allow_trailing_dollar,
++						     unsafe_characters,
++						     safe_character);
+ 		}
+ 		s = p + li;
+ 		ls = ls + li - lp;
+@@ -157,9 +178,11 @@ char *talloc_string_sub2(TALLOC_CTX *mem_ctx, const char *src,
+ 			bool replace_once,
+ 			bool allow_trailing_dollar)
+ {
+-	char *p;
+-	char *s;
+-	char *string;
++	const char *unsafe_characters = STRING_SUB_UNSAFE_CHARACTERS;
++	const char safe_character = '_';
++	char *p = NULL,
++	char *s = NULL;
++	char *string = NULL;
+ 	ssize_t ls,lp,li,ld, i;
+ 
+ 	if (!insert || !pattern || !*pattern || !src) {
+@@ -195,36 +218,14 @@ char *talloc_string_sub2(TALLOC_CTX *mem_ctx, const char *src,
+ 		if (li != lp) {
+ 			memmove(p+li,p+lp,strlen(p+lp)+1);
+ 		}
+-		for (i=0; i<li; i++) {
+-			switch (insert[i]) {
+-			case '$':
+-				/*
+-				 * allow a trailing $ (as in machine accounts)
+-				 */
+-				if (allow_trailing_dollar && (i == li - 1 )) {
+-					break;
+-				}
+-
+-				FALL_THROUGH;
+-			case '`':
+-			case '"':
+-			case '\'':
+-			case ';':
+-			case '%':
+-			case '\r':
+-			case '\n':
+-				if (remove_unsafe_characters) {
+-					p[i] = '_';
+-					continue;
+-				}
+-
+-				FALL_THROUGH;
+-			default:
+-				/* ok */
+-				break;
+-			}
++		for (i=0; i < li; i++) {
++			bool is_last = (i == li - 1);
+ 
+-			p[i] = insert[i];
++			p[i] = mask_unsafe_character(insert[i],
++						     is_last,
++						     allow_trailing_dollar,
++						     unsafe_characters,
++						     safe_character);
+ 		}
+ 		s = p + li;
+ 		ls += ld;
+diff --git a/lib/util/substitute.h b/lib/util/substitute.h
+index 3134cfcdea54..e1a82859daca 100644
+--- a/lib/util/substitute.h
++++ b/lib/util/substitute.h
+@@ -26,6 +26,8 @@
+ 
+ #include <talloc.h>
+ 
++#define STRING_SUB_UNSAFE_CHARACTERS "$`\"';%\r\n"
++
+ /**
+  Substitute a string for a pattern in another string. Make sure there is
+  enough room!
+@@ -33,7 +35,9 @@
+  This routine looks for pattern in s and replaces it with
+  insert. It may do multiple replacements.
+ 
+- Any of " ; ' $ or ` in the insert string are replaced with _
++ Any of STRING_SUB_UNSAFE_CHARACTERS (see above) in the
++ insert string are replaced with _
++
+  if len==0 then the string cannot be extended. This is different from the old
+  use of len==0 which was for no length checks to be done.
+ **/
+-- 
+2.43.0
+
+
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p4.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p4.patch
new file mode 100644
index 0000000000..d68964ca75
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p4.patch
@@ -0,0 +1,179 @@
+From 3f24236a5000402de11d973527eb7d28fd30de19 Mon Sep 17 00:00:00 2001
+From: Stefan Metzmacher <metze@samba.org>
+Date: Thu, 30 Apr 2026 14:48:26 +0200
+Subject: [PATCH] CVE-2026-4480/CVE-2026-4408: lib/util: split out
+ realloc_string_sub_raw()
+
+This will allow realloc_string_sub2() to use it in order
+to have the logic in one place only.
+
+And it will also allow adjacted callers to be
+more flexible.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16033
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16034
+
+CVE: CVE-2026-4408
+Upstream-Status: Backport [https://gitlab.com/samba-team/samba/-/commit/3f24236a5000402de11d973527eb7d28fd30de19]
+
+Signed-off-by: Stefan Metzmacher <metze@samba.org>
+Reviewed-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+(cherry picked from commit 3f24236a5000402de11d973527eb7d28fd30de19)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ lib/util/substitute.c | 85 ++++++++++++++++++++++++++++++-------------
+ lib/util/substitute.h | 18 +++++++++
+ 2 files changed, 78 insertions(+), 25 deletions(-)
+
+diff --git a/lib/util/substitute.c b/lib/util/substitute.c
+index b9fe32e993ec..465aea866055 100644
+--- a/lib/util/substitute.c
++++ b/lib/util/substitute.c
+@@ -171,32 +171,24 @@ _PUBLIC_ void all_string_sub(char *s,const char *pattern,const char *insert, siz
+  * talloc version of string_sub2.
+  */
+ 
+-char *talloc_string_sub2(TALLOC_CTX *mem_ctx, const char *src,
+-			const char *pattern,
+-			const char *insert,
+-			bool remove_unsafe_characters,
+-			bool replace_once,
+-			bool allow_trailing_dollar)
++bool realloc_string_sub_raw(char **_string,
++			    const char *pattern,
++			    const char *insert,
++			    bool replace_once,
++			    bool allow_trailing_dollar,
++			    const char *unsafe_characters,
++			    char safe_character)
+ {
+-	const char *unsafe_characters = STRING_SUB_UNSAFE_CHARACTERS;
+-	const char safe_character = '_';
+-	char *p = NULL,
++	char *p = NULL;
+ 	char *s = NULL;
+ 	char *string = NULL;
+ 	ssize_t ls,lp,li,ld, i;
+ 
+-	if (!insert || !pattern || !*pattern || !src) {
+-		return NULL;
+-	}
+-
+-	string = talloc_strdup(mem_ctx, src);
+-	if (string == NULL) {
+-		DEBUG(0, ("talloc_string_sub2: "
+-			"talloc_strdup failed\n"));
+-		return NULL;
++	if (!insert || !pattern || !*pattern || !_string|| !*_string) {
++		return false;
+ 	}
+ 
+-	s = string;
++	s = string = *_string;
+ 
+ 	ls = (ssize_t)strlen(s);
+ 	lp = (ssize_t)strlen(pattern);
+@@ -205,14 +197,13 @@ char *talloc_string_sub2(TALLOC_CTX *mem_ctx, const char *src,
+ 
+ 	while ((p = strstr_m(s,pattern))) {
+ 		if (ld > 0) {
+-			int offset = PTR_DIFF(s,string);
+-			string = (char *)talloc_realloc_size(mem_ctx, string,
+-							ls + ld + 1);
++			ptrdiff_t offset = PTR_DIFF(s,string);
++			string = talloc_realloc(NULL, string, char, ls + ld + 1);
+ 			if (!string) {
+-				DEBUG(0, ("talloc_string_sub: out of "
+-					  "memory!\n"));
+-				return NULL;
++				DBG_ERR("out of memory(realloc)!\n");
++				return false;
+ 			}
++			*_string = string;
+ 			p = string + offset + (p - s);
+ 		}
+ 		if (li != lp) {
+@@ -234,6 +225,50 @@ char *talloc_string_sub2(TALLOC_CTX *mem_ctx, const char *src,
+ 			break;
+ 		}
+ 	}
++	return true;
++}
++
++char *talloc_string_sub2(TALLOC_CTX *mem_ctx,
++			 const char *src,
++			 const char *pattern,
++			 const char *insert,
++			 bool remove_unsafe_characters,
++			 bool replace_once,
++			 bool allow_trailing_dollar)
++{
++	const char *unsafe_characters = NULL;
++	char safe_character = '\0';
++	char *string = NULL;
++	bool ok;
++
++	if (!insert || !pattern || !*pattern || !src) {
++		return NULL;
++	}
++
++	if (remove_unsafe_characters) {
++		unsafe_characters = STRING_SUB_UNSAFE_CHARACTERS;
++		safe_character = '_';
++	}
++
++	string = talloc_strdup(mem_ctx, src);
++	if (string == NULL) {
++		DBG_ERR("out of memory, talloc_strdup(src)!\n");
++		return NULL;
++	}
++
++	ok = realloc_string_sub_raw(&string,
++				    pattern,
++				    insert,
++				    replace_once,
++				    allow_trailing_dollar,
++				    unsafe_characters,
++				    safe_character);
++	if (!ok) {
++		TALLOC_FREE(string);
++		DBG_ERR("out of memory, realloc_string_sub_raw()!\n");
++		return NULL;
++	}
++
+ 	return string;
+ }
+ 
+diff --git a/lib/util/substitute.h b/lib/util/substitute.h
+index e1a82859daca..041a649fd181 100644
+--- a/lib/util/substitute.h
++++ b/lib/util/substitute.h
+@@ -51,6 +51,24 @@ void string_sub(char *s,const char *pattern, const char *insert, size_t len);
+ **/
+ void all_string_sub(char *s,const char *pattern,const char *insert, size_t len);
+ 
++/*
++ * If unsafe_characters is NULL all characters are allowed,
++ * if unsafe_characters is not NULL all characters caught
++ * by iscntrl() are also replaced by safe_character.
++ *
++ * *_string might be reallocated!
++ *
++ * On error *_string may still be reallocated and
++ * may contain partial replacements.
++ */
++bool realloc_string_sub_raw(char **_string,
++			    const char *pattern,
++			    const char *insert,
++			    bool replace_once,
++			    bool allow_trailing_dollar,
++			    const char *unsafe_characters,
++			    char safe_character);
++
+ char *talloc_string_sub2(TALLOC_CTX *mem_ctx, const char *src,
+ 			const char *pattern,
+ 			const char *insert,
+-- 
+2.43.0
+
+
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p5.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p5.patch
new file mode 100644
index 0000000000..056be12eb6
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p5.patch
@@ -0,0 +1,46 @@
+From 113ba24197ca4e5bd683951f99fa4553a4240e48 Mon Sep 17 00:00:00 2001
+From: Stefan Metzmacher <metze@samba.org>
+Date: Wed, 6 May 2026 17:23:39 +0200
+Subject: [PATCH] CVE-2026-4480/CVE-2026-4408: s3:lib: fix potential
+ memory leak in talloc_sub_basic()
+
+This makes the code easier to understand...
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16033
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16034
+
+CVE: CVE-2026-4408
+Upstream-Status: Backport [https://gitlab.com/samba-team/samba/-/commit/113ba24197ca4e5bd683951f99fa4553a4240e48]
+
+Signed-off-by: Stefan Metzmacher <metze@samba.org>
+Reviewed-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+(cherry picked from commit 113ba24197ca4e5bd683951f99fa4553a4240e48)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ source3/lib/substitute.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/source3/lib/substitute.c b/source3/lib/substitute.c
+index 40eb15aee04b..5121fcaac1c4 100644
+--- a/source3/lib/substitute.c
++++ b/source3/lib/substitute.c
+@@ -317,6 +317,7 @@ char *talloc_sub_basic(TALLOC_CTX *mem_ctx,
+ 	}
+ 
+ 	tmp_ctx = talloc_stackframe();
++	a_string = talloc_steal(tmp_ctx, a_string);
+ 
+ 	for (s = a_string; (p = strchr_m(s, '%')); s = a_string + (p - b)) {
+ 
+@@ -478,6 +479,7 @@ error:
+ 	TALLOC_FREE(a_string);
+ 
+ done:
++	a_string = talloc_steal(mem_ctx, a_string);
+ 	TALLOC_FREE(tmp_ctx);
+ 	return a_string;
+ }
+-- 
+2.43.0
+
+
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p6.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p6.patch
new file mode 100644
index 0000000000..3b04d99f40
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p6.patch
@@ -0,0 +1,131 @@
+From c4a93471622e5d7f8e28073029f3ebfbe22b6288 Mon Sep 17 00:00:00 2001
+From: Stefan Metzmacher <metze@samba.org>
+Date: Thu, 23 Apr 2026 21:11:27 +0200
+Subject: [PATCH] CVE-2026-4480/CVE-2026-4408: s3:lib: let
+ realloc_string_sub2() use realloc_string_sub_raw()
+
+We don't need this logic more than once!
+
+But we leave the strange calling convention of
+realloc_string_sub2(), where the caller it
+not allowed to use the passed pointer when
+NULL is returned...
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16033
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16034
+
+CVE: CVE-2026-4408
+Upstream-Status: Backport [https://gitlab.com/samba-team/samba/-/commit/c4a93471622e5d7f8e28073029f3ebfbe22b6288]
+
+Signed-off-by: Stefan Metzmacher <metze@samba.org>
+Reviewed-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+(cherry picked from commit c4a93471622e5d7f8e28073029f3ebfbe22b6288)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ source3/lib/substitute_generic.c | 81 ++++++++++----------------------
+ 1 file changed, 24 insertions(+), 57 deletions(-)
+
+diff --git a/source3/lib/substitute_generic.c b/source3/lib/substitute_generic.c
+index 26c5ee761f8b..e0639f04eb8e 100644
+--- a/source3/lib/substitute_generic.c
++++ b/source3/lib/substitute_generic.c
+@@ -37,71 +37,38 @@ char *realloc_string_sub2(char *string,
+ 			bool remove_unsafe_characters,
+ 			bool allow_trailing_dollar)
+ {
+-	char *p, *in;
+-	char *s;
+-	ssize_t ls,lp,li,ld, i;
++	const char *unsafe_characters = NULL;
++	char safe_character = '\0';
++	bool ok;
+ 
+ 	if (!insert || !pattern || !*pattern || !string || !*string)
+ 		return NULL;
+ 
+-	s = string;
++	if (remove_unsafe_characters) {
++		unsafe_characters = STRING_SUB_UNSAFE_CHARACTERS;
++		safe_character = '_';
++	}
+ 
+-	in = talloc_strdup(talloc_tos(), insert);
+-	if (!in) {
+-		DEBUG(0, ("realloc_string_sub: out of memory!\n"));
++	ok = realloc_string_sub_raw(&string,
++				    pattern,
++				    insert,
++				    false,  /* replace_once */
++				    allow_trailing_dollar,
++				    unsafe_characters,
++				    safe_character);
++	if (!ok) {
++		DBG_ERR("out of memory, realloc_string_sub_raw()!\n");
++		/*
++		 * The calling convention of realloc_string_sub2()
++		 * is very strange regarding stale string pointers.
++		 *
++		 * It is assumed the given string was allocated
++		 * on talloc_tos(), so we just don't touch
++		 * it at all here...
++		 */
+ 		return NULL;
+ 	}
+-	ls = (ssize_t)strlen(s);
+-	lp = (ssize_t)strlen(pattern);
+-	li = (ssize_t)strlen(insert);
+-	ld = li - lp;
+-	for (i=0;i<li;i++) {
+-		switch (in[i]) {
+-			case '$':
+-				/* allow a trailing $
+-				 * (as in machine accounts) */
+-				if (allow_trailing_dollar && (i == li - 1 )) {
+-					break;
+-				}
+-				FALL_THROUGH;
+-			case '`':
+-			case '"':
+-			case '\'':
+-			case ';':
+-			case '%':
+-			case '\r':
+-			case '\n':
+-				if ( remove_unsafe_characters ) {
+-					in[i] = '_';
+-					break;
+-				}
+-				FALL_THROUGH;
+-			default:
+-				/* ok */
+-				break;
+-		}
+-	}
+ 
+-	while ((p = strstr_m(s,pattern))) {
+-		if (ld > 0) {
+-			int offset = PTR_DIFF(s,string);
+-			string = talloc_realloc(NULL, string, char, ls + ld + 1);
+-			if (!string) {
+-				DEBUG(0, ("realloc_string_sub: "
+-					"out of memory!\n"));
+-				talloc_free(in);
+-				return NULL;
+-			}
+-			p = string + offset + (p - s);
+-		}
+-		if (li != lp) {
+-			memmove(p+li,p+lp,strlen(p+lp)+1);
+-		}
+-		memcpy(p, in, li);
+-		s = p + li;
+-		ls += ld;
+-	}
+-	talloc_free(in);
+ 	return string;
+ }
+ 
+-- 
+2.43.0
+
+
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p7.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p7.patch
new file mode 100644
index 0000000000..a4052845fc
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p7.patch
@@ -0,0 +1,84 @@
+From 003ff9b49f65d8006330a018da6fe0169a6fdb48 Mon Sep 17 00:00:00 2001
+From: Stefan Metzmacher <metze@samba.org>
+Date: Thu, 23 Apr 2026 18:21:08 +0200
+Subject: [PATCH] CVE-2026-4480/CVE-2026-4408: lib/util: let
+ mask_unsafe_character() check all control characters
+
+There's no reason to mask only \r and \n.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16033
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16034
+
+CVE: CVE-2026-4408
+Upstream-Status: Backport [https://gitlab.com/samba-team/samba/-/commit/003ff9b49f65d8006330a018da6fe0169a6fdb48]
+
+Signed-off-by: Stefan Metzmacher <metze@samba.org>
+Reviewed-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+(cherry picked from commit 003ff9b49f65d8006330a018da6fe0169a6fdb48)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ lib/util/substitute.c | 8 +++++++-
+ lib/util/substitute.h | 6 +++---
+ 2 files changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/lib/util/substitute.c b/lib/util/substitute.c
+index 465aea866055..30989927da72 100644
+--- a/lib/util/substitute.c
++++ b/lib/util/substitute.c
+@@ -22,6 +22,7 @@
+ */
+ 
+ #include "replace.h"
++#include "system/locale.h"
+ #include "debug.h"
+ #ifndef SAMBA_UTIL_CORE_ONLY
+ #include "charset/charset.h"
+@@ -53,6 +54,10 @@ char mask_unsafe_character(char in,
+ 		return in;
+ 	}
+ 
++	if (iscntrl(in)) {
++		return safe_out;
++	}
++
+ 	unsafe = strchr(unsafe_characters, in);
+ 	if (unsafe != NULL) {
+ 		return safe_out;
+@@ -69,7 +74,8 @@ char mask_unsafe_character(char in,
+  This routine looks for pattern in s and replaces it with
+  insert. It may do multiple replacements or just one.
+ 
+- Any of STRING_SUB_UNSAFE_CHARACTERS in the insert string are replaced with _
++ Any of STRING_SUB_UNSAFE_CHARACTERS and any character
++ caught by calling iscntrl() in the insert string are replaced with _
+ 
+  if len==0 then the string cannot be extended. This is different from the old
+  use of len==0 which was for no length checks to be done.
+diff --git a/lib/util/substitute.h b/lib/util/substitute.h
+index 041a649fd181..b183d864671a 100644
+--- a/lib/util/substitute.h
++++ b/lib/util/substitute.h
+@@ -26,7 +26,7 @@
+ 
+ #include <talloc.h>
+ 
+-#define STRING_SUB_UNSAFE_CHARACTERS "$`\"';%\r\n"
++#define STRING_SUB_UNSAFE_CHARACTERS "$`\"';%"
+ 
+ /**
+  Substitute a string for a pattern in another string. Make sure there is
+@@ -35,8 +35,8 @@
+  This routine looks for pattern in s and replaces it with
+  insert. It may do multiple replacements.
+ 
+- Any of STRING_SUB_UNSAFE_CHARACTERS (see above) in the
+- insert string are replaced with _
++ Any of STRING_SUB_UNSAFE_CHARACTERS (see above) and any character
++ caught by calling iscntrl() in the insert string are replaced with _
+ 
+  if len==0 then the string cannot be extended. This is different from the old
+  use of len==0 which was for no length checks to be done.
+-- 
+2.43.0
+
+
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p8.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p8.patch
new file mode 100644
index 0000000000..f99cf2653b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p8.patch
@@ -0,0 +1,39 @@
+From 5551dd76e92480625f00765f183d753dcb857894 Mon Sep 17 00:00:00 2001
+From: Stefan Metzmacher <metze@samba.org>
+Date: Thu, 23 Apr 2026 18:21:08 +0200
+Subject: [PATCH] CVE-2026-4480/CVE-2026-4408: lib/util: add more unsafe
+ characters to STRING_SUB_UNSAFE_CHARACTERS
+
+|&<> are unsafe characters for shell processing.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16033
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16034
+
+CVE: CVE-2026-4408
+Upstream-Status: Backport [https://gitlab.com/samba-team/samba/-/commit/5551dd76e92480625f00765f183d753dcb857894]
+
+Signed-off-by: Stefan Metzmacher <metze@samba.org>
+Reviewed-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+(cherry picked from commit 5551dd76e92480625f00765f183d753dcb857894)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ lib/util/substitute.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/util/substitute.h b/lib/util/substitute.h
+index b183d864671a..41f56c73ba2c 100644
+--- a/lib/util/substitute.h
++++ b/lib/util/substitute.h
+@@ -26,7 +26,7 @@
+ 
+ #include <talloc.h>
+ 
+-#define STRING_SUB_UNSAFE_CHARACTERS "$`\"';%"
++#define STRING_SUB_UNSAFE_CHARACTERS "$`\"';%|&<>"
+ 
+ /**
+  Substitute a string for a pattern in another string. Make sure there is
+-- 
+2.43.0
+
+
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p9.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p9.patch
new file mode 100644
index 0000000000..0951bd16a9
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p9.patch
@@ -0,0 +1,61 @@
+From 0cabcbd24cf2eec692b1a9642447e81c97cc90b7 Mon Sep 17 00:00:00 2001
+From: Stefan Metzmacher <metze@samba.org>
+Date: Fri, 8 May 2026 22:33:32 +0200
+Subject: [PATCH] CVE-2026-4480/CVE-2026-4408: lib/util: let log_escape()
+ make use of iscntrl()
+
+using iscntrl() also handles 0x7F (DEL).
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16033
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=16034
+
+CVE: CVE-2026-4408
+Upstream-Status: Backport [https://gitlab.com/samba-team/samba/-/commit/0cabcbd24cf2eec692b1a9642447e81c97cc90b7]
+
+Backport Changes:
+- Adjusted context for Samba 4.19.9 where encoded_length() still takes char;
+  use unsigned char so iscntrl() receives the same safe input type as upstream.
+
+Signed-off-by: Stefan Metzmacher <metze@samba.org>
+Reviewed-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
+(cherry picked from commit 0cabcbd24cf2eec692b1a9642447e81c97cc90b7)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ lib/util/util_str_escape.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/lib/util/util_str_escape.c b/lib/util/util_str_escape.c
+index 21f6130a3d60..c6d7a0c9e77a 100644
+--- a/lib/util/util_str_escape.c
++++ b/lib/util/util_str_escape.c
+@@ -18,6 +18,7 @@
+ */
+ 
+ #include "replace.h"
++#include "system/locale.h"
+ #include "lib/util/debug.h"
+ #include "lib/util/util_str_escape.h"
+ 
+@@ -26,9 +27,9 @@
+  * Calculate the encoded length of a character for log_escape
+  *
+  */
+-static size_t encoded_length(char c)
++static size_t encoded_length(unsigned char c)
+ {
+-	if (c != '\\' &&  c > 0x1F) {
++	if (c != '\\' && !iscntrl(c)) {
+ 		return 1;
+ 	} else {
+ 		switch (c) {
+@@ -79,7 +80,7 @@ char *log_escape(TALLOC_CTX *frame, const char *in)
+ 	c = in;
+ 	e = encoded;
+ 	while (*c) {
+-		if (*c != '\\' && *c > 0x1F) {
++		if (*c != '\\' && !iscntrl((unsigned char)(*c))) {
+ 			*e++ = *c++;
+ 		} else {
+ 			switch (*c) {
+-- 
+2.43.0
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb b/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb
index 055e404bb9..5e649ec66f 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb
@@ -26,6 +26,24 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://0007-Deleted-settiong-of-python-to-fix-the-install-confli.patch \
            file://CVE-2026-3012_p1.patch \
            file://CVE-2026-3012_p2.patch \
+           file://CVE-2026-4408_p1.patch \
+           file://CVE-2026-4408_p2.patch \
+           file://CVE-2026-4408_p3.patch \
+           file://CVE-2026-4408_p4.patch \
+           file://CVE-2026-4408_p5.patch \
+           file://CVE-2026-4408_p6.patch \
+           file://CVE-2026-4408_p7.patch \
+           file://CVE-2026-4408_p8.patch \
+           file://CVE-2026-4408_p9.patch \
+           file://CVE-2026-4408_p10.patch \
+           file://CVE-2026-4408_p11.patch \
+           file://CVE-2026-4408_p12.patch \
+           file://CVE-2026-4408_p13.patch \
+           file://CVE-2026-4408_p14.patch \
+           file://CVE-2026-4408_p15.patch \
+           file://CVE-2026-4408_p16.patch \
+           file://CVE-2026-4408_p17.patch \
+           file://CVE-2026-4408_p18.patch \
            "
 
 SRC_URI:append:libc-musl = " \
-- 
2.35.6



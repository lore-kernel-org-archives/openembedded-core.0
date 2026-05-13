Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D8CCD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 17:30:06 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2962.1778693403474357021
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 10:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=KsvhLP3K;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4003; q=dns/txt;
  s=iport01; t=1778693403; x=1779903003;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ht727sg7bzMb2lOs7xDnja/okAfpfzmoTIZ1MwlQi9M=;
  b=KsvhLP3KulFbjfNAYBPjTUZ+t4grEWXgK4e7K7tT92PHF4zEkbKGxQeh
   YujCZuHddsjsM539pf8iikRonCRNw6bihLQhziN028OLHdQjk/yZTmnjA
   4E+kWQmB2NsU7OAXKslkIc+Clv9NvP6ivCUnxGt9phSl3DYdw0en7faFe
   +H05FmFJOLNgSyrz0rc7JG9+6YY2fs9YFhkfRofksDDAszY+wMcjxdBZh
   4i2NNRgFkdwK2c/RLJhkBbYZNSja3B22y5N4vjZB2LdY7XhP3zJ2JawF+
   mZpCm5l/8nVEpGkVlB6ItfLvPVJeKranFsd6388VxIUSkN6DOUzjjRtXl
   A==;
X-CSE-ConnectionGUID: tFbaWKZKQKqYJF8afc6KbA==
X-CSE-MsgGUID: qzZg1DVzQ2CdkXNOOGy9OQ==
X-IPAS-Result: =?us-ascii?q?A0BKAgCDswRq/43/Ja1agjQQGoJTcl9CSQOUJ4IhA4ETi?=
 =?us-ascii?q?lGSNoF/DwEBAQ84GQQBAYUGAo0yAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDYZaAQIBAycLAVYcAwECLyALIwgHEoMCAYI6AzYCA?=
 =?us-ascii?q?REGsQCBeTOBAYNaBQkCQ1CyKg2CUwEFBhQBgTiFP4J6hSNbGAGEeycbG4Fyg?=
 =?us-ascii?q?RWBO4E3doEFgRpCAQIBGIgKBIIigQ6BXR6NDUiBHgNZLAFVEw0KCwcFgWYDK?=
 =?us-ascii?q?gsSEhgVbjIdgSM+F4ELGwcFgUuCBXJqgQKEX3gjLANOgS4yAwsYDUgRLDcUG?=
 =?us-ascii?q?wQ+bgeKTB0PgjABgQ0BByICIAKCCqV0oB1xCiiDdIwejz6FfBozhASUFZJSm?=
 =?us-ascii?q?QYijWeECZJHhGiBaDyBRwsHcBWDIlMZD444g2uBf4MUwS0kNQIJAy8BAQcCB?=
 =?us-ascii?q?w0DC4FokX0BAQ?=
IronPort-Data: A9a23:dwYtha5u2w3jNnZ5BqHvxQxRtFbGchMFZxGqfqrLsTDasY5as4F+v
 mpNUWyFP/3bMTChed8kboi0/BsPvMLXnIIwTFZrpXo3Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOW88BGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo+KUzBHf/g2Qqaj9NsPrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eIaMS89lUM0J31
 uUpCh5dZx6I2cG86efuIgVsrpxLwMjDJogTvDRkiDreF/tjGcyFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEWUrsUIMpWcOOAnWTzbjhSqFu9rqss6G+Vxwt0uFToGIWIJI3THpsPzi50o
 Erf7Vb2Wz0kJuXF4jaGwlSLocDezATCDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0c8tXGus8rgqKzKXd5y6CA2kAQ3hPcrQbWNQeXzcm0
 BqN2tjuHzEq6OHTQnOG/bDSpjS3UcQIEVI/ieY/ZVNty7HeTEsb1Hojkv4L/HaJs+DI
IronPort-HdrOrdr: A9a23:D31tcqguVS21iHq4KFQZ78kO/nBQXvYji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: 9a23:7mdQU2Dghyxk/Qf6EzVJ/kcrOfIGS17E/VX+c0a2AjhKQpTAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3A98FtcA12c9LYLLgp1wSVI4muyDUj+racBxkhr4c?=
 =?us-ascii?q?/4eKINhxWHBCynWWQe9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,233,1770595200"; 
   d="scan'208";a="756913628"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 May 2026 17:30:02 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 79CDA18000193;
	Wed, 13 May 2026 17:30:02 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id C6059CC12B5; Wed, 13 May 2026 10:30:01 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: yoann.congal@smile.fr,
	openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2 1/2] binutils: fix CVE-2026-3441 and CVE-2026-3442
Date: Wed, 13 May 2026 10:27:33 -0700
Message-Id: <20260513172734.3995341-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <DICS8ZZ99Q7C.25QI9TUSM1VCB@smile.fr>
References: <DICS8ZZ99Q7C.25QI9TUSM1VCB@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 17:30:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236997

From: Sudhir Dumbhare <sudumbha@cisco.com>

This patch applies the upstream fix [1], which addresses two out-of-bounds
read issues in bfd/xcofflink.c within xcoff_link_add_symbols(). The changes
shown in [2] are referenced by [3] and [4].

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=c2bf7de1eb77a91d7a3c86d56408bf57de540faf
[2] https://sourceware.org/git/?p=binutils-gdb.git;a=blobdiff;f=bfd/xcofflink.c;h=1781182fa6a3f92e5e91996f8b0dcf3ab192679b;hp=fde21c9f9583baff05e72e390e6bb896d02f9d43;hb=c2bf7de1eb77a91d7a3c86d56408bf57de540faf;hpb=d7f532cb3a46527
[3] https://bugzilla.suse.com/show_bug.cgi?id=CVE-2026-3441
[4] https://bugzilla.suse.com/show_bug.cgi?id=CVE-2026-3442

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-3441
https://nvd.nist.gov/vuln/detail/CVE-2026-3442
https://www.suse.com/security/cve/CVE-2026-3441.html
https://www.suse.com/security/cve/CVE-2026-3442.html

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
Changes v1 -> v2:
- fixed tab issue around context lines

 .../binutils/binutils-2.42.inc                |  1 +
 .../CVE-2026-3441_CVE-2026-3442.patch         | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 1a865c45f4..1a91792b13 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -74,5 +74,6 @@ SRC_URI = "\
      file://0030-CVE-2025-11840.patch \
      file://CVE-2025-69647.patch \
      file://CVE-2025-69648.patch \
+     file://CVE-2026-3441_CVE-2026-3442.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch b/meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch
new file mode 100644
index 0000000000..ada80e5189
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch
@@ -0,0 +1,51 @@
+From a28f517b1e3c3c22d5984e82046dcb844eef63fd Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sat, 28 Feb 2026 13:16:40 +1030
+Subject: [PATCH] xcofflink buffer overflows
+
+This fixes two fuzzed object file out-of-bounds accesses.
+
+	* xcofflink.c (xcoff_link_add_symbols): Properly bounds check
+	XTY_LD x_scnlen index.  Sanity check r_symndx before using it
+	to index sym hashes.
+
+CVE: CVE-2026-3441 CVE-2026-3442
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=c2bf7de1eb77a91d7a3c86d56408bf57de540faf]
+
+(cherry picked from commit c2bf7de1eb77a91d7a3c86d56408bf57de540faf)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ bfd/xcofflink.c | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/bfd/xcofflink.c b/bfd/xcofflink.c
+index e0165d202a9..88c49755c64 100644
+--- a/bfd/xcofflink.c
++++ b/bfd/xcofflink.c
+@@ -1873,12 +1873,9 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
+ 	     follow its appropriate XTY_SD symbol.  The .set pseudo op can
+ 	     cause the XTY_LD to not follow the XTY_SD symbol. */
+ 	  {
+-	    bool bad;
+-
+-	    bad = false;
+-	    if (aux.x_csect.x_scnlen.u64
+-		>= (size_t) (esym - (bfd_byte *) obj_coff_external_syms (abfd)))
+-	      bad = true;
++	    bool bad = (aux.x_csect.x_scnlen.u64
++			>= ((esym - (bfd_byte *) obj_coff_external_syms (abfd))
++			    / symesz));
+ 	    if (! bad)
+ 	      {
+ 		section = xcoff_data (abfd)->csects[aux.x_csect.x_scnlen.u64];
+@@ -2244,6 +2241,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
+ 		 functions imported from dynamic objects.  */
+ 	      if (info->output_bfd->xvec == abfd->xvec
+ 		  && *rel_csect != bfd_und_section_ptr
++		  && (unsigned long) rel->r_symndx < obj_raw_syment_count (abfd)
+ 		  && obj_xcoff_sym_hashes (abfd)[rel->r_symndx] != NULL)
+ 		{
+ 		  struct xcoff_link_hash_entry *h;
+-- 
+2.35.6
+
-- 
2.35.6



Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48553C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 05:03:52 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1957.1783487024151082495
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 22:03:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=l1mHKNFw;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6373; q=dns/txt;
  s=iport01; t=1783487024; x=1784696624;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p/MQPfDX4Xzt00b7sefHABhOJnp4sxYm7fvsc0j6qJI=;
  b=l1mHKNFwHpV0D+7afhxXTAM8U7vFbEK5FyfSFsvyHbvE9SOfBBEy0kKp
   raK6011Dnnbhi0dGTAbBGUYlTE12siQLugV4Ebc1bOFjHz/c0qr/g1Ykj
   CXPUjo58G4zqHOBaDYkdxOuFY8zxPFUH6vQ7LvN56fn+wFCZ6Vxt9KpsR
   idDqH7bdldoQbbVptICREsb0gLCbBj4AzGC7XkH/Wylo4lUyL4PQGg3VF
   ZWlZ+maiB6F1bbhf9uYM/Y1n4VnuZLL+ha+M6pN4VjFaHt8Ot1oYbVvHt
   yYfF0FtcaHxq7N4H9VcTwFtIUZL1ocev3vgfz1VI9AVS/FxgGancBrrmL
   g==;
X-CSE-ConnectionGUID: PWBtKlJWQCqzo43s8L+d0g==
X-CSE-MsgGUID: nXCWkFFeRP692iKVxH5zyQ==
X-IPAS-Result: =?us-ascii?q?A0BIAgB+2U1q/5T/Ja1aglmCV3RfQkkDlkcDnhuBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBQKNTQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBAycLARgBLRAcAwECLysjCBAJgwIBgnMCARG3ARo3gXkzg?=
 =?us-ascii?q?QGDKAGBVNssAQsUAQWBM4U/iB9bGAGCSYIzJxsbgXKBFYE7gi6BBYFcAgOBJ?=
 =?us-ascii?q?CGGXQSCInoSgVcDHoUPikpIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4Xg?=
 =?us-ascii?q?QwbBwWBHYFggQKEeSMfAzl/gTB1SnktgQIBEh4KgVKCHAMLGA1IESw3FBsEP?=
 =?us-ascii?q?m4HjSgXD4IeIAEebwErF2gZgRSldqEPCiiDdYwhj0KFeBozhASUF5JRC5h9g?=
 =?us-ascii?q?lmLMZU0gRyEaIFoPIFZcBWDIglKGQ+OLQsLg2CFE8lHJDUCCQMvAQEHAgcOA?=
 =?us-ascii?q?wuBaJAAAiYHgU4BAQ?=
IronPort-Data: A9a23:e6hqmKg6tnQgip/1SZe3OT/nX161MREKZh0ujC45NGQN5FlHY01je
 htvCGnXaPaNM2Twf48laY/joBxQsMDVmoBnTgA+qSAwFXxjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMtPrc8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUgxcxrImVsy
 sUzMSIKMkuY18b1zOq0H7wEasQLdKEHPasFsX1miDWcBvE8TNWaGuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgd/5JEWxI9EglH2aCVRslecv4I84nPYy0p6172F3N/9J4TXGZwPxB7Ez
 o7A12LJKS4ZGvKS8wLboyitpdHfvX7pSbtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBF2cHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn2891te5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:n6Ntn6NaP+LN98BcThmjsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH8dmpM
 FdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPHhXg2UK1XYDNu5deXcGPDV7OQ==
X-Talos-CUID: 9a23:GlU7xmHVZ0zK6bXOqmJfy2QIOcQHTUT21WXXfxSjWUIqROWaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AixBI6Q6TZAob2GPNBi2DzhuKxoxu04+RC24jnK8?=
 =?us-ascii?q?+5ZjeNA9OKxfAniWOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,153,1779148800"; 
   d="scan'208";a="505412204"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 08 Jul 2026 05:03:43 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 0D77A1800016C;
	Wed,  8 Jul 2026 05:03:43 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id A94DFCBF203; Tue,  7 Jul 2026 22:03:42 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-core][wrynose][PATCH 4/6] rsync: Fix CVE-2026-43620
Date: Tue,  7 Jul 2026 22:02:22 -0700
Message-Id: <20260708050224.3660629-4-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260708050224.3660629-1-asparmar@cisco.com>
References: <20260708050224.3660629-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 05:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240418

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream v3.4.3 backport for
CVE-2026-43620. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/RsyncProject/rsync/commit/0cf200ecbb8baaf58070d825c4fbd892b4a63b69
[2] https://github.com/RsyncProject/rsync/security/advisories/GHSA-28pw-r563-rxvm

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../rsync/files/CVE-2026-43620.patch          | 122 ++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.4.1.bb    |   1 +
 2 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43620.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43620.patch b/meta/recipes-devtools/rsync/files/CVE-2026-43620.patch
new file mode 100644
index 0000000000..2852b74b8d
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43620.patch
@@ -0,0 +1,122 @@
+From 271771f089f5f7acff5cce1ca3242849b0f6a6a0 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Tue, 5 May 2026 16:48:16 +1000
+Subject: [PATCH] receiver: add parent_ndx<0 guard, mirroring 797e17f
+
+Commit 797e17f ("fixed an invalid access to files array") added a
+parent_ndx < 0 guard to send_files() in sender.c, but the visually-
+identical block in recv_files() in receiver.c was not updated. A
+malicious rsync:// server can therefore drive any connecting client
+into the same out-of-bounds dir_flist->files[-1] read followed by a
+file_struct dereference in f_name() one line later.
+
+Reach: protocol-30+ default (inc_recurse) makes flist.c:2745 set
+parent_ndx = -1 on the first received flist when the sender omits a
+leading "." entry; rsync.c flist_for_ndx() does not reject ndx == 0
+in that state because the range check evaluates 0 < 0 = false; and
+read_ndx_and_attrs() only validates ndx with the ITEM_TRANSFER bit
+set, so iflags=ITEM_IS_NEW (or any other non-transfer iflag word)
+bypasses the check.
+
+Apply the same guard receiver-side. Confirmed: the same PoC (a
+minimal Python rsyncd that handshakes with CF_INC_RECURSE, sends a
+no-leading-"." flist, and emits ndx=0 with ITEM_IS_NEW) crashes
+unpatched 3.4.2 with SEGV_MAPERR si_addr=0x4101a-class in the
+receiver child; with this guard it exits cleanly with code 2
+(RERR_PROTOCOL).
+
+The attack surface delta over the sender variant is large:
+the original was malicious-client -> daemon, this is
+malicious-server -> any rsync client doing a normal rsync://
+or remote-shell pull.
+
+Reported by Pratham Gupta (alchemy1729).
+
+Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
+
+CVE: CVE-2026-43620
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/0cf200ecbb8baaf58070d825c4fbd892b4a63b69]
+
+(cherry picked from commit 0cf200ecbb8baaf58070d825c4fbd892b4a63b69)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ generator.c | 4 ++++
+ io.c        | 3 +++
+ receiver.c  | 7 ++++++-
+ sender.c    | 2 ++
+ 4 files changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/generator.c b/generator.c
+index 311e9b78..89f99db4 100644
+--- a/generator.c
++++ b/generator.c
+@@ -2146,6 +2146,8 @@ void check_for_finished_files(int itemizing, enum logcode code, int check_redo)
+ 			if (send_failed)
+ 				ndx = get_hlink_num();
+ 			flist = flist_for_ndx(ndx, "check_for_finished_files.1");
++			if (ndx < flist->ndx_start)
++				exit_cleanup(RERR_PROTOCOL);
+ 			file = flist->files[ndx - flist->ndx_start];
+ 			assert(file->flags & FLAG_HLINKED);
+ 			if (send_failed)
+@@ -2174,6 +2176,8 @@ void check_for_finished_files(int itemizing, enum logcode code, int check_redo)
+ 
+ 			flist = cur_flist;
+ 			cur_flist = flist_for_ndx(ndx, "check_for_finished_files.2");
++			if (ndx < cur_flist->ndx_start)
++				exit_cleanup(RERR_PROTOCOL);
+ 
+ 			file = cur_flist->files[ndx - cur_flist->ndx_start];
+ 			if (solo_file)
+diff --git a/io.c b/io.c
+index bb60eeca..c654a7ba 100644
+--- a/io.c
++++ b/io.c
+@@ -1090,6 +1090,9 @@ static void got_flist_entry_status(enum festatus status, int ndx)
+ {
+ 	struct file_list *flist = flist_for_ndx(ndx, "got_flist_entry_status");
+ 
++	if (ndx < flist->ndx_start)
++		exit_cleanup(RERR_PROTOCOL);
++
+ 	if (remove_source_files) {
+ 		active_filecnt--;
+ 		active_bytecnt -= F_LENGTH(flist->files[ndx - flist->ndx_start]);
+diff --git a/receiver.c b/receiver.c
+index a487ad5a..3fa68d71 100644
+--- a/receiver.c
++++ b/receiver.c
+@@ -467,7 +467,10 @@ static void handle_delayed_updates(char *local_name)
+ static void no_batched_update(int ndx, BOOL is_redo)
+ {
+ 	struct file_list *flist = flist_for_ndx(ndx, "no_batched_update");
+-	struct file_struct *file = flist->files[ndx - flist->ndx_start];
++	struct file_struct *file;
++	if (ndx < flist->ndx_start)
++		exit_cleanup(RERR_PROTOCOL);
++	file = flist->files[ndx - flist->ndx_start];
+ 
+ 	rprintf(FERROR_XFER, "(No batched update for%s \"%s\")\n",
+ 		is_redo ? " resend of" : "", f_name(file, NULL));
+@@ -604,6 +607,8 @@ int recv_files(int f_in, int f_out, char *local_name)
+ 
+ 		if (ndx - cur_flist->ndx_start >= 0)
+ 			file = cur_flist->files[ndx - cur_flist->ndx_start];
++		else if (cur_flist->parent_ndx < 0)
++			exit_cleanup(RERR_PROTOCOL);
+ 		else
+ 			file = dir_flist->files[cur_flist->parent_ndx];
+ 		fname = local_name ? local_name : f_name(file, fbuf);
+diff --git a/sender.c b/sender.c
+index 99f431fe..033f87e5 100644
+--- a/sender.c
++++ b/sender.c
+@@ -140,6 +140,8 @@ void successful_send(int ndx)
+ 		return;
+ 
+ 	flist = flist_for_ndx(ndx, "successful_send");
++	if (ndx < flist->ndx_start)
++		exit_cleanup(RERR_PROTOCOL);
+ 	file = flist->files[ndx - flist->ndx_start];
+ 	if (!change_pathname(file, NULL, 0))
+ 		return;
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
index f84f269692..2145d4ce7e 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2026-43619_p5.patch \
            file://CVE-2026-43619_p6.patch \
            file://CVE-2026-43618.patch \
+           file://CVE-2026-43620.patch \
            "
 SRC_URI[sha256sum] = "2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf69850d65fd88c52"
 
-- 
2.35.6



Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFFCC4453D
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 04:40:37 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12755.1784868029711075031
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 21:40:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=CWxXg+DA;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6424; q=dns/txt;
  s=iport01; t=1784868029; x=1786077629;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OlV7pn2F7dDKuzSuNfHfulHS9p+/Ul0B7in5r3vvBgk=;
  b=CWxXg+DAExL03E7trDJrZ+RmZD5c20f93yS2AMTZDetmhjauq8CnBQvp
   +pat+NA1h3PPOjLcHPU3W1UJEsj2Fa04E6NkSgupTYmv7oeKr9QPZmx+J
   C2al21tMnnD7rQ/a8fWdl1Pt/u4Yg8GtQBFNu2ronLaPQ41jCjBxCOtAy
   mHIo5oLJ8ogZ1LIhehKWUCebeV80KBWSzpPbhafGLsF4QM6QE7bz+kbrm
   M9yP6jeQxgPLHl7OAO32YTI5sndqSmFnaGFlliALRbrJ1L8J0QF6HL7O0
   OL/82l60eVBaUrMC6K+oLjRhCSISw7LoUFI7xYsTs8daqhv1Skx7wgPnK
   g==;
X-CSE-ConnectionGUID: hWFYpmOhQn+gXMkOnTHN+w==
X-CSE-MsgGUID: jHhvywjxSPGTInSeIOu/Pw==
X-IPAS-Result: =?us-ascii?q?A0BIAgAb62Jq/5L/Ja1aglmCV3RfQkkDlkcDnhuBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBQKNXwImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBAycLARgBLRAcAwECLysjCBAJgwIBgnQCARHBKho3gXkzg?=
 =?us-ascii?q?QGDKAGBVNsuAQsUAQWBM4U/iCBcGAGCSYIzJxsbgXKBFYE7gi6BBYFcAgOBJ?=
 =?us-ascii?q?CGGXQSCInoSgVcDHpA2SIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMG?=
 =?us-ascii?q?wcFgR2BLHmEVyMfAzl/gS91SnctaQESF4Emg0kCgTcDCxgNSBEsNxQZBD5uB?=
 =?us-ascii?q?41rI4IgIAEebwErF2gZgRSldqEPCiiDdYwhj0KFeBozhASUF5JRC5h9glmLM?=
 =?us-ascii?q?ZU0gRyEaYFoPIFZcBWDIglKGQ+OLQsLg2CFE8UnJDUCCQMvAQEHAgcOAwuBa?=
 =?us-ascii?q?JAAAiYHgU8BAQ?=
IronPort-Data: A9a23:64JN9ajDTIVMrLOZV6MB41j0X161MREKZh0ujC45NGQN5FlHY01je
 htvC26Fa/eCYjShfd1xbo/k901Uv5+EnNQ1SFZvryo9En5jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMtPjf8E8HUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUYxchGGWRp9
 cUeaz89SxOkgd6W5vGkH7wEasQLdKEHPasFsX1miDWcBvE8TNWbEuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgl/5JEWxI9EglH2aCVRslecv4I84nPYy0p6172F3N/9J4XWG58IwxbEz
 o7A12bZAg8LK96P8gKqzlOqveLuuj68YJ1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFm8HY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn2891te5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:SdC04q0Glf13vIxuCyie/gqjBGokLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmoFFebvN5CBB/KXHyTj9Nco8y9+a963tr+Lfw3BxCTxOUchbnn5E4sLxKDwMeOGAbqBJbK
 ah2g==
X-Talos-CUID: =?us-ascii?q?9a23=3AHX/ZKWpOHIfGX6nfImBw1SvmUcAaXEzFyVDQGkn?=
 =?us-ascii?q?7BlZMS5qTdX+2u7wxxg=3D=3D?=
X-Talos-MUID: 9a23:8JXtYwbfBfZKXuBTtR/smiB9NtdT24uSKUY2nLQhpo68Knkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,181,1779148800"; 
   d="scan'208";a="514625584"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Jul 2026 04:40:28 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 80D8C18000480;
	Fri, 24 Jul 2026 04:40:28 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 2C8E7CBF203; Thu, 23 Jul 2026 21:40:28 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-core][wrynose][PATCH v3 4/6] rsync: Fix CVE-2026-43620
Date: Thu, 23 Jul 2026 21:39:12 -0700
Message-Id: <20260724043914.4061351-4-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260724043914.4061351-1-asparmar@cisco.com>
References: <20260724043914.4061351-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 04:40:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241882

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream v3.4.3 backport for
CVE-2026-43620. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/RsyncProject/rsync/commit/0cf200ecbb8baaf58070d825c4fbd892b4a63b69
[2] https://github.com/RsyncProject/rsync/security/advisories/GHSA-28pw-r563-rxvm

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
Changes in v2:
- No changes made; rebase only.

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


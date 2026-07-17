Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C59CC4451C
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 05:21:07 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7270.1784265662194073316
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 22:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Bf1x5OY9;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6373; q=dns/txt;
  s=iport01; t=1784265662; x=1785475262;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p/MQPfDX4Xzt00b7sefHABhOJnp4sxYm7fvsc0j6qJI=;
  b=Bf1x5OY904HSorRH/T5VUOTCr5gNFE6ythz1r2M28deMSk610W14bGsF
   rVthA+4dpI3J5RD1z3ckI3NNp+u3l2BXQnOCmHX+b65aAPwlWZJrckKAH
   lc0gL/AR4U0aU7+p3th0ZzVEuOFgWSVN2hcIzMZiuHdZvizBWw6LSh8Qp
   qcZ0mzB25DzTirKQ1xQfsPfSnYUhHcXvPgUy6tQTDa4fRYdmXJj5sHN5L
   UJKTJsFBylnIUVQ/puGnZKzTOK9ZNHCKVhv/SBe5QFHuGORyizBlawpm8
   Lo0mnJ+/IcGnjtNg0eQFkGId5oTluHSTXPUwyEki0G2wNOKzr8RtphYH0
   g==;
X-CSE-ConnectionGUID: cxRNBU1DR3ec5d/UPfmkYg==
X-CSE-MsgGUID: EjWfrIARSziklDV8vUnBMQ==
X-IPAS-Result: =?us-ascii?q?A0BIAgByt1lq/5P/Ja1aglmCV3RfQkkDlkcDnhuBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBQKNUgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBAycLARgBLRAcAwECLysjCBAJgwIBgnQCARG8eho3gXkzg?=
 =?us-ascii?q?QGDKAGBVNsuAQsUAYE4hT+IIFwYAYJJgjMnGxuBcoEVgTuCLoEFgVwCA4EkI?=
 =?us-ascii?q?YZdBIIiehKBVwMehHOLDkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBD?=
 =?us-ascii?q?BsHBYEdgTqBAIR2Ix8DOX+BL3VKdy1pARIXgU6CFIE+AwsYDUgRLDcUGwQ+b?=
 =?us-ascii?q?geNSCOCHyABHm8BKxdoGYEUpXahDwoog3WMIY9ChXgaM4QElBeSUQuYfYJZi?=
 =?us-ascii?q?zGVNIEchGmBaDyBWXAVgyIJShkPji0LC4NghRPJRSQ1AgkDLwEBBwIHDgMLg?=
 =?us-ascii?q?WiQAAImB4FPAQE?=
IronPort-Data: A9a23:w1pKVK3xWizZ0dyaNPbD5YJwkn2cJEfYwER7XKvMYLTBsI5bpzAOy
 2ceXWiHOPffYTGmfop0b9jioEhQ7ZXSzdFjGwQ43Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g2EtbDpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGB1EMG6clo8pNWmxFq
 PBfFQgDaxOyiLfjqF67YrEEasULNsLnOsYb/3pn1zycVK5gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUifC/FMEg9/5JYWlfywj2P6eidwo1OOrq1x6G/WpOB0+OW0aYSNIofVGq25mG61p
 F3I5UXQOCoINd+b5QTV7E+qrMr2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl/BQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:8BCEg6iSNqwfoyWCqzxvWt1O0XBQXvgji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGsddB8MTMHfiLqWwLzM2fKYEKA
 ==
X-Talos-CUID: 9a23:ubDFjWBUsuqwvLb6EyJ3zmg+J5kJSCbQxyrcZHKAB2NqebLAHA==
X-Talos-MUID: 9a23:zSI8JgT/DiqJDWhhRXTBhg5sLuZB2Z+8CUMJvatWpfSCHwlJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208";a="511600377"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 05:21:01 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 1DB681800024F;
	Fri, 17 Jul 2026 05:21:01 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id BCA32CBF204; Thu, 16 Jul 2026 22:21:00 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashishkumar Parmar <asparmar@cisco.com>
Subject: [wrynose][PATCH v2 4/6] rsync: Fix CVE-2026-43620
Date: Thu, 16 Jul 2026 22:20:57 -0700
Message-Id: <20260717052059.773645-5-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260717052059.773645-1-asparmar@cisco.com>
References: <20260717052059.773645-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241117

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


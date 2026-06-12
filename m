Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 904EDCD98DB
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 12:15:30 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69072.1781266523020001377
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 05:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=KzM3qw1J;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6360; q=dns/txt;
  s=iport01; t=1781266523; x=1782476123;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9a852K88RSP8tXCCKuY8p/79wrM3tNNJSSJuBmVtNy4=;
  b=KzM3qw1Jbda6rAXGgPgloT8QrC9chK32PNJxZtO9IjWRO+B9ilk3SmK2
   Y7jEL3zEnANDQJ/MjYuyKy7giobX9dWErg5zGo3Q7wIlwhKPt6PviwVZH
   q8tQECWbDJlIWmEamGE6QpaG53Nw/BhDN104d92nwfjUxiXfPV0RynFxm
   o4mx2qQnhJKQ8pGzX9ty6Z0UVAHwUyjcu+87h+znb0bled+I45qvWYo90
   HBsiD1dHapkZifv11fU4gV8s+PI0wCMfKZjVKsmmAliQn9ftYD9whDiTg
   xHWvv1cxH4BLzAAW5mh3R6bRf37NOQWcfk9SFW+9AoZE7tTxe/gaRIYUx
   g==;
X-CSE-ConnectionGUID: QfhxTo9NRJutymKpN9ZsmA==
X-CSE-MsgGUID: /hiwH158Qeis/ZJx8o4bmg==
X-IPAS-Result: =?us-ascii?q?A0BIAgDn9itq/5T/Ja1aglmCV3RfQkmWSwOeG4F+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUGAo1AAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBAgEDJwsBGAEtEBwDAQIvKyMIEAmDAgGCcwIBEbI9GjeBeTOBA?=
 =?us-ascii?q?YMoAT8CQ1DbLAELFAEFgTOFP4gfWxgBgkmCMycbG4FygRWBO4IugQWBXAICA?=
 =?us-ascii?q?ReBDSGGXQSCInoSgVoDHoJVjBZIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQwbBwWBSoEraoEDhQ0jHwM5f4F0gShnaRUwNYEBARESAwsYDUgRLDcUG?=
 =?us-ascii?q?wQ+bgeMQhcPgh4gAR5vASsXaBmnCqEPCiiDdYwhj0KFeBozhASUF5JRC5h9g?=
 =?us-ascii?q?lmLMZU0gRyEaIFoPIFZcBU7gmcJShkPji0LC4NghRPCfCQ1AgkyAQEHAgcOA?=
 =?us-ascii?q?wuBaJAAAiYHgU4BAQ?=
IronPort-Data: A9a23:9fuU3a2+IgSEySqqrvbD5YJwkn2cJEfYwER7XKvMYLTBsI5bp2AAm
 mYbWW2EO/uJNmejLtgnO9/lpE4B65eBxtVhGQNu3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 bsen+WFYAX7g2AtaDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGNU82LbEfq8BNI3xS5
 Pk7MBZcXAuGrrfjqF67YrEEasULNsLnOsYb/3pn1zycVK9gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiQC/FMEg9/5JYWlfywj2P6eidwo1OOrq1x6G/WpOB0+OS8a4GFI4zQGa25mG7fp
 mPZ3z2kUigXNcfY+xiVonXwjOrAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl/AQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSn1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:0ksOH6DfWXqr8OTlHel055DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80l6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygd179
 YHT0EHMqySMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ASV0mlhD0JcTpy1SZNNXF7OaY=
X-Talos-CUID: 9a23:GRIQXG+UUuan/OQvx16Vv3caGtAZdSz79lXNP169Kn5PGY+OTHbFrQ==
X-Talos-MUID: 9a23:+WWnXQZlHPk/nuBT8D/tmxE7aZdR7qW1T3IvgcUB58OBOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,200,1774310400"; 
   d="scan'208";a="493381824"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Jun 2026 12:15:22 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 26ED018000149;
	Fri, 12 Jun 2026 12:15:22 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id A84C8CBF204; Fri, 12 Jun 2026 05:15:21 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-core][scarthgap][PATCH 4/6] rsync: Fix CVE-2026-43620
Date: Fri, 12 Jun 2026 05:13:32 -0700
Message-ID: <20260612121514.2282121-4-asparmar@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20260612121514.2282121-1-asparmar@cisco.com>
References: <20260612121514.2282121-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 12:15:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238606

From: Ashishkumar Parmar <asparmar@cisco.com>

Pick the upstream backport [1] for CVE-2026-43620 as mentioned in [2],
where a malicious rsync server could trigger an out-of-bounds file-list
access in the receiver.

[1] https://github.com/RsyncProject/rsync/commit/0a5fa00fdcbacbebb89daca0ae68ae320f22dc74
[2] https://www.cve.org/CVERecord?id=CVE-2026-43620

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../rsync/files/CVE-2026-43620.patch          | 124 ++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |   1 +
 2 files changed, 125 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43620.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43620.patch b/meta/recipes-devtools/rsync/files/CVE-2026-43620.patch
new file mode 100644
index 0000000000..dd50f1ebd6
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43620.patch
@@ -0,0 +1,124 @@
+From 6495fc027ad48678c98eab3de4224e29473ccb08 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/0a5fa00fdcbacbebb89daca0ae68ae320f22dc74]
+
+(cherry picked from commit 0a5fa00fdcbacbebb89daca0ae68ae320f22dc74)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ generator.c | 4 ++++
+ io.c        | 3 +++
+ receiver.c  | 7 ++++++-
+ sender.c    | 2 ++
+ 4 files changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/generator.c b/generator.c
+index b80eb2e3..38f5ad33 100644
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
+index 63e5cedb..0a993e0f 100644
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
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
index e232abafc3..b1483fc6a6 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -39,6 +39,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2026-43619_p3.patch \
            file://CVE-2026-43619_p4.patch \
            file://CVE-2026-43618.patch \
+           file://CVE-2026-43620.patch \
            "
 SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
 
-- 
2.44.1



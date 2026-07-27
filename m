Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01CA0C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:20 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43746.1785192977709069469
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vPE+q9uT;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493f75f7172so27169775e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785192976; x=1785797776; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VmSYXyMdQlw/y6su6QgzpYNwY6XA0rzJORJR5TBJizQ=;
        b=vPE+q9uTC03UEBV6Ho+DxRCXY1HqHoVmmHoN3M6uIFFgZmVWB1EBecB8GUSh4lMWkJ
         aDpG+zE0PNo+luSnBeNS/kkL/6msktkthtWvMp5jeXbTQGDhw+RNM02g21kJA1l64BUl
         5OMVGb4QBo8NMpIKGN/dUaGGdJqsDHMoDAZHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192976; x=1785797776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VmSYXyMdQlw/y6su6QgzpYNwY6XA0rzJORJR5TBJizQ=;
        b=M1EeOtxmZ6hYaxOzJHMXZXv0TCwyH0OkYNtxtvWCfXZEMvOE5R1m1usF7QP01ZssXr
         Oz86PO/iYaJ9RIUQun+HOMZbQUD9eulKCun1I4qprw7/4kD0ib1ZvJM4wpnqSZX8hrAQ
         rxKeiZmlin/92Otp+eLdToQx+Pud9o1xxRa5C1o4lRDNGJSl1FZvb8QD8nwiO5rpatoj
         I4p6NhZD1/dAR2oJ+N0q7sU610Rlt0lJ3zcpI2u28oTN/16Pcx/zKo2zoo9y/tClMX03
         f237i2PdczmY3oushnhKt0fkSnxzSBcHzUQH2gkBq+RLKq7h9keZ/jMsQ/hh65JLn7AA
         b+/Q==
X-Gm-Message-State: AOJu0YxU5m3y94ru+VsNKuIXuDFI9CP97XBMf3/m68jqj0o9bPoPh5Xz
	T6iQC1EgLdOkbvR2zAuQYwtiPqkEOpx6p5+BSoJgcsmBPnKIl2zGCza3DBGxbw5+4APVGEtIiYl
	H8WB67yk=
X-Gm-Gg: AR+sD13JfnEuk9cDbPwyv0JRSjDY6+WJQB9THagYH7WwOMjrk84M8rQv8wlXJt5cATB
	j+tezEAFAcy5m88zsq3r/Ya+zP9VhOcPEaephgX4EHU6VLCFf7+wXldrJjskiypJGLM1iOH79o9
	swtHl8yFR1X8s8fz4Nq0t3JENXTt7wDgOJVSagomguoNjA1TSMVjK5v0U3egEFU5AT+QCw+AlAJ
	Af+CGKIutPRKgGEwM1wy+x4cC8eSrNIh+PKSgabRiWR0B1VsxGmvN6/Jy6v8Lxn3vNnmHAPKDIh
	cUs5/BhIZEO2INhnh0pe6sGnqWJqfXUm7S842GqD49l45EO6aNQcrIT7JHqXxoglcNf2jHTLqR7
	IaIj1csMeMpupFiYd4gTPRwz0irTsIkXc4eoxGuJTfSPLada03k43jbJYvgPkGvQIv2VMDLhVNF
	1gOB7A+XMFY/TKjkWTy+kIqZC7NRUWKICxyzjsyaYJ89SoLAFdrKJ9gCs7hIDT3ZFn0TLDuQk5U
	PJC2UL51AnMtdUQ
X-Received: by 2002:a05:600c:a4f:b0:493:d741:5d72 with SMTP id 5b1f17b1804b1-496b57116e2mr160532815e9.38.1785192975869;
        Mon, 27 Jul 2026 15:56:15 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 09/36] rsync: Fix CVE-2026-43620
Date: Tue, 28 Jul 2026 00:55:23 +0200
Message-ID: <7c88d9dc29f948d178ff270c1b55fdfd1a26296c.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242117

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream v3.4.3 backport for
CVE-2026-43620. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/RsyncProject/rsync/commit/0cf200ecbb8baaf58070d825c4fbd892b4a63b69
[2] https://github.com/RsyncProject/rsync/security/advisories/GHSA-28pw-r563-rxvm

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../rsync/files/CVE-2026-43620.patch          | 122 ++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.4.1.bb    |   1 +
 2 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43620.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43620.patch b/meta/recipes-devtools/rsync/files/CVE-2026-43620.patch
new file mode 100644
index 00000000000..2852b74b8d4
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
index f84f269692e..2145d4ce7e3 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2026-43619_p5.patch \
            file://CVE-2026-43619_p6.patch \
            file://CVE-2026-43618.patch \
+           file://CVE-2026-43620.patch \
            "
 SRC_URI[sha256sum] = "2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf69850d65fd88c52"
 


Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3460FC0218E
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 17:51:25 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.42250.1737395484554309546
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 09:51:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vpaNk5s4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2156e078563so60578355ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 09:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737395484; x=1738000284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NsuCAIsiZoI3gKcWncGgvSftL8Fs/aMYdTyM8ft6BVY=;
        b=vpaNk5s4TVXoLErjJi9VTeS6sSDPeIX2gdp1bqd4+7QAoARR/ssEcSabMJ0NeVc1J+
         YPiPEQ7spsfl/7wmeUNAc36U9L5XZLReZyxkSgRCsmTUZdz/3QXAuJJbK0OSa17N9eZ4
         oj5Zu+OqhHfAE2ef7IISDyWsAMzkK4s+CKH6X+Bs0e2VpQMF+P5pykaO3g+K8yzCHMdp
         sAEp03KdTlWFlN3lcDssSIPoMNAkNlv9CzwEqElYjpZsVkOIjt3SLPlbgbcYsyeNHIc7
         ji/SWAnRx8AuxcoDPViSaS9CQv1kp2EJyQcAiNpLeaYWkkGNE14Q4DrmxtfH/PdwA5Kc
         MIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737395484; x=1738000284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NsuCAIsiZoI3gKcWncGgvSftL8Fs/aMYdTyM8ft6BVY=;
        b=Zeue3uhYzMz0ojMQWn/g1tJReNq3at2YJBPk015mYtAaKr9tDrp+EgU7umknB/879G
         sXn9D8lkHAjCz33O7c/RCDTga5yjssoDcaHr6coW2Da9x9cDvoAsZsH7Jr/CnPAXLy1i
         RX0Zdc5nJYQm5TQIW9fdKQtcDlEskUnZxHElgDAo/U/KM0S/kRZB9geLMBIzprWQZxlA
         7/xRqpBVsgPOqGTPMhaxSPdO41F7QeOliOrh+8dlZafJ1iUyOcXVC11mFHV4UFEL6jIW
         PvXOrH1JMPe/zAZOOhWN3U4tABtcp5BwQ+Qc7Ro41BeCDi5eoo0AP7p2Za1WRsdpoQQ3
         hQ0g==
X-Gm-Message-State: AOJu0Yz1z+6ZKH3bxq4cxeRarNmTByzkFXhgC4+O6boZhuQVfkdAJPhW
	O1yDOkHAAxJnk4mtuXTYidJ8y192xBR7tJnAbYIu2ferJes0Ih+VxRg1xmej5uOPf4IEY04dg+4
	Apsc=
X-Gm-Gg: ASbGncuEj6kTktLoEHlyviaYz1pf+wbdLjssTvrhsE0vavfEaVr3cTNnyT8Cqsvdkzu
	NK3Nr/o+vQvCShBPnjRrPElJ4W+lwDAjTVGCkdSA6rfzWVUV21CCMuSPLzJ6J2Z1QwCGFRmVTsp
	i2IWty/Lprkq3obVprY14akYNbBMa7xA8vUqhaQhQSy3/lrdGfaPOyGTpwMrsVS2tsLlbVLG/lZ
	gITHpC4b0Cl7YgySDn9qUTtBCBwrum7N8J+cTlJpGqFec2tWT5ysyyDBnc=
X-Google-Smtp-Source: AGHT+IEVgPD+PHHbj+kwTLDCAnC038ZONHGFVujdoc2Roz1uXs0DAeY3th1PuFHNI5oEYNfOiLxwsw==
X-Received: by 2002:a05:6a20:7494:b0:1db:eecb:f7a1 with SMTP id adf61e73a8af0-1eb2148dfe2mr19480125637.17.1737395483717;
        Mon, 20 Jan 2025 09:51:23 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcdcf643esm6155565a12.38.2025.01.20.09.51.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 09:51:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/16] rsync: fix CVE-2024-12087
Date: Mon, 20 Jan 2025 09:50:54 -0800
Message-ID: <12328df8dfcdc73ef70af299e9ebdc1d8ae73f37.1737395091.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737395091.git.steve@sakoman.com>
References: <cover.1737395091.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 17:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210054

From: Archana Polampalli <archana.polampalli@windriver.com>

A path traversal vulnerability exists in rsync. It stems from behavior enabled
by the `--inc-recursive` option, a default-enabled option for many client options
and can be enabled by the server even if not explicitly enabled by the client.
When using the `--inc-recursive` option, a lack of proper symlink verification
coupled with deduplication checks occurring on a per-file-list basis could allow
a server to write files outside of the client's intended destination directory.
A malicious server could write malicious files to arbitrary locations named after
valid directories/paths on the client.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../rsync/files/CVE-2024-12087-0001.patch     | 49 +++++++++++++++++++
 .../rsync/files/CVE-2024-12087-0002.patch     | 31 ++++++++++++
 .../rsync/files/CVE-2024-12087-0003.patch     | 40 +++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |  3 ++
 4 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12087-0001.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12087-0002.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12087-0003.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12087-0001.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12087-0001.patch
new file mode 100644
index 0000000000..67abc64a62
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2024-12087-0001.patch
@@ -0,0 +1,49 @@
+From 688f5c379a433038bde36897a156d589be373a98 Mon Sep 17 00:00:00 2001
+From: Wayne Davison <wayne@opencoder.net>
+Date: Thu, 14 Nov 2024 15:46:50 -0800
+Subject: [PATCH] Refuse a duplicate dirlist.
+
+CVE: CVE-2024-12087
+
+Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=688f5c379a433038bde36897a156d589be373a98]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ flist.c | 9 +++++++++
+ rsync.h | 1 +
+ 2 files changed, 10 insertions(+)
+
+diff --git a/flist.c b/flist.c
+index 464d556e..847b1054 100644
+--- a/flist.c
++++ b/flist.c
+@@ -2584,6 +2584,15 @@ struct file_list *recv_file_list(int f, int dir_ndx)
+		init_hard_links();
+ #endif
+
++	if (inc_recurse && dir_ndx >= 0) {
++		struct file_struct *file = dir_flist->files[dir_ndx];
++		if (file->flags & FLAG_GOT_DIR_FLIST) {
++			rprintf(FERROR_XFER, "rsync: refusing malicious duplicate flist for dir %d\n", dir_ndx);
++			exit_cleanup(RERR_PROTOCOL);
++		}
++		file->flags |= FLAG_GOT_DIR_FLIST;
++	}
++
+	flist = flist_new(0, "recv_file_list");
+	flist_expand(flist, FLIST_START_LARGE);
+
+diff --git a/rsync.h b/rsync.h
+index 0f9e277f..b9a7101a 100644
+--- a/rsync.h
++++ b/rsync.h
+@@ -84,6 +84,7 @@
+ #define FLAG_DUPLICATE (1<<4)	/* sender */
+ #define FLAG_MISSING_DIR (1<<4)	/* generator */
+ #define FLAG_HLINKED (1<<5)	/* receiver/generator (checked on all types) */
++#define FLAG_GOT_DIR_FLIST (1<<5)/* sender/receiver/generator - dir_flist only */
+ #define FLAG_HLINK_FIRST (1<<6)	/* receiver/generator (w/FLAG_HLINKED) */
+ #define FLAG_IMPLIED_DIR (1<<6)	/* sender/receiver/generator (dirs only) */
+ #define FLAG_HLINK_LAST (1<<7)	/* receiver/generator */
+--
+2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12087-0002.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12087-0002.patch
new file mode 100644
index 0000000000..8a22e0c371
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2024-12087-0002.patch
@@ -0,0 +1,31 @@
+From 344327385fa47fa5bb67a32c237735e6240cfb93 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Tue, 26 Nov 2024 16:12:45 +1100
+Subject: [PATCH] range check dir_ndx before use
+
+CVE: CVE-2024-12087
+
+Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=344327385fa47fa5bb67a32c237735e6240cfb93]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ flist.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/flist.c b/flist.c
+index 847b1054..087f9da6 100644
+--- a/flist.c
++++ b/flist.c
+@@ -2585,6 +2585,10 @@ struct file_list *recv_file_list(int f, int dir_ndx)
+ #endif
+
+	if (inc_recurse && dir_ndx >= 0) {
++		if (dir_ndx >= dir_flist->used) {
++			rprintf(FERROR_XFER, "rsync: refusing invalid dir_ndx %u >= %u\n", dir_ndx, dir_flist->used);
++			exit_cleanup(RERR_PROTOCOL);
++		}
+		struct file_struct *file = dir_flist->files[dir_ndx];
+		if (file->flags & FLAG_GOT_DIR_FLIST) {
+			rprintf(FERROR_XFER, "rsync: refusing malicious duplicate flist for dir %d\n", dir_ndx);
+--
+2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12087-0003.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12087-0003.patch
new file mode 100644
index 0000000000..0ece69c4e7
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2024-12087-0003.patch
@@ -0,0 +1,40 @@
+From 996af4a79f9afe4d7158ecdd87c78cee382c6b39 Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Wed, 15 Jan 2025 15:10:24 +0100
+Subject: [PATCH] Fix FLAG_GOT_DIR_FLIST collission with FLAG_HLINKED
+
+fixes commit 688f5c379a43 (Refuse a duplicate dirlist.)
+
+Fixes: https://github.com/RsyncProject/rsync/issues/702
+Fixes: https://github.com/RsyncProject/rsync/issues/697
+CVE: CVE-2024-12087
+
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/996af4a79f9afe4d7158ecdd87c78cee382c6b39]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ rsync.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/rsync.h b/rsync.h
+index 9be1297b..479ac484 100644
+--- a/rsync.h
++++ b/rsync.h
+@@ -84,7 +84,6 @@
+ #define FLAG_DUPLICATE (1<<4)	/* sender */
+ #define FLAG_MISSING_DIR (1<<4)	/* generator */
+ #define FLAG_HLINKED (1<<5)	/* receiver/generator (checked on all types) */
+-#define FLAG_GOT_DIR_FLIST (1<<5)/* sender/receiver/generator - dir_flist only */
+ #define FLAG_HLINK_FIRST (1<<6)	/* receiver/generator (w/FLAG_HLINKED) */
+ #define FLAG_IMPLIED_DIR (1<<6)	/* sender/receiver/generator (dirs only) */
+ #define FLAG_HLINK_LAST (1<<7)	/* receiver/generator */
+@@ -93,6 +92,7 @@
+ #define FLAG_SKIP_GROUP (1<<10)	/* receiver/generator */
+ #define FLAG_TIME_FAILED (1<<11)/* generator */
+ #define FLAG_MOD_NSEC (1<<12)	/* sender/receiver/generator */
++#define FLAG_GOT_DIR_FLIST (1<<13)/* sender/receiver/generator - dir_flist only */
+
+ /* These flags are passed to functions but not stored. */
+
+--
+2.40.0
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
index b6baec63a2..bfbe97c57d 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -22,6 +22,9 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2024-12086-0002.patch \
            file://CVE-2024-12086-0003.patch \
            file://CVE-2024-12086-0004.patch \
+           file://CVE-2024-12087-0001.patch \
+           file://CVE-2024-12087-0002.patch \
+           file://CVE-2024-12087-0003.patch \
            "
 
 SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
-- 
2.43.0



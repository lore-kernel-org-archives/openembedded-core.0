Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17928C0218D
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 17:51:25 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.42244.1737395480413271389
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 09:51:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wKcqJE8V;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2165cb60719so78420405ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 09:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737395480; x=1738000280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pkxh7LYo9GbfmnJXVs4NGBdIPi3cJ1MRzrXAoNEpOpk=;
        b=wKcqJE8V+oS5NKRniHKRZdnwQDVHjaZNlkb2qW0ATFpvT38Njma4mvhYZpj+KtPSRj
         3D7xMcWHCJfovpDvfOMXsbrZ/RaR7rrTJj2RcsBy44V/6RAMAHWM02XSFDeAsUoIK+VE
         JLU7CwnYP1rES9nChnlPvyejAn8XP4Gco48+21ahXDacgT/dyn7we/hIe4YUM/GbNj9x
         FdaB0mwigA70iOqQu5aNVU3wivnyb1VB8k7W58x+0iwNGej3k0U9Szo2TZKBuxCQqxOZ
         zviNvyzofmENncexEIRH/BefqOdOlkmtc+Gaus4BdVr9jaHZsHtbCyzFW5ZSuapXaN/J
         sbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737395480; x=1738000280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkxh7LYo9GbfmnJXVs4NGBdIPi3cJ1MRzrXAoNEpOpk=;
        b=D3vQHlkxbv8FPyByl0Z/6K/Las4WTc/lnXfe4fSOsMbtP4XDEgAZsNd8aD0corWMpT
         DXQVVkjXuD9zA4P1ElFy8VTEulkKPiaRadokIuUusLMNaVkIgrShkON/bfG0MI4iSqUw
         TC+KvRYb0cxvazDtGOov3PsWtPMDN4EHVAtrQXNsYWhCv8eb6+hE4ezgrXyR7KuRL/h5
         IaAdf1NK0FqbGV8ga+9cVO7op7NacV8XyA8uxP24ud5XcaCxEMWdt05K6I0uT1jZHJVG
         ZfvarDZvQ4FbnvAkwF784hxDJBCteJPaEz6zJK6dVRL3QPoF38iu6PrRe2JLew965Uo6
         9dWA==
X-Gm-Message-State: AOJu0YzYcbZNMITe6wNmnilhGSZeHeUUqs6BrUiTOiriGGJYNLOiQHZI
	fsA0rXMrAXufzqbX7VeGbcWxYXYfwbkqBItxndCuB+XqPlGw980V991U7dM3W7RcW43+SIW+qe0
	3znk=
X-Gm-Gg: ASbGnctHyeNNC5ykGifb4tL3C3FzW2SzT3GNrJfTfLPy+KUUo8t6xaJCmPw071qoPBy
	r1VIqkiePcz3+WBn2mK9VeJ2LrGQLJ563EUCEb3ErcwAxBOvNmJ5eYq2q9ybHTOgaVhfUmFV4kn
	PLBAIJWCQymVGpDDBEBL6gKCdZDrh97mRrnWMgnEtFoJhaCH/TBCkC8+1cdtlgOztH4Gv7Wk5MV
	Zwv3QnrMp237sQY8OVJebQgcuwIN8Qxsbcwp5UKVATdC2w3HCkagD05oW0=
X-Google-Smtp-Source: AGHT+IEMbAJ9nAKB5a+ReLlWpDxh/61RqwU4rf0fmHCpvtRPRLn8oMPuq/6KZZdqFnN1YbFn+sVGvA==
X-Received: by 2002:a05:6a20:1582:b0:1e0:c56f:7db4 with SMTP id adf61e73a8af0-1eb21470d9dmr24425535637.2.1737395479591;
        Mon, 20 Jan 2025 09:51:19 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcdcf643esm6155565a12.38.2025.01.20.09.51.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 09:51:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/16] rsync: fix CVE-2024-12084
Date: Mon, 20 Jan 2025 09:50:51 -0800
Message-ID: <17fac276e27af19b00b6263f22156a55bae6a5c9.1737395091.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737395091.git.steve@sakoman.com>
References: <cover.1737395091.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 17:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210051

From: Archana Polampalli <archana.polampalli@windriver.com>

A heap-based buffer overflow flaw was found in the rsync daemon. This issue is due
to improper handling of attacker-controlled checksum lengths (s2length) in the code.
When MAX_DIGEST_LEN exceeds the fixed SUM_LENGTH (16 bytes), an attacker can write
out of bounds in the sum2 buffer.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../rsync/files/CVE-2024-12084-0001.patch     | 156 ++++++++++++++++++
 .../rsync/files/CVE-2024-12084-0002.patch     |  43 +++++
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |   2 +
 3 files changed, 201 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12084-0001.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12084-0002.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12084-0001.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12084-0001.patch
new file mode 100644
index 0000000000..d654067fab
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2024-12084-0001.patch
@@ -0,0 +1,156 @@
+From 0902b52f6687b1f7952422080d50b93108742e53 Mon Sep 17 00:00:00 2001
+From: Wayne Davison <wayne@opencoder.net>
+Date: Tue, 29 Oct 2024 22:55:29 -0700
+Subject: [PATCH] Some checksum buffer fixes.
+
+- Put sum2_array into sum_struct to hold an array of sum2 checksums
+  that are each xfer_sum_len bytes.
+- Remove sum2 buf from sum_buf.
+- Add macro sum2_at() to access each sum2 array element.
+- Throw an error if a sums header has an s2length larger than
+  xfer_sum_len.
+
+CVE: CVE-2024-12084
+
+Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=0902b52f6687b1f7952422080d50b93108742e53]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ io.c     | 3 ++-
+ match.c  | 8 ++++----
+ rsync.c  | 5 ++++-
+ rsync.h  | 4 +++-
+ sender.c | 4 +++-
+ 5 files changed, 16 insertions(+), 8 deletions(-)
+
+diff --git a/io.c b/io.c
+index a99ac0ec..bb60eeca 100644
+--- a/io.c
++++ b/io.c
+@@ -55,6 +55,7 @@ extern int read_batch;
+ extern int compat_flags;
+ extern int protect_args;
+ extern int checksum_seed;
++extern int xfer_sum_len;
+ extern int daemon_connection;
+ extern int protocol_version;
+ extern int remove_source_files;
+@@ -1977,7 +1978,7 @@ void read_sum_head(int f, struct sum_struct *sum)
+		exit_cleanup(RERR_PROTOCOL);
+	}
+	sum->s2length = protocol_version < 27 ? csum_length : (int)read_int(f);
+-	if (sum->s2length < 0 || sum->s2length > MAX_DIGEST_LEN) {
++	if (sum->s2length < 0 || sum->s2length > xfer_sum_len) {
+		rprintf(FERROR, "Invalid checksum length %d [%s]\n",
+			sum->s2length, who_am_i());
+		exit_cleanup(RERR_PROTOCOL);
+diff --git a/match.c b/match.c
+index cdb30a15..36e78ed2 100644
+--- a/match.c
++++ b/match.c
+@@ -232,7 +232,7 @@ static void hash_search(int f,struct sum_struct *s,
+				done_csum2 = 1;
+			}
+
+-			if (memcmp(sum2,s->sums[i].sum2,s->s2length) != 0) {
++			if (memcmp(sum2, sum2_at(s, i), s->s2length) != 0) {
+				false_alarms++;
+				continue;
+			}
+@@ -252,7 +252,7 @@ static void hash_search(int f,struct sum_struct *s,
+					if (i != aligned_i) {
+						if (sum != s->sums[aligned_i].sum1
+						 || l != s->sums[aligned_i].len
+-						 || memcmp(sum2, s->sums[aligned_i].sum2, s->s2length) != 0)
++						 || memcmp(sum2, sum2_at(s, aligned_i), s->s2length) != 0)
+							goto check_want_i;
+						i = aligned_i;
+					}
+@@ -271,7 +271,7 @@ static void hash_search(int f,struct sum_struct *s,
+						if (sum != s->sums[i].sum1)
+							goto check_want_i;
+						get_checksum2((char *)map, l, sum2);
+-						if (memcmp(sum2, s->sums[i].sum2, s->s2length) != 0)
++						if (memcmp(sum2, sum2_at(s, i), s->s2length) != 0)
+							goto check_want_i;
+						/* OK, we have a re-alignment match.  Bump the offset
+						 * forward to the new match point. */
+@@ -290,7 +290,7 @@ static void hash_search(int f,struct sum_struct *s,
+			 && (!updating_basis_file || s->sums[want_i].offset >= offset
+			  || s->sums[want_i].flags & SUMFLG_SAME_OFFSET)
+			 && sum == s->sums[want_i].sum1
+-			 && memcmp(sum2, s->sums[want_i].sum2, s->s2length) == 0) {
++			 && memcmp(sum2, sum2_at(s, want_i), s->s2length) == 0) {
+				/* we've found an adjacent match - the RLL coder
+				 * will be happy */
+				i = want_i;
+diff --git a/rsync.c b/rsync.c
+index cd288f57..b130aba5 100644
+--- a/rsync.c
++++ b/rsync.c
+@@ -437,7 +437,10 @@ int read_ndx_and_attrs(int f_in, int f_out, int *iflag_ptr, uchar *type_ptr, cha
+   */
+ void free_sums(struct sum_struct *s)
+ {
+-	if (s->sums) free(s->sums);
++	if (s->sums) {
++		free(s->sums);
++		free(s->sum2_array);
++	}
+	free(s);
+ }
+
+diff --git a/rsync.h b/rsync.h
+index d3709fe0..8ddbe702 100644
+--- a/rsync.h
++++ b/rsync.h
+@@ -958,12 +958,12 @@ struct sum_buf {
+	uint32 sum1;	        /**< simple checksum */
+	int32 chain;		/**< next hash-table collision */
+	short flags;		/**< flag bits */
+-	char sum2[SUM_LENGTH];	/**< checksum  */
+ };
+
+ struct sum_struct {
+	OFF_T flength;		/**< total file length */
+	struct sum_buf *sums;	/**< points to info for each chunk */
++	char *sum2_array;	/**< checksums of length xfer_sum_len */
+	int32 count;		/**< how many chunks */
+	int32 blength;		/**< block_length */
+	int32 remainder;	/**< flength % block_length */
+@@ -982,6 +982,8 @@ struct map_struct {
+	int status;		/* first errno from read errors		*/
+ };
+
++#define sum2_at(s, i)	((s)->sum2_array + ((OFF_T)(i) * xfer_sum_len))
++
+ #define NAME_IS_FILE		(0)    /* filter name as a file */
+ #define NAME_IS_DIR		(1<<0) /* filter name as a dir */
+ #define NAME_IS_XATTR		(1<<2) /* filter name as an xattr */
+diff --git a/sender.c b/sender.c
+index 3d4f052e..ab205341 100644
+--- a/sender.c
++++ b/sender.c
+@@ -31,6 +31,7 @@ extern int log_before_transfer;
+ extern int stdout_format_has_i;
+ extern int logfile_format_has_i;
+ extern int want_xattr_optim;
++extern int xfer_sum_len;
+ extern int csum_length;
+ extern int append_mode;
+ extern int copy_links;
+@@ -94,10 +95,11 @@ static struct sum_struct *receive_sums(int f)
+		return(s);
+
+	s->sums = new_array(struct sum_buf, s->count);
++	s->sum2_array = new_array(char, s->count * xfer_sum_len);
+
+	for (i = 0; i < s->count; i++) {
+		s->sums[i].sum1 = read_int(f);
+-		read_buf(f, s->sums[i].sum2, s->s2length);
++		read_buf(f, sum2_at(s, i), s->s2length);
+
+		s->sums[i].offset = offset;
+		s->sums[i].flags = 0;
+--
+2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12084-0002.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12084-0002.patch
new file mode 100644
index 0000000000..266b80c241
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2024-12084-0002.patch
@@ -0,0 +1,43 @@
+From 42e2b56c4ede3ab164f9a5c6dae02aa84606a6c1 Mon Sep 17 00:00:00 2001
+From: Wayne Davison <wayne@opencoder.net>
+Date: Tue, 5 Nov 2024 11:01:03 -0800
+Subject: [PATCH] Another cast when multiplying integers.
+
+CVE: CVE-2024-12084
+
+Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=42e2b56c4ede3ab164f9a5c6dae02aa84606a6c1]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ rsync.h  | 2 +-
+ sender.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/rsync.h b/rsync.h
+index 8ddbe702..0f9e277f 100644
+--- a/rsync.h
++++ b/rsync.h
+@@ -982,7 +982,7 @@ struct map_struct {
+	int status;		/* first errno from read errors		*/
+ };
+
+-#define sum2_at(s, i)	((s)->sum2_array + ((OFF_T)(i) * xfer_sum_len))
++#define sum2_at(s, i)	((s)->sum2_array + ((size_t)(i) * xfer_sum_len))
+
+ #define NAME_IS_FILE		(0)    /* filter name as a file */
+ #define NAME_IS_DIR		(1<<0) /* filter name as a dir */
+diff --git a/sender.c b/sender.c
+index ab205341..2bbff2fa 100644
+--- a/sender.c
++++ b/sender.c
+@@ -95,7 +95,7 @@ static struct sum_struct *receive_sums(int f)
+		return(s);
+
+	s->sums = new_array(struct sum_buf, s->count);
+-	s->sum2_array = new_array(char, s->count * xfer_sum_len);
++	s->sum2_array = new_array(char, (size_t)s->count * xfer_sum_len);
+
+	for (i = 0; i < s->count; i++) {
+		s->sums[i].sum1 = read_int(f);
+--
+2.40.0
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
index 53c2136f4d..749d44948d 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -15,6 +15,8 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://makefile-no-rebuild.patch \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
+           file://CVE-2024-12084-0001.patch \
+           file://CVE-2024-12084-0002.patch \
            "
 
 SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
-- 
2.43.0



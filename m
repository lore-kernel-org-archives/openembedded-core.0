Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6AA5A7E337
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 15:07:10 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id u17so10782501pfn.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 08:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Iwtx+BacfqbpgM+T70kuLJBh+cGsVkzgCgRNLljfZug=;
	b=ncTKwsGfEBGjfmgE0me3O49s/CYAVc9fEke77xqWBKHY0dUTyCjqLHaSjYmmwOXB+1
	/6pFVihQFCMUB5vQui16lbU9hW8DKW58IsNvhsTdklM4diKRzjgsE+UY4+DyebP3UNRQ
	kssCeEY0XIOry7PSYpQdvrDBNWP2k4uxiuCJGe6v5XYnzHDfEVdN2UisCEkdfIBLlFeM
	6dSo0eHMscmvrZywvS+Wmg+m6hYlUZXhj6rrPZ9f+WjBjIMwXmzw8C30qaRLXIqO3heu
	VW1NSB5cEhau/7Lz7s3I4pv1xjGG0GMs098ABn0t663PquUUQalhrGZNdjKR+UEc3fVo
	dPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Iwtx+BacfqbpgM+T70kuLJBh+cGsVkzgCgRNLljfZug=;
	b=IaUvPn6lrHc5jLz2Ai+PA5FNTmhTBXwxoU3iohkHzv+B4TYvR8FEVKzrCGDapNoYoA
	VLESH7jW3+uXfuYKC/n1ERcjN1Be3NLfZe64HITLH6Jzybdn1XDyrkJZskgaCf61P8FL
	99vdj5HfaBHQdaChs+OLwcqKBJYKYTVlnarNcV+etjlXzQVzcFRe+T/4Par07PYYLxAa
	SiYzHkWUC0otJCLHuUxEg4FHkDp8zgMCbBjlxPb+RqWRVAInwxmBrGnS1yasqSA0Kwze
	2YjmDsRzOrrY0SeH4NxTSxFvbmlusj1LXBJ/ftj4NiY8l2er0dTItUbX1ZrqAm6saZah
	7ZpQ==
X-Gm-Message-State: APjAAAWH94iVI8UjXy14Ru6Fk4zaVEuykD7uGq0LVSAYIdK5nt4Z5mJh
	I1rjUhILtsolOWlH6jLCshkgaBTt
X-Google-Smtp-Source: APXvYqx4q7d82JZr148yV8obWhLmAaZcGgK/X0gUIJboIDMbE5igkBoYm6Gwcv36psaygw9RtXKCcw==
X-Received: by 2002:a62:a508:: with SMTP id v8mr31042389pfm.87.1559574431446; 
	Mon, 03 Jun 2019 08:07:11 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:847:4796:a7c5:c767])
	by smtp.gmail.com with ESMTPSA id
	s5sm14250546pgj.60.2019.06.03.08.07.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Jun 2019 08:07:11 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 08:06:45 -0700
Message-Id: <fa40d49bfb0dedea7f3dad454c408e249f4c05f7.1559574291.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1559574291.git.akuster808@gmail.com>
References: <cover.1559574291.git.akuster808@gmail.com>
Subject: [PATCH 02/21] Tar: Security fix CVE-2019-0023
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Jun 2019 15:07:10 -0000

From: Armin Kuster <akuster@mvista.com>

Source: tar.git
MR: 97928
Type: Security Fix
Disposition: Backport from http://git.savannah.gnu.org/cgit/tar.git/commit/?id=cb07844454d8cc9fb21f53ace75975f91185a120
ChangeID: 7aee4c0daf8ce813242fe7b872583560a32bc4e3
Description:

Affects tar < 1.32

fixes CVE-2019-9923

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tar/tar/CVE-2019-9923.patch | 38 +++++++++++++++++++++++
 meta/recipes-extended/tar/tar_1.31.bb             |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2019-9923.patch

diff --git a/meta/recipes-extended/tar/tar/CVE-2019-9923.patch b/meta/recipes-extended/tar/tar/CVE-2019-9923.patch
new file mode 100644
index 0000000..a2704c3
--- /dev/null
+++ b/meta/recipes-extended/tar/tar/CVE-2019-9923.patch
@@ -0,0 +1,38 @@
+From cb07844454d8cc9fb21f53ace75975f91185a120 Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Mon, 14 Jan 2019 15:22:09 +0200
+Subject: [PATCH] Fix possible NULL dereference (savannah bug #55369)
+
+* src/sparse.c (pax_decode_header): Check return from find_next_block.
+
+Upstream-Status: Backport
+CVE:  CVE-2019-9923
+Affects: tar < 1.32
+Signed-off-by: Armin kuster <akuster@mvista.com>
+
+---
+ src/sparse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+Index: tar-1.31/src/sparse.c
+===================================================================
+--- tar-1.31.orig/src/sparse.c
++++ tar-1.31/src/sparse.c
+@@ -1267,6 +1267,8 @@ pax_decode_header (struct tar_sparse_fil
+ 	 {                                                         \
+ 	   set_next_block_after (b);                               \
+            b = find_next_block ();                                 \
++           if (!b)                                                 \
++             FATAL_ERROR ((0, 0, _("Unexpected EOF in archive"))); \
+            src = b->buffer;                                        \
+ 	   endp = b->buffer + BLOCKSIZE;                           \
+ 	 }                                                         \
+@@ -1279,6 +1281,8 @@ pax_decode_header (struct tar_sparse_fil
+       start = current_block_ordinal ();
+       set_next_block_after (current_header);
+       blk = find_next_block ();
++      if (!blk)
++        FATAL_ERROR ((0, 0, _("Unexpected EOF in archive")));
+       p = blk->buffer;
+       COPY_BUF (blk,nbuf,p);
+       if (!decode_num (&u, nbuf, TYPE_MAXIMUM (size_t)))
diff --git a/meta/recipes-extended/tar/tar_1.31.bb b/meta/recipes-extended/tar/tar_1.31.bb
index 353617e..4a9d03c 100644
--- a/meta/recipes-extended/tar/tar_1.31.bb
+++ b/meta/recipes-extended/tar/tar_1.31.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
            file://remove-gets.patch \
            file://musl_dirent.patch \
+           file://CVE-2019-9923.patch \
 "
 
 SRC_URI[md5sum] = "77afa35b696c8d760331fa0e12c2fac9"
-- 
2.7.4



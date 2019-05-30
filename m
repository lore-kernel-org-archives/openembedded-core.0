Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 271217E1B5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 00:56:04 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id u22so2783098pfm.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 17:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=O+8qYSAGPK7B9kN8PWw/JtbmG3Kx58uZRyHfrTh/5kQ=;
	b=Us32pmXwWfuEWFOI4uJ0UFrmBzLY0Q77VaaZ5SzXEoyTsOybh75fd5buNUbN2TlH3N
	+BOr3t9k8KREp3jAQ7RSRoUFhmrmmLgtZws6Sq3cjU7tTNG457muOF3KtMvbFQS0LrJ9
	/QiWe9+EEa9W9YiazasY7FWrhmgjU4BVo9rJBABIK1qXHUYmaQQXktjQXGQ6NaeIluKW
	71bCRmDW9odo7mek3eF7g7tS9Lvq/c1kbWXhm+VrNHGabl1IVWqwBWxptzXlDvtL8iNX
	HIziAMbKysfEK5fa7C0kMX6XObPQwaUeLAIaT9lCYI2fupj9zj62xg+9eLqdM6bdl9+E
	H5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=O+8qYSAGPK7B9kN8PWw/JtbmG3Kx58uZRyHfrTh/5kQ=;
	b=SWYE7mBHi9t7OjQ6AgVedXXH1FTvqAa8V0xryRZ4oUoWWE1oNPXuMwnr6RBlLXqeNB
	tDETp4/mCppME1OUPmbEOq3QplecIXB9AUiN2/vJpF3q9Nv6f+N6cy9Xh2HHXP2oCgq7
	3+vNoy4JcJT2amsHi88UBD5wCd5EH7hW5Y7dXKwOP4tW/U7vuNdcLIaBLK8qyd/SEPNO
	9+4SBPexoa89lqVbMhuw5BNAHu2JHMSFIx+LZ9MobWrjnYyJmpqmlxIIy5L1e93L0WKd
	cgBu6LNHWAUZib3R1IOL+g+E7IyQCItcEjuJvvvxfqumC0VpXDA1ASX1ginO7jc+QqQX
	dJbA==
X-Gm-Message-State: APjAAAXZlcUYVk2JG6UcU7Ik7015UUEHy3jRvFR3w4/5sWY1z6THHgho
	RpxxbXfnPxDbW8NuvCypveGIfcDy
X-Google-Smtp-Source: APXvYqxuHKPZmAiKE8LkBTNqJQ5Clm/L8HbealtiZQ05w4BcN5OSg8aKTBAlIw5kEjcGnW1/pacUug==
X-Received: by 2002:a17:90a:8982:: with SMTP id
	v2mr604694pjn.138.1559177764840; 
	Wed, 29 May 2019 17:56:04 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:4865:9151:ec2:e220])
	by smtp.gmail.com with ESMTPSA id
	c17sm840920pfo.114.2019.05.29.17.56.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 May 2019 17:56:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 17:56:00 -0700
Message-Id: <1559177762-10318-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Armin Kuster <akuster@mvista.com>
Subject: [thud][PATCH 1/3] Tar: Security fix CVE-2019-0023
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
X-List-Received-Date: Thu, 30 May 2019 00:56:04 -0000

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
---
 meta/recipes-extended/tar/tar/CVE-2019-9923.patch | 38 +++++++++++++++++++++++
 meta/recipes-extended/tar/tar_1.30.bb             |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2019-9923.patch

diff --git a/meta/recipes-extended/tar/tar/CVE-2019-9923.patch b/meta/recipes-extended/tar/tar/CVE-2019-9923.patch
new file mode 100644
index 0000000..146cbff
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
+Index: tar-1.30/src/sparse.c
+===================================================================
+--- tar-1.30.orig/src/sparse.c
++++ tar-1.30/src/sparse.c
+@@ -1231,6 +1231,8 @@ pax_decode_header (struct tar_sparse_fil
+ 	   set_next_block_after (b);                               \
+            file->dumped_size += BLOCKSIZE;                         \
+            b = find_next_block ();                                 \
++           if (!b)                                                 \
++             FATAL_ERROR ((0, 0, _("Unexpected EOF in archive"))); \
+            src = b->buffer;                                        \
+ 	   endp = b->buffer + BLOCKSIZE;                           \
+ 	 }                                                         \
+@@ -1243,6 +1245,8 @@ pax_decode_header (struct tar_sparse_fil
+       set_next_block_after (current_header);
+       file->dumped_size += BLOCKSIZE;
+       blk = find_next_block ();
++      if (!blk)
++        FATAL_ERROR ((0, 0, _("Unexpected EOF in archive")));
+       p = blk->buffer;
+       COPY_BUF (blk,nbuf,p);
+       if (!decode_num (&u, nbuf, TYPE_MAXIMUM (size_t)))
diff --git a/meta/recipes-extended/tar/tar_1.30.bb b/meta/recipes-extended/tar/tar_1.30.bb
index bd24f47..ab1b33b 100644
--- a/meta/recipes-extended/tar/tar_1.30.bb
+++ b/meta/recipes-extended/tar/tar_1.30.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
            file://remove-gets.patch \
            file://musl_dirent.patch \
+           file://CVE-2019-9923.patch \
 "
 
 SRC_URI[md5sum] = "8404e4c1fc5a3000228ab2b8ad674a65"
-- 
2.7.4



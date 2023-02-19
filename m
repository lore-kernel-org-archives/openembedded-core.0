Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C25C64ED8
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:40 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.3938.1676835090265726467
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c4Ctr4de;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id s17so834040wrt.8
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZI13n1SqFw0gLoXk8HX4jXb7MqmD9PKqmbb206sgWQ=;
        b=c4Ctr4deYwKGwLmS0ikNZWiIVLND19XZn6sAVAwGi9tyz8Qq5wyH2KFZuCXK4Kva6z
         l724xdKtxxJ14JV2/4LvdyoBAEB3/K2WRccKXj/wqEa+35McgH4C0F1FA07GZjaMg8Di
         CpMwOijUCMixC11adJlWV7fMu3JyojexK09hlEkGx6HK7WSQCaAfhA/N3NEEX/JusISp
         PnDLtargGLJjrdz3QBXEb4dVB/dXWCJ+/RWeVlRmtxKe2utADqFnK/5qGzGULxJUisUy
         cFvpDsB7WFGL6gIdVWfOqP6WV3Xa3DEf3pT6AZKdL+ehT4z8NgUZ9VGLUT699z6f30Nw
         S7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RZI13n1SqFw0gLoXk8HX4jXb7MqmD9PKqmbb206sgWQ=;
        b=mqO6msiiuAaEHZRoklMI3IUCE48t/Q/kukR6nSHoYyL/kWBfJcIo8rmXMIKpjGOlkA
         aNDhKRJiSWX2U2QsTD13aAcdESjEZquu5XeXp8TOm6xjMdkml84UtmdiB+/bW7oy87Dy
         dzx8EPnd+r22Z4uL6qdd7A5z6U2i+hooQG5CA1mVazVysp00u6D/CBkn2OTjbpzPBK6t
         mUx4U36kScS2FPwwMXMDD3s1/+aGX/Qs4sMpRu4JPYaZdawN7uaip0zKaVvyaGUAmOR2
         b1UomLI8ExhhJxF9Uqt67ZfIxEyp7QoyfF9IFhUhaJxIevvafBjvxNi28eWmmfKtQyol
         lNNQ==
X-Gm-Message-State: AO0yUKWbDJnSZ/CRx1WpGA0IVA66luEnsFbfGh9XUQkMb4XP2rqeZeN0
	ZGRhivZKNaLdPQXOfOKeQGwE2JRBP6c=
X-Google-Smtp-Source: AK7set8PRNmDL35L22h1J8Fjcpp2t1V1gVl/brLscialEZ02gkrZhIb1RjeUgNfJ7UIrUgjYpP1XYA==
X-Received: by 2002:a05:6000:10c9:b0:2c5:581d:5a1d with SMTP id b9-20020a05600010c900b002c5581d5a1dmr1260416wrx.43.1676835088762;
        Sun, 19 Feb 2023 11:31:28 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 36/39] e2fsprogs: upgrade 1.46.5 -> 1.47.0
Date: Sun, 19 Feb 2023 20:30:58 +0100
Message-Id: <20230219193101.338397-36-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177379

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-to-enable-disable-largefile-support.patch | 57 -------------------
 ...t-lseek-when-_FILE_OFFSET_BITS-is-64.patch | 37 ------------
 ...-missing-check-for-permission-denied.patch |  4 +-
 .../e2fsprogs/e2fsprogs/extents.patch         | 56 ------------------
 .../e2fsprogs/e2fsprogs/quiet-debugfs.patch   |  6 +-
 ...2fsprogs_1.46.5.bb => e2fsprogs_1.47.0.bb} |  5 +-
 6 files changed, 6 insertions(+), 159 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-Add-option-to-enable-disable-largefile-support.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-ext2fs-Use-64bit-lseek-when-_FILE_OFFSET_BITS-is-64.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/extents.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.46.5.bb => e2fsprogs_1.47.0.bb} (95%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-Add-option-to-enable-disable-largefile-support.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-Add-option-to-enable-disable-largefile-support.patch
deleted file mode 100644
index a770d0cf89..0000000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-Add-option-to-enable-disable-largefile-support.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 6fab3346d448298a24cee1faeb5fc8507a3b9712 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 10 Nov 2022 20:34:54 -0800
-Subject: [PATCH] Add option to enable/disable largefile support
-
-fallocate can be used to have 64bit off_t provided its compiled with
-_FILE_OFFSET_BITS=64 which will be added automatically when
---enable-largefile is used.
-
-Upstream-Status: Submitted [https://github.com/tytso/e2fsprogs/pull/129]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac    | 3 +++
- misc/e4defrag.c | 6 +-----
- 2 files changed, 4 insertions(+), 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index dff3d1ca..ec1c5b64 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1800,6 +1800,9 @@ OS_IO_FILE=""
-   ;;
- esac]
- AC_SUBST(OS_IO_FILE)
-+
-+AC_SYS_LARGEFILE
-+
- dnl
- dnl Make our output files, being sure that we create the some miscellaneous 
- dnl directories
-diff --git a/misc/e4defrag.c b/misc/e4defrag.c
-index 86e97ee3..e7175c37 100644
---- a/misc/e4defrag.c
-+++ b/misc/e4defrag.c
-@@ -195,10 +195,6 @@ static struct frag_statistic_ino	frag_rank[SHOW_FRAG_FILES];
- #error posix_fadvise not available!
- #endif
- 
--#ifndef HAVE_FALLOCATE64
--#error fallocate64 not available!
--#endif /* ! HAVE_FALLOCATE64 */
--
- /*
-  * get_mount_point() -	Get device's mount point.
-  *
-@@ -1568,7 +1564,7 @@ static int file_defrag(const char *file, const struct stat64 *buf,
- 	/* Allocate space for donor inode */
- 	orig_group_tmp = orig_group_head;
- 	do {
--		ret = fallocate64(donor_fd, 0,
-+		ret = fallocate(donor_fd, 0,
- 		  (ext2_loff_t)orig_group_tmp->start->data.logical * block_size,
- 		  (ext2_loff_t)orig_group_tmp->len * block_size);
- 		if (ret < 0) {
--- 
-2.38.1
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-ext2fs-Use-64bit-lseek-when-_FILE_OFFSET_BITS-is-64.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-ext2fs-Use-64bit-lseek-when-_FILE_OFFSET_BITS-is-64.patch
deleted file mode 100644
index 20ed6ecb3b..0000000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-ext2fs-Use-64bit-lseek-when-_FILE_OFFSET_BITS-is-64.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 1a8aaa8ff7f4aca68b5ae964458e49ab16b4315f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 14 Dec 2022 20:56:44 -0800
-Subject: [PATCH] ext2fs: Use 64bit lseek when _FILE_OFFSET_BITS is 64
-
-Use lseek() with 64bit off_t when _FILE_OFFSET_BITS is 64
-this fixes build with musl where there is no _llseek but lseek
-is using off_t which is 64bit on musl
-
-Upstream-Status: Submitted [https://github.com/tytso/e2fsprogs/pull/129]
-Signe-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/ext2fs/llseek.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/ext2fs/llseek.c b/lib/ext2fs/llseek.c
-index 922a0d56..45f21d09 100644
---- a/lib/ext2fs/llseek.c
-+++ b/lib/ext2fs/llseek.c
-@@ -51,7 +51,7 @@ extern long long llseek (int fd, long long offset, int origin);
- 
- #else	/* ! HAVE_LLSEEK */
- 
--#if SIZEOF_LONG == SIZEOF_LONG_LONG
-+#if SIZEOF_LONG == SIZEOF_LONG_LONG || _FILE_OFFSET_BITS+0 == 64
- 
- #define my_llseek lseek
- 
-@@ -69,7 +69,7 @@ static int _llseek (unsigned int, unsigned long,
- 
- static _syscall5(int,_llseek,unsigned int,fd,unsigned long,offset_high,
- 		 unsigned long, offset_low,ext2_loff_t *,result,
--		 unsigned int, origin)
-+		 unsigned int, origin);
- #endif
- 
- static ext2_loff_t my_llseek (int fd, ext2_loff_t offset, int origin)
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
index 92bd0d0c1f..b038e61eb7 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
@@ -1,4 +1,4 @@
-From cce489c96aa3f4272a19d2137c2a46b439636712 Mon Sep 17 00:00:00 2001
+From 5bc75654690a2d916190168b865770a7c93e65dd Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Wed, 10 Aug 2016 11:19:44 +0800
 Subject: [PATCH] Fix missing check for permission denied.
@@ -19,7 +19,7 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/lib/support/profile.c b/lib/support/profile.c
-index f54739e7..53ea68f1 100644
+index bdb14b17..1bd62406 100644
 --- a/lib/support/profile.c
 +++ b/lib/support/profile.c
 @@ -335,7 +335,7 @@ profile_init(const char * const *files, profile_t *ret_profile)
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/extents.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/extents.patch
deleted file mode 100644
index 2c09bb276d..0000000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/extents.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-CVE: CVE-2022-1304
-Upstream-Status: Backport [ ab51d587bb9b229b1fade1afd02e1574c1ba5c76 ]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 347084c9c1ad20f47dae16f5a3dcd8628d5fc7b0 Mon Sep 17 00:00:00 2001
-From: Lukas Czerner <lczerner@redhat.com>
-Date: Thu, 21 Apr 2022 19:31:48 +0200
-Subject: [PATCH] e2fsprogs: add sanity check to extent manipulation
-
-It is possible to have a corrupted extent tree in such a way that a leaf
-node contains zero extents in it. Currently if that happens and we try
-to traverse the tree we can end up accessing wrong data, or possibly
-even uninitialized memory. Make sure we don't do that.
-
-Additionally make sure that we have a sane number of bytes passed to
-memmove() in ext2fs_extent_delete().
-
-Note that e2fsck is currently unable to spot and fix such corruption in
-pass1.
-
-Signed-off-by: Lukas Czerner <lczerner@redhat.com>
-Reported-by: Nils Bars <nils_bars@t-online.de>
-Addressess: https://bugzilla.redhat.com/show_bug.cgi?id=2068113
----
- lib/ext2fs/extent.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/lib/ext2fs/extent.c b/lib/ext2fs/extent.c
-index b324c7b0..1a206a16 100644
---- a/lib/ext2fs/extent.c
-+++ b/lib/ext2fs/extent.c
-@@ -495,6 +495,10 @@ retry:
- 			ext2fs_le16_to_cpu(eh->eh_entries);
- 		newpath->max_entries = ext2fs_le16_to_cpu(eh->eh_max);
- 
-+		/* Make sure there is at least one extent present */
-+		if (newpath->left <= 0)
-+			return EXT2_ET_EXTENT_NO_DOWN;
-+
- 		if (path->left > 0) {
- 			ix++;
- 			newpath->end_blk = ext2fs_le32_to_cpu(ix->ei_block);
-@@ -1630,6 +1634,10 @@ errcode_t ext2fs_extent_delete(ext2_extent_handle_t handle, int flags)
- 
- 	cp = path->curr;
- 
-+	/* Sanity check before memmove() */
-+	if (path->left < 0)
-+		return EXT2_ET_EXTENT_LEAF_BAD;
-+
- 	if (path->left) {
- 		memmove(cp, cp + sizeof(struct ext3_extent_idx),
- 			path->left * sizeof(struct ext3_extent_idx));
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
index d695580c92..0a6904208d 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
@@ -1,4 +1,4 @@
-From 20bf59365646af0466c1910e8763b352380b26d6 Mon Sep 17 00:00:00 2001
+From 580ef6cae2d353f3aa5d5c52d6614bdc1df50f08 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 23 Dec 2013 13:38:34 +0000
 Subject: [PATCH] e2fsprogs: silence debugfs
@@ -14,10 +14,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
-index b67a88bc..76dd5556 100644
+index 9b6321dc..8ebf3ddb 100644
 --- a/debugfs/debugfs.c
 +++ b/debugfs/debugfs.c
-@@ -2518,7 +2518,7 @@ static int source_file(const char *cmd_file, int ss_idx)
+@@ -2516,7 +2516,7 @@ static int source_file(const char *cmd_file, int ss_idx)
  		cp = strchr(buf, '\r');
  		if (cp)
  			*cp = 0;
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
similarity index 95%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
index ceceb7edcc..2620610903 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
@@ -4,16 +4,13 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://run-ptest \
            file://ptest.patch \
            file://mkdir_p.patch \
-           file://extents.patch \
-           file://0001-Add-option-to-enable-disable-largefile-support.patch \
-           file://0001-ext2fs-Use-64bit-lseek-when-_FILE_OFFSET_BITS-is-64.patch \
            "
 SRC_URI:append:class-native = " \
            file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
            file://quiet-debugfs.patch \
            "
 
-SRCREV = "02540dedd3ddc52c6ae8aaa8a95ce75c3f8be1c0"
+SRCREV = "f4c9cc4bedacde8408edda3520a32d3842290112"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.30.2



Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0DDBA74F65
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 18:33:02 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id h5-v6so12565099wrm.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 11:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=C9rWdhvpPHIgLOKSZmhUfhZHX1QOYrUm70OJsg6oqU8=;
	b=s2zMy1g4YOMj7IlBJy8PTulXWVrz8ag3vfC5Ufyu8jwUgMztW/5jvkbYPHaerUT/Ky
	rMFhc+bhDKVkgzTnRuN+3oIls6PajwWYJ36OqLjEazCc/eWWjY0arneDgf1rxwzBI3t+
	RIvpG+QRCj+YbuP5h/dpJN4AybXQQAHSXLk7J2ILzBDqoY0EMTGxAViyPhfhVtZatMw8
	s/N8G+oehIcDreNrUr5sI+1kTW56jjRhHqqYPRhm8uE3ZbSpNSzX4eBZbaTEXtlw0AN6
	ZhJ4YFHoEAXEJRQI18Yd6YDm6zDZqe91b05ACxL0gxX2I4Zho45iwovrMXYkr8q9Amxg
	s/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=C9rWdhvpPHIgLOKSZmhUfhZHX1QOYrUm70OJsg6oqU8=;
	b=lqsSSmU/KrKLJeQOX4tTGspOK/tX2IvMrDKq8RUu/7ZUWmSJrdjPVReS/b3fY1f4kK
	AemqjezZrdzYODMzlV8QTne9dZLmrKZ4yTA7nx91mSdJvP1JZ4s9xXae7QH+SbIS3BeU
	0QWtF8QgWmhtJfuLbEQwF95Ci4OJ+uxTLxES9AdoHqD8Kl82OwbBsZZ61j1QNiqfs5Wm
	fQRP7NP9AAZ8zlQjBn74F+krmN0KveAFZSvO6NzG5A8FXPxnOZD/QqH5oi7C87nFURcx
	56CmN6DMfvtqBQVf4cKtV/CVWqcyLBXUH3UkNjw9GM/DLtwMoGY8GScuEpQ+WtCSZIuo
	I2NQ==
X-Gm-Message-State: ALQs6tDsKe16c/d70pwCSJ+OTQQ+5VNm9ceDfqvrkQnZ5ql7dhfivLnS
	tiZbUH77EuEuH14/cThUynfi9g==
X-Google-Smtp-Source: AB8JxZpYfd1479diBaPUU7iikphHimb9m/WcC5chd9nIvGTEARZ4UBpc6RQ6B9YMMuqhZ41EP6d23Q==
X-Received: by 2002:adf:b11a:: with SMTP id
	l26-v6mr25490558wra.258.1525890783447; 
	Wed, 09 May 2018 11:33:03 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b10-v6sm58132606wrn.42.2018.05.09.11.33.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 May 2018 11:33:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2018 18:33:09 +0000
Message-Id: <20180509183309.17851-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [PATCH] grub2: fix build with gcc8
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
X-List-Received-Date: Wed, 09 May 2018 18:33:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-bsp/grub/files/gcc8.patch | 74 ++++++++++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc        |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/gcc8.patch

diff --git a/meta/recipes-bsp/grub/files/gcc8.patch b/meta/recipes-bsp/grub/files/gcc8.patch
new file mode 100644
index 0000000000..fa7331f1b3
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/gcc8.patch
@@ -0,0 +1,74 @@
+From 563b1da6e6ae7af46cc8354cadb5dab416989f0a Mon Sep 17 00:00:00 2001
+From: Michael Chang <mchang@suse.com>
+Date: Mon, 26 Mar 2018 16:52:34 +0800
+Subject: Fix packed-not-aligned error on GCC 8
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When building with GCC 8, there are several errors regarding packed-not-aligned.
+
+./include/grub/gpt_partition.h:79:1: error: alignment 1 of ‘struct grub_gpt_partentry’ is less than 8 [-Werror=packed-not-aligned]
+
+This patch fixes the build error by cleaning up the ambiguity of placing
+aligned structure in a packed one. In "struct grub_btrfs_time" and "struct
+grub_gpt_part_type", the aligned attribute seems to be superfluous, and also
+has to be packed, to ensure the structure is bit-to-bit mapped to the format
+laid on disk. I think we could blame to copy and paste error here for the
+mistake. In "struct efi_variable", we have to use grub_efi_packed_guid_t, as
+the name suggests. :)
+
+Signed-off-by: Michael Chang <mchang@suse.com>
+Tested-by: Michael Chang <mchang@suse.com>
+Tested-by: Paul Menzel <paulepanter@users.sourceforge.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport http://git.savannah.gnu.org/cgit/grub.git/commit/?id=563b1da6e6ae7af46cc8354cadb5dab416989f0a
+---
+ grub-core/fs/btrfs.c          | 2 +-
+ include/grub/efiemu/runtime.h | 2 +-
+ include/grub/gpt_partition.h  | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/grub-core/fs/btrfs.c b/grub-core/fs/btrfs.c
+index 4849c1c..be19544 100644
+--- a/grub-core/fs/btrfs.c
++++ b/grub-core/fs/btrfs.c
+@@ -175,7 +175,7 @@ struct grub_btrfs_time
+ {
+   grub_int64_t sec;
+   grub_uint32_t nanosec;
+-} __attribute__ ((aligned (4)));
++} GRUB_PACKED;
+ 
+ struct grub_btrfs_inode
+ {
+diff --git a/include/grub/efiemu/runtime.h b/include/grub/efiemu/runtime.h
+index 9b6b729..36d2ded 100644
+--- a/include/grub/efiemu/runtime.h
++++ b/include/grub/efiemu/runtime.h
+@@ -29,7 +29,7 @@ struct grub_efiemu_ptv_rel
+ 
+ struct efi_variable
+ {
+-  grub_efi_guid_t guid;
++  grub_efi_packed_guid_t guid;
+   grub_uint32_t namelen;
+   grub_uint32_t size;
+   grub_efi_uint32_t attributes;
+diff --git a/include/grub/gpt_partition.h b/include/grub/gpt_partition.h
+index 1b32f67..9668a68 100644
+--- a/include/grub/gpt_partition.h
++++ b/include/grub/gpt_partition.h
+@@ -28,7 +28,7 @@ struct grub_gpt_part_type
+   grub_uint16_t data2;
+   grub_uint16_t data3;
+   grub_uint8_t data4[8];
+-} __attribute__ ((aligned(8)));
++} GRUB_PACKED;
+ typedef struct grub_gpt_part_type grub_gpt_part_type_t;
+ 
+ #define GRUB_GPT_PARTITION_TYPE_EMPTY \
+-- 
+cgit v1.0-41-gc330
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 2ea31f6420..a8f335e1f8 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -18,6 +18,7 @@ SRC_URI = "https://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://grub-module-explicitly-keeps-symbole-.module_license.patch \
            file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
 	   file://fix.build.with.gcc-7.patch \
+           file://gcc8.patch \
 "
 SRC_URI[md5sum] = "1116d1f60c840e6dbd67abbc99acb45d"
 SRC_URI[sha256sum] = "660ee136fbcee08858516ed4de2ad87068bfe1b6b8b37896ce3529ff054a726d"
-- 
2.17.0



Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0E2CF79261
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 06:09:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7G69G5w008123
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 23:09:16 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Wed, 15 Aug 2018 23:09:14 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Aug 2018 14:19:47 +0800
Message-ID: <23d58f9f27c7b25605e3f58810138df6599a6e13.1534400247.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1534400247.git.liezhi.yang@windriver.com>
References: <cover.1534400247.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] elfutils: check data_list.data.d.d_buf before free it
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
X-List-Received-Date: Thu, 16 Aug 2018 06:09:15 -0000
Content-Type: text/plain

[YOCTO #12791]

The one which actually saves the data is data_list.data.d.d_buf, so check it
before free rawdata_base.

This can fix a segmentation fault when prelink libqb_1.0.3:
prelink: /usr/lib/libqb.so.0.18.2: Symbol section index outside of section numbers

The segmentation fault happens when prelink call elf_end().

Fixed:
MACHINE="qemux86-64"
IMAGE_INSTALL_append = " libqb" #libqp is from meta-openembedded
$ bitbake core-image-minimal
Segmention fault

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.172.bb   |  1 +
 ...end.c-check-data_list.data.d.d_buf-before.patch | 39 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.172.bb b/meta/recipes-devtools/elfutils/elfutils_0.172.bb
index 9d02211..1cdff40 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.172.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.172.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0006-Fix-build-on-aarch64-musl.patch \
            file://0007-Fix-control-path-where-we-have-str-as-uninitialized-.patch \
            file://0001-libasm-may-link-with-libbz2-if-found.patch \
+           file://0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch \
            file://debian/0001-hppa_backend.patch \
            file://debian/0001-arm_backend.patch \
            file://debian/0001-mips_backend.patch \
diff --git a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
new file mode 100644
index 0000000..7ea038f
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
@@ -0,0 +1,39 @@
+From d68822e93c57c3fbb77b93eada5986d2240157c2 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 16 Aug 2018 09:58:26 +0800
+Subject: [PATCH] libelf/elf_end.c: check data_list.data.d.d_buf before free it
+
+The one which actually saves the data is data_list.data.d.d_buf, so check it
+before free rawdata_base.
+
+This can fix a segmentation fault when prelink libqb_1.0.3:
+prelink: /usr/lib/libqb.so.0.18.2: Symbol section index outside of section numbers
+
+The segmentation fault happens when prelink call elf_end().
+
+Upstream-Status: Submitted
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ libelf/elf_end.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libelf/elf_end.c b/libelf/elf_end.c
+index 160f0b8..5388e80 100644
+--- a/libelf/elf_end.c
++++ b/libelf/elf_end.c
+@@ -165,9 +165,10 @@ elf_end (Elf *elf)
+ 
+ 		/* The section data is allocated if we couldn't mmap
+ 		   the file.  Or if we had to decompress.  */
+-		if (elf->map_address == NULL
++		if ((elf->map_address == NULL
+ 		    || scn->rawdata_base == scn->zdata_base
+ 		    || (scn->flags & ELF_F_MALLOCED) != 0)
++		    && (scn->data_list.data.d.d_buf != NULL))
+ 		  free (scn->rawdata_base);
+ 
+ 		/* Free the list of data buffers for the section.
+-- 
+2.7.4
+
-- 
2.7.4



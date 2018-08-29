Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C1A1E791B6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 10:00:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7TA0uvY025735
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 03:00:56 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 29 Aug 2018 03:00:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Aug 2018 18:11:40 +0800
Message-ID: <681ff67e3520f1eba4097f23521e2cac464939e0.1535537452.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1535537452.git.liezhi.yang@windriver.com>
References: <cover.1535537452.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] elfutils: Fix prelink libqb error on mips and mips64
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
X-List-Received-Date: Wed, 29 Aug 2018 10:00:56 -0000
Content-Type: text/plain

The previous patch
0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
fixed segmentation fault error on other arches except mips and mips64, now
update it to fix mips and mips64 too, also submitted to upstream.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...lf_end.c-check-data_list.data.d.d_buf-before.patch | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
index 8b03c0e..1bdb511 100644
--- a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
@@ -1,4 +1,4 @@
-From d68822e93c57c3fbb77b93eada5986d2240157c2 Mon Sep 17 00:00:00 2001
+From 3393a2e544818f0bd1887c13f28a76ad60c2df98 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Thu, 16 Aug 2018 09:58:26 +0800
 Subject: [PATCH] libelf/elf_end.c: check data_list.data.d.d_buf before free it
@@ -11,18 +11,25 @@ prelink: /usr/lib/libqb.so.0.18.2: Symbol section index outside of section numbe
 
 The segmentation fault happens when prelink call elf_end().
 
-Upstream-Status: Submitted [https://sourceware.org/ml/elfutils-devel/2018-q3/msg00065.html]
+Upstream-Status: Submitted [https://sourceware.org/ml/elfutils-devel/2018-q3/msg00085.html]
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
- libelf/elf_end.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
+ libelf/elf_end.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/libelf/elf_end.c b/libelf/elf_end.c
-index 160f0b8..5388e80 100644
+index 160f0b8..5280a70 100644
 --- a/libelf/elf_end.c
 +++ b/libelf/elf_end.c
-@@ -165,9 +165,10 @@ elf_end (Elf *elf)
+@@ -160,14 +160,16 @@ elf_end (Elf *elf)
+ 		   architecture doesn't require overly stringent
+ 		   alignment the raw data buffer is the same as the
+ 		   one used for presenting to the caller.  */
+-		if (scn->data_base != scn->rawdata_base)
++		if ((scn->data_base != scn->rawdata_base)
++		    && (scn->data_list.data.d.d_buf != NULL))
+ 		  free (scn->data_base);
  
  		/* The section data is allocated if we couldn't mmap
  		   the file.  Or if we had to decompress.  */
-- 
2.7.4



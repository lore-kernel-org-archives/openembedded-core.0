Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 029E8770FA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2016 01:44:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7K1iwkK013977
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 18:44:58 -0700
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 19 Aug 2016 18:44:58 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Aug 2016 20:44:54 -0500
Message-ID: <61d6d16460deaa1e30f2cdfef80e5744e53a6290.1471657381.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1471657381.git.mark.hatle@windriver.com>
References: <cover.1471657381.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] glibc: Fix scope resolution in glibc to be breadth first.
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
X-List-Received-Date: Sat, 20 Aug 2016 01:44:59 -0000
Content-Type: text/plain

The ELF specification indicates symbol resolution should be breadth first, not
depth first.

The dl-deps.c: dl_build_locale_scope function is processing in a depth first
mode.  This is causes certain symbols to be incorrectly reported when
LD_TRACE_PRELINKING=1 is enabled.

See glibc BZ #20488 for more information.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../glibc/glibc/0026-build_local_scope.patch       | 56 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.24.bb              |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-build_local_scope.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-build_local_scope.patch b/meta/recipes-core/glibc/glibc/0026-build_local_scope.patch
new file mode 100644
index 0000000..435a8c8
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-build_local_scope.patch
@@ -0,0 +1,56 @@
+From 6e4ec5a3c5fe63b6458036f18d43124de4a7e724 Mon Sep 17 00:00:00 2001
+From: Mark Hatle <mark.hatle@windriver.com>
+Date: Thu, 18 Aug 2016 14:07:58 -0500
+Subject: [PATCH] elf/dl-deps.c: Make _dl_build_local_scope breadth first
+
+According to the ELF specification:
+
+When resolving symbolic references, the dynamic linker examines the symbol
+tables with a breadth-first search.
+
+This function was using a depth first search.  By doing so the conflict
+resolution reported to the prelinker (when LD_TRACE_PRELINKING=1 is set)
+was incorrect.  This caused problems when their were various circular
+dependencies between libraries.  The problem usually manifested itself by
+the wrong IFUNC being executed.
+
+[BZ# 20488]
+
+Upstream-Status: Pending
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+---
+ elf/dl-deps.c | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/elf/dl-deps.c b/elf/dl-deps.c
+index 6a82987..fc37c87 100644
+--- a/elf/dl-deps.c
++++ b/elf/dl-deps.c
+@@ -73,13 +73,19 @@ _dl_build_local_scope (struct link_map **list, struct link_map *map)
+ {
+   struct link_map **p = list;
+   struct link_map **q;
++  struct link_map **r;
+ 
+   *p++ = map;
+   map->l_reserved = 1;
+-  if (map->l_initfini)
+-    for (q = map->l_initfini + 1; *q; ++q)
+-      if (! (*q)->l_reserved)
+-	p += _dl_build_local_scope (p, *q);
++
++  for (r = list; r < p; ++r)
++    if ((*r)->l_initfini)
++      for (q = (*r)->l_initfini + 1; *q; ++q)
++	if (! (*q)->l_reserved)
++	  {
++	    *p++ = *q;
++	    (*q)->l_reserved = 1;
++	  }
+   return p - list;
+ }
+ 
+-- 
+2.5.5
+
diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
index e446e7a..a3ac738 100644
--- a/meta/recipes-core/glibc/glibc_2.24.bb
+++ b/meta/recipes-core/glibc/glibc_2.24.bb
@@ -36,6 +36,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0023-eglibc-Install-PIC-archives.patch \
            file://0024-eglibc-Forward-port-cross-locale-generation-support.patch \
            file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
+           file://0026-build_local_scope.patch \
 "
 
 SRC_URI += "\
-- 
2.5.5



Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62287C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 04:18:00 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.7345.1639369051545710943
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 20:17:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=NL6BrFQ6;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639369079; x=1670905079;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=S8PEJLzGZbZ6DPTj+w7QqXoQcTOtZ8XrBwtWH99D/Ro=;
  b=NL6BrFQ6CW2/7zFTPRnOJhy0aR7k66MtFx1rULOj/Ufc2lWhqcOxsnF7
   TuJ2kjjfmhPy6VlHHYClBgxTGKJG5J/8IBwWHpa/1Hb8eeMUJLieGrbKu
   u16E4XTCDp/SSiubTnLFFM4zbL37G3u9D62xtnj7+EW3H6KeTv4rz5X7Z
   GdxmeIFQCH8TsM/uWPzG3uNzQIdpiJVQqc/n26VFp286muIMwz6iNas7H
   XwcsRTw5nhOVsbSw5mL08dRO1nSbke1AQI7fQybeX60ygoD+Le6cOiXzx
   4xwk1aqz8CHQVTfW6+GQBeUg3VO5C5/NZ1nLxV5/JLNlWzeyKgrLdqAYY
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="238602271"
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="238602271"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:59 -0800
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="517589344"
Received: from echan1-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.132.97])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:58 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 19/20] patchelf: fix PT_PHDR program header
 corruption
Date: Mon, 13 Dec 2021 12:17:18 +0800
Message-Id: 
 <a980aa5696a98c5b97f9a117df4c82ea525f6e4f.1639365111.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639365111.git.anuj.mittal@intel.com>
References: <cover.1639365111.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 04:18:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159609

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch and tweak it to fix PT_PHDR program header corruption.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../patchelf/0001-merge-from-PR243.patch      | 47 +++++++++++++++++++
 .../patchelf/patchelf_0.12.bb                 |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/patchelf/patchelf/0001-merge-from-PR243.patch

diff --git a/meta/recipes-devtools/patchelf/patchelf/0001-merge-from-PR243.patch b/meta/recipes-devtools/patchelf/patchelf/0001-merge-from-PR243.patch
new file mode 100644
index 0000000000..a5322f0375
--- /dev/null
+++ b/meta/recipes-devtools/patchelf/patchelf/0001-merge-from-PR243.patch
@@ -0,0 +1,47 @@
+From 6ac5c1350834b9da81ab90ab5ba4e5bf507c6c0d Mon Sep 17 00:00:00 2001
+From: Satadru Pramanik <satadru@gmail.com>
+Date: Thu, 20 May 2021 16:52:21 -0400
+Subject: [PATCH] merge from PR243
+
+Upstream-Status: Backport
+
+Reference to upstream patch:
+https://github.com/NixOS/patchelf/commit/4efbce410d00c8cb43f134181d07b364bcf78022
+
+[OP: tweak patch to apply to patchelf v0.10]
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+[OP: tweak patch to apply to patchelf v0.12]
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/patchelf.cc | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/patchelf.cc b/src/patchelf.cc
+index 1854cfa..73a3a86 100644
+--- a/src/patchelf.cc
++++ b/src/patchelf.cc
+@@ -774,12 +774,15 @@ void ElfFile<ElfFileParamNames>::rewriteSectionsLibrary()
+        PT_LOAD segment located directly after the last virtual address
+        page of other segments. */
+     Elf_Addr startPage = 0;
++    Elf_Addr firstPage = 0;
+     for (unsigned int i = 0; i < phdrs.size(); ++i) {
+         Elf_Addr thisPage = roundUp(rdi(phdrs[i].p_vaddr) + rdi(phdrs[i].p_memsz), getPageSize());
+         if (thisPage > startPage) startPage = thisPage;
++        if (rdi(phdrs[i].p_type) == PT_PHDR) firstPage = rdi(phdrs[i].p_vaddr) - rdi(phdrs[i].p_offset);
+     }
+ 
+     debug("last page is 0x%llx\n", (unsigned long long) startPage);
++    debug("first page is 0x%llx\n", (unsigned long long) firstPage);
+ 
+     /* When normalizing note segments we will in the worst case be adding
+        1 program header for each SHT_NOTE section. */
+@@ -852,7 +855,7 @@ void ElfFile<ElfFileParamNames>::rewriteSectionsLibrary()
+     assert(curOff == startOffset + neededSpace);
+ 
+     /* Write out the updated program and section headers */
+-    rewriteHeaders(hdr->e_phoff);
++    rewriteHeaders(firstPage + hdr->e_phoff);
+ }
+ 
+ 
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.12.bb b/meta/recipes-devtools/patchelf/patchelf_0.12.bb
index 390a8110da..007435a719 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.12.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.12.bb
@@ -8,6 +8,7 @@ SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master \
            file://handle-read-only-files.patch \
            file://6edec83653ce1b5fc201ff6db93b966394766814.patch \
            file://alignmentfix.patch \
+           file://0001-merge-from-PR243.patch \
            "
 SRCREV = "8d3a16e97294e3c5521c61b4c8835499c9918264"
 
-- 
2.33.1



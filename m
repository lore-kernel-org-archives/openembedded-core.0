Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A60FCA5FED
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 20:44:18 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5165.1791319454735343759
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 13:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dw1L0gRN;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c45111bebso794435f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 13:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791319453; x=1791924253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aHtDJI288n0Hdx6XHTei6JPoGcaa1Vkz9RTqqFkTDYw=;
        b=dw1L0gRNnDfaxqVH8wOXbhVd2rYmitUIkwjAo5wAUiDQyN4pVrDTODXSlF3UboXz/1
         aYoPuLqQ0n+5wuEhBBMoDptHH2Y3V3IfpEq9wMNAIU/j/RSl81X+aH1Obq/fNsNAz7S1
         Hn5zVAbb3RoBFLzIvLodQF5wFvHqqvxoKc29A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791319453; x=1791924253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aHtDJI288n0Hdx6XHTei6JPoGcaa1Vkz9RTqqFkTDYw=;
        b=ZWuPvlMoni3rh1lnm3vrYHzS2j2yjKGPIH6vruTEzxdVNPML+CTXMyVRDFt5wJdnAA
         aXqZYfKkAfB+auz9Rv7Y1+0BkRoTjOe+F25tm089IOJhBk6RvCKE71qblUbungAtWRfC
         e28WyEjyYJIrl+kZRjkMHxpMPeZNQSW2zdk6dvkrQY1RG/kofwQZ38VekpCG0fwb5b8E
         /BrOM1eCPBNoB3I3npwOLjo2tjp2HrS0RsgsJh6DWNnLB/rHwaXRLxTGX3IeGUSA3vLQ
         4zjsboltlPANAOV3VAOAqKjWrd/9bCuaY7ms3sc8vVTgmce1JW43T4Nnv4YUaZqrEjIE
         3USA==
X-Gm-Message-State: AFq9FYJYkxupKMl86yxbGpQNSccieGjXdM1p4s7r09cdg8LEH3wqvLc3
	2K+bTh/Guv72KLph+uFzLFGswwzq9y5tEhiZnq/tQlirn0ptBxuBV/fo5fwE5NoBNL21W52x0Q+
	T+YbiAOA=
X-Gm-Gg: AYBFou2zxzbupxs5eKUnxVmTp+9dtR1t7ZVaOpLfNMSbGPm46ruqjW/uIoklohZnrcb
	80l5ws6XwqMv0r0A0mv7XXUi/+ZShF3PSKybg/ccck0aE2HKsg5qZNgW9V4XuVRvraBT+ZBcfvs
	nMkzHestmQ+Ic6DV6kF/tno5xOxrKrbPJjx9afAvc9HkoU/eZn9J/6geVm1SRzGIuvg67qZsklW
	B0vczhB3J//P9FHG6wQpk0yc0XqAmT38miNhIG5IQ/ZoVvXNNIuKkJ9mJ50xWyAzzOGduFScdFT
	LdD/09GX4c2pvSGc8eeaAV2K+LduMf4ypRFTbspN4IR5Uo/i2gHyXpmLHwr0qSw9ysI81KutgK/
	wmIqMJlFgNWbDW4ZGJTqM2bO5qdp+HQwCE6QlqPuRrMZCie/GVVcy1CnAKurmCJR959DezcvZKX
	Zz0+n4Z+1j9kce5I78HXb1To9Jv2MhHCxzhFMD1RTHkcdJNEOlLLdFJxJI0M7DiHipWlfGzjAmx
	lNi8t4YHuS0gRIJGKguJSQNMyNPI4nPEISZofwFpYTT+m/gidK1JGh0wVxRO3asSpc=
X-Received: by 2002:a05:6000:178f:b0:486:f4ae:72a2 with SMTP id ffacd0b85a97d-48c726fcd1dmr866270f8f.1.1791319452554;
        Tue, 06 Oct 2026 13:44:12 -0700 (PDT)
Received: from FRSMI25-LASER (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c7273b5e0sm997338f8f.14.2026.10.06.13.44.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:44:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail v2 03/18] elfutils: fix handling of DWARF5 compilation units
Date: Tue,  6 Oct 2026 22:43:38 +0200
Message-ID: <56d4dfb8b8e02d50006a35b4d93a0a2cc5c9dbb3.1791318909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791318909.git.yoann.congal@smile.fr>
References: <cover.1791318909.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 20:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247340

From: Ross Burton <ross.burton@arm.com>

If a source file doesn't contain any functions or variable  then it
won't appear in the source file list for the generated object if the
debug information is DWARF5.  Details of why this is are in the patch
header.

Backport a patch from upstream to fix this oversight, adding files to
the -src packages that were previously missing.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8bdc2869a1a9307ee4ad9cc1d662c2fc1ddd9d2c)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../elfutils/elfutils_0.196.bb                |  1 +
 .../elfutils/files/srcfiles.patch             | 65 +++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/srcfiles.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.196.bb b/meta/recipes-devtools/elfutils/elfutils_0.196.bb
index c2466134cdc..4541000840b 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.196.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.196.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
            file://0001-config-eu.am-do-not-force-Werror.patch \
            file://0001-backends-use-sys-uio.h-instead-of-linux-uio.h-for-s.patch \
+           file://srcfiles.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/srcfiles.patch b/meta/recipes-devtools/elfutils/files/srcfiles.patch
new file mode 100644
index 00000000000..abd0226b0fd
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/srcfiles.patch
@@ -0,0 +1,65 @@
+From: Mark Wielaard <mark@klomp.org>
+To: elfutils-devel@sourceware.org
+Cc: ross@burtonini.com, Mark Wielaard <mark@klomp.org>
+Subject: [PATCH] srcfiles: Always process the "zero" file table entry (CU comp_dir/name)
+Date: Tue, 22 Sep 2026 13:46:06 +0200
+Message-ID: <20260922114606.2865660-1-mark@klomp.org>
+X-Mailer: git-send-email 2.55.0
+MIME-Version: 1.0
+Content-Transfer-Encoding: 8bit
+X-Spam-Flag: NO
+X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00 autolearn=ham autolearn_force=no version=3.4.0
+X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on gnu.wildebeest.org
+
+If the main CU file doesn't contain any references to the file table
+it wouldn't show up in the src files list (except if --cu-only was
+given). This is because file entry "zero" is special. It cannot be
+referred to by DW_AT file attributes (because zero means, no
+file). But technically it should be equal to (implicitly before
+DWARF5) the DW_AT_name of the main CU DIE (using a zero directory
+entry, equal to DW_AT_comp_dir). collect_sourcefiles skipped this
+implicit zero entry unless --cu-only was given.
+
+Fix this by always handling the zero file table entry. And for
+--cu-only to just exit the loop early, so no other entries are handled
+This is also an optimization, before --cu-only would go through all
+indexes, but always added the CU name. Which worked, because
+duplicates were removed, but was somewhat inefficient.
+
+	   * src/srcfiles.cxx (collect_sourcefiles): Go from index
+	   zero, exit after zero index for CU_only, always handle
+	   index zero specially.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=34666
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+
+Upstream-Status: Backport [7b675cbdb0d1f216938b4b33aea30fd35fb1ae0a]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/srcfiles.cxx | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/srcfiles.cxx b/src/srcfiles.cxx
+index 9bbb6ef10473..e2fc0f128d71 100644
+--- a/src/srcfiles.cxx
++++ b/src/srcfiles.cxx
+@@ -273,10 +273,14 @@ collect_sourcefiles (Dwfl_Module *dwflmod,
+             clog << "skipping cu=" << cuname << " due to empty comp_dir" << endl;
+           continue;
+         }
+-      for (size_t f = 1; f < nfiles; ++f)
++      for (size_t f = 0; f < nfiles; ++f)
+         {
++	  /* For --cu-only we are only interested in the "zero" entry.  */
++	  if (CU_only && f != 0)
++	    break;
++
+           const char *hat;
+-          if (CU_only)
++          if (f == 0)
+           {
+             if (strcmp(cuname, "<unknown>") == 0 || strcmp(cuname, "<artificial>") == 0 )
+               continue;
+-- 
+2.55.0


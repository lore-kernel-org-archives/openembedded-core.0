Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC24C7EE2C
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 15:25:16 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.36182.1683386708154308771
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 May 2023 08:25:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=iNSC/eIG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-64384274895so2096793b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 08:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683386707; x=1685978707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cSFV3+EgRatZMO61DJPCk5NheOOqUVcq9KnTFKLZVM0=;
        b=iNSC/eIGt1Pc/oSBSwqddby/pTd2eg5Yysqh+sq0mBpbiUCbrgCthoCGXABRdkIQgO
         izs0N0HOySJ1DddA1r2hVZJ8j7kjYs756xFzcBLhSHsJ8/RMPG/wvHReFX3GP4koKRb8
         +VPdbg8bJBV/159YaW61MUbukmpgxQfjySXuDW6bdKYitPo4W+n2fHmSL0jKReEKyb61
         L54P7GmrxrU4Z8yrfp6ZiDa4H7sFhNmfd3tXajRN+37hZzOqmyKn29G+516JcswaFUBZ
         l1JGUADpnQ7Ush7XdD0uu7CYGgFlvVsi23LSKYnqPZAI6Don2f/pFhj3nBi+G1lr88sH
         ssNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683386707; x=1685978707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cSFV3+EgRatZMO61DJPCk5NheOOqUVcq9KnTFKLZVM0=;
        b=BOdnmmKUbGSMwconY7tKAO3RqamYyEPqXfBY2gzgtmgBDEKd4JLdR5KqHYIMY8uCf0
         u7VeaYB/+HMMKNkpnXU20tCnseNeCBVs/XByrYxqs0sVM/dzxivKBGO97oLSFZME/cNp
         LwD7SCJ8z1+fjAKtVpUr0Wpt6d2EVsQ/NMc80SvCjKPvxgYvlD+ZnXalMz3dHRppRECK
         buzsMt03udPtfBE37kS+Oskc6Psmc+gPbmFykumGBkosTofEIpxvRM/ZXWae+xstuSnk
         MpiCouO0fjToW8QdrP4v25PIe0T3kZrl3TT1Fx8uYPJq1hl4xNP1YweffU0bILKksGqc
         pMBw==
X-Gm-Message-State: AC+VfDwQ7DVpnUuvlU33TS+N4ErNG2DH3/Ppe8GpZj3/OzhChRWLQ2G4
	j1dw7I6Iv01YlCTxwnr9IM55finjxWmMv1kVxNM=
X-Google-Smtp-Source: ACHHUZ4GqrGhYxgrLKp4oTh8jj1dhPM3ZupnI5FyCDSAuE7VFlDYVaRGdwBY29Vz8xXAyhAn60XvJQ==
X-Received: by 2002:a05:6a00:1303:b0:63b:817f:664 with SMTP id j3-20020a056a00130300b0063b817f0664mr6526318pfu.22.1683386707167;
        Sat, 06 May 2023 08:25:07 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c8-20020a62e808000000b0063b1b84d54csm3296718pfi.213.2023.05.06.08.25.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 08:25:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/15] binutils : Fix CVE-2023-25585
Date: Sat,  6 May 2023 05:24:37 -1000
Message-Id: <033db4876844b17de7673970860eb155d15c56e7.1683386547.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683386547.git.steve@sakoman.com>
References: <cover.1683386547.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 15:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180990

From: Deepthi Hemraj <deepadeepthi98@gmail.com>

Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=65cf035b8dc1df5d8020e0b1449514a3c42933e7]

Signed-off-by: Deepthi Hemraj <deepadeepthi98@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0023-CVE-2023-25585.patch        | 54 +++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0023-CVE-2023-25585.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 69fb8539ba..408b503644 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -53,5 +53,6 @@ SRC_URI = "\
      file://0022-CVE-2023-25584-1.patch \
      file://0022-CVE-2023-25584-2.patch \
      file://0022-CVE-2023-25584-3.patch \
+     file://0023-CVE-2023-25585.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0023-CVE-2023-25585.patch b/meta/recipes-devtools/binutils/binutils/0023-CVE-2023-25585.patch
new file mode 100644
index 0000000000..e31a027b9f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0023-CVE-2023-25585.patch
@@ -0,0 +1,54 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 12 Dec 2022 08:31:08 +0000 (+1030)
+Subject: PR29892, Field file_table of struct module is uninitialized
+X-Git-Tag: gdb-13-branchpoint~86
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=65cf035b8dc1df5d8020e0b1449514a3c42933e7
+
+PR29892, Field file_table of struct module is uninitialized
+
+	PR 29892
+	* vms-alphs.c (new_module): Use bfd_zmalloc to alloc file_table.
+	(parse_module): Rewrite file_table reallocation code and clear.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=65cf035b8dc1df5d8020e0b1449514a3c42933e7]
+
+CVE: CVE-2023-25585
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+---
+
+diff --git a/bfd/vms-alpha.c b/bfd/vms-alpha.c
+index 3b63259cc81..6ee7060b0b2 100644
+--- a/bfd/vms-alpha.c
++++ b/bfd/vms-alpha.c
+@@ -4337,7 +4337,7 @@ new_module (bfd *abfd)
+     = (struct module *) bfd_zalloc (abfd, sizeof (struct module));
+   module->file_table_count = 16; /* Arbitrary.  */
+   module->file_table
+-    = bfd_malloc (module->file_table_count * sizeof (struct fileinfo));
++    = bfd_zmalloc (module->file_table_count * sizeof (struct fileinfo));
+   return module;
+ }
+
+@@ -4520,15 +4520,18 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+		       src_ptr + DST_S_B_SRC_DF_FILENAME,
+		       ptr + rec_length - (src_ptr + DST_S_B_SRC_DF_FILENAME));
+
+-		    while (fileid >= module->file_table_count)
++		    if (fileid >= module->file_table_count)
+		      {
+-			module->file_table_count *= 2;
++			unsigned int old_count = module->file_table_count;
++			module->file_table_count += fileid;
+			module->file_table
+			  = bfd_realloc_or_free (module->file_table,
+						 module->file_table_count
+						 * sizeof (struct fileinfo));
+			if (module->file_table == NULL)
+			  return false;
++			memset (module->file_table + old_count, 0,
++				fileid * sizeof (struct fileinfo));
+		      }
+
+		    module->file_table [fileid].name = filename;
-- 
2.34.1



Return-Path: <yashinde145@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE88C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 12:18:43 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.48654.1671538719408655904
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 04:18:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ra+46i+H;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: yashinde145@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id o12so12203283pjo.4
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 04:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uNTN/4s3NqkOc7jPzym03Jt3A3Uo8/LpbFNaJ7O7dcE=;
        b=Ra+46i+HC6HflqtXcQm3ZeINVSYY1mVL1c05x61mIXK4VWKt7IfyTDrii/lMbIJVNs
         nadq30alPfWt3+3IxQ13om1So2V/0yBzUctdPT9No2cXhxYdNkaotlrltikOA+WAeB9f
         ygoEbESB8lO/hPvgmvyOqhawM9vRWwNZZizSzaoeVaokwtPwU/6ajAhn2UoD+SlrsO5P
         hFfQDdWrcIx6k8pmGTrNKRfB09ZBCLV/lxDhenls3y0j0FxVGmJerngjXyA4JqSDOWbj
         yd348q2To2s4KsGKp7E1DoRgmI9Vtd02L10QsfyuTo6doNfZtHigq6bdiHiCIIlb/sgo
         5KYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uNTN/4s3NqkOc7jPzym03Jt3A3Uo8/LpbFNaJ7O7dcE=;
        b=kaDy26iorlur/DsUNcJ311cK0xnk+fdNVMODsPbntX24Zx3GvOmy/zm2MWTYW0yFKA
         oTwWdYuKyLrvnEOauFreup0bRDQ3NIFTsGnTEQxudlF8sIiF8HYXvUSq90pTuDlJINUz
         ZCX8DYucZ8RGnks+3G6GSJwS72/F49iXHNITq4Px0CSEHTUcd/dnLW9UsCCykeHOTRpC
         BKd/qS0XNFEnFgyzo8LPyvgV79jj9Htd6GB3/YwXLavyRwMKgg3LCUzrvhf49ycGX26r
         2TUxvuz4NKk2PUaKSURSMm9IXaY9UKZeDapm5i4JH5tCYhk0GUzBNPiE+2ksdPgoxghg
         zRJA==
X-Gm-Message-State: AFqh2ko49zCOSSUkI67HZU7BNmWqrF5ThBIHAhP8/cW/Cph8T3sDWzv7
	mBs50XDCASdwfwsYz9W+Fqs71dQ0m55n3A==
X-Google-Smtp-Source: AMrXdXuIam2RWTJr9LuzLFiqym3yxiUgE7WB6ycW9amRwueRjlZWhQ/o58+QlRwYE4VDap4RWMI3iQ==
X-Received: by 2002:a17:90a:4fc3:b0:223:ed85:549 with SMTP id q61-20020a17090a4fc300b00223ed850549mr1541913pjh.45.1671538718697;
        Tue, 20 Dec 2022 04:18:38 -0800 (PST)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id q3-20020a17090a7a8300b0021984d697fbsm88680pjf.20.2022.12.20.04.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 04:18:38 -0800 (PST)
From: Yash Shinde <yashinde145@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	sundeep.kokkonda@gmail.com,
	shivams@gmail.com,
	Yash Shinde <yashinde145@gmail.com>
Subject: [kirkstone] [PATCH] Binutils : Fix CVE-2022-4285
Date: Tue, 20 Dec 2022 17:48:24 +0530
Message-Id: <20221220121824.3299590-1-yashinde145@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 12:18:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174847

Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5c831a3c7f3ca98d6aba1200353311e1a1f84c70]

Signed-off-by: Yash Shinde <yashinde145@gmail.com>
---
 .../binutils/binutils/0019-CVE-2022-4285.patch                 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils/0019-CVE-2022-4285.patch b/meta/recipes-devtools/binutils/binutils/0019-CVE-2022-4285.patch
index 4f8ffce1de..0ad93081f9 100644
--- a/meta/recipes-devtools/binutils/binutils/0019-CVE-2022-4285.patch
+++ b/meta/recipes-devtools/binutils/binutils/0019-CVE-2022-4285.patch
@@ -9,7 +9,10 @@ Subject: [PATCH] Fix an illegal memory access when parsing an ELF file
 	of the section header is zero.
 
 Upstream-Status: Backport
+CVE: CVE-2022-4285
+
 [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5c831a3c7f3ca98d6aba1200353311e1a1f84c70]
+
 ---
  bfd/ChangeLog | 6 ++++++
  bfd/elf.c     | 4 +++-
-- 
2.25.1



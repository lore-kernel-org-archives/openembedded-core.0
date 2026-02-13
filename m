Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A70EF48DF
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 08:10:30 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67228.1770970229764732452
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 00:10:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OUrPH73A;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4376c0bffc1so470079f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 00:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770970228; x=1771575028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nD85uW4QA/K4yBI0wVXq+Z3n+vWHzDWr4C8pDdYf/HI=;
        b=OUrPH73AhZ0yuP/DuDPcdJNsMj4qWc9TPylhxmwWft/w35AiMsopVrOJe2GOtUkvmv
         gLOOv8/JtduCFlNNpW5DXKxMtQcHtIhmkLIZS/wkgkkDWxdNMtUGA0hjTX0jk/YoblB8
         qel6Fk6rCp3Mu3RIkM3fD9sMyPDW3seJWSJZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970228; x=1771575028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nD85uW4QA/K4yBI0wVXq+Z3n+vWHzDWr4C8pDdYf/HI=;
        b=wo592+6fZc+cszTAmq1DAotHspTvPzmq5uj6QMKsCSLdb4VqBSGSGDyL2hS5mvSpan
         lUYBAhyKHzGur4ScFm06K3RktVpshb6qMP1123Al89dYCSlT9flGeWhubulAWZsClGds
         dO/HDpqILF9irpaqMc5AUrC68QkDMLFdRPd5gZ4fAotL7D/W8gqOPTwvQxbLbXE/6sH1
         i+OtxQPlYM1ACvMyaJv/KLFJl4F7z3rdMFFUSPi/IGCsobk6DfXRLB7hq7PzxPoC/kVr
         l59vFLOz8dy1mMD66++V1c/pwAnnRo84fUO4tkAorNIP5IlhxoPCqggNrw1Dk7MpDraD
         xTSA==
X-Gm-Message-State: AOJu0YzwQAjPBn8G14q13hacz6FyN1I7tsvNMIrQIpA1WqYN4G7hyg24
	Q3bWKWxhS5HCh07chD7gyAXR154K1jhkSWtrHdspWDemNkEsHTRXpeMUqkFnSznZWOB3+oCp1bo
	uDjAU
X-Gm-Gg: AZuq6aKYq3LJ7b1/XAZAVHQwIVfKYZoqfl7v1fcZ6XbCbA3BLvM5JRK0vbmnCy02RqA
	u5L03ZrNCi+qIcVnah5DU6nB/w4VtRiy3X8QXvsv8CWhlY6zh/M4dkQYu2VVh94dnNEkYmiIpY8
	H4JFr8RGhPMnpAXpcVnfkpUz+XsrmszTnu/Oit7RngapnXg6Y8/GwihjB8ZCZQ1v3vU3O3CQoLP
	wLrgQRG8MS3193vY6/f3h1EdAhf/rMHY4XAY7CBgo8CHiCgqP9vh7SQa+0/m1ArZNNKrBZtRvbH
	lxY2SbPEunFHHBLXsLdQUMbQwjpmPCmKHzsrinrME4UjKfMKPsrIGokjXlf5H3U4tqZ1jgAA4yq
	zGGacS2TyMWrCvzGQG3Y9CFABGjTvElHBxKGM1bM001DMpa48PCVrUjBs4HFthH3gXi0tbpEvQx
	wrWkDYtqYpkH47iMYa0/9jciAy/8NmP6zzdzJauqK0xdCPGgxY+ZqMkPbxfbCLzc+j+kxfb5YUH
	WziSvoILddHalW8NeJQtptisb4=
X-Received: by 2002:a05:6000:220d:b0:432:84f9:8bf9 with SMTP id ffacd0b85a97d-4379792c687mr1679262f8f.57.1770970227833;
        Fri, 13 Feb 2026 00:10:27 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00d6f202ec534aee64.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:d6f2:2ec:534a:ee64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-437969fd36dsm3590815f8f.0.2026.02.13.00.10.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:10:27 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 15/19] vim: ignore CVE-2025-66476
Date: Fri, 13 Feb 2026 09:08:33 +0100
Message-ID: <e66803d93cfb7684510df0dd3c7d0e7d63f937b1.1770968514.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770968514.git.yoann.congal@smile.fr>
References: <cover.1770968514.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 08:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231098

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-66476

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/vim/vim_9.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/vim/vim_9.1.bb b/meta/recipes-support/vim/vim_9.1.bb
index fee9f055e9a..c492342ffb7 100644
--- a/meta/recipes-support/vim/vim_9.1.bb
+++ b/meta/recipes-support/vim/vim_9.1.bb
@@ -21,3 +21,5 @@ ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
 # in many places for _FORTIFY_SOURCE=2.  Security flags become part of CC.
 #
 lcl_maybe_fortify = "${@oe.utils.conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=1',d)}"
+
+CVE_STATUS[CVE-2025-66476] = "not-applicable-platform: Issue only applies on Windows"


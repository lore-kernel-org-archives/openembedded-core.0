Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20BBAC25B7D
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 12:14:41 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.14252.1716552878218746899
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 05:14:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yThMVOJl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6f8ecafd661so739046b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 05:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716552877; x=1717157677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1F/JBzWNYkJtO560N4Ama8VTv2jmvpxRMRBWqXqT3jw=;
        b=yThMVOJlYt5ptYcOtbnFCgx/HvrY000xViYSxQ1cZPqvkAnS8PrpZc5DQ3lGhIGq9O
         oc3NTgrkDosFUOH/U50PYwTuRc54xe6cLe+Ib6HCTbZStrcDeFH/HiV6uJ2oxFxAn4By
         FeOMGJJmEcUzPqANbUdK5sIVdslYCPyQJNe76N1Uo5eFKnVAAhuJ1suhnSyrBGmaS3wx
         4/ZIQ403ayqatKNvDwFT3e+pyLNBv3UAsKIqYfJAMLeEw5eu6/90Y+77fUYksgxlGzuV
         qGTDLjeXHUw/xeAo0qZMiftYHpM9bquTy4XAYeHd+RyMvfgXk9o3Hfr5oRpbq4EnBncQ
         4WZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716552877; x=1717157677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1F/JBzWNYkJtO560N4Ama8VTv2jmvpxRMRBWqXqT3jw=;
        b=fU7FflnVirnyRV5ddr1TdMlrVijvhNMSRrHX7mEXYRo57EPjTpFCt20xL2MUpViM5Y
         57s1IFhPYzcY9nesKUDJevf5gpELMPLFjdQlV2DVM/MYgbiZoX3J7gJCQ4IzLzhO6pxx
         COuGFzmQxkfskjMHozp8Uhu8iMYvf0Tf/soGA2jabuIUc5rZErN+ub6Z7noI3eTFU/20
         Z1l+Q4GTplwiUiSvyw3cq7/SW/6xL+cUlKpu889FXIB+UOdWvHeZLzIYTtdGan9zKGe7
         ovGVyiNM47fLN9x2KqZBGnGV0AZbJ9axgTMnv7pCI3YtUTgxBoseXGahdyAcBslnozJD
         MCDQ==
X-Gm-Message-State: AOJu0Yw69NavVmR8XmjUwCa7B/J207yVmqn/qg5tdoVf7FlVgOPtvZSb
	1Ruldnh2HgVBOLCThH7sMyt9ZoA5CdkawQNDGrgmEu+grTRgnc8q3WUAX8E7yuv1B2Usi1MAPXE
	3
X-Google-Smtp-Source: AGHT+IG34Sco5QpOMoZmLfdMGldZqb9NJpQ9jA6F9glqP34weyPO3SG7sFelg8FaETYiYbfUC3yr4A==
X-Received: by 2002:a05:6a20:1002:b0:1af:9a04:24bf with SMTP id adf61e73a8af0-1b212d461b1mr1963752637.34.1716552877494;
        Fri, 24 May 2024 05:14:37 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9a5388sm12592845ad.220.2024.05.24.05.14.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 05:14:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/8] binutils: Rename CVE-2022-38126 patch to CVE-2022-35205
Date: Fri, 24 May 2024 05:14:19 -0700
Message-Id: <d91af23e4fef0f1999c18fc3a43085b70e98dfd5.1716552687.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716552687.git.steve@sakoman.com>
References: <cover.1716552687.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 12:14:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199845

From: Vijay Anusuri <vanusuri@mvista.com>

CVE-2022-38126 has been marked "REJECT" in the CVE List by NVD.

Reference: https://nvd.nist.gov/vuln/detail/CVE-2022-38126

As commit changes in 0016-CVE-2022-38126.patch fixes CVE-2022-35205.
Hence renamed the patch.

Link: https://ubuntu.com/security/CVE-2022-35205

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/binutils/binutils-2.38.inc               | 2 +-
 .../{0016-CVE-2022-38126.patch => 0016-CVE-2022-35205.patch}   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/binutils/binutils/{0016-CVE-2022-38126.patch => 0016-CVE-2022-35205.patch} (94%)

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index bbe7bb57b2..4a8831b534 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -34,7 +34,7 @@ SRC_URI = "\
      file://0013-Avoid-as-info-race-condition.patch \
      file://0014-CVE-2019-1010204.patch \
      file://0015-CVE-2022-38533.patch \
-     file://0016-CVE-2022-38126.patch \
+     file://0016-CVE-2022-35205.patch \
      file://0017-CVE-2022-38127-1.patch \
      file://0017-CVE-2022-38127-2.patch \
      file://0017-CVE-2022-38127-3.patch \
diff --git a/meta/recipes-devtools/binutils/binutils/0016-CVE-2022-38126.patch b/meta/recipes-devtools/binutils/binutils/0016-CVE-2022-35205.patch
similarity index 94%
rename from meta/recipes-devtools/binutils/binutils/0016-CVE-2022-38126.patch
rename to meta/recipes-devtools/binutils/binutils/0016-CVE-2022-35205.patch
index 8200e28a81..a582df4466 100644
--- a/meta/recipes-devtools/binutils/binutils/0016-CVE-2022-38126.patch
+++ b/meta/recipes-devtools/binutils/binutils/0016-CVE-2022-35205.patch
@@ -9,8 +9,9 @@ Subject: [PATCH] Replace a run-time assertion failure with a warning message
 	message.
 
 Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=e3e5ae049371a27fd1737aba946fe26d06e029b5]
-
+CVE: CVE-2022-35205
 Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
 ---
  binutils/dwarf.c   | 7 ++++++-
 
-- 
2.34.1



Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E69AD33A37
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:46:05 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.28092.1730832357557452627
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:45:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=emBa3dTV;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20cbca51687so55682685ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 10:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730832357; x=1731437157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWO7ZYEc+r7G3zn6w0MLPuWBTjXGJZg8ikfEqJkwqjM=;
        b=emBa3dTVi+fV+zMK3Q2PvxaY/UMIZjvXoHjm9hP1UAhsxHy3gD4GAg58QgP1Ot9MNy
         np2qnVlaNMKK+jkAHNYr7NIUgwStrUlCOSoCG2W7rP0M8+NIvXNvU98sYgYdDfsbocs1
         ZgSSG7mhBGKHxhBZGbEJhxzYFmLAZwtcCaX+wM9HXvbcjcla07L6kQq9SW3qz7HlAsVp
         cpnatjDYnX/LPO+RuHTUwd8QlJvVD110J0HzfpUSTUko65pTNcFY9MLsyIDyGuVCsqyR
         rNF++uX38w8r+nsGv1oJ/gcK368Q3GmS/FqvhG1/mL4BiF3dTHkTstcL7RHd1YP2K7WA
         KACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730832357; x=1731437157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWO7ZYEc+r7G3zn6w0MLPuWBTjXGJZg8ikfEqJkwqjM=;
        b=kPw3wuLvq4WCj07TWxXIXcYRQ/FujFf+Hl597QH+4bBkE0mBztTCadsat6KZVmnsLe
         S14zahHa8FYgfUP8VtQR9vtaESTap7kYpA+N8Vt/a0vtj0Hwlckr9QZGJWrM5nyLFdNu
         bGnPgnkB8VxBIhR8CMUahju5//WEpflS0McvIBp4Osvsk3xOtW/PFJbFIaIPJxWkrGn5
         2RbhkRrOJQp2o4ZqrfheiKd1MaAJEtV1aWIJ6AikNn08GKSlcQ3Q7dmXvRXfgppUhjIe
         2ltZNTL07JjPW7OqqR5zfaCxCQbQ6qUHSOJ9i3E90ewHkHJ6h9+Ioq+pg0VqleCgE3Kc
         VD5g==
X-Gm-Message-State: AOJu0YzhGEL3MKzd1ofaovyyYn+NwcthDtd0mVOEoLzw5iTy6GidqCV/
	XWL+mqd5p/gV4eLMs29rozyf44SrLe5KCvJVb/mFp+wbqNa7od6leo1GsQ==
X-Google-Smtp-Source: AGHT+IFJhM0F1PwCmPtT00/wUu3B4vvFbJexYMxJOt/QpmzUij6GA+DDER8haPsE09bf2sYe/g7sbQ==
X-Received: by 2002:a17:902:c94d:b0:20c:92ce:359d with SMTP id d9443c01a7336-2111af5e6f2mr253410465ad.45.1730832356812;
        Tue, 05 Nov 2024 10:45:56 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ba3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa0ed5esm12526670a91.2.2024.11.05.10.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:45:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 15/19] rpm: Use gcc to compile always
Date: Tue,  5 Nov 2024 10:45:34 -0800
Message-ID: <20241105184540.3450302-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105184540.3450302-1-raj.khem@gmail.com>
References: <20241105184540.3450302-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 18:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206743

openMP is LLVM implementation which is used by clang for openmp runtime
but it ends up with reproducibility bug in clang, until its fixed lets
always use gcc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/rpm/rpm_4.19.1.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb b/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb
index 93303237973..d75106aabea 100644
--- a/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb
@@ -49,6 +49,10 @@ S = "${WORKDIR}/git"
 DEPENDS = "lua libgcrypt file popt xz bzip2 elfutils python3 sqlite3 zstd"
 DEPENDS:append:class-native = " file-replacement-native bzip2-replacement-native"
 
+# clang needs libomp which ends up with buildpaths in binaries debug info
+# see https://github.com/llvm/llvm-project/issues/82541
+TOOLCHAIN = "gcc"
+
 EXTRA_OECMAKE:append = " -D__CURL:FILEPATH=curl"
 EXTRA_OECMAKE:append:libc-musl = " -DENABLE_NLS=OFF -DENABLE_OPENMP=OFF"
 


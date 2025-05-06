Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BFFC3ABAC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 15:03:05 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.78537.1746543780033460520
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 08:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YqlRyBQx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39ee651e419so3060735f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 08:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746543778; x=1747148578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=o1p64Ge44DulospjCtxkRp9HzC4KqCrQZClQaUw26r8=;
        b=YqlRyBQx8Umofv/HATogWrcVxzfNR8fF69g0ONCLjlRpObcqVCFPq+p883kBNDNiYW
         d/B2KYF5O1ZMnvfFvzMlnhVcYj6gXnPnzrVVVFqHEiMCWSlKZSzcq8C0fEmR8LOotIYS
         7jpGMTu+l0jkmlJ2HeffMXHkiSrTpewOiulh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746543778; x=1747148578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o1p64Ge44DulospjCtxkRp9HzC4KqCrQZClQaUw26r8=;
        b=mNeMQK/rVhRe79l640iKE3t7KIU2H6EyPyEF1bnOAgOaqytzgcErnF85gHHr2CTICZ
         IWMDyxL/38aLN8KFq0uH/kIwmGH1YMXo/X6JxOJD/B5JdWwWFnszB9DOrEzqhYZzV1Ug
         EBy/ZhMbjYP/hD9kHen/ysBhCMS+ti0C7wdkfAKMowBfnlmATn+T8mW8w9Fkyi9z3Vi8
         xH3SavvgapjhnKRbwjQCOFdAK4ReCrVp8dpWtDDgwpS0ZPloQWfTbbjFoNyjPKeINYg9
         QeoODtZ2s/SqWNWaLXT3cBQ1aihuYmyYsfdrrnim7T2mPiWo8AuZPI4eT21eJdeGlGdV
         OXvw==
X-Gm-Message-State: AOJu0YylZjXd+PAc8qHuiDmTEIS5frO+nOdmVn8AJznjV8Sw/t4aXPkV
	o4Du1Rlficod3wp93mZsq/KVBX5w6PyYqHNHZWxo1HBuyNqpDzyX80aynsUN5OQV+9V1WqQRpMy
	T
X-Gm-Gg: ASbGncs3bLPJcC9k3Ga1j3CYbYdn4eZfXBgbz1I9lLRSj31oTblo0i6olg1kGFLy0H/
	ob8Vol8rx69XAJcpyjw8Ouh11Vyv/DkW63+489UvxZoi9lGxDSnRqxATiUTxsU+F14oBdzDjdQp
	CXFFv7qIzxFsXgbCdd4/sOTvCIG70HAwsRn5yR2QjMDYcd0CaYu7P9mm5IqyIKYkJf0tkKeEyXX
	BAjCbfcafLtl6TYTEEEOqzvdz1mmLvKZOMbILICAqBujwzFvKgs3W2ikrxwauhoxN0SDUw6UcJn
	ymD0SKWQUZt7TkalFOsvneOKVpSkPidwH7fYv3hM4RMfGyjrN1oKl+fY0FfWrE3oz2Qgeg==
X-Google-Smtp-Source: AGHT+IFVQXnkPnHGkWyeZ5EGG0lS4WEiqIb0WB3JKsGqoHRNy/wkJ0x/yDLk5yTqaj+jRR+4oNpEiw==
X-Received: by 2002:a05:6000:240b:b0:3a0:8020:c5c5 with SMTP id ffacd0b85a97d-3a099aef8e6mr12816469f8f.58.1746543777423;
        Tue, 06 May 2025 08:02:57 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b55a:e190:75e8:e81f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b1726bsm14167743f8f.94.2025.05.06.08.02.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:02:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Upgrade to version 1.9.1
Date: Tue,  6 May 2025 16:02:55 +0100
Message-ID: <20250506150255.290207-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 15:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216056

This brings in:
 * nftw, nftw64: add wrapper
 * ftw, nftw, ftw64, nftw64: add tests
 * Move ftw and ftw64 to calling ntfw and nftw64
 * makewrappers: Introduce 'array' support
 * pseudo_util.c: Avoid warning when we intentionally discard const
 * pseudo_client.c: Fix warning
 * yocto-older-glibc-symbols.path: Add as a reference patch
 * pseudo/pseudo_client: Add wrapper functions to operate correctly with glibc 2.38 onwards
 * configure: Prune PIE flags
 * test/test-parallel-rename.sh: Add parallel rename test
 * test/test-parallel-symlinks.sh: Add parallel symlink test
 * ports/linux/guts: Add .gitignore to ignore generated files

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch | 4 ++--
 meta/recipes-devtools/pseudo/pseudo_git.bb                   | 4 +---
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch b/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
index c453b5f7358..f42b32b8d9e 100644
--- a/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
+++ b/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
@@ -28,10 +28,10 @@ diff --git a/Makefile.in b/Makefile.in
 @@ -120,7 +120,7 @@ $(PSEUDODB): pseudodb.o $(SHOBJS) $(DBOBJS) pseudo_ipc.o | $(BIN)
  libpseudo: $(LIBPSEUDO)
  
- $(LIBPSEUDO): $(WRAPOBJS) pseudo_client.o pseudo_ipc.o $(SHOBJS) | $(LIB)
+ $(LIBPSEUDO): $(WRAPOBJS) pseudo_client.o pseudo_client_scanf.o pseudo_ipc.o $(SHOBJS) | $(LIB)
 -	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -shared -o $(LIBPSEUDO) \
 +	$(CC) $(CFLAGS)  -Lprebuilt/$(shell uname -m)-linux/lib/ $(CFLAGS_PSEUDO) -shared -o $(LIBPSEUDO) \
- 		pseudo_client.o pseudo_ipc.o \
+ 		pseudo_client.o pseudo_client_scanf.o pseudo_ipc.o \
  		$(WRAPOBJS) $(SHOBJS) $(LDFLAGS) $(CLIENT_LDFLAGS)
  
 diff --git a/pseudo_wrappers.c b/pseudo_wrappers.c
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 87c62e06780..5e2a8bf3281 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,8 +1,6 @@
 require pseudo.inc
 
 SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https \
-           file://0001-configure-Prune-PIE-flags.patch \
-           file://glibc238.patch \
            file://fallback-passwd \
            file://fallback-group \
            "
@@ -14,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "28dcefb809ce95db997811b5662f0b893b9923e0"
+SRCREV = "3fac97341f0f8270ca28a91098d0a58ca306a6bd"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git"
 


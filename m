Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16041C41513
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 09:44:26 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.3834.1690796656114806146
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 02:44:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Z3BaUR+H;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4fe2d152f62so2090876e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 02:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690796654; x=1691401454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pZ2WX68aDWAS3Kz6YW/Ssi3m9JbUNikX7H6OcXIGKA=;
        b=Z3BaUR+Hk4Z/xPiZVkAW2Wp0h3QYV8gIWGcz5HoycfHvnlNMxAUja6bqCwv1F1C1CO
         NMKDfTi/AWHxsa/DDD97vawJlvLevNYSwE+8J0cBPcJA1p/hiKgeCkxbGu9PVF44SBGU
         BVSYBWlKKAHjJ1qHuiFT3v8kQPfcXSkP2eS4paq8w89l+PYMmKntvcvyxFpZm2kxUJBo
         lZnshsCKZkR7er0ThXNvmpvG8tCS1qovDYdQ/p1qP9RHAg36O/mXL82HJ+TqE93TyxjN
         8KF6C3ZStMWiJYI6NCP0RMn60idtfhlvm6ic167KNhH2HlCWzSkiuZEB1yG4TOZFvcZ+
         6viw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796654; x=1691401454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pZ2WX68aDWAS3Kz6YW/Ssi3m9JbUNikX7H6OcXIGKA=;
        b=gfhSouWTew4jqxtS40Xhc63FeSk2LC2jX84f+msA/N0rLaBuKbdDRfh8PNBLB93966
         GVgyViZhA8iPEQAIQ+/NfD7h6pWtuMxNosolFuFbvDPn6tnagkTTq9CBey64ubTxuHfW
         I6mGKuK6GCjPH3O8yPIVOWSQCDZXz7U3wL9HNxOuER4AmZlhuKjVEifY1JaUUm0xpWow
         pXN2jhnWoG/mzirc1OxiD5b8Zc6qaeJBKPN1dHPHsjBdGqV7BNKZEfhkzHmnnimJYkMK
         nL98YaQ6HdnoFvND3hAfP1IqDd4Jh5Lx9NqdVXT2u1ReNZTyDVGQtcqKKd3NuFtKi1MJ
         AAHg==
X-Gm-Message-State: ABy/qLZBCqM52ehrZ81mjjEeFGpTBs2k6U6lBtFTCk6w1ZfGWDdRqBbm
	aw+F4YvkrQ5BmlGA/wXLmL9MnVzIXhE=
X-Google-Smtp-Source: APBJJlFyjRbQ+MvgnpFM/OOHOMsuSlVHflA9EYpUi9PgBEKugZv4qM/4/DERE0Syh+JYPVmIdoq50g==
X-Received: by 2002:a05:6512:3e0a:b0:4f8:5ede:d452 with SMTP id i10-20020a0565123e0a00b004f85eded452mr6614640lfv.55.1690796653693;
        Mon, 31 Jul 2023 02:44:13 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:c4e8:ab56:aff:118a])
        by smtp.gmail.com with ESMTPSA id i17-20020a5d55d1000000b003143be36d99sm12526610wrw.58.2023.07.31.02.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:44:13 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com
Subject: [PATCH 1/3] cargo.bbclass: Use --frozen flag for cargo operations
Date: Mon, 31 Jul 2023 11:44:08 +0200
Message-Id: <a567544c5ebcbfebbf1b8cfd5ef387b8154c233e.1690795930.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690795930.git.frederic.martinsons@gmail.com>
References: <cover.1690795930.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 09:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185129

From: Frederic Martinsons <frederic.martinsons@gmail.com>

It supersed the --offline flag and guarantee that Cargo.lock
file will not be modified during the build.

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/classes-recipe/cargo.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index 3ef0bbbb44..8c0b92df8d 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -39,7 +39,12 @@ MANIFEST_PATH ??= "${S}/${CARGO_SRC_DIR}/Cargo.toml"
 
 RUSTFLAGS ??= ""
 BUILD_MODE = "${@['--release', ''][d.getVar('DEBUG_BUILD') == '1']}"
-CARGO_BUILD_FLAGS = "-v --offline --target ${RUST_HOST_SYS} ${BUILD_MODE} --manifest-path=${MANIFEST_PATH}"
+# --frozen flag will prevent network access (which is required since only
+# the do_fetch step is authorized to access network)
+# and will require an up to date Cargo.lock file.
+# This force the package being built to already ship a Cargo.lock, in the end
+# this is what we want, at least, for reproducibility of the build.
+CARGO_BUILD_FLAGS = "-v --frozen --target ${RUST_HOST_SYS} ${BUILD_MODE} --manifest-path=${MANIFEST_PATH}"
 
 # This is based on the content of CARGO_BUILD_FLAGS and generally will need to
 # change if CARGO_BUILD_FLAGS changes.
-- 
2.34.1



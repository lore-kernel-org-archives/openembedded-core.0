Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB175C41513
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 13:16:38 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.14851.1690982190834944540
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 06:16:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=mRjJoIqj;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-314417861b9so5809830f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 06:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690982189; x=1691586989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pZ2WX68aDWAS3Kz6YW/Ssi3m9JbUNikX7H6OcXIGKA=;
        b=mRjJoIqjM8Mpz2ytfRvPRDxoTU7IgNZKpj7ZXAI8SoLtYjQbKNuGxHHsjIYICsLv8z
         zzJ7C59MsTndocSZt18NHRw0J7fIKZcxsQsooSAXbli3aQoPnCx0SbM25834HgQVVcPS
         GJ4rsrcpmpSwPOTcGFL9pgixPpG5Gg10f2tA+96c/Y4M2gNocxRjW/Zh387uzHT/8p7j
         /PFZKHZvwI3PssOE4upSGXVVU3Masjef+oq852BJxSIPQwf0JWa5enqtYz1j0kveVlUw
         WsGP6+nmmP6gkNopGw2T8LGfVQGjoQ7RTl2AmSmxY9jJChILG+sxNjTaaLC38FNjznEK
         OEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690982189; x=1691586989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pZ2WX68aDWAS3Kz6YW/Ssi3m9JbUNikX7H6OcXIGKA=;
        b=MKCLPPZBzSnJnR3fU+X09r4A+uq0Kb27ls/QR4/lh/WQ3DmtAbcsoTirpS94yYPgea
         4NQd77yrRnW3VNDDUx5BPRJEuVtqiFKdWlHurSFEITiYbDctcrxIGUfSgP9zTABblCdk
         jtzfNemXJEGci3WqPwXdxCnrTNubmrPbd6DLsa6Xk13P7r2uBZzr23cQIz9bvtxcNhzZ
         RwMxRL0IphR3eDGksKGZeOb0WF2sVEnM8bpyS8igi7SVavYXP5SJoeQr7PMn1eqeCUUm
         i2m1gYnW3ykzvX0jX71MWG3zynIpxUhlg/MDfpxZGJGwVCK1oQfDOpxnlOzR5w1tvsBD
         emcw==
X-Gm-Message-State: ABy/qLYk2sZG8nF5BAkWsKSY7IjWyEJOTddBX3FwUXZ30nMJSjdEiKJ7
	0GgjlMcZuTlkeIPmtfAL96tdn9tAIuA=
X-Google-Smtp-Source: APBJJlHdQFSlLy9xPX2e7h44Bap+Uq7XC+bMdKjUM9Dff5E94WDswnyXKsir4t98LB9sy0gRZ6Qnaw==
X-Received: by 2002:adf:db44:0:b0:317:9537:d73e with SMTP id f4-20020adfdb44000000b003179537d73emr4780822wrj.35.1690982188758;
        Wed, 02 Aug 2023 06:16:28 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:ab32:1451:bfe8:2a0f])
        by smtp.gmail.com with ESMTPSA id l18-20020adfe9d2000000b003112f836d4esm18951248wrn.85.2023.08.02.06.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 06:16:28 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>
Subject: [PATCH 1/3] cargo.bbclass: Use --frozen flag for cargo operations
Date: Wed,  2 Aug 2023 15:16:03 +0200
Message-Id: <4e731c16b45846bd530953fbdb47026df2e32c59.1690981978.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690981978.git.frederic.martinsons@gmail.com>
References: <cover.1690981978.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 13:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185393

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



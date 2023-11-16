Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B0C4C5B55F
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 22:48:52 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.20276.1700174928770566298
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 14:48:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fQn8tfx9;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9df8d0c2505so265326966b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 14:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700174927; x=1700779727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDXyPdTdGr6dOcf2QYvz1fFYvHXTYFElMcgNna+uRww=;
        b=fQn8tfx9iGXcCtXn4x2FLjQd8mw2hJbrTaMBvYGQxywkzD/FUkstq9J6MBYel4HMxy
         kNCVo6KGerEXlSdJRDOyPFmdo22+Jm9W+G8Ad+Kc/We65TkRH4WNlY5Xmuew+ZBPGlM4
         XfavZaJO4LouNiukONPJEQQIgWfx2Ly8q8FeoLEuNSNgVHKcwT3BTic4LK/61qludqG1
         3xO8Bjn0ZHDdZLy6aCLO4T7hZX+MMeFIyxVeCI0FPGFTnRrAuL17CiRGaRVaWJNnGxvs
         LEheLQ8I2UOM1oWC5gCpvJ39nGpqj/n1mSfVX+Qs+578POH6bzgGwC5pdq/NMc0Tie3m
         XpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700174927; x=1700779727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDXyPdTdGr6dOcf2QYvz1fFYvHXTYFElMcgNna+uRww=;
        b=HIqU9HcffyUJP2xwEC8wBBzZL3TQbGNEet8YBVBiEleRMCUrZJArq5Mdwy7uZgQqQ0
         EbqnpYCptFzB1tyg94vahsoBL4TmYxiOJCX/aqllQXU7kXqslSyYkKxc5oPUkJWpUky7
         4IfmsmVCe/Cf0gnoU2OmUeP/YugNqi7unXOkzaHtpxPpNznnCBS6PJaw9rtPLGl/DTvJ
         +5ZH/Rn9NAE0fYtMuU098006R4Sr6NbUQUIBWMyCtHZyqPgLBCvBzoqgFDyJ7rgF6aid
         RSj+XT3fuVIY2fCBJgfPnyRNYDdiaF62uP1vnQnqz4qpR7VnWyoHrQF65ncNJbRKyR3Q
         HIJw==
X-Gm-Message-State: AOJu0YyHVifbxgE0twwwvnWySzgvIjh4aHEujAnkNhPhVm7Azn+i06oH
	20VcB2gBdaQFaMy2yOQAbW0cs0NEee0=
X-Google-Smtp-Source: AGHT+IFuFVgjRkVs7m48kweBRPJvTzouh3qnliNKZOfj0aVSVRjZ6RzQWa48K2Ff/cO8O1zDS+6URA==
X-Received: by 2002:a17:906:f43:b0:9a1:b528:d0f6 with SMTP id h3-20020a1709060f4300b009a1b528d0f6mr2707718ejj.27.1700174927209;
        Thu, 16 Nov 2023 14:48:47 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id y5-20020a170906524500b009e6cedc8bf5sm129197ejm.29.2023.11.16.14.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 14:48:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCHv2 08/12] rust: drop PE, PR from /usr/src/debug paths
Date: Thu, 16 Nov 2023 23:48:32 +0100
Message-ID: <20231116224836.2696913-8-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231116224836.2696913-1-martin.jansa@gmail.com>
References: <20231116224836.2696913-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 22:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190822

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/classes-recipe/rust-common.bbclass    | 2 +-
 meta/recipes-devtools/rust/cargo_1.70.0.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
index 878272721c..3d73a370ec 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -14,7 +14,7 @@ FILES:${PN}-dev += "${rustlibdir}/*.rlib ${rustlibdir}/*.rmeta"
 FILES:${PN}-dbg += "${rustlibdir}/.debug"
 
 RUSTLIB = "-L ${STAGING_DIR_HOST}${rustlibdir}"
-RUST_DEBUG_REMAP = "--remap-path-prefix=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
+RUST_DEBUG_REMAP = "--remap-path-prefix=${WORKDIR}=${TARGET_DBGSRC_DIR}"
 RUSTFLAGS += "${RUSTLIB} ${RUST_DEBUG_REMAP}"
 RUSTLIB_DEP ?= "libstd-rs"
 RUST_PANIC_STRATEGY ?= "unwind"
diff --git a/meta/recipes-devtools/rust/cargo_1.70.0.bb b/meta/recipes-devtools/rust/cargo_1.70.0.bb
index a5c1064106..50b7e7c7b4 100644
--- a/meta/recipes-devtools/rust/cargo_1.70.0.bb
+++ b/meta/recipes-devtools/rust/cargo_1.70.0.bb
@@ -19,7 +19,7 @@ CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
 
 inherit cargo pkgconfig
 
-DEBUG_PREFIX_MAP += "-fdebug-prefix-map=${RUSTSRC}/vendor=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
+DEBUG_PREFIX_MAP += "-fdebug-prefix-map=${RUSTSRC}/vendor=${TARGET_DBGSRC_DIR}"
 
 do_cargo_setup_snapshot () {
 	${WORKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
-- 
2.42.1



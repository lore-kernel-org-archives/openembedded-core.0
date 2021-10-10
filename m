Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77AD2C433EF
	for <webhook@archiver.kernel.org>; Sun, 10 Oct 2021 19:10:19 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.2154.1633893018857629032
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 12:10:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ou6SgH2e;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id m22so48712955wrb.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 12:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VYrgVpMLsog18vaE3Hv7ZQV9uB/jLamvxEN+k7bHPYM=;
        b=Ou6SgH2ejgLSVO2abq0A9Nk88jC08ukhZVhpDa/b86wp4IbBzK+Cpey0HjFioZ0NC+
         Hy4mIE7FNAgW/yZf1dAfMqPIc8ykuG2PTl+vqCJ8N5r2eL4tDoJIq4Bmh8WpnaOpWsgb
         cqy9QssWJaeCCD2gq21+ldYOKu99DpMoOaTOuYykVZc387dlSs1+e0zf9yTjNZyV6oY0
         G0zk5tnflsEZFxZxQ9fzLCezgX3S45JkS03mGruCUM6ADBpo79Hap3rqpZHMZQAK/t6O
         zUPwIKS7AXc2UUTGoSDceDfW3l6am7C0XCoH6hynNk3mnjb++as7tvR0HxBhjLxGKQlP
         sN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VYrgVpMLsog18vaE3Hv7ZQV9uB/jLamvxEN+k7bHPYM=;
        b=XF2yysMYAkGQ9vcOnE+bSHbsCMAtmlMFEGO9QlIdrCooB6eiXH1p63SHVVjD8bIOTk
         lYIzoD2XIhM9Lnp03rPlWrQdsTU19Ug4omDacX8S/CEwsl3w04AsmJajyiGANIggdLgj
         ymhc7kS+lU1h7kPjO/1jHcxuQ19J78VXDx+gqZ6soVm1NfmrgUW2XzlvabpY2UcolEzm
         8VbdAqOFsRIq1Hqgngvdbw1aBEzuoOkE+HykKr5jurw0gdiVplkdF8uGERJgs+ed89Bz
         KrvWOx5q2EkrWolzGTAMgCuapECZpDDafbMZxF4IiTRZwU7obBshDKrxNeC5BIjHxJnJ
         jZcQ==
X-Gm-Message-State: AOAM5302+XnUTuSFp7bdwT62pl+Acw0ZK4cc5RjaewZVwlSwBcARLJwQ
	RrY4c9tQ26qbJkbWuv5qjFUlR2KKirE=
X-Google-Smtp-Source: 
 ABdhPJylhAoJNBR7uLOoB9gkeXHY5QQ8ARB3+YlSuftZmQ/L+IDJxJum5QpqxClDP2W5tq55w+4RIA==
X-Received: by 2002:adf:906a:: with SMTP id
 h97mr19382792wrh.220.1633893017536;
        Sun, 10 Oct 2021 12:10:17 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id z6sm7962025wmp.1.2021.10.10.12.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 12:10:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/13] rust/cargo: exclude UNINATIVE_LOADER from task
 signature
Date: Sun, 10 Oct 2021 21:10:05 +0200
Message-Id: <20211010191008.4122049-10-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211010191008.4122049-1-alex@linutronix.de>
References: <20211010191008.4122049-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Oct 2021 19:10:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156803

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/cargo/cargo.inc | 2 ++
 meta/recipes-devtools/rust/rust.inc   | 1 +
 2 files changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/cargo/cargo.inc b/meta/recipes-devtools/cargo/cargo.inc
index 71e1c64f72d..607c51fc3d1 100644
--- a/meta/recipes-devtools/cargo/cargo.inc
+++ b/meta/recipes-devtools/cargo/cargo.inc
@@ -29,6 +29,8 @@ do_cargo_setup_snapshot () {
 
 addtask cargo_setup_snapshot after do_unpack before do_configure
 do_cargo_setup_snapshot[dirs] += "${WORKDIR}/${CARGO_SNAPSHOT}"
+do_cargo_setup_snapshot[vardepsexclude] += "UNINATIVE_LOADER"
+
 
 do_compile:prepend () {
 	export RUSTC_BOOTSTRAP="1"
diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index dc92cf5fd00..1d6f99afad3 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -61,6 +61,7 @@ do_rust_setup_snapshot () {
 }
 addtask rust_setup_snapshot after do_unpack before do_configure
 do_rust_setup_snapshot[dirs] += "${WORKDIR}/rust-snapshot"
+do_rust_setup_snapshot[vardepsexclude] += "UNINATIVE_LOADER"
 
 python do_configure() {
     import json
-- 
2.20.1



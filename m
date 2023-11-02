Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9621DC4167D
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 19:03:10 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.41009.1698951788657086751
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 12:03:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U3XdF8K2;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5a9bf4fbd3fso982989a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 12:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698951788; x=1699556588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Jp3AHV03v6mN+kgc6B7d/AiQ/U6h7hf+UROIETCRoU=;
        b=U3XdF8K2ChvstxwVEuIs7ODuZJdyijNpot+CZjEEaK5HZ9EcrTFtU5oaGxQnIc72eb
         d+8Qd87iUU4DsxVt/ONe1yLM/vZYW7Jb4yhH3hIa+4lnuAgwugpmRjSUEHtvcYcef30k
         k3tf6pwk6GPHkUe6ar+HRzHvRgRS7vt+x/jpWopwMPPh3/MoUTa2y027/719/xJrib3Z
         oMNmJD709jlgbYlmI3k19Q9haV7cdONpAm8BpLFehvTjATHBFM57kzWXbYNwGj66kNLJ
         3g+G93Z8OW+kbcpGFaX8bL291HAgXJtl7iYBtz1gMVMv5mgOdJv7mWnvbZIbK2Dirho1
         QJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698951788; x=1699556588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Jp3AHV03v6mN+kgc6B7d/AiQ/U6h7hf+UROIETCRoU=;
        b=Fx3K7Ef4+uiC2h2ULgbZBR4sWMYIq3Blf62glhjxyNJxwv9998QbMqy7OxC8yxfu/1
         0HaXhvsZ/U4qT3G/iLU+AUYg8O76T3dtm2G5SfBazGKZUYU32kt2RkLmzKGxNHSh9PQI
         //JWOmQLq1Hts3+gT1kpntcZMiJTOdJoaA42oRd7KoeMPLOwuCrpv36OAGGHsnL/woSY
         oqc1ukbmg4xNHSHnRIS5d6xTXLeow+6d5q+Mk8YloDdhreLMt3/FHnU8JUQ3o2uESJKy
         iWab+C34muWOylaV5hjQ6PgaqAL1D/w0MIWzcXs3+ldEZq2balsbDPOqEvcODc7hhzef
         iAwQ==
X-Gm-Message-State: AOJu0YzM1/lY9pa5VHS3l6kssj/MbuaKMDLtpISDvs0l160XTWLrBQ3p
	/QJoKtBkZ20GMZX5mkHM/zOQKEOsJl+4SA==
X-Google-Smtp-Source: AGHT+IElYHbWeE8DsKlDisSuhkjJ6Fvho+NqiCWmC0bNVm+o0/Et8xIafdOSG355qU3QsPllQqkCuQ==
X-Received: by 2002:a05:6a20:da95:b0:17b:426f:829 with SMTP id iy21-20020a056a20da9500b0017b426f0829mr26787049pzb.37.1698951787562;
        Thu, 02 Nov 2023 12:03:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::46eb])
        by smtp.gmail.com with ESMTPSA id m5-20020a62f205000000b006c0678eab2csm100636pfh.90.2023.11.02.12.03.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 12:03:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] rust-cross-canadian: Add riscv64 to cross-canadian hosts
Date: Thu,  2 Nov 2023 12:02:56 -0700
Message-ID: <42c5e77d7bb58199c996c5107b77dedf705ab400.1698951553.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1698951553.git.raj.khem@gmail.com>
References: <cover.1698951553.git.raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 19:03:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190096

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index baa58e98385..7bfef6d1759 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -56,7 +56,7 @@ do_install () {
 
     RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
     RUST_HOST_TRIPLE=`echo ${RUST_HOST_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
-    SDKLOADER=${@bb.utils.contains('SDK_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}${@bb.utils.contains('SDK_ARCH', 'ppc64le', 'ld64.so.2', '', d)}
+    SDKLOADER=${@bb.utils.contains('SDK_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}${@bb.utils.contains('SDK_ARCH', 'ppc64le', 'ld64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'riscv64', 'ld-linux-riscv64-lp64d.so.1', '', d)}
 
     cat <<- EOF > "${RUST_ENV_SETUP_SH}"
 	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
-- 
2.42.0



Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC40C25B7C
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 11:56:32 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.12953.1715774189411192061
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 04:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LK0Kzf2N;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41fd5dc0508so45481865e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 04:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1715774188; x=1716378988; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tnmAwk7XJYGAxnULDlI8GRNxWjVL4w/Gx8ZfJETXzPc=;
        b=LK0Kzf2NYK51H3+xAwUOAqz34KR20jBGiUUF+XIYjaL/2Sne3vtvPflBcuRQJXI25C
         dkue3MVHvp8PI/1AzQbptRHxgcXPI5n+eWIC5mXW1KQ306PX3pjjZFVFJfew7PYwblGR
         8KlHVMnDYXWgAJenaerekor/8HyGEnWCvTZgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715774188; x=1716378988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tnmAwk7XJYGAxnULDlI8GRNxWjVL4w/Gx8ZfJETXzPc=;
        b=Bn2x05AyYPXXtgKa0zegf8hUaxKwbysYK+T0AAhE91EF+UmBGeIeq5QwVI36w97yrP
         3DA6M8W/pNi1J/LCnGHWYr2XuGSpUstt68Ykgk+fiix8cBmSq3g8edOo+XXDDkAYpve2
         Me4ZuiPhpLoxsGUkiCjShox162OA5ekDrpI9/GeKwN48PpzQ+j32afa1zLinXytCWY8R
         ZIlwZdMM8H/4ovS2S3i+aQ3fmDYGGtAlZUdnR7TsY5O/YpLOZYymT1gGpXiAh3/7BnCZ
         ByzIStw1N7tXLgckeNJMWeG87iiolOqsdB+PrQv4vcRZtuUc0gqvgro9Tu+StCGgb8A+
         R2ng==
X-Gm-Message-State: AOJu0YzFO5VH41lOvJpIAigiRXg/sGhylWuhaaXKg+eVFpsACNLr5p/+
	+XzDtz1gc2/pCp79Qkm0e/zgTPyLa+6x1pZnJL8tF1tObZVL1k4VeRIh1T7sM4tUHTO6rd6etsq
	1kUQ=
X-Google-Smtp-Source: AGHT+IEPJew76MIGgKcYemRbxqZYxjVgtPuxnqilI5j48TRUNhnTcZN+rAzfjuzZC8ZmSQNiRecbNg==
X-Received: by 2002:a05:600c:4703:b0:41b:85bf:f3a8 with SMTP id 5b1f17b1804b1-41fead65a26mr109555935e9.35.1715774187754;
        Wed, 15 May 2024 04:56:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:13b6:dedd:c8fc:b915])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce2449sm232555825e9.16.2024.05.15.04.56.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 04:56:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/10] systemd-conf: Convert to use a dedicated UNPACKDIR
Date: Wed, 15 May 2024 12:56:18 +0100
Message-Id: <20240515115620.420558-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240515115620.420558-1-richard.purdie@linuxfoundation.org>
References: <20240515115620.420558-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 11:56:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199283

Avoid:

WARNING: systemd-conf-1_1.0-r0 do_unpack: systemd-conf: the directory ${WORKDIR}/${BP}
(tmp/work/genericarm64-poky-linux/systemd-conf/1.0/systemd-conf-1.0) pointed to by
the S variable doesn't exist - please set S within the recipe to point to where the
source has been unpacked to

by using a dedicated unpack directory for sources.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/systemd/systemd-conf_1.0.bb | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-conf_1.0.bb b/meta/recipes-core/systemd/systemd-conf_1.0.bb
index 752ad7c2b7e..b8bea0c25be 100644
--- a/meta/recipes-core/systemd/systemd-conf_1.0.bb
+++ b/meta/recipes-core/systemd/systemd-conf_1.0.bb
@@ -21,19 +21,22 @@ SRC_URI = "\
     file://wired.network \
 "
 
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
 do_install() {
-	install -D -m0644 ${UNPACKDIR}/journald.conf ${D}${systemd_unitdir}/journald.conf.d/00-${PN}.conf
-	install -D -m0644 ${UNPACKDIR}/logind.conf ${D}${systemd_unitdir}/logind.conf.d/00-${PN}.conf
-	install -D -m0644 ${UNPACKDIR}/system.conf ${D}${systemd_unitdir}/system.conf.d/00-${PN}.conf
+	install -D -m0644 ${S}/journald.conf ${D}${systemd_unitdir}/journald.conf.d/00-${PN}.conf
+	install -D -m0644 ${S}/logind.conf ${D}${systemd_unitdir}/logind.conf.d/00-${PN}.conf
+	install -D -m0644 ${S}/system.conf ${D}${systemd_unitdir}/system.conf.d/00-${PN}.conf
 
         if ${@bb.utils.contains('PACKAGECONFIG', 'dhcp-ethernet', 'true', 'false', d)}; then
-		install -D -m0644 ${UNPACKDIR}/wired.network ${D}${systemd_unitdir}/network/80-wired.network
+		install -D -m0644 ${S}/wired.network ${D}${systemd_unitdir}/network/80-wired.network
         fi
 }
 
 # Based on change from YP bug 8141, OE commit 5196d7bacaef1076c361adaa2867be31759c1b52
 do_install:append:qemuall() {
-	install -D -m0644 ${UNPACKDIR}/system.conf-qemuall ${D}${systemd_unitdir}/system.conf.d/01-${PN}.conf
+	install -D -m0644 ${S}/system.conf-qemuall ${D}${systemd_unitdir}/system.conf.d/01-${PN}.conf
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.40.1



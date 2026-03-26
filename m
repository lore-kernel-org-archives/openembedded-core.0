Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A4F10A88C4
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:16:54 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50856.1774538207910246829
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:16:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=klihyheH;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2c107ef474fso1045133eec.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 08:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774538207; x=1775143007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g06zo/wm2munqQjcTubU1EsJTtfM8mkREiF22fZkyLc=;
        b=klihyheHJkLiIa/3imISZP9kdhF7tSPt9MsvyiRWlrjvdqOyqaXMtMVBuTcf0OIe5o
         GU7PY++uejYQ35t/PW2hxUN/6sXqxLGAtpnXYccY+wWYebVjFuxxJw+ZoBD7j+2OmS/9
         dAHuhFlpemd3EWyKvNYRSDVMjen4R7enhWeQwIgloWbn0Lh0uNeo3iCfsfHLT77Ry7R4
         0pnTj9XkZRtdbpP/TQUI2K426SlmcZWbSI+sK705A5JXwWOkQcBzK3XfAm9E5pL1G/+U
         iii541LdxHqn80fwb3OEdwqCX+z5bJiN3qIHMHM7fTDfjRejdoGyMra8p4E100tRCrJL
         8YdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774538207; x=1775143007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g06zo/wm2munqQjcTubU1EsJTtfM8mkREiF22fZkyLc=;
        b=Z8dsD9DBp+x8NLh4iijE/w+7nIIe+CspugsBs5ZCjnxVzNefsKzDBgyA1JfeYXKhBN
         y4oWZmL502wxmoV2fixFslWvvEe+DYbgU55iAC3g9q7ZhQ7MhsYgW0tHWg5GRiRkfkhh
         mBQb0FUo/Ksy6lR2i+fZXhOOi5Phv1zHIGwGfW4ubkuE+KzZhIoXiUzMmuDqckf7tdL1
         kKqIVuiF4hgZEZwR4In9amgyGjRZZFgqCcGlIUu/4wGje3zmbpdsMpEGUdSjsPRF7Cc3
         eHE2JjH+Fbn7vAQ4wQMJ1uLSKUMrxs7Iq9c7J+dh0jCl9HvXwCmEsY42+l+odXUty/zp
         qlXQ==
X-Gm-Message-State: AOJu0YyzN6ntsw1LAUJhyyDUi0ECHJM2fymlbaMjHPPqHVW/TNs4We+S
	w7KqzTkp4VbHMUx5h4PRniLPxVrULCT/Ag5tGDMV6j8lGmGM4uzCKj3kP4fpZyb1shY=
X-Gm-Gg: ATEYQzwCAMQxDlvbb/6rABItQhD1mQDj2CtwgrcQCvcKVqjV+Ir/1VZHPNuiVu6lXR3
	eNNiJ+WKVapmhxg9pe/LEO+YWPWxNia/F2ja1lphL6IJqmSrr4Q9KD5vXrvZXjY54r1H3o+nNrK
	h0KXIAW4Y4R4GxZwwrgmjLejQydEuY1EOO8E0G3IX55ID/FDJhXrRn92mrGztKWKQxTZYs2+PbG
	hDnZZSnXj8OdmZbJT9y+LqZJx2T9zQgLKS9aEPddTowcb7gxUkqQatFENSD3fEYtio3ijUt55jJ
	kEh+MTEsfr4tAExJ/p3FmQL905UtNJOxWP9BFZHMqso+l9bw7IHiiRLEeCstsozEySCYcCl5NSA
	XdeGeFZ7zfeWolK1z08nTpbMj8Pq1S55uxqg99Pi3ISniXU4qwzJc8EfieHkTI8lXN0mTaWq5zP
	ToB68CzuEwmQ6iAjsFJHROz9+USaHzPc+I3wQPlURSFhNRCgZWdR4Xoa4XxfE2lHlxjdoK+hxgR
	W6c5xj7Q40lkZvhgfJ5tNS38kZoHx3/Gmo39gw5YcUubwM2f1dXJTuPXn/P
X-Received: by 2002:a05:7301:ea7:b0:2be:a2d8:e9e3 with SMTP id 5a478bee46e88-2c15d468539mr4597184eec.29.1774538206952;
        Thu, 26 Mar 2026 08:16:46 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ed9fac4sm2544221eec.17.2026.03.26.08.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:16:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 2/7] clang: Do not package clang-offload-packager
Date: Thu, 26 Mar 2026 08:16:36 -0700
Message-ID: <20260326151641.3974221-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326151641.3974221-1-khem.raj@oss.qualcomm.com>
References: <20260326151641.3974221-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 15:16:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234021

From: Khem Raj <raj.khem@gmail.com>

It has been renamed to llvm-offload-binary and is built
as part of llvm package, in OE we build llvm via its own
recipe and its packaging uses greedy enough regexp to package
it already

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index e10c327a2a..662cda1b2e 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -150,7 +150,6 @@ FILES:${PN}-tools = "${bindir}/analyze-build \
   ${bindir}/clang-move \
   ${bindir}/clang-nvlink-wrapper \
   ${bindir}/clang-offload-bundler \
-  ${bindir}/clang-offload-packager \
   ${bindir}/clang-pseudo* \
   ${bindir}/clang-query \
   ${bindir}/clang-refactor \
@@ -229,7 +228,7 @@ clang_sysroot_preprocess() {
 	install -d ${SYSROOT_DESTDIR}${bindir}/

 	# clang and clang-tools
-	binaries="diagtool clang-${MAJOR_VER} clang-format clang-offload-packager
+	binaries="diagtool clang-${MAJOR_VER} clang-format
 	          clang-offload-bundler clang-scan-deps clang-repl
 	          clang-refactor clang-check clang-extdef-mapping"



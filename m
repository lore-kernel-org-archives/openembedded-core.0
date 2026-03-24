Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6EF7F54AD6
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 23:08:45 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10698.1774393720351975604
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 16:08:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=c5lWuGnZ;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c0e3a2605fso1224289eec.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 16:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774393719; x=1774998519; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g06zo/wm2munqQjcTubU1EsJTtfM8mkREiF22fZkyLc=;
        b=c5lWuGnZHm0znJPv6Gr1+jxFd5YS5k4sfnCAU30IGpC9sJfOCaXVp+jqg62l14Qj1+
         1tmliDJFVbbEnKBnfzdgh7bwY2PwLpn8NooITPVG2KoWaEQM8GwyWyAFDYI/kZk5CBrT
         /qbYtUYK7K5LB61wlAJojHGCx3e3OjGsd+QSunIdbRG3SO9BZ0OKRhhE37zPEgVXVafb
         4GFJsizIqYSq1TL0Dds2fgOeBYzleLmHadv/TMrughjbCkczoDplZh6Vz1gkn74psxTc
         RwqxqiJt9uvJ9VkAV0GQSlTfv/T451+S+Th41u5GshL6ntBhwBl6EDOXlcdmNYnzHSci
         xdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774393719; x=1774998519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g06zo/wm2munqQjcTubU1EsJTtfM8mkREiF22fZkyLc=;
        b=O1rN87Z0HfNBi3/auPEyBWMhoZ0T+minx1Mb2xXDfFcw/db/eQHyD5EIPibq9kJIzN
         fQBn6AbIRuqUXCmkBA81rX4Bo+YkYaxnJP4nps7lJEksFi4FtuvKDrPBTGrN/enMPgwg
         1Gl8GwdDNBDJ6EJXaBJGWoH4S33MKFRLBz4eu+qAqeSdEdwSREVGTWgbrwisd2I2CFfA
         DG0g54QEi1JE1sP0mKvCPAlDtezzuPac31i/yWrTxQPOqWr8+Al7jQp3f1A5z7pVJ/Vt
         PTxwWJjIsQhW/9LwNVYojN0i8fo/T39u7jDldl+pHuVIxfMyq5MexUf0462hKdNYok3O
         /uCQ==
X-Gm-Message-State: AOJu0Yz8Kssn1RsB0MzhRpQWE+fbRBxxg9ExqXdcMOEJdiUxt53i5o08
	m3+jYQ/++4AuaKvz3eg3H+7GSRMacc7kDWhkq8qURml+onQF4x4qV4xG6iTIA5qrM4k=
X-Gm-Gg: ATEYQzxVzJeKTyuKZ0gqMuKCBPGerl6p/xRYmb1+qAv2zNzm4EZnfCzTFuk9/JO16P3
	DGJ5KiJzF6JPd1eee6c1l0cW8zMM9YUapT32/8tKqBVQQ2zXw3Np4Sl6LKNv25onNAd18UAhPfM
	wVfIrzWE6nKOMliHHur4Jea0t6BH5BR1qUHSx2cTHCbzFH30IHJuMUwfbAwCgdvlhaH6hfK1phG
	kKz7JEeYYR5ddO0smdrozMR5MgTlX73v4BNguz3v2Kq+cj+RKvnvFgWOW59fQcAeI6UBHx7x8yL
	uEZCgrURi/432Vn1sLweOLH/8Xeh5mW4WlxhFu0WAKSHnVY0FCSt8z2KWcxJYPr2HB7us0mukyp
	JWS+jX0KZMu7jCO0usNlW8N6ua6e1WsgrbRXUcBtcqeygUsV5fUJZojJhx11TWbvuQj2lPOnQjH
	6DfkGlL0GZYB3Snua8jccKxmTNYXQnUvigv/YVB8Mpo/YM2iYp3yeW6twbqGk3OSayT6ubd86KP
	I73IBJLEyFmMUmPfZw1DIjwBef1LYaSRzsb/wDp9UOtSCca9UpWd6qb9/2+
X-Received: by 2002:a05:7301:5791:b0:2c0:dfb2:b50d with SMTP id 5a478bee46e88-2c15d47908cmr602207eec.25.1774393719439;
        Tue, 24 Mar 2026 16:08:39 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b17d1ddsm16235874eec.11.2026.03.24.16.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 16:08:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/5] clang: Do not package clang-offload-packager
Date: Tue, 24 Mar 2026 16:08:32 -0700
Message-ID: <20260324230835.2363568-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324230835.2363568-1-khem.raj@oss.qualcomm.com>
References: <20260324230835.2363568-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 23:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233830

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
 


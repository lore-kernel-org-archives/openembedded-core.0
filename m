Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F030AC7EE2D
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 17:24:03 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.39163.1683653040025173236
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 10:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=LvJvHoem;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-94ef0a8546fso1001247966b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 10:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683653038; x=1686245038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9oKjNA4Ro4g0+gkbvpLKkChBzWWTDHyn2K8lxThPZs=;
        b=LvJvHoemvqsdfWAxNwJmQII5T9SkDoRXGbHQgDZ8t6GBoNeYYsbsoAO40TMNr1qxs3
         le2QoHHAoRlsPjvtma9YkkqkX2cr7chYLy1PbAwkXDsfK0pQtcOS48UnIoG7q/LeJSs/
         Tw9i0Qjw1K8zoIjzAjfP0+rv9DgUNbVv04JaUH7f0Fgt5ADBm5orLcJHIjiMkQutj787
         2pY0/DTtSlJHmkp/HjslQCa3nxtBnBCtF9N+rbjva/job8imrOxaTxmUjgUWlWQejJor
         uh/0XE40WheYr3/ruZe/B2zLDN6vHOY/g45ccOzSna7Pm6LnATsDQ4VBS3GwUVzFQpOR
         E67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683653038; x=1686245038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9oKjNA4Ro4g0+gkbvpLKkChBzWWTDHyn2K8lxThPZs=;
        b=kZeyPSKovxO1ddCi3VPJSuRTyiL6xgzKHn1qwLJO83NIpQAPkmBbzraApS6mmpuHoW
         g+sP1LmeNK+nJuEuAi5kX2WMdaXC1TykRqZPTpxdeoOLN1fp6PbSgG2cTueP4GAIn2mk
         M/pl3oyiwtan7pP3bmHQ5hnu+AFu/hqa9FlsJ+2jtVVezQr/tUgmrQ7orqbFokjwTpFj
         bNtMPrnyxLfRMHxmdqzFLszDQObVChP72Xei28OltGsXKg9tjl46Y/n0UB1K+jYmwedc
         Ncy0iXT3Aens96id05Aj5HyZwNy9fb83Hk8W6ruySLwwd4F9QpT9HRIlF3xi++ZfZ1kA
         f4fA==
X-Gm-Message-State: AC+VfDwffbMRjJ/Fy/GpIDjz08sTAbObmAsMB1vKp6slvbN+kuilqzcQ
	VVjUKcazUchRiRmC9T0S8JBzk8O64Ns=
X-Google-Smtp-Source: ACHHUZ6646ra+027atSqm1PbFt+RavJYm/puRYH6zrw6lzehNbcahVtcBx/EpTt5Y2GIej0evAapug==
X-Received: by 2002:a17:907:d1e:b0:965:66dd:78f8 with SMTP id gn30-20020a1709070d1e00b0096566dd78f8mr14709349ejc.56.1683653038508;
        Tue, 09 May 2023 10:23:58 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id jz24-20020a17090775f800b0096347ef816dsm1578252ejc.64.2023.05.09.10.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 10:23:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/27] less: update 608 -> 633
Date: Tue,  9 May 2023 19:23:33 +0200
Message-Id: <20230509172344.1516743-16-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230509172344.1516743-1-alex@linutronix.de>
References: <20230509172344.1516743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 17:24:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181071

Drop backport.

License-update: copyright years.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../less/files/CVE-2022-46663.patch           | 28 -------------------
 .../less/{less_608.bb => less_633.bb}         |  8 ++----
 2 files changed, 3 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-extended/less/files/CVE-2022-46663.patch
 rename meta/recipes-extended/less/{less_608.bb => less_633.bb} (84%)

diff --git a/meta/recipes-extended/less/files/CVE-2022-46663.patch b/meta/recipes-extended/less/files/CVE-2022-46663.patch
deleted file mode 100644
index 20f9d89ed86..00000000000
--- a/meta/recipes-extended/less/files/CVE-2022-46663.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-CVE: CVE-2022-46663
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From a78e1351113cef564d790a730d657a321624d79c Mon Sep 17 00:00:00 2001
-From: Mark Nudelman <markn@greenwoodsoftware.com>
-Date: Fri, 7 Oct 2022 19:25:46 -0700
-Subject: [PATCH] End OSC8 hyperlink on invalid embedded escape sequence.
-
----
- line.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/line.c b/line.c
-index 236c49ae..cba7bdd1 100644
---- a/line.c
-+++ b/line.c
-@@ -633,8 +633,8 @@ ansi_step(pansi, ch)
- 		/* Hyperlink ends with \7 or ESC-backslash. */
- 		if (ch == '\7')
- 			return ANSI_END;
--		if (pansi->prev_esc && ch == '\\')
--			return ANSI_END;
-+		if (pansi->prev_esc)
-+            return (ch == '\\') ? ANSI_END : ANSI_ERR;
- 		pansi->prev_esc = (ch == ESC);
- 		return ANSI_MID;
- 	}
diff --git a/meta/recipes-extended/less/less_608.bb b/meta/recipes-extended/less/less_633.bb
similarity index 84%
rename from meta/recipes-extended/less/less_608.bb
rename to meta/recipes-extended/less/less_633.bb
index f907a8159cc..2defb5ccb7a 100644
--- a/meta/recipes-extended/less/less_608.bb
+++ b/meta/recipes-extended/less/less_633.bb
@@ -21,15 +21,13 @@ SECTION = "console/utils"
 
 LICENSE = "GPL-3.0-or-later | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
-                    file://LICENSE;md5=38fc26d78ca8d284a2a5a4bbc263d29b \
+                    file://LICENSE;md5=1b2446f5c8632bf63a97d7a49750e1c6 \
                     "
 DEPENDS = "ncurses"
 
-SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
-           file://CVE-2022-46663.patch \
-	  "
+SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "a69abe2e0a126777e021d3b73aa3222e1b261f10e64624d41ec079685a6ac209"
+SRC_URI[sha256sum] = "2f201d64b828b88af36dfe6cfdba3e0819ece2e446ebe6224813209aaefed04f"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.30.2



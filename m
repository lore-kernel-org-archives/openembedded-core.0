Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E1DC10DC1
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 10:18:07 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.91944.1701080283361148485
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 02:18:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H81U7t74;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-54b18dbf148so2446590a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 02:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701080282; x=1701685082; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wy1nrkaDFKWgTAi3/37lmNjaN0oAMdUN1H+X/tCpjww=;
        b=H81U7t74QPfGwM5QZCf3nOiYaj07mc+fH8GKOZqER7m9PkVDxcf4coxYqWX4V5gCgr
         Rm+YPFh/bfbbwbtSrAeH8zX2dEao6ESigGuVPxoKfYnxWxjpjfgB07TorXnarZC5S85z
         8YPwNiaEW5PzDldSwNVs46rLog5HI7M443h0oQYoXLzWZ7Of+aLJAQeW1J+NViapuApE
         f23hgqUBzwkPY6Yrwz6R0xmd4W/cSFc1KucDWbXKfioEuGpWZBBRPnc9mHPlPWPiVJ7i
         n3Zz4FK/6+Tgkh3gWyMXXdeIuCaotrFMoPDsIqhzKpudWr+fgPGvnKpne/gGn3nJXAvP
         GPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701080282; x=1701685082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wy1nrkaDFKWgTAi3/37lmNjaN0oAMdUN1H+X/tCpjww=;
        b=d6Wmtki1ylP/aQrNUY3J+eMP/ZZcmmIazuxncwimk73M4Z5KuzwBxJhsXIygBwPOZg
         wgE+BHak0XBzwi7ZSaKfvRayYfhrWerz90VgjRiX/eW+3dfdlR+xBqs/osKijeAt27ks
         BzDH3LExeaj4xYZxfxB9KbfAjJLDt7Nsmbi7/6xn4kgkk64md5HbDTH8476ZRSWVDBPw
         eoNRCczocXkM+dBThQFeG31EmTxJq2+c4ZWFycDXwZw79FLAGiQ8lrhX5gFdAQOdax+o
         wjMPyjfnQUbCMVaABCT2gEaAB0uea1HorUIgiV1L8iZf59Wn3VymQfCJS96cH2Wg4kOy
         6Apg==
X-Gm-Message-State: AOJu0YzzyDwOVL/dhngZz/9N5S0FFH3ULm7CE6g5Sx/4lS8PFuY/qpFR
	5T903KHoHvhtq/NeigcdyBIaLxQ11As=
X-Google-Smtp-Source: AGHT+IGgr8ScU9T9SgxR2cBeLnTfo7bLsz9hTJ59rEaeB/1QSRSPv4RfTaYoXyurteKqnkic/7Dpfg==
X-Received: by 2002:a17:907:c8f:b0:9c6:8190:359f with SMTP id gi15-20020a1709070c8f00b009c68190359fmr6643500ejc.33.1701080281670;
        Mon, 27 Nov 2023 02:18:01 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906585a00b00a0bf09c9483sm2757203ejs.35.2023.11.27.02.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:18:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/19] python3-pyproject-hooks: fix upstream version check
Date: Mon, 27 Nov 2023 11:17:36 +0100
Message-Id: <20231127101751.3187950-4-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127101751.3187950-1-alex@linutronix.de>
References: <20231127101751.3187950-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 10:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191271

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb b/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb
index c3f1fb75ed1..9d08e7acc41 100644
--- a/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb
@@ -22,3 +22,5 @@ RDEPENDS:${PN} += " \
 do_compile:class-native () {
     python_flit_core_do_manual_build
 }
+
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.39.2



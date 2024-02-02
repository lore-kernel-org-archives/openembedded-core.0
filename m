Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC16C48291
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 12:27:18 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.21450.1706876832792673988
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 04:27:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VTAVSPAp;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a36126ee41eso277782566b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 04:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706876831; x=1707481631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xkTHcgoZcCsoLCesaIw0w+wHrmz3dNnbWcusob0dOrw=;
        b=VTAVSPApF+omMGGAbwJIlSppeoPaaZSzFRllzcM2lE6JJR7g/FpG9wSJy7QierQqR2
         0vRgXfCUAAJgPqBMxsakhGM/Ztw62a3UDFsfsw6mrUhKMM+2Gz/p3Tx/8djjob6b4Tpl
         SChba7r2RgEdOlnyfwxHazV/vmNlZWqn1UxTWDc27O1jG/cu1f74ifsw+xTXynUfZQa3
         TW3uuqiQpAZbqjna7YGBpzPootAk5r/esK1730ufqVyIzLDGfFL+TnZI7a5TSidAQYTk
         hOkERXRNhYnxDioMoYsxqiopr/GFPd00lJXM07cNv//kBr8ezt+gThvqdxs+ShrDrcRw
         F5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706876831; x=1707481631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xkTHcgoZcCsoLCesaIw0w+wHrmz3dNnbWcusob0dOrw=;
        b=helPtUV925+a+kJshfv5JTiGlzhtMeAw8W38FkBqEXwCKOcl6eM+S3MG2G4LQ6GVCK
         JXOnvIzjihnGhg+9KP300bnC5zQF8e6o+d0ba7T/J6PUnG3B4FX0F8mucbV+fjomSMY4
         Weg+2u7GdSBa1V8jnUmX3Jq7Ai1VNMq6/Kuf5fiEa9jDmgztGe7QSr4MNYOBZeb/T1Uk
         MqzThL0Yj5kuYxrWpbI22Ge9WfRFiZn82GgkNALVYEJ495q5Mh/mNYx5oQXmQZMCJkfD
         gCUSl6plTalzpxlpOOP2FxKsDVVL6OhRmuB7wk5Cgyl1KjHUjiIBr62Unn6kuTbHUIan
         W91A==
X-Gm-Message-State: AOJu0YzOihf3CMHdsYlcrCv4Qh2pcNHvfCUXrRt/jA0No+iv1ih7lBpb
	IMIXlYmmwanKJltjvbgT3hFH0IA8W/+YUXFU5skKPLmJ5oQ/fQzk9z125XPJ
X-Google-Smtp-Source: AGHT+IHCKRCw03aEjIK5VFBf0urzPRr8l7vcBirnkbIxgEsa4folSkKbU9YPQiNhV/68MK8bXLJeNg==
X-Received: by 2002:a17:907:bb89:b0:a36:bc20:9a3e with SMTP id xo9-20020a170907bb8900b00a36bc209a3emr3586958ejc.57.1706876830862;
        Fri, 02 Feb 2024 04:27:10 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id sn24-20020a170906629800b00a36894739bbsm443895ejc.88.2024.02.02.04.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 04:27:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] rpm: depend on curl-native
Date: Fri,  2 Feb 2024 13:27:08 +0100
Message-Id: <20240202122708.2167891-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 12:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194791

rpm is searching for curl executable at do_configure time
and result is non-deterministic without this dependency:
https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240201-8dcic6ea/packages/diff-html/

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/rpm/rpm_4.19.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.19.1.bb b/meta/recipes-devtools/rpm/rpm_4.19.1.bb
index af11dec5ef3..f6d21cb6a4a 100644
--- a/meta/recipes-devtools/rpm/rpm_4.19.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.19.1.bb
@@ -48,7 +48,7 @@ SRCREV = "98b301ebb44fb5cabb56fc24bc3aaa437c47c038"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "lua libgcrypt file popt xz bzip2 elfutils python3 sqlite3 zstd"
+DEPENDS = "lua libgcrypt file popt xz bzip2 elfutils python3 sqlite3 zstd curl-native"
 DEPENDS:append:class-native = " file-replacement-native bzip2-replacement-native"
 
 EXTRA_OECMAKE:append:libc-musl = " -DENABLE_NLS=OFF -DENABLE_OPENMP=OFF"
-- 
2.39.2



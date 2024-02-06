Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 921F2C48286
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 09:14:04 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.17761.1707210834681320687
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 01:13:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QwU5N/O5;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-55a035669d5so7556004a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 01:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707210833; x=1707815633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAtfyH7WYSJFsq7ayVl0wx7lY2OmQX+GvDdrCwUtRsQ=;
        b=QwU5N/O5MP0EhfWQ5PK8EtRPbuHFTd7pIDjQ69ZiZhfV4x/4azPulaliM71xXEbVvc
         q8WJKtgitTkC5ZGu8uXMoQ78bxHoqfRkirvFo27ZHLSU7Qh3kTXcCap+1RJwIp11QY6u
         64F2wFyi5Yf+cWpxzb0GNeobBr5zZE5rxFrhKdXnMxJhuyQ5M86OAeUvK2vLR34dJTLZ
         5jHIP+JnnWnewZW6rdidGUTRchqnw2iGeqgvE4EY52sleWx69UgSy0JQql0Nxp1Jwolb
         I6PcYX7pbdIEXfYHu8pixQ1VXN8RL/qcXxWlqMykphKMKyr0ttExEL+v7UuAGQ4/vv2L
         8tng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707210833; x=1707815633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dAtfyH7WYSJFsq7ayVl0wx7lY2OmQX+GvDdrCwUtRsQ=;
        b=q3HwBj4Ruuyq474gxKtPP1cuq3iUjDGm8DNwV4Zj22E/wZsMY2ksvyEmtFh+xiiHkv
         AhSQ/ihSF/ddLKmZbxW/2YzRvsdosbG5hJ8KmNYuEd77rttiG1O8bp+203edmcuxKRcb
         7mSfiJVeR4KWNRvF7A9bNlSuylUHIZzluKedoaCC0cr+PVEvfD7Qw+u8QO/dJur58Lyk
         7lPh2vsWnQYn8vSJgukvCStHkCg/ULtktwIaNWl1LsUNbru0N7ditjLMxbd87i001Tnv
         1L4ARL8W15OcF/MrIfw2KaiBs5qOy0M1WDIQrGIEbEEdSmbshuKNLSyu4SPYafsywIbX
         V3Zw==
X-Gm-Message-State: AOJu0Yyu2snZYj0fkY6GaymQJqXy7PGqv8B4+jQUaBJCTuNNdRO6eqRR
	9LuEb/T0nAgxc8mrxRsvjjQV15d+ljMiG72AFlfK6u+PvVzS633wqDXG6Fw3
X-Google-Smtp-Source: AGHT+IEMLXC1Gv9dX4eLrFFx0iDLY9NVHIRYiVDxyTXprD110Q7cjULuu/903XF4ZI9yevNXv6+mvw==
X-Received: by 2002:a05:6402:b03:b0:55f:f7bb:4100 with SMTP id bm3-20020a0564020b0300b0055ff7bb4100mr1188918edb.8.1707210833107;
        Tue, 06 Feb 2024 01:13:53 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id n5-20020aa7c685000000b00560556fe9b7sm820662edq.78.2024.02.06.01.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 01:13:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 2/2] file: enable additional internal compressor support
Date: Tue,  6 Feb 2024 10:13:47 +0100
Message-Id: <20240206091347.1271851-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240206091347.1271851-1-alex@linutronix.de>
References: <20240206091347.1271851-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 09:14:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194976

This is an extension of
https://git.yoctoproject.org/poky/commit/meta/recipes-devtools/file?h=master&id=52a31bd5ba90713af82822047c3813afc31421f8
and the rationale is the same.

The issue was exposed by recent ptest support in xz, which packages .lz files
into the xz-ptest package which resulted in reproducibility fails:
http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240203-fdpg888c/packages/diff-html/

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/file/file_5.45.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/file/file_5.45.bb b/meta/recipes-devtools/file/file_5.45.bb
index 8477668658d..fa8dc576dcc 100644
--- a/meta/recipes-devtools/file/file_5.45.bb
+++ b/meta/recipes-devtools/file/file_5.45.bb
@@ -20,12 +20,12 @@ S = "${WORKDIR}/git"
 
 inherit autotools update-alternatives
 
-PACKAGECONFIG ??= "bz2 lzma zlib"
+PACKAGECONFIG ??= "bz2 lzma zlib zstdlib lzlib"
 PACKAGECONFIG[bz2] = "--enable-bzlib, --disable-bzlib, bzip2"
 PACKAGECONFIG[lzma] = "--enable-xzlib, --disable-xzlib, xz"
 PACKAGECONFIG[zlib] = "--enable-zlib, --disable-zlib, zlib"
 PACKAGECONFIG[zstdlib] = "--enable-zstdlib, --disable-zstdlib, zstd"
-PACKAGECONFIG[lzlib] = "--enable-lzlib, --disable-lzlib, lzip"
+PACKAGECONFIG[lzlib] = "--enable-lzlib, --disable-lzlib, lzlib"
 PACKAGECONFIG[seccomp] = "--enable-libseccomp, --disable-libseccomp, libseccomp"
 
 ALTERNATIVE:${PN} = "file"
-- 
2.39.2


